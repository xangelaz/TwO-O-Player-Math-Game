require './player'
require './question'

class Game
  attr_accessor :player1, :player2, :turn

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @turn = 1
  end

  def start_game

    # while both players have lives, do:
    while (@player1.lives > 0) && (@player2.lives > 0)
      # generate a new question each time.
      @question = Question.new
      # if the turn number is even, it's player 2's turn. 
      @current_player = (@turn % 2 == 0) ? @player2 : @player1
      @other_player = (@turn % 2 == 0) ? @player1 : @player2

      puts "#{@current_player.name}: #{@question.display_question}"

      def answer_response 
        answer = gets.chomp
        if @question.check_answer(answer) == false
          puts "#{@current_player.name}: Seriously? No!" 
          @other_player.lose_life
        else 
          puts "#{@current_player.name}: YES!. You are correct."
        end
      end

      answer_response
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      puts "----- NEW TURN -----"
        
      @turn = @turn + 1

    end

    announce_winner
    
  end
    private

    def announce_winner
      @winner = @player1.lives > 0 ? @player1 : @player2
      puts "#{@winner.name} is the winner with a score of #{@winner.lives}/3!"
      puts "----- GAME OVER -----"
    end

end
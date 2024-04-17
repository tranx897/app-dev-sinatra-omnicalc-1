require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @number = params['number'].to_f
  @squared = @number ** 2
  
  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @number = params['number'].to_f
  @square_root = Math.sqrt(@number)
  
  erb(:square_root_result)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params['user_min'].to_f
  @max = params['user_max'].to_f
  @rand_number = rand(@min..@max)
  
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @r = params['user_apr'].to_f / 100 / 12
  @periods = params['user_years'].to_i * 12
  @pv = params['user_pv'].to_f

  @numerator = @r * @pv
  @denominator = 1 - ((1 + @r) ** (-@periods))
  @payment = @numerator / @denominator
  
  erb(:payment_results)
end

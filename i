<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Permutation Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f0f8ff; /* Light blue background */
        }
        .container {
            max-width: 500px;
            margin: auto;
            text-align: center;
            border: 2px solid #ddd; /* Border around container */
            border-radius: 10px;
            padding: 20px;
            background-color: #ffffff; /* White background for container */
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            font-size: 18px;
            border: 1px solid #ccc; /* Border for input */
            border-radius: 5px; /* Rounded corners */
        }
        button {
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            border: 1px solid #ccc; /* Border for button */
            border-radius: 5px; /* Rounded corners */
            background-color: #4CAF50; /* Green background for button */
            color: white; /* White text color */
        }
        button:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        #resultBox {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #e0ffff; /* Light cyan background */
            text-align: left; /* Align text to left */
            word-wrap: break-word; /* Prevent text overflow */
        }
        #rulesBox {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #fff0f5; /* Light pink background */
            display: none; /* Hide by default */
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        td {
            padding: 2px 0; /* Reduced padding for closer alignment */
            vertical-align: top;
            text-align: left; /* Align all text to left */
        }
        .label-column {
            width: 150px; /* Adjust width to ensure alignment */
            font-weight: bold;
            text-align: left; /* Left align labels for better layout */
        }
        .value-column {
            text-align: left; /* Left align values to stay close to the equal sign */
        }
        .footer {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Permutation Calculator</h2>
        <input type="text" id="nameInput" placeholder="Enter a name" oninput="this.value = this.value.toUpperCase();">
        <button onclick="calculatePermutation()">Submit</button>
        
        <div id="resultBox"></div>

        <div id="rulesBox">
            <p>RR💎💗💓✨RR</p>
            <button onclick="window.open('https://wa.me/+8801405985541', '_blank')">Help</button>
        </div>

        <button onclick="toggleRules()">অংক করার নিয়ম</button>

        <div class="footer">💗Developer Mostafizur 💗</div>
    </div>

    <script>
        function factorial(n) {
            if (n === 0 || n === 1) {
                return 1;
            }
            return n * factorial(n - 1);
        }

        function calculatePermutation() {
            const name = document.getElementById('nameInput').value.replace(/\s+/g, ''); // Remove spaces
            const length = name.length;

            // Check if name is empty after removing spaces
            if (length === 0) {
                document.getElementById('resultBox').innerHTML = "<p style='color:red;'>অনুগ্রহ করে একটি বৈধ নাম প্রবেশ করুন।</p>";
                return;
            }

            // Count the frequency of each character
            const charCount = {};
            for (const char of name) {
                charCount[char] = (charCount[char] || 0) + 1;
            }

            // Calculate total permutations
            let denominator = 1;
            let denominatorString = '';
            let repetitions = [];
            for (const [char, count] of Object.entries(charCount)) {
                if (count > 1) {
                    denominator *= factorial(count);
                    denominatorString += `${count}!×`;
                    repetitions.push(`${char} = ${count} টি`);
                }
            }

            // Remove the trailing '×'
            if (denominatorString) {
                denominatorString = denominatorString.slice(0, -1);
            }

            const totalPermutations = factorial(length) / denominator;

            // Create the result output with question and answer
            let result = `
                <p>#${name} শব্দ টি কত উপায়ে সাজানো যায় ?</p>
                <p>সমাধান:</p>
                <table>
                    <tr>
                        <td class="label-column">মোট বর্ণ</td>
                        <td class="value-column">= ${length} টি</td>
                    </tr>
            `;

            // Add repetition information if there are any
            if (repetitions.length > 0) {
                repetitions.forEach(rep => {
                    result += `<tr><td class="label-column">${rep}</td></tr>`;
                });

                result += `
                    <tr>
                        <td class="label-column">মোট বিন্যাস</td>
                        <td class="value-column">= ${length}! / (${denominatorString})</td>
                    </tr>
                    <tr>
                        <td class="label-column"></td>
                        <td class="value-column">= ${totalPermutations}</td>
                    </tr>`;
            } else {
                result += `
                    <tr>
                        <td class="label-column">মোট বিন্যাস</td>
                        <td class="value-column">= ${length}!</td>
                    </tr>
                    <tr>
                        <td class="label-column"></td>
                        <td class="value-column">= ${totalPermutations}</td>
                    </tr>
                `;
            }

            result += `
                </table>
                <p>অতএব, "${name}" শব্দটি ${totalPermutations} উপায়ে সাজানো যায়।</p>
            `;

            document.getElementById('resultBox').innerHTML = result;
        }

        function toggleRules() {
            const rulesBox = document.getElementById('rulesBox');
            if (rulesBox.style.display === "none" || rulesBox.style.display === "") {
                rulesBox.style.display = "block"; // Show the rules
            } else {
                rulesBox.style.display = "none"; // Hide the rules
            }
        }
    </script>

</body>
</html>

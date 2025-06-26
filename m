Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FAEAEA18A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026586.1401764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo2j-0005Gd-NL; Thu, 26 Jun 2025 14:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026586.1401764; Thu, 26 Jun 2025 14:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo2j-0005EX-Kk; Thu, 26 Jun 2025 14:57:37 +0000
Received: by outflank-mailman (input) for mailman id 1026586;
 Thu, 26 Jun 2025 14:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUo2i-0005E8-4M
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:57:36 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4542726-529d-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:57:34 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1511406f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:57:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e2178csm7287971b3a.46.2025.06.26.07.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:57:33 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e4542726-529d-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750949854; x=1751554654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNq41wpOMxtjdVyPqHubusShV1czkm2z7ddoQnzqMZY=;
        b=P8b17cMJQpzMsYburb5VXKBQasd94Fn049xUylMHotzLPAha9+fU0aRwkEZHDJEwZg
         bgonNvJ3/KOcz3pE/dSgNUQYJ4L7ATnxRzxA4R4gooNwrKgPdeXNREACSxyf/OSK9PLA
         Ukgkux7xBu7J9jPqoRy2pkVJwxjE13vY99GZ8030Yaetg+eoaG20QgQRKeL+PN6jhm0w
         ILEclA0gDRiJoj/y+7e0/r3occfcnPjGcLgJPnjz3yprEIpBDcOOp4D4iBtbXEVM71uN
         QRdncxL5F4MZcAIetQcswZX4i6wE9P3hwmJKGI+GGwWi863qWyY4VYDC+ZuXcB08OGVd
         5ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949854; x=1751554654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNq41wpOMxtjdVyPqHubusShV1czkm2z7ddoQnzqMZY=;
        b=nEZ3BaWrLfvnUmvwzgOLhh1C7Ci83KoUCPwbmMc5ZHXhzd/UTKbWbDHfGVwP5tmBPs
         MaHldo0rvPGLemVQG3E/PSNLSmyjbFQQRsdI/8k+s5ys62/q7YlgrqgSSbuFnh7uXDSn
         CXPsx8gTNOGydnmbwbXa9IPjawbdy0B33xEh0iYub0DdSwlE06bA6Vsj2tUn2jk98MHS
         ltxgrzoIWSX2EA2xWvwAe27N51QsOOa1UyYM6VauSBQXIG939t8j1vS/W38zHdJ0CiTq
         KoOEwoeqLsg6BKwV0Bkr8lwKAv7md1WXFsm/2yFtmHPzRMJyjKY9XNzCgBbx71C8SZ1x
         2DWg==
X-Forwarded-Encrypted: i=1; AJvYcCV+mouvGX6FdcvbZ2xsLhNrmCg53ukQpATzYnT6Svt2VzWhd2C8y7214I+4wbRkInGFOQO2QBWsHrk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0C9tKKZSz8OIr3p521mKQ3kgRJnj6c7YZreikhhRJ4A8L8zE2
	E4redbcu03/1m3I8XIF3oXXExk1p4/qwr1A8LYBGEBCx54bg4H9e+1UGIzAg84qITA==
X-Gm-Gg: ASbGncvOY7PrGwcBZB0icTXWwidf0lT7dfubL/uTw41032FwyBb0EFwL9wYnw512PCj
	TbQNJavG5ga+B6LXc9SRauDNJ/PLb9O7zOMiaMCBl24DGbkxqLgKB+ig64YztupSxBWICPTzwmX
	HMIIbnUmCdX+tleMm2f5NkPNzgxA7reCE/k+kUqmqv+S7WC19QH7r8bAbO4i3FqlLyhZtdDx46d
	VI2tjN046quBn8RUqVAS0UfqeiTIvXl6Rgpn5LgNyNgmX6j3O0IftfDcojkX6yuicy4Rtanzw8B
	6FER2rl2MRNfgiGz2uFF4UXRyYG4szn5uy+J4xFPXJUNr8cTbjlj6sfXDHMbEr56GzAnpyCc5hC
	AtCfoMZXDecCelHhdEQfNbbD0oeG2fIfz0aSxyP3xt3fUxp0=
X-Google-Smtp-Source: AGHT+IG8cMZwSQd99ZfKY5gVcx2aIZbar4YAUryrpoVjT4fQpwaAUyeeEEqTRFS3FrY1JMQGvYknNw==
X-Received: by 2002:a05:6000:418a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a6f312df2bmr2362695f8f.14.1750949853778;
        Thu, 26 Jun 2025 07:57:33 -0700 (PDT)
Message-ID: <525d7483-a2b3-4d78-8eb6-2bade5bba21f@suse.com>
Date: Thu, 26 Jun 2025 16:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] xen/riscv: introduce pte_{set,get}_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <5e2f0cea49ac1e0669be15811b1426bf4b4d2fec.1749555949.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5e2f0cea49ac1e0669be15811b1426bf4b4d2fec.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
> of mfn.
> 
> Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
> PTE_PPN_MASK remains the same for all MMU modes except Sv32.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



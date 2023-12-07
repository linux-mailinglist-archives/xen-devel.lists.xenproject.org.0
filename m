Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C0808A93
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649933.1015087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFNT-00047C-2J; Thu, 07 Dec 2023 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649933.1015087; Thu, 07 Dec 2023 14:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFNS-00045U-Vs; Thu, 07 Dec 2023 14:29:22 +0000
Received: by outflank-mailman (input) for mailman id 649933;
 Thu, 07 Dec 2023 14:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFNR-00042r-Mt
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:29:21 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02979dad-950d-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:29:20 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so954179f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:29:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w8-20020adfcd08000000b003334675634bsm1579129wrm.29.2023.12.07.06.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:29:20 -0800 (PST)
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
X-Inumbo-ID: 02979dad-950d-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701959360; x=1702564160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBpXZYr1kUHQo3WjX6emLN/laWA7ag7rnEUjjfzXO1s=;
        b=Qjl6UPqm6EZEW/OxZSabeNs4v5uLEwEXyS8PpHl2mQq5R1kdhgX8px24pdejKK5lux
         of3WRn630hPrP+2t7uWEH7pq0+aq6Kw6azuqgwo3ZK5kkjen8AQnXUU7gTrYM6CPESZR
         xjH0S8piP7QKJS6xsE1Bc06aBk7tcxoEy51sFdxSm0hsNWrVVD59pi5m+MPtQDuMHObK
         wc6Qg7OljKvLMSApnWT+AVauuVwkvJBf9RKPU/NGyR5sNc7InZo2Iqw5VBELfzraE8pY
         lAQmIF/QrU628mBcdHXNWiY+CpRn63HKnlyW9784nYUfUZMIgWQLXZPXZJMqhZ+Vl78/
         yuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959360; x=1702564160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBpXZYr1kUHQo3WjX6emLN/laWA7ag7rnEUjjfzXO1s=;
        b=XKVdhDLf0HC4uN/c7mcz8FvkCUf7FCzjvROvLjyt1pWF82+Ms1Q9bmO3tfmHratCst
         GMJls3rWkhQyMW13aSaa4qrTCFg2vULOC2gMdl7oKubKb7ByzK0B6CBBXfbfmcBsCCea
         oW6+muMorBFnbonh/Hn3liMJACm1RHoargYMmQ1CTbAyVuQMiePE79nyq5288Z3uPiDu
         qXb5cmW2XHbRF/hHXl+kxjyYmLl4z3uEv9o3rEwY3zQmGKUAG3iCMXRpLf6FzqT8Zx8C
         HzpMLsB1z5bHMPu3TMHXFefOf5PFYksWYluEluD9D6iOXNlkUFXFCsEK3ShbAGwmyBaJ
         0FXw==
X-Gm-Message-State: AOJu0YyS4ugu1Pn6PvaMDQqAAWldJROBh9cwcxS/TSw1TpJnkp0AJ/J8
	1B1339ix0F4fn+hkByiYex+7
X-Google-Smtp-Source: AGHT+IF9O38/Qnz9T8QBcBxWUykofmTt7TaxqsHfVTRRDaYWokpxGdjC1GoUSsFCI139D0q89kvnWA==
X-Received: by 2002:a5d:538e:0:b0:333:49be:bf82 with SMTP id d14-20020a5d538e000000b0033349bebf82mr1455855wrv.77.1701959360200;
        Thu, 07 Dec 2023 06:29:20 -0800 (PST)
Message-ID: <e299d4ea-63f5-4d04-ab50-aeba773d2bb2@suse.com>
Date: Thu, 7 Dec 2023 15:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: introduce asm/setup.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <2dd966bbcaaf5a884c1a6a0a81dc29511e90f938.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2dd966bbcaaf5a884c1a6a0a81dc29511e90f938.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With at least SPDX header
Acked-by: Jan Beulich <jbeulich@suse.com>




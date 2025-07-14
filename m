Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE018B04235
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 16:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042922.1413002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKXQ-0005YY-Qx; Mon, 14 Jul 2025 14:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042922.1413002; Mon, 14 Jul 2025 14:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKXQ-0005W2-Ny; Mon, 14 Jul 2025 14:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1042922;
 Mon, 14 Jul 2025 14:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubKXP-0005Vw-Fi
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 14:52:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20bd2c9a-60c2-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 16:52:14 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45610582d07so11362135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 07:52:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de436839bsm93048095ad.253.2025.07.14.07.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 07:52:12 -0700 (PDT)
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
X-Inumbo-ID: 20bd2c9a-60c2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752504733; x=1753109533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/r6QWybOkFeJ9uG+Q7mchZXYJugfNiwUWZQvXO/TA4=;
        b=EeSLzN8w36CubmXv9R+CV6DCtUcby1B//cded0mxL7NVyf2KJf8MLJKUHuS1J0+Vl5
         Wm4vDV1hMhOJf7DuSMqsX5nDirchO8Q1fxg8tn4HXIkw8JGdt7FPGMJQRG7o000yg9Ax
         e5X2qx+1DpVXLt2AJNBYzvSltighhymuo8qA4qcUW1G4tP8V/nxk/se2PLQSAkLuN/NM
         TPrYTR2Hv4ROoimKWhZlDbCW0z1Jrc3wNz4fZhCvcnBoV4zQCYUkbMMeaX5gXLDhVY6B
         ndZpYXmgY1z0GDed6OmrsxWCAbS2qOEgXDIB96qHlpJO1cXIHMdUWfKw1hxnoppXW0dF
         hocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504733; x=1753109533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/r6QWybOkFeJ9uG+Q7mchZXYJugfNiwUWZQvXO/TA4=;
        b=sLHMQru1Sk+6Ea6LIG0tVo1hwt8UIN2QzCOQtf0iEsV4Zns5nf+E+gYfnZVlmRCS6Y
         9S3Ly5vIdw+7hFK1b/cCzeGXyZD1Ic7Wj11nQc92Xs1hc+XWPSsK89hk/D6OtetzZwnl
         9ylMXAWcytrUrq46OReTXDVuKLBxVOMArRqSK7LvOC8BjbAWmY4T+UmRCuYNMrS8wz3t
         2hmqpolhQ694FxGnRdWouatWOYIL3rQ4qy+bEuO3W3zm0l2YpJ4hBNJ6DT9iaFQYxNOt
         W5vww2lucwXsmiYz2d63MzNqvIR6PMNA1VqbhcD/4V0jo/YPqvTg8Dv1kPzUY5IejukC
         jUlA==
X-Forwarded-Encrypted: i=1; AJvYcCWiKKbjMTHlx98Yx4OAhRldI7AoalVzGNldAmqe72JA7EEofdbHItAXzAwNsCsoSBS1Pea7ZosqhVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI61X+9WHoVaJiD6mpRzkfEqYQLEzBbsJlZxwa7bBRwRcqAKf0
	ePsv59g6tJilyXkb0C3yED2TM8NhMWelcKQKQr8zpmFxScb2V2qW9JKtENzB2WUkLg==
X-Gm-Gg: ASbGncuUkJBU4tPg+R0YJmTgYKIOtmEKpkCOElNxhBCIvK9uFt8mmxHgU8hc1vak2N8
	tyhpj0pYet1Qz3PGFcq4IaJQsQflYS28YUktzqcgQvhEsgwgjHkKJ00GR4o/4MVnbv4fCSfdULs
	VO1pNoloW5mFYxsKUAFEmR476FyRAqkeyE0PLGy58OTGAAHTyQTqiaO6vI6w5SBgZMU99XR6IA9
	X87nGY59jl3Cdd+MdR+SeVnfF0qkBbihWe/BRcQ5wOuZv5cKjYqtL/jHiJ7aWm6rqcaW7IfwiPE
	+mG6V/6HQ1VoIp/Rkh/hhcM4WO02jvmATNlqy4DU5GQWW2u9PbOOzpSVBDKkeNkpzVqakZIoIr9
	11C70wdCAbqcHXOOMuAd4pOX90U0547tUY9LPcIKfqFMnGNW4zNku6ABCVx1DaVzYQfKGJ32cnM
	aJQh/UzytaSLTMqNp+eg==
X-Google-Smtp-Source: AGHT+IF5yFbhHsSkTpV+aQhW9E1JKpXJYTnZ3FRP2CuSObjZWmWNoxHx2DiuCuHXVIRewSIeABXGrg==
X-Received: by 2002:a05:6000:2d85:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3b5f187e845mr8246704f8f.14.1752504733196;
        Mon, 14 Jul 2025 07:52:13 -0700 (PDT)
Message-ID: <a5de640a-e03d-4ac2-8432-8f5f9b0a173c@suse.com>
Date: Mon, 14 Jul 2025 16:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
 <87ab0914-4a90-4dc2-ba33-188c7eb4cdca@suse.com>
 <33004fe59be3ddc9c0e1589ef1b60f21@bugseng.com>
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
In-Reply-To: <33004fe59be3ddc9c0e1589ef1b60f21@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 16:16, Nicola Vetrini wrote:
> On 2025-07-14 15:49, Jan Beulich wrote:
>> On 14.07.2025 15:26, Dmytro Prokopchuk1 wrote:
>>> Rule 10.1: Operands shall not be of an
>>> inappropriate essential type
>>>
>>> The following are non-compliant:
>>> - boolean used as a numeric value.
>>>
>>> The result of the '__isleap' macro is a boolean.
>>> Use a ternary operator to replace it with a numeric value.
>>>
>>> The result of 'NOW() > timeout' is a boolean,
>>> which is compared to a numeric value. Fix this.
>>> Regression was introdiced by commit:
>>> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen 
>>> functions.)
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> ---
>>> Changes since v2:
>>> - improve the wording
>>> Link to v2: 
>>> https://patchew.org/Xen/41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro._5Fprokopchuk1@epam.com/
>>> Link to the deviation of an unary minus: 
>>> https://patchew.org/Xen/7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro._5Fprokopchuk1@epam.com/
>>>
>>> Jan, regarding that:
>>> If an expression is needed here, I'd suggest to use !!, as we have in
>>> (luckily decreasing) number of places elsewhere. Personally I don't
>>> understand though why a boolean cannot be used as an array index.
>>>
>>> The '!!' isn't a solution here, we'll have other violation:
>>> `!' logical negation operator has essential type boolean and standard 
>>> type `int'
>>> (https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10674114852/PROJECT.ecd;/by_service/MC3A2.R10.1.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}})
>>
>> And that doesn't fall under any other of the deviations we already 
>> have?
>> __isleap() is used in another boolean context after all, and apparently
>> there's no issue there.
> 
> I double-checked: there is no specific deviation for using a boolean as 
> an array subscript.
> 
> This is the only problematic use of a macro that returns an essentially 
> boolean expr used as an operand to an operator that expects an integer, 
> which is the reason of the violation:
> xen/common/time.c:#define __isleap(year) \
> xen/common/time.c:    while ( days >= (rem = __isleap(y) ? 366 : 365) )
> xen/common/time.c:        days += __isleap(y) ? 366 : 365;
> xen/common/time.c:    ip = (const unsigned short int 
> *)__mon_lengths[__isleap(y)];

Oh, I see - the !! simply doesn't alter the situation.

Jan


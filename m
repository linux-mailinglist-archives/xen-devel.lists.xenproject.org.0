Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52DB21F72
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 09:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078315.1439299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljO0-0008V6-JW; Tue, 12 Aug 2025 07:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078315.1439299; Tue, 12 Aug 2025 07:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljO0-0008Si-G3; Tue, 12 Aug 2025 07:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1078315;
 Tue, 12 Aug 2025 07:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uljNz-0008SZ-69
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 07:25:31 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 854c9e25-774d-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 09:25:29 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so9567484a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 00:25:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af96bc4fb0dsm1576495766b.112.2025.08.12.00.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 00:25:27 -0700 (PDT)
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
X-Inumbo-ID: 854c9e25-774d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754983528; x=1755588328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qVtUBR5KpLqv7F9nuZEXabBZFdorfFJIFGMYWZs8i44=;
        b=XWDzA0SXkHE5gcY3PT303a1oDgKB1mPl0KvCCrM0FALRMZ6PCtleX6mDGutqz26+0g
         UZS0mf3FyZ1RmC/V0og3bdo9v2lxYLccq/iWFtHjDqhy6pY2FDQUX8boRNXX8jjuivdR
         V1UmoSwUe8M97psjFYOcDqg20j2fQEUFtninomXcYkf3Y7bblYoyS/IirPncyZvS1nAH
         Vu731ongwwKhAhJHRZeSPRsb1x0+5Hy0gtIlEjiWWYTp4IgaClnXOy2nnKfArZABJ+Me
         jonCCZEZXGFBOe5ByLs+HPAS0OXP1yPb9II5zqhgM9d7bup81R8F7PxwzKJfDIQaLOqP
         z0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754983528; x=1755588328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVtUBR5KpLqv7F9nuZEXabBZFdorfFJIFGMYWZs8i44=;
        b=HuOeBpo+3B83GrcYFHX76k4AciHk5w5ovPeCWsK1gCxEP1wwvAH3qzCU6Duxc+HyEn
         DhD95BhzrBlE/LIXtxPtmBDRCLEOY1F16aBT8VtzQ47ZdZ0okTaT6YBRpmufYc+df8Sp
         3ZS3FUUK2G8pR+t7Fdr5ir8zW5u5IfNVy3SkrG3UG/r7g/SwpO1ySNF9CBG1rNpmxoFX
         i9qoUgAwwxDVUic9p2BwyzQNQbXgD/oxAL6Hs2QTYYBi6D8F2s/idr4b5i81c/mLmBhf
         l5DQvUeD+JqtmQydu21jAdPICkt/qPCM3KRz66IbXWsudLNJnJvpHPVKO/lyeRwiYDzQ
         UPIQ==
X-Gm-Message-State: AOJu0YzJ697V/VAnPDCuwzuetAkwCwu9QOhsyYvnZ09RiWaeqQl1zVRP
	omfBgmrvxigUM0qvud78x6HegIwYAHyOnYiyn6FRLPYZEIA7tWNMeUo7RqGqjzuIJw==
X-Gm-Gg: ASbGnctryX8ehBOoPN37YlWSLJjwGGldnflCwbVIP43FaljqGWTtNCUq1EYfqQtA7B0
	HVlNMA5Yg14EyTEz0e6y8YPfD4083BDjtjPZZAgarOOYI0XRTqv6bhiVPHrkkmiphz6CzfwRfYB
	jCmxkUdQ8G/HXHB3desfJV1Bi+OqBukUjFLeQdrxa5iLQmO8oHLW3P0HNJDzO8B8IlhjbqvmvbB
	oBmCWYuonmb4gaFDrnQF01WiQ1HnWKDg1RcalJB+4MUesVeYU27umyZ9SEU4qNAEZN52DqQis4q
	s7Kb3EmKFWzIzjOZvgYUBAr2TurEShA2GIthYvq9EHmkesGCwkG4tIzCnMp3GcDy4wy9pM9/4vy
	SoSfrSKanD/1yXWlxNWURqYuZu7vMcmeHLa68z1b+r73EQFGDVc+eJMD6rPoHqwsLED+HuLXepw
	M9EkGi0RR7ppyTW3SyEQ==
X-Google-Smtp-Source: AGHT+IH6kFn6WihT4r/AJTKlKuYTTUOh9JW2HIBIpfeXiEQYkyS/SW404iEzn32AD/Xn+pwQPuvJ5A==
X-Received: by 2002:a17:907:6d1d:b0:af9:3589:68cb with SMTP id a640c23a62f3a-afa1e128f52mr224668766b.48.1754983527580;
        Tue, 12 Aug 2025 00:25:27 -0700 (PDT)
Message-ID: <c7f118a9-aea8-4f3a-8072-1bfa128d56b8@suse.com>
Date: Tue, 12 Aug 2025 09:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <a318ef2d5cad37d2fda0bb4a52c90964@bugseng.com>
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
In-Reply-To: <a318ef2d5cad37d2fda0bb4a52c90964@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 23:25, Nicola Vetrini wrote:
> On 2025-08-11 22:30, Dmytro Prokopchuk1 wrote:
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct 
>> hsr_dabt *dabt)
>>          case 3: /* Signed byte */
>>              update_dabt(dabt, reg, 0, true);
>>              break;
>> +        default:
>> +            ASSERT_UNREACHABLE();
>> +            break;
>>          }
>>
> 
> I think this is fine, and there should be no problems with the break 
> being unreachable in some configs due to the call property for 
> ASSERT_UNREACHABLE
> 
> -doc_begin="Calls to function `__builtin_unreachable()' in the expansion 
> of macro
> `ASSERT_UNREACHABLE()' are not considered to have the `noreturn' 
> property."
> -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))", 
> {"noreturn(false)"}}
> -doc_end

Did you also see Julien's reply? Imo, to address a complaint from one
rule, another rule is then being violated: The "default" label itself
is unreachable here.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D8A5611C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 07:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904574.1312427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRT8-00031Y-PD; Fri, 07 Mar 2025 06:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904574.1312427; Fri, 07 Mar 2025 06:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRT8-0002zx-MG; Fri, 07 Mar 2025 06:46:02 +0000
Received: by outflank-mailman (input) for mailman id 904574;
 Fri, 07 Mar 2025 06:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqRT6-0002zo-AZ
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 06:46:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d172665c-fb1f-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 07:45:55 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bccfa7b89so12249805e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 22:45:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4292b06sm71567795e9.14.2025.03.06.22.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 22:45:53 -0800 (PST)
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
X-Inumbo-ID: d172665c-fb1f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741329954; x=1741934754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=quyTqgKjxX51WvfCbFzKIoqY3JS/tsWKJIymCFM6deg=;
        b=bVy+AppBq/daJ9w1mG9bTtnixbtQFgk3xix+dmqw6oK0rhu9lgOFgT8mRfwv2hoA+p
         cX0fWjINuXqE/VV8C9qyXbuXd3yzAvdgnzAYvsTzfdn6WVRbKGxzABwfz8pvlC3f6ojA
         2BfHbSpUUJ1nmn/OfsmeUJBBWiqSm2HuvZnQbsm1PJ3sjkrQB9Mn80WGrG/rhAVXzYUF
         ZumqbSDBbRx9S/ZDiG8C7NfeoAQYkdCVBObSva+0soKrr1RpSg5p5nWNlmsHqvRgTxCj
         /UnVp6oogqJuXf1nIS7ZRTMB/CI5XoVLHYIwomjmXLU2udFgY8TqH79D2EZsee413VPw
         Sy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329954; x=1741934754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quyTqgKjxX51WvfCbFzKIoqY3JS/tsWKJIymCFM6deg=;
        b=hIR3GNcy/b8f1gpH1EUvZDxf6MAGkaeFnqEYXcJOBSJhaJK7Lq03NSiwrEsbWMXhkf
         fvdbB9/ihnXzAenDvjU+ajuwP8G2Tk7DIDWnoUPe0IGxOEJylOsXK43M3hnj/BqeqErP
         i1viE97LWoSk4DYnrXCOda5Mere+eFD9xCTXqFwSXZnmfQuvSXTTZpMzxnf+bl5FjW4D
         bEgEi4HE/FK7ue4LpTtsyQgDKNTv/IrHVrkG1C8JqomgbH+tqdpbjScA/PnAFFHxRhFe
         LML1CwRxCcC+12TGR9DT2T4LnG4oglj+D+9vMmGPwwUCokUXHyX5MLNZA1HSTkxtY8HX
         WLcg==
X-Forwarded-Encrypted: i=1; AJvYcCV+JFWbUPupAIRxnR8WgWNqxnAXMfnJvyETNop3CBhY6k/9aAz/Yv5OJ8ZQShjphQpUfs74oXpEIfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLVytAq0CBJ/JUgELReb3Dg5lS0MV+hef/XQy8yAhmX8Bh4ESS
	nXB9xaEVUcB7Wpymkg23HG3foEbYVIKyVdt0pmC2mAuyRBbatMelltwpwuR4kQ==
X-Gm-Gg: ASbGncsNHYz9iKqYy2O/zPht90keD6yX6k+v+KwE1uT2T0AWKgyvPbKrMNAeYQXs0yY
	rY8mrzjmPPz0TH6hbiZEtd5TfMTWp/t+BHijA5kuFqQyWsPx9GBv6mHxVfbsyCu6A02qSzmsycT
	MG2w/E6IBk8/IpWuPFQROdaXxXC0GAA/DByze/o2Ugrj50yvg0ujseUqT0jSVkcT35zHW0Q9g8i
	lQSvtve4KbADpoS9NwdW3MrF5Jir0rRpGS7DK7EojJdTQlY7+1GihufbTryYYLdowfDpXLfJSL+
	eFFOdhjHQcN7uPD8z6KaYLQNMPhEhntOZWZznPAEQ9LuY+0ksKHGHjPDpI9zyiVmJbZfES1osSl
	/8qZ9AxHvW80DglscS/Py4Ay1yBkMOg==
X-Google-Smtp-Source: AGHT+IFEessieloPhN4O7ic7amXUZp/f1NlL+crEiN2vFkJ5MqvPxZw2xIxvKloWRIHm64OtslgBdg==
X-Received: by 2002:a05:600c:3590:b0:439:5a37:815c with SMTP id 5b1f17b1804b1-43c6020845bmr12056485e9.20.1741329954249;
        Thu, 06 Mar 2025 22:45:54 -0800 (PST)
Message-ID: <fb3ccb67-9699-4a68-84ea-236fe33335bc@suse.com>
Date: Fri, 7 Mar 2025 07:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
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
In-Reply-To: <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 21:19, Andrew Cooper wrote:
> On 05/03/2025 7:34 am, Jan Beulich wrote:
>> On 28.02.2025 17:24, Andrew Cooper wrote:
>>> On 27/02/2025 8:11 am, Jan Beulich wrote:
>>>> On 26.02.2025 18:20, Andrew Cooper wrote:
>>>>> --- a/xen/arch/riscv/include/asm/bitops.h
>>>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>>>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>>>>  #undef NOT
>>>>>  #undef __AMO
>>>>>  
>>>>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>>>>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>>>>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
>>>> I fear you won't like me to say this, but can't we avoid baking in yet
>>>> another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
>>>> here (yet better might be sizeof(int) * BITS_PER_BYTE)?
>>> Yes and no.
>>>
>>> No, because 32 here is consistent with ARM and PPC when it comes to
>>> arch_fls().  Given the effort it took to get these consistent, I'm not
>>> interested in letting them diverge.
>>>
>>> But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
>>> and use it consistently, then that would be ok too.
> 
> Oleksii: I see your patch is committed, but when I said "use it
> consistently", I meant "patch ARM and PPC too".
>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>> retain a shorthand of that name, if so desired, but I see no reason why
>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
> 
> The concern is legibility and clarity.
> 
> This:
> 
>     ((x) ? 32 - __builtin_clz(x) : 0)
> 
> is a clear expression in a way that this:
> 
>     ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
> 
> is not.  The problem is the extra binary expression, and this:
> 
>     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
> 
> is still clear, because the reader doesn't have to perform a multiply to
> just to figure out what's going on.
> 
> 
> It is definitely stupid to have each architecture provide their own
> BITS_PER_*.  The compiler is in a superior position to provide those
> details, and it should be in a common location.
> 
> I don't particularly mind how those constants are derived, but one key
> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.

This is a fair point indeed.

Jan


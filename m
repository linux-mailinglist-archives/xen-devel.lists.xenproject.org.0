Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9EA7148E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927498.1330238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNnN-000220-W2; Wed, 26 Mar 2025 10:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927498.1330238; Wed, 26 Mar 2025 10:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNnN-0001z6-TK; Wed, 26 Mar 2025 10:15:37 +0000
Received: by outflank-mailman (input) for mailman id 927498;
 Wed, 26 Mar 2025 10:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNnM-0001z0-JV
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:15:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41efcd61-0a2b-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 11:15:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso68790985e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:15:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995789sm16578049f8f.17.2025.03.26.03.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:15:34 -0700 (PDT)
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
X-Inumbo-ID: 41efcd61-0a2b-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742984135; x=1743588935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLGvwRuPzyHXP8A5lFnMpjukB2zMpyYrEK7RawneQPQ=;
        b=IRvmFvO3CjxKB4dQF4ot9NHyzwMwqB+dxeJqQURAdb4EdIM13EaVIMwbkJBRlTW499
         Zuh4qwzXsbFAYLWOR9GBg7MktVqppV2KyYnZlZ48LxU593kAbcavIQ9lBxBjSQZF8Kgx
         gxWw0Zodfz7sDL8WKSSO/umufecqyacXok6jdnsu8cFylsJBCKcxt/bX4vJf9gC4jFeW
         B9LJ23XsV5C8JN5W0Ou1VQkOuNQpPnn1ZH3weaVYj1zpKvSBOsehniJ+ElVHuRQ4xbTn
         hOvF4Vz2PzkmPIHvQv3q3NwiByBUEJ8BDYodLqkqE+Fa9J8BIhQoOYfCnTeIB8hOaQpV
         9efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984135; x=1743588935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLGvwRuPzyHXP8A5lFnMpjukB2zMpyYrEK7RawneQPQ=;
        b=wULA7lWUGm5Ee1SXdF5iNEKfGxRImPhB9HpEMYpgCUX1z2Pzx/MRTlJAK6PqkN1J0W
         7ILSFeSEv/w72RQj3cr2Z+qRW+KH1Gfdo27c6ikVCJMxAdBIY/xxynbvW7gZNq+Ra82e
         HfJqQd2P1OelLvPPEiYoaqCqqV/1ziJ5B5cLKkYGHzCT064ZllHg1oT9TYk8kzQazsLv
         dQ9MelF1K1HmdbbYDx7gScyC4WncY5H3EJanEhJy9Nl2tAze6+MaG1HhA7EqhAGtxxT5
         Ra/BzWZIYUpfJ9phFdeGz0bksQi1bo6WPocRQXnUmUTAcVgZHl4lfBfOAqHKLZtUpgl2
         XjwA==
X-Gm-Message-State: AOJu0YyLd9pGbup9mFmWmoa5G/K9CTbgnSJDwb5L2wsM/GYZxUH86crb
	fMoUo5HmD6xC7k55OS36kheD2p7XPweRtEdFTP7ISmZ0R8i95cDMkC5e9yc3rg==
X-Gm-Gg: ASbGnctnVMPiEPmFZXTrUNe/tlXH9XV2+isPROVEn1gOxUtO4AIDpduRax1MyIdcxES
	QSpLFfrr/77x+/i1TedcRiHRTWmULuYIXp1KuiPjdUuHFSXQgjuj4lpJbeiXf5GXlvP0+39pFl6
	2UmZzDA/yJskgzI/hb8627imkLPCeVwbNSdkAA1RQGiL1Rdb6gYIn+vxhaIde4TXdJw0czBeq5H
	AVpnxDZBsOIWiVKkpRGHdbTMeZAMlW5g8JJBKizaXNqYqiso//JuzcrPrjvssqHofs2aiW6wuli
	LzwTRVZ811J0TpsKQrm8yw/k76e2SV0vsAmmGC55OYr8LOdY408yPUCOiBayut3YzkljX0XfF4T
	2VexJGE4yygIvA+FdajdhAdq3lhTRHw==
X-Google-Smtp-Source: AGHT+IFDn9Sy97Xl+fpcciX/1eAPzmHc4KGnt9AKRixpAbdtdHWK7GS53XpXCyB0KQFlizS0GkGMHg==
X-Received: by 2002:a05:600c:5021:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43d509f573cmr206954865e9.16.1742984134884;
        Wed, 26 Mar 2025 03:15:34 -0700 (PDT)
Message-ID: <3014e6b4-0732-4d80-82e5-44dcd517f2b5@suse.com>
Date: Wed, 26 Mar 2025 11:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
 <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
 <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
 <52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com>
 <a852cb38-79fc-4b9d-b0a0-b69e277c2b82@gmail.com>
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
In-Reply-To: <a852cb38-79fc-4b9d-b0a0-b69e277c2b82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 18:04, Oleksii Kurochko wrote:
> 
> On 3/25/25 5:46 PM, Jan Beulich wrote:
>> On 25.03.2025 17:35, Oleksii Kurochko wrote:
>>> On 3/7/25 1:12 PM, Andrew Cooper wrote:
>>>> On 07/03/2025 12:01 pm, Jan Beulich wrote:
>>>>> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>>>>>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>>>>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>>>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>>>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>>>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>>>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>>>>>> The concern is legibility and clarity.
>>>>>>>
>>>>>>> This:
>>>>>>>
>>>>>>>        ((x) ? 32 - __builtin_clz(x) : 0)
>>>>>>>
>>>>>>> is a clear expression in a way that this:
>>>>>>>
>>>>>>>        ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>>>>>
>>>>>>> is not.  The problem is the extra binary expression, and this:
>>>>>>>
>>>>>>>        ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>>>>>
>>>>>>> is still clear, because the reader doesn't have to perform a multiply to
>>>>>>> just to figure out what's going on.
>>>>>>>
>>>>>>>
>>>>>>> It is definitely stupid to have each architecture provide their own
>>>>>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>>>>>> details, and it should be in a common location.
>>>>>>>
>>>>>>> I don't particularly mind how those constants are derived, but one key
>>>>>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>>>>>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>>>>>
>>>>>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>>>>>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>>>>>
>>>>>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>>>>>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>>>>>> #define BITS_PER_BYTE 8
>>>> The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
>>>> straight up, and this will simplify quite a lot of preprocessing.
>>> Could we really drop *_BYTEORDER?
>>>
>>> For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.
>> The can still #define BITS_PER_LONG to 32 or 64 respectively, can't they?
> 
> Yes, but then if we want to move it to xen/config.h then it will be needed to:
> in Arm's asm/config.h to have something like:
>    #ifdef CONFIG_ARM_32
>        #define BITS_PER_LONG 32
>    #endif
> 
> and then in xen/config.h
>    #ifndef BITS_PER_LONG
>        #define BITS_PER_LONG 64
>    #endif
> 
> But I wanted to not have #ifndef BITS_PER_LONG in xen/config.h. (or using CONFIG_ARM_32 in xen/config.h)

Whatever the fundamental definitions that can vary per arch - those should
imo live in asm/config.h. For the case here, if we deem *_BYTEORDER as
fundamental, they go there (and BITS_PER_* go into xen/config.h). If we deem
BITS_PER_* fundamental, they go into asm/config.h.

Stuff that we expect to remain uniform across ports (BITS_PER_BYTE, possibly
also BITS_PER_INT BITS_PER_LLONG) may also go into xen/config.h, as long as
we're okay with the possible future churn if a port appeared that has
different needs.

I agree that there better wouldn't be #ifndef for such in xen/config.h.

Jan


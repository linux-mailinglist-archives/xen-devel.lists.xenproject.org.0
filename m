Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A5838FD4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 14:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670465.1043253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGoR-0007BI-JG; Tue, 23 Jan 2024 13:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670465.1043253; Tue, 23 Jan 2024 13:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGoR-000783-Fs; Tue, 23 Jan 2024 13:27:35 +0000
Received: by outflank-mailman (input) for mailman id 670465;
 Tue, 23 Jan 2024 13:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSGoQ-00077x-NM
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 13:27:34 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 292f2f1d-b9f3-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 14:27:31 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ccec119587so55166511fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 05:27:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i25-20020a02c619000000b0046eae1a6315sm3266967jan.72.2024.01.23.05.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 05:27:30 -0800 (PST)
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
X-Inumbo-ID: 292f2f1d-b9f3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706016451; x=1706621251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9a3jHtmMOkulxjo3AkPWd9rRNL8eV9mCiBoXs6cGBdg=;
        b=C+6Q7Amm7qNZJbSz77tXIGmKEMMSAZiMuNRYQTmMuXy0RcX2fP6e9tFeGeD5VHE7sF
         DYyft+tYVze67RDRx6l+zwu4PP5mUFQIFGA7q+BacnCUsiPKMAaXS5Zu4tvMDIKDStWd
         RvIvH4a/KWg2YQcCQf4f9fpqnFYEN0pOyksDZh9LmqqkC7AnF8kadmpte+1sD4ETrUmw
         yoxa2FBdt8Ood+egR7z2PUzKWW6+9BdiM0gMFEMPUYlFTLVjfkH4chSbpY1dzixzr1rS
         RCpUzbWeiiXwrsvh906kKOTnJbXZXtGp6COnUSymLJ3kimScT0m1oS9v5+lxWyzrdbhO
         q+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016451; x=1706621251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9a3jHtmMOkulxjo3AkPWd9rRNL8eV9mCiBoXs6cGBdg=;
        b=hU0pf5Ow4Lh3Z1mJwODlTX2XQrsk+jkTkzgf5RD0mzVnyTUncoo4Z1OwGc3YQrmj4m
         AdugFcGRc0XYR6oy4SJHPn1QjiK+5roHueV9KZgCwP32RY2zzXYbV/8a2Njr8rvoNZ/W
         EPmXhivAZArYXfYFaGUmRCeLdkHDRqlWVv5oy4H+HvAQ/iGIl6BV6mvEqdqx8/piweWQ
         zqxijhaX8qpVErKjsQBLzo5CeTLKfpTppSvxWnmmdzrR/1g+1qPqei2Et+p++7UxkxRG
         Ej9qm0hMiZKlN2s9/aCCyojp8zT3cUCqH6s0iDLzwy0Qbp0dyM0pS4TPVGGgaxsaoL0x
         1dfg==
X-Gm-Message-State: AOJu0Ywu+23s0U3hg4UWmtrWw3hFT13qfhXiO4DNJEjoSoZVN5dOBETW
	Acc7wzbRmLtP5+hP3r5RNe3OVUWT7lKirY2yR6mX+QjsKNdwVmHiLTIYmIpseg==
X-Google-Smtp-Source: AGHT+IEjqa/Qv9HRlcdpQWbu3WdNTTHIyur0FqMt3TjO8NbgkZouFvKym5ujUi/xNywtGwgrOjha/A==
X-Received: by 2002:a05:651c:1511:b0:2cc:f5b6:91ed with SMTP id e17-20020a05651c151100b002ccf5b691edmr3818222ljf.23.1706016451000;
        Tue, 23 Jan 2024 05:27:31 -0800 (PST)
Message-ID: <c57e17ed-61db-4da2-975b-083bfabcbe47@suse.com>
Date: Tue, 23 Jan 2024 14:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
 <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
 <56c23efdd79c0b1393ceef1adfcb45f66d4d1cf6.camel@gmail.com>
 <c5872ae0-a26a-4f51-bad6-08fd0c37d488@suse.com>
 <835c58c1deb89db2fa500bd7cd767facd5b5fb78.camel@gmail.com>
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
In-Reply-To: <835c58c1deb89db2fa500bd7cd767facd5b5fb78.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 13:18, Oleksii wrote:
> On Tue, 2024-01-23 at 11:28 +0100, Jan Beulich wrote:
>> On 23.01.2024 11:15, Oleksii wrote:
>>> On Mon, 2024-01-22 at 17:27 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>>>> +static inline unsigned long __xchg(volatile void *ptr,
>>>>> unsigned
>>>>> long x, int size)
>>>>> +{
>>>>> +    switch (size) {
>>>>> +    case 1:
>>>>> +        return __cmpxchg_case_1(ptr, (uint32_t)-1, x);
>>>>> +    case 2:
>>>>> +        return __cmpxchg_case_2(ptr, (uint32_t)-1, x);
>>>>
>>>> How are these going to work? You'll compare against ~0, and if
>>>> the
>>>> value
>>>> in memory isn't ~0, memory won't be updated; you will only
>>>> (correctly)
>>>> return the value found in memory.
>>>>
>>>> Or wait - looking at __cmpxchg_case_{1,2}() far further down, you
>>>> ignore
>>>> "old" there. Which apparently means they'll work for the use
>>>> here,
>>>> but
>>>> not for the use in __cmpxchg().
>>> Yes, the trick is that old is ignored and is read in
>>> __emulate_cmpxchg_case1_2() before __cmpxchg_case_4 is called:
>>>     do
>>> {                                                              
>>>         read_val =
>>> read_func(aligned_ptr);                            
>>>         swapped_new = read_val &
>>> ~mask;                               
>>>         swapped_new |=
>>> masked_new;                                    
>>>         ret = cmpxchg_func(aligned_ptr, read_val,
>>> swapped_new);       
>>>     } while ( ret != read_val
>>> );                                      
>>> read_val it is 'old'.
>>>
>>> But now I am not 100% sure that it is correct for __cmpxchg...
>>
>> It just can't be correct - you can't ignore "old" there. I think you
>> want simple cmpxchg primitives, which xchg then uses in a loop (while
>> cmpxchg uses them plainly).
> But xchg doesn't require 'old' value, so it should be ignored in some
> way by cmpxchg.

Well, no. If you have only cmpxchg, I think your only choice is - as
said - to read the old value and then loop over cmpxchg until that
succeeds. Not really different from other operations which need
emulating using cmpxchg.

>>>>> +static always_inline unsigned short __cmpxchg_case_2(volatile
>>>>> uint32_t *ptr,
>>>>> +                                                     uint32_t
>>>>> old,
>>>>> +                                                     uint32_t
>>>>> new)
>>>>> +{
>>>>> +    (void) old;
>>>>> +
>>>>> +    if (((unsigned long)ptr & 3) == 3)
>>>>> +    {
>>>>> +#ifdef CONFIG_64BIT
>>>>> +        return __emulate_cmpxchg_case1_2((uint64_t *)ptr, new,
>>>>> +                                         readq,
>>>>> __cmpxchg_case_8,
>>>>> 0xffffU);
>>>>
>>>> What if ((unsigned long)ptr & 7) == 7 (which is a sub-case of
>>>> what
>>>> the
>>>> if() above checks for? Isn't it more reasonable to require
>>>> aligned
>>>> 16-bit quantities here? Or if mis-aligned addresses are okay, you
>>>> could
>>>> as well emulate using __cmpxchg_case_4().
>>> Yes, it will be more reasonable. I'll use IS_ALIGNED instead.
>>
>> Not sure I get your use of "instead" here correctly. There's more
>> to change here than just the if() condition.
> I meant something like:
> 
> if ( IS_ALIGNED(ptr, 16) )
>     __emulate_cmpxchg_case1_2(...);
> else
>     assert_failed("ptr isn't aligned\n");

Except that you'd better not use assert_failed() directly anywhere,
and the above is easier as

    ASSERT(IS_ALIGNED(ptr, 16));
    __emulate_cmpxchg_case1_2(...);

anyway (leaving aside that I guess you mean 2, not 16).

Jan


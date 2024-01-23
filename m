Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED759838BC3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 11:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670344.1043048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSE0m-0006bH-PA; Tue, 23 Jan 2024 10:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670344.1043048; Tue, 23 Jan 2024 10:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSE0m-0006ZG-LO; Tue, 23 Jan 2024 10:28:08 +0000
Received: by outflank-mailman (input) for mailman id 670344;
 Tue, 23 Jan 2024 10:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSE0l-0006ZA-3Z
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 10:28:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 183e2d23-b9da-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 11:28:05 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso17261481fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 02:28:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl6-20020a056e0232c600b0035fabab7985sm1854024ilb.21.2024.01.23.02.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 02:28:04 -0800 (PST)
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
X-Inumbo-ID: 183e2d23-b9da-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706005685; x=1706610485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bUzo0X9beBa66cMH5Perzi3Ja1fLQWFsrkqgi841TI=;
        b=Xnn51wKFLBYMmw9R5A8LdTFWtTTl/x0vOeJ8lUs9iwxQlC09EHl2eHPbzdtzLn9XPN
         UikPQSb16vn3jwFWmRlXzaCWvltO3bB+oPengQ2K5CenCla3oy3jEku70dGJjH/ZvJOw
         zieFP+R7pWwpXVeKvX9t+eiU2sgPdpbVAhP+Fduu6QT0dLDdSareCgGmjVDgGETegPXQ
         croZIwIx+5Qwd6XQLyIW4bjTKJOwhVwVXB7od2VQH7XJxYvfwyE3WoU1/NpULwj07u8j
         iAHu82A7fz8aTiUJRiwbkNX7hZ5iM6pr0nF7OLv5fdJWMdLMy2RMQeywIHjS7HrKT255
         gabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706005685; x=1706610485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bUzo0X9beBa66cMH5Perzi3Ja1fLQWFsrkqgi841TI=;
        b=jxwggLFmTKZTdpL2cYwfq1fGJvxS43i0zG896uZ5Bd47s3m7psyYT3cqn15GSVlhXE
         80m6+s1S5+/l465LBbOtqRbyp7AehenMRBou9RLQMC2moIpCOw7TfQ2R5HvpnCwgqmg1
         ktET0vCRGy+jqX0lwjt2jdNWobSmtx224tPHEgPP9OfAmktmfD2ZlX2H7oRo0WyyOseh
         wjZNsg0GWFdK18uLyiGLp13wW5LFEkTKZERkiLKgIx2spsB7XJ4aKvyeT/Bci/Li0BKy
         XMKmqBD80rYIblhkMXhc6gSZqy6DMwBbVId7ROs1A175ESUTvQj8EV0fn6sQsQ9AKM18
         QUcw==
X-Gm-Message-State: AOJu0YxqkWkD5n62gXCnybQ0ZfP0fHDPLQ/gTf4cHccW40T0SJhGgNjR
	j8rDE2VTjugm7YZSID0EkwfVzDJBt9VnBBYisUE//LaW1tYh5EYhnFFNHJW6Yw==
X-Google-Smtp-Source: AGHT+IFR1ZYTfAyvLSr0MecjP47UMQnu0xZefN1Qo6ZaK+pQjJRTPvWG4lLzvQQ/JnF8fCmns/i0mA==
X-Received: by 2002:a05:651c:788:b0:2cc:bdbd:f31b with SMTP id g8-20020a05651c078800b002ccbdbdf31bmr2332251lje.30.1706005685143;
        Tue, 23 Jan 2024 02:28:05 -0800 (PST)
Message-ID: <c5872ae0-a26a-4f51-bad6-08fd0c37d488@suse.com>
Date: Tue, 23 Jan 2024 11:28:00 +0100
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
In-Reply-To: <56c23efdd79c0b1393ceef1adfcb45f66d4d1cf6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 11:15, Oleksii wrote:
> On Mon, 2024-01-22 at 17:27 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    case 8: \
>>> +        asm volatile( \
>>> +            "	amoswap.d %0, %2, %1\n" \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    default: \
>>> +        ASSERT_UNREACHABLE(); \
>>
>> If at all possible this wants to trigger a build failure, not a
>> runtime
>> one.
> I'll update that with BUILD_BUG_ON(size > 8);

What about size accidentally being e.g. 5? I'm also not sure you'll be
able to use BUILD_BUG_ON() here: That'll depend on what use sites there
are. And if all present ones are okay in this regard, you'd still set
out a trap for someone else to fall into later. We have a common
approach for this, which currently is under re-work. See
https://lists.xen.org/archives/html/xen-devel/2024-01/msg01115.html.

>>> +    } \
>>> +    ret__; \
>>> +})
>>> +
>>> +#define xchg_relaxed(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr))) __xchg_relaxed((ptr), x_,
>>> sizeof(*(ptr))); \
>>
>> Nit: Stray blank after cast. For readability I'd also suggest to
>> drop parentheses in cases like the first argument passed to
>> __xchg_relaxed() here.
> Thanks. I'll take that into account.
> 
>>
>>> +})
>>
>> For both: What does "relaxed" describe? I'm asking because it's not
>> really clear whether the memory clobbers are actually needed.
>>
>>> +#define __xchg_acquire(ptr, new, size) \
>>> +({ \
>>> +    __typeof__(ptr) ptr__ = (ptr); \
>>> +    __typeof__(new) new__ = (new); \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    switch (size) \
>>> +	{ \
>>> +    case 4: \
>>> +        asm volatile( \
>>> +            "	amoswap.w %0, %2, %1\n" \
>>> +            RISCV_ACQUIRE_BARRIER \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    case 8: \
>>> +        asm volatile( \
>>> +            "	amoswap.d %0, %2, %1\n" \
>>> +            RISCV_ACQUIRE_BARRIER \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory" ); \
>>> +        break; \
>>> +    default: \
>>> +        ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>
>> If I'm not mistaken this differs from __xchg_relaxed() only in the
>> use
>> of RISCV_ACQUIRE_BARRIER, and ...
>>
>>> +#define xchg_acquire(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr))) __xchg_acquire((ptr), x_,
>>> sizeof(*(ptr))); \
>>> +})
>>> +
>>> +#define __xchg_release(ptr, new, size) \
>>> +({ \
>>> +    __typeof__(ptr) ptr__ = (ptr); \
>>> +    __typeof__(new) new__ = (new); \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    switch (size) \
>>> +	{ \
>>> +    case 4: \
>>> +        asm volatile ( \
>>> +            RISCV_RELEASE_BARRIER \
>>> +            "	amoswap.w %0, %2, %1\n" \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory"); \
>>> +        break; \
>>> +    case 8: \
>>> +        asm volatile ( \
>>> +            RISCV_RELEASE_BARRIER \
>>> +            "	amoswap.d %0, %2, %1\n" \
>>> +            : "=r" (ret__), "+A" (*ptr__) \
>>> +            : "r" (new__) \
>>> +            : "memory"); \
>>> +        break; \
>>> +    default: \
>>> +        ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>
>> this only in the use of RISCV_RELEASE_BARRIER. If so they likely want
>> folding, to limit redundancy and make eventual updating easier. (Same
>> for the cmpxchg helper further down, as it seems.)
> Yes, you are right. The difference is only in RISCV_RELEASE_BARRIER and
> it is an absence of RISCV_RELEASE_BARRIER is a reason why we have
> "relaxed" versions.
> 
> I am not sure that I understand what you mean by folding here. Do you
> mean that there is no any sense to have to separate macros and it is
> needed only one with RISCV_RELEASE_BARRIER?

No. You should parameterize the folded common macro for the derived
macros to simply pass in the barriers needed, with empty macro
arguments indicating "this barrier not needed".

>>> +#define xchg_release(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr))) __xchg_release((ptr), x_,
>>> sizeof(*(ptr))); \
>>> +})
>>> +
>>> +static always_inline uint32_t __xchg_case_4(volatile uint32_t
>>> *ptr,
>>> +                                            uint32_t new)
>>> +{
>>> +    __typeof__(*(ptr)) ret;
>>> +
>>> +    asm volatile (
>>> +        "   amoswap.w.aqrl %0, %2, %1\n"
>>> +        : "=r" (ret), "+A" (*ptr)
>>> +        : "r" (new)
>>> +        : "memory" );
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static always_inline uint64_t __xchg_case_8(volatile uint64_t
>>> *ptr,
>>> +                                            uint64_t new)
>>> +{
>>> +    __typeof__(*(ptr)) ret;
>>> +
>>> +    asm volatile( \
>>> +        "   amoswap.d.aqrl %0, %2, %1\n" \
>>> +        : "=r" (ret), "+A" (*ptr) \
>>> +        : "r" (new) \
>>> +        : "memory" ); \
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static always_inline unsigned short __cmpxchg_case_2(volatile
>>> uint32_t *ptr,
>>> +                                                     uint32_t old,
>>> +                                                     uint32_t
>>> new);
>>
>> Don't you consistently mean uint16_t here (incl the return type) and
>> ...
>>
>>> +static always_inline unsigned short __cmpxchg_case_1(volatile
>>> uint32_t *ptr,
>>> +                                                     uint32_t old,
>>> +                                                     uint32_t
>>> new);
>>
>> ... uint8_t here?
> The idea was that we emulate __cmpxchg_case_1 and __cmpxchg_case_2
> using 4 bytes cmpxchg and __cmpxchg_case_4 expects uint32_t.

I consider this wrong. The functions would better be type-correct.

>>> +static inline unsigned long __xchg(volatile void *ptr, unsigned
>>> long x, int size)
>>> +{
>>> +    switch (size) {
>>> +    case 1:
>>> +        return __cmpxchg_case_1(ptr, (uint32_t)-1, x);
>>> +    case 2:
>>> +        return __cmpxchg_case_2(ptr, (uint32_t)-1, x);
>>
>> How are these going to work? You'll compare against ~0, and if the
>> value
>> in memory isn't ~0, memory won't be updated; you will only
>> (correctly)
>> return the value found in memory.
>>
>> Or wait - looking at __cmpxchg_case_{1,2}() far further down, you
>> ignore
>> "old" there. Which apparently means they'll work for the use here,
>> but
>> not for the use in __cmpxchg().
> Yes, the trick is that old is ignored and is read in
> __emulate_cmpxchg_case1_2() before __cmpxchg_case_4 is called:
>     do {                                                              
>         read_val = read_func(aligned_ptr);                            
>         swapped_new = read_val & ~mask;                               
>         swapped_new |= masked_new;                                    
>         ret = cmpxchg_func(aligned_ptr, read_val, swapped_new);       
>     } while ( ret != read_val );                                      
> read_val it is 'old'.
> 
> But now I am not 100% sure that it is correct for __cmpxchg...

It just can't be correct - you can't ignore "old" there. I think you
want simple cmpxchg primitives, which xchg then uses in a loop (while
cmpxchg uses them plainly).

>>> +static always_inline unsigned short __cmpxchg_case_2(volatile
>>> uint32_t *ptr,
>>> +                                                     uint32_t old,
>>> +                                                     uint32_t new)
>>> +{
>>> +    (void) old;
>>> +
>>> +    if (((unsigned long)ptr & 3) == 3)
>>> +    {
>>> +#ifdef CONFIG_64BIT
>>> +        return __emulate_cmpxchg_case1_2((uint64_t *)ptr, new,
>>> +                                         readq, __cmpxchg_case_8,
>>> 0xffffU);
>>
>> What if ((unsigned long)ptr & 7) == 7 (which is a sub-case of what
>> the
>> if() above checks for? Isn't it more reasonable to require aligned
>> 16-bit quantities here? Or if mis-aligned addresses are okay, you
>> could
>> as well emulate using __cmpxchg_case_4().
> Yes, it will be more reasonable. I'll use IS_ALIGNED instead.

Not sure I get your use of "instead" here correctly. There's more
to change here than just the if() condition.

Jan


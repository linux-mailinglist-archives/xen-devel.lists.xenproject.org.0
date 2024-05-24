Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248318CE128
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 08:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729087.1134213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAOjD-00026G-Cz; Fri, 24 May 2024 06:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729087.1134213; Fri, 24 May 2024 06:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAOjD-00024S-9v; Fri, 24 May 2024 06:48:35 +0000
Received: by outflank-mailman (input) for mailman id 729087;
 Fri, 24 May 2024 06:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAOjB-00024M-QK
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 06:48:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a17edb0f-1999-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 08:48:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6269ad7db2so42998366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 23:48:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93a807sm78653366b.85.2024.05.23.23.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 23:48:29 -0700 (PDT)
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
X-Inumbo-ID: a17edb0f-1999-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716533310; x=1717138110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2GVa449HW6Mxmf8Yz112W0MFbdzqzb+nt302Z0RJYw=;
        b=YZLjRhG6IHsGqWUaE7FZnSUWP9+Ur3GsfLrB0lecJ4E8wUfr5KmbBONH+J9W6teEDT
         ToFQtEnMUx6EyVby3I8V3/Gw+33hQMLQFvbqdtgAaipfJpFKXCS0VQaKODYu/4TmZSMg
         5p2W2Y3nQx9dt36o8522k01tGZ83BG5z8z3IM2LHHvGj8ObNqpSk05DbSmV7HSfitb8Y
         xIjcoxy1BBGCopaQXwNwpAWpTs0Za2b0L7L3y7SyQu+fzXOEKH2E45ARYjo67iYNmpEs
         rGketC1EtE8Esl9SqUZQ67K0Jgci6HvTvS6ZNrWshl/zY+9clo50wlqVG6p+QykcnffR
         qSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716533310; x=1717138110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2GVa449HW6Mxmf8Yz112W0MFbdzqzb+nt302Z0RJYw=;
        b=Au+ASZFu7t7iE58Dl+jXhzrYWM/5l1ztfjpvPbLgojDZtn4TbptDCxYj9SOqNNfvFF
         TjJOyIhg/lGllGm2qvq48EOZoymCfbZWzZL9KclQzmlLg/hjCeB1Jwzz16uvWeZGJOra
         ofRjdnV0SwrmrB+q1nBqNgV7UjCMWDQVk/BNDoWHuLQRITezvyjgDhCM4PJp+J+WDVgf
         7f1kT1zHl62p7vZxh1HrUXOuh8hoUNDV6LBo1U9P5r4/SaGD0TTUFcUDFL5bqgjMquxj
         TedJQ//RkPN8vHD8FllMCvXlfi9G5IyT1uIBRjSxlN7SaCckRYYVhNfG6ss++Eno4eE3
         7A3A==
X-Forwarded-Encrypted: i=1; AJvYcCUnfaUEYIurEC6wpTw/KSBABOTDpTDKIXFB/vU/zGXSxwpjfCuSwyz/Kk20T9jAdSB8qI6jk+zynKi0Yoc0B6gArg3GIyOEPq+siWekbQ0=
X-Gm-Message-State: AOJu0YwDWn4YDS5wtUV0D6ttUoCy54FuX5nZfjM1gH/+pKE32OAW0CrK
	wbqHxm8ihLhwIjxPKxkKzouhWP+Ot8eU8oMRpn3gc63S4t7p0wZiDeMBWo4foA==
X-Google-Smtp-Source: AGHT+IHFXujYj49jtg7pzKAGb5tN4EFkGz94J4b+XO00RUGKFCDqzbwM/MXSavMKNUu/CbDYQk8Qag==
X-Received: by 2002:a17:906:2509:b0:a5c:db98:c2a0 with SMTP id a640c23a62f3a-a6264f0e4e4mr83686866b.58.1716533309609;
        Thu, 23 May 2024 23:48:29 -0700 (PDT)
Message-ID: <ed0fec75-2b8c-4003-94ca-edbbb06e185f@suse.com>
Date: Fri, 24 May 2024 08:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
 <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
 <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
 <ea2c01d19160431ed9f6e4e7b6c122ab27aa676b.camel@gmail.com>
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
In-Reply-To: <ea2c01d19160431ed9f6e4e7b6c122ab27aa676b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2024 18:40, Oleksii K. wrote:
> On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
>> On 23/05/2024 15:11, Oleksii K. wrote:
>>> On Thu, 2024-05-23 at 14:00 +0100, Julien Grall wrote:
>>>> On 17/05/2024 14:54, Oleksii Kurochko wrote:
>>>>> diff --git a/xen/arch/arm/arm64/livepatch.c
>>>>> b/xen/arch/arm/arm64/livepatch.c
>>>>> index df2cebedde..4bc8ed9be5 100644
>>>>> --- a/xen/arch/arm/arm64/livepatch.c
>>>>> +++ b/xen/arch/arm/arm64/livepatch.c
>>>>> @@ -10,7 +10,6 @@
>>>>>    #include <xen/mm.h>
>>>>>    #include <xen/vmap.h>
>>>>>    
>>>>> -#include <asm/bitops.h>
>>>>
>>>> It is a bit unclear how this change is related to the patch. Can
>>>> you
>>>> explain in the commit message?
>>> Probably it doesn't need anymore. I will double check and if this
>>> change is not needed, I will just drop it in the next patch
>>> version.
>>>
>>>>
>>>>>    #include <asm/byteorder.h>
>>>>>    #include <asm/insn.h>
>>>>>    #include <asm/livepatch.h>
>>>>> diff --git a/xen/arch/arm/include/asm/bitops.h
>>>>> b/xen/arch/arm/include/asm/bitops.h
>>>>> index 5104334e48..8e16335e76 100644
>>>>> --- a/xen/arch/arm/include/asm/bitops.h
>>>>> +++ b/xen/arch/arm/include/asm/bitops.h
>>>>> @@ -22,9 +22,6 @@
>>>>>    #define __set_bit(n,p)            set_bit(n,p)
>>>>>    #define __clear_bit(n,p)          clear_bit(n,p)
>>>>>    
>>>>> -#define BITOP_BITS_PER_WORD     32
>>>>> -#define BITOP_MASK(nr)          (1UL << ((nr) %
>>>>> BITOP_BITS_PER_WORD))
>>>>> -#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>>>>>    #define BITS_PER_BYTE           8
>>>>
>>>> OOI, any reason BITS_PER_BYTE has not been moved as well? I don't
>>>> expect
>>>> the value to change across arch.
>>> I can move it to generic one header too in the next patch version.
>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/xen/include/xen/bitops.h
>>>>> b/xen/include/xen/bitops.h
>>>>> index f14ad0d33a..6eeeff0117 100644
>>>>> --- a/xen/include/xen/bitops.h
>>>>> +++ b/xen/include/xen/bitops.h
>>>>> @@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned
>>>>> long
>>>>> x)
>>>>>     * scope
>>>>>     */
>>>>>    
>>>>> +#define BITOP_BITS_PER_WORD 32
>>>>> +typedef uint32_t bitop_uint_t;
>>>>> +
>>>>> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) %
>>>>> BITOP_BITS_PER_WORD))
>>>>> +
>>>>> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
>>>>> +
>>>>> +extern void __bitop_bad_size(void);
>>>>> +
>>>>> +#define bitop_bad_size(addr) (sizeof(*(addr)) <
>>>>> sizeof(bitop_uint_t))
>>>>> +
>>>>>    /* --------------------- Please tidy above here ------------
>>>>> -----
>>>>> ---- */
>>>>>    
>>>>>    #include <asm/bitops.h>
>>>>>    
>>>>> +/**
>>>>> + * generic__test_and_set_bit - Set a bit and return its old
>>>>> value
>>>>> + * @nr: Bit to set
>>>>> + * @addr: Address to count from
>>>>> + *
>>>>> + * This operation is non-atomic and can be reordered.
>>>>> + * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>> + */
>>>>
>>>> Sorry for only mentioning this on v10. I think this comment
>>>> should be
>>>> duplicated (or moved to) on top of test_bit() because this is
>>>> what
>>>> everyone will use. This will avoid the developper to follow the
>>>> function
>>>> calls and only notice the x86 version which says "This function
>>>> is
>>>> atomic and may not be reordered." and would be wrong for all the
>>>> other arch.
>>> It makes sense to add this comment on top of test_bit(), but I am
>>> curious if it is needed to mention that for x86 arch_test_bit() "is
>>> atomic and may not be reordered":
>>
>> I would say no because any developper modifying common code can't 
>> relying it.
>>
>>>
>>>   * This operation is non-atomic and can be reordered. ( Exception:
>>> for
>>> * x86 arch_test_bit() is atomic and may not be reordered )
>>>   * If two examples of this operation race, one can appear to
>>> succeed
>>>   * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>>   */
>>>
>>>>
>>>>> +static always_inline bool
>>>>> +generic__test_and_set_bit(int nr, volatile void *addr)
>>>>> +{
>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>>>> BITOP_WORD(nr);
>>>>> +    bitop_uint_t old = *p;
>>>>> +
>>>>> +    *p = old | mask;
>>>>> +    return (old & mask);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * generic__test_and_clear_bit - Clear a bit and return its
>>>>> old
>>>>> value
>>>>> + * @nr: Bit to clear
>>>>> + * @addr: Address to count from
>>>>> + *
>>>>> + * This operation is non-atomic and can be reordered.
>>>>> + * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>> + */
>>>>
>>>> Same applies here and ...
>>>>
>>>>> +static always_inline bool
>>>>> +generic__test_and_clear_bit(int nr, volatile void *addr)
>>>>> +{
>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>>>> BITOP_WORD(nr);
>>>>> +    bitop_uint_t old = *p;
>>>>> +
>>>>> +    *p = old & ~mask;
>>>>> +    return (old & mask);
>>>>> +}
>>>>> +
>>>>> +/* WARNING: non atomic and it can be reordered! */
>>>>
>>>> ... here.
>>>>
>>>>> +static always_inline bool
>>>>> +generic__test_and_change_bit(int nr, volatile void *addr)
>>>>> +{
>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>>>> BITOP_WORD(nr);
>>>>> +    bitop_uint_t old = *p;
>>>>> +
>>>>> +    *p = old ^ mask;
>>>>> +    return (old & mask);
>>>>> +}
>>>>> +/**
>>>>> + * generic_test_bit - Determine whether a bit is set
>>>>> + * @nr: bit number to test
>>>>> + * @addr: Address to start counting from
>>>>> + */
>>>>> +static always_inline bool generic_test_bit(int nr, const
>>>>> volatile
>>>>> void *addr)
>>>>> +{
>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>> +    const volatile bitop_uint_t *p =
>>>>> +                        (const volatile bitop_uint_t *)addr +
>>>>> BITOP_WORD(nr);
>>>>> +
>>>>> +    return (*p & mask);
>>>>> +}
>>>>> +
>>>>> +static always_inline bool
>>>>> +__test_and_set_bit(int nr, volatile void *addr)
>>>>> +{
>>>>> +#ifndef arch__test_and_set_bit
>>>>> +#define arch__test_and_set_bit generic__test_and_set_bit
>>>>> +#endif
>>>>> +
>>>>> +    return arch__test_and_set_bit(nr, addr);
>>>>> +}
>>>>
>>>> NIT: It is a bit too late to change this one. But I have to
>>>> admit, I
>>>> don't understand the purpose of the static inline when you could
>>>> have
>>>> simply call...
>>>>
>>>>> +#define __test_and_set_bit(nr, addr) ({             \
>>>>> +    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
>>>>> +    __test_and_set_bit(nr, addr);                   \
>>>>
>>>> ... __arch__test_and_set_bit here.
>>> I just wanted to be in sync with other non-atomic test*_bit()
>>> operations and Andrew's patch series ( xen/bitops: Reduce the mess,
>>> starting with ffs() ).
>>
>> I looked at Andrew series and I can't seem to find an example where
>> he 
>> uses both the macro + static inline. He seems only use a static
>> inline.
>> Do you have any pointer?
>>
>> But by any chance are you referring to the pattern on x86? If so, I 
>> would really like to understand what's the benefits of introducing a
>> a 
>> one-liner static inline which is "shadowed" by a macro...
> Yes, I was referring to the x86 pattern.
> 
> I tried to find the reason in the commit but couldn't:
> https://lists.xenproject.org/archives/html/xen-changelog/2008-03/msg00097.html
> 
> For some reason, I also couldn't find the mailing list thread for this.
> 
> Perhaps Jan could help here, based on the commit message he might have
> a suggestion.

There's a lot of apparently unrelated context left, so I'm trying to guess
on what the actual question is, from the old change you're pointing at: With

#define __test_and_set_bit(nr, addr) ({             \
   if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
   __test_and_set_bit(nr, addr);                   \

why do we have that wrapping macro? If that's indeed the question, then may
I suggest you consider what would happen to the sizeof() in bitop_bad_size()
if the invocation was moved to the inline function, taking pointer-to-void?

However, I can't relate that old change to the question I think Julien
raised (invoking __test_and_set_bit() vs arch__test_and_set_bit()), so
perhaps I'm missing something.

Jan


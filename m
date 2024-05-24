Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C518CE18B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 09:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729127.1134265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPSq-00022t-TI; Fri, 24 May 2024 07:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729127.1134265; Fri, 24 May 2024 07:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPSq-0001zu-PF; Fri, 24 May 2024 07:35:44 +0000
Received: by outflank-mailman (input) for mailman id 729127;
 Fri, 24 May 2024 07:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAPSo-0001zl-K8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 07:35:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e337f9-19a0-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 09:35:41 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso45908966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 00:35:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4fedesm83960166b.118.2024.05.24.00.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 00:35:40 -0700 (PDT)
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
X-Inumbo-ID: 38e337f9-19a0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716536141; x=1717140941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Myy0lmU1C4B0UctkiR5xddYSBODCil9IrI+xzRHLXQo=;
        b=TR746UKHMkJRRjmSNqDhwAYc0j3WrGH2ZTc1hox0QMsXxu8e/orZG1OKQ6+KnSgW8i
         d3mF7fU0y/azQqrJqY3Is13qYtGOd2pSPl2tmjyqfG8VHEJYZEcnhrU9vvgsZyja33TW
         qZ3qL7f17Lv6gAxdY6HrRQqNYZs1lpyQ46fPp2vS1k6LlSHyOfxhHDphfqt3qXiMH05+
         UT+KqcvNj21W23us9lqF8KqjzInlZvcfA+BeZi8ttVE3khzq4NDMycLsBry8HrrCexx7
         GISf+mfFl+LM5WuxC9DVRGf93XPwHfWP99Q3gkGhTDcDb/uS3uGAgkEMLIDKsDDvreIP
         avpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716536141; x=1717140941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myy0lmU1C4B0UctkiR5xddYSBODCil9IrI+xzRHLXQo=;
        b=TktckaLcU/FamVhR51RaVBeymzRR+nuW9TEYXFEspm/MIWe7NjgeuY8GjjE3nEVsTw
         aOI9tJLxGgfxXsx0/3jCJcafr46eeUJgxHzWldSyce0JLk6Q7luYUkC10OXL+uyBPkj6
         76UdngQoGIpYtmEppi1RnbO5JlBlGtUIVHT0hCoTlISMklLnyakx/1oKv1ON3ixRdOTq
         YlI83ze8oF5x2wc/YjbZ8e70UJZcP+sR+OdKdGe0mTw0qQWzXwCAl8OSX2Sqv6RnJmnp
         QOGWU/oDvd5aKq6S0TpjHTaUfUyYoYbOs0R0p4sJmS3o3c0hLDCBEIswHK680i5IiD8c
         shcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTxn50vSBdB9AOtRhcP5cjglIX9kz0MZ+8LjdPNeD/keYSjwaxE1MvkQw2si9eEW3DD3FStCMNp/n3tYT+6gFQJ709fa27r2QwaP0dMZc=
X-Gm-Message-State: AOJu0YzkCDveyXy1gV85jRv6t3K7vKFePlvWAtuamo949JGYgWkBadw7
	NrrvVhk2ST1PPu2zGY8NGDUH2Z3fKuTqQc28r2+Rmtn5lFBX6aWdTwjXUAVpIA==
X-Google-Smtp-Source: AGHT+IGCQyiu8FBfqm49scxa2cbGbQjPVO9ATHbAX9royLmuuHC+39SHirZWHeaZjHPfr2PkHuracA==
X-Received: by 2002:a17:906:4f97:b0:a5a:6367:717e with SMTP id a640c23a62f3a-a62641dd8a2mr95042966b.17.1716536140585;
        Fri, 24 May 2024 00:35:40 -0700 (PDT)
Message-ID: <2d87e13f-7731-49ed-9628-b3d2b23ebdd4@suse.com>
Date: Fri, 24 May 2024 09:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
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
 <ed0fec75-2b8c-4003-94ca-edbbb06e185f@suse.com>
 <c0c8f4665b3cdc80394577d59a6676fa3f41d414.camel@gmail.com>
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
In-Reply-To: <c0c8f4665b3cdc80394577d59a6676fa3f41d414.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.05.2024 09:25, Oleksii K. wrote:
> On Fri, 2024-05-24 at 08:48 +0200, Jan Beulich wrote:
>> On 23.05.2024 18:40, Oleksii K. wrote:
>>> On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
>>>> On 23/05/2024 15:11, Oleksii K. wrote:
>>>>> On Thu, 2024-05-23 at 14:00 +0100, Julien Grall wrote:
>>>>>> On 17/05/2024 14:54, Oleksii Kurochko wrote:
>>>>>>> diff --git a/xen/arch/arm/arm64/livepatch.c
>>>>>>> b/xen/arch/arm/arm64/livepatch.c
>>>>>>> index df2cebedde..4bc8ed9be5 100644
>>>>>>> --- a/xen/arch/arm/arm64/livepatch.c
>>>>>>> +++ b/xen/arch/arm/arm64/livepatch.c
>>>>>>> @@ -10,7 +10,6 @@
>>>>>>>    #include <xen/mm.h>
>>>>>>>    #include <xen/vmap.h>
>>>>>>>    
>>>>>>> -#include <asm/bitops.h>
>>>>>>
>>>>>> It is a bit unclear how this change is related to the patch.
>>>>>> Can
>>>>>> you
>>>>>> explain in the commit message?
>>>>> Probably it doesn't need anymore. I will double check and if
>>>>> this
>>>>> change is not needed, I will just drop it in the next patch
>>>>> version.
>>>>>
>>>>>>
>>>>>>>    #include <asm/byteorder.h>
>>>>>>>    #include <asm/insn.h>
>>>>>>>    #include <asm/livepatch.h>
>>>>>>> diff --git a/xen/arch/arm/include/asm/bitops.h
>>>>>>> b/xen/arch/arm/include/asm/bitops.h
>>>>>>> index 5104334e48..8e16335e76 100644
>>>>>>> --- a/xen/arch/arm/include/asm/bitops.h
>>>>>>> +++ b/xen/arch/arm/include/asm/bitops.h
>>>>>>> @@ -22,9 +22,6 @@
>>>>>>>    #define __set_bit(n,p)            set_bit(n,p)
>>>>>>>    #define __clear_bit(n,p)          clear_bit(n,p)
>>>>>>>    
>>>>>>> -#define BITOP_BITS_PER_WORD     32
>>>>>>> -#define BITOP_MASK(nr)          (1UL << ((nr) %
>>>>>>> BITOP_BITS_PER_WORD))
>>>>>>> -#define BITOP_WORD(nr)          ((nr) /
>>>>>>> BITOP_BITS_PER_WORD)
>>>>>>>    #define BITS_PER_BYTE           8
>>>>>>
>>>>>> OOI, any reason BITS_PER_BYTE has not been moved as well? I
>>>>>> don't
>>>>>> expect
>>>>>> the value to change across arch.
>>>>> I can move it to generic one header too in the next patch
>>>>> version.
>>>>>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> diff --git a/xen/include/xen/bitops.h
>>>>>>> b/xen/include/xen/bitops.h
>>>>>>> index f14ad0d33a..6eeeff0117 100644
>>>>>>> --- a/xen/include/xen/bitops.h
>>>>>>> +++ b/xen/include/xen/bitops.h
>>>>>>> @@ -65,10 +65,141 @@ static inline int
>>>>>>> generic_flsl(unsigned
>>>>>>> long
>>>>>>> x)
>>>>>>>     * scope
>>>>>>>     */
>>>>>>>    
>>>>>>> +#define BITOP_BITS_PER_WORD 32
>>>>>>> +typedef uint32_t bitop_uint_t;
>>>>>>> +
>>>>>>> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) %
>>>>>>> BITOP_BITS_PER_WORD))
>>>>>>> +
>>>>>>> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
>>>>>>> +
>>>>>>> +extern void __bitop_bad_size(void);
>>>>>>> +
>>>>>>> +#define bitop_bad_size(addr) (sizeof(*(addr)) <
>>>>>>> sizeof(bitop_uint_t))
>>>>>>> +
>>>>>>>    /* --------------------- Please tidy above here --------
>>>>>>> ----
>>>>>>> -----
>>>>>>> ---- */
>>>>>>>    
>>>>>>>    #include <asm/bitops.h>
>>>>>>>    
>>>>>>> +/**
>>>>>>> + * generic__test_and_set_bit - Set a bit and return its
>>>>>>> old
>>>>>>> value
>>>>>>> + * @nr: Bit to set
>>>>>>> + * @addr: Address to count from
>>>>>>> + *
>>>>>>> + * This operation is non-atomic and can be reordered.
>>>>>>> + * If two examples of this operation race, one can appear
>>>>>>> to
>>>>>>> succeed
>>>>>>> + * but actually fail.  You must protect multiple accesses
>>>>>>> with
>>>>>>> a
>>>>>>> lock.
>>>>>>> + */
>>>>>>
>>>>>> Sorry for only mentioning this on v10. I think this comment
>>>>>> should be
>>>>>> duplicated (or moved to) on top of test_bit() because this is
>>>>>> what
>>>>>> everyone will use. This will avoid the developper to follow
>>>>>> the
>>>>>> function
>>>>>> calls and only notice the x86 version which says "This
>>>>>> function
>>>>>> is
>>>>>> atomic and may not be reordered." and would be wrong for all
>>>>>> the
>>>>>> other arch.
>>>>> It makes sense to add this comment on top of test_bit(), but I
>>>>> am
>>>>> curious if it is needed to mention that for x86 arch_test_bit()
>>>>> "is
>>>>> atomic and may not be reordered":
>>>>
>>>> I would say no because any developper modifying common code can't
>>>> relying it.
>>>>
>>>>>
>>>>>   * This operation is non-atomic and can be reordered. (
>>>>> Exception:
>>>>> for
>>>>> * x86 arch_test_bit() is atomic and may not be reordered )
>>>>>   * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>>   * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>>   */
>>>>>
>>>>>>
>>>>>>> +static always_inline bool
>>>>>>> +generic__test_and_set_bit(int nr, volatile void *addr)
>>>>>>> +{
>>>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t
>>>>>>> *)addr +
>>>>>>> BITOP_WORD(nr);
>>>>>>> +    bitop_uint_t old = *p;
>>>>>>> +
>>>>>>> +    *p = old | mask;
>>>>>>> +    return (old & mask);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * generic__test_and_clear_bit - Clear a bit and return
>>>>>>> its
>>>>>>> old
>>>>>>> value
>>>>>>> + * @nr: Bit to clear
>>>>>>> + * @addr: Address to count from
>>>>>>> + *
>>>>>>> + * This operation is non-atomic and can be reordered.
>>>>>>> + * If two examples of this operation race, one can appear
>>>>>>> to
>>>>>>> succeed
>>>>>>> + * but actually fail.  You must protect multiple accesses
>>>>>>> with
>>>>>>> a
>>>>>>> lock.
>>>>>>> + */
>>>>>>
>>>>>> Same applies here and ...
>>>>>>
>>>>>>> +static always_inline bool
>>>>>>> +generic__test_and_clear_bit(int nr, volatile void *addr)
>>>>>>> +{
>>>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t
>>>>>>> *)addr +
>>>>>>> BITOP_WORD(nr);
>>>>>>> +    bitop_uint_t old = *p;
>>>>>>> +
>>>>>>> +    *p = old & ~mask;
>>>>>>> +    return (old & mask);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* WARNING: non atomic and it can be reordered! */
>>>>>>
>>>>>> ... here.
>>>>>>
>>>>>>> +static always_inline bool
>>>>>>> +generic__test_and_change_bit(int nr, volatile void *addr)
>>>>>>> +{
>>>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t
>>>>>>> *)addr +
>>>>>>> BITOP_WORD(nr);
>>>>>>> +    bitop_uint_t old = *p;
>>>>>>> +
>>>>>>> +    *p = old ^ mask;
>>>>>>> +    return (old & mask);
>>>>>>> +}
>>>>>>> +/**
>>>>>>> + * generic_test_bit - Determine whether a bit is set
>>>>>>> + * @nr: bit number to test
>>>>>>> + * @addr: Address to start counting from
>>>>>>> + */
>>>>>>> +static always_inline bool generic_test_bit(int nr, const
>>>>>>> volatile
>>>>>>> void *addr)
>>>>>>> +{
>>>>>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>>>>>> +    const volatile bitop_uint_t *p =
>>>>>>> +                        (const volatile bitop_uint_t
>>>>>>> *)addr +
>>>>>>> BITOP_WORD(nr);
>>>>>>> +
>>>>>>> +    return (*p & mask);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static always_inline bool
>>>>>>> +__test_and_set_bit(int nr, volatile void *addr)
>>>>>>> +{
>>>>>>> +#ifndef arch__test_and_set_bit
>>>>>>> +#define arch__test_and_set_bit generic__test_and_set_bit
>>>>>>> +#endif
>>>>>>> +
>>>>>>> +    return arch__test_and_set_bit(nr, addr);
>>>>>>> +}
>>>>>>
>>>>>> NIT: It is a bit too late to change this one. But I have to
>>>>>> admit, I
>>>>>> don't understand the purpose of the static inline when you
>>>>>> could
>>>>>> have
>>>>>> simply call...
>>>>>>
>>>>>>> +#define __test_and_set_bit(nr, addr) ({             \
>>>>>>> +    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
>>>>>>> +    __test_and_set_bit(nr, addr);                   \
>>>>>>
>>>>>> ... __arch__test_and_set_bit here.
>>>>> I just wanted to be in sync with other non-atomic test*_bit()
>>>>> operations and Andrew's patch series ( xen/bitops: Reduce the
>>>>> mess,
>>>>> starting with ffs() ).
>>>>
>>>> I looked at Andrew series and I can't seem to find an example
>>>> where
>>>> he 
>>>> uses both the macro + static inline. He seems only use a static
>>>> inline.
>>>> Do you have any pointer?
>>>>
>>>> But by any chance are you referring to the pattern on x86? If so,
>>>> I 
>>>> would really like to understand what's the benefits of
>>>> introducing a
>>>> a 
>>>> one-liner static inline which is "shadowed" by a macro...
>>> Yes, I was referring to the x86 pattern.
>>>
>>> I tried to find the reason in the commit but couldn't:
>>> https://lists.xenproject.org/archives/html/xen-changelog/2008-03/msg00097.html
>>>
>>> For some reason, I also couldn't find the mailing list thread for
>>> this.
>>>
>>> Perhaps Jan could help here, based on the commit message he might
>>> have
>>> a suggestion.
>>
>> There's a lot of apparently unrelated context left, so I'm trying to
>> guess
>> on what the actual question is, from the old change you're pointing
>> at: With
>>
>> #define __test_and_set_bit(nr, addr) ({             \
>>    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
>>    __test_and_set_bit(nr, addr);                   \
>>
>> why do we have that wrapping macro? If that's indeed the question,
>> then may
>> I suggest you consider what would happen to the sizeof() in
>> bitop_bad_size()
>> if the invocation was moved to the inline function, taking pointer-
>> to-void?
>>
>> However, I can't relate that old change to the question I think
>> Julien
>> raised (invoking __test_and_set_bit() vs arch__test_and_set_bit()),
>> so
>> perhaps I'm missing something.
> If I understand the question correctly then the question is why do we
> need static inline function. Can't we just do the following:
> 
> #ifndef arch_test_bit
> #define arch_test_bit generic_test_bit
> #endif
> 
> #define test_bit(nr, addr) ({                           \
>     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>     arch_test_bit(nr, addr);                            \
> })

I think we can. But then how did that old commit come into play?

Jan


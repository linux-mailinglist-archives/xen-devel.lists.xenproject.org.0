Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57218C69E1
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722534.1126601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GlN-0004It-IJ; Wed, 15 May 2024 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722534.1126601; Wed, 15 May 2024 15:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GlN-0004Go-Ed; Wed, 15 May 2024 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 722534;
 Wed, 15 May 2024 15:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7GlM-0004CF-DG
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:41:52 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5581f4f-12d1-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:41:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso2772384a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:41:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574f6b8b9d7sm1341992a12.82.2024.05.15.08.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:41:49 -0700 (PDT)
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
X-Inumbo-ID: a5581f4f-12d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715787710; x=1716392510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k1F+NXhIM/iWN8rTZcrc7o7sEQYIQOhmQW6f5r3DggA=;
        b=WHZxoy2PJLGPdLEYC2+CqvrETVfq2bbXGL1XbAPhSWrk0Lw/AyZmUq+9dIEM9GudNN
         hzJIFPgD2rp+2vewmfFbmmb8EwC6TluTG5lQmk2+O0CFpU/6ZCpAqMkH+H3IDTPyNoff
         pzrzTAgz8Ac0Z1kJLjdKi9/HVVWIXo9+tUgg6p0GchFRgfGuKk6Lx10cEPiA3Vuvklzr
         XsiwOh4kBhlkIgHLI9GFIwgRKEehkj0g7rFvmZfAb5abutRviq2GavBXoIYi8RaMGEJk
         uswL2ZAwqHJ0kLz0bIE4GEllTZVIT44rYA7ZIMMLnpaWZ/Wosx++gHR6gIWi98sIuEtM
         Vk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715787710; x=1716392510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1F+NXhIM/iWN8rTZcrc7o7sEQYIQOhmQW6f5r3DggA=;
        b=VUT1kcwZ6TiIHSyEk7OWgNKhepSFHE4ctVvFzDv2jhNneASyPytFy0OePys8NRMfia
         wCdio7V08kWRpwYMJlYg3MX8lO8pi5Rs8qsod/Rf3BSM7+kGGPDzTQ0Ccza+icu2OD/S
         yFJt+gvjpZHOp/lxPyFx+DU7QUiR/aVT8zlpi5cO0C79YE8KIGPM3koXepei6Bc+CLfL
         HKahndz11xH0sTRsMAHyxKlnrGwIF/kGf2USObcPlNA+Nveij6Ny514y4dWaC/+QeSMt
         eWXudCjSQFX86E1YfDX5GDYknJaOEKfZafJG/VPpwfQiKUE0AT/0I57NuV5OfWvI8gGP
         X5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUb7/dU1+aHEpBCqa94eaJ/jsmgsBZAz8rTYbC7vZcnXy0mIIfSYF3TkNaHFUDiMNexQp0RSGOYXh2RxTONJKOE37P0REjgvaNwcTR+Obs=
X-Gm-Message-State: AOJu0YxcrxVdi+8/zoU1fJnrl/hP1ydPqihh04wiA2sAE9sFW7gIot/a
	jbMcmVySS3jY/hxZCTEwzwPm3G/84+yD07igR/DfIbeZ/vYONB72js8HTTNsgQ==
X-Google-Smtp-Source: AGHT+IEFWQzMGkyuz5LE3c99VHzYFOZVpDE1dvCNp/Lf+MdDDpIXJmuVJmF9kgyDI3zv2+vknKq4bw==
X-Received: by 2002:a50:bb05:0:b0:572:8aab:4420 with SMTP id 4fb4d7f45d1cf-5734d6de8c1mr11562042a12.39.1715787709821;
        Wed, 15 May 2024 08:41:49 -0700 (PDT)
Message-ID: <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
Date: Wed, 15 May 2024 17:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
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
In-Reply-To: <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2024 17:29, Oleksii K. wrote:
> On Wed, 2024-05-15 at 10:52 +0200, Jan Beulich wrote:
>> On 06.05.2024 12:15, Oleksii Kurochko wrote:
>>> The following generic functions were introduced:
>>> * test_bit
>>> * generic__test_and_set_bit
>>> * generic__test_and_clear_bit
>>> * generic__test_and_change_bit
>>>
>>> Also, the patch introduces the following generics which are
>>> used by the functions mentioned above:
>>> * BITOP_BITS_PER_WORD
>>> * BITOP_MASK
>>> * BITOP_WORD
>>> * BITOP_TYPE
>>>
>>> These functions and macros can be useful for architectures
>>> that don't have corresponding arch-specific instructions.
>>
>> Logically this paragraph may better move ahead of the BITOP_* one.
>>
>>> Because of that x86 has the following check in the macros
>>> test_bit(),
>>> __test_and_set_bit(), __test_and_clear_bit(),
>>> __test_and_change_bit():
>>>     if ( bitop_bad_size(addr) ) __bitop_bad_size();
>>> It was necessary to make bitop bad size check generic too, so
>>> arch_check_bitop_size() was introduced.
>>
>> Not anymore, with the most recent adjustments? There's nothing arch-
>> specific anymore in the checking.
>>
>>> @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr,
>>> volatile void *addr)
>>>   * If two examples of this operation race, one can appear to
>>> succeed
>>>   * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>>   */
>>> -static inline int __test_and_set_bit(int nr, void *addr)
>>> +static inline int arch__test_and_set_bit(int nr, volatile void
>>> *addr)
>>
>> I think I raised this point before: Why arch__ here, ...
>>
>>> @@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int nr,
>>> volatile void *addr)
>>>   * If two examples of this operation race, one can appear to
>>> succeed
>>>   * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>>   */
>>> -static inline int __test_and_clear_bit(int nr, void *addr)
>>> +static inline int arch__test_and_clear_bit(int nr, volatile void
>>> *addr)
>>
>> ... here, ...
>>
>>> @@ -243,13 +237,10 @@ static inline int __test_and_clear_bit(int
>>> nr, void *addr)
>>>  
>>>      return oldbit;
>>>  }
>>> -#define __test_and_clear_bit(nr, addr) ({               \
>>> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>> -    __test_and_clear_bit(nr, addr);                     \
>>> -})
>>> +#define arch__test_and_clear_bit arch__test_and_clear_bit
>>>  
>>>  /* WARNING: non atomic and it can be reordered! */
>>> -static inline int __test_and_change_bit(int nr, void *addr)
>>> +static inline int arch__test_and_change_bit(int nr, volatile void
>>> *addr)
>>
>> ... and here, while ...
>>
>>> @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr,
>>> const volatile void *addr)
>>>      return oldbit;
>>>  }
>>>  
>>> -#define test_bit(nr, addr) ({                           \
>>> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>> +#define arch_test_bit(nr, addr) ({                      \
>>
>> ... just arch_ here? I don't like the double underscore infixes very
>> much, but I'm okay with them as long as they're applied consistently.
> 
> Common code and x86 use __test_and_clear_bit(), and this patch provides
> a generic version of __test_and_clear_bit(). To emphasize that
> generic__test_and_clear_bit() is a common implementation of
> __test_and_clear_bit(), the double underscore was retained. Also,
> test_and_clear_bit() exists and if one day it will be needed to provide
> a generic version of it, then it will be needed to have
> generic__test_and_clear_bit() and generic_test_and_clear_bit()
> 
> A similar logic was chosen for test_bit.

Right, but in all of your reply arch_ doesn't appear at all. Yet the
question was: Why then not arch__test_bit(), to match the other arch
helpers?

>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -65,10 +65,144 @@ static inline int generic_flsl(unsigned long
>>> x)
>>>   * scope
>>>   */
>>>  
>>> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) %
>>> BITOP_BITS_PER_WORD))
>>> +
>>> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
>>> +
>>> +extern void __bitop_bad_size(void);
>>> +
>>>  /* --------------------- Please tidy above here ------------------
>>> --- */
>>>  
>>>  #include <asm/bitops.h>
>>>  
>>> +#ifndef arch_check_bitop_size
>>> +
>>> +#define bitop_bad_size(addr) sizeof(*(addr)) <
>>> sizeof(bitop_uint_t)
>>
>> Nit: Missing parentheses around the whole expression.
>>
>>> +#define arch_check_bitop_size(addr) \
>>> +    if ( bitop_bad_size(addr) ) __bitop_bad_size();
>>
>> Apart from the arch_ prefix that now wants dropping, this macro (if
>> we
>> want one in the first place) 
> What do you mean by 'want' here? I thought it is pretty necessary from
> safety point of view to have this check.

I don't question the check. What I was questioning is the need for a
macro to wrap that, seeing how x86 did without. I'm not outright
objecting to such a macro, though.

> Except arch_ prefix does it make sense to drop "#ifndef
> arch_check_bitop_size" around this macros?

Of course, as with arch_ dropped from the name there's no intention to
allow arch overrides.

>>> +/**
>>> + * generic__test_and_set_bit - Set a bit and return its old value
>>> + * @nr: Bit to set
>>> + * @addr: Address to count from
>>> + *
>>> + * This operation is non-atomic and can be reordered.
>>> + * If two examples of this operation race, one can appear to
>>> succeed
>>> + * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>> + */
>>> +static always_inline bool
>>> +generic__test_and_set_bit(unsigned long nr, volatile void *addr)
>>
>> The original per-arch functions all use "int" for their first
>> parameter.
>> Here you use unsigned long, without any mention in the description of
>> the
>> potential behavioral change. Which is even worse given that then x86
>> ends
>> up inconsistent with Arm and PPC in this regard, by ...
>>
>>> +{
>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>> BITOP_WORD(nr);
>>> +    bitop_uint_t old = *p;
>>> +
>>> +    *p = old | mask;
>>> +    return (old & mask);
>>> +}
>>> +
>>> +/**
>>> + * generic__test_and_clear_bit - Clear a bit and return its old
>>> value
>>> + * @nr: Bit to clear
>>> + * @addr: Address to count from
>>> + *
>>> + * This operation is non-atomic and can be reordered.
>>> + * If two examples of this operation race, one can appear to
>>> succeed
>>> + * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>> + */
>>> +static always_inline bool
>>> +generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
>>> +{
>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>> BITOP_WORD(nr);
>>> +    bitop_uint_t old = *p;
>>> +
>>> +    *p = old & ~mask;
>>> +    return (old & mask);
>>> +}
>>> +
>>> +/* WARNING: non atomic and it can be reordered! */
>>> +static always_inline bool
>>> +generic__test_and_change_bit(unsigned long nr, volatile void
>>> *addr)
>>> +{
>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>> BITOP_WORD(nr);
>>> +    bitop_uint_t old = *p;
>>> +
>>> +    *p = old ^ mask;
>>> +    return (old & mask);
>>> +}
>>> +/**
>>> + * generic_test_bit - Determine whether a bit is set
>>> + * @nr: bit number to test
>>> + * @addr: Address to start counting from
>>> + */
>>> +static always_inline bool generic_test_bit(int nr, const volatile
>>> void *addr)
>>> +{
>>> +    bitop_uint_t mask = BITOP_MASK(nr);
>>> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr +
>>> BITOP_WORD(nr);
>>> +
>>> +    return (*p & mask);
>>> +}
>>> +
>>> +static always_inline bool
>>> +__test_and_set_bit(unsigned long nr, volatile void *addr)
>>> +{
>>> +#ifndef arch__test_and_set_bit
>>> +#define arch__test_and_set_bit generic__test_and_set_bit
>>> +#endif
>>> +
>>> +    return arch__test_and_set_bit(nr, addr);
>>
>> ... silently truncating and sign-converting nr here.
> Missed that fact. AFAIU there is no specific reason for bit number to
> be 'int' for this function, so it makes sense to update x86's prototype
> of arch__test_and_set_bit() to:
>    static inline int arch__test_and_set_bit(unsigned long nr, volatile
>    void *addr).
>    
> But probably I can't use 'unsigned long' here too, as it should a
> compilation error around 'btsl' instruction.
> 
> So it can be or 'unsinged int' or 'int'.
>>
>> As to generic_test_bit() - please don't cast away const-ness there.
>>
>>> +}
>>> +#define __test_and_set_bit(nr, addr) ({             \
>>> +    arch_check_bitop_size(addr);                    \
>>> +    __test_and_set_bit(nr, addr);                   \
>>> +})
>>> +
>>> +static always_inline bool
>>> +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
>>
>> Oddly enough here at least you use bitop_uint_t, but that's still ...
>>
>>> +{
>>> +#ifndef arch__test_and_clear_bit
>>> +#define arch__test_and_clear_bit generic__test_and_clear_bit
>>> +#endif
>>> +
>>> +    return arch__test_and_clear_bit(nr, addr);
>>
>> ... meaning a signedness conversion on x86 then. And beware: You
>> can't
>> simply change x86'es code to use bitop_uint_t. The underlying insns
>> used
>> interpret the bit position as a signed number, i.e. permitting
>> accesses
>> below the incoming pointer (whether it really makes sense to be that
>> way
>> is a separate question). I'm afraid I have no good suggestion how to
>> deal
>> with that: Any approach I can think of is either detrimental to the
>> generic implementation or would have unwanted effects on the x86 one.
>> Others, anyone?
> Is the signedness conversion here a big problem? I suppose no one will
> pass a negative number to nr.
> 
> It seems to me that it would be better to use 'int' everywhere and not
> use bitop_uint_t for 'nr' since it is just a bit position. 'Int'
> provides enough range for possible bit number.

Indeed, and that's then hopefully less of a risk as to introducing hard
to spot issues. Provided Arm and PPC are okay with that type then as well.

>>> --- a/xen/include/xen/types.h
>>> +++ b/xen/include/xen/types.h
>>> @@ -64,6 +64,12 @@ typedef __u64 __be64;
>>>  
>>>  typedef unsigned int __attribute__((__mode__(__pointer__)))
>>> uintptr_t;
>>>  
>>> +#ifndef BITOP_TYPE
>>> +#define BITOP_BITS_PER_WORD 32
>>> +
>>> +typedef uint32_t bitop_uint_t;
>>> +#endif
>>
>> I think you mentioned to me before why this needs to live here, not
>> in
>> xen/bitops.h. Yet I don't recall the reason, and the description
>> (hint,
>> hint) doesn't say anything either.
> If I remember correctly ( after this phrase I think I have to update
> the description ) the reason was that if I put that to xen/bitops.h:
> 
>     ...
>     #include <asm/bitops.h>
>     
>     #ifndef BITOP_TYPE
>     #define BITOP_BITS_PER_WORD 32
>     /* typedef uint32_t bitop_uint_t; */
>     #endif
>     ...
> 
> Then we will have an issue that we can't use the generic definition of 
> BITOP_BITS_PER_WORD and bitop_uint_t in asm/bitops.h as it is defined
> after inclusion of <asm/bitops.h>.
> 
> But if to put it to <xen/types.h> then such problem won't occur.
> 
> If it still makes sense, then I'll update the description in the next
> patch version.

I see. But we don't need to allow for arch overrides here anymore, so in
xen/bitops.h couldn't we as well have

#define BITOP_BITS_PER_WORD 32
typedef uint32_t bitop_uint_t;

... (if necessary)

#include <asm/bitops.h>

?

Jan


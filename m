Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F38C6314
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 10:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722012.1125779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ANV-00056I-4P; Wed, 15 May 2024 08:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722012.1125779; Wed, 15 May 2024 08:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ANV-00053c-1H; Wed, 15 May 2024 08:52:49 +0000
Received: by outflank-mailman (input) for mailman id 722012;
 Wed, 15 May 2024 08:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ANT-00053W-Is
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 08:52:47 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4f25ec-1298-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 10:52:45 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-574d1a1c36aso1398426a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 01:52:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01968sm829902066b.166.2024.05.15.01.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 01:52:44 -0700 (PDT)
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
X-Inumbo-ID: 7f4f25ec-1298-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715763165; x=1716367965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usjtIK6sqrUaoYx074lh8bs5SFfkVgAx2UHaIyHmabk=;
        b=ATxtK8tKseQ67EQ+jU+5B5dw8U+Ip5e3FtDNledRDMF0CpWr4GozdFjLHU8xlXfTx6
         cxpSTOrNuspVnlj2rMDblrR6anoA0uAst1jLqaWR4P32Qe9x0xM1DEZ8TiVuJMGUvrA+
         ND49bDDCa2HLjD+4jUWY1kqL7RsvqRTUAV4jCl3rdfnp8Wd4g61JdE9YODccubYUvTHH
         6ZdbW93hML+0VnwsEGJpejEJykVZzCewRuiMXbo7kknbXVPiYAI9Xw7vKFU8mSWb6hFJ
         w8Wf11ng+mm2qrG4BKdhslKwyPwQesttZpUTyjxl7RpxeBjo/mzUVPhHF5mvFkn/Srgb
         1Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715763165; x=1716367965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usjtIK6sqrUaoYx074lh8bs5SFfkVgAx2UHaIyHmabk=;
        b=Pe+4AQpTjble22G6n25Rd0fcLy2JEvhzMCISS+Fpd/4g7LuZXGdImkv9bxbEJc2yZZ
         fkNaoAuDP6wyKKgitUmLNBjzhZp+cGUsuV5ogzc4Or17tHISbdQmAQG6q9a28GbeG5Ne
         ldZ4pEiJZXayZXC1KAH2LdLy/yLU5i9vcEhZnm8qDkw9GerY4jAfxTQ1yAR5+xKo2XL+
         yG9X7tQNdTsu8tBPZjUcwdSYrxnJk5iicCThC0LewCii6/fOzm1HJlIFgo0VVpDP/ILv
         ua4ToTHHnOs3RjsoBnCig3NSl4QbMYjCrc0lBB85ClpSaieoPmJRoLK0qHeJngJPokJE
         JFmg==
X-Forwarded-Encrypted: i=1; AJvYcCUdPFkGj/8b/fo7cFqkBLgR+QnKIcni/jlvNNkP4anyVtgd6GRyn58RVkT+hJ0YI8ccKcjcr3ATCeDlkfv4CmD0DVj/FQ8lI+jJmi9y66Y=
X-Gm-Message-State: AOJu0Ywr762s0ejUgEGNSJcvieOcYBqK5Bo6ZgZojvfsUiN5wymKZxtf
	f7Tt4w4l7iahl4oo0fsp/nPnQOUQ1uGBSeuQjqRy7mwBZqS/zJD9MTpDZ3oaKQ==
X-Google-Smtp-Source: AGHT+IGoZLkLN7hkv0qzmpMTyLOeTGFb8VrgBJGTIvAnHKnXVk6tc6XPs28aas6wUuHj1f2uJPRMXw==
X-Received: by 2002:a17:907:76d3:b0:a59:c7d7:8b0f with SMTP id a640c23a62f3a-a5a2d57a717mr931264966b.29.1715763164751;
        Wed, 15 May 2024 01:52:44 -0700 (PDT)
Message-ID: <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
Date: Wed, 15 May 2024 10:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 12:15, Oleksii Kurochko wrote:
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.

Logically this paragraph may better move ahead of the BITOP_* one.

> Because of that x86 has the following check in the macros test_bit(),
> __test_and_set_bit(), __test_and_clear_bit(), __test_and_change_bit():
>     if ( bitop_bad_size(addr) ) __bitop_bad_size();
> It was necessary to make bitop bad size check generic too, so
> arch_check_bitop_size() was introduced.

Not anymore, with the most recent adjustments? There's nothing arch-
specific anymore in the checking.

> @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
>   * If two examples of this operation race, one can appear to succeed
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
> -static inline int __test_and_set_bit(int nr, void *addr)
> +static inline int arch__test_and_set_bit(int nr, volatile void *addr)

I think I raised this point before: Why arch__ here, ...

> @@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
>   * If two examples of this operation race, one can appear to succeed
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
> -static inline int __test_and_clear_bit(int nr, void *addr)
> +static inline int arch__test_and_clear_bit(int nr, volatile void *addr)

... here, ...

> @@ -243,13 +237,10 @@ static inline int __test_and_clear_bit(int nr, void *addr)
>  
>      return oldbit;
>  }
> -#define __test_and_clear_bit(nr, addr) ({               \
> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> -    __test_and_clear_bit(nr, addr);                     \
> -})
> +#define arch__test_and_clear_bit arch__test_and_clear_bit
>  
>  /* WARNING: non atomic and it can be reordered! */
> -static inline int __test_and_change_bit(int nr, void *addr)
> +static inline int arch__test_and_change_bit(int nr, volatile void *addr)

... and here, while ...

> @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
>      return oldbit;
>  }
>  
> -#define test_bit(nr, addr) ({                           \
> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> +#define arch_test_bit(nr, addr) ({                      \

... just arch_ here? I don't like the double underscore infixes very
much, but I'm okay with them as long as they're applied consistently.

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -65,10 +65,144 @@ static inline int generic_flsl(unsigned long x)
>   * scope
>   */
>  
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
> +extern void __bitop_bad_size(void);
> +
>  /* --------------------- Please tidy above here --------------------- */
>  
>  #include <asm/bitops.h>
>  
> +#ifndef arch_check_bitop_size
> +
> +#define bitop_bad_size(addr) sizeof(*(addr)) < sizeof(bitop_uint_t)

Nit: Missing parentheses around the whole expression.

> +#define arch_check_bitop_size(addr) \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size();

Apart from the arch_ prefix that now wants dropping, this macro (if we
want one in the first place) also wants writing in a way such that it
can be used as a normal expression, without double semicolons or other
anomalies (potentially) resulting at use sites. E.g.

#define check_bitop_size(addr) do { \
    if ( bitop_bad_size(addr) )     \
        __bitop_bad_size();         \
} while ( 0 )

> +#endif /* arch_check_bitop_size */
> +
> +/**
> + * generic__test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic__test_and_set_bit(unsigned long nr, volatile void *addr)

The original per-arch functions all use "int" for their first parameter.
Here you use unsigned long, without any mention in the description of the
potential behavioral change. Which is even worse given that then x86 ends
up inconsistent with Arm and PPC in this regard, by ...

> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old | mask;
> +    return (old & mask);
> +}
> +
> +/**
> + * generic__test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old & ~mask;
> +    return (old & mask);
> +}
> +
> +/* WARNING: non atomic and it can be reordered! */
> +static always_inline bool
> +generic__test_and_change_bit(unsigned long nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old ^ mask;
> +    return (old & mask);
> +}
> +/**
> + * generic_test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static always_inline bool generic_test_bit(int nr, const volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +
> +    return (*p & mask);
> +}
> +
> +static always_inline bool
> +__test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_set_bit
> +#define arch__test_and_set_bit generic__test_and_set_bit
> +#endif
> +
> +    return arch__test_and_set_bit(nr, addr);

... silently truncating and sign-converting nr here.

As to generic_test_bit() - please don't cast away const-ness there.

> +}
> +#define __test_and_set_bit(nr, addr) ({             \
> +    arch_check_bitop_size(addr);                    \
> +    __test_and_set_bit(nr, addr);                   \
> +})
> +
> +static always_inline bool
> +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)

Oddly enough here at least you use bitop_uint_t, but that's still ...

> +{
> +#ifndef arch__test_and_clear_bit
> +#define arch__test_and_clear_bit generic__test_and_clear_bit
> +#endif
> +
> +    return arch__test_and_clear_bit(nr, addr);

... meaning a signedness conversion on x86 then. And beware: You can't
simply change x86'es code to use bitop_uint_t. The underlying insns used
interpret the bit position as a signed number, i.e. permitting accesses
below the incoming pointer (whether it really makes sense to be that way
is a separate question). I'm afraid I have no good suggestion how to deal
with that: Any approach I can think of is either detrimental to the
generic implementation or would have unwanted effects on the x86 one.
Others, anyone?

> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -64,6 +64,12 @@ typedef __u64 __be64;
>  
>  typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
>  
> +#ifndef BITOP_TYPE
> +#define BITOP_BITS_PER_WORD 32
> +
> +typedef uint32_t bitop_uint_t;
> +#endif

I think you mentioned to me before why this needs to live here, not in
xen/bitops.h. Yet I don't recall the reason, and the description (hint,
hint) doesn't say anything either.

Jan


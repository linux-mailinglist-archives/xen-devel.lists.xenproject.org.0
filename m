Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE48988B7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 15:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700877.1094633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN3H-0003Tb-D2; Thu, 04 Apr 2024 13:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700877.1094633; Thu, 04 Apr 2024 13:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN3H-0003QV-AD; Thu, 04 Apr 2024 13:22:47 +0000
Received: by outflank-mailman (input) for mailman id 700877;
 Thu, 04 Apr 2024 13:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsN3G-0003QL-KL
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 13:22:46 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b8728f7-f286-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 15:22:44 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-515a68d45faso1127486e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 06:22:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b004146e58cc35sm2667734wmo.46.2024.04.04.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 06:22:43 -0700 (PDT)
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
X-Inumbo-ID: 6b8728f7-f286-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712236963; x=1712841763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1un8StUWmmH0k3dYWf/lE6DYTs01ydZ30PvJxGqCISY=;
        b=c+ElpKjHvO1bRcTitRCCtMXpiAfD8lk8DhXlzfqCr3S8MDwVOlK7vQrGe+m/BhbwcL
         RXNCvvC+AFjaTJMp4r1i03uaiRC2ruBG9e3ZNhlpCn10gD4C9nc5vI/Nqx5ZFbUoK40F
         hoggnc3GugkBmEAYdCm9vTdAQ3z7jRUZ83g46BNbOPA8UsmUwAhLSWkx9zYBJrUUq6xN
         1meeUSGVvSdfpnmfI0V2f08Fg5LsnMI2JQGjN5Dlu8XsO37gxhzJehSEhwzhMXGg4HGc
         3Z3z+jk9jK7Rub62djjclhsuuHkXPqSjgKSwt5FOf50yragd8HJXTboAMtDmluQPWr++
         btYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236963; x=1712841763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1un8StUWmmH0k3dYWf/lE6DYTs01ydZ30PvJxGqCISY=;
        b=rzFc7njdL0puhY8SjPHruRpInmYY8iGy8aj9U1otVxJKr54HNz+rdh+B8f1D46/KcX
         44azZRSDH9uhzRJLRUq0AntVibodWEJ1M9j930mfj7klfyMnNYoxzhztN3Yn4aIkZS5b
         jzt7aJZt8Xrwc2v1VEhZ/1p6AmlQPRTkQmf5xYlZh/N3EepWO1ilCJCYmwQ12yPJnCMV
         LppKouVLSP6xcyc6JBnb71cALOAoijcUMbmcu3yqsdNe4J6ZH310AP0XRAOrl3g5SyQo
         kCoiPA1poRgsD9l3Y3ovxSDaMruj7HoW5ezy71wHya8TDGQv8Fmns0SOLw30AgxFQmm4
         3Z6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWapJabfTGpkjFq9ZSt0PtddXMdoGI2NddaDzXHf/2vJ7DA04WCShUF7VH/FeZvpu/wJTvQE2yZx/dZYtBdyiQ5yShdjDumHtcZ7sBHGQ=
X-Gm-Message-State: AOJu0YyiVLQuOyVlv2r/9cEQnOYQnM0RKsWqomNydZv7heD+ORC9GKgx
	iSDfyYOtNJYsyLrlaRkI5F9mSvHiHyuri1k9yvpr4HkeD4J86M0xgBRix3aWOQ==
X-Google-Smtp-Source: AGHT+IEfgEWMtSl9b6g0S/iq0WSk5coAcmrVgP+L5NBbYZXHGJAsET/tEi2FpNKTwC3SJEsIApRjuA==
X-Received: by 2002:a2e:7815:0:b0:2d8:60a4:cfa with SMTP id t21-20020a2e7815000000b002d860a40cfamr384390ljc.41.1712236963359;
        Thu, 04 Apr 2024 06:22:43 -0700 (PDT)
Message-ID: <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
Date: Thu, 4 Apr 2024 15:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> The patch introduces the following generic functions:
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
> 
> Because of that x86 has the following check in the macros test_bit(),
> __test_and_set_bit(), __test_and_clear_bit(), __test_and_change_bit():
>     if ( bitop_bad_size(addr) ) __bitop_bad_size();
> It was necessary to move the check to generic code and define as 0
> for other architectures as they do not require this check.

Hmm, yes, the checks need to be in the outermost wrapper macros. While
you're abstracting other stuff to arch_*(), wouldn't it make sense to
also abstract this to e.g. arch_check_bitop_size(), with the expansion
simply being (effectively) empty in the generic fallback case?

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned long x)
>   * scope
>   */
>  
> +#define BITOP_BITS_PER_WORD 32
> +/* typedef uint32_t bitop_uint_t; */
> +#define bitop_uint_t uint32_t

So no arch overrides permitted anymore at all?

> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
>  /* --------------------- Please tidy above here --------------------- */
>  
>  #include <asm/bitops.h>
>  
> +#ifndef bitop_bad_size
> +extern void __bitop_bad_size(void);

If not switching to arch_check_bitop_size() or alike as suggested above,
why exactly does this need duplicating here and in x86? Can't the decl
simply move ahead of the #include right above? (Sure, this will then
require that nothing needing any of the functions you move here would
still include asm/bitops.h; it would need to be xen/bitops.h everywhere.)

> +#define bitop_bad_size(addr) 0
> +#endif
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
> +static always_inline __pure bool
> +generic__test_and_set_bit(unsigned long nr, volatile void *addr)

Does __pure actually fit with the use of volatile? The former says multiple
accesses may be folded; the latter says they must not be.

> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);

Nit: Slightly shorter line possible:

    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);

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
> +static always_inline __pure bool
> +generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old & ~mask;
> +    return (old & mask);
> +}
> +
> +/* WARNING: non atomic and it can be reordered! */
> +static always_inline __pure bool
> +generic__test_and_change_bit(unsigned long nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);
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
> +static always_inline __pure int generic_test_bit(int nr, const volatile void *addr)

Further up you use bool; why int here?

> +{
> +    const volatile bitop_uint_t *p = addr;
> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));

And reason not to use BITOP_MASK() here as well (once having switched to
bool return type)?

> +}
> +
> +static always_inline __pure bool
> +__test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_set_bit
> +#define arch__test_and_set_bit generic__test_and_set_bit
> +#endif
> +
> +    return arch__test_and_set_bit(nr, addr);
> +}
> +#define __test_and_set_bit(nr, addr) ({             \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> +    __test_and_set_bit(nr, addr);                   \
> +})
> +
> +static always_inline __pure bool
> +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_clear_bit
> +#define arch__test_and_clear_bit generic__test_and_clear_bit
> +#endif
> +
> +    return arch__test_and_clear_bit(nr, addr);
> +}
> +#define __test_and_clear_bit(nr, addr) ({           \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> +    __test_and_clear_bit(nr, addr);                 \
> +})
> +
> +static always_inline __pure bool
> +__test_and_change_bit(unsigned long nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_change_bit
> +#define arch__test_and_change_bit generic__test_and_change_bit
> +#endif
> +
> +    return arch__test_and_change_bit(nr, addr);
> +}
> +#define __test_and_change_bit(nr, addr) ({              \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> +    __test_and_change_bit(nr, addr);                    \
> +})
> +
> +static always_inline __pure int test_bit(int nr, const volatile void *addr)

Further up you use bool; why int here?

> +{
> +#ifndef arch_test_bit
> +#define arch_test_bit generic_test_bit
> +#endif
> +
> +    return arch_test_bit(nr, addr);
> +}
> +#define test_bit(nr, addr) ({                           \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> +    test_bit(nr, addr);                                 \
> +})

From here onwards, ...

> +static always_inline __pure int fls(unsigned int x)
> +{
> +    if (__builtin_constant_p(x))
> +        return generic_fls(x);
> +
> +#ifndef arch_fls
> +#define arch_fls generic_fls
> +#endif
> +
> +    return arch_fls(x);
> +}
> +
> +static always_inline __pure int flsl(unsigned long x)
> +{
> +    if (__builtin_constant_p(x))
> +        return generic_flsl(x);
> +
> +#ifndef arch_flsl
> +#define arch_flsl generic_flsl
> +#endif
> +
> +    return arch_flsl(x);
> +}

... does all of this really belong here? Neither title nor description have
any hint towards this.

>  /*
>   * Find First Set bit.  Bits are labelled from 1.
>   */

This context suggests there's a dependency on an uncommitted patch. Nothing
above says so. I guess you have a remark in the cover letter, yet imo that's
only partly helpful.

Jan


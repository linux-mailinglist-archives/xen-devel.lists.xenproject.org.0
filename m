Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EA8D1454
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 08:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731001.1136289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqCp-0006Ne-AM; Tue, 28 May 2024 06:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731001.1136289; Tue, 28 May 2024 06:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqCp-0006Lc-7f; Tue, 28 May 2024 06:21:07 +0000
Received: by outflank-mailman (input) for mailman id 731001;
 Tue, 28 May 2024 06:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBqCn-0006LV-NM
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 06:21:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 746d3cac-1cba-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 08:21:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a61b70394c0so49730166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 23:21:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93a7fcsm575210366b.53.2024.05.27.23.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 23:21:00 -0700 (PDT)
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
X-Inumbo-ID: 746d3cac-1cba-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716877261; x=1717482061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7UcWDt5wNKUlCr8ZGJivw06ckTHfyRAkzLstIHpPc0=;
        b=KxyrqGdEhuQlV2WjCHBSBs6jyvE4NGZKgvq1VrwEvqhDRdQS6PQGWT7Au8MT1gJYFH
         NO4Eazc4slHh8YErLcdA09xq1jsHX4yOE7RHcrXsJQBeEKWJ6PkAoH/psJCdIe5O5C38
         F6mDXmkF+8mgVYNNFpLM5NjcyLLCoiBQyw5tFHis3AGR2UzUDRpR2guLkgpwZ9PXZATK
         8v/sLL4rvUvnuQCQTcOmk318ECYxK2wTtTJHjReRnipTs4KfvoQPEZ2KCrM6qbrcO/Gt
         ePVHg3YKzS2I3r8V9Fxz2OdUW7FWE7Vz70aBLhpXNzeYO01xEgTeWNYZxGIMblyhL/lJ
         LHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716877261; x=1717482061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7UcWDt5wNKUlCr8ZGJivw06ckTHfyRAkzLstIHpPc0=;
        b=io6NUc16VtXcD0tmKq6ylN8SQahAumEu5hNzUum5tLRbHm6fpaLjYIhAPpTVGhWNNb
         SeC0/UcPvJsJxf4+TqSNrBKylod9uNBbJ/m8F7muxeQAVTNpyFceLmvIPd4dw+96In3I
         fnzkt1KQale7ebTgCVZyZgWDfcYkRyOQe6V0WEoI8PnXrS56gFQlCNF5X+Bp73ceEKaw
         gT7iy1XgGAeJ4CJ6rD/5UBWVBgxL/Mv/yhNBrAq8H/v9ZwFnBbMU8kd0o/cl5+aX1Kwj
         opFCsXfDkUpngdRA9brbJtPOX4xu576x6pjP6OyIoTo/LfClS/plFslQLiJjoLJ72nQt
         KCWA==
X-Forwarded-Encrypted: i=1; AJvYcCUyi0NXeaQryFmCpHPbJ8E1y8GMejo7VMrdpBtHaNQf24h4RF3f1qcaY82OXu4NdZSEQ+Hr2jZ4roAVFeeUsvaB3jYMP5xSxej18Sfow8k=
X-Gm-Message-State: AOJu0Ywjd0d9FUQ1+S+GcdLsKNPBXqw34ZBsXtt1y12NZOmDRntTV/hI
	1JORht8jmrZqQGIt3/0QSUAUsd4Vofsx+KtsbS12w6NCgGmPDRbVmWyLVggPYg==
X-Google-Smtp-Source: AGHT+IGEBkCe8UxWdrk/xN55QFQ7zzMqXgyGRdAErZNswuc6RQTxPfIdyypZ63+zbWHL/0f7FaBCAw==
X-Received: by 2002:a17:906:8348:b0:a62:3488:e22f with SMTP id a640c23a62f3a-a6264f129a4mr706201266b.58.1716877260781;
        Mon, 27 May 2024 23:21:00 -0700 (PDT)
Message-ID: <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
Date: Tue, 28 May 2024 08:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 13:08, Oleksii Kurochko wrote:
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> BITS_PER_BYTE was moved to xen/bitops.h as BITS_PER_BYTE is the same
> across architectures.
> 
> The following approach was chosen for generic*() and arch*() bit
> operation functions:
> If the bit operation function that is going to be generic starts
> with the prefix "__", then the corresponding generic/arch function
> will also contain the "__" prefix. For example:
>  * test_bit() will be defined using arch_test_bit() and
>    generic_test_bit().
>  * __test_and_set_bit() will be defined using
>    arch__test_and_set_bit() and generic__test_and_set_bit().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  Reviewed-by: Jan Beulich jbeulich@suse.com? Jan gave his R-by for the previous
>  version of the patch, but some changes were done, so I wasn't sure if I could
>  use the R-by in this patch version.

That really depends on the nature of the changes. Seeing the pretty
long list below, I think it was appropriate to drop the R-b.

> ---
> Changes in V11:
>  - fix identation in generic_test_bit() function.
>  - move definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h

I realize you were asked to do this, but I'm not overly happy with it.
BITS_PER_BYTE is far more similar to BITS_PER_LONG than to
BITOP_BITS_PER_WORD. Plus in any event that change is entirely unrelated
here.

>  - drop the changes in arm64/livepatch.c.
>  - update the the comments on top of functions: generic__test_and_set_bit(),
>    generic__test_and_clear_bit(),  generic__test_and_change_bit(),
>    generic_test_bit().
>  - Update footer after Signed-off section.
>  - Rebase the patch on top of staging branch, so it can be merged when necessary
>    approves will be given.
>  - Update the commit message.
> ---
>  xen/arch/arm/include/asm/bitops.h |  69 -----------
>  xen/arch/ppc/include/asm/bitops.h |  54 ---------
>  xen/arch/ppc/include/asm/page.h   |   2 +-
>  xen/arch/ppc/mm-radix.c           |   2 +-
>  xen/arch/x86/include/asm/bitops.h |  31 ++---
>  xen/include/xen/bitops.h          | 185 ++++++++++++++++++++++++++++++
>  6 files changed, 196 insertions(+), 147 deletions(-)
> 
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -103,8 +103,193 @@ static inline int generic_flsl(unsigned long x)
>   * Include this here because some architectures need generic_ffs/fls in
>   * scope
>   */
> +
> +#define BITOP_BITS_PER_WORD 32
> +typedef uint32_t bitop_uint_t;
> +
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
> +#define BITS_PER_BYTE 8

This, if to be moved at all, very clearly doesn't belong here. As much
as it's unrelated to this change, it's also unrelated to bitops as a
whole.

> +extern void __bitop_bad_size(void);
> +
> +#define bitop_bad_size(addr) (sizeof(*(addr)) < sizeof(bitop_uint_t))
> +
> +/* --------------------- Please tidy above here --------------------- */
> +
>  #include <asm/bitops.h>
>  
> +/**
> + * generic__test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed

Why "examples"? Do you mean "instances"? It's further unclear what
"succeed" and "fail" here mean. The function after all has two
purposes: Checking and setting the specified bit. Therefore I think
you mean "succeed in updating the bit in memory", yet then it's
still unclear what the "appear" here means: The caller has no
indication of success/failure. Therefore I think "appear to" also
wants dropping.

> + * but actually fail.  You must protect multiple accesses with a lock.

That's not "must". An often better alternative is to use the atomic
forms instead. "Multiple" is imprecise, too: "Potentially racy" or
some such would come closer.

Also did Julien(?) really ask that these comments be reproduced on
both the functions supposed to be used throughout the codebase _and_
the generic_*() ones (being merely internal helpers/fallbacks)?

> +/**
> + * generic_test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */

You got carried away updating comments - there's no raciness for
simple test_bit(). As is also expressed by its name not having those
double underscores that the others have.

> +static always_inline bool generic_test_bit(int nr, const volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    const volatile bitop_uint_t *p =
> +        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +
> +    return (*p & mask);
> +}
> +
> +/**
> + * __test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +__test_and_set_bit(int nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_set_bit
> +#define arch__test_and_set_bit generic__test_and_set_bit
> +#endif
> +
> +    return arch__test_and_set_bit(nr, addr);
> +}

See Julien's comments on the earlier version as well as what Andrew has
now done for ffs()/fls(), avoiding the largely pointless fallback
#define.

Jan


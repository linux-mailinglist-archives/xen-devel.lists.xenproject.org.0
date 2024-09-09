Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF997157D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794241.1203027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbnK-0006L3-N6; Mon, 09 Sep 2024 10:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794241.1203027; Mon, 09 Sep 2024 10:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbnK-0006IO-JW; Mon, 09 Sep 2024 10:38:54 +0000
Received: by outflank-mailman (input) for mailman id 794241;
 Mon, 09 Sep 2024 10:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbnJ-0006II-CH
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:38:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3fa2267-6e97-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:38:51 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso4086539a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:38:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d55709sm322476766b.210.2024.09.09.03.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:38:50 -0700 (PDT)
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
X-Inumbo-ID: b3fa2267-6e97-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725878330; x=1726483130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NhD2CUca1QfyvT/olLGq0HvD++x1xCmsd1pHTcd5L5s=;
        b=fNIHu9zTR71ZMt/3R/DWMsC4fTYdYqCBRxi2d9PKELMl8R0rxWtTT0sqy4Q5TmISqN
         0KNQRzN7VN7sTeRTkxcjLo7n9w18FV2q2ZV+HZ0YVe3Hk4tOwrpau9x5GNClnzj5xla8
         vfIVSVe7pR/MtHkXyp9gmyGvdQGsu8IeEp83K+EvcpiXbF/XoerONRYRIkW+XegStfRA
         Gh56TOhbJeFVyqbWjRkCMN5dgU5HXI/g6FJHWNwmQI9mAyDSJMidVoFu0tObJUwNagco
         XIk2+JtC6Y2jb/Hc9aGtRbs/k/tz4R9JShWhnukROB8VSdwfJ2XmxWkIl2QqQJ5DHeao
         A0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725878330; x=1726483130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhD2CUca1QfyvT/olLGq0HvD++x1xCmsd1pHTcd5L5s=;
        b=m0AnPRfWuJOJUpkBXr4g6nwJTGyW4UXaGdduexmO4+hdrWt44iCi616JkLAisfpyZc
         TSEUJTLGB9VtsRGBeIiakr0CVC3OzMnZUQtH89ljMiZZaIQcLcIPE2Hcb2SmGY4J/m4U
         hIRRRHXhY8du5wNQJcyMugM3BIU5zwNCEA1Dhfl+GWZ54KGZVrMEmHq3LTm0OFkgDj+e
         Mg7uPkpK7WlGvi+ASPIdraJ4qf97qM2ags3SfAOuOOQerqeAbnlmpQENOQkYg4GM6dJC
         1K5OwWEsptMm5ognHa4CoSzj0SWrF5p519YPk2LcLNqPOgiFGYdlrpkkGv/R/MzQBZ0C
         oEZA==
X-Forwarded-Encrypted: i=1; AJvYcCWU3m7C0mk4QkBT2jwAmACtnhES6h7MEEvuGUKsB3mAezizjBswMC1u2tvDyNvClW3b8bpEfabsWQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJLOi4rl2ta0/mFhmNL7xLKDD+PrdGPu3e92u2jp/u9pFF9oC/
	fqqPwSl91C5tKuwuJA8OwM/qd9G+nzZUIygZGIVQXSCu0g1a5uuA/CDqBbEndA==
X-Google-Smtp-Source: AGHT+IEehyV37oDBsaa2lmuPKmbfCOV2nC8Ds3OmZQKsRBj4U23wETW5XHS0ThudfSnUCl8dIAIkxw==
X-Received: by 2002:a17:907:1c22:b0:a8d:fa3:bb24 with SMTP id a640c23a62f3a-a8d0fa3c331mr515045066b.23.1725878330304;
        Mon, 09 Sep 2024 03:38:50 -0700 (PDT)
Message-ID: <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
Date: Mon, 9 Sep 2024 12:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Define and use UINT64_C and INT64_C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240909100806.47280-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 12:08, Frediano Ziglio wrote:
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -86,10 +86,10 @@
>  #include <xen/const.h>
>  
>  #define PML4_ENTRY_BITS  39
> -#define PML4_ENTRY_BYTES (_AC(1,UL) << PML4_ENTRY_BITS)
> +#define PML4_ENTRY_BYTES (UINT64_C(1) << PML4_ENTRY_BITS)
>  #define PML4_ADDR(_slot)                              \
> -    (((_AC(_slot, UL) >> 8) * _AC(0xffff000000000000,UL)) | \
> -     (_AC(_slot, UL) << PML4_ENTRY_BITS))
> +    (((UINT64_C(_slot) >> 8) * UINT64_C(0xffff000000000000)) | \
> +     (UINT64_C(_slot) << PML4_ENTRY_BITS))
>  
>  /*
>   * Memory layout:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -20,7 +20,7 @@
>  #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
>  
>  #define PG_shift(idx)   (BITS_PER_LONG - (idx))
> -#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +#define PG_mask(x, idx) (UINT64_C(x) << PG_shift(idx))
>  
>   /* The following page types are MUTUALLY EXCLUSIVE. */
>  #define PGT_none          PG_mask(0, 3)  /* no special uses of this page   */
> @@ -59,7 +59,7 @@
>  
>   /* Count of uses of this frame as its current type. */
>  #define PGT_count_width   PG_shift(9)
> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> +#define PGT_count_mask    ((UINT64_C(1)<<PGT_count_width)-1)
>  
>  /* Are the 'type mask' bits identical? */
>  #define PGT_type_equal(x, y) (!(((x) ^ (y)) & PGT_type_mask))
> @@ -97,7 +97,7 @@
>  #else
>  #define PGC_count_width   PG_shift(6)
>  #endif
> -#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> +#define PGC_count_mask    ((UINT64_C(1)<<PGC_count_width)-1)
>  
>  /*
>   * Page needs to be scrubbed. Since this bit can only be set on a page that is
> @@ -499,9 +499,9 @@ static inline int get_page_and_type(struct page_info *page,
>   */
>  #undef  machine_to_phys_mapping
>  #define machine_to_phys_mapping  ((unsigned long *)RDWR_MPT_VIRT_START)
> -#define INVALID_M2P_ENTRY        (~0UL)
> -#define VALID_M2P(_e)            (!((_e) & (1UL<<(BITS_PER_LONG-1))))
> -#define SHARED_M2P_ENTRY         (~0UL - 1UL)
> +#define INVALID_M2P_ENTRY        (~UINT64_C(0))
> +#define VALID_M2P(_e)            (!((_e) & (UINT64_C(1)<<(BITS_PER_LONG-1))))
> +#define SHARED_M2P_ENTRY         (~UINT64_C(0) - UINT64_C(1))
>  #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
>  
>  /*
> --- a/xen/arch/x86/include/asm/x86_64/page.h
> +++ b/xen/arch/x86/include/asm/x86_64/page.h
> @@ -4,8 +4,8 @@
>  
>  #define __XEN_VIRT_START        XEN_VIRT_START
>  
> -#define VADDR_TOP_BIT           (1UL << (VADDR_BITS - 1))
> -#define CANONICAL_MASK          (~0UL & ~VADDR_MASK)
> +#define VADDR_TOP_BIT           (UINT64_C(1) << (VADDR_BITS - 1))
> +#define CANONICAL_MASK          (~UINT64_C(0) & ~VADDR_MASK)
>  
>  #define is_canonical_address(x) (((long)(x) >> 47) == ((long)(x) >> 63))
>  
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          }
>  
>          if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
> -                     1UL << (PAGE_SHIFT + 32)) )
> +                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
>              e = min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
> -                    1UL << (PAGE_SHIFT + 32));
> +                    UINT64_C(1) << (PAGE_SHIFT + 32));

I disagree - we're dealing with virtual addresses here, which better
wouldn't use fixed-width quantities.

While not always virtual addresses, I similarly disagree for most or all
I've left in context further up: If the underlying type to deal with is
unsigned long, constants should match.

> --- a/xen/crypto/vmac.c
> +++ b/xen/crypto/vmac.c
> @@ -11,7 +11,9 @@
>  #include <xen/types.h>
>  #include <xen/lib.h>
>  #include <crypto/vmac.h>
> +#ifndef UINT64_C
>  #define UINT64_C(x)  x##ULL
> +#endif
>  /* end for Xen */

Here the #define should probably just be dropped?

> --- a/xen/include/crypto/vmac.h
> +++ b/xen/include/crypto/vmac.h
> @@ -51,12 +51,16 @@
>  #elif (_MSC_VER)                  /* Microsoft C does not have stdint.h    */
>  typedef unsigned __int32 uint32_t;
>  typedef unsigned __int64 uint64_t;
> +#ifndef UINT64_C
>  #define UINT64_C(v) v ## UI64
> +#endif

This part surely isn't needed?

> --- a/xen/include/xen/const.h
> +++ b/xen/include/xen/const.h
> @@ -15,10 +15,19 @@
>  #ifdef __ASSEMBLY__
>  #define _AC(X,Y)	X
>  #define _AT(T,X)	X
> +#define UINT64_C(X)     X
> +#define INT64_C(X)      X
>  #else
>  #define __AC(X,Y)	(X##Y)
>  #define _AC(X,Y)	__AC(X,Y)
>  #define _AT(T,X)	((T)(X))
> +#if __SIZEOF_LONG__ >= 8

This is available with gcc 4.3 and newer, yet for now our docs still
specify 4.1.2 as the baseline.

I'm also unconvinced of the >= - we're talking of fixed-width types here,
so imo it needs to be == and then also ...

> +#define UINT64_C(X)     X ## UL
> +#define INT64_C(X)      X ## L
> +#else

#elif __SIZEOF_LONG_LONG__ == 8

here.

> +#define UINT64_C(X)     X ## ULL
> +#define INT64_C(X)      X ## LL
> +#endif
>  #endif

Finally if we introduce these, imo we should introduce the other UINT<n>_C()
as well, and in a header named after the one mandated by the C library spec.

> --- a/xen/include/xen/stdint.h
> +++ b/xen/include/xen/stdint.h
> @@ -30,4 +30,6 @@ typedef __UINT64_TYPE__    uint64_t;
>  
>  #endif
>  
> +#include <xen/const.h>

Why's this needed?

Jan


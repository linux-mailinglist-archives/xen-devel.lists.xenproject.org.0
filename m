Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36122871800
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 09:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688629.1073034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPzc-0004PI-9d; Tue, 05 Mar 2024 08:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688629.1073034; Tue, 05 Mar 2024 08:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPzc-0004NM-5K; Tue, 05 Mar 2024 08:17:44 +0000
Received: by outflank-mailman (input) for mailman id 688629;
 Tue, 05 Mar 2024 08:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhPzb-0004NG-7r
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 08:17:43 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d55bf106-dac8-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 09:17:40 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56781070f38so1039781a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 00:17:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gb18-20020a170907961200b00a3efa4e033asm5730798ejc.151.2024.03.05.00.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 00:17:40 -0800 (PST)
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
X-Inumbo-ID: d55bf106-dac8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709626660; x=1710231460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNryQ+UoJKj1Zusgw6se3JUnddbRrREPTLmiIxV9B9g=;
        b=QsqeZgloKeAR8ctLKgMDTWz61ZFUMciFuKeqi9WQR/Ot1xvPusbaiVZPzekPO1AEzg
         az92pC/a7fwCGcM/R/XUAAd/Ewu/qIu3YyaREKyUkeHk/LXaj/ZMrIyZ5hCnGFyiQXmF
         DUK9uOXZTHDO8KESXJi6OhG8Ep9klrLRTRaVjY9xRmB7PKrVIx3zpjesM/IHGwAy/H07
         n1dFJazxVaYUODHM0nnPQyB1UT3E+5hKy7LxoHVs76456z+dgZkubchWpkXQxfCUxDiA
         oqjRMmAqc7PB3wkqPEVAxw3K0Q8cx5SgF09SHyYwyF/RWW6QlumA29yLCpV6gi2j/+ef
         PNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626660; x=1710231460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNryQ+UoJKj1Zusgw6se3JUnddbRrREPTLmiIxV9B9g=;
        b=Cs3d5wevOOROMGqGYX64zuUfRPY7Hr54ugtBEwptjiAKK6BtvWRUyW0/ZAb3l+nixO
         vip8JotqddLvaXVHDl49QKJzfZ89yGRz/u/ETAXeKtcth4Hbbbhee/WcMlQZGVLjMFOQ
         GIkH2o87PqG5LRo5S5TZdQ/ZIWemI23vYbhQQ59YlpOOXdMZ3K5k9aho7M15x0nUEfQ3
         xAQHNrgvSCU8D1O479roL0fllx35ZrvHFiqKccBu0ZCv9INL5ZnnSYtmbDswrhrmUqly
         Wsu5mOGGrEN55Yicx1P6DPK+x3fu3NZ/sRu0p1vW+erbS74LgDcNy7KBeVlgoJ54qVY0
         Frsw==
X-Forwarded-Encrypted: i=1; AJvYcCWYX62Sb23+jS6y7/DJp255eOzWiJja8h5bItKShgTP6lMzrmcowkrGD7mmsUgqyg5fSuyTL9FTl13x5CmSVZ4/97U0avSPU7P30olIVR4=
X-Gm-Message-State: AOJu0YwmYlAFVD5jnvEublipcAECYQ5o1DTPKL6AKE4DfcprSf/+k6i0
	Osv9CoK2+bgJ9yejoby2pEJi1o+G6NHPtfFPCZTwKQSWmWRAhGnZrEGtjXzEfA==
X-Google-Smtp-Source: AGHT+IF5t1CvBUWCq5XU7aetCd4wlqf3kU7m26ojMg8foU4I8/EmP+h+TtHC4wlPqBSTpaWYSXCBvA==
X-Received: by 2002:a17:906:ce30:b0:a43:f924:d63 with SMTP id sd16-20020a170906ce3000b00a43f9240d63mr1982673ejb.26.1709626660383;
        Tue, 05 Mar 2024 00:17:40 -0800 (PST)
Message-ID: <1aef844e-4ea9-4651-bba7-9e665abb8892@suse.com>
Date: Tue, 5 Mar 2024 09:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/23] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <7f5d859b4dbc0593447ade0b221ece17eda68d1e.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7f5d859b4dbc0593447ade0b221ece17eda68d1e.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:39, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,11 +3,252 @@
>  #ifndef _ASM_RISCV_MM_H
>  #define _ASM_RISCV_MM_H
>  
> +#include <public/xen.h>
> +#include <xen/bug.h>
> +#include <xen/mm-frame.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +
>  #include <asm/page-bits.h>
>  
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>  
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))

va needs parenthesizing here. Also why vaddr_t here but ...

> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> +
> +static inline unsigned long __virt_to_maddr(unsigned long va)
> +{
> +    BUG_ON("unimplemented");
> +    return 0;
> +}
> +
> +static inline void *__maddr_to_virt(unsigned long ma)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +#define virt_to_maddr(va) __virt_to_maddr((unsigned long)(va))
> +#define maddr_to_virt(pa) __maddr_to_virt((unsigned long)(pa))

... unsigned long here? In fact for __maddr_to_virt() I think there
better wouldn't be any cast, such that the compiler can spot if, by
mistake, a pointer type value was passed in. Or, wait, we can go
yet further (also on x86): There are no uses of __maddr_to_virt()
except here. Hence the symbol isn't needed (anymore?) in the first
place.

> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
> +#define __virt_to_mfn(va)  mfn_x(maddr_to_mfn(virt_to_maddr(va)))
> +#define __mfn_to_virt(mfn) maddr_to_virt(mfn_to_maddr(_mfn(mfn)))
> +
> +/*
> + * We define non-underscored wrappers for above conversion functions.
> + * These are overriden in various source files while underscored version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)     __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
> +
> +struct page_info
> +{
> +    /* Each frame can be threaded onto a doubly-linked list. */
> +    struct page_list_entry list;
> +
> +    /* Reference count and various PGC_xxx flags and fields. */
> +    unsigned long count_info;
> +
> +    /* Context-dependent fields follow... */
> +    union {
> +        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
> +        struct {
> +            /* Type reference count and various PGT_xxx flags and fields. */
> +            unsigned long type_info;
> +        } inuse;

Blank line here please.

Jan

> +        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
> +        union {
> +            struct {
> +                /*
> +                 * Index of the first *possibly* unscrubbed page in the buddy.
> +                 * One more bit than maximum possible order to accommodate
> +                 * INVALID_DIRTY_IDX.
> +                 */
> +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
> +                unsigned long first_dirty:MAX_ORDER + 1;
> +
> +                /* Do TLBs need flushing for safety before next page use? */
> +                bool need_tlbflush:1;
> +
> +#define BUDDY_NOT_SCRUBBING    0
> +#define BUDDY_SCRUBBING        1
> +#define BUDDY_SCRUB_ABORT      2
> +                unsigned long scrub_state:2;
> +            };
> +
> +            unsigned long val;
> +        } free;
> +    } u;
> +
> +    union {
> +        /* Page is in use */
> +        struct {
> +            /* Owner of this page (NULL if page is anonymous). */
> +            struct domain *domain;
> +        } inuse;
> +
> +        /* Page is on a free list. */
> +        struct {
> +            /* Order-size of the free chunk this page is the head of. */
> +            unsigned int order;
> +        } free;
> +    } v;
> +
> +    union {
> +        /*
> +         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
> +         * Only valid for: a) free pages, and b) pages with zero type count
> +         */
> +        uint32_t tlbflush_timestamp;
> +    };
> +};



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDB893F6C8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 15:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766739.1177253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQXD-0000a2-Eq; Mon, 29 Jul 2024 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766739.1177253; Mon, 29 Jul 2024 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQXD-0000X3-C4; Mon, 29 Jul 2024 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 766739;
 Mon, 29 Jul 2024 13:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYQXB-0000Wx-Pv
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 13:35:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6af8f524-4daf-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 15:35:28 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso419087166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 06:35:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb9dd3sm510878966b.220.2024.07.29.06.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 06:35:27 -0700 (PDT)
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
X-Inumbo-ID: 6af8f524-4daf-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722260128; x=1722864928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6Sd4G8NrzabDO45pXVJTxJ7sKajI1yRniQmC8+rgZo=;
        b=FkXV+OtNytdGG5EQ7E7FxogUaQ47coTqRQNGc7Qm9q9l730B1+FvHV77lQPNOnBuTz
         21/h6R5RjZ4tPhWU8cLgbKq4gR5Jy1vcIbq05NNu91YBpyZqE139I8ZeFyN85lntDbZ6
         cwZagNPYNT4vdAsIqReKRHvp+k6PeQ/yDeswqRWMdFx7LkylAdlCd//3FBlN06SEkZQ4
         ezUU+i4ZjGrsXmDDrZi0/AbkIEjlmcgRxZu8sFTIb69zOrNFRbzAsuj507f5JiH0Q60J
         la1w2Q2IYFxbF+1mz+hIQBBNbMCwBsRQIwza8bW/1B0LiRHIWSWDBTbfpocBcgnxMkGz
         12Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260128; x=1722864928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6Sd4G8NrzabDO45pXVJTxJ7sKajI1yRniQmC8+rgZo=;
        b=LfFR03a31Iim+m8SBz85IGFV0wsBJByv8s2XG2w47ag26UmH10uPdUiPh4Dlf0XEfC
         ymkZf1YbRK0q14DJo3/iAq6Rkg+vcMr7+7Rg/ezCoL1ZWxQxibIY+Y3xgkCqSPvkmyhI
         jXxd7DHd/v5is9z4NZ5LH+z5EmvtOMcHyU4wjI49Q3UxklCKaFMtH+xEcFgbrKIHPJCb
         TTOFw4yGaw1iHMWwWkNN4BnrqqJlmJT6T4bVndHTlb9P5ZSUQ4aDJT48QWXFzhVdsB5+
         NDWe3mYatDI7Wx0K3pTuf3mHk0R7cL3XptPKvgS6uw5rLp96s7KhDUgTOOqaJRt45eGC
         8OuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNEko9ftnKreWsRKJVHnPUeL0jMNJ9fZgxEcLAgWPW3o9mtffmj67W+mH4hxtE5CC7aKK4FT3A9k5Bn5JJvyNjJNFpP5yGGcUapyUpgJc=
X-Gm-Message-State: AOJu0YyobXWnt23PRztrFvyEJ6ArCXOMy9Ol9JnrmX4Htt8gk+QDJfkZ
	lIeN/nlRksJ3wA2KMZ55rMFuIlXXCG3jNUtDc7RE/DzChBJAHVtp9YzMHun1Ug==
X-Google-Smtp-Source: AGHT+IG8svJHUhBdS89lWMAOwOlcIZ+CFchCL0VhVe3K48NPicC8TBeowD/dB3Erd47TgQikggN+Dw==
X-Received: by 2002:a17:907:2da3:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7d4000978fmr644371266b.26.1722260127515;
        Mon, 29 Jul 2024 06:35:27 -0700 (PDT)
Message-ID: <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
Date: Mon, 29 Jul 2024 15:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> Introduce a function to set up fixmap mappings and L0 page
> table for fixmap.
> 
> Additionally, defines were introduced in riscv/config.h to
> calculate the FIXMAP_BASE address.
> This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
> XEN_VIRT_SIZE, XEN_VIRT_END.
> 
> Also, the check of Xen size was updated in the riscv/lds.S
> script to use XEN_VIRT_SIZE instead of a hardcoded constant.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Yet set_fixmap() isn't introduced here, so effectively it's all dead
code. This could do with mentioning, as I at least would expect
set_fixmap() to be usable once fixmaps are properly set up.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -66,6 +66,14 @@
>  #define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + PAGE_SHIFT)
>  #define SLOTN(slot)             (_AT(vaddr_t, slot) << SLOTN_ENTRY_BITS)
>  
> +#define XEN_VIRT_SIZE           MB(2)
> +
> +#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE)
> +#define BOOT_FDT_VIRT_SIZE      MB(4)
> +
> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
> +
>  #if RV_STAGE1_MODE == SATP_MODE_SV39
>  #define XEN_VIRT_START 0xFFFFFFFFC0000000
>  #elif RV_STAGE1_MODE == SATP_MODE_SV48

Related to my earlier comment: Is there a particular reason that what
you add cannot live _below_ the XEN_VIRT_START definitions, so things
actually appear in order?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fixmap.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * fixmap.h: compile-time virtual memory allocation
> + */
> +#ifndef ASM_FIXMAP_H
> +#define ASM_FIXMAP_H
> +
> +#include <xen/bug.h>
> +#include <xen/page-size.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/page.h>
> +
> +/* Fixmap slots */
> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
> +#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
> +
> +#define FIX_LAST FIX_MISC
> +
> +#define FIXADDR_START FIXMAP_ADDR(0)
> +#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)

This doesn't look right, even if it matches what Arm has. Following
what we have for x86, the page at FIXADDR_TOP should be a guard page,
i.e. not have any mapping ever put there. Whereas you put FIX_MISC's
mapping there. This then results in ...

> +#ifndef __ASSEMBLY__
> +
> +/*
> + * Direct access to xen_fixmap[] should only happen when {set,
> + * clear}_fixmap() is unusable (e.g. where we would end up to
> + * recursively call the helpers).
> + */
> +extern pte_t xen_fixmap[];
> +
> +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
> +
> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> +{
> +    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);

... this being wrong, i.e. triggering for FIX_MISC. Again, same issue
on Arm afaics, just that it would trigger for FIX_PMAP_END there. (Cc-ing
the other two Arm maintainers for that.)

> @@ -81,6 +82,14 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      BUG_ON("unimplemented");
>  }
>  
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    RISCV_FENCE(rw, rw);
> +    *p = pte;
> +    RISCV_FENCE(rw, rw);
> +}

Why the first of the two fences? And isn't having the 2nd here going
to badly affect batch updates of page tables?

> @@ -191,6 +195,49 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>      return is_mode_supported;
>  }
>  
> +void __init setup_fixmap_mappings(void)
> +{
> +    pte_t *pte, tmp;
> +    unsigned int i;
> +
> +    BUILD_BUG_ON(FIX_LAST >= PAGETABLE_ENTRIES);
> +
> +    pte = &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEVEL, FIXMAP_ADDR(0))];
> +
> +    /*
> +     * In RISC-V page table levels are enumerated from Lx to L0 where

Nit: s/enumerated/numbered/ ?

> +     * x is the highest page table level for currect  MMU mode ( for example,
> +     * for Sv39 has 3 page tables so the x = 2 (L2 -> L1 -> L0) ).
> +     *
> +     * In this cycle we want to find L1 page table because as L0 page table
> +     * xen_fixmap[] will be used.
> +     *
> +     * i is defined ( HYP_PT_ROOT_LEVEL - 1 ) becuase pte for L2 ( in
> +     * case of Sv39 ) has been recieved above.
> +     */
> +    for ( i = HYP_PT_ROOT_LEVEL - 1; i != 0; i-- )

I think the subtracting of 1 is unhelpful here. Think of another  case where
you want to walk down to L0. How would you express that with a similar for()
construct. It would imo be more natural to use

    for ( i = HYP_PT_ROOT_LEVEL; i > 1; i-- )

here (and then in that hypothetical other case

    for ( i = HYP_PT_ROOT_LEVEL; i > 0; i-- )

), and then the last part of the comment likely wouldn't be needed either.
However, considering ...

> +    {
> +        BUG_ON(!pte_is_valid(*pte));
> +
> +        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
> +        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];

... the use of i here, it may instead want to be

    for ( i = HYP_PT_ROOT_LEVEL; i-- > 1; )

> +    }
> +
> +    BUG_ON(pte_is_valid(*pte));
> +
> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);

I'm a little puzzled by the use of LINK_TO_LOAD() (and LOAD_TO_LINK() a
little further up) here. Don't you have functioning __pa() and __va()?

> +    write_pte(pte, tmp);
> +
> +    sfence_vma();
> +
> +    printk("(XEN) fixmap is mapped\n");

Why the (XEN) prefix? And perhaps why the printk() in the first place?

Jan


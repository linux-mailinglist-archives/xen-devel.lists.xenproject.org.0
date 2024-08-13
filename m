Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077295027F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 12:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776125.1186275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdooV-0002Em-Nm; Tue, 13 Aug 2024 10:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776125.1186275; Tue, 13 Aug 2024 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdooV-0002DG-Ke; Tue, 13 Aug 2024 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 776125;
 Tue, 13 Aug 2024 10:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdooU-0002DA-AO
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 10:31:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37f9ecba-595f-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 12:31:37 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a611adso6252520a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 03:31:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a60181csm2807547a12.81.2024.08.13.03.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 03:31:35 -0700 (PDT)
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
X-Inumbo-ID: 37f9ecba-595f-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723545096; x=1724149896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PV28B8RaXKQCe4JeltUcrGnKhAKd3yyYoz/77j1uA/Y=;
        b=W9vxD1sgIyxIDoRfPgTL32rcS3mBzIz37fUN9tVUzijuPvZm9AlsZmJukoWlgE9iwX
         URv720kqbRfNzctxLIyef/kUR3bVhV7q6lkM420326Lwc9jan1QLkHYxuI6inEaJXixx
         DgJ0jrhBLrTxOvviyu5APiUb6KTJitzy6gvs0L5KIea1Bz5tzMnmnfHLgNqzPwb8byfI
         jqO0VnPN8EVqkmQD5Xl71db8C3G04LApvBh9RkuO8V2zOEarN89bY8uA8ksGzBdztdJ2
         EiWw9LrPVgNIsyVMF+M/ceGw/iVNZHEXdUDY9KxMgMvhEj3Gp5MMOkQqN83qYojWoxZY
         O8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723545096; x=1724149896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV28B8RaXKQCe4JeltUcrGnKhAKd3yyYoz/77j1uA/Y=;
        b=BDDMgX8M9BN1OUIxKsCMPmo88ORXm8Z/STuUCBTKZuvN/CHOGEDyKJSg2Nlh9C5k74
         27X29LKhChH0YHSzc0mKcte7kZj7idcUm9K6mVwEFKWeQychwANenhpqKzbYOrpXQhj4
         GuoqdxP3wjmElBweZeHEoB1oC5u1Row8BTOwUEHNuayomr3Upgba55eP73P3b4bzecbU
         ybp0vUKzwS7FWKduzLuAJxBqbd9vzG1YN9JEGxD5rWQjDk6MZ+4YskzFI+1rgcRhewYW
         ZpWYitrpntn11ocskZgJfWflVrqgqlpHkGJ+INukZatNj7dFG0/iTfbyvaXu0Zzi1LR6
         BZUw==
X-Forwarded-Encrypted: i=1; AJvYcCUqTYEAhMUcdbRrnfpM7zPL+0LRvR7fpLHoiJv/Te0oRW0jnHmk+OVQrCrIl6ZRvQAZvfJvXwuFfGgHcbWBXwb9o/HvdDAcv7RkWfgc4po=
X-Gm-Message-State: AOJu0Yzlrp82MzSaNGKcAjDvf+NovZp3xyMTSUOucYt5yJ0u9y/jYxpG
	ASblBQx/xTPjoXNOyZF7ncX8Go9SxkqxMEqRRem0uTUsZBFMNGqqXW7/vy49/Na9WQNWAULGfEc
	=
X-Google-Smtp-Source: AGHT+IEdIzy0nvCNlVo7jp8tApjDwmdHf6Uz3JX0iXPVP3yrii+FkZy5KhqFw8Q2W/44Hx1KZBk6QA==
X-Received: by 2002:a05:6402:1d49:b0:5b8:34a9:7fd8 with SMTP id 4fb4d7f45d1cf-5bd44c66d27mr2086198a12.29.1723545096089;
        Tue, 13 Aug 2024 03:31:36 -0700 (PDT)
Message-ID: <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
Date: Tue, 13 Aug 2024 12:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.08.2024 18:19, Oleksii Kurochko wrote:
> Implement map_pages_to_xen() which requires several
> functions to manage page tables and entries:
> - pt_update()
> - pt_mapping_level()
> - pt_update_entry()
> - pt_next_level()
> - pt_check_entry()
> 
> To support these operations, add functions for creating,
> mapping, and unmapping Xen tables:
> - create_xen_table()
> - xen_map_table()
> - xen_unmap_table()

I think I commented on this before: Everything is "Xen" in hypervisor
code. What I think you mean is to map/unmap Xen's own page tables.
Naming-wise that would be {,un}map_xen_table(), though. Since they
are static, just {,un}map_table() ought to be unambiguous, too.

> Introduce internal macros starting with PTE_* for convenience.
> These macros closely resemble PTE bits, with the exception of
> PTE_BLOCK, which indicates that a page larger than 4KB is
> needed.

I did comment on this too, iirc: Is there going to be any case where
large pages are going to be "needed", i.e. not just preferred? If not,
giving the caller control over things the other way around (requesting
4k mappings are needed, as we have it in x86) may be preferable.

Hmm, but then ...

> RISC-V detects superpages using `pte.x` and `pte.r`, as there
> is no specific bit in the PTE for this purpose. From the RISC-V spec:
> ```
>   ...
>   4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to step 5.
>      Otherwise, this PTE is a pointer to the next level of the page table.
>      ... .
>   5. A leaf PTE has been found.
>      ...
>   ...
> ```
> 
> The code doesn’t support super page shattering so 4KB pages are used as
> default.

... you have this. Yet still callers expecting re-mapping in the (large)
range they map can request small-page mappings right away.

> --- a/xen/arch/riscv/include/asm/flushtlb.h
> +++ b/xen/arch/riscv/include/asm/flushtlb.h
> @@ -5,12 +5,25 @@
>  #include <xen/bug.h>
>  #include <xen/cpumask.h>
>  
> +#include <asm/sbi.h>
> +
>  /* Flush TLB of local processor for address va. */
>  static inline void flush_tlb_one_local(vaddr_t va)
>  {
>      asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
>  }
>  
> +/*
> + * Flush a range of VA's hypervisor mappings from the TLB of all
> + * processors in the inner-shareable domain.
> + */
> +static inline void flush_tlb_range_va(vaddr_t va,
> +                                      size_t size)

No need for line wrapping here?

> @@ -33,15 +38,72 @@
>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>  #define PTE_TABLE                   (PTE_VALID)
>  
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
>  #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
>  
>  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>  
> +
> +/*

Nit: As before, no double blank lines please.

> + * There are no such bits in PTE format for RISC-V.

This is an odd way to start a comment: There's nothing for "such" to refer
to.

> + * The code doesn’t support super page shattering so at the moment superpages
> + * can't be used as a default so PTE_BLOCK is introduced to have ability to
> + * tell that superpage should be allocated.
> + * Additionaly as mentioed in RISC-V priviliged spec:
> + * ```
> + *  After much deliberation, we have settled on a conventional page size of
> + *  4 KiB for both RV32 and RV64. We expect this decision to ease the porting
> + *  of low-level runtime software and device drivers.
> + *
> + *  The TLB reach problem is ameliorated by transparent superpage support in
> + *  modern operating systems [2]. Additionally, multi-level TLB hierarchies
> + *  are quite inexpensive relative to the multi-level cache hierarchies whose
> + *  address space they map.
> + *
> + *  [2] Juan Navarro, Sitaram Iyer, Peter Druschel, and Alan Cox. Practical,
> + *      transparent operating system support for superpages.
> + *      SIGOPS Oper. Syst. Rev., 36(SI):89–104, December 2002.
> + * ```
> + *
> + * PTE_POPULATE is introduced to have ability to tell that page tables
> + * shoud be populated.
> + */
> +#define PTE_BLOCK       BIT(10, UL)
> +#define PTE_POPULATE    BIT(11, UL)
> +
> +#define PTE_R_MASK(x)   ((x) & PTE_READABLE)
> +#define PTE_W_MASK(x)   ((x) & PTE_WRITABLE)
> +#define PTE_X_MASK(x)   ((x) & PTE_EXECUTABLE)
> +
> +#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE))
> +
>  /* Calculate the offsets into the pagetables for a given VA */
>  #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
>  
>  #define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK)
>  
> +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U) << PAGETABLE_ORDER) - 1))

Not: Too long line.

> +#if RV_STAGE1_MODE > SATP_MODE_SV48

SV48? Isn't ...

> +#error "need to to update DECLARE_OFFSETS macros"
> +#else
> +
> +#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
> +#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
> +#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
> +
> +/* Generate an array @var containing the offset for each level from @addr */
> +#define DECLARE_OFFSETS(var, addr)          \
> +    const unsigned int var[] = {            \
> +        l0_table_offset(addr),              \
> +        l1_table_offset(addr),              \
> +        l2_table_offset(addr),              \
> +    }

... this for SV39?

> @@ -67,6 +129,20 @@ static inline bool pte_is_valid(pte_t p)
>      return p.pte & PTE_VALID;
>  }
>  
> +inline bool pte_is_table(const pte_t p)
> +{
> +    return ((p.pte & (PTE_VALID |
> +                      PTE_READABLE |
> +                      PTE_WRITABLE |
> +                      PTE_EXECUTABLE)) == PTE_VALID);
> +}
> +
> +static inline bool pte_is_mapping(const pte_t p)
> +{
> +    return (p.pte & PTE_VALID) &&
> +           ((p.pte & PTE_WRITABLE) || (p.pte & PTE_EXECUTABLE));

Shorter as (p.pte & (PTE_WRITABLE | PTE_EXECUTABLE)) ?

> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,408 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/mm.h>
> +#include <xen/mm-frame.h>
> +#include <xen/pmap.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/page.h>
> +
> +static inline const mfn_t get_root_page(void)
> +{
> +    unsigned long root_maddr =

maddr_t or paddr_t?

> +        (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;
> +
> +    return maddr_to_mfn(root_maddr);
> +}
> +
> +/*
> + * Sanity check of the entry
> + * mfn is not valid and we are not populating page table. This means

How does this fit with ...

> + * we either modify entry or remove an entry.
> + */
> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
> +{
> +    /* Sanity check when modifying an entry. */
> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )

... the MFN check here? And why is (valid,INVALID_MFN) an indication
of a modification? But then ...

> +    {
> +        /* We don't allow modifying an invalid entry. */
> +        if ( !pte_is_valid(entry) )
> +        {
> +            printk("Modifying invalid entry is not allowed.\n");
> +            return false;
> +        }

... I also don't understand what this is about. IOW I'm afraid I'm
still confused about the purpose of this function as well as the
transitions you want to permit / reject. I wonder whether the
flags & PTE_VALID and pte_is_valid(entry) aren't in need of swapping.

> +/* Update an entry at the level @target. */
> +static int pt_update_entry(mfn_t root, unsigned long virt,
> +                           mfn_t mfn, unsigned int target,
> +                           unsigned int flags)
> +{
> +    int rc;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> +    pte_t *table;
> +    /*
> +     * The intermediate page tables are read-only when the MFN is not valid
> +     * and we are not populating page table.

The way flags are handled in PTEs, how can page tables be read-only?

> +     * This means we either modify permissions or remove an entry.

From all I can determine we also get here when making brand new entries.
What am I overlooking?

> +     */
> +    bool alloc_only = mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE);
> +    pte_t pte, *entry;
> +
> +    /* convenience aliases */
> +    DECLARE_OFFSETS(offsets, virt);
> +
> +    table = xen_map_table(root);
> +    for ( ; level > target; level-- )
> +    {
> +        rc = pt_next_level(alloc_only, &table, offsets[level]);
> +        if ( rc == XEN_TABLE_MAP_FAILED )
> +        {
> +            rc = 0;
> +
> +            /*
> +             * We are here because pt_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and the pt is read-only). It is a valid case when
> +             * removing a mapping as it may not exist in the page table.
> +             * In this case, just ignore it.
> +             */
> +            if ( flags & PTE_VALID )
> +            {
> +                printk("%s: Unable to map level %u\n", __func__, level);
> +                rc = -ENOENT;
> +            }
> +
> +            goto out;
> +        }
> +        else if ( rc != XEN_TABLE_NORMAL )
> +            break;
> +    }
> +
> +    if ( level != target )
> +    {
> +        printk("%s: Shattering superpage is not supported\n", __func__);
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    entry = table + offsets[level];
> +
> +    rc = -EINVAL;
> +    if ( !pt_check_entry(*entry, mfn, flags) )
> +        goto out;
> +
> +    /* We are removing the page */
> +    if ( !(flags & PTE_VALID) )
> +        memset(&pte, 0x00, sizeof(pte));
> +    else
> +    {
> +        /* We are inserting a mapping => Create new pte. */
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +            pte = pte_from_mfn(mfn, PTE_VALID);
> +        else /* We are updating the permission => Copy the current pte. */
> +            pte = *entry;
> +
> +        /* update permission according to the flags */
> +        pte.pte |= PTE_RWX_MASK(flags) | PTE_ACCESSED | PTE_DIRTY;
> +    }
> +
> +    write_pte(entry, pte);
> +
> +    rc = 0;
> +
> + out:
> +    xen_unmap_table(table);
> +
> +    return rc;
> +}
> +
> +static DEFINE_SPINLOCK(xen_pt_lock);

If you put this in the middle of the file (which is fine), I think it
wants putting immediately ahead of the (first) function using it, not
at some seemingly random place.

> +/*
> + * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
> + * update operation might be related to either populating the table,
> + * destroying a mapping, or modifying an existing mapping.
> + */
> +static int pt_update(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = 0;
> +    unsigned long vfn = virt >> PAGE_SHIFT;
> +    unsigned long left = nr_mfns;
> +
> +    const mfn_t root = get_root_page();
> +
> +    /*
> +     * It is bad idea to have mapping both writeable and
> +     * executable.
> +     * When modifying/creating mapping (i.e PTE_VALID is set),
> +     * prevent any update if this happen.
> +     */
> +    if ( (flags & PTE_VALID) && PTE_W_MASK(flags) && PTE_X_MASK(flags) )
> +    {
> +        printk("Mappings should not be both Writeable and Executable.\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> +    {
> +        printk("The virtual address is not aligned to the page-size.\n");
> +        return -EINVAL;
> +    }
> +
> +    spin_lock(&xen_pt_lock);
> +
> +    while ( left )
> +    {
> +        unsigned int order, level;
> +
> +        level = pt_mapping_level(vfn, mfn, left, flags);
> +        order = XEN_PT_LEVEL_ORDER(level);
> +
> +        ASSERT(left >= BIT(order, UL));
> +
> +        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
> +                                    flags);

Indentation.

> +        if ( rc )
> +            break;
> +
> +        vfn += 1U << order;
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +            mfn = mfn_add(mfn, 1U << order);
> +
> +        left -= (1U << order);

To be on thje safe side, 1UL everywhere?

> +        if ( rc )
> +            break;

There was such a check already a few lines up from here.

> +    }
> +
> +
> +    /* ensure that PTEs are all updated before flushing */

Again: No double blank lines please.

> +    RISCV_FENCE(rw, rw);
> +
> +    /*
> +     * always flush TLB at the end of the function as non-present entries
> +     * can be put in the TLB
> +     */
> +    flush_tlb_range_va(virt, PAGE_SIZE * nr_mfns);

Coming back to "negative" TLB entries: Assuming RISC-V, just like other
architectures, also permits intermediate page table entries to be cached,
the affected VA range may be much larger than the original request, if
intermediate page tables needed creating.

> +    spin_unlock(&xen_pt_lock);

Does this really need to come after fence and flush?

> +    return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    /*
> +     * Ensure that we have a valid MFN before proceeding.
> +     *
> +     * If the MFN is invalid, pt_update() might misinterpret the operation,
> +     * treating it as either a population, a mapping destruction,
> +     * or a mapping modification.
> +     */
> +    ASSERT(!mfn_eq(mfn, INVALID_MFN));

But flags with PTE_VALID not set are fine to come into here?

> +    return pt_update(virt, mfn, nr_mfns, flags);
> +}

Jan


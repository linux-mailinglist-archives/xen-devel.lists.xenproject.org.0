Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A469E960F92
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784155.1193558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixgC-0007SM-5P; Tue, 27 Aug 2024 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784155.1193558; Tue, 27 Aug 2024 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixgC-0007QK-1j; Tue, 27 Aug 2024 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 784155;
 Tue, 27 Aug 2024 15:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sixgA-0005zv-MF
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:00:18 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e437ed-6485-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 17:00:16 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5343617fdddso8331792e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 08:00:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54b488fsm120987566b.92.2024.08.27.08.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:00:15 -0700 (PDT)
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
X-Inumbo-ID: 11e437ed-6485-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724770816; x=1725375616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Un1GmJ+ZgTY+JwsHPVW/Q/0SlZVOhrqdqkfEzJs0DTk=;
        b=LU0CczjT8vwKAweFwd1O6rL6D5yMURIkPnFzD8ZOlEP9rMcWs+EPeGyB1VnYgafQsh
         ky9cyru9WnQsjyRCrNXvBLm6SGkmGkgr4gpePlK/Zz9JmGe/Eip/XI6L7EIC5D6QRU+u
         P7WYIOdeVLGVRQHCcWFIoP6HUSZRKWgYjwjKOIy+iFV+MgGDUgX811UzmXR7XvHJxB2n
         kc5ES+Yw0d3+plnA7XKuv35PTdAxF9Ozv500PfxAKcTFbfT7rEECXivBF2DoW5I6lrY6
         hzpEJ/ZJfBAIc33a5piacaoM4Pz5ivxiLf4T1/nbSuICnNRdMSKY3CjV91c7q8vrAIhM
         AnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724770816; x=1725375616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un1GmJ+ZgTY+JwsHPVW/Q/0SlZVOhrqdqkfEzJs0DTk=;
        b=itkgNCiWnPY1P47rnkgxIEB3sH3vUksUZUWrX4xs5qAGESLlfRkcX7b7rUaPmrEqOZ
         c9Vq+c4Ebo+6PL9P4XHX8Zo/3oUCE/wsHUDtehSplwuVw4a7RLii08HJtFdkZyqiYVab
         RK5TNS3O7lYWkFtT6s7PQ+HjRouOqy8SaL2z/fJjHuODrapeCUYtonIGz38pCVFnsWn9
         QdkkRjvAnFmahmJ2fHJrjKOBAt9oNGsAZt7tTqU25UmX/PdzEb6qNfQKUrtOWISmoDu6
         dFBi+d43Hvkcm56CFoACls/xijvfWDyl6CmSxcRH6rIus6YphuqYa7e7bRr1iepkATz/
         gg+w==
X-Forwarded-Encrypted: i=1; AJvYcCXOnkf2k1EiHA3HgMeBWq5debtm7irGAzttP/J8O0ncSVmuBGvjATzACO3KPsfUFoa77KF1Hbn7YXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYw/Q96yzw4lUziuA2NKXYZYBolhcmCkNLrnj19O5g4ykuMUpJ
	sKEXQDih3I4Et1P3u23uriiQoZd8f4ZhvIGPo9FNgRYfJRfh4LJOL667Bc5m5w==
X-Google-Smtp-Source: AGHT+IE3s33Kj13U6EfMMJOsP0pfXeR0Drv7OXpWlYE6RsY9+hdN+UxYzQptY1QKXBZlJTDFw39Sag==
X-Received: by 2002:a05:6512:ad1:b0:530:ad8d:dcdb with SMTP id 2adb3069b0e04-53438846f81mr12121081e87.19.1724770815789;
        Tue, 27 Aug 2024 08:00:15 -0700 (PDT)
Message-ID: <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
Date: Tue, 27 Aug 2024 17:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 18:06, Oleksii Kurochko wrote:
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
> - create_table()
> - map_table()
> - unmap_table()
> 
> Introduce internal macros starting with PTE_* for convenience.
> These macros closely resemble PTE bits, with the exception of
> PTE_SMALL, which indicates that 4KB is needed.

What macros are you talking about here? Is this partially stale, as
only PTE_SMALL and PTE_POPULATE (and a couple of masks) are being
added?

> --- a/xen/arch/riscv/include/asm/flushtlb.h
> +++ b/xen/arch/riscv/include/asm/flushtlb.h
> @@ -5,12 +5,24 @@
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

Isn't inner-sharable an Arm term? Don't you simply mean "all" here?

> @@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
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

In how far is the READABLE check valid here? You (imo correctly) ...

> +static inline bool pte_is_mapping(const pte_t p)
> +{
> +    return (p.pte & PTE_VALID) &&
> +           (p.pte & (PTE_WRITABLE | PTE_EXECUTABLE));
> +}

... don't consider this bit here.

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -164,6 +164,7 @@
>  #define SSTATUS_SD			SSTATUS64_SD
>  #define SATP_MODE			SATP64_MODE
>  #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> +#define SATP_PPN_MASK			_UL(0x00000FFFFFFFFFFF)
>  
>  #define HGATP_PPN			HGATP64_PPN
>  #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT

This looks odd, padding-wise, but that's because hard tabs are being
used here. Is that intentional?

> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,420 @@
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
> +    paddr_t root_maddr = (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;
> +
> +    return maddr_to_mfn(root_maddr);
> +}
> +
> +/* Sanity check of the entry. */
> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
> +{
> +    /*
> +     * See the comment about the possible combination of (mfn, flags) in
> +     * the comment above pt_update().
> +     */
> +
> +    /* Sanity check when modifying an entry. */
> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
> +    {
> +        /* We don't allow modifying an invalid entry. */
> +        if ( !pte_is_valid(entry) )
> +        {
> +            printk("Modifying invalid entry is not allowed.\n");

Perhaps all of these printk()s should be dprintk()? And not have a full
stop?

> +            return false;
> +        }
> +
> +        /* We don't allow modifying a table entry */
> +        if ( pte_is_table(entry) )
> +        {
> +            printk("Modifying a table entry is not allowed.\n");
> +            return false;
> +        }
> +    }
> +    /* Sanity check when inserting a mapping */
> +    else if ( flags & PTE_VALID )
> +    {
> +        /* We should be here with a valid MFN. */
> +        ASSERT(!mfn_eq(mfn, INVALID_MFN));

This is odd to have here, considering the if() further up.

> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function pt_update() relies on this
> +         * assumption and will skip the TLB flush (when Svvptc
> +         * extension will be ratified). The function will need
> +         * to be updated if the check is relaxed.
> +         */
> +        if ( pte_is_valid(entry) )
> +        {
> +            if ( pte_is_mapping(entry) )
> +                printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> +                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
> +            else
> +                printk("Trying to replace a table with a mapping.\n");
> +            return false;
> +        }
> +    }
> +    /* Sanity check when removing a mapping. */
> +    else if ( (flags & (PTE_VALID | PTE_POPULATE)) == 0 )

The PTE_VALID part of the check is pointless considering the earlier
if(). I guess you may want to have it for doc purposes ...

Since further up you're using "else if ( flags & PTE_VALID )" imo
here you want to use "else if ( !(flags & ...) )".

> +    {
> +        /* We should be here with an invalid MFN. */
> +        ASSERT(mfn_eq(mfn, INVALID_MFN));
> +
> +        /* We don't allow removing a table */
> +        if ( pte_is_table(entry) )
> +        {
> +            printk("Removing a table is not allowed.\n");
> +            return false;
> +        }

Is this restriction temporary?

> +    }
> +    /* Sanity check when populating the page-table. No check so far. */
> +    else
> +    {
> +        ASSERT(flags & PTE_POPULATE);

This again is redundant with earlier if() conditions.

> +#define XEN_TABLE_MAP_FAILED 0
> +#define XEN_TABLE_SUPER_PAGE 1
> +#define XEN_TABLE_NORMAL 2
> +
> +/*
> + * Take the currently mapped table, find the corresponding entry,
> + * and map the next table, if available.
> + *
> + * The alloc_tbl parameters indicates whether intermediate tables should
> + * be allocated when not present.
> + *
> + * Return values:
> + *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
> + *  was empty, or allocating a new page failed.
> + *  XEN_TABLE_NORMAL: next level or leaf mapped normally
> + *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
> + */
> +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)

Having the boolean first is unusual, but well - it's your choice.

> +{
> +    pte_t *entry;
> +    int ret;
> +    mfn_t mfn;
> +
> +    entry = *table + offset;
> +
> +    if ( !pte_is_valid(*entry) )
> +    {
> +        if ( alloc_tbl )
> +            return XEN_TABLE_MAP_FAILED;

Is this condition meant to be inverted?

> +        ret = create_table(entry);
> +        if ( ret )
> +            return XEN_TABLE_MAP_FAILED;

You don't really use "ret". Why not omit the local variable, even
more so that it has too wide scope?

> +/* Update an entry at the level @target. */
> +static int pt_update_entry(mfn_t root, unsigned long virt,
> +                           mfn_t mfn, unsigned int target,
> +                           unsigned int flags)
> +{
> +    int rc;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> +    pte_t *table;
> +    /*
> +     * The intermediate page table shouldn't be allocated when MFN isn't
> +     * valid and we are not populating page table.
> +     * This means we either modify permissions or remove an entry, or
> +     * inserting brand new entry.
> +     *
> +     * See the comment above pt_update() for an additional explanation about
> +     * combinations of (mfn, flags).
> +    */
> +    bool alloc_tbl = mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE);

Is this meant to be inverted, too (to actually match variable name and
comment)?

> +    pte_t pte, *entry;
> +
> +    /* convenience aliases */
> +    DECLARE_OFFSETS(offsets, virt);
> +
> +    table = map_table(root);
> +    for ( ; level > target; level-- )
> +    {
> +        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> +        if ( rc == XEN_TABLE_MAP_FAILED )
> +        {
> +            rc = 0;
> +
> +            /*
> +             * We are here because pt_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and the pt is read-only). It is a valid case when

I'm sorry, but there's still a "read-only" left here.

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

No need for "else" when the earlier if() ends in "goto".

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

When updating an entry, don't you also need to clear (some of) the flags?

> +/* Return the level where mapping should be done */
> +static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
> +                            unsigned int flags)
> +{
> +    unsigned int level = 0;
> +    unsigned long mask;
> +    unsigned int i;
> +
> +    /* Use blocking mapping unless the caller requests 4K mapping */
> +    if ( unlikely(flags & PTE_SMALL) )
> +        return level;
> +
> +    /*
> +     * Don't take into account the MFN when removing mapping (i.e
> +     * MFN_INVALID) to calculate the correct target order.
> +     *
> +     * `vfn` and `mfn` must be both superpage aligned.
> +     * They are or-ed together and then checked against the size of
> +     * each level.
> +     *
> +     * `left` is not included and checked separately to allow
> +     * superpage mapping even if it is not properly aligned (the
> +     * user may have asked to map 2MB + 4k).

What is this about? There's nothing named "left" here.

> +     */
> +    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +    mask |= vfn;
> +
> +    for ( i = HYP_PT_ROOT_LEVEL; i != 0; i-- )
> +    {
> +        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) &&
> +             (nr >= BIT(XEN_PT_LEVEL_ORDER(i), UL)) )
> +        {
> +            level = i;
> +            break;
> +        }
> +    }
> +
> +    return level;
> +}
> +
> +static DEFINE_SPINLOCK(xen_pt_lock);

Another largely meaningless xen_ prefix?

> +/*
> + * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
> + * update operation might be related to either populating the table (
> + * PTE_POPULATE will be set additionaly), destroying a mapping, or modifying
> + * an existing mapping.

And the latter two are distinguished by? PTE_VALID?

> + * If `mfn` is valid and flags has PTE_VALID bit set then it means that
> + * inserting will be done.
> + */

What about mfn != INVALID_MFN and PTE_VALID clear? Also note that "`mfn` is
valid" isn't the same as "mfn != INVALID_MFN". You want to be precise here,
to avoid confusion later on. (I say that knowing that we're still fighting
especially shadow paging code on x86 not having those properly separated.)

> +static int pt_update(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = 0;
> +    unsigned long vfn = virt >> PAGE_SHIFT;

Please don't open-code e.g PFN_DOWN().

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

Seeing them in use, I wonder about the naming of those PTE_?_MASK()
macros. Along with the lhs, why not simply (flags & PTE_...)?

Jan


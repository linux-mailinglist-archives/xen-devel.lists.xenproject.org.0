Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A37984401
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802602.1212904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st37N-0005Vm-GA; Tue, 24 Sep 2024 10:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802602.1212904; Tue, 24 Sep 2024 10:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st37N-0005T2-CN; Tue, 24 Sep 2024 10:50:05 +0000
Received: by outflank-mailman (input) for mailman id 802602;
 Tue, 24 Sep 2024 10:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st37M-00053F-2Z
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:50:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bece2382-7a62-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 12:50:00 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so767281366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:50:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134c8csm68183766b.217.2024.09.24.03.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 03:49:58 -0700 (PDT)
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
X-Inumbo-ID: bece2382-7a62-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727174999; x=1727779799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=27K5vmCiQQVqt+oDUyhnDsN5A+ZAhD89hzVpVdcMzpM=;
        b=DDeo9nVW2guz/2fk0qzvD4a8ccXodAh6qO+qtB9vYkl/iLPX7vYOUFUwWpJm85mlUS
         /oZXbrn3It8ng+IkDyY5gkABICL2/i1eL7EhR4iKbnrXygZA5InargglkAncgCA3v/mi
         sfQHrwqikt/yOhqnxSl0WLB+tMBuNlBQ6njbwGgArDS6Q2LV0yLBc1FiZALApOvwo0hz
         GxlzMWWn8vbPC26+cc5IK2ybraH/HsOcxxCxcy8eMKkrrlPJZ0dO+VHHmn//v1LKZ1+x
         mQPgYGiDJv/8Me7JUUimIgLqJN0Q6dK3dyWivG5wwwhxv8XWEad0EkcO17blMhi12ydi
         FzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174999; x=1727779799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27K5vmCiQQVqt+oDUyhnDsN5A+ZAhD89hzVpVdcMzpM=;
        b=vV4YMyZcwlhrIvfPHHZeaadbBmAtqWH9Jl4k65+L/nYcxdfTwa0EQ83xHHm43xPomZ
         tNf+hevAAV5XptWP/iMH5oRCGm0wD7x10TINNUZIjGLxjc2ajhrV5aParNwgpw7qHBV1
         Y+8QqL0GPrFemLjciKuQqh07dOyzwYDSdD3pxwD8E/dpvCPIGCuhoIQxuBO2goZEv1AB
         aE9x5tw4wXrrfKwn21OQsHjMHKM1sleDdexs9NMpcNr7qf6iZVgyrLuCSZHr0xxlubza
         Q8CqrEuL2pAklSDQbkejEZ/AHmd0d8WpJMoYGgEOzO7yRg+huUPR9FBKvsQcIf0l4geq
         yTzw==
X-Forwarded-Encrypted: i=1; AJvYcCWKUyYe2VAYMOcj6iH7kiird0n6eJPPzY7W+a+VC7nipPbPeqaiMmkq/OS8B0upEQMbqHDbEeeWlco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwbwoTVOHgL7dYRVWmdTc2QcSeuOXyg9pCg/ZREHfy1aMQsyyz
	E65LY+1RFXBaTKLZMFypn5UaaM6RXG32MExcB2NJOk8XiMlntty6i2V5206RpMCP6BEOrvnoh00
	=
X-Google-Smtp-Source: AGHT+IFOQe1YBizzIO+7bXDfAk+2cZxDksDjQaR4YHmIdGn/fMEcWfmIzf0eBzg2tvqO0XHBMEzCIA==
X-Received: by 2002:a17:907:efc7:b0:a8d:439d:5c25 with SMTP id a640c23a62f3a-a90d4fdfe99mr1540424866b.4.1727174999219;
        Tue, 24 Sep 2024 03:49:59 -0700 (PDT)
Message-ID: <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
Date: Tue, 24 Sep 2024 12:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.09.2024 17:57, Oleksii Kurochko wrote:
> @@ -34,15 +39,50 @@
>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>  #define PTE_TABLE                   (PTE_VALID)
>  
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
>  #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
>  
>  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>  
> +/*
> + * The PTE format does not contain the following bits within itself;
> + * they are created artificially to inform the Xen page table
> + * handling algorithm. These bits should not be explicitly written
> + * to the PTE entry.
> + */
> +#define PTE_SMALL       BIT(10, UL)
> +#define PTE_POPULATE    BIT(11, UL)
> +
> +#define PTE_LEAF_MASK   (PTE_WRITABLE | PTE_EXECUTABLE | PTE_VALID)

I continue to have trouble with this. The purpose you use it for has
nothing to do with a "leaf" check. I therefore can only suggest again to
simply drop this constant and expand its use. You don't even need to use
it twice there:

    if ( (flags & PTE_VALID) && (flags & PTE_WRITABLE) &&
         (flags & PTE_EXECUTABLE) )

I'd very much hope the compiler can transform this into a single check,
matching what you have there presently.

> @@ -68,6 +108,52 @@ static inline bool pte_is_valid(pte_t p)
>      return p.pte & PTE_VALID;
>  }
>  
> +/*
> + * From the RISC-V spec:
> + *   The V bit indicates whether the PTE is valid; if it is 0, all other bits
> + *   in the PTE are don’t-cares and may be used freely by software.
> + *
> + *   If V=1 the encoding of PTE R/W/X bits could be find in Table 4.5.

Please avoid using table numbers when not also specifying the precise doc
version. Numbering changes, and it's table 5.5 in the doc I'm looking at.
Use table names instead (also elsewhere of course).

> + *   Table 4.5 summarizes the encoding of the permission bits.
> + *      X W R Meaning
> + *      0 0 0 Pointer to next level of page table.
> + *      0 0 1 Read-only page.
> + *      0 1 0 Reserved for future use.
> + *      0 1 1 Read-write page.
> + *      1 0 0 Execute-only page.
> + *      1 0 1 Read-execute page.
> + *      1 1 0 Reserved for future use.
> + *      1 1 1 Read-write-execute page.
> + */
> +inline bool pte_is_table(const pte_t p)

Missing static?

We normally omit "const" on function arguments; the frequent request to add
missing const is on pointed-to types. If you still want to have it, ...

> +{
> +    /*
> +     * According to the spec if V=1 and W=1 then R also needs to be 1 as
> +     * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
> +     * in ASSERT that if (V==1 && W==1) then R isn't 0.
> +     *
> +     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> +     */
> +    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
> +
> +    return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
> +}
> +
> +static inline bool pte_is_mapping(/*const*/ pte_t p)

... I wonder why it's then commented out here.

> +{
> +    /*
> +     * According to the spec if V=1 and W=1 then R also needs to be 1 as
> +     * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
> +     * in ASSERT that if (V==1 && W==1) then R isn't 0.
> +     *
> +     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> +     */
> +    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));

I don't think the entire comment needs repeating; "See pte_is_table" will
do.

> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,427 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/pmap.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/page.h>
> +
> +static inline const mfn_t get_root_page(void)

const on a return type (and not a pointed-to type) is imo yet more unusual.

> +{
> +    paddr_t root_maddr = pfn_to_paddr(csr_read(CSR_SATP) & SATP_PPN_MASK);
> +
> +    return maddr_to_mfn(root_maddr);
> +}
> +
> +/* Sanity check of the entry. */

For my taste "the entry" is entirely unclear. How about "Sanity check a
page table entry about to be updated as per an (MFN,flags) tuple." And
then ...

> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
> +{
> +    /*
> +     * See the comment about the possible combination of (mfn, flags) in
> +     * the comment above pt_update().
> +     */

... move this comment up there as well.

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
> +{
> +    pte_t *entry;
> +    mfn_t mfn;
> +
> +    entry = *table + offset;
> +
> +    if ( !pte_is_valid(*entry) )
> +    {
> +        if ( !alloc_tbl )
> +            return XEN_TABLE_MAP_FAILED;
> +
> +        if ( create_table(entry) )
> +            return XEN_TABLE_MAP_FAILED;

You're still losing the -ENOMEM here.

> +    }
> +
> +    if ( pte_is_mapping(*entry) )
> +        return XEN_TABLE_SUPER_PAGE;
> +
> +    mfn = mfn_from_pte(*entry);
> +
> +    unmap_table(*table);
> +    *table = map_table(mfn);
> +
> +    return XEN_TABLE_NORMAL;
> +}
> +
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
> +    bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
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
> +             * and the pt couldn't be allocated). It is a valid case when
> +             * removing a mapping as it may not exist in the page table.
> +             * In this case, just ignore it.
> +             */
> +            if ( flags & (PTE_VALID | PTE_POPULATE) )
> +            {
> +                printk("%s: Unable to map level %u\n", __func__, level);

dprintk()?

> +                rc = -ENOMEM;

While you're "restoring" -ENOMEM here, the condition used clear is different
from that used to initialize alloc_tbl. They could be brought in sync, but
imo it would be better to simply not lose the ENOMEM in the first place.

> +            }
> +
> +            goto out;
> +        }
> +
> +        if ( rc != XEN_TABLE_NORMAL )
> +            break;
> +    }
> +
> +    if ( level != target )
> +    {
> +        printk("%s: Shattering superpage is not supported\n", __func__);

dprintk()?

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
> +        /*
> +         * there is also a check in pt_check_entry() which check that
> +         * mfn=INVALID_MFN
> +         */

Nit: Comments are to start with a capital letter.

> +        pte.pte = 0;
> +    else
> +    {
> +        /* We are inserting a mapping => Create new pte. */
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +            pte = pte_from_mfn(mfn, PTE_VALID);
> +        else /* We are updating the permission => Copy the current pte. */
> +        {
> +            pte = *entry;
> +            pte.pte &= ~(flags & PTE_ACCESS_MASK);

Why does "flags" need using here? Simply clearing all PTE_ACCESS_MASK bits
will do, won't it? And only that will guarantee that flags which are to be
clear will actually be cleared.

> +/*
> + * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
> + * update operation might be related to either:
> + *   - populating the table (PTE_POPULATE will be set additionaly),
> + *   - destroying a mapping (PTE_VALID=0),
> + *   - modifying an existing mapping (PTE_VALID=1).
> + *
> + * If `mfn` != INVALID_MFN and flags has PTE_VALID bit set then it means that
> + * inserting will be done.
> + */
> +static int pt_update(unsigned long virt,

Don't you have vaddr_t for variables/parameters like this one?

> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = 0;
> +    unsigned long vfn = PFN_DOWN(virt);
> +    unsigned long left = nr_mfns;
> +
> +    const mfn_t root = get_root_page();

Why the blank line between adjacent declarations?

> +    /*
> +     * It is bad idea to have mapping both writeable and
> +     * executable.
> +     * When modifying/creating mapping (i.e PTE_VALID is set),
> +     * prevent any update if this happen.
> +     */
> +    if ( (flags & PTE_LEAF_MASK) == PTE_LEAF_MASK )
> +    {
> +        printk("Mappings should not be both Writeable and Executable\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> +    {
> +        printk("The virtual address is not aligned to the page-size\n");
> +        return -EINVAL;
> +    }

Yet more dprintk() candidates.

Jan


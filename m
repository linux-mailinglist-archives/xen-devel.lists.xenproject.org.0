Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E433BA8E1
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 16:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149506.276496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzgTV-0008Se-Cf; Sat, 03 Jul 2021 14:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149506.276496; Sat, 03 Jul 2021 14:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzgTV-0008QR-9S; Sat, 03 Jul 2021 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 149506;
 Sat, 03 Jul 2021 14:18:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzgTT-0008QL-SQ
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 14:18:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzgTS-0004DU-S8; Sat, 03 Jul 2021 14:18:26 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzgTS-00047J-M3; Sat, 03 Jul 2021 14:18:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bRemhQ55eR5N+qtxTTz/MFJuQxVe1NVLs8GT4w9nAH0=; b=fztnM04/UR1wONB2/4DJOpiDXA
	e2zfSGzXpiOyzUjjT4vwAic0Z20NhaF43aYqwiizKHRa1ctlthZp2GRbioiEcqYWviuEe9Ob51jCE
	Ie59YwIaLjWw2CH2rb/czF2UigJofq6NY5hzZ0q6eU1cl0AtgOsUKROTNkQHkGtXfB7I=;
Subject: Re: [PATCH 9/9] xen/arm: introduce allocate_static_memory
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-10-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2dc9387c-1c6c-70af-5bf5-8b606b62cc79@xen.org>
Date: Sat, 3 Jul 2021 15:18:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607024318.3988467-10-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2021 03:43, Penny Zheng wrote:
> This commit introduces allocate_static_memory to allocate static memory as
> guest RAM for Domain on Static Allocation.
> 
> It uses alloc_domstatic_pages to allocate pre-configured static memory banks
> for this domain, and uses guest_physmap_add_page to set up P2M table.
> These pre-defiend static memory ranges shall be firstly mapped to the
> fixed guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
> `GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`.
> `GUEST_RAM0` may take up several pre-defined physical RAM regions.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - rename the values, like prefix it g/p
> - fix the scalability issue
> - allocate when parse
> ---
>   xen/arch/arm/domain_build.c | 155 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4166d7993c..63b6a97b2c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -437,6 +437,48 @@ static bool __init allocate_bank_memory(struct domain *d,
>       return true;
>   }
>   
> +/*
> + * Static memory bank at #smfn of #gsize shall be mapped to #sgfn of #gsize,
> + * and #sgfn will be next guest address to map when returning.
> + */
> +static bool __init allocate_static_bank_memory(struct domain *d,
> +                                               struct kernel_info *kinfo,
> +                                               int gbank,

Please use unsigned int for index.

> +                                               gfn_t* sgfn,
> +                                               mfn_t smfn,
> +                                               paddr_t gsize)

This function doesn't allocate memory and neither a "bank" per-se. So 
would suggest to rename to (or something similar):

append_static_memory_to_bank()

Also, I don't think you need all those parameters. You can infer the 
next GFN to use from the bank information. So how about something like:

static bool __init append_static_memory_to_bank(struct domain *d,
                                                 struct membank *bank,
                                                 mfn_t smfn,
                                                 paddr_t size)
{
    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);

    [....]
}

> +{
> +    int res;
> +    paddr_t tot_size = gsize;
> +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;

I don't like the idea of introducing rambase here. Can't the bank be 
initialized in the caller?

> +
> +    while ( tot_size > 0 )
> +    {
> +        unsigned int order = get_allocation_size(tot_size);
> +
> +        res = guest_physmap_add_page(d, *sgfn, smfn, order);
> +        if ( res )
> +        {
> +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +            return false;
> +        }
> +
> +        *sgfn = gfn_add(*sgfn, 1UL << order);
> +        smfn = mfn_add(smfn, 1UL << order);
> +        tot_size -= (1ULL << (PAGE_SHIFT + order));
> +    }
> +
> +    /* Guest RAM bank in kinfo hasn't been initialized. */
> +    if ( gbank == kinfo->mem.nr_banks )
> +    {
> +        kinfo->mem.bank[gbank].start = rambase[gbank];
> +        kinfo->mem.nr_banks++;
> +    }
> +    kinfo->mem.bank[gbank].size += gsize;
> +
> +    return true;
> +}
> +
>   static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)

It feels a bit odd that the two functions you introduced are not 
together. Can they be moved together?

>   {
>       unsigned int i;
> @@ -480,6 +522,116 @@ fail:
>             (unsigned long)kinfo->unassigned_mem >> 10);
>   }
>   
> +/* Allocate memory from static memory as RAM for one specific domain d. */
> +static u64 __init allocate_static_memory(struct domain *d,
> +                                          struct kernel_info *kinfo,
> +                                          const struct dt_device_node *node)
> +{
> +    int nr_banks, bank = 0, gbank = 0;
> +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
> +    const __be32 *cell;
> +    const struct dt_property *prop;
> +    struct dt_device_node *static_mem_node;
> +    const struct dt_device_node *parent = dt_find_node_by_path("/reserved-memory");
> +    u32 addr_cells = 2, size_cells = 2, reg_cells;
> +    u64 tot_size;
> +
> +    paddr_t pbase, psize, gsize;
> +    gfn_t sgfn;
> +    mfn_t smfn;
> +
> +    kinfo->mem.nr_banks = 0;
> +    /* Start with GUEST_RAM0. */
> +    gsize = ramsize[gbank];
> +    sgfn = gaddr_to_gfn(rambase[gbank]);
> +
> +    /* Parse phandle in `xen,static-mem`. */
> +    static_mem_node = dt_parse_phandle(node, "xen,static-mem", 0);
> +    if ( !static_mem_node )
> +        goto fail;
> +
> +    /*
> +     * #address-cells and #size-cells must be consistent with the parent node,
> +     * "reserved-memory".
> +     */
> +    dt_property_read_u32(parent, "#address-cells", &addr_cells);
> +    dt_property_read_u32(parent, "#size-cells", &size_cells);

The return for dt_property_read_u32() should be checked.

> +    BUG_ON(size_cells > 2 || addr_cells > 2);
> +    reg_cells = addr_cells + size_cells;
> +
> +    prop = dt_find_property(static_mem_node, "reg", NULL);
> +    if ( !prop )
> +        goto fail;
> +    cell = (const __be32 *)prop->value;
> +    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +    BUG_ON(nr_banks > NR_MEM_BANKS);
> +
> +    while ( bank < nr_banks )
> +    {
> +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);

We seem to have quite a few functions now that will iterate over "regs". 
It would be worth considering to introduce a helper to iterate it.

> +        tot_size += (u64)psize;

This cast seems unnecessary.

> +        smfn = maddr_to_mfn(pbase);
> +
> +        if ( !alloc_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0) )
> +        {
> +            printk(XENLOG_ERR
> +                    "%pd: cannot allocate static memory"
> +                    "(0x%"PRIpaddr" - 0x%"PRIpaddr")",
> +                    d, pbase, pbase + psize);
> +            goto fail;
> +        }
> +
> +        printk(XENLOG_INFO "%pd STATIC BANK[%d] %#"PRIpaddr"-%#"PRIpaddr"\n",
> +               d, bank, pbase, pbase + psize);
> +
> +        /*
> +         * It shall be mapped to the fixed guest RAM address rambase[i],
> +         * And until it exhausts the ramsize[i], it will seek to the next
> +         * rambase[i+1].
> +         */
> +        while ( 1 )
> +        {
> +            if ( gsize >= psize )
> +            {
> +                if ( !allocate_static_bank_memory(d, kinfo, gbank,
> +                                                  &sgfn, smfn, psize) )
> +                    goto fail;
> +
> +                gsize = gsize - psize;
> +                bank++;
> +                break;
> +            }
> +            else
> +            {
> +                if ( !allocate_static_bank_memory(d, kinfo, gbank,
> +                                                  &sgfn, smfn, gsize) )
> +                    goto fail;
> +
> +                /*
> +                 * Physical bank hasn't been totally mapped,
> +                 * seeking to the next guest RAM i+1, if exist.
> +                 */
> +                if ( ++gbank < GUEST_RAM_BANKS )
> +                {
> +                    psize = psize - gsize;
> +                    smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
> +                    gsize = ramsize[gbank];
> +                    sgfn = gaddr_to_gfn(rambase[gbank]);
> +                }
> +                else
> +                    goto fail;
> +            }

The double loop is not nice but I can't think of a better way. However, 
I think the code in the loop can be simplified. You could write 
something like:

/* Map as much as possible the static range to the guest bank */
if ( !allocate_static_bank(..., min(psize, gsize) )
   goto fail;

/* The physical bank is fully mapped. Handle the next bank. */
if ( gsize >= psize )
{
     gsize = gsize - psize;
     bank++;
     break;
}
/* We still have memory to map. Check if we have another guest bank 
available */
else if ( ++gbank > GUEST_RAM_BANKS ) {
    printk("Exhausted the number of guest bank\n");
    goto fail;
}

[Update to the next guest bank]

> +        }
> +    }
> +    return tot_size;
> +
> +fail:
> +    panic("Failed to allocate requested static memory for domain %pd."
> +          "Fix the VMs configurations.\n",
> +          d);
> +}
> +
>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                                      const struct dt_device_node *node)
>   {
> @@ -2437,8 +2589,7 @@ static int __init construct_domU(struct domain *d,
>       if ( prop )
>       {
>           static_mem = true;
> -        /* static_mem_size = allocate_static_memory(...); */
> -        BUG();
> +        static_mem_size = allocate_static_memory(d, &kinfo, node);
>       }
>   
>       rc = dt_property_read_u64(node, "memory", &mem);
> 

Cheers,

-- 
Julien Grall


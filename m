Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DED404223
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 02:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182530.330130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7iq-00061d-5r; Thu, 09 Sep 2021 00:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182530.330130; Thu, 09 Sep 2021 00:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7iq-0005yk-1o; Thu, 09 Sep 2021 00:15:20 +0000
Received: by outflank-mailman (input) for mailman id 182530;
 Thu, 09 Sep 2021 00:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO7io-0005ye-QG
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 00:15:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 461a176c-f192-40a3-8404-a8636a37d0c2;
 Thu, 09 Sep 2021 00:15:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 928BC610C8;
 Thu,  9 Sep 2021 00:15:16 +0000 (UTC)
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
X-Inumbo-ID: 461a176c-f192-40a3-8404-a8636a37d0c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631146516;
	bh=pPBd4WRGm7Ra0PUJuOXWjZjygWQ5emFJWMiCDbGxX9U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dnUHbrxZtU3w3icH/gSKVZ63FWAuigVRhSdIcLnLEZHT1Y6nQUxgi3wxAYfDSIH61
	 e7ydnOqfhdBFqcG9uxpasJ0/HrUpgjpPZNbU7Osd4LewWnM1i0ESsFGU9+GAJU0x2Z
	 8Id4tRvzjjALCN8X6hWQTeK72DSlwxMx8q8EV47gfNM8lcenSiHhL3+ObSyEc9YQYZ
	 YFtdZAvypO71XpWAx8DNm4C9HdOnu7jpFskyBJbt9vBdIEzc+5W5DNyX12PyKKAqeT
	 XpPEIQKKXrNxbjKETatt3x5gJVE4Rry7r8cKirM+lCydCpDglXbm6douugrYMB0zaj
	 UCm00HlbZdwZg==
Date: Wed, 8 Sep 2021 17:15:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 7/7] xen/arm: introduce allocate_static_memory
In-Reply-To: <20210908095248.545981-8-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081709370.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-8-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> This commit introduces a new function allocate_static_memory to allocate
> static memory as guest RAM for Domain on Static Allocation.
                             ^ for domains.

> It uses acquire_domstatic_pages to acquire pre-configured static memory
> for this domain, and uses guest_physmap_add_pages to set up P2M table.
      ^ the                                                  ^the 

> These pre-defined static memory banks shall be mapped to the usual guest
> memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> xen/include/public/arch-arm.h.
> 
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
> a new function guest_physmap_add_pages to cope with adding guest RAM p2m
> mapping with nr_pages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 161 +++++++++++++++++++++++++++++++++++-
>  xen/arch/arm/p2m.c          |   7 +-
>  xen/include/asm-arm/p2m.h   |  11 +++
>  3 files changed, 173 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 206038d1c0..b011cc4789 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -480,6 +480,162 @@ fail:
>            (unsigned long)kinfo->unassigned_mem >> 10);
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +static bool __init append_static_memory_to_bank(struct domain *d,
> +                                                struct membank *bank,
> +                                                mfn_t smfn,
> +                                                paddr_t size)
> +{
> +    int res;
> +    unsigned int nr_pages = PFN_DOWN(size);
> +    /* Infer next GFN. */
> +    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +
> +    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
> +    if ( res )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
> +        return false;
> +    }
> +
> +    bank->size = bank->size + size;
> +
> +    return true;
> +}
> +
> +/* Allocate memory from static memory as RAM for one specific domain d. */
> +static void __init allocate_static_memory(struct domain *d,
> +                                          struct kernel_info *kinfo,
> +                                          const struct dt_device_node *node)
> +{
> +    const struct dt_property *prop;
> +    u32 addr_cells, size_cells, reg_cells;
> +    unsigned int nr_banks, gbank, bank = 0;
> +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
> +    const __be32 *cell;
> +    u64 tot_size = 0;
> +    paddr_t pbase, psize, gsize;
> +    mfn_t smfn;
> +    int res;
> +
> +    prop = dt_find_property(node, "xen,static-mem", NULL);
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> +                               &addr_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
> +        goto fail;
> +    }
> +
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> +                               &size_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
> +        goto fail;
> +    }
> +    reg_cells = addr_cells + size_cells;
> +
> +    /*
> +     * The static memory will be mapped in the guest at the usual guest memory
> +     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> +     * xen/include/public/arch-arm.h.
> +     */
> +    gbank = 0;
> +    gsize = ramsize[gbank];
> +    kinfo->mem.bank[gbank].start = rambase[gbank];
> +
> +    cell = (const __be32 *)prop->value;
> +    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +
> +    for ( ; bank < nr_banks; bank++ )
> +    {
> +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> +
> +        smfn = maddr_to_mfn(pbase);
> +        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pd: failed to acquire static memory: %d.\n", d, res);
> +            goto fail;
> +        }
> +
> +        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
> +               d, bank, pbase, pbase + psize);
> +
> +        while ( 1 )
> +        {
> +            /* Map as much as possible the static range to the guest bank */
> +            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
> +                                               min(psize, gsize)) )
> +                goto fail;
> +
> +            /*
> +             * The current physical bank is fully mapped.
> +             * Handle the next physical bank.
> +             */
> +            if ( gsize >= psize )
> +            {
> +                gsize = gsize - psize;
> +                break;
> +            }
> +            /*
> +             * When current guest bank is not enough to map, exhaust
> +             * the current one and seek to the next.
> +             * Before seeking to the next, check if we still have available
> +             * guest bank.
> +             */
> +            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
> +            {
> +                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
> +                goto fail;
> +            }
> +            else
> +            {
> +                psize = psize - gsize;
> +                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
> +                /* Update to the next guest bank. */
> +                gbank++;
> +                gsize = ramsize[gbank];
> +                kinfo->mem.bank[gbank].start = rambase[gbank];
> +            }
> +        }
> +
> +        tot_size += psize;
> +    }
> +
> +    kinfo->mem.nr_banks = ++gbank;
> +
> +    kinfo->unassigned_mem -= tot_size;
> +    /*
> +     * The property 'memory' should match the amount of memory given to the
> +     * guest.
> +     * Currently, it is only possible to either acquire static memory or let
> +     * Xen allocate. *Mixing* is not supported'.
                                                 ^ stray '

These are all NITs that I'd be happy to fix on commit if the series
doesn't need another update.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>




> +     */
> +    if ( kinfo->unassigned_mem )
> +    {
> +        printk(XENLOG_ERR
> +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
> +        goto fail;
> +    }
> +
> +    return;
> +
> + fail:
> +    panic("Failed to allocate requested static memory for domain %pd.", d);
> +}
> +#else
> +static void __init allocate_static_memory(struct domain *d,
> +                                          struct kernel_info *kinfo,
> +                                          const struct dt_device_node *node)
> +{
> +}
> +#endif
> +
>  static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                                     const struct dt_device_node *node)
>  {
> @@ -2453,7 +2609,10 @@ static int __init construct_domU(struct domain *d,
>      /* type must be set before allocate memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    allocate_memory(d, &kinfo);
> +    if ( !dt_find_property(node, "xen,static-mem", NULL) )
> +        allocate_memory(d, &kinfo);
> +    else
> +        allocate_static_memory(d, &kinfo, node);
>  
>      rc = prepare_dtb_domU(d, &kinfo);
>      if ( rc < 0 )
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index eff9a105e7..6e01e83967 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1293,11 +1293,8 @@ out:
>      return resolved;
>  }
>  
> -static inline int p2m_insert_mapping(struct domain *d,
> -                                     gfn_t start_gfn,
> -                                     unsigned long nr,
> -                                     mfn_t mfn,
> -                                     p2m_type_t t)
> +int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
> +                       mfn_t mfn, p2m_type_t t)
>  {
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>      int rc;
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 6a2108398f..f885cc522b 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -300,6 +300,9 @@ int map_dev_mmio_region(struct domain *d,
>                          unsigned long nr,
>                          mfn_t mfn);
>  
> +int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
> +                       mfn_t mfn, p2m_type_t t);
> +
>  int guest_physmap_add_entry(struct domain *d,
>                              gfn_t gfn,
>                              mfn_t mfn,
> @@ -315,6 +318,14 @@ static inline int guest_physmap_add_page(struct domain *d,
>      return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
>  }
>  
> +static inline int guest_physmap_add_pages(struct domain *d,
> +                                          gfn_t gfn,
> +                                          mfn_t mfn,
> +                                          unsigned int nr_pages)
> +{
> +    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
> +}
> +
>  mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
>  
>  /* Look up a GFN and take a reference count on the backing page. */
> -- 
> 2.25.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4173FF644
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 23:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177689.323291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLudV-0002fj-Rb; Thu, 02 Sep 2021 21:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177689.323291; Thu, 02 Sep 2021 21:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLudV-0002d8-Oa; Thu, 02 Sep 2021 21:52:41 +0000
Received: by outflank-mailman (input) for mailman id 177689;
 Thu, 02 Sep 2021 21:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLudT-0002d2-Oy
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 21:52:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01f29d1e-e211-4a89-b018-7e9f5ee1dd14;
 Thu, 02 Sep 2021 21:52:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1C56610CF;
 Thu,  2 Sep 2021 21:52:37 +0000 (UTC)
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
X-Inumbo-ID: 01f29d1e-e211-4a89-b018-7e9f5ee1dd14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630619557;
	bh=1Qb985OcOh2tmU7a/TZayFbUIxluyDo779n2s/w0LyQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JU397CrVf7uaDaPJVR/aIYQyzKcG16haazs+tJKg0zlTLnZbzoW4U/a4Wnm5kKWnW
	 r6OKKbLLdlpcFBgkTXWVVjlhjaayWukx4z9Qe+pkjb0uSreJB+SzoHPFndxNdACb0s
	 Ho3gvS19ltu6nzqZQJ4dJL71F2VbWIwgqeuyZZlqxoQvHU3anRr0W+9us6dniwmC/I
	 NleDywM/jBOjJKLeRShFw/vNgUNfKLrC8MG9WBpr1PLkroQFHsN9e9M9SVZeo9WMQ+
	 Ojxnq4FTYZAQ11I71fHPUAdJEaKhfbn40M/oeeR7q9zgvEFQZrGVUYorjkuZHVzfIG
	 hnUFbrwymNnOw==
Date: Thu, 2 Sep 2021 14:52:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
Subject: Re: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
In-Reply-To: <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109021451070.26072@sstabellini-ThinkPad-T480s>
References: <20210824095045.2281500-1-penny.zheng@arm.com> <20210824095045.2281500-8-penny.zheng@arm.com> <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Sep 2021, Stefano Stabellini wrote:
> On Tue, 24 Aug 2021, Penny Zheng wrote:
> > This commit introduces allocate_static_memory to allocate static memory as
> > guest RAM for Domain on Static Allocation.
> > 
> > It uses acquire_domstatic_pages to acquire pre-configured static memory
> > for this domain, and uses guest_physmap_add_pages to set up P2M table.
> > These pre-defined static memory banks shall be mapped to the fixed guest RAM
> > banks. And only when they exhausts the current guest RAM bank, it will seek
> > to the next one.
> > 
> > In order to deal with the trouble of count-to-order conversion when page number
> > is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
> > a new function guest_physmap_add_pages to cope with adding guest RAM p2m
> > mapping with nr_pages.
> > 
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> > v5 changes:
> > - don't split comment over multi-line (even they are more than 80 characters)
> > - simply use dt_find_property(node, "xen,static-mem", NULL) to tell
> > whether using allocate_static_memory, and add error comment when
> > "xen,static-mem" is used but CONFIG_STATIC_MEMORY is not enabled.
> > - exporting p2m_insert_mapping() and introduce guest_physmap_add_pages
> > to cope with adding guest RAM p2m mapping with nr_pages.
> > - check both pbase and psize are page aligned
> > - simplify the code in the loops by moving append_static_memory_to_bank()
> > outside of the if/else.
> > ---
> >  xen/arch/arm/domain_build.c | 156 +++++++++++++++++++++++++++++++++++-
> >  xen/arch/arm/p2m.c          |   7 +-
> >  xen/include/asm-arm/p2m.h   |  11 +++
> >  3 files changed, 168 insertions(+), 6 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6c86d52781..843b8514c7 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -480,6 +480,148 @@ fail:
> >            (unsigned long)kinfo->unassigned_mem >> 10);
> >  }
> >  
> > +#ifdef CONFIG_STATIC_MEMORY
> > +static bool __init append_static_memory_to_bank(struct domain *d,
> > +                                                struct membank *bank,
> > +                                                mfn_t smfn,
> > +                                                paddr_t size)
> > +{
> > +    int res;
> > +    unsigned int nr_pages = size >> PAGE_SHIFT;
>                                ^ PFN_DOWN
> 
> 
> > +    /* Infer next GFN. */
> > +    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> > +
> > +    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
> > +    if ( res )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
> > +        return false;
> > +    }
> > +
> > +    bank->size = bank->size + size;
> > +
> > +    return true;
> > +}
> > +
> > +/* Allocate memory from static memory as RAM for one specific domain d. */
> > +static void __init allocate_static_memory(struct domain *d,
> > +                                          struct kernel_info *kinfo,
> > +                                          const struct dt_device_node *node)
> > +{
> > +    const struct dt_property *prop;
> > +    u32 addr_cells, size_cells, reg_cells;
> > +    unsigned int nr_banks, gbank = 0, bank = 0;
> > +    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> > +    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
> > +    const __be32 *cell;
> > +    u64 tot_size = 0;
> > +    paddr_t pbase, psize, gsize;
> > +    mfn_t smfn;
> > +    int res;
> > +
> > +    prop = dt_find_property(node, "xen,static-mem", NULL);
> > +    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> > +                               &addr_cells) )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
> > +        goto fail;
> > +    }
> > +
> > +    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> > +                               &size_cells) )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
> > +        goto fail;
> > +    }
> > +    reg_cells = addr_cells + size_cells;
> > +
> > +    /* Start with GUEST_RAM0. */
> > +    gsize = ramsize[gbank];
> > +    kinfo->mem.bank[gbank].start = rambase[gbank];
> > +
> > +    cell = (const __be32 *)prop->value;
> > +    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> > +
> > +    for ( ; bank < nr_banks; bank++ )
> > +    {
> > +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> > +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> > +
> > +        smfn = maddr_to_mfn(pbase);
> > +        res = acquire_domstatic_pages(d, smfn, psize >> PAGE_SHIFT, 0);
>                                                   ^ PFN_DOWN(psize)
> 
> 
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR
> > +                   "%pd: failed to acquire static memory: %d.\n", d, res);
> > +            goto fail;
> > +        }
> > +
> > +        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
> > +               d, bank, pbase, pbase + psize);
> > +
> > +        /*
> > +         * It shall be mapped to the fixed guest RAM banks(GUEST_RAM_BANK_BASES),
> > +         * And only when it exhausts the current guest RAM bank, it will seek
> > +         * to the next.
> > +         */
> > +        while ( 1 )
> > +        {
> > +            /* Map as much as possible the static range to the guest bank */
> > +            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
> > +                                               min(psize, gsize)) )
> > +                goto fail;
> > +
> > +            /*
> > +             * The current physical bank is fully mapped.
> > +             * Handle the next physical bank.
> > +             */
> > +            if ( gsize >= psize )
> > +            {
> > +                gsize = gsize - psize;
> > +                break;
> > +            }
> > +            /*
> > +             * When current guest bank size is not enough to map.
> > +             * Before seeking to the next, check if we still have available
> > +             * guest bank.
> > +             */
> > +            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
> > +            {
> > +                printk(XENLOG_ERR "Exhausted all fixed guest banks.\n");
> > +                goto fail;
> > +            }
> > +            else
> > +            {
> > +                psize = psize - gsize;
> > +                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
>                                         ^ PFN_DOWN
> 
> 
> > +                /* Update to the next guest bank. */
> > +                gbank++;
> > +                gsize = ramsize[gbank];
> > +                kinfo->mem.bank[gbank].start = rambase[gbank];
> > +            }
> > +        }
> > +
> > +        tot_size += psize;
> > +    }
> > +
> > +    kinfo->mem.nr_banks = ++gbank;
> > +    kinfo->unassigned_mem -= tot_size;
> > +    if ( kinfo->unassigned_mem )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
> > +        goto fail;
> 
> Do we need to make this a fatal failure?
> 
> I am asking because unassigned_mem comes from the "memory" property of
> the domain in device tree which is kind of redundant with the
> introduction of xen,static-mem. In fact, I think it would be better to
> clarify the role of "memory" when "xen,static-mem" is also present.
> In that case, we could even make "memory" optional.
> 
> In any case, even if we don't make "memory" optional, it might still be
> good to turn this error into a warning and ignore the remaining
> kinfo->unassigned_mem.

One more thing: if we decide to make "memory" optional, we need to avoid
failing if it is not present at the beginning of construct_domU (if
xen,static-mem is present).


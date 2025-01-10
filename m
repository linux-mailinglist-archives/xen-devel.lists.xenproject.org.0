Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E9A083F9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 01:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869187.1280660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2rr-0007dz-8H; Fri, 10 Jan 2025 00:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869187.1280660; Fri, 10 Jan 2025 00:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2rr-0007bE-5C; Fri, 10 Jan 2025 00:27:15 +0000
Received: by outflank-mailman (input) for mailman id 869187;
 Fri, 10 Jan 2025 00:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tW2rp-0007b8-Ok
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 00:27:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ab62f1-cee9-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 01:27:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9033FA410EB;
 Fri, 10 Jan 2025 00:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EA6C4CED2;
 Fri, 10 Jan 2025 00:27:08 +0000 (UTC)
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
X-Inumbo-ID: a1ab62f1-cee9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736468829;
	bh=tUdaT03ueTPYhKJvplq88rLYDZSM2aRHSNI4FKJoWsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OhxwIro2ETxoZRUOIkEuP6oKXNI6dHSMqJyU9093r24LM9M3qa0xSBuUJLitMoJrI
	 Ms9nV5iXWhQE7qQTuRdgSVkYfB5VSAHECFT+AvQQqjCzPoDw1BD5G1gVvozK7INMCl
	 2NlRRxAkl6e8+K18cITLt5dRH0d6IShUqQos36Zm9PF4FK3nIioInHRdYIL7cuHIbY
	 3QzlZZj/M2CN4eqCDMoqyEszKoBDYIvOqzMtyhlSJOjGHcPhlZNXY1YFWfNtrN30e7
	 SkBTIoZYneETERCIVAL/79Q2AbpKaxMqYcdmLUdvMuDJ4hHP4Vmt29VNBnVV6B2LiU
	 5K8i61Ug0NVdg==
Date: Thu, 9 Jan 2025 16:27:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
In-Reply-To: <e2544cace3517eb68cdffdc278f347584f93fd63.1736331828.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2501091619040.133435@ubuntu-linux-20-04-desktop>
References: <cover.1736331828.git.mykyta_poturai@epam.com> <e2544cace3517eb68cdffdc278f347584f93fd63.1736331828.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jan 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are number of ITS implementations exist which are different from
> the base one which have number of functionalities defined as is
> "IMPLEMENTATION DEFINED", e.g. there may exist differences in cacheability,
> shareability and memory requirements and others. This requires
> appropriate handling of such HW requirements which are implemented as
> ITS quirks: GITS_IIDR (ITS Implementer Identification Register) is used to
> differentiate the ITS implementations and select appropriate set of
> quirks if any.
> 
> As an example of such ITSes add quirk implementation for Renesas Gen4 ITS:
> - add possibility to override default cacheability and shareability
> settings used for ITS memory allocations;
> - change relevant memory allocations to alloc_xenheap_pages which allows
> to specify memory access flags, free_xenheap_pages is used to free;
> - add quirks validation to ensure that all ITSes share the same quirks
> in case of multiple ITSes are present in the system;
> 
> The Gen4 ITS memory requirements are not covered in any errata as of yet,
> but observed behavior suggests that they are indeed required.
> 
> The idea of the quirk implementation is inspired by the Linux kernel ITS
> quirk implementation [1].
> 
> Changelog:
> v1 -> v2:
> - switched to using alloc_xenheap_pages/free_xenheap_pages for ITS memory
> allocations;
> - updated declaration of its_quirk_flags;
> - added quirks validation to ensure that all ITSes share the same quirks;
> - removed unnecessary vITS changes;
> 
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> [1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic-v3-its.c
> ---
>  xen/arch/arm/gic-v3-its.c             | 141 +++++++++++++++++++++++---
>  xen/arch/arm/gic-v3-lpi.c             |  20 ++--
>  xen/arch/arm/include/asm/gic_v3_its.h |   8 ++
>  3 files changed, 150 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 5fd83af25a..8849ac6c4b 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -42,6 +42,7 @@ struct its_device {
>      struct rb_node rbnode;
>      struct host_its *hw_its;
>      void *itt_addr;
> +    unsigned int itt_order;
>      paddr_t guest_doorbell;             /* Identifies the virtual ITS */
>      uint32_t host_devid;
>      uint32_t guest_devid;
> @@ -50,6 +51,104 @@ struct its_device {
>      struct pending_irq *pend_irqs;      /* One struct per event */
>  };
>  
> +/*
> + * It is unlikely that a platform implements ITSes with different quirks,
> + * so assume they all share the same.
> + */
> +struct its_quirk {
> +    const char *desc;
> +    bool (*init)(struct host_its *hw_its);
> +    uint32_t iidr;
> +    uint32_t mask;
> +};
> +
> +static uint32_t __ro_after_init its_quirk_flags;
> +
> +static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> +{
> +    its_quirk_flags |= HOST_ITS_WORKAROUND_NC_NS |
> +        HOST_ITS_WORKAROUND_32BIT_ADDR;
> +
> +    return true;
> +}
> +
> +static const struct its_quirk its_quirks[] = {
> +    {
> +        .desc	= "R-Car Gen4",
> +        .iidr	= 0x0201743b,
> +        .mask	= 0xffffffff,
> +        .init	= gicv3_its_enable_quirk_gen4,
> +    },
> +    {
> +        /* Sentinel. */
> +    }
> +};
> +
> +static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
> +{
> +    const struct its_quirk *quirks = its_quirks;
> +
> +    for ( ; quirks->desc; quirks++ )
> +    {
> +        if ( quirks->iidr == (quirks->mask & iidr) )
> +            return (struct its_quirk *)quirks;
> +    }
> +
> +    return NULL;
> +}
> +
> +static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +{
> +    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
> +    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
> +
> +    if ( quirk && quirk->init(hw_its) )
> +        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
> +}
> +
> +static void gicv3_its_validate_quirks(void)
> +{
> +    const struct its_quirk *quirk = NULL, *prev = NULL;
> +    const struct host_its *hw_its;
> +
> +    if ( list_empty(&host_its_list) )
> +        return;
> +
> +    hw_its = list_first_entry(&host_its_list, struct host_its, entry);
> +    prev = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
> +
> +    list_for_each_entry(hw_its, &host_its_list, entry)
> +    {
> +        quirk = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
> +        BUG_ON(quirk != prev);
> +        prev = quirk;
> +    }

I think this is OK


> +}
> +
> +uint64_t gicv3_its_get_cacheability(void)
> +{
> +    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +        return GIC_BASER_CACHE_nC;
> +
> +    return GIC_BASER_CACHE_RaWaWb;
> +}
> +
> +uint64_t gicv3_its_get_shareability(void)
> +{
> +    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +        return GIC_BASER_NonShareable;
> +
> +    return GIC_BASER_InnerShareable;
> +}
> +
> +unsigned int gicv3_its_get_memflags(void)
> +{
> +    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
> +        return MEMF_bits(32);
> +
> +    return 0;
> +}
> +
>  bool gicv3_its_host_has_its(void)
>  {
>      return !list_empty(&host_its_list);
> @@ -289,19 +388,23 @@ static void *its_map_cbaser(struct host_its *its)
>  {
>      void __iomem *cbasereg = its->its_base + GITS_CBASER;
>      uint64_t reg;
> +    unsigned int order;
>      void *buffer;
>  
> -    reg  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
> +    reg  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>      reg |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
> -    reg |= GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> +    reg |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>  
> -    buffer = _xzalloc(ITS_CMD_QUEUE_SZ, SZ_64K);
> +    order = get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
> +    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
>      if ( !buffer )
>          return NULL;
>  
> +    memset(buffer, 0, PAGE_SIZE << order);
> +
>      if ( virt_to_maddr(buffer) & ~GENMASK(51, 12) )
>      {
> -        xfree(buffer);
> +        free_xenheap_pages(buffer, order);
>          return NULL;
>      }
>  
> @@ -340,11 +443,12 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
>      unsigned int entry_size = GITS_BASER_ENTRY_SIZE(regc);
>      unsigned int pagesz = 2;    /* try 64K pages first, then go down. */
>      unsigned int table_size;
> +    unsigned int order;
>      void *buffer;
>  
> -    attr  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
> +    attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>      attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
> -    attr |= GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> +    attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>  
>      /*
>       * Setup the BASE register with the attributes that we like. Then read
> @@ -357,13 +461,16 @@ retry:
>      /* The BASE registers support at most 256 pages. */
>      table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
>  
> -    buffer = _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
> +    order = get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(pagesz), U)));
> +    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
>      if ( !buffer )
>          return -ENOMEM;
>  
> +    memset(buffer, 0, PAGE_SIZE << order);
> +
>      if ( !check_baser_phys_addr(buffer, BASER_PAGE_BITS(pagesz)) )
>      {
> -        xfree(buffer);
> +        free_xenheap_pages(buffer, order);
>          return -ERANGE;
>      }
>  
> @@ -396,7 +503,7 @@ retry:
>      if ( ((regc >> GITS_BASER_PAGE_SIZE_SHIFT) & 0x3UL) == pagesz )
>          return 0;
>  
> -    xfree(buffer);
> +    free_xenheap_pages(buffer, order);
>  
>      if ( pagesz-- > 0 )
>          goto retry;
> @@ -453,6 +560,8 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
>      if ( ret )
>          return ret;
>  
> +    gicv3_its_enable_quirks(hw_its);
> +
>      reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
>      hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
>      hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
> @@ -530,7 +639,7 @@ static int remove_mapped_guest_device(struct its_device *dev)
>          printk(XENLOG_WARNING "Can't unmap host ITS device 0x%x\n",
>                 dev->host_devid);
>  
> -    xfree(dev->itt_addr);
> +    free_xenheap_pages(dev->itt_addr, dev->itt_order);
>      xfree(dev->pend_irqs);
>      xfree(dev->host_lpi_blocks);
>      xfree(dev);
> @@ -619,6 +728,7 @@ int gicv3_its_map_guest_device(struct domain *d,
>      struct its_device *dev = NULL;
>      struct rb_node **new = &d->arch.vgic.its_devices.rb_node, *parent = NULL;
>      int i, ret = -ENOENT;      /* "i" must be signed to check for >= 0 below. */
> +    unsigned int order;
>  
>      hw_its = gicv3_its_find_by_doorbell(host_doorbell);
>      if ( !hw_its )
> @@ -681,10 +791,13 @@ int gicv3_its_map_guest_device(struct domain *d,
>      ret = -ENOMEM;
>  
>      /* An Interrupt Translation Table needs to be 256-byte aligned. */
> -    itt_addr = _xzalloc(nr_events * hw_its->itte_size, 256);
> +    order = get_order_from_bytes(max(nr_events * hw_its->itte_size, (unsigned long)256));
> +    itt_addr = alloc_xenheap_pages(order, gicv3_its_get_memflags());
>      if ( !itt_addr )
>          goto out_unlock;
>  
> +    memset(itt_addr, 0, PAGE_SIZE << order);
> +
>      clean_and_invalidate_dcache_va_range(itt_addr,
>                                           nr_events * hw_its->itte_size);
>  
> @@ -718,6 +831,7 @@ int gicv3_its_map_guest_device(struct domain *d,
>          goto out_unlock;
>  
>      dev->itt_addr = itt_addr;
> +    dev->itt_order = order;
>      dev->hw_its = hw_its;
>      dev->guest_doorbell = guest_doorbell;
>      dev->guest_devid = guest_devid;
> @@ -775,7 +889,8 @@ out:
>          xfree(dev->pend_irqs);
>          xfree(dev->host_lpi_blocks);
>      }
> -    xfree(itt_addr);
> +    if ( itt_addr )
> +        free_xenheap_pages(itt_addr, order);
>      xfree(dev);
>  
>      return ret;
> @@ -1089,6 +1204,8 @@ int gicv3_its_init(void)
>              return ret;
>      }
>  
> +    gicv3_its_validate_quirks();
> +
>      return 0;
>  }
>  
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index de4b0eb4a4..a8783e7d95 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -227,6 +227,7 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>  static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>  {
>      void *pendtable;
> +    unsigned int order;
>  
>      if ( per_cpu(lpi_redist, cpu).pending_table )
>          return -EBUSY;
> @@ -237,7 +238,8 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>       * The GICv3 imposes a 64KB alignment requirement, also requires
>       * physically contiguous memory.
>       */
> -    pendtable = _xzalloc(lpi_data.max_host_lpi_ids / 8, SZ_64K);
> +    order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (unsigned long)SZ_64K));
> +    pendtable = alloc_xenheap_pages(order, gicv3_its_get_memflags());
>      if ( !pendtable )
>          return -ENOMEM;

I think we might need to zero the memory, as we switched from _xzalloc
to alloc_xenheap_pages.


> @@ -272,9 +274,9 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
>  
>      ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
>  
> -    val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
> +    val  = gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
>      val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
> -    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
> +    val |= gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY_SHIFT;
>      val |= GICR_PENDBASER_PTZ;
>      val |= virt_to_maddr(pendtable);
>  
> @@ -300,10 +302,11 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
>  static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>  {
>      uint64_t reg;
> +    unsigned int order;
>  
> -    reg  = GIC_BASER_CACHE_RaWaWb << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
> +    reg  = gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
>      reg |= GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT;
> -    reg |= GIC_BASER_InnerShareable << GICR_PROPBASER_SHAREABILITY_SHIFT;
> +    reg |= gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY_SHIFT;
>  
>      /*
>       * The property table is shared across all redistributors, so allocate
> @@ -312,7 +315,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>      if ( !lpi_data.lpi_property )
>      {
>          /* The property table holds one byte per LPI. */
> -        void *table = _xmalloc(lpi_data.max_host_lpi_ids, SZ_4K);
> +        void *table;
> +
> +        order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (unsigned long)SZ_4K));

NIT: I am curious whether the unsigned long cast is necessary


> +        table = alloc_xenheap_pages(order, gicv3_its_get_memflags());
>  
>          if ( !table )
>              return -ENOMEM;
> @@ -320,7 +326,7 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>          /* Make sure the physical address can be encoded in the register. */
>          if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
>          {
> -            xfree(table);
> +            free_xenheap_pages(table, order);
>              return -ERANGE;
>          }
>          memset(table, GIC_PRI_IRQ | LPI_PROP_RES1, MAX_NR_HOST_LPIS);
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index c24d4752d0..0737e67aa6 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -110,6 +110,9 @@
>  #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
>  #define HOST_ITS_USES_PTA               (1U << 1)
>  
> +#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
> +#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
> +
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhead. */
>  #define LPI_BLOCK                       32U
>  
> @@ -197,6 +200,11 @@ struct pending_irq *gicv3_assign_guest_event(struct domain *d,
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                   uint32_t virt_lpi);
>  
> +/* ITS quirks handling. */
> +uint64_t gicv3_its_get_cacheability(void);
> +uint64_t gicv3_its_get_shareability(void);
> +unsigned int gicv3_its_get_memflags(void);
> +
>  #else
>  
>  #ifdef CONFIG_ACPI
> -- 
> 2.34.1
> 


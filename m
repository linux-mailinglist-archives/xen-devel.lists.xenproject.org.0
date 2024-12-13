Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C150C9F1851
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 23:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857209.1269610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMDns-0007fc-1m; Fri, 13 Dec 2024 22:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857209.1269610; Fri, 13 Dec 2024 22:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMDnr-0007e9-UX; Fri, 13 Dec 2024 22:06:31 +0000
Received: by outflank-mailman (input) for mailman id 857209;
 Fri, 13 Dec 2024 22:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tMDnq-0007e3-O5
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 22:06:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8041914e-b99e-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 23:06:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4122BA42B9E;
 Fri, 13 Dec 2024 22:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D0CC4CED0;
 Fri, 13 Dec 2024 22:06:25 +0000 (UTC)
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
X-Inumbo-ID: 8041914e-b99e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734127587;
	bh=hb1EkTP7mixqMTEK5Esj+vsGJHqJpdVrO6M2ZUpL/ZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tAqAPp79TdO8eKtRRoVU1eqPAqY4HFhtyfu+Rid4hAEMStaRB6ZuNyK14nsyyxQJ7
	 YItdXnpD+BehTBCTQQ/O12femuX9erPZ2PgIOBff5ZdisVKZlLdapasKG158bJmXcV
	 99ya29bPVt8qOPgfc1TmanTkknvBRR+d6lDWbGW5LEzqJrsZBhRAMdhbZHrv2oDhI0
	 B5oyR95VWxGS6t2IgVeywWJKNkeSbs4kKcCun/vdEsQO9nQI/DolMLF1959A0kO3p5
	 Bmp2WQga5JqbrB0h5pmDMQ2xXaoWhu32Ke5qmKa7Ko2u2UCwsLNTTr9ZgajmUOVnVZ
	 m7gShsMs1tfJw==
Date: Fri, 13 Dec 2024 14:06:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
In-Reply-To: <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2412131354330.463523@ubuntu-linux-20-04-desktop>
References: <cover.1734096752.git.mykyta_poturai@epam.com> <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Dec 2024, Mykyta Poturai wrote:
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
> - add possibility to allocate memory used by ITS with specific memory
> requirements: introduce _x{z|m}alloc_whole_pages functions and free the
> memory with xfree as usual.
> 
> The idea of the quirk implementation is inspired by the Linux kernel ITS
> quirk implementation [1].
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> [1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic-v3-its.c
> ---
>  xen/arch/arm/gic-v3-its.c             | 90 ++++++++++++++++++++++++---
>  xen/arch/arm/gic-v3-lpi.c             | 14 +++--
>  xen/arch/arm/include/asm/gic_v3_its.h |  8 +++
>  xen/arch/arm/vgic-v3-its.c            |  8 +--
>  xen/common/xmalloc_tlsf.c             | 18 +++++-
>  xen/include/xen/xmalloc.h             |  4 ++
>  6 files changed, 122 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 5fd83af25a..b1a2cdccc5 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -50,6 +50,77 @@ struct its_device {
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
> +uint32_t its_quirk_flags;

static


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
> +static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +{
> +    const struct its_quirk *quirks = its_quirks;
> +    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
> +
> +    for ( ; quirks->desc; quirks++ )
> +    {
> +        if ( quirks->iidr != (quirks->mask & iidr) )
> +            continue;
> +        if ( quirks->init(hw_its) )
> +            printk("GICv3: enabling workaround for ITS: %s\n", quirks->desc);
> +    }
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
> @@ -291,11 +362,12 @@ static void *its_map_cbaser(struct host_its *its)
>      uint64_t reg;
>      void *buffer;
>  
> -    reg  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
> +    reg  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>      reg |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
> -    reg |= GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> +    reg |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>  
> -    buffer = _xzalloc(ITS_CMD_QUEUE_SZ, SZ_64K);
> +    buffer = _xzalloc_whole_pages(ITS_CMD_QUEUE_SZ, SZ_64K,
> +                                  gicv3_its_get_memflags());
>      if ( !buffer )
>          return NULL;
>  
> @@ -342,9 +414,9 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
>      unsigned int table_size;
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
> @@ -357,7 +429,8 @@ retry:
>      /* The BASE registers support at most 256 pages. */
>      table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
>  
> -    buffer = _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
> +    buffer = _xzalloc_whole_pages(table_size, BIT(BASER_PAGE_BITS(pagesz), UL),
> +                                  gicv3_its_get_memflags());
>      if ( !buffer )
>          return -ENOMEM;
>  
> @@ -453,6 +526,8 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
>      if ( ret )
>          return ret;
>  
> +    gicv3_its_enable_quirks(hw_its);

We have an issue here because gicv3_its_enable_quirks is called for
every ITS in the system, setting its_quirk_flags as appropriate, but
there is only one its_quirk_flags.

In the unlikely case of multiple ITSes, this wouldn't work.

One option is to call gicv3_its_enable_quirks only for the first ITS and
assume the others are the same (ideally we would check and BUG_ON if it
is not the case). Another option is to have one its_quirk_flags per ITS.


>      reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
>      hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
>      hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
> @@ -681,7 +756,8 @@ int gicv3_its_map_guest_device(struct domain *d,
>      ret = -ENOMEM;
>  
>      /* An Interrupt Translation Table needs to be 256-byte aligned. */
> -    itt_addr = _xzalloc(nr_events * hw_its->itte_size, 256);
> +    itt_addr = _xzalloc_whole_pages(nr_events * hw_its->itte_size, 256,
> +                                    gicv3_its_get_memflags());
>      if ( !itt_addr )
>          goto out_unlock;
>  
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index de4b0eb4a4..72b725a624 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -237,7 +237,8 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>       * The GICv3 imposes a 64KB alignment requirement, also requires
>       * physically contiguous memory.
>       */
> -    pendtable = _xzalloc(lpi_data.max_host_lpi_ids / 8, SZ_64K);
> +    pendtable = _xmalloc_whole_pages(lpi_data.max_host_lpi_ids / 8, SZ_64K,
> +                                     gicv3_its_get_memflags());
>      if ( !pendtable )
>          return -ENOMEM;
>  
> @@ -272,9 +273,9 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
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
> @@ -301,9 +302,9 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>  {
>      uint64_t reg;
>  
> -    reg  = GIC_BASER_CACHE_RaWaWb << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
> +    reg  = gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
>      reg |= GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT;
> -    reg |= GIC_BASER_InnerShareable << GICR_PROPBASER_SHAREABILITY_SHIFT;
> +    reg |= gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY_SHIFT;
>  
>      /*
>       * The property table is shared across all redistributors, so allocate
> @@ -312,7 +313,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>      if ( !lpi_data.lpi_property )
>      {
>          /* The property table holds one byte per LPI. */
> -        void *table = _xmalloc(lpi_data.max_host_lpi_ids, SZ_4K);
> +        void *table = _xmalloc_whole_pages(lpi_data.max_host_lpi_ids, SZ_4K,
> +                                           gicv3_its_get_memflags());
>  
>          if ( !table )
>              return -ENOMEM;
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
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index c65c1dbf52..f5deb18497 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1191,7 +1191,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
>      {
>      case GIC_BASER_OuterShareable:
>          r &= ~GITS_BASER_SHAREABILITY_MASK;
> -        r |= GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
> +        r |= gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>          break;
>      default:
>          break;
> @@ -1203,7 +1203,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
>      case GIC_BASER_CACHE_nCnB:
>      case GIC_BASER_CACHE_nC:
>          r &= ~GITS_BASER_INNER_CACHEABILITY_MASK;
> -        r |= GIC_BASER_CACHE_RaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> +        r |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;

gicv3_its_get_cacheability returns GIC_BASER_CACHE_RaWaWb, because that
is the value that was previously present in all the other cases. In this
case, however, we end up replacing GIC_BASER_CACHE_RaWb with
GIC_BASER_CACHE_RaWaWb. Is that OK? 


>          break;
>      default:
>          break;
> @@ -1455,9 +1455,9 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>      if ( !its )
>          return -ENOMEM;
>  
> -    base_attr  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
> +    base_attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>      base_attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
> -    base_attr |= GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> +    base_attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>  
>      its->cbaser  = base_attr;
>      base_attr |= 0ULL << GITS_BASER_PAGE_SIZE_SHIFT;    /* 4K pages */
> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> index 5e55fc463e..f7f00db044 100644
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -537,14 +537,15 @@ static void cf_check xmalloc_pool_put(void *p)
>      free_xenheap_page(p);
>  }
>  
> -static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
> +void *_xmalloc_whole_pages(unsigned long size, unsigned long align,
> +                           unsigned int memflags)
>  {
>      unsigned int i, order;
>      void *res, *p;
>  
>      order = get_order_from_bytes(max(align, size));
>  
> -    res = alloc_xenheap_pages(order, 0);
> +    res = alloc_xenheap_pages(order, memflags);
>      if ( res == NULL )
>          return NULL;
>  
> @@ -562,6 +563,17 @@ static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
>      return res;
>  }
>  
> +void *_xzalloc_whole_pages(unsigned long size, unsigned long align,
> +                           unsigned int memflags)
> +{
> +    void *p = _xmalloc_whole_pages(size, align, memflags);
> +
> +    if ( p )
> +        memset(p, 0, size);
> +
> +    return p;
> +}
> +
>  static void tlsf_init(void)
>  {
>      xenpool = xmem_pool_create("xmalloc", xmalloc_pool_get,
> @@ -628,7 +640,7 @@ void *_xmalloc(unsigned long size, unsigned long align)
>      if ( size < PAGE_SIZE )
>          p = xmem_pool_alloc(size, xenpool);
>      if ( p == NULL )
> -        return xmalloc_whole_pages(size - align + MEM_ALIGN, align);
> +        return _xmalloc_whole_pages(size - align + MEM_ALIGN, align, 0);
>  
>      /* Add alignment padding. */
>      p = add_padding(p, align);
> diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
> index b903fa2e26..3b05e992ef 100644
> --- a/xen/include/xen/xmalloc.h
> +++ b/xen/include/xen/xmalloc.h
> @@ -79,6 +79,10 @@ extern void xfree(void *p);
>  extern void *_xmalloc(unsigned long size, unsigned long align);
>  extern void *_xzalloc(unsigned long size, unsigned long align);
>  extern void *_xrealloc(void *ptr, unsigned long size, unsigned long align);
> +extern void *_xmalloc_whole_pages(unsigned long size, unsigned long align,
> +                                  unsigned int memflags);
> +extern void *_xzalloc_whole_pages(unsigned long size, unsigned long align,
> +                                  unsigned int memflags);
>  
>  static inline void *_xmalloc_array(
>      unsigned long size, unsigned long align, unsigned long num)
> -- 
> 2.34.1
> 


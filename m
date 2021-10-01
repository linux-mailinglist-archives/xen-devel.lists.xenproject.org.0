Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3041E5AA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 03:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200350.354853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW732-0004mG-Ba; Fri, 01 Oct 2021 01:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200350.354853; Fri, 01 Oct 2021 01:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW732-0004jw-88; Fri, 01 Oct 2021 01:09:12 +0000
Received: by outflank-mailman (input) for mailman id 200350;
 Fri, 01 Oct 2021 01:09:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW730-0004jq-Pz
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 01:09:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e0ae154-2254-11ec-bd7a-12813bfff9fa;
 Fri, 01 Oct 2021 01:09:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0F716127B;
 Fri,  1 Oct 2021 01:09:07 +0000 (UTC)
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
X-Inumbo-ID: 2e0ae154-2254-11ec-bd7a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633050548;
	bh=EgIYp7CcK6/zwuKJVT3PxJON2FWlnUG2Cgu6gqEF6kc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DHxWQxzFlkbO9bXQiPVec721zolW2jKzJed1wFRfhOUFvgajKyPEZKZyEVRapug+9
	 fXT4pHo5xBSu3GSn5FbacpblS981tyrTxTPlltKVKZMIW6PM9K1u1kQ83YRI6OFGp6
	 ssKH14Kz6vTd/EKOeR880a8QzAzp+JGvorqZn/IXVXIOGXzwt5fR47joUhh5LpveJ8
	 clRLtg0+T71877husGU9uJ14INS+b/dkKKteZGwJqGdhWandMKJzXH/EvlssGiDwZh
	 DjXr7qgpMc/VG8DZzTZ0QSOUI3/gO/d2eB408S4ov9tXZpA6TDA7VKAKGbwYTTD3VO
	 N6+av7Qb0Csrg==
Date: Thu, 30 Sep 2021 18:09:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 10/11] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
In-Reply-To: <20210930071326.857390-11-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301755050.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-11-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges are special devices in terms of implementing PCI
> passthrough. According to [1] the current implementation depends on
> Domain-0 to perform the initialization of the relevant PCI host
> bridge hardware and perform PCI device enumeration. In order to
> achieve that one of the required changes is to not map all the memory
> ranges in map_range_to_domain as we traverse the device tree on startup
> and perform some additional checks if the range needs to be mapped to
> Domain-0.
> 
> The generic PCI host controller device tree binding says [2]:
> - ranges: As described in IEEE Std 1275-1994, but must provide
>           at least a definition of non-prefetchable memory. One
>           or both of prefetchable Memory and IO Space may also
>           be provided.
> 
> - reg   : The Configuration Space base address and size, as accessed
>           from the parent bus.  The base address corresponds to
>           the first bus in the "bus-range" property.  If no
>           "bus-range" is specified, this will be bus 0 (the default).
> 
> >From the above none of the memory ranges from the "ranges" property
> needs to be mapped to Domain-0 at startup as MMIO mapping is going to
> be handled dynamically by vPCI as we assign PCI devices, e.g. each
> device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
> as needed by Xen.
> 
> The "reg" property covers not only ECAM space, but may also have other
> then the configuration memory ranges described, for example [3]:
> - reg: Should contain rc_dbi, config registers location and length.
> - reg-names: Must include the following entries:
>    "rc_dbi": controller configuration registers;
>    "config": PCIe configuration space registers.
> 
> This patch makes it possible to not map all the ranges from the
> "ranges" property and also ECAM from the "reg". All the rest from the
> "reg" property still needs to be mapped to Domain-0, so the PCI
> host bridge remains functional in Domain-0.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is a lot better, we are almost there. I only have a couple of
comments left.

> ---
> Since v2:
>  - removed check in map_range_to_domain for PCI_DEV
>    and moved it to handle_device, so the code is
>    simpler
>  - s/map_pci_bridge/skip_mapping
>  - extended comment in pci_host_bridge_mappings
>  - minor code restructure in construct_dom0
>  - s/.need_p2m_mapping/.need_p2m_hwdom_mapping and related
>    callbacks
>  - unsigned int i; in pci_host_bridge_mappings
> Since v1:
>  - Added better description of why and what needs to be mapped into
>    Domain-0's p2m and what doesn't
>  - Do not do any mappings for PCI devices while traversing the DT
>  - Walk all the bridges and make required mappings in one go
> ---
>  xen/arch/arm/domain_build.c        | 45 ++++++++++++++-------------
>  xen/arch/arm/pci/ecam.c            | 14 +++++++++
>  xen/arch/arm/pci/pci-host-common.c | 49 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
>  xen/include/asm-arm/pci.h          | 10 ++++++
>  xen/include/asm-arm/setup.h        | 13 ++++++++
>  6 files changed, 111 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 026c9e5c6cc4..ed46bcf8e7eb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -10,7 +10,6 @@
>  #include <asm/regs.h>
>  #include <xen/errno.h>
>  #include <xen/err.h>
> -#include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/guest_access.h>
>  #include <xen/iocap.h>
> @@ -47,12 +46,6 @@ static int __init parse_dom0_mem(const char *s)
>  }
>  custom_param("dom0_mem", parse_dom0_mem);
>  
> -struct map_range_data
> -{
> -    struct domain *d;
> -    p2m_type_t p2mt;
> -};
> -
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> @@ -1388,13 +1381,13 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>      return 0;
>  }
>  
> -static int __init map_range_to_domain(const struct dt_device_node *dev,
> -                                      u64 addr, u64 len,
> -                                      void *data)
> +int __init map_range_to_domain(const struct dt_device_node *dev,
> +                               u64 addr, u64 len, void *data)
>  {
>      struct map_range_data *mr_data = data;
>      struct domain *d = mr_data->d;
> -    bool need_mapping = !dt_device_for_passthrough(dev);
> +    bool need_mapping = !dt_device_for_passthrough(dev) &&
> +                        !mr_data->skip_mapping;

This should be just:

bool need_mapping = !mr_data->skip_mapping;

also see below


>      int res;
>  
>      /*
> @@ -1446,23 +1439,21 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>   * then we may need to perform additional mappings in order to make
>   * the child resources available to domain 0.
>   */
> -static int __init map_device_children(struct domain *d,
> -                                      const struct dt_device_node *dev,
> -                                      p2m_type_t p2mt)
> +static int __init map_device_children(const struct dt_device_node *dev,
> +                                      struct map_range_data *mr_data)
>  {
> -    struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> -    int ret;
> -
>      if ( dt_device_type_is_equal(dev, "pci") )
>      {
> +        int ret;
> +
>          dt_dprintk("Mapping children of %s to guest\n",
>                     dt_node_full_name(dev));
>  
> -        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, d);
> +        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data->d);

I think it would be best if we pass mr_data instead of mr_data->d so
that at the beginning of map_dt_irq_to_domain we can do:

bool need_mapping = !mr_data->skip_mapping;


>          if ( ret < 0 )
>              return ret;
>  
> -        ret = dt_for_each_range(dev, &map_range_to_domain, &mr_data);
> +        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
>          if ( ret < 0 )
>              return ret;
>      }
> @@ -1543,6 +1534,12 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>      int res;
>      u64 addr, size;
>      bool need_mapping = !dt_device_for_passthrough(dev);
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = is_pci_passthrough_enabled() &&
> +                        (device_get_class(dev) == DEVICE_PCI)

I think this should be:

.skip_mapping = !need_mapping ||
                (is_pci_passthrough_enabled() &&
                 (device_get_class(dev) == DEVICE_PCI))


> +    };
>  
>      naddr = dt_number_of_address(dev);
>  
> @@ -1582,7 +1579,6 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>      /* Give permission and map MMIOs */
>      for ( i = 0; i < naddr; i++ )
>      {
> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
>          res = dt_device_get_address(dev, i, &addr, &size);
>          if ( res )
>          {
> @@ -1596,7 +1592,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>              return res;
>      }
>  
> -    res = map_device_children(d, dev, p2mt);
> +    res = map_device_children(dev, &mr_data);
>      if ( res )
>          return res;
>  
> @@ -2754,7 +2750,14 @@ static int __init construct_dom0(struct domain *d)
>          return rc;
>  
>      if ( acpi_disabled )
> +    {
>          rc = prepare_dtb_hwdom(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +#ifdef CONFIG_HAS_PCI
> +        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
> +#endif
> +    }
>      else
>          rc = prepare_acpi(d, &kinfo);
>  
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 602d00799c8d..b81620074a91 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -40,6 +40,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>      return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
>  }
>  
> +bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> +                                     struct pci_host_bridge *bridge,
> +                                     uint64_t addr)
> +{
> +    struct pci_config_window *cfg = bridge->cfg;
> +
> +    /*
> +     * We do not want ECAM address space to be mapped in Domain-0's p2m,
> +     * so we can trap access to it.
> +     */
> +    return cfg->phys_addr != addr;
> +}
> +
>  /* ECAM ops */
>  const struct pci_ecam_ops pci_generic_ecam_ops = {
>      .bus_shift  = 20,
> @@ -47,6 +60,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
>      }
>  };
>  
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 1eb4daa87365..085f08e23e0c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -18,6 +18,7 @@
>  
>  #include <xen/init.h>
>  #include <xen/pci.h>
> +#include <asm/setup.h>
>  #include <xen/rwlock.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
> @@ -320,6 +321,54 @@ int pci_host_get_num_bridges(void)
>      return count;
>  }
>  
> +int __init pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = false
> +    };
> +
> +    /*
> +     * For each PCI host bridge we need to only map those ranges
> +     * which are used by Domain-0 to properly initialize the bridge,
> +     * e.g. we do not want to map ECAM configuration space which lives in
> +     * "reg" or "assigned-addresses" device tree property, but we want to
> +     * map other regions of the host bridge. The PCI aperture defined by
> +     * the "ranges" device tree property should also be skipped.
> +     */
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        const struct dt_device_node *dev = bridge->dt_node;
> +        unsigned int i;
> +
> +        for ( i = 0; i < dt_number_of_address(dev); i++ )
> +        {
> +            uint64_t addr, size;
> +            int err;
> +
> +            err = dt_device_get_address(dev, i, &addr, &size);
> +            if ( err )
> +            {
> +                printk(XENLOG_ERR
> +                       "Unable to retrieve address range index=%u for %s\n",
> +                       i, dt_node_full_name(dev));
> +                return err;
> +            }
> +
> +            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
> +            {
> +                err = map_range_to_domain(dev, addr, size, &mr_data);
> +                if ( err )
> +                    return err;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index 6ccbfd15c968..a57bf0fbc1cc 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -33,6 +33,7 @@ const struct pci_ecam_ops nwl_pcie_ops = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
>      }
>  };
>  
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 0d0266b13cba..1bfba3da8f51 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -17,6 +17,8 @@
>  
>  #ifdef CONFIG_HAS_PCI
>  
> +#include <asm/p2m.h>
> +
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
>  extern bool_t pci_passthrough_enabled;
> @@ -73,6 +75,9 @@ struct pci_ops {
>                  uint32_t reg, uint32_t len, uint32_t *value);
>      int (*write)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                   uint32_t reg, uint32_t len, uint32_t value);
> +    bool (*need_p2m_hwdom_mapping)(struct domain *d,
> +                                   struct pci_host_bridge *bridge,
> +                                   uint64_t addr);
>  };
>  
>  /*
> @@ -96,6 +101,9 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t value);
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 pci_sbdf_t sbdf, uint32_t where);
> +bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> +                                     struct pci_host_bridge *bridge,
> +                                     uint64_t addr);
>  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>  int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                  uint16_t *segment);
> @@ -113,6 +121,8 @@ int pci_host_iterate_bridges(struct domain *d,
>                                          struct pci_host_bridge *bridge));
>  int pci_host_get_num_bridges(void);
>  
> +int pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt);
> +
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..5b30135fda38 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -2,6 +2,8 @@
>  #define __ARM_SETUP_H_
>  
>  #include <public/version.h>
> +#include <asm/p2m.h>
> +#include <xen/device_tree.h>
>  
>  #define MIN_FDT_ALIGN 8
>  #define MAX_FDT_SIZE SZ_2M
> @@ -77,6 +79,14 @@ struct bootinfo {
>  #endif
>  };
>  
> +struct map_range_data
> +{
> +    struct domain *d;
> +    p2m_type_t p2mt;
> +    /* Set if mappings for PCI host bridges must not be skipped. */

This comment needs updating


> +    bool skip_mapping;
> +};
> +
>  extern struct bootinfo bootinfo;
>  
>  extern domid_t max_init_domid;
> @@ -124,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
>  
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data);
> +
>  #endif
>  /*
>   * Local variables:
> -- 
> 2.25.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07885417EAD
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 02:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195759.348614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvnl-0000X0-5t; Sat, 25 Sep 2021 00:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195759.348614; Sat, 25 Sep 2021 00:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvnl-0000U9-24; Sat, 25 Sep 2021 00:44:25 +0000
Received: by outflank-mailman (input) for mailman id 195759;
 Sat, 25 Sep 2021 00:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTvnj-0000U3-Lv
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 00:44:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9422cba-1d99-11ec-bb2d-12813bfff9fa;
 Sat, 25 Sep 2021 00:44:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 096A06103C;
 Sat, 25 Sep 2021 00:44:21 +0000 (UTC)
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
X-Inumbo-ID: b9422cba-1d99-11ec-bb2d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632530661;
	bh=O1EQP2c2OI+3X3OdV5SNnC1A2WhVwNq51UxFehtZ2zE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jDu0O6sz261Ro83OJNEeKdcYAt8S3JyKzXAZkKb1YzMdJQLTAg6Gt7J1TnHE9Gkgq
	 k/WYb0MWegkU6Mlgb3yiWBGeBgC0qWjVqjkBsCj9LTDy8ibLvso3kYzXM1SqfpMHvd
	 dFOl5pqXZEcH0rI9UbHdTjq2X9ebMcfsmRWvpp84ntZ0HcBjP2keXPlQ3BSf5Y0LwK
	 5W3Ly5Eo/F1rnWfacO3D8Og/03TbxkzSFIgtMQlBQy0lFviKwo2c6NVBlKGW83yzwR
	 pCbG6SvAIBXsof683ljmBnR8zY2yhQv3VUA41cDFx2Sx7TovdZgZRi/pKdojrvzsg7
	 jYK5uMPGVxk3g==
Date: Fri, 24 Sep 2021 17:44:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 10/11] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
In-Reply-To: <20210923125438.234162-11-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241724210.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-11-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
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
> 
> ---
> Since v1:
>  - Added better description of why and what needs to be mapped into
>    Domain-0's p2m and what doesn't
>  - Do not do any mappings for PCI devices while traversing the DT
>  - Walk all the bridges and make required mappings in one go
> ---
>  xen/arch/arm/domain_build.c        | 38 +++++++++++++++--------
>  xen/arch/arm/pci/ecam.c            | 14 +++++++++
>  xen/arch/arm/pci/pci-host-common.c | 48 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
>  xen/include/asm-arm/pci.h          |  9 ++++++
>  xen/include/asm-arm/setup.h        | 13 ++++++++
>  6 files changed, 111 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 83ab0d52cce9..e72c1b881cae 100644
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
> @@ -1388,9 +1381,8 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
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
> @@ -1417,6 +1409,13 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>          }
>      }
>  
> +#ifdef CONFIG_HAS_PCI
> +    if ( is_pci_passthrough_enabled() &&
> +         (device_get_class(dev) == DEVICE_PCI) &&
> +         !mr_data->map_pci_bridge )
> +        need_mapping = false;
> +#endif

With the change I suggested below turning map_pci_bridge into
skip_mapping, then this check could go away if we just set need_mapping
as follows:

bool need_mapping = !dt_device_for_passthrough(dev) &&
                    !mr_data->skip_mapping;


>      if ( need_mapping )
>      {
>          res = map_regions_p2mt(d,
> @@ -1450,7 +1449,11 @@ static int __init map_device_children(struct domain *d,
>                                        const struct dt_device_node *dev,
>                                        p2m_type_t p2mt)
>  {
> -    struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .map_pci_bridge = false
> +    };
>      int ret;
>  
>      if ( dt_device_type_is_equal(dev, "pci") )
> @@ -1582,7 +1585,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>      /* Give permission and map MMIOs */
>      for ( i = 0; i < naddr; i++ )
>      {
> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> +        struct map_range_data mr_data = {
> +            .d = d,
> +            .p2mt = p2mt,
> +            .map_pci_bridge = false
> +        };
>          res = dt_device_get_address(dev, i, &addr, &size);
>          if ( res )
>          {
> @@ -2754,7 +2761,14 @@ static int __init construct_dom0(struct domain *d)
>          return rc;
>  
>      if ( acpi_disabled )
> +    {
>          rc = prepare_dtb_hwdom(d, &kinfo);
> +#ifdef CONFIG_HAS_PCI
> +        if ( rc < 0 )
> +            return rc;

This doesn't look great :-)

I would move the call to pci_host_bridge_mappings() below just before
construct_domain.


> +        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
> +#endif
> +    }
>      else
>          rc = prepare_acpi(d, &kinfo);
>  
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 9b88b1cedaa2..eae177f2cbc2 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -39,6 +39,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>      return base + (PCI_DEVFN2(sbdf) << devfn_shift) + where;
>  }
>  
> +bool pci_ecam_need_p2m_mapping(struct domain *d,
> +                               struct pci_host_bridge *bridge,
> +                               uint64_t addr)
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
> @@ -46,6 +59,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
>      }
>  };
>  
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 155f2a2743af..f350826ea26b 100644
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
> @@ -328,6 +329,53 @@ int pci_host_get_num_bridges(void)
>      return count;
>  }
>  
> +int __init pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .map_pci_bridge = true
> +    };
> +
> +    /*
> +     * For each PCI host bridge we need to only map those ranges
> +     * which are used by Domain-0 to properly initialize the bridge,
> +     * e.g. we do not want to map ECAM configuration space which lives in
> +     * "reg" or "assigned-addresses" device tree property.
> +     * Neither we want to map any of the MMIO ranges found in the "ranges"
> +     * device tree property.
> +     */
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        const struct dt_device_node *dev = bridge->dt_node;
> +        int i;

i should be unsigned int


> +        for ( i = 0; i < dt_number_of_address(dev); i++ )
> +        {
> +            uint64_t addr, size;
> +            int err;
> +
> +            err = dt_device_get_address(dev, i, &addr, &size);
> +            if ( err )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",

Maybe rephrase it to:

    Unable to retrieve address range index=%u for %s


> +                       i, dt_node_full_name(dev));
> +                return err;
> +            }
> +
> +            if ( bridge->ops->need_p2m_mapping(d, bridge, addr) )

The current implementation of need_p2m_mapping filters out ECAM and
nothing else. Just double-checking here: is there anything else we
should filter out? Looking at the device tree pci node for ZynqMP:

			reg = <0x0 0xfd0e0000 0x0 0x1000 0x0 0xfd480000 0x0 0x1000 0x80 0x0 0x0 0x1000000>;
			reg-names = "breg", "pcireg", "cfg";

We are filtering out cfg, but do we need both "breg" and "pcireg" here?

If not, do we need another function like .cfg_reg_index to know what we
actually need to map?


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
> index c27b4ea9f02f..adbe3627871f 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -33,6 +33,7 @@ const struct pci_ecam_ops nwl_pcie_ops = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
>      }
>  };
>  
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7618f0b6725b..b81f66e813ef 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -19,6 +19,8 @@
>  
>  #ifdef CONFIG_HAS_PCI
>  
> +#include <asm/p2m.h>
> +
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  #define PRI_pci "%04x:%02x:%02x.%u"
>  
> @@ -79,6 +81,9 @@ struct pci_ops {
>                  uint32_t reg, uint32_t len, uint32_t *value);
>      int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
>                   uint32_t reg, uint32_t len, uint32_t value);
> +    bool (*need_p2m_mapping)(struct domain *d,
> +                             struct pci_host_bridge *bridge,
> +                             uint64_t addr);

I would call this function: need_p2m_hwdom_mapping


>  };
>  
>  /*
> @@ -102,6 +107,9 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t value);
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 uint32_t sbdf, uint32_t where);
> +bool pci_ecam_need_p2m_mapping(struct domain *d,
> +                               struct pci_host_bridge *bridge,
> +                               uint64_t addr);
>  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>  int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                  uint16_t *segment);
> @@ -116,6 +124,7 @@ int pci_host_iterate_bridges(struct domain *d,
>                               int (*clb)(struct domain *d,
>                                          struct pci_host_bridge *bridge));
>  int pci_host_get_num_bridges(void);
> +int pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt);
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  #define pci_passthrough_enabled (false)
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..21863dd2bc58 100644
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
> +    bool map_pci_bridge;

To make this more generally applicable, I would call the new property:

  bool skip_mapping;

and it could apply to any class of devices. All current users would set
it to false except for pci_host_bridge_mappings.


> +};
>
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


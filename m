Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D450C45A8EA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229759.397262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYs2-0001Zc-4S; Tue, 23 Nov 2021 16:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229759.397262; Tue, 23 Nov 2021 16:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYs2-0001Xk-0p; Tue, 23 Nov 2021 16:42:14 +0000
Received: by outflank-mailman (input) for mailman id 229759;
 Tue, 23 Nov 2021 16:42:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpYs0-0001WL-D3
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:42:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpYrz-0007q8-Cy; Tue, 23 Nov 2021 16:42:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpYrz-0007DH-2O; Tue, 23 Nov 2021 16:42:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=oxE6JfBlfe9dus2Rs6m+mGxwNZm2yVtDyllyYybSj08=; b=FjCpBCzKImyxZp0EryFFaehHwa
	qHh9xn/6zYOR+moNxBBGp9GQdlUNLXqf9bmMYBi8rRmYumkR56EpTIVrlm2RuLNDSc/ispYQ1TQEA
	/zgnPM/DbDd3p87r32SWzmKBSE8tTCGECGY5tDsFggTwZNn73h7u0NpvFY7Utneb2v8E=;
Message-ID: <b85a3e6c-e48e-dd11-5488-f71c9d2422a7@xen.org>
Date: Tue, 23 Nov 2021 16:42:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 4/7] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-5-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
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
>            at least a definition of non-prefetchable memory. One
>            or both of prefetchable Memory and IO Space may also
>            be provided.
> 
> - reg   : The Configuration Space base address and size, as accessed
>            from the parent bus.  The base address corresponds to
>            the first bus in the "bus-range" property.  If no
>            "bus-range" is specified, this will be bus 0 (the default).
> 
>  From the above none of the memory ranges from the "ranges" property
> needs to be mapped to Domain-0 at startup as MMIO mapping is going to
> be handled dynamically by vPCI as we assign PCI devices, e.g. each
> device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
> as needed by Xen.
> 
> The "reg" property covers not only ECAM space, but may also have other
> then the configuration memory ranges described, for example [3]:
> - reg: Should contain rc_dbi, config registers location and length.
> - reg-names: Must include the following entries:
>     "rc_dbi": controller configuration registers;
>     "config": PCIe configuration space registers.
> 
> This patch makes it possible to not map all the ranges from the
> "ranges" property and also ECAM from the "reg". All the rest from the
> "reg" property still needs to be mapped to Domain-0, so the PCI
> host bridge remains functional in Domain-0.

The commit message is explaining the problematic quite well (thanks for 
that). I think it also wants to explain the approach taken (the fact 
that we are deferring the mapping for hostbridges).

> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v5:
> - remove some need_mapping local variables
> - use own_device in handle_device
> - add __init for pci_ecam_need_p2m_hwdom_mapping
> - make pci_host_bridge_mappings use p2m_mmio_direct_dev directly
> Since v4:
> - update skip_mapping comment
> - add comment why we need to map interrupts to Dom0
> Since v3:
>   - pass struct map_range_data to map_dt_irq_to_domain
>   - remove redundant check from map_range_to_domain
>   - fix handle_device's .skip_mapping
> Since v2:
>   - removed check in map_range_to_domain for PCI_DEV
>     and moved it to handle_device, so the code is
>     simpler
>   - s/map_pci_bridge/skip_mapping
>   - extended comment in pci_host_bridge_mappings
>   - minor code restructure in construct_dom0
>   - s/.need_p2m_mapping/.need_p2m_hwdom_mapping and related
>     callbacks
>   - unsigned int i; in pci_host_bridge_mappings
> Since v1:
>   - Added better description of why and what needs to be mapped into
>     Domain-0's p2m and what doesn't
>   - Do not do any mappings for PCI devices while traversing the DT
>   - Walk all the bridges and make required mappings in one go
> ---
>   xen/arch/arm/domain_build.c        | 67 +++++++++++++++++-------------
>   xen/arch/arm/pci/ecam.c            | 14 +++++++
>   xen/arch/arm/pci/pci-host-common.c | 50 ++++++++++++++++++++++
>   xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
>   xen/include/asm-arm/pci.h          | 10 +++++
>   xen/include/asm-arm/setup.h        | 13 ++++++
>   6 files changed, 126 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f7fcb1400c19..c7d992456ca7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -10,7 +10,6 @@
>   #include <asm/regs.h>
>   #include <xen/errno.h>
>   #include <xen/err.h>
> -#include <xen/device_tree.h>

You are still using helpers defined by this header. So I would keep the 
include even if it may have been included by another one.

>   #include <xen/libfdt/libfdt.h>
>   #include <xen/guest_access.h>
>   #include <xen/iocap.h>
> @@ -51,12 +50,6 @@ static int __init parse_dom0_mem(const char *s)
>   }
>   custom_param("dom0_mem", parse_dom0_mem);
>   
> -struct map_range_data
> -{
> -    struct domain *d;
> -    p2m_type_t p2mt;
> -};
> -
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef virt_to_mfn
>   #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> @@ -1676,10 +1669,10 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>                                          const struct dt_irq *dt_irq,
>                                          void *data)
>   {
> -    struct domain *d = data;
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
>       unsigned int irq = dt_irq->irq;
>       int res;
> -    bool need_mapping = !dt_device_for_passthrough(dev);
>   
>       if ( irq < NR_LOCAL_IRQS )
>       {
> @@ -1698,18 +1691,16 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>           return res;
>       }
>   
> -    res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
> +    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
>   
>       return 0;
>   }
>   
> -static int __init map_range_to_domain(const struct dt_device_node *dev,
> -                                      u64 addr, u64 len,
> -                                      void *data)
> +int __init map_range_to_domain(const struct dt_device_node *dev,
> +                               u64 addr, u64 len, void *data)
>   {
>       struct map_range_data *mr_data = data;
>       struct domain *d = mr_data->d;
> -    bool need_mapping = !dt_device_for_passthrough(dev);
>       int res;
>   
>       res = iomem_permit_access(d, paddr_to_pfn(addr),
> @@ -1723,7 +1714,7 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>           return res;
>       }
>   
> -    if ( need_mapping )
> +    if ( !mr_data->skip_mapping )
>       {
>           res = map_regions_p2mt(d,
>                                  gaddr_to_gfn(addr),
> @@ -1752,23 +1743,21 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>    * then we may need to perform additional mappings in order to make
>    * the child resources available to domain 0.
>    */
> -static int __init map_device_children(struct domain *d,
> -                                      const struct dt_device_node *dev,
> -                                      p2m_type_t p2mt)
> +static int __init map_device_children(const struct dt_device_node *dev,
> +                                      struct map_range_data *mr_data)
>   {
> -    struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> -    int ret;
> -
>       if ( dt_device_type_is_equal(dev, "pci") )
>       {
> +        int ret;
> +
>           dt_dprintk("Mapping children of %s to guest\n",
>                      dt_node_full_name(dev));
>   
> -        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, d);
> +        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
>           if ( ret < 0 )
>               return ret;
>   
> -        ret = dt_for_each_range(dev, &map_range_to_domain, &mr_data);
> +        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
>           if ( ret < 0 )
>               return ret;
>       }
> @@ -1848,14 +1837,28 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>       unsigned int i;
>       int res;
>       u64 addr, size;
> -    bool need_mapping = !dt_device_for_passthrough(dev);
> +    bool own_device = !dt_device_for_passthrough(dev);
> +    /*
> +     * For PCI passthrough we only need to remap to Dom0 the interrupts
> +     * and memory ranges from "reg" property which cover controller's
> +     * configuration registers and such. PCIe configuration space registers
> +     * of the PCIe Root Complex and PCIe aperture should not be mapped
> +     * automatically to Dom0.
> +     */

I would clarify in this comment (and the commit message) that this only 
cover hostbridge that are been shared between dom0 and Xen.

But I find the comment confusing because I would expect to explain this...

> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = !own_device ||
> +                        (is_pci_passthrough_enabled() &&
> +                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))

... line. Instead, it explains the global behavior. I would rework the 
comment to something like:

/*
  * We want to avoid mappings the MMIO in dom0 for the following cases:
  *   - The device is owned by dom0 (i.e. it has been flagged for
  *     passthrough).
  *   - PCI hostbridges with driver in Xen. They will later on by
  *     pci_host_bridge_mappings().
  */

> +    };
>   
>       naddr = dt_number_of_address(dev);
>   
>       dt_dprintk("%s passthrough = %d naddr = %u\n",
> -               dt_node_full_name(dev), need_mapping, naddr);
> +               dt_node_full_name(dev), own_device, naddr);
>   
> -    if ( need_mapping )
> +    if ( own_device )
>       {
>           dt_dprintk("Check if %s is behind the IOMMU and add it\n",
>                      dt_node_full_name(dev));
> @@ -1881,14 +1884,13 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>           }
>       }
>   
> -    res = handle_device_interrupts(d, dev, need_mapping);
> +    res = handle_device_interrupts(d, dev, own_device);
>       if ( res < 0 )
>           return res;
>   
>       /* Give permission and map MMIOs */
>       for ( i = 0; i < naddr; i++ )
>       {
> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
>           res = dt_device_get_address(dev, i, &addr, &size);
>           if ( res )
>           {
> @@ -1902,7 +1904,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>               return res;
>       }
>   
> -    res = map_device_children(d, dev, p2mt);
> +    res = map_device_children(dev, &mr_data);
>       if ( res )
>           return res;
>   
> @@ -3060,7 +3062,14 @@ static int __init construct_dom0(struct domain *d)
>           return rc;
>   
>       if ( acpi_disabled )
> +    {
>           rc = prepare_dtb_hwdom(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +#ifdef CONFIG_HAS_PCI
> +        rc = pci_host_bridge_mappings(d);
> +#endif
> +    }
>       else
>           rc = prepare_acpi(d, &kinfo);
>   
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 602d00799c8d..4f71b11c3057 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -40,6 +40,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>       return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
>   }
>   
> +bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> +                                            struct pci_host_bridge *bridge,
> +                                            uint64_t addr)
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
>   /* ECAM ops */
>   const struct pci_ecam_ops pci_generic_ecam_ops = {
>       .bus_shift  = 20,
> @@ -47,6 +60,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>           .map_bus                = pci_ecam_map_bus,
>           .read                   = pci_generic_config_read,
>           .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
>       }
>   };
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 0d271a6e8881..6af845ab9d6c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -22,6 +22,8 @@
>   #include <xen/sched.h>
>   #include <xen/vmap.h>
>   
> +#include <asm/setup.h>
> +
>   /*
>    * List for all the pci host bridges.
>    */
> @@ -316,6 +318,54 @@ unsigned int pci_host_get_num_bridges(void)
>       return count;
>   }
>   
> +int __init pci_host_bridge_mappings(struct domain *d)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2m_mmio_direct_dev,
> +        .skip_mapping = false
> +    };
> +
> +    /*
> +     * For each PCI host bridge we need to only map those ranges
> +     * which are used by Domain-0 to properly initialize the bridge,
> +     * e.g. we do not want to map ECAM configuration space which lives in
> +     * "reg" device tree property, but we want to map other regions of
> +     * the host bridge. The PCI aperture defined by the "ranges" device
> +     * tree property should also be skipped.
> +     */

This seems to explain the purpose of the function. So I would move the 
commment on top of pci_host_bridge_mappings().

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
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index 516982bca833..101edb8593c1 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -34,6 +34,7 @@ const struct pci_ecam_ops nwl_pcie_ops = {
>           .map_bus                = pci_ecam_map_bus,
>           .read                   = pci_generic_config_read,
>           .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
>       }
>   };
>   
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 969333043431..3d706fdd1d88 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -17,6 +17,8 @@
>   
>   #ifdef CONFIG_HAS_PCI
>   
> +#include <asm/p2m.h>
> +
>   #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>   
>   extern bool pci_passthrough_enabled;
> @@ -73,6 +75,9 @@ struct pci_ops {
>                   uint32_t reg, uint32_t len, uint32_t *value);
>       int (*write)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                    uint32_t reg, uint32_t len, uint32_t value);
> +    bool (*need_p2m_hwdom_mapping)(struct domain *d,
> +                                   struct pci_host_bridge *bridge,
> +                                   uint64_t addr);
>   };
>   
>   /*
> @@ -96,6 +101,9 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                                uint32_t reg, uint32_t len, uint32_t value);
>   void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                  pci_sbdf_t sbdf, uint32_t where);
> +bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> +                                     struct pci_host_bridge *bridge,
> +                                     uint64_t addr);
>   struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>   struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
>   int pci_get_host_bridge_segment(const struct dt_device_node *node,
> @@ -115,6 +123,8 @@ int pci_host_iterate_bridges(struct domain *d,
>                                           struct pci_host_bridge *bridge));
>   unsigned int pci_host_get_num_bridges(void);
>   
> +int pci_host_bridge_mappings(struct domain *d);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..88d9673db817 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -2,6 +2,8 @@
>   #define __ARM_SETUP_H_
>   
>   #include <public/version.h>
> +#include <asm/p2m.h>
> +#include <xen/device_tree.h>
>   
>   #define MIN_FDT_ALIGN 8
>   #define MAX_FDT_SIZE SZ_2M
> @@ -77,6 +79,14 @@ struct bootinfo {
>   #endif
>   };
>   
> +struct map_range_data
> +{
> +    struct domain *d;
> +    p2m_type_t p2mt;
> +    /* Set if mapping of the memory ranges must be skipped. */
> +    bool skip_mapping;
> +};
> +
>   extern struct bootinfo bootinfo;
>   
>   extern domid_t max_init_domid;
> @@ -124,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
>   u32 device_tree_get_u32(const void *fdt, int node,
>                           const char *prop_name, u32 dflt);
>   
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data);
> +
>   #endif
>   /*
>    * Local variables:
> 

Cheers,

-- 
Julien Grall


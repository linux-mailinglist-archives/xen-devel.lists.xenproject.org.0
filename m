Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB742C619
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 18:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208721.364956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magwE-0005Ql-Tc; Wed, 13 Oct 2021 16:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208721.364956; Wed, 13 Oct 2021 16:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magwE-0005Of-Pe; Wed, 13 Oct 2021 16:17:06 +0000
Received: by outflank-mailman (input) for mailman id 208721;
 Wed, 13 Oct 2021 16:17:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1magwD-0005OZ-JX
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 16:17:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1magwC-0000tF-G9; Wed, 13 Oct 2021 16:17:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1magwC-0005eR-5f; Wed, 13 Oct 2021 16:17:04 +0000
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
	bh=gO8TnwiFUo07IlO+zqwlumuepsm+ENhZRiA7zthjD44=; b=bjh1lTnUmH97t05PnnTjF4PBKB
	GAw8QUJBveUoX+8ke7YwNuybLdDlOCTqOVqGqFytEp3ewbLwFX1PPNh+SaAqO2v5MgnVn4yEB4ejn
	LzXGN5OMRs40LUq9aLKxORVNHOMAok1xQXeoxaSzscPW8038amizdB5kbczRzIKuQ7IE=;
Message-ID: <f5767857-a80a-fcc2-e70e-ce59ce19c8c9@xen.org>
Date: Wed, 13 Oct 2021 17:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/10] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-10-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211008055535.337436-10-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 08/10/2021 06:55, Oleksandr Andrushchenko wrote:
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

NIT: The space before "From" looks odd.

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
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
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
>   xen/arch/arm/domain_build.c        | 57 ++++++++++++++++++------------
>   xen/arch/arm/pci/ecam.c            | 14 ++++++++
>   xen/arch/arm/pci/pci-host-common.c | 49 +++++++++++++++++++++++++
>   xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
>   xen/include/asm-arm/pci.h          | 10 ++++++
>   xen/include/asm-arm/setup.h        | 13 +++++++
>   6 files changed, 121 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b51176b31bef..0d673b06a2f3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -10,7 +10,6 @@
>   #include <asm/regs.h>
>   #include <xen/errno.h>
>   #include <xen/err.h>
> -#include <xen/device_tree.h>
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
> @@ -1663,10 +1656,11 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>                                          const struct dt_irq *dt_irq,
>                                          void *data)
>   {
> -    struct domain *d = data;
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
>       unsigned int irq = dt_irq->irq;
>       int res;
> -    bool need_mapping = !dt_device_for_passthrough(dev);
> +    bool need_mapping = !mr_data->skip_mapping;

Before, the variable 'need_mapping' was helpful to understand what 
!dt_device_for_passthrough(). Now it feels odd to read. There is only 
one user, so can the local variable be dropped?

>   
>       if ( irq < NR_LOCAL_IRQS )
>       {
> @@ -1690,13 +1684,12 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
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
> +    bool need_mapping = !mr_data->skip_mapping;

Same here.

>       int res;
>   
>       /*
> @@ -1748,23 +1741,21 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
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
> @@ -1845,6 +1836,20 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>       int res;
>       u64 addr, size;
>       bool need_mapping = !dt_device_for_passthrough(dev);

I find the difference between .skip_mapping and the local variable 
need_mapping quite puzzling. We are likely going to misuse them in the 
future.

I think it would be clearer if the local variable is renamed to 
'own_device' or similar.

> +    /*
> +     * For PCI passthrough we only need to remap to Dom0 the interrupts
> +     * and memory ranges from "reg" property which cover controller's
> +     * configuration registers and such. PCIe configuration space registers
> +     * of the PCIe Root Complex and PCIe aperture should not be mapped
> +     * automatically to Dom0.
> +     */
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = !need_mapping ||
> +                        (is_pci_passthrough_enabled() &&
> +                         (device_get_class(dev) == DEVICE_PCI))

The device class is confusing. When I see DEVICE_PCI, I think this is a 
PCI device whereas here you are referring to the hostbridge.

Unfortunate, I wasn't able to comment on the original patch before it 
was committed. But I would like this to be renamed to 
DEVICE_PCI_HOSTBRIDGE for Xen 4.16. Can you send a patch?

> +    };
>   
>       naddr = dt_number_of_address(dev);
>   
> @@ -1884,7 +1889,6 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>       /* Give permission and map MMIOs */
>       for ( i = 0; i < naddr; i++ )
>       {
> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
>           res = dt_device_get_address(dev, i, &addr, &size);
>           if ( res )
>           {
> @@ -1898,7 +1902,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>               return res;
>       }
>   
> -    res = map_device_children(d, dev, p2mt);
> +    res = map_device_children(dev, &mr_data);
>       if ( res )
>           return res;
>   
> @@ -3056,7 +3060,14 @@ static int __init construct_dom0(struct domain *d)
>           return rc;
>   
>       if ( acpi_disabled )
> +    {
>           rc = prepare_dtb_hwdom(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +#ifdef CONFIG_HAS_PCI
> +        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);

It is not clear to me why you are passing p2m_mmio_direct_c and not p2mt 
here? If you really want to force a type, then I think it should be 
p2m_mmio_direct.

But then why is it a parameter of pci_host_bridge_mappings? Do you 
expect someone else to modify it?

> +#endif
> +    }
>       else
>           rc = prepare_acpi(d, &kinfo);
>   
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 602d00799c8d..b81620074a91 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -40,6 +40,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>       return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
>   }
>   
> +bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,

AFAICT, this is only used by boot code. So you want to do add __init.

This is also exported but not used. I would prefer if we only exposed 
when the first external user will be introduced.

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
> index 1eb4daa87365..085f08e23e0c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -18,6 +18,7 @@
>   
>   #include <xen/init.h>
>   #include <xen/pci.h>
> +#include <asm/setup.h>

For new code, we usually include xen/*.h first and then asm/*.h. They 
are then order alphabetically within themselves.

>   #include <xen/rwlock.h>
>   #include <xen/sched.h>
>   #include <xen/vmap.h>
> @@ -320,6 +321,54 @@ int pci_host_get_num_bridges(void)
>       return count;
>   }
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

AFAIU, "assigned-addresses" is only relevant for the child of nodes with 
type="pci". This is not the case for the hostbridges. So I think you 
want to drop the mention of "assigned-addresses".


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
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index 61a9807d3d58..6ad2b31e810d 100644
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
> index a71b0eea8cb9..b5b85ccd0937 100644
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
>   int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                   uint16_t *segment);
> @@ -113,6 +121,8 @@ int pci_host_iterate_bridges(struct domain *d,
>                                           struct pci_host_bridge *bridge));
>   int pci_host_get_num_bridges(void);
>   
> +int pci_host_bridge_mappings(struct domain *d, p2m_type_t p2mt);
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

-- 
Julien Grall


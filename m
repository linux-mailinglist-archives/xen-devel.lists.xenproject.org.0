Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F27932DF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595917.929603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgK9-0007NJ-65; Wed, 06 Sep 2023 00:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595917.929603; Wed, 06 Sep 2023 00:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgK9-0007Jw-1c; Wed, 06 Sep 2023 00:23:13 +0000
Received: by outflank-mailman (input) for mailman id 595917;
 Wed, 06 Sep 2023 00:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgK7-0007Jq-Df
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:23:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d93d091-4c4b-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 02:23:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA5456068B;
 Wed,  6 Sep 2023 00:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8E5C433C7;
 Wed,  6 Sep 2023 00:23:04 +0000 (UTC)
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
X-Inumbo-ID: 8d93d091-4c4b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693959786;
	bh=WjEU1NG7SBttOuygurde7rk8UQ6DInqhhKjGYODUJoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tY1MwAud+jZox1jUYPzY3lk+/3SzWHD5vKNgtu9zUb5sAUSVRFyvQlnvkp7kZRPC6
	 9hRmF1zUkDgSYicVgrpo2zdCfo/PYW76+nQq5CCg8cmxAvD5cTNBJz5BHYIblJbOYN
	 bL6132LFQzWNNDg0ZmSqlRhv/48D2cb/TJmWzjmHtLW/m6oI+Pj/PIr/5N4M5wZGSk
	 HlxW5lY+cTlDT62efirNuwknXnuioxBPpvEFCSZUUMFwzejwLep7Ti2IYeYS8MDkd+
	 f6LSaLfhC0AgGpvDlTfwmNGyqC+8LhQyRWc9OHmsem8toxhywJdFp2sExzTQ3QwILw
	 7/SsFNrW3vYuQ==
Date: Tue, 5 Sep 2023 17:23:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v11 03/20] xen/arm/device: Remove __init from function
 type
In-Reply-To: <20230901045947.32351-4-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051722550.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-4-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Vikram Garhwal wrote:
> Remove __init from following function to access during runtime:
>     1. map_irq_to_domain()
>     2. handle_device_interrupts()
>     3. map_range_to_domain()
>     4. unflatten_dt_node()
>     5. handle_device()
>     6. map_device_children()
>     7. map_dt_irq_to_domain()
> Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> 
> Above changes will create an error on build as non-init function are still
> in domain_build.c file. So, to avoid build fails, following changes are done:
> 1. Move map_irq_to_domain(), handle_device_interrupts(), map_range_to_domain(),
>     handle_device(), map_device_children() and map_dt_irq_to_domain()
>     to device.c. After removing __init type,  these functions are not specific
>     to domain building, so moving them out of domain_build.c to device.c.
> 2. Remove static type from handle_device_interrupts().
> 
> Also, renamed handle_device_interrupts() to map_device_irqs_to_domain().
> 
> Overall, these changes are done to support the dynamic programming of a nodes
> where an overlay node will be added to fdt and unflattened node will be added to
> dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v10:
>     Remove unnecessary rangeset variables  from handle_device() declaration.
>     Rename handle_device_interrupts() to map_device_irqs_to_domain().
>     Fix code styles.
> 
> Changes from v9:
>     Move handle_device(), map_device_children() and map_dt_irq_to_domain() out
>         of domain_build.c
> ---
> ---
>  xen/arch/arm/device.c                   | 294 +++++++++++++++++++++++
>  xen/arch/arm/domain_build.c             | 295 +-----------------------
>  xen/arch/arm/include/asm/domain_build.h |   2 -
>  xen/arch/arm/include/asm/setup.h        |   9 +
>  xen/common/device_tree.c                |  12 +-
>  5 files changed, 310 insertions(+), 302 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index ca8539dee5..327e4d24fb 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -9,8 +9,10 @@
>   */
>  
>  #include <asm/device.h>
> +#include <asm/setup.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/iocap.h>
>  #include <xen/lib.h>
>  
>  extern const struct device_desc _sdevice[], _edevice[];
> @@ -75,6 +77,298 @@ enum device_class device_get_class(const struct dt_device_node *dev)
>      return DEVICE_UNKNOWN;
>  }
>  
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
> +                      bool need_mapping, const char *devname)
> +{
> +    int res;
> +
> +    res = irq_permit_access(d, irq);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
> +        return res;
> +    }
> +
> +    if ( need_mapping )
> +    {
> +        /*
> +         * Checking the return of vgic_reserve_virq is not
> +         * necessary. It should not fail except when we try to map
> +         * the IRQ twice. This can legitimately happen if the IRQ is shared
> +         */
> +        vgic_reserve_virq(d, irq);
> +
> +        res = route_irq_to_guest(d, irq, irq, devname);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - IRQ: %u\n", irq);
> +    return 0;
> +}
> +
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
> +    int res;
> +
> +    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
> +    {
> +        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
> +               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
> +        return -ERANGE;
> +    }
> +
> +    /*
> +     * reserved-memory regions are RAM carved out for a special purpose.
> +     * They are not MMIO and therefore a domain should not be able to
> +     * manage them via the IOMEM interface.
> +     */
> +    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> +                     strlen("/reserved-memory/")) != 0 )
> +    {
> +        res = iomem_permit_access(d, paddr_to_pfn(addr),
> +                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> +                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                    d->domain_id,
> +                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> +            return res;
> +        }
> +    }
> +
> +    if ( !mr_data->skip_mapping )
> +    {
> +        res = map_regions_p2mt(d,
> +                               gaddr_to_gfn(addr),
> +                               PFN_UP(len),
> +                               maddr_to_mfn(addr),
> +                               mr_data->p2mt);
> +
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> +                   " - 0x%"PRIx64" in domain %d\n",
> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> +                   d->domain_id);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> +               addr, addr + len, mr_data->p2mt);
> +
> +    return 0;
> +}
> +
> +/*
> + * map_device_irqs_to_domain retrieves the interrupts configuration from
> + * a device tree node and maps those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
> +int map_device_irqs_to_domain(struct domain *d,
> +                              struct dt_device_node *dev,
> +                              bool need_mapping)
> +{
> +    unsigned int i, nirq;
> +    int res;
> +    struct dt_raw_irq rirq;
> +
> +    nirq = dt_number_of_irq(dev);
> +
> +    /* Give permission and map IRQs */
> +    for ( i = 0; i < nirq; i++ )
> +    {
> +        res = dt_device_get_raw_irq(dev, i, &rirq);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        /*
> +         * Don't map IRQ that have no physical meaning
> +         * ie: IRQ whose controller is not the GIC
> +         */
> +        if ( rirq.controller != dt_interrupt_controller )
> +        {
> +            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> +                      i, dt_node_full_name(rirq.controller));
> +            continue;
> +        }
> +
> +        res = platform_get_irq(dev, i);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> +        if ( res )
> +            return res;
> +    }
> +
> +    return 0;
> +}
> +
> +static int map_dt_irq_to_domain(const struct dt_device_node *dev,
> +                                const struct dt_irq *dt_irq,
> +                                void *data)
> +{
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
> +    unsigned int irq = dt_irq->irq;
> +    int res;
> +
> +    if ( irq < NR_LOCAL_IRQS )
> +    {
> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
> +        return -EINVAL;
> +    }
> +
> +    /* Setup the IRQ type */
> +    res = irq_set_spi_type(irq, dt_irq->type);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> +               dt_node_name(dev), irq, d);
> +        return res;
> +    }
> +
> +    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
> +
> +    return res;
> +}
> +
> +/*
> + * For a node which describes a discoverable bus (such as a PCI bus)
> + * then we may need to perform additional mappings in order to make
> + * the child resources available to domain 0.
> + */
> +static int map_device_children(const struct dt_device_node *dev,
> +                               struct map_range_data *mr_data)
> +{
> +    if ( dt_device_type_is_equal(dev, "pci") )
> +    {
> +        int ret;
> +
> +        dt_dprintk("Mapping children of %s to guest\n",
> +                   dt_node_full_name(dev));
> +
> +        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
> +        if ( ret < 0 )
> +            return ret;
> +
> +        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
> +        if ( ret < 0 )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * For a given device node:
> + *  - Give permission to the guest to manage IRQ and MMIO range
> + *  - Retrieve the IRQ configuration (i.e edge/level) from device tree
> + * When the device is not marked for guest passthrough:
> + *  - Try to call iommu_add_dt_device to protect the device by an IOMMU
> + *  - Assign the device to the guest if it's protected by an IOMMU
> + *  - Map the IRQs and iomem regions to DOM0
> + */
> +int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
> +{
> +    unsigned int naddr;
> +    unsigned int i;
> +    int res;
> +    paddr_t addr, size;
> +    bool own_device = !dt_device_for_passthrough(dev);
> +    /*
> +     * We want to avoid mapping the MMIO in dom0 for the following cases:
> +     *   - The device is owned by dom0 (i.e. it has been flagged for
> +     *     passthrough).
> +     *   - PCI host bridges with driver in Xen. They will later be mapped by
> +     *     pci_host_bridge_mappings().
> +     */
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = !own_device ||
> +                        (is_pci_passthrough_enabled() &&
> +                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
> +    };
> +
> +    naddr = dt_number_of_address(dev);
> +
> +    dt_dprintk("%s passthrough = %d naddr = %u\n",
> +               dt_node_full_name(dev), own_device, naddr);
> +
> +    if ( own_device )
> +    {
> +        dt_dprintk("Check if %s is behind the IOMMU and add it\n",
> +                   dt_node_full_name(dev));
> +
> +        res = iommu_add_dt_device(dev);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
> +                   dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        if ( dt_device_is_protected(dev) )
> +        {
> +            dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
> +            res = iommu_assign_dt_device(d, dev);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to setup the IOMMU for %s\n",
> +                       dt_node_full_name(dev));
> +                return res;
> +            }
> +        }
> +    }
> +
> +    res = map_device_irqs_to_domain(d, dev, own_device);
> +    if ( res < 0 )
> +        return res;
> +
> +    /* Give permission and map MMIOs */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        res = dt_device_get_paddr(dev, i, &addr, &size);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        res = map_range_to_domain(dev, addr, size, &mr_data);
> +        if ( res )
> +            return res;
> +    }
> +
> +    res = map_device_children(dev, &mr_data);
> +    if ( res )
> +        return res;
> +
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 54bf5623c8..ff4fc30769 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2293,299 +2293,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
>  
> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
> -                             bool need_mapping, const char *devname)
> -{
> -    int res;
> -
> -    res = irq_permit_access(d, irq);
> -    if ( res )
> -    {
> -        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
> -        return res;
> -    }
> -
> -    if ( need_mapping )
> -    {
> -        /*
> -         * Checking the return of vgic_reserve_virq is not
> -         * necessary. It should not fail except when we try to map
> -         * the IRQ twice. This can legitimately happen if the IRQ is shared
> -         */
> -        vgic_reserve_virq(d, irq);
> -
> -        res = route_irq_to_guest(d, irq, irq, devname);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - IRQ: %u\n", irq);
> -    return 0;
> -}
> -
> -static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
> -                                       const struct dt_irq *dt_irq,
> -                                       void *data)
> -{
> -    struct map_range_data *mr_data = data;
> -    struct domain *d = mr_data->d;
> -    unsigned int irq = dt_irq->irq;
> -    int res;
> -
> -    if ( irq < NR_LOCAL_IRQS )
> -    {
> -        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
> -        return -EINVAL;
> -    }
> -
> -    /* Setup the IRQ type */
> -    res = irq_set_spi_type(irq, dt_irq->type);
> -    if ( res )
> -    {
> -        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> -               dt_node_name(dev), irq, d);
> -        return res;
> -    }
> -
> -    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
> -
> -    return res;
> -}
> -
> -int __init map_range_to_domain(const struct dt_device_node *dev,
> -                               uint64_t addr, uint64_t len, void *data)
> -{
> -    struct map_range_data *mr_data = data;
> -    struct domain *d = mr_data->d;
> -    int res;
> -
> -    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
> -    {
> -        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
> -               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
> -        return -ERANGE;
> -    }
> -
> -    /*
> -     * reserved-memory regions are RAM carved out for a special purpose.
> -     * They are not MMIO and therefore a domain should not be able to
> -     * manage them via the IOMEM interface.
> -     */
> -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> -                     strlen("/reserved-memory/")) != 0 )
> -    {
> -        res = iomem_permit_access(d, paddr_to_pfn(addr),
> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> -                    d->domain_id,
> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> -            return res;
> -        }
> -    }
> -
> -    if ( !mr_data->skip_mapping )
> -    {
> -        res = map_regions_p2mt(d,
> -                               gaddr_to_gfn(addr),
> -                               PFN_UP(len),
> -                               maddr_to_mfn(addr),
> -                               mr_data->p2mt);
> -
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> -                   " - 0x%"PRIx64" in domain %d\n",
> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> -                   d->domain_id);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> -               addr, addr + len, mr_data->p2mt);
> -
> -    return 0;
> -}
> -
> -/*
> - * For a node which describes a discoverable bus (such as a PCI bus)
> - * then we may need to perform additional mappings in order to make
> - * the child resources available to domain 0.
> - */
> -static int __init map_device_children(const struct dt_device_node *dev,
> -                                      struct map_range_data *mr_data)
> -{
> -    if ( dt_device_type_is_equal(dev, "pci") )
> -    {
> -        int ret;
> -
> -        dt_dprintk("Mapping children of %s to guest\n",
> -                   dt_node_full_name(dev));
> -
> -        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
> -        if ( ret < 0 )
> -            return ret;
> -
> -        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
> -        if ( ret < 0 )
> -            return ret;
> -    }
> -
> -    return 0;
> -}
> -
> -/*
> - * handle_device_interrupts retrieves the interrupts configuration from
> - * a device tree node and maps those interrupts to the target domain.
> - *
> - * Returns:
> - *   < 0 error
> - *   0   success
> - */
> -static int __init handle_device_interrupts(struct domain *d,
> -                                           struct dt_device_node *dev,
> -                                           bool need_mapping)
> -{
> -    unsigned int i, nirq;
> -    int res;
> -    struct dt_raw_irq rirq;
> -
> -    nirq = dt_number_of_irq(dev);
> -
> -    /* Give permission and map IRQs */
> -    for ( i = 0; i < nirq; i++ )
> -    {
> -        res = dt_device_get_raw_irq(dev, i, &rirq);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        /*
> -         * Don't map IRQ that have no physical meaning
> -         * ie: IRQ whose controller is not the GIC
> -         */
> -        if ( rirq.controller != dt_interrupt_controller )
> -        {
> -            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> -                      i, dt_node_full_name(rirq.controller));
> -            continue;
> -        }
> -
> -        res = platform_get_irq(dev, i);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> -        if ( res )
> -            return res;
> -    }
> -
> -    return 0;
> -}
> -
> -/*
> - * For a given device node:
> - *  - Give permission to the guest to manage IRQ and MMIO range
> - *  - Retrieve the IRQ configuration (i.e edge/level) from device tree
> - * When the device is not marked for guest passthrough:
> - *  - Try to call iommu_add_dt_device to protect the device by an IOMMU
> - *  - Assign the device to the guest if it's protected by an IOMMU
> - *  - Map the IRQs and iomem regions to DOM0
> - */
> -static int __init handle_device(struct domain *d, struct dt_device_node *dev,
> -                                p2m_type_t p2mt)
> -{
> -    unsigned int naddr;
> -    unsigned int i;
> -    int res;
> -    paddr_t addr, size;
> -    bool own_device = !dt_device_for_passthrough(dev);
> -    /*
> -     * We want to avoid mapping the MMIO in dom0 for the following cases:
> -     *   - The device is owned by dom0 (i.e. it has been flagged for
> -     *     passthrough).
> -     *   - PCI host bridges with driver in Xen. They will later be mapped by
> -     *     pci_host_bridge_mappings().
> -     */
> -    struct map_range_data mr_data = {
> -        .d = d,
> -        .p2mt = p2mt,
> -        .skip_mapping = !own_device ||
> -                        (is_pci_passthrough_enabled() &&
> -                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
> -    };
> -
> -    naddr = dt_number_of_address(dev);
> -
> -    dt_dprintk("%s passthrough = %d naddr = %u\n",
> -               dt_node_full_name(dev), own_device, naddr);
> -
> -    if ( own_device )
> -    {
> -        dt_dprintk("Check if %s is behind the IOMMU and add it\n",
> -                   dt_node_full_name(dev));
> -
> -        res = iommu_add_dt_device(dev);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
> -                   dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        if ( dt_device_is_protected(dev) )
> -        {
> -            dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
> -            res = iommu_assign_dt_device(d, dev);
> -            if ( res )
> -            {
> -                printk(XENLOG_ERR "Failed to setup the IOMMU for %s\n",
> -                       dt_node_full_name(dev));
> -                return res;
> -            }
> -        }
> -    }
> -
> -    res = handle_device_interrupts(d, dev, own_device);
> -    if ( res < 0 )
> -        return res;
> -
> -    /* Give permission and map MMIOs */
> -    for ( i = 0; i < naddr; i++ )
> -    {
> -        res = dt_device_get_paddr(dev, i, &addr, &size);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        res = map_range_to_domain(dev, addr, size, &mr_data);
> -        if ( res )
> -            return res;
> -    }
> -
> -    res = map_device_children(dev, &mr_data);
> -    if ( res )
> -        return res;
> -
> -    return 0;
> -}
> -
>  static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                                struct dt_device_node *node,
>                                p2m_type_t p2mt)
> @@ -3038,7 +2745,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>          return -EINVAL;
>      }
>  
> -    res = handle_device_interrupts(kinfo->d, node, true);
> +    res = map_device_irqs_to_domain(kinfo->d, node, true);
>      if ( res < 0 )
>          return res;
>  
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 34ceddc995..b9329c9ee0 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -4,8 +4,6 @@
>  #include <xen/sched.h>
>  #include <asm/kernel.h>
>  
> -int map_irq_to_domain(struct domain *d, unsigned int irq,
> -                      bool need_mapping, const char *devname);
>  int make_chosen_node(const struct kernel_info *kinfo);
>  void evtchn_allocate(struct domain *d);
>  
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 19dc637d55..6cda3e4039 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -165,6 +165,15 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
>  
> +int handle_device(struct domain *d, struct dt_device_node *dev,
> +                  p2m_type_t p2mt);
> +
> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
> +                              bool need_mapping);
> +
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
> +                      bool need_mapping, const char *devname);
> +
>  int map_range_to_domain(const struct dt_device_node *dev,
>                          uint64_t addr, uint64_t len, void *data);
>  
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index b6d9f018c6..fccf98f94e 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1847,12 +1847,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>   * @allnextpp: pointer to ->allnext from last allocated device_node
>   * @fpsize: Size of the node path up at the current depth.
>   */
> -static unsigned long __init unflatten_dt_node(const void *fdt,
> -                                              unsigned long mem,
> -                                              unsigned long *p,
> -                                              struct dt_device_node *dad,
> -                                              struct dt_device_node ***allnextpp,
> -                                              unsigned long fpsize)
> +static unsigned long unflatten_dt_node(const void *fdt,
> +                                       unsigned long mem,
> +                                       unsigned long *p,
> +                                       struct dt_device_node *dad,
> +                                       struct dt_device_node ***allnextpp,
> +                                       unsigned long fpsize)
>  {
>      struct dt_device_node *np;
>      struct dt_property *pp, **prev_pp = NULL;
> -- 
> 2.17.1
> 


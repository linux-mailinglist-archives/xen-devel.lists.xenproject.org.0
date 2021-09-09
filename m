Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A3405FC2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183683.331964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSwB-0006ok-5k; Thu, 09 Sep 2021 22:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183683.331964; Thu, 09 Sep 2021 22:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSwB-0006mC-2I; Thu, 09 Sep 2021 22:54:31 +0000
Received: by outflank-mailman (input) for mailman id 183683;
 Thu, 09 Sep 2021 22:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOSw9-0006m6-K3
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:54:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86979d71-c850-45bf-9d2d-ad83fc7b2055;
 Thu, 09 Sep 2021 22:54:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1ECFA61074;
 Thu,  9 Sep 2021 22:54:27 +0000 (UTC)
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
X-Inumbo-ID: 86979d71-c850-45bf-9d2d-ad83fc7b2055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631228067;
	bh=KqKonysZXzQ1LTEy+oVeLNDH9vOD4qd2Sqb5YMgnwxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HxldIXbqsCnU2XPEmNb/LdvFZQezlI0abfIY0theLNKBTME/BBCxywshBf0h53lwt
	 X2w8UjrfLgsldzFn6lk5I4adn0VDjJUu/1TwOM+rY6Rl8OVf8puy43Ojna9u41fFEi
	 EJIpcRl6QLp+kKIyMWorAJR1DCc6zv5QkOKsZejplLSwPQd5oKxzD24isfuGSIVF2Z
	 r5AIVquX4RX87eVdP1Afv1RDsn1Ggz6gPWON5vGjCokocCvszHB0hls0Q5DNSZvtzU
	 oSDBNeTNty7TmAF4Nla7V+f5/SwU/qvbE3d0RQQTFHQFgVqhKcn9WrBbTg33wxsMJB
	 w61zfpiZGypgg==
Date: Thu, 9 Sep 2021 15:54:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091540470.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1112020077-1631227292=:10523"
Content-ID: <alpine.DEB.2.21.2109091541340.10523@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1112020077-1631227292=:10523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109091541341.10523@sstabellini-ThinkPad-T480s>

On Thu, 19 Aug 2021, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> As of now "pci-host-ecam-generic" compatible board is supported.
> 
> "linux,pci-domain" device tree property assigns a fixed PCI domain
> number to a host bridge, otherwise an unstable (across boots) unique
> number will be assigned by Linux.This property has to be in sync with
> XEN to access the PCI devices.
> 
> XEN will read the “linux,pci-domain” property from the device tree node
> and configure the host bridge segment number accordingly. If this
> property is not available XEN will allocate the unique segment number
> to the host bridge.
> 
> dt_get_pci_domain_nr(..) and dt_pci_bus_find_domain_nr(..) are directly
> imported from the Linux source tree.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/pci/Makefile           |   2 +
>  xen/arch/arm/pci/pci-host-common.c  | 261 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c |  55 ++++++
>  xen/include/asm-arm/pci.h           |  28 +++
>  4 files changed, 346 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-common.c
>  create mode 100644 xen/arch/arm/pci/pci-host-generic.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index a9ee0b9b44..f3d97f859e 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -1,2 +1,4 @@
>  obj-y += pci.o
>  obj-y += pci-access.o
> +obj-y += pci-host-generic.o
> +obj-y += pci-host-common.o
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> new file mode 100644
> index 0000000000..9dd9b02271
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -0,0 +1,261 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * Based on Linux drivers/pci/ecam.c
> + * Copyright 2016 Broadcom.
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/vmap.h>
> +
> +/*
> + * List for all the pci host bridges.
> + */
> +
> +static LIST_HEAD(pci_host_bridges);
> +
> +static atomic_t domain_nr = ATOMIC_INIT(-1);
> +
> +bool dt_pci_parse_bus_range(struct dt_device_node *dev,
> +                            struct pci_config_window *cfg)
> +{
> +    const __be32 *cells;
> +    uint32_t len;
> +
> +    cells = dt_get_property(dev, "bus-range", &len);
> +    /* bus-range should at least be 2 cells */
> +    if ( !cells || (len < (sizeof(*cells) * 2)) )
> +        return false;
> +
> +    cfg->busn_start = dt_next_cell(1, &cells);
> +    cfg->busn_end = dt_next_cell(1, &cells);
> +
> +    return true;
> +}
> +
> +static inline void __iomem *pci_remap_cfgspace(paddr_t start, size_t len)
> +{
> +    return ioremap_nocache(start, len);
> +}
> +
> +static void pci_ecam_free(struct pci_config_window *cfg)
> +{
> +    if ( cfg->win )
> +        iounmap(cfg->win);
> +
> +    xfree(cfg);
> +}
> +
> +static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
> +                                              int ecam_reg_idx)

If it is only called at init time, then the function should be __init


> +{
> +    int err;
> +    struct pci_config_window *cfg;
> +    paddr_t addr, size;
> +
> +    cfg = xzalloc(struct pci_config_window);
> +    if ( !cfg )
> +        return NULL;
> +
> +    err = dt_pci_parse_bus_range(dev, cfg);
> +    if ( !err ) {
> +        cfg->busn_start = 0;
> +        cfg->busn_end = 0xff;
> +        printk(XENLOG_ERR "%s:No bus range found for pci controller\n",
> +               dt_node_full_name(dev));
> +    } else {
> +        if ( cfg->busn_end > cfg->busn_start + 0xff )
> +            cfg->busn_end = cfg->busn_start + 0xff;

Is this a hard limit in the specification? Or is it a limit in the Xen
implementation?


> +    }
> +
> +    /* Parse our PCI ecam register address*/
                                            ^ space

> +    err = dt_device_get_address(dev, ecam_reg_idx, &addr, &size);
> +    if ( err )
> +        goto err_exit;
> +
> +    cfg->phys_addr = addr;
> +    cfg->size = size;
> +
> +    /*
> +     * On 64-bit systems, we do a single ioremap for the whole config space
> +     * since we have enough virtual address range available.  On 32-bit, we
> +     * ioremap the config space for each bus individually.
> +     *
> +     * As of now only 64-bit is supported 32-bit is not supported.
> +     */
> +    cfg->win = pci_remap_cfgspace(cfg->phys_addr, cfg->size);
> +    if ( !cfg->win )
> +        goto err_exit_remap;
> +
> +    printk("ECAM at [mem %lx-%lx] for [bus %x-%x] \n",cfg->phys_addr,
> +            cfg->phys_addr + cfg->size - 1, cfg->busn_start, cfg->busn_end);
> +
> +    return cfg;
> +
> +err_exit_remap:
> +    printk(XENLOG_ERR "ECAM ioremap failed\n");
> +err_exit:
> +    pci_ecam_free(cfg);
> +    return NULL;
> +}
> +
> +struct pci_host_bridge *pci_alloc_host_bridge(void)
> +{
> +    struct pci_host_bridge *bridge = xzalloc(struct pci_host_bridge);
> +
> +    if ( !bridge )
> +        return NULL;
> +
> +    INIT_LIST_HEAD(&bridge->node);
> +    bridge->bus_start = ~0;
> +    bridge->bus_end = ~0;

Please use INVALID_PADDR instead of ~0


> +    return bridge;
> +}
> +
> +void pci_add_host_bridge(struct pci_host_bridge *bridge)
> +{
> +    list_add_tail(&bridge->node, &pci_host_bridges);
> +}
> +
> +static int pci_get_new_domain_nr(void)
> +{
> +    return atomic_inc_return(&domain_nr);
> +}
> +
> +/*
> + * This function will try to obtain the host bridge domain number by
> + * finding a property called "linux,pci-domain" of the given device node.
> + *
> + * @node: device tree node with the domain information
> + *
> + * Returns the associated domain number from DT in the range [0-0xffff], or
> + * a negative value if the required property is not found.
> + */
> +static int dt_get_pci_domain_nr(struct dt_device_node *node)
> +{
> +    u32 domain;
> +    int error;
> +
> +    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
> +    if ( !error )
> +        return -EINVAL;
> +
> +    return (u16)domain;

Let's check that domain <= UINT16_MAX


> +}
> +
> +static int pci_bus_find_domain_nr(struct dt_device_node *dev)
> +{
> +    static int use_dt_domains = -1;
> +    int domain;
> +
> +    domain = dt_get_pci_domain_nr(dev);
> +
> +    /*
> +     * Check DT domain and use_dt_domains values.
> +     *
> +     * If DT domain property is valid (domain >= 0) and
> +     * use_dt_domains != 0, the DT assignment is valid since this means
> +     * we have not previously allocated a domain number by using
> +     * pci_get_new_domain_nr(); we should also update use_dt_domains to
> +     * 1, to indicate that we have just assigned a domain number from
> +     * DT.
> +     *
> +     * If DT domain property value is not valid (ie domain < 0), and we
> +     * have not previously assigned a domain number from DT
> +     * (use_dt_domains != 1) we should assign a domain number by
> +     * using the:
> +     *
> +     * pci_get_new_domain_nr()
> +     *
> +     * API and update the use_dt_domains value to keep track of method we
> +     * are using to assign domain numbers (use_dt_domains = 0).
> +     *
> +     * All other combinations imply we have a platform that is trying
> +     * to mix domain numbers obtained from DT and pci_get_new_domain_nr(),
> +     * which is a recipe for domain mishandling and it is prevented by
> +     * invalidating the domain value (domain = -1) and printing a
> +     * corresponding error.
> +     */
> +    if ( domain >= 0 && use_dt_domains )
> +    {
> +        use_dt_domains = 1;
> +    }
> +    else if ( domain < 0 && use_dt_domains != 1 )
> +    {
> +        use_dt_domains = 0;
> +        domain = pci_get_new_domain_nr();
> +    }
> +    else
> +    {
> +        printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in DT\n");
> +        BUG();
> +    }
> +
> +    return domain;
> +}
> +
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          int ecam_reg_idx)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct pci_config_window *cfg;
> +    int err;
> +
> +    bridge = pci_alloc_host_bridge();
> +    if ( !bridge )
> +        return -ENOMEM;
> +
> +    /* Parse and map our Configuration Space windows */
> +    cfg = gen_pci_init(dev, ecam_reg_idx);
> +    if ( !cfg )
> +    {
> +        err = -ENOMEM;
> +        goto err_exit;
> +    }
> +
> +    bridge->dt_node = dev;
> +    bridge->sysdata = cfg;
> +    bridge->bus_start = cfg->busn_start;
> +    bridge->bus_end = cfg->busn_end;
> +
> +    bridge->segment = pci_bus_find_domain_nr(dev);
> +
> +    pci_add_host_bridge(bridge);
> +
> +    return 0;
> +
> +err_exit:
> +    xfree(bridge);
> +    return err;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> new file mode 100644
> index 0000000000..13d0f7f999
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -0,0 +1,55 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <asm/device.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +static const struct dt_device_match gen_pci_dt_match[] = {
> +    { .compatible = "pci-host-ecam-generic" },
> +    { },
> +};
> +
> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
> +{
> +    const struct dt_device_match *of_id;
> +
> +    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
> +
> +    printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
> +           dt_node_full_name(dev), of_id->compatible);
> +
> +    return pci_host_common_probe(dev, 0);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +.dt_match = gen_pci_dt_match,
> +.init = gen_pci_dt_init,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 61e43da088..58a51e724e 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,34 @@ struct arch_pci_dev {
>      struct device dev;
>  };
>  
> +/*
> + * struct to hold the mappings of a config space window. This
> + * is expected to be used as sysdata for PCI controllers that
> + * use ECAM.
> + */
> +struct pci_config_window {
> +    paddr_t         phys_addr;
> +    paddr_t         size;
> +    uint8_t         busn_start;
> +    uint8_t         busn_end;
> +    void __iomem    *win;
> +};
> +
> +/*
> + * struct to hold pci host bridge information
> + * for a PCI controller.
> + */
> +struct pci_host_bridge {
> +    struct dt_device_node *dt_node;  /* Pointer to the associated DT node */
> +    struct list_head node;           /* Node in list of host bridges */
> +    uint16_t segment;                /* Segment number */
> +    u8 bus_start;                    /* Bus start of this bridge. */
> +    u8 bus_end;                      /* Bus end of this bridge. */
> +    void *sysdata;                   /* Pointer to the config space window*/
> +};
> +
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          int ecam_reg_idx);
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> -- 
> 2.17.1
> 
--8323329-1112020077-1631227292=:10523--


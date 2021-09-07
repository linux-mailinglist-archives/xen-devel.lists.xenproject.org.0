Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA554025E9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180663.327405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNX2e-0005Ye-1g; Tue, 07 Sep 2021 09:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180663.327405; Tue, 07 Sep 2021 09:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNX2d-0005We-UV; Tue, 07 Sep 2021 09:05:19 +0000
Received: by outflank-mailman (input) for mailman id 180663;
 Tue, 07 Sep 2021 09:05:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNX2c-0005WY-QM
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:05:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNX2b-00005T-PO; Tue, 07 Sep 2021 09:05:17 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNX2b-0004Qi-Eu; Tue, 07 Sep 2021 09:05:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=o9uZx/FtwTATu6iK2Vt8bQFkyHvBw8HnDgDM6Gd6PC0=; b=T6r3AcXHqiT1ZEsFp6ljuOmC43
	Kk/cA7SpQCm0UrvFCRIWFB68miptBD4zmrLgkFZYciCMpnEAJn5sVRlMRdI3g4jq/V34ftAe0AxOG
	bZ2dx2nM9JBxxUG0yyoeELg3U7KZO90h4mTjFPpBK88DS+kt89E7ybntIOTcWmXj5gzk=;
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f4a0284-302e-47e9-6958-47dca449d580@xen.org>
Date: Tue, 7 Sep 2021 10:05:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> As of now "pci-host-ecam-generic" compatible board is supported.

I think the word "only" is missing.

> 
> "linux,pci-domain" device tree property assigns a fixed PCI domain
> number to a host bridge, otherwise an unstable (across boots) unique
> number will be assigned by Linux.This property has to be in sync with

Typo: missing space after the '.'

> XEN to access the PCI devices.

I would expand a little bit the last sentence to explain why the need to 
be sync-ed.

> > XEN will read the “linux,pci-domain” property from the device tree node
> and configure the host bridge segment number accordingly. If this
> property is not available XEN will allocate the unique segment number
> to the host bridge.
> 
> dt_get_pci_domain_nr(..) and dt_pci_bus_find_domain_nr(..) are directly
> imported from the Linux source tree.

What was the Linux commit used? I also read "directly imported" as a 
verbartim copy but AFAICT the implementation has been slightly reworked.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/pci/Makefile           |   2 +
>   xen/arch/arm/pci/pci-host-common.c  | 261 ++++++++++++++++++++++++++++
>   xen/arch/arm/pci/pci-host-generic.c |  55 ++++++
>   xen/include/asm-arm/pci.h           |  28 +++
>   4 files changed, 346 insertions(+)
>   create mode 100644 xen/arch/arm/pci/pci-host-common.c
>   create mode 100644 xen/arch/arm/pci/pci-host-generic.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index a9ee0b9b44..f3d97f859e 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -1,2 +1,4 @@
>   obj-y += pci.o
>   obj-y += pci-access.o
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

AFAICT, <xen/pci.h> already includes <asm/pci.h>. So this looks 
unneccessary.

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

Aside, "pci_config_window", the function is not Arm specific. Would it 
be possible to consider to introduce "struct resource" in Xen so this 
function can be moved in common/device_tree.c?

> +{
> +    const __be32 *cells;
> +    uint32_t len;
> +
> +    cells = dt_get_property(dev, "bus-range", &len);
> +    /* bus-range should at least be 2 cells */
> +    if ( !cells || (len < (sizeof(*cells) * 2)) )
> +        return false;

How about introducing dt_property_read_u32_array()?

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

Typo: Missing space after ':'.

> +               dt_node_full_name(dev));
> +    } else {
> +        if ( cfg->busn_end > cfg->busn_start + 0xff )
> +            cfg->busn_end = cfg->busn_start + 0xff;
> +    }
> +
> +    /* Parse our PCI ecam register address*/
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

In Xen on Arm64, the VMAP is actually only 1GB. So it is not that big 
and this will compete with other mapping like ITS, global domain mapping...

So I think the vMAP area will need to increase to cater to increase usage.

> +     * ioremap the config space for each bus individually.
> +     *
> +     * As of now only 64-bit is supported 32-bit is not supported.
> +     */
> +    cfg->win = pci_remap_cfgspace(cfg->phys_addr, cfg->size);
> +    if ( !cfg->win )
> +        goto err_exit_remap;
> +
> +    printk("ECAM at [mem %lx-%lx] for [bus %x-%x] \n",cfg->phys_addr,

The physical address is a paddr_t. So this needs to use PRIpaddr. Also, 
please use preprent hexadecimal with 0x. This makes a lot easier to 
differentiate hexa vs decimal in the log.

> +            cfg->phys_addr + cfg->size - 1, cfg->busn_start, cfg->busn_end);
> +
> +    return cfg;
> +
> +err_exit_remap:
> +    printk(XENLOG_ERR "ECAM ioremap failed\n");
> +err_exit:
> +    pci_ecam_free(cfg);

Coding style: Please add a new line before return.

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

Coding style: Please add a new line before return.


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

Nothing looks Arm specific for this function. Can you move it in 
device_tree.c?

> +{
> +    u32 domain;
> +    int error;
> +
> +    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
> +    if ( !error )
> +        return -EINVAL;
> +
> +    return (u16)domain;
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

I don't think pci_bus_find_domain_nr() should be the function that 
crashes Xen. Instead, this should be propagated to the highest possible 
callers and let it decide what to do.

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

This seems to be a bit pointless to me as you already know the 
compatible (there is only one possible...).

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
>       struct device dev;
>   };
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

Please use uint8_t rather than u8.

> +    void *sysdata;                   /* Pointer to the config space window*/
> +};
> +
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          int ecam_reg_idx);
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> 

Cheers,

-- 
Julien Grall


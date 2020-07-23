Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794122BA3E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 01:39:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyknj-00006v-OR; Thu, 23 Jul 2020 23:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jykni-00006q-N2
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 23:38:58 +0000
X-Inumbo-ID: ad73a858-cd3d-11ea-87af-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad73a858-cd3d-11ea-87af-bc764e2007e4;
 Thu, 23 Jul 2020 23:38:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8340F20792;
 Thu, 23 Jul 2020 23:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595547537;
 bh=ZbrzDEbrQZu02cy/gPITrvjMlRLRXu60g+GUNIBgVb8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XYorQlumzQ9/F/aB3pFROyj4+SKAupGKnAA1jdCqO/u0o+LIZZS0CPmRtWX0HmUo/
 lipnlPs5vnFq+6WTp12WYDXxPYyIVIT3MY2zH7JzC7IojveL4Mal4ElrDLAv11pXNP
 c+LkMzpBGsuWkPVlM1Q6rfWw20hi/3wO9J3bUhDs=
Date: Thu, 23 Jul 2020 16:38:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
In-Reply-To: <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1736696476-1595527045=:17562"
Content-ID: <alpine.DEB.2.21.2007231101450.17562@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1736696476-1595527045=:17562
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007231101451.17562@sstabellini-ThinkPad-T480s>

+ Jan, Andrew, Roger

Please have a look at my comment on whether we should share the MMCFG
code below, feel free to ignore the rest :-)


On Thu, 23 Jul 2020, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> XEN will read the “linux, pci-domain” property from the device tree
> node and configure the host bridge segment number accordingly.
> 
> As of now "pci-host-ecam-generic" compatible board is supported.
> 
> Change-Id: If32f7748b7dc89dd37114dc502943222a2a36c49

What is this Change-Id property?


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/Kconfig                |   7 +
>  xen/arch/arm/Makefile               |   1 +
>  xen/arch/arm/pci/Makefile           |   4 +
>  xen/arch/arm/pci/pci-access.c       | 101 ++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c  | 198 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c | 131 ++++++++++++++++++
>  xen/arch/arm/pci/pci.c              | 112 ++++++++++++++++
>  xen/arch/arm/setup.c                |   2 +
>  xen/include/asm-arm/device.h        |   7 +-
>  xen/include/asm-arm/pci.h           |  97 +++++++++++++-
>  10 files changed, 654 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/arm/pci/Makefile
>  create mode 100644 xen/arch/arm/pci/pci-access.c
>  create mode 100644 xen/arch/arm/pci/pci-host-common.c
>  create mode 100644 xen/arch/arm/pci/pci-host-generic.c
>  create mode 100644 xen/arch/arm/pci/pci.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2777388265..ee13339ae9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -31,6 +31,13 @@ menu "Architecture Features"
>  
>  source "arch/Kconfig"
>  
> +config ARM_PCI
> +	bool "PCI Passthrough Support"
> +	depends on ARM_64
> +	---help---
> +
> +	  PCI passthrough support for Xen on ARM64.
> +
>  config ACPI
>  	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
>  	depends on ARM_64
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7e82b2178c..345cb83eed 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -6,6 +6,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_ARM_PCI) += pci/
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> new file mode 100644
> index 0000000000..358508b787
> --- /dev/null
> +++ b/xen/arch/arm/pci/Makefile
> @@ -0,0 +1,4 @@
> +obj-y += pci.o
> +obj-y += pci-host-generic.o
> +obj-y += pci-host-common.o
> +obj-y += pci-access.o
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> new file mode 100644
> index 0000000000..c53ef58336
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -0,0 +1,101 @@
> +/*
> + * Copyright (C) 2020 Arm Ltd.
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
> +
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                            unsigned int len)
> +{
> +    int rc;
> +    uint32_t val = GENMASK(0, len * 8);
> +
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> +        return val;
> +    }
> +
> +    if ( unlikely(!bridge->ops->read) )
> +        return val;
> +
> +    rc = bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
> +    if ( rc )
> +        printk(XENLOG_ERR "Failed to read reg %#x len %u for "PRI_pci"\n",
> +                reg, len, sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> +
> +    return val;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +        unsigned int len, uint32_t val)
> +{
> +    int rc;
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> +        return;
> +    }
> +
> +    if ( unlikely(!bridge->ops->write) )
> +        return;
> +
> +    rc = bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
> +    if ( rc )
> +        printk(XENLOG_ERR "Failed to write reg %#x len %u for "PRI_pci"\n",
> +                reg, len, sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type) \
> +    void pci_conf_write##size (pci_sbdf_t sbdf,unsigned int reg, type val) \
> +{                                               \
> +    pci_config_write(sbdf, reg, size / 8, val);     \
> +}
> +
> +#define PCI_OP_READ(size, type) \
> +    type pci_conf_read##size (pci_sbdf_t sbdf, unsigned int reg)  \
> +{                                               \
> +    return pci_config_read(sbdf, reg, size / 8);     \
> +}
> +
> +PCI_OP_READ(8, u8)
> +PCI_OP_READ(16, u16)
> +PCI_OP_READ(32, u32)
> +PCI_OP_WRITE(8, u8)
> +PCI_OP_WRITE(16, u16)
> +PCI_OP_WRITE(32, u32)

This looks like a subset of xen/arch/x86/x86_64/mmconfig_64.c ?

MMCFG is supposed to cover ECAM-compliant host bridges too, if I am not
mistaken. Is there any value in sharing the code with x86? It is OK if
we don't, but I would like to understand the reasoning.



> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> new file mode 100644
> index 0000000000..c5f98be698
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -0,0 +1,198 @@
> +/*
> + * Copyright (C) 2020 Arm Ltd.
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
> +#include <xen/vmap.h>
> +
> +/*
> + * List for all the pci host bridges.
> + */
> +
> +static LIST_HEAD(pci_host_bridges);
> +
> +static bool __init dt_pci_parse_bus_range(struct dt_device_node *dev,
> +        struct pci_config_window *cfg)
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
> +        struct pci_ecam_ops *ops)
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
> +        printk(XENLOG_ERR "No bus range found for pci controller\n");
> +    } else {
> +        if ( cfg->busn_end > cfg->busn_start + 0xff )
> +            cfg->busn_end = cfg->busn_start + 0xff;
> +    }
> +
> +    /* Parse our PCI ecam register address*/
> +    err = dt_device_get_address(dev, 0, &addr, &size);
> +    if ( err )
> +        goto err_exit;

Shouldn't we handle the possibility of multiple addresses? Is it
possible to have more than one range for an ECAM compliant host bridge?


> +    cfg->phys_addr = addr;
> +    cfg->size = size;
> +    cfg->ops = ops;
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
> +            cfg->phys_addr + cfg->size - 1,cfg->busn_start,cfg->busn_end);
> +
> +    if ( ops->init ) {
> +        err = ops->init(cfg);
> +        if (err)
> +            goto err_exit;
> +    }
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
> +static struct pci_host_bridge * pci_alloc_host_bridge(void)
> +{
> +    struct pci_host_bridge *bridge = xzalloc(struct pci_host_bridge);
> +
> +    if ( !bridge )
> +        return NULL;
> +
> +    INIT_LIST_HEAD(&bridge->node);
> +    return bridge;
> +}
> +
> +int pci_host_common_probe(struct dt_device_node *dev,
> +        struct pci_ecam_ops *ops)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct pci_config_window *cfg;
> +    u32 segment;
> +
> +    bridge = pci_alloc_host_bridge();
> +    if ( !bridge )
> +        return -ENOMEM;
> +
> +    /* Parse and map our Configuration Space windows */
> +    cfg = gen_pci_init(dev, ops);
> +    if ( !cfg )
> +        return -ENOMEM;

In case of errors the allocated bridge is not freed.


> +    bridge->dt_node = dev;
> +    bridge->sysdata = cfg;
> +    bridge->ops = &ops->pci_ops;
> +
> +    if( !dt_property_read_u32(dev, "linux,pci-domain", &segment) )
> +    {
> +        printk(XENLOG_ERR "\"linux,pci-domain\" property in not available in DT\n");
> +        return -ENODEV;
> +    }
> +
> +    bridge->segment = (u16)segment;

My understanding is that a Linux pci-domain doesn't correspond exactly
to a PCI segment. See for instance:

https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg03885.html

Do we need to care about the difference? If we mean pci-domain here,
should we just call them as such instead of calling them "segments" in
Xen (if they are not segments)?


> +    list_add_tail(&bridge->node, &pci_host_bridges);

It looks like &pci_host_bridges should be an ordered list, ordered by
segment number?


> +    return 0;
> +}
> +
> +/*
> + * This function will lookup an hostbridge based on the segment and bus
> + * number.
> + */
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
> +{
> +    struct pci_host_bridge *bridge;
> +    bool found = false;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->segment != segment )
> +            continue;
> +
> +        found = true;
> +        break;
> +    }
> +
> +    return (found) ? bridge : NULL;
> +}
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
> index 0000000000..cd67b3dec6
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -0,0 +1,131 @@
> +/*
> + * Copyright (C) 2020 Arm Ltd.
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
> +#include <asm/io.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +/*
> + * Function to get the config space base.
> + */
> +static void __iomem *pci_config_base(struct pci_host_bridge *bridge,
> +        uint32_t sbdf, int where)

I think the function is misnamed because reading the code below it looks
like it is not just returning the base config space address but also the
specific address we need to read/write (adding the device offset,
"where", and everything).

Maybe pci_config_get_address or something like that?


> +{
> +    struct pci_config_window *cfg = bridge->sysdata;
> +    unsigned int devfn_shift = cfg->ops->bus_shift - 8;
> +
> +    pci_sbdf_t sbdf_t = (pci_sbdf_t) sbdf ;
> +
> +    unsigned int busn = sbdf_t.bus;
> +    void __iomem *base;
> +
> +    if ( busn < cfg->busn_start || busn > cfg->busn_end )
> +        return NULL;
> +
> +    base = cfg->win + (busn << cfg->ops->bus_shift);
> +
> +    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
> +}
> +
> +int pci_ecam_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> +        int where, int size, u32 val)
> +{
> +    void __iomem *addr;
> +
> +    addr = pci_config_base(bridge, sbdf, where);
> +    if ( !addr )
> +        return -ENODEV;
> +
> +    if ( size == 1 )
> +        writeb(val, addr);
> +    else if ( size == 2 )
> +        writew(val, addr);
> +    else
> +        writel(val, addr);

please use a switch


> +    return 0;
> +}
> +
> +int pci_ecam_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
> +        int where, int size, u32 *val)
> +{
> +    void __iomem *addr;
> +
> +    addr = pci_config_base(bridge, sbdf, where);
> +    if ( !addr ) {
> +        *val = ~0;
> +        return -ENODEV;
> +    }
> +
> +    if ( size == 1 )
> +        *val = readb(addr);
> +    else if ( size == 2 )
> +        *val = readw(addr);
> +    else
> +        *val = readl(addr);

please use a switch


> +    return 0;
> +}
> +
> +/* ECAM ops */
> +struct pci_ecam_ops pci_generic_ecam_ops = {
> +    .bus_shift  = 20,
> +    .pci_ops    = {
> +        .read       = pci_ecam_config_read,
> +        .write      = pci_ecam_config_write,
> +    }
> +};
> +
> +static const struct dt_device_match gen_pci_dt_match[] = {
> +    { .compatible = "pci-host-ecam-generic",
> +      .data =       &pci_generic_ecam_ops },

spurious blank line


> +    { },
> +};
> +
> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
> +{
> +    const struct dt_device_match *of_id;
> +    struct pci_ecam_ops *ops;
> +
> +    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
> +    ops = (struct pci_ecam_ops *) of_id->data;
> +
> +    printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
> +            dt_node_full_name(dev), of_id->compatible);
> +
> +    return pci_host_common_probe(dev, ops);
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
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> new file mode 100644
> index 0000000000..f8cbb99591
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci.c
> @@ -0,0 +1,112 @@
> +/*
> + * Copyright (C) 2020 Arm Ltd.
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
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <xen/param.h>
> +
> +static int __init dt_pci_init(void)
> +{
> +    struct dt_device_node *np;
> +    int rc;
> +
> +    dt_for_each_device_node(dt_host, np)
> +    {
> +        rc = device_init(np, DEVICE_PCI, NULL);
> +        if( !rc )
> +            continue;
> +        /*
> +         * Ignore the following error codes:
> +         *   - EBADF: Indicate the current is not an pci
> +         *   - ENODEV: The pci device is not present or cannot be used by
> +         *     Xen.
> +         */
> +        else if ( rc != -EBADF && rc != -ENODEV )
> +        {
> +            printk(XENLOG_ERR "No driver found in XEN or driver init error.\n");
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void __init acpi_pci_init(void)
> +{
> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
> +    return;
> +}
> +#else
> +static inline void __init acpi_pci_init(void) { }
> +#endif
> +
> +static bool __initdata param_pci_enable;
> +static int __init parse_pci_param(const char *arg)
> +{
> +    if ( !arg )
> +    {
> +        param_pci_enable = false;
> +        return 0;
> +    }
> +
> +    switch ( parse_bool(arg, NULL) )
> +    {
> +        case 0:
> +            param_pci_enable = false;
> +            return 0;
> +        case 1:
> +            param_pci_enable = true;
> +            return 0;
> +    }
> +
> +    return -EINVAL;
> +}
> +custom_param("pci", parse_pci_param);

When adding new command line parameters please also add its
documentation (docs/misc/xen-command-line.pandoc) in the same patch,
unless this is meant to be just transient and we'll get removed before
the final commit of the series.


> +void __init pci_init(void)
> +{
> +    /*
> +     * Enable PCI when has been enabled explicitly (pci=on)
> +     */
> +    if ( !param_pci_enable)
> +        goto disable;
> +
> +    if ( acpi_disabled )
> +        dt_pci_init();
> +    else
> +        acpi_pci_init();
> +
> +#ifdef CONFIG_HAS_PCI
> +    pci_segments_init();
> +#endif
> +
> +disable:
> +    return;
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
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..2d7f1db44f 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -930,6 +930,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>  
>      setup_virt_paging();
>  
> +    pci_init();

pci_init should probably be an initcall


>      do_initcalls();
>  
>      /*
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ee7cff2d44..28f8049cfd 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -4,6 +4,7 @@
>  enum device_type
>  {
>      DEV_DT,
> +    DEV_PCI,
>  };
>  
>  struct dev_archdata {
> @@ -25,15 +26,15 @@ typedef struct device device_t;
>  
>  #include <xen/device_tree.h>
>  
> -/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
> -#define dev_is_pci(dev) ((void)(dev), 0)
> -#define dev_is_dt(dev)  ((dev->type == DEV_DT)
> +#define dev_is_pci(dev) (dev->type == DEV_PCI)
> +#define dev_is_dt(dev)  (dev->type == DEV_DT)
>  
>  enum device_class
>  {
>      DEVICE_SERIAL,
>      DEVICE_IOMMU,
>      DEVICE_GIC,
> +    DEVICE_PCI,
>      /* Use for error */
>      DEVICE_UNKNOWN,
>  };
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index de13359f65..94fd00360a 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -1,7 +1,98 @@
> -#ifndef __X86_PCI_H__
> -#define __X86_PCI_H__
> +/*
> + * Copyright (C) 2020 Arm Ltd.
> + *
> + * Based on Linux drivers/pci/ecam.c
> + * Copyright 2016 Broadcom.
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
>  
> +#ifndef __ARM_PCI_H__
> +#define __ARM_PCI_H__
> +
> +#include <xen/pci.h>
> +#include <xen/device_tree.h>
> +#include <asm/device.h>
> +
> +#ifdef CONFIG_ARM_PCI
> +
> +/* Arch pci dev struct */
>  struct arch_pci_dev {
> +    struct device dev;
> +};

Are you actually using struct device in struct arch_pci_dev?
struct device is already part of struct dt_device_node and a pointer to
it is stored in bridge->dt_node.


> +#define PRI_pci "%04x:%02x:%02x.%u"
> +#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +
> +/*
> + * struct to hold the mappings of a config space window. This
> + * is expected to be used as sysdata for PCI controllers that
> + * use ECAM.
> + */
> +struct pci_config_window {
> +    paddr_t     phys_addr;
> +    paddr_t     size;
> +    uint8_t     busn_start;
> +    uint8_t     busn_end;
> +    struct pci_ecam_ops     *ops;
> +    void __iomem        *win;
> +};
> +
> +/* Forward declaration as pci_host_bridge and pci_ops depend on each other. */
> +struct pci_host_bridge;
> +
> +struct pci_ops {
> +    int (*read)(struct pci_host_bridge *bridge,
> +                    uint32_t sbdf, int where, int size, u32 *val);
> +    int (*write)(struct pci_host_bridge *bridge,
> +                    uint32_t sbdf, int where, int size, u32 val);

I'd prefer if we could use explicitly-sized integers for "where" and
"size" too. Also, should they be unsigned rather than signed?

Can we use pci_sbdf_t for the sbdf parameter?


> +};
> +
> +/*
> + * struct to hold pci ops and bus shift of the config window
> + * for a PCI controller.
> + */
> +struct pci_ecam_ops {
> +    unsigned int            bus_shift;
> +    struct pci_ops          pci_ops;
> +    int             (*init)(struct pci_config_window *);
> +};

Although I realize that we are only targeting ECAM now, and the
implementation is based on ECAM, the interface doesn't seem to have
anything ECAM-specific in it. I would rename pci_ecam_ops to something
else, maybe simply "pci_ops".


> +/*
> + * struct to hold pci host bridge information
> + * for a PCI controller.
> + */
> +struct pci_host_bridge {
> +    struct dt_device_node *dt_node;  /* Pointer to the associated DT node */
> +    struct list_head node;           /* Node in list of host bridges */
> +    uint16_t segment;                /* Segment number */
> +    void *sysdata;                   /* Pointer to the config space window*/
> +    const struct pci_ops *ops;
>  };
>  
> -#endif /* __X86_PCI_H__ */
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> +
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                struct pci_ecam_ops *ops);
> +
> +void pci_init(void);
> +
> +#else   /*!CONFIG_ARM_PCI*/
> +struct arch_pci_dev { };
> +static inline void  pci_init(void) { }
> +#endif  /*!CONFIG_ARM_PCI*/
> +#endif /* __ARM_PCI_H__ */
> -- 
> 2.17.1
> 
--8323329-1736696476-1595527045=:17562--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08195421AE7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 01:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201775.356394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXnd-0007OB-3W; Mon, 04 Oct 2021 23:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201775.356394; Mon, 04 Oct 2021 23:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXnd-0007Kt-0D; Mon, 04 Oct 2021 23:55:13 +0000
Received: by outflank-mailman (input) for mailman id 201775;
 Mon, 04 Oct 2021 23:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXXnc-0007Kn-5i
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 23:55:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d08a221-9475-40ef-989d-a4b7af40236a;
 Mon, 04 Oct 2021 23:55:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17A0C61401;
 Mon,  4 Oct 2021 23:55:09 +0000 (UTC)
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
X-Inumbo-ID: 7d08a221-9475-40ef-989d-a4b7af40236a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633391709;
	bh=YprroowCBIr3ntuk0NZGn3U11jwNEtVjX/nNCZ357iM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=psYLrq1hPBZQQInsBOUUSS+6/8Prdf8NOQk641pS6ZDahK5KVZRb7e59sNrVsq8Qu
	 R9iSjamrXntuBWFpwQUuBgQscVaRqsDI4V+bq4hbKEyWIfO3jvIpO18I8zMzeIuHbR
	 lf0wJLVbXhfA5z9VEqK0wmrbzpi9iDjhF7/xAerNGsG+l5G9EeR8OwhT7XCA8QXKma
	 kHz7Tc5YTdppMWMW15GxNZOoS1At2ZNqnWwCsnDEDY/Li21v1k4fS9MWCe3u54biZW
	 jhKlxHqVtq1vLLg3FVuJ/uUX6PegucM2EJQTuN4G4m2P9om+o1bPB8UxVeuZiY1VHc
	 ZiuccVvHAAlhw==
Date: Mon, 4 Oct 2021 16:55:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 07/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <ac38f0d1b590686bbf55aa779108f7ce850dba93.1633340795.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2110041654410.3209@sstabellini-ThinkPad-T480s>
References: <cover.1633340795.git.rahul.singh@arm.com> <ac38f0d1b590686bbf55aa779108f7ce850dba93.1633340795.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-251712677-1633391709=:3209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-251712677-1633391709=:3209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Oct 2021, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> As of now only "pci-host-ecam-generic" compatible board is supported.
> 
> "linux,pci-domain" device tree property assigns a fixed PCI domain
> number to a host bridge, otherwise an unstable (across boots) unique
> number will be assigned by Linux. XEN access the PCI devices based on
> Segment:Bus:Device:Function. A Segment number in the XEN is same as a
> domain number in Linux. Segment number and domain number has to be in
> sync to access the correct PCI devices.
> 
> XEN will read the “linux,pci-domain” property from the device tree node
> and configure the host bridge segment number accordingly. If this
> property is not available XEN will allocate the unique segment number
> to the host bridge.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Chane in v4:
> - Move "#include <asm/pci.h>" in "xen/pci.h" after pci_sbdf_t
>   sbdf declaration change to separate patch.
> - Make gen_pci_dt_match as __initconstrel
> - Make pci_host_generic_probe as __init
> Change in v3:
> - Modify commit msg based on received comments.
> - Remove added struct match_table{} struct in struct device{}
> - Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
> - Remove bus_start,bus_end and void *sysdata from struct pci_host_bridge{}
> - Move "#include <asm/pci.h>" in "xen/pci.h" after pci_sbdf_t sbdf declaration
> - Add pci_host_generic_probe() function
> Change in v2:
> - Add more info in commit msg
> - Add callback to parse register index.
> - Merge patch pci_ecam_operation into this patch to avoid confusion
> - Add new struct in struct device for match table
> ---
> ---
>  xen/arch/arm/pci/Makefile           |   4 +
>  xen/arch/arm/pci/ecam.c             |  61 +++++++
>  xen/arch/arm/pci/pci-access.c       |  83 ++++++++++
>  xen/arch/arm/pci/pci-host-common.c  | 247 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c |  48 ++++++
>  xen/include/asm-arm/pci.h           |  56 +++++++
>  6 files changed, 499 insertions(+)
>  create mode 100644 xen/arch/arm/pci/ecam.c
>  create mode 100644 xen/arch/arm/pci/pci-access.c
>  create mode 100644 xen/arch/arm/pci/pci-host-common.c
>  create mode 100644 xen/arch/arm/pci/pci-host-generic.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index a98035df4c..6f32fbbe67 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -1 +1,5 @@
>  obj-y += pci.o
> +obj-y += pci-access.o
> +obj-y += pci-host-generic.o
> +obj-y += pci-host-common.o
> +obj-y += ecam.o
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> new file mode 100644
> index 0000000000..602d00799c
> --- /dev/null
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -0,0 +1,61 @@
> +/*
> + * Based on Linux drivers/pci/ecam.c
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
> +#include <xen/pci.h>
> +#include <xen/sched.h>
> +
> +/*
> + * Function to implement the pci_ops->map_bus method.
> + */
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                               pci_sbdf_t sbdf, uint32_t where)
> +{
> +    const struct pci_config_window *cfg = bridge->cfg;
> +    struct pci_ecam_ops *ops =
> +        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
> +    unsigned int devfn_shift = ops->bus_shift - 8;
> +    void __iomem *base;
> +
> +    unsigned int busn = PCI_BUS(sbdf.bdf);
> +
> +    if ( busn < cfg->busn_start || busn > cfg->busn_end )
> +        return NULL;
> +
> +    busn -= cfg->busn_start;
> +    base = cfg->win + (busn << ops->bus_shift);
> +
> +    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops pci_generic_ecam_ops = {
> +    .bus_shift  = 20,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +    }
> +};
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
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> new file mode 100644
> index 0000000000..3cd14a4b87
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -0,0 +1,83 @@
> +/*
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
> +#include <xen/pci.h>
> +#include <asm/io.h>
> +
> +#define INVALID_VALUE (~0U)
> +
> +int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t *value)
> +{
> +    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +
> +    if ( !addr )
> +    {
> +        *value = INVALID_VALUE;
> +        return -ENODEV;
> +    }
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *value = readb(addr);
> +        break;
> +    case 2:
> +        *value = readw(addr);
> +        break;
> +    case 4:
> +        *value = readl(addr);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return 0;
> +}
> +
> +int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                             uint32_t reg, uint32_t len, uint32_t value)
> +{
> +    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +
> +    if ( !addr )
> +        return -ENODEV;
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        writeb(value, addr);
> +        break;
> +    case 2:
> +        writew(value, addr);
> +        break;
> +    case 4:
> +        writel(value, addr);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return 0;
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
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> new file mode 100644
> index 0000000000..a08e06cea1
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -0,0 +1,247 @@
> +/*
> + * Based on Linux drivers/pci/ecam.c
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
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
> +static struct pci_config_window * __init
> +gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
> +{
> +    int err, cfg_reg_idx;
> +    u32 bus_range[2];
> +    paddr_t addr, size;
> +    struct pci_config_window *cfg;
> +
> +    cfg = xzalloc(struct pci_config_window);
> +    if ( !cfg )
> +        return NULL;
> +
> +    err = dt_property_read_u32_array(dev, "bus-range", bus_range,
> +                                     ARRAY_SIZE(bus_range));
> +    if ( err ) {
> +        cfg->busn_start = 0;
> +        cfg->busn_end = 0xff;
> +        printk(XENLOG_INFO "%s: No bus range found for pci controller\n",
> +               dt_node_full_name(dev));
> +    } else {
> +        cfg->busn_start = bus_range[0];
> +        cfg->busn_end = bus_range[1];
> +        if ( cfg->busn_end > cfg->busn_start + 0xff )
> +            cfg->busn_end = cfg->busn_start + 0xff;
> +    }
> +
> +    if ( ops->cfg_reg_index )
> +    {
> +        cfg_reg_idx = ops->cfg_reg_index(dev);
> +        if ( cfg_reg_idx < 0 )
> +            goto err_exit;
> +    }
> +    else
> +        cfg_reg_idx = 0;
> +
> +    /* Parse our PCI ecam register address */
> +    err = dt_device_get_address(dev, cfg_reg_idx, &addr, &size);
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
> +     * As of now only 64-bit is supported 32-bit is not supported.
> +     *
> +     * TODO: For 32-bit implement the ioremap/iounmap of config space
> +     * dynamically for each read/write call.
> +     */
> +    cfg->win = pci_remap_cfgspace(cfg->phys_addr, cfg->size);
> +    if ( !cfg->win )
> +    {
> +        printk(XENLOG_ERR "ECAM ioremap failed\n");
> +        goto err_exit;
> +    }
> +    printk("ECAM at [mem 0x%"PRIpaddr"-0x%"PRIpaddr"] for [bus %x-%x] \n",
> +            cfg->phys_addr, cfg->phys_addr + cfg->size - 1,
> +            cfg->busn_start, cfg->busn_end);
> +
> +    if ( ops->init )
> +    {
> +        err = ops->init(cfg);
> +        if ( err )
> +            goto err_exit;
> +    }
> +
> +    return cfg;
> +
> +err_exit:
> +    pci_ecam_free(cfg);
> +
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
> +
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
> +        domain = -1;
> +    }
> +
> +    return domain;
> +}
> +
> +int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct pci_config_window *cfg;
> +    struct pci_ecam_ops *ops;
> +    int err;
> +
> +    if ( dt_device_for_passthrough(dev) )
> +        return 0;
> +
> +    ops = (struct pci_ecam_ops *) data;
> +
> +    bridge = pci_alloc_host_bridge();
> +    if ( !bridge )
> +        return -ENOMEM;
> +
> +    /* Parse and map our Configuration Space windows */
> +    cfg = gen_pci_init(dev, ops);
> +    if ( !cfg )
> +    {
> +        err = -ENOMEM;
> +        goto err_exit;
> +    }
> +
> +    bridge->dt_node = dev;
> +    bridge->cfg = cfg;
> +    bridge->ops = &ops->pci_ops;
> +
> +    bridge->segment = pci_bus_find_domain_nr(dev);
> +    if ( bridge->segment < 0 )
> +    {
> +        printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in DT\n");
> +        BUG();
> +    }
> +    pci_add_host_bridge(bridge);
> +
> +    return 0;
> +
> +err_exit:
> +    xfree(bridge);
> +
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
> index 0000000000..33457fbe96
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -0,0 +1,48 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
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
> +#include <asm/device.h>
> +#include <asm/pci.h>
> +
> +static const struct dt_device_match __initconstrel gen_pci_dt_match[] =
> +{
> +    { .compatible = "pci-host-ecam-generic" },
> +    { },
> +};
> +
> +static int __init pci_host_generic_probe(struct dt_device_node *dev,
> +                                         const void *data)
> +{
> +    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +.dt_match = gen_pci_dt_match,
> +.init = pci_host_generic_probe,
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
> index 0cf849e26f..bb7eda6705 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,62 @@ struct arch_pci_dev {
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
> +    struct pci_config_window* cfg;   /* Pointer to the bridge config window */
> +    struct pci_ops *ops;
> +};
> +
> +struct pci_ops {
> +    void __iomem *(*map_bus)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                             uint32_t offset);
> +    int (*read)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                uint32_t reg, uint32_t len, uint32_t *value);
> +    int (*write)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                 uint32_t reg, uint32_t len, uint32_t value);
> +};
> +
> +/*
> + * struct to hold pci ops and bus shift of the config window
> + * for a PCI controller.
> + */
> +struct pci_ecam_ops {
> +    unsigned int            bus_shift;
> +    struct pci_ops          pci_ops;
> +    int (*cfg_reg_index)(struct dt_device_node *dev);
> +    int (*init)(struct pci_config_window *);
> +};
> +
> +/* Default ECAM ops */
> +extern const struct pci_ecam_ops pci_generic_ecam_ops;
> +
> +int pci_host_common_probe(struct dt_device_node *dev, const void *data);
> +int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t *value);
> +int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                             uint32_t reg, uint32_t len, uint32_t value);
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                               pci_sbdf_t sbdf, uint32_t where);
> +
>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
>      return pci_passthrough_enabled;
> -- 
> 2.25.1
> 
--8323329-251712677-1633391709=:3209--


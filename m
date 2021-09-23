Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A3415561
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193273.344252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEBT-0001m7-Tk; Thu, 23 Sep 2021 02:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193273.344252; Thu, 23 Sep 2021 02:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEBT-0001jQ-Qh; Thu, 23 Sep 2021 02:09:59 +0000
Received: by outflank-mailman (input) for mailman id 193273;
 Thu, 23 Sep 2021 02:09:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTEBS-0001jK-LY
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:09:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58e4ea92-1c13-11ec-ba04-12813bfff9fa;
 Thu, 23 Sep 2021 02:09:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0B3360F6F;
 Thu, 23 Sep 2021 02:09:55 +0000 (UTC)
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
X-Inumbo-ID: 58e4ea92-1c13-11ec-ba04-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632362996;
	bh=n3CFCvWleyY3w7fbyTsbKm3EbMrA4k89gghybVgsBVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bJDkYxSjrHQDhyyQtEpsnnq8RazNnMVB0j595BFeRg7oyFadN2QC3wZIMkCXLqZ71
	 6u6XU4a/BvXNgEQRC8VWNyaYAQ/0TbRYUSq6k1dHq02btbQe+J1bw6TQPSmlYU6I0Z
	 PCxxjvJ2j+6OgNITjLtTRuZFgg9zUelMG9FxxGwI00bImFfDmeXtJ5q3PQ3mlVBBCI
	 CLwZg3maRDikRBdh5OeDrHECMS5z9dLXBN2qXVqpGhAxxbQSOyrlnMcxdOWrvEHWdi
	 d5UFykZ/eC/NaEyzovnXR3oqdQyV85aDuCKL3/0/ZhpZUiYvaDMzDVHviMPCiKCni/
	 iaqGpdllUmKuQ==
Date: Wed, 22 Sep 2021 19:09:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-251838594-1632361499=:17979"
Content-ID: <alpine.DEB.2.21.2109221846390.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-251838594-1632361499=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109221846391.17979@sstabellini-ThinkPad-T480s>

On Wed, 22 Sep 2021, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> As of now only "pci-host-ecam-generic" compatible board is supported.
> 
> "linux,pci-domain" device tree property assigns a fixed PCI domain
> number to a host bridge, otherwise an unstable (across boots) unique
> number will be assigned by Linux. XEN access the PCI devices based on
> Segment:Bus:Device:Function. Segment number in XEN is same as domain
                               ^ A segment             ^ the    ^ a


> number in Linux.Segment number and domain number has to be in sync
                  ^ " "

> to access the correct PCI devices.
> 
> XEN will read the “linux,pci-domain” property from the device tree node
> and configure the host bridge segment number accordingly. If this
> property is not available XEN will allocate the unique segment number
> to the host bridge.
> 
> dt_pci_bus_find_domain_nr(..) imported from the Linux source tree with
> slight modification based on tag Linux v5.14.2
> commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3fc.

dt_pci_bus_find_domain_nr is not introduced by this patch any longer


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Add more info in commit msg
> - Add callback to parse register index.
> - Merge patch pci_ecam_operation into this patch to avoid confusion
> - Add new struct in struct device for match table
> ---
>  xen/arch/arm/device.c               |   2 +
>  xen/arch/arm/pci/Makefile           |   5 +
>  xen/arch/arm/pci/ecam.c             |  60 +++++++
>  xen/arch/arm/pci/pci-access.c       |  83 +++++++++
>  xen/arch/arm/pci/pci-host-common.c  | 254 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c |  42 +++++
>  xen/include/asm-arm/device.h        |   2 +
>  xen/include/asm-arm/pci.h           |  59 +++++++
>  8 files changed, 507 insertions(+)
>  create mode 100644 xen/arch/arm/pci/ecam.c
>  create mode 100644 xen/arch/arm/pci/pci-access.c
>  create mode 100644 xen/arch/arm/pci/pci-host-common.c
>  create mode 100644 xen/arch/arm/pci/pci-host-generic.c
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 70cd6c1a19..197bb3c6e8 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -44,6 +44,8 @@ int __init device_init(struct dt_device_node *dev, enum device_class class,
>          {
>              ASSERT(desc->init != NULL);
>  
> +            dev->dev.of_match_table = desc->dt_match;
> +
>              return desc->init(dev, data);
>          }
>  
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index a98035df4c..e86f2b46fd 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -1 +1,6 @@
>  obj-y += pci.o
> +obj-y += pci-access.o
> +obj-y += pci.o

Added twice?


> +obj-y += pci-host-generic.o
> +obj-y += pci-host-common.o
> +obj-y += ecam.o
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> new file mode 100644
> index 0000000000..9b88b1ceda
> --- /dev/null
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -0,0 +1,60 @@
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
> + * Function to implement the pci_ops ->map_bus method.
> + */
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                               uint32_t sbdf, uint32_t where)
> +{
> +    const struct pci_config_window *cfg = bridge->cfg;
> +    const struct pci_ecam_ops *ops = bridge->sysdata;
> +    unsigned int devfn_shift = ops->bus_shift - 8;
> +    void __iomem *base;
> +
> +    unsigned int busn = PCI_BUS(sbdf);
> +
> +    if ( busn < cfg->busn_start || busn > cfg->busn_end )
> +        return NULL;
> +
> +    busn -= cfg->busn_start;
> +    base = cfg->win + (busn << ops->bus_shift);
> +
> +    return base + (PCI_DEVFN2(sbdf) << devfn_shift) + where;
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
> index 0000000000..04fe9fbf92
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
> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
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
> +int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t value)
                               ^ code style


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
> index 0000000000..4beec14f2f
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -0,0 +1,254 @@
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
> +        goto err_exit_remap;
> +
> +    printk("ECAM at [mem 0x%"PRIpaddr"-0x%"PRIpaddr"] for [bus %x-%x] \n",
> +            cfg->phys_addr, cfg->phys_addr + cfg->size - 1,
> +            cfg->busn_start, cfg->busn_end);
> +
> +    if ( ops->init )
> +    {
> +        err = ops->init(cfg);
> +        if (err)

code style


> +            goto err_exit;
> +    }

This is unnecessary at the moment, right? Can we get rid of ops->init ?


> +    return cfg;
> +
> +err_exit_remap:
> +    printk(XENLOG_ERR "ECAM ioremap failed\n");

No need for err_exit_remap as pci_ecam_free can take care of both cases.

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
> +    bridge->bus_start = UINT8_MAX;
> +    bridge->bus_end = UINT8_MAX;
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
> +    const struct dt_device_match *of_id;
> +    int err;
> +
> +    if ( dt_device_for_passthrough(dev) )
> +        return 0;
> +
> +    of_id = dt_match_node(dev->dev.of_match_table, dev->dev.of_node);
> +    ops = (struct pci_ecam_ops *) of_id->data;

Do we really need dt_match_node and dev->dev.of_match_table to get
dt_device_match.data?

data is passed as a parameter to pci_host_common_probe, isn't it enough
to do:

ops = (struct pci_ecam_ops *) data;


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
> +    bridge->sysdata = ops;
> +    bridge->ops = &ops->pci_ops;
> +    bridge->bus_start = cfg->busn_start;
> +    bridge->bus_end = cfg->busn_end;
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
> index 0000000000..6b3288d6f3
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -0,0 +1,42 @@
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
> +#include <asm/device.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +static const struct dt_device_match gen_pci_dt_match[] = {
> +    { .compatible = "pci-host-ecam-generic",
> +      .data =       &pci_generic_ecam_ops },
> +
> +    { },
> +};
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +.dt_match = gen_pci_dt_match,
> +.init = pci_host_common_probe,
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
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 5ecd5e7bd1..582119c31e 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -16,6 +16,8 @@ struct device
>      enum device_type type;
>  #ifdef CONFIG_HAS_DEVICE_TREE
>      struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +    /* Used by drivers imported from Linux */
> +    const struct dt_device_match *of_match_table;
>  #endif
>      struct dev_archdata archdata;
>      struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index f2f86be9bc..4b32c7088a 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,65 @@ struct arch_pci_dev {
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
> +    uint8_t bus_start;               /* Bus start of this bridge. */
> +    uint8_t bus_end;                 /* Bus end of this bridge. */

bus_start and bus_end are both here and also under pci_config_window.
Should we remove them from here (if not, then can we removed them from
struct pci_config_window)?


> +    struct pci_config_window* cfg;   /* Pointer to the bridge config window */
> +    void *sysdata;                   /* Pointer to the config space window*/
> +    const struct pci_ops *ops;

It looks like sysdata is unnecessary because we can get the right
pointer from ops, given that ops is pointing to a member of the struct
point by sysdata. In other words, if you use container_of(ops, struct
pci_ecam_ops, pci_ops) it should work?


> +};
> +
> +struct pci_ops {
> +    void __iomem *(*map_bus)(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                             uint32_t offset);
> +    int (*read)(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                uint32_t reg, uint32_t len, uint32_t *value);
> +    int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
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

init is unused, can we get rid of it?


> +};
> +
> +/* Default ECAM ops */
> +extern const struct pci_ecam_ops pci_generic_ecam_ops;

If we use container_of and get rid of sysdata, I wonder if we get avoid
exporting pci_generic_ecam_ops.


> +int pci_host_common_probe(struct dt_device_node *dev, const void *data);

This should be static and not exported


> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t *value);

also this


> +int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t value);

also this


> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                               uint32_t sbdf, uint32_t where);

also this

>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
>      return pci_passthrough_enabled;
> -- 
> 2.17.1
> 
--8323329-251838594-1632361499=:17979--


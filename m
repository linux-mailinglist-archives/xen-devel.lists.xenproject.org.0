Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FFA999DF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965400.1355972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hIJ-0008DN-5G; Wed, 23 Apr 2025 21:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965400.1355972; Wed, 23 Apr 2025 21:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hIJ-0008Af-29; Wed, 23 Apr 2025 21:06:11 +0000
Received: by outflank-mailman (input) for mailman id 965400;
 Wed, 23 Apr 2025 21:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7hIH-0008AZ-SX
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:06:09 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6028264-2086-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:06:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9147543C46;
 Wed, 23 Apr 2025 21:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7341C4CEE2;
 Wed, 23 Apr 2025 21:06:04 +0000 (UTC)
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
X-Inumbo-ID: c6028264-2086-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745442366;
	bh=QjVfNuB0OPmugHJ7CqDYgjn5LYT2oICAYJUEf/xQRE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V/yg7A5EPYFa+ysa5Q7rybx6J85s6uDOJsV59KBqEGkATubOyxaQe4I4jTMGNtU+h
	 +HVBfm0DpMvwXcMf0l1WzCyXr4b+GNiAy65l7KcTWF1VmzMrqcPRHuEWw88ghSu+K7
	 8D9+gdxQ2gscY3PiI3bjcYQaT/pZowLVCyLbCH4EtuxB1IzFzrBU1DkuQymF1A3eF1
	 cI6K2MUy8yHSV3R05dULcgyjKDsiCc+2++IWvPMPrJPlM9uvssC/We+edXuxqnUUea
	 06yD9VRXNV9wIvxZLEK2EhxKjY/qPU8PpqJouPYlKTuMcYv2RbCvWcbA68ZAgLnR2L
	 BDao8os8goimw==
Date: Wed, 23 Apr 2025 14:06:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
In-Reply-To: <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504231403290.785180@ubuntu-linux-20-04-desktop>
References: <cover.1745402473.git.mykyta_poturai@epam.com> <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Renesas R-Car Gen4 PCI host controller, specifically
> targeting the S4 and V4H SoCs. The implementation includes configuration
> read/write operations for both root and child buses. For accessing the
> child bus, iATU is used for address translation.
> 
> Code common to all DesignWare PCI host controllers is located in a
> separate file to allow for easy reuse in other DesignWare-based PCI
> host controllers.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

At a glance, this looks OKish. Especially if you would be willing to
maintain the driver going forward :-)

Would you be willing to add entry to the MAINTAINERS file to cover
pci-designware* and pci-host-rcar4.c ?


> ---
> v3->v4:
> * no changes
> 
> v2->v3:
> * move priv allocation to dw_pcie_host_probe
> 
> v1->v2:
> * move designware code in a separate file
> ---
>  xen/arch/arm/pci/Makefile         |   2 +
>  xen/arch/arm/pci/pci-designware.c | 403 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-designware.h | 102 ++++++++
>  xen/arch/arm/pci/pci-host-rcar4.c | 103 ++++++++
>  4 files changed, 610 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-designware.c
>  create mode 100644 xen/arch/arm/pci/pci-designware.h
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index 1d045ade01..ca6135e282 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -4,3 +4,5 @@ obj-y += pci-host-generic.o
>  obj-y += pci-host-common.o
>  obj-y += ecam.o
>  obj-y += pci-host-zynqmp.o
> +obj-y += pci-designware.o
> +obj-y += pci-host-rcar4.o
> diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
> new file mode 100644
> index 0000000000..dcbd07ced3
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -0,0 +1,403 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
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
> +#include <xen/delay.h>
> +#include <asm/io.h>
> +
> +#include "pci-designware.h"
> +/**
> + * upper_32_bits - return bits 32-63 of a number
> + * @n: the number we're accessing
> + *
> + * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
> + * the "right shift count >= width of type" warning when that quantity is
> + * 32-bits.
> + */
> +#define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
> +
> +/**
> + * lower_32_bits - return bits 0-31 of a number
> + * @n: the number we're accessing
> + */
> +#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffff))

Please run this by MISRA using ECLAIR's checker in Gitlab CI.


> +static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, size) )
> +    {
> +        *val = 0;
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +    }
> +
> +    if ( size == 4 )
> +        *val = readl(addr);
> +    else if ( size == 2 )
> +        *val = readw(addr);
> +    else if ( size == 1 )
> +        *val = readb(addr);
> +    else
> +    {
> +        *val = 0;
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +    }
> +
> +    return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static int dw_pcie_write(void __iomem *addr, int size, uint32_t val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, size) )
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +
> +    if ( size == 4 )
> +        writel(val, addr);
> +    else if ( size == 2 )
> +        writew(val, addr);
> +    else if ( size == 1 )
> +        writeb(val, addr);
> +    else
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +
> +    return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                                 size_t size)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +    uint32_t val;
> +
> +    dw_pcie_read(addr, size, &val);
> +    return val;
> +}
> +
> +static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                              size_t size, uint32_t val)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +
> +    dw_pcie_write(addr, size, val);
> +}
> +
> +static uint32_t dw_pcie_readl_dbi(struct pci_host_bridge *bridge, uint32_t reg)
> +{
> +    return dw_pcie_read_dbi(bridge, reg, sizeof(uint32_t));
> +}
> +
> +static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
> +                               uint32_t val)
> +{
> +    dw_pcie_write_dbi(pci, reg, sizeof(uint32_t), val);
> +}
> +
> +static void dw_pcie_read_iatu_unroll_enabled(struct pci_host_bridge *bridge)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    uint32_t val;
> +
> +    val = dw_pcie_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
> +    if ( val == 0xffffffff )
> +        priv->iatu_unroll_enabled = true;
> +
> +    printk(XENLOG_DEBUG "%s iATU unroll: %sabled\n",
> +           dt_node_full_name(bridge->dt_node),
> +           priv->iatu_unroll_enabled ? "en" : "dis");
> +}
> +
> +static uint32_t dw_pcie_readl_atu(struct pci_host_bridge *pci, uint32_t reg)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    int ret;
> +    uint32_t val;
> +
> +    ret = dw_pcie_read(priv->atu_base + reg, 4, &val);
> +    if ( ret )
> +        printk(XENLOG_ERR "Read ATU address failed\n");
> +
> +    return val;
> +}
> +
> +static void dw_pcie_writel_atu(struct pci_host_bridge *pci, uint32_t reg,
> +                               uint32_t val)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    int ret;
> +
> +    ret = dw_pcie_write(priv->atu_base + reg, 4, val);
> +    if ( ret )
> +        printk(XENLOG_ERR "Write ATU address failed\n");
> +}
> +
> +static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
> +                                        uint32_t index, uint32_t reg)
> +{
> +    uint32_t offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
> +
> +    return dw_pcie_readl_atu(pci, offset + reg);
> +}
> +
> +static void dw_pcie_writel_ob_unroll(struct pci_host_bridge *pci,
> +                                     uint32_t index, uint32_t reg, uint32_t val)
> +{
> +    uint32_t offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
> +
> +    dw_pcie_writel_atu(pci, offset + reg, val);
> +}
> +
> +static uint32_t dw_pcie_enable_ecrc(uint32_t val)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +
> +static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
> +                                             uint8_t func_no, int index,
> +                                             int type, uint64_t cpu_addr,
> +                                             uint64_t pci_addr, uint64_t size)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    uint32_t retries, val;
> +    uint64_t limit_addr = cpu_addr + size - 1;
> +
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
> +                             lower_32_bits(cpu_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
> +                             upper_32_bits(cpu_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_LIMIT,
> +                             lower_32_bits(limit_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_LIMIT,
> +                             upper_32_bits(limit_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
> +                             lower_32_bits(pci_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
> +                             upper_32_bits(pci_addr));
> +    val = type | PCIE_ATU_FUNC_NUM(func_no);
> +    val = upper_32_bits(size - 1) ? val | PCIE_ATU_INCREASE_REGION_SIZE : val;
> +    if ( priv->version == 0x490A )
> +        val = dw_pcie_enable_ecrc(val);
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +                             PCIE_ATU_ENABLE);
> +
> +    /*
> +     * Make sure ATU enable takes effect before any subsequent config
> +     * and I/O accesses.
> +     */
> +    for ( retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
> +    {
> +        val = dw_pcie_readl_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2);
> +        if ( val & PCIE_ATU_ENABLE )
> +            return;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }
> +    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
> +}
> +
> +static void __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
> +                                        uint8_t func_no, int index, int type,
> +                                        uint64_t cpu_addr, uint64_t pci_addr,
> +                                        uint64_t size)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    uint32_t retries, val;
> +
> +    if ( priv->iatu_unroll_enabled )
> +    {
> +        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type, cpu_addr,
> +                                         pci_addr, size);
> +        return;
> +    }
> +
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
> +                       PCIE_ATU_REGION_OUTBOUND | index);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE, lower_32_bits(cpu_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE, upper_32_bits(cpu_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT, lower_32_bits(cpu_addr + size - 1));
> +    if ( priv->version >= 0x460A )
> +        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
> +                           upper_32_bits(cpu_addr + size - 1));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, lower_32_bits(pci_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET, upper_32_bits(pci_addr));
> +    val = type | PCIE_ATU_FUNC_NUM(func_no);
> +    val = ((upper_32_bits(size - 1)) && (priv->version >= 0x460A))
> +              ? val | PCIE_ATU_INCREASE_REGION_SIZE
> +              : val;
> +    if ( priv->version == 0x490A )
> +        val = dw_pcie_enable_ecrc(val);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> +
> +    /*
> +     * Make sure ATU enable takes effect before any subsequent config
> +     * and I/O accesses.
> +     */
> +    for ( retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
> +    {
> +        val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
> +        if ( val & PCIE_ATU_ENABLE )
> +            return;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }
> +    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
> +}
> +
> +static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int index,
> +                                      int type, uint64_t cpu_addr,
> +                                      uint64_t pci_addr, uint64_t size)
> +{
> +    __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr, size);
> +}
> +
> +void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int version)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +
> +    priv->version = version;
> +}
> +
> +void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
> +                                    pci_sbdf_t sbdf, uint32_t where)
> +{
> +    uint32_t busdev;
> +
> +    busdev = PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn)) |
> +             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
> +
> +    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
> +    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                              PCIE_ATU_TYPE_CFG0, bridge->child_cfg->phys_addr,
> +                              busdev, bridge->child_cfg->size);
> +
> +    return bridge->child_cfg->win + where;
> +}
> +
> +int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                              uint32_t reg, uint32_t len, uint32_t *value)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    int ret;
> +
> +    /*
> +     * FIXME: we cannot read iATU settings at the early initialization
> +     * (probe) as the host's HW is not yet initialized at that phase.
> +     * This read operation is the very first thing Domain-0 will do
> +     * during its initialization, so take this opportunity and read
> +     * iATU setting now.
> +     */
> +    if ( unlikely(!priv->iatu_unroll_initilized) )
> +    {
> +        dw_pcie_read_iatu_unroll_enabled(bridge);
> +        priv->iatu_unroll_initilized = true;
> +    }
> +
> +    ret = pci_generic_config_read(bridge, sbdf, reg, len, value);
> +    if ( !ret && (priv->num_viewport <= 2) )
> +        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                  PCIE_ATU_TYPE_IO,
> +                                  bridge->child_cfg->phys_addr, 0,
> +                                  bridge->child_cfg->size);
> +
> +    return ret;
> +}
> +
> +int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                               uint32_t reg, uint32_t len, uint32_t value)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    int ret;
> +
> +    ret = pci_generic_config_write(bridge, sbdf, reg, len, value);
> +    if ( !ret && (priv->num_viewport <= 2) )
> +        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                  PCIE_ATU_TYPE_IO,
> +                                  bridge->child_cfg->phys_addr, 0,
> +                                  bridge->child_cfg->size);
> +    return ret;
> +}
> +
> +bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
> +                                                 struct pci_host_bridge *bridge,
> +                                                 uint64_t addr)
> +{
> +    struct pci_config_window *cfg = bridge->child_cfg;
> +
> +    /*
> +     * We do not want ECAM address space to be mapped in Domain-0's p2m,
> +     * so we can trap access to it.
> +     */
> +    return cfg->phys_addr != addr;
> +}
> +
> +struct pci_host_bridge *__init
> +dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
> +                   const struct pci_ecam_ops *ops,
> +                   const struct pci_ecam_ops *child_ops)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct dw_pcie_priv *priv;
> +
> +    paddr_t atu_phys_addr;
> +    paddr_t atu_size;
> +    int atu_idx, ret;
> +
> +    bridge = pci_host_common_probe(dev, ops, child_ops);
> +    if ( IS_ERR(bridge) )
> +        return bridge;
> +
> +    priv = xzalloc_bytes(sizeof(struct dw_pcie_priv));
> +    if ( !priv )
> +        return ERR_PTR(-ENOMEM);
> +
> +    bridge->priv = priv;
> +
> +    atu_idx = dt_property_match_string(dev, "reg-names", "atu");
> +    if ( atu_idx < 0 )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\n");
> +        return ERR_PTR(atu_idx);
> +    }
> +    ret = dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
> +        return ERR_PTR(ret);
> +    }
> +    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", atu_phys_addr,
> +           atu_phys_addr + atu_size - 1);
> +    priv->atu_base = ioremap_nocache(atu_phys_addr, atu_size);
> +    if ( !priv->atu_base )
> +    {
> +        printk(XENLOG_ERR "iATU ioremap failed\n");
> +        return ERR_PTR(ENXIO);
> +    }
> +
> +    if ( !dt_property_read_u32(dev, "num-viewport", &priv->num_viewport) )
> +        priv->num_viewport = 2;
> +
> +    /*
> +     * FIXME: we cannot read iATU unroll enable now as the host bridge's
> +     * HW is not yet initialized by Domain-0: leave it for later.
> +     */
> +
> +    printk(XENLOG_INFO "%s number of view ports: %d\n", dt_node_full_name(dev),
> +           priv->num_viewport);
> +
> +    return bridge;
> +}
> diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-designware.h
> new file mode 100644
> index 0000000000..a15ba9a329
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.h
> @@ -0,0 +1,102 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
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
> +#include <xen/init.h>
> +
> +#ifndef __PCI_DESIGNWARE_H__
> +#define __PCI_DESIGNWARE_H__
> +
> +#define PCIBIOS_SUCCESSFUL              0x00
> +#define PCIBIOS_BAD_REGISTER_NUMBER     0x87
> +
> +#define PCIE_ATU_VIEWPORT               0x900
> +#define PCIE_ATU_REGION_OUTBOUND        0
> +#define PCIE_ATU_CR1                    0x904
> +#define PCIE_ATU_INCREASE_REGION_SIZE   BIT(13, UL)
> +#define PCIE_ATU_CR2                    0x908
> +#define PCIE_ATU_ENABLE                 BIT(31, UL)
> +#define PCIE_ATU_LOWER_BASE             0x90C
> +#define PCIE_ATU_UPPER_BASE             0x910
> +#define PCIE_ATU_LIMIT                  0x914
> +#define PCIE_ATU_LOWER_TARGET           0x918
> +#define PCIE_ATU_UPPER_TARGET           0x91C
> +#define PCIE_ATU_UPPER_LIMIT            0x924
> +
> +#define PCIE_ATU_REGION_INDEX1  0x1
> +#define PCIE_ATU_TYPE_IO        0x2
> +#define PCIE_ATU_TYPE_CFG0      0x4
> +
> +#define FIELD_PREP(_mask, _val) \
> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), x)
> +#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), x)
> +#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), x)
> +
> +/* Register address builder */
> +#define PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(region) \
> +    ((region) << 9)
> +
> +/*
> + * iATU Unroll-specific register definitions
> + * From 4.80 core version the address translation will be made by unroll
> + */
> +#define PCIE_ATU_UNR_REGION_CTRL1       0x00
> +#define PCIE_ATU_UNR_REGION_CTRL2       0x04
> +#define PCIE_ATU_UNR_LOWER_BASE         0x08
> +#define PCIE_ATU_UNR_UPPER_BASE         0x0C
> +#define PCIE_ATU_UNR_LOWER_LIMIT        0x10
> +#define PCIE_ATU_UNR_LOWER_TARGET       0x14
> +#define PCIE_ATU_UNR_UPPER_TARGET       0x18
> +#define PCIE_ATU_UNR_UPPER_LIMIT        0x20
> +
> +#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
> +
> +/* Parameters for the waiting for iATU enabled routine */
> +#define LINK_WAIT_MAX_IATU_RETRIES      5
> +#define LINK_WAIT_IATU                  9
> +
> +struct dw_pcie_priv {
> +    uint32_t num_viewport;
> +    bool iatu_unroll_initilized;
> +    bool iatu_unroll_enabled;
> +    void __iomem *atu_base;
> +    unsigned int version;
> +};
> +
> +void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int version);
> +
> +void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
> +                                    pci_sbdf_t sbdf, uint32_t where);
> +
> +int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                              uint32_t reg, uint32_t len, uint32_t *value);
> +
> +int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                               uint32_t reg, uint32_t len, uint32_t value);
> +
> +bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
> +                                                 struct pci_host_bridge *bridge,
> +                                                 uint64_t addr);
> +
> +struct pci_host_bridge *__init
> +dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
> +                   const struct pci_ecam_ops *ops,
> +                   const struct pci_ecam_ops *child_ops);
> +#endif /* __PCI_DESIGNWARE_H__ */
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
> new file mode 100644
> index 0000000000..cae1b4254d
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -0,0 +1,103 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
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
> +
> +#include <asm/device.h>
> +#include <asm/io.h>
> +#include <asm/pci.h>
> +
> +#include "pci-designware.h"
> +
> +#define RCAR4_DWC_VERSION       0x520A
> +
> +/*
> + * PCI host bridges often have different ways to access the root and child
> + * bus config spaces:
> + *   "dbi"   : the aperture where root port's own configuration registers
> + *             are available.
> + *   "config": child's configuration space
> + *   "atu"   : iATU registers for DWC version 4.80 or later
> + */
> +static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "dbi");
> +}
> +
> +static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "config");
> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops rcar4_pcie_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = rcar4_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
> +    }
> +};
> +
> +const struct pci_ecam_ops rcar4_pcie_child_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = rcar4_child_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = dw_pcie_child_map_bus,
> +        .read                   = dw_pcie_child_config_read,
> +        .write                  = dw_pcie_child_config_write,
> +        .need_p2m_hwdom_mapping = dw_pcie_child_need_p2m_hwdom_mapping,
> +    }
> +};
> +
> +static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] = {
> +    { .compatible = "renesas,r8a779f0-pcie" },
> +    { .compatible = "renesas,r8a779g0-pcie" },
> +    {},
> +};
> +
> +static int __init pci_host_generic_probe(struct dt_device_node *dev,
> +                                         const void *data)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    bridge = dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
> +                                &rcar4_pcie_child_ops);
> +
> +    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
> +
> +    return 0;
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
> +.dt_match = rcar4_pcie_dt_match,
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
> -- 
> 2.34.1
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2BAC754B
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 03:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999729.1380351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRr0-0005Hy-5R; Thu, 29 May 2025 01:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999729.1380351; Thu, 29 May 2025 01:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKRr0-0005FS-2D; Thu, 29 May 2025 01:14:42 +0000
Received: by outflank-mailman (input) for mailman id 999729;
 Thu, 29 May 2025 01:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKRqy-0005FE-6j
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 01:14:40 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 498dfe4d-3c2a-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 03:14:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3CACF61156;
 Thu, 29 May 2025 01:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2546BC4CEE3;
 Thu, 29 May 2025 01:14:34 +0000 (UTC)
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
X-Inumbo-ID: 498dfe4d-3c2a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748481275;
	bh=rwadL/Wng9tKc3eHnmDgJKY6hwQqIw2Szk/Qzw3gv6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DoUuRF5KegDJwab28HbXG/Fl2EdUDQjJTFTK3KNKM9/WGLgXGk5RY/i0u/xVZowSp
	 H/93MyyjIVRc/HWMfJm2LVXgqvm5UpFYfAvc/aEdrXreafbCef0AkVre+9SbBBjXSy
	 0POLkbXY6PBJByB+MGPz1WAB84Qs8eLGjE6CNcef9AR3jtrFTkyXirN8UK6aJDV9XU
	 2w4NKIq+ijwVcdVDXDq9XisgFH14vRxkZ84/Giet2y5g0nVPsZ8prw7AmVuiGYr0/A
	 yCenp02GqgUEfac/LBaCXY8BomvfbuQ3FEoR17boRBAL0mPJtamWZqZ6lPRpquLF0Y
	 Ug33zawTkXTEA==
Date: Wed, 28 May 2025 18:14:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
In-Reply-To: <06f5972dda6a8132be8eab5ad1b8586ff3c5aaf3.1747820844.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505281814050.135336@ubuntu-linux-20-04-desktop>
References: <cover.1747820844.git.mykyta_poturai@epam.com> <06f5972dda6a8132be8eab5ad1b8586ff3c5aaf3.1747820844.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Renesas R-Car Gen4 PCI host controller, specifically
> targeting the S4 and V4H SoCs. The implementation includes configuration
> read/write operations for both root and child buses. For accessing the
> child bus, iATU is used for address translation.
> 
> The host controller needs to be initialized by Dom0 first to be properly
> handled by Xen. Xen itself only handles the runtime configuration of
> the iATU for accessing different child devices.
> 
> iATU programming is done similarly to Linux, where only window 0 is used
> for dynamic configuration, and it is reconfigured for every config space
> read/write.
> 
> Code common to all DesignWare PCI host controllers is located in a
> separate file to allow for easy reuse in other DesignWare-based PCI
> host controllers.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v4->v5:
> * update license identifiers
> * improve error checking
> * use XENLOG_G_* where needed
> * make macro defs more robust and minor style fixes
> * add MAINTANERS entry
> 
> v3->v4:
> * no changes
> 
> v2->v3:
> * move priv allocation to dw_pcie_host_probe
> 
> v1->v2:
> * move designware code in a separate file
> ---
>  MAINTAINERS                       |   6 +
>  xen/arch/arm/pci/Makefile         |   2 +
>  xen/arch/arm/pci/pci-designware.c | 416 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-designware.h |  90 +++++++
>  xen/arch/arm/pci/pci-host-rcar4.c |  94 +++++++
>  5 files changed, 608 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-designware.c
>  create mode 100644 xen/arch/arm/pci/pci-designware.h
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..dc1291e2b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -476,6 +476,12 @@ M:	Anthony Perard <anthony.perard@vates.tech>
>  S:	Supported
>  T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
>  
> +RCAR PCI
> +M:	Mykyta Poturai <mykyta_poturai@epam.com>
> +S:	Supported
> +F:	xen/arch/arm/pci/pci-host-rcar4.c
> +F:	xen/arch/arm/pci/pci-designware*
> +
>  REMUS
>  S:	Orphan
>  F:	docs/README.remus
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
> index 0000000000..fc8c6724f2
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -0,0 +1,416 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
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
> +#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffffU))
> +
> +static int dw_pcie_read(void __iomem *addr, int len, uint32_t *val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, len) )
> +    {
> +        *val = 0;
> +        return -EFAULT;
> +    }
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *val = readb(addr);
> +        break;
> +    case 2:
> +        *val = readw(addr);
> +        break;
> +    case 4:
> +        *val = readl(addr);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return 0;
> +}
> +
> +static int dw_pcie_write(void __iomem *addr, int len, uint32_t val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, len) )
> +        return -EFAULT;
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        writeb(val, addr);
> +        break;
> +    case 2:
> +        writew(val, addr);
> +        break;
> +    case 4:
> +        writel(val, addr);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return 0;
> +}
> +
> +static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                                 size_t size)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +    uint32_t val;
> +    int ret;
> +
> +    ret = dw_pcie_read(addr, size, &val);
> +    if ( ret )
> +        printk(XENLOG_G_ERR "Read DBI address failed\n");
> +
> +    return val;
> +}
> +
> +static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                              size_t size, uint32_t val)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +    int ret;
> +
> +    ret = dw_pcie_write(addr, size, val);
> +    if ( ret )
> +        printk(XENLOG_G_ERR "Write DBI address failed\n");
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
> +    if ( val == 0xffffffffU )
> +        priv->iatu_unroll_enabled = true;
> +
> +    printk(XENLOG_G_DEBUG "%s iATU unroll: %sabled\n",
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
> +        printk(XENLOG_G_ERR "Read ATU address failed\n");
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
> +        printk(XENLOG_G_ERR "Write ATU address failed\n");
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
> +static int dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
> +                                            uint8_t func_no, int index,
> +                                            int type, uint64_t cpu_addr,
> +                                            uint64_t pci_addr, uint64_t size)
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
> +            return 0;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }
> +    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
> +
> +    return -ENXIO;
> +}
> +
> +static int __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
> +                                       uint8_t func_no, int index, int type,
> +                                       uint64_t cpu_addr, uint64_t pci_addr,
> +                                       uint64_t size)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    uint32_t retries, val;
> +
> +    if ( priv->iatu_unroll_enabled )
> +        return dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
> +                                                cpu_addr, pci_addr, size);
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
> +            return 0;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }
> +    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
> +
> +    return -ENXIO;
> +}
> +
> +static int dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int index,
> +                                     int type, uint64_t cpu_addr,
> +                                     uint64_t pci_addr, uint64_t size)
> +{
> +    return __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr,
> +                                       size);
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
> +    int ret;
> +
> +    busdev = PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn)) |
> +             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
> +
> +    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
> +    ret = dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                    PCIE_ATU_TYPE_CFG0,
> +                                    bridge->child_cfg->phys_addr, busdev,
> +                                    bridge->child_cfg->size);
> +    if ( ret )
> +        return 0;
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
> +        ret = dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                        PCIE_ATU_TYPE_IO,
> +                                        bridge->child_cfg->phys_addr, 0,
> +                                        bridge->child_cfg->size);
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
> +        ret = dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                        PCIE_ATU_TYPE_IO,
> +                                        bridge->child_cfg->phys_addr, 0,
> +                                        bridge->child_cfg->size);
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
> +    priv = xzalloc(struct dw_pcie_priv);
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
> index 0000000000..df4a9afe75
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + */
> +
> +#include <xen/pci.h>
> +#include <xen/init.h>
> +
> +#ifndef __PCI_DESIGNWARE_H__
> +#define __PCI_DESIGNWARE_H__
> +
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
> +#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), (x))
> +#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), (x))
> +#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), (x))
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
> index 0000000000..62d2130a63
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
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
> +        .init_bus_range         = pci_generic_init_bus_range,
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
> +        .init_bus_range         = pci_generic_init_bus_range_child,
> +    }
> +};
> +
> +static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] = {
> +    { .compatible = "renesas,r8a779f0-pcie" },
> +    { .compatible = "renesas,r8a779g0-pcie" },
> +    {},
> +};
> +
> +static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
> +                                       const void *data)
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
> +.init = pci_host_rcar4_probe,
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


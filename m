Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A776AFD6ED
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 21:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037213.1409892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlb-0001su-SX; Tue, 08 Jul 2025 19:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037213.1409892; Tue, 08 Jul 2025 19:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlb-0001rN-OU; Tue, 08 Jul 2025 19:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1037213;
 Tue, 08 Jul 2025 19:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZDla-0001d3-R1
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 19:14:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9624615-5c2f-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 21:14:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 848B56112E;
 Tue,  8 Jul 2025 19:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1557BC4CEED;
 Tue,  8 Jul 2025 19:14:06 +0000 (UTC)
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
X-Inumbo-ID: b9624615-5c2f-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752002048;
	bh=+OsadfDoWa/66/7oup+PKQ2A9dp5wlQHh65yPZN1Y2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hlYJlXHf0YuN65cdnzdply/V6nJ1p+xRy95B3x1wQtCAMQZVcnHIEjJ5VLW/+C3bB
	 PHOCzBcCu0DoU6Cpkc/LJiaYTEf/LhZSY8NXNGNuAngQaHZW2qki8IJzPID5kjTjqT
	 +lzyZRlY3k8OcK1TI2cSSoim3872kWsxBSN6ZuC0+0spr/CGN11tXTPJQzFnJaYBKy
	 6ivJsMoR60UR8ZifFqDMZgMTgHF3nPwPrrYe4l0xJKMFYhE5eoi9OT4NqpJTV6q9vu
	 06oX1IfshbBx/PXwlx+gQqflIWmpIprXvGacPKBYVp7ncXFNGLwhpXGAPAXbY0qPr6
	 UaP46Eri+h1ow==
Date: Tue, 8 Jul 2025 12:14:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
In-Reply-To: <4a7c0fbe82b10ca7c6a6a703fec6d114880d0285.1751874601.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507081209200.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751874601.git.mykyta_poturai@epam.com> <4a7c0fbe82b10ca7c6a6a703fec6d114880d0285.1751874601.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Mykyta Poturai wrote:
> For IPMMU to be able to associate a specific PCI device with it's TLB
> the BDF to OSID mapping needs to be set up in the host bridge. The
> configured OSID is then emmited as a sideband data on the AXI bus during
> PCI DMA transactions. OSID configuration registers are located in the
> "app" region of the host bridge.
> 
> Map the "app" region on init and implement methods for setting up
> BDF->OSID mappings
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/pci/pci-host-rcar4.c | 148 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-rcar4.h |  18 ++++
>  2 files changed, 166 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h
> 
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
> index 62d2130a63..9290c6cac5 100644
> --- a/xen/arch/arm/pci/pci-host-rcar4.c
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -16,6 +16,32 @@
>  
>  #define RCAR4_DWC_VERSION       0x520A
>  
> +/* PCIE BDF-OSID assignment */
> +#define CNVID(n)             (0x700 + ((n) * 4))
> +#define CNVID_CNV_EN         (1U << 31)
> +#define CNVID_OSID_MASK      (0x0F << 16)
> +#define CNVID_OSID_SHIFT     16
> +#define CNVID_BDF_MASK       (0xFFFF << 0)
> +#define CNVID_BDF_SHIFT      0
> +
> +#define CNVIDMSK(n)                (0x780 + ((n) * 4))
> +#define CNVIDMSK_BDF_MSK_MASK      (0xFFFF << 0)
> +#define CNVIDMSK_BDF_MSK_SHIFT     0
> +
> +#define CNVOSIDCTRL                0x800
> +#define CNVOSIDCTRL_OSID_MASK      (0x0F << 16)
> +#define CNVOSIDCTRL_OSID_SHIFT     16
> +
> +#define DEFAULT_OSID    0
> +
> +#define NUM_OSID_REGS    16
> +
> +struct rcar4_pcie_priv {
> +    bool init_done;
> +    void __iomem *app_base;
> +    DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
> +};
> +
>  /*
>   * PCI host bridges often have different ways to access the root and child
>   * bus config spaces:
> @@ -65,17 +91,139 @@ static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] = {
>      {},
>  };
>  
> +static void rcar4_pcie_writel_app(struct rcar4_pcie_priv *pci, uint32_t reg,
> +                                  uint32_t val)
> +{
> +    writel(val, pci->app_base + reg);
> +}
> +
> +static uint32_t rcar4_pcie_readl_app(struct rcar4_pcie_priv *pci, uint32_t reg)
> +{
> +    return readl(pci->app_base + reg);
> +}
> +
> +int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +    uint32_t val = rcar4_pcie_readl_app(priv, CNVOSIDCTRL);
> +
> +    if ( priv->init_done )
> +        return 0;
> +    priv->init_done = true;
> +
> +    val = (val & ~CNVOSIDCTRL_OSID_MASK) |
> +          (DEFAULT_OSID << CNVOSIDCTRL_OSID_SHIFT);
> +    rcar4_pcie_writel_app(priv, CNVOSIDCTRL, val);
> +    bitmap_zero(priv->osid_regs, NUM_OSID_REGS);
> +
> +    printk("%s: Initialized OSID regs (default OSID %u)\n",
> +           bridge->dt_node->full_name, DEFAULT_OSID);
> +
> +    return 0;
> +}
> +
> +int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +    int ret;
> +
> +    ret = find_first_zero_bit(priv->osid_regs, NUM_OSID_REGS);
> +    if ( ret != NUM_OSID_REGS )
> +        set_bit(ret, priv->osid_regs);
> +    else
> +        ret = -EBUSY;
> +
> +    return ret;
> +}
> +
> +void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
> +                              unsigned int reg_id)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +
> +    clear_bit(reg_id, priv->osid_regs);
> +}
> +
> +void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
> +                             unsigned int reg_id, uint32_t osid, uint32_t bdf)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +    uint32_t data = rcar4_pcie_readl_app(priv, CNVID(reg_id));
> +
> +    data &= ~(CNVID_OSID_MASK | CNVID_BDF_MASK);
> +    data |= CNVID_CNV_EN | (osid << CNVID_OSID_SHIFT) |
> +            (bdf << CNVID_BDF_SHIFT);
> +    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
> +}
> +
> +void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
> +                               unsigned int reg_id)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +    uint32_t data = rcar4_pcie_readl_app(priv, CNVID(reg_id));
> +
> +    data &= ~CNVID_CNV_EN;
> +    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
> +}
> +
> +void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int reg_id,
> +                            uint32_t data)
> +{
> +    struct rcar4_pcie_priv *priv = dw_pcie_get_priv(bridge);
> +
> +    uint32_t val = rcar4_pcie_readl_app(priv, CNVIDMSK(reg_id));
> +
> +    val = (val & ~CNVIDMSK_BDF_MSK_MASK) | (data << CNVIDMSK_BDF_MSK_SHIFT);
> +
> +    rcar4_pcie_writel_app(priv, CNVIDMSK(reg_id), val);
> +}
> +
>  static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
>                                         const void *data)
>  {
>      struct pci_host_bridge *bridge;
> +    paddr_t app_phys_addr;
> +    paddr_t app_size;
> +    int app_idx, ret;
> +
> +    struct rcar4_pcie_priv *priv = xzalloc(struct rcar4_pcie_priv);
> +    if ( !priv )
> +        return -ENOMEM;
>  
>      bridge = dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
>                                  &rcar4_pcie_child_ops);
>  
> +    app_idx = dt_property_match_string(dev, "reg-names", "app");
> +    if ( app_idx < 0 )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"app\" range index in device tree\n");
> +        ret = app_idx;
> +        goto err;
> +    }
> +    ret = dt_device_get_address(dev, app_idx, &app_phys_addr, &app_size);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"app\" range in device tree\n");
> +        goto err;
> +    }
> +
> +    priv->app_base = ioremap_nocache(app_phys_addr, app_size);
> +    if ( !priv->app_base )
> +    {
> +        printk(XENLOG_ERR "APP ioremap failed\n");
> +        ret = -ENXIO;
> +        goto err;
> +    }
> +    printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr,
> +           app_phys_addr + app_size - 1);
> +
> +    dw_pcie_set_priv(bridge, priv);
>      dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
>  
>      return 0;
> +err:
> +    xfree(priv);
> +    return ret;
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-rcar4.h
> new file mode 100644
> index 0000000000..8ac6626a22
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-rcar4.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/pci.h>
> +
> +#ifndef __PCI_HOST_RCAR4_H__
> +#define __PCI_HOST_RCAR4_H__
> +
> +void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
> +                             unsigned int reg_id, uint32_t osid, uint32_t bdf);
> +void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
> +                               unsigned int reg_id);
> +void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int reg_id,
> +                            uint32_t data);
> +int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge);
> +void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
> +                              unsigned int reg_id);
> +int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
> +
> +#endif /* __PCI_HOST_RCAR4_H__ */
> -- 
> 2.34.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3BAFD6EF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 21:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037215.1409902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlp-0002Np-Aq; Tue, 08 Jul 2025 19:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037215.1409902; Tue, 08 Jul 2025 19:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlp-0002IK-84; Tue, 08 Jul 2025 19:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1037215;
 Tue, 08 Jul 2025 19:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZDln-0001d3-Os
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 19:14:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f04157-5c2f-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 21:14:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B8325C638B;
 Tue,  8 Jul 2025 19:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C408BC4CEED;
 Tue,  8 Jul 2025 19:14:19 +0000 (UTC)
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
X-Inumbo-ID: c0f04157-5c2f-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752002061;
	bh=kSgDFbVx6SBYVBQcqlWcv9C5HOWuKlyTrqqnWYDCcCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LMzu5S2jp/fD3ak8vFgaWMp68SPyOtK1iTnMhAr7uC3azYCY64hidNt1VbBhwRFGm
	 saAHGJqyy4b3ZpvIFvnGt3ddObeGSVTY7KfNsV/BGWyrRHCM8jjyTjXiursseCn0Sd
	 lug+gzb5sECILGhw+vEcBqn/cj+0uLSXODA17PElp+oaoYOWDv/+N1b/tgTQ4zuELU
	 Eyw+ah5b8v/SCZpu4PA/C7YmJNbIE/khRMCKQzhHA+qjkiUZAXy/z0T9BqZ2+43qVA
	 hI3cxDHFzVpWufB7L1cbgRALDQSG/iq8vviGaGhbHdS3tYvqlpXNTJQ9HY5mP6YJtp
	 iV0gHF+ZpQVYA==
Date: Tue, 8 Jul 2025 12:14:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
In-Reply-To: <780521b8646a0431a49e7696f681a420bf888668.1751874601.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507081209280.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751874601.git.mykyta_poturai@epam.com> <780521b8646a0431a49e7696f681a420bf888668.1751874601.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Program PCIE BDF-OSID assignment according to the S4_PCIe_IPMMU-OSID
> when adding PCI device to the IOMMU in ipmmu_add_device callback.
> This is needed for being able to assign PCI devices to different
> domains at the same time. Programmed OSID is emmited as sideband data on
> the AXI bus during PCI DMA transactions and then used by IPMMU to match
> the transaction to the corresponding uTLB.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 141 +++++++++++++++++++++--
>  1 file changed, 133 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index d828d9cf6a..14ddabb30e 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -51,12 +51,25 @@
>  #include <asm/device.h>
>  #include <asm/io.h>
>  #include <asm/iommu_fwspec.h>
> +#include "../arch/arm/pci/pci-host-rcar4.h"
>  
>  #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
>  
>  /* Device logger functions */
> +#ifndef CONFIG_HAS_PCI
>  #define dev_print(dev, lvl, fmt, ...)    \
>      printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#else
> +#define dev_print(dev, lvl, fmt, ...) ({                                \
> +    if ( !dev_is_pci((dev)) )                                           \
> +        printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
> +    else                                                                \
> +    {                                                                   \
> +        struct pci_dev *pdev = dev_to_pci((dev));                       \
> +        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
> +    }                                                                   \
> +})
> +#endif
>  
>  #define dev_info(dev, fmt, ...)    \
>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> @@ -1121,6 +1134,8 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_domain *domain)
>      xfree(domain);
>  }
>  
> +static int ipmmu_deassign_device(struct domain *d, struct device *dev);
> +
>  static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
>                                 uint32_t flag)
>  {
> @@ -1134,8 +1149,43 @@ static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
>      if ( !to_ipmmu(dev) )
>          return -ENODEV;
>  
> -    spin_lock(&xen_domain->lock);
> +#ifdef CONFIG_HAS_PCI
> +    if ( dev_is_pci(dev) )
> +    {
> +        struct pci_dev *pdev = dev_to_pci(dev);
> +        struct domain *old_d = pdev->domain;
> +
> +        printk(XENLOG_INFO "Assigning device %04x:%02x:%02x.%u to dom%d\n",
> +               pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +               d->domain_id);
> +
> +        /*
> +         * XXX What would be the proper behavior? This could happen if
> +         * pdev->phantom_stride > 0
> +         */
> +        if ( devfn != pdev->devfn )
> +            ASSERT_UNREACHABLE();

If it is possible under normal conditions, I would expand the check to
include those normal conditions and continue if it is normal, panic or
returning error if not normal. A panic is better than an ASSERT for
abnormal conditions. Even better is simply to return error.


> +        list_move(&pdev->domain_list, &d->pdev_list);

This needs a lock, but I am guessing this function is already called
with the d->pci_lock lock held.


> +        pdev->domain = d;
> +
> +        /* dom_io is used as a sentinel for quarantined devices */
> +        if ( d == dom_io )
> +        {
> +            int ret;
> +
> +            /*
> +             * Try to de-assign: do not return error if it was already
> +             * de-assigned.
> +             */
> +            ret = ipmmu_deassign_device(old_d, dev);
> +
> +            return ret == -ESRCH ? 0 : ret;
> +        }
> +    }
> +#endif
>  
> +    spin_lock(&xen_domain->lock);
>      /*
>       * The IPMMU context for the Xen domain is not allocated beforehand
>       * (at the Xen domain creation time), but on demand only, when the first
> @@ -1240,7 +1290,7 @@ static int ipmmu_reassign_device(struct domain *s, struct domain *t,
>      int ret = 0;
>  
>      /* Don't allow remapping on other domain than hwdom */
> -    if ( t && !is_hardware_domain(t) )
> +    if ( t && !is_hardware_domain(t) && (t != dom_io) )
>          return -EPERM;
>  
>      if ( t == s )
> @@ -1288,20 +1338,95 @@ static int ipmmu_dt_xlate(struct device *dev,
>  
>  static int ipmmu_add_device(u8 devfn, struct device *dev)
>  {
> -    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +    struct iommu_fwspec *fwspec;
> +
> +#ifdef CONFIG_HAS_PCI
> +    if ( dev_is_pci(dev) )
> +    {
> +        struct pci_dev *pdev = dev_to_pci(dev);
> +        int ret;
> +
> +        if ( devfn != pdev->devfn )
> +            return 0;
> +
> +        ret = iommu_add_pci_sideband_ids(pdev);
> +        if ( ret < 0 )
> +            iommu_fwspec_free(dev);
> +    }
> +#endif
> +
> +    fwspec = dev_iommu_fwspec_get(dev);
>  
>      /* Only let through devices that have been verified in xlate(). */
>      if ( !to_ipmmu(dev) )
>          return -ENODEV;
>  
> -    if ( dt_device_is_protected(dev_to_dt(dev)) )
> +    if ( !dev_is_pci(dev) )
>      {
> -        dev_err(dev, "Already added to IPMMU\n");
> -        return -EEXIST;
> +        if ( dt_device_is_protected(dev_to_dt(dev)) )
> +        {
> +            dev_err(dev, "Already added to IPMMU\n");
> +            return -EEXIST;
> +        }
> +
> +        /* Let Xen know that the master device is protected by an IOMMU. */
> +        dt_device_set_protected(dev_to_dt(dev));
>      }
> +#ifdef CONFIG_HAS_PCI
> +    if ( dev_is_pci(dev) )
> +    {
> +        struct pci_dev *pdev = dev_to_pci(dev);
> +        unsigned int reg_id, osid;
> +        struct pci_host_bridge *bridge;
> +        struct iommu_fwspec *fwspec_bridge;
> +        unsigned int utlb_osid0 = 0;
> +        int ret;
> +
> +        bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> +        if ( !bridge )
> +        {
> +            dev_err(dev, "Failed to find host bridge\n");
> +            return -ENODEV;
> +        }
> +
> +        fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
> +        if ( fwspec_bridge->num_ids < 1 )
> +        {
> +            dev_err(dev, "Failed to find host bridge uTLB\n");
> +            return -ENXIO;
> +        }
> +
> +        if ( fwspec->num_ids < 1 )
> +        {
> +            dev_err(dev, "Failed to find uTLB");
> +            return -ENXIO;
> +        }
> +
> +        rcar4_pcie_osid_regs_init(bridge);
>  
> -    /* Let Xen know that the master device is protected by an IOMMU. */
> -    dt_device_set_protected(dev_to_dt(dev));
> +        ret = rcar4_pcie_osid_reg_alloc(bridge);
> +        if ( ret < 0 )
> +        {
> +            dev_err(dev, "No unused OSID regs\n");
> +            return ret;
> +        }
> +        reg_id = ret;
> +
> +        osid = fwspec->ids[0] - utlb_osid0;
> +        rcar4_pcie_osid_bdf_set(bridge, reg_id, osid, pdev->sbdf.bdf);
> +        rcar4_pcie_bdf_msk_set(bridge, reg_id, 0);
> +
> +        dev_info(dev, "Allocated OSID reg %u (OSID %u)\n", reg_id, osid);
> +
> +        ret = ipmmu_assign_device(pdev->domain, devfn, dev, 0);
> +        if ( ret )
> +        {
> +            rcar4_pcie_osid_bdf_clear(bridge, reg_id);
> +            rcar4_pcie_osid_reg_free(bridge, reg_id);
> +            return ret;
> +        }
> +    }
> +#endif
>  
>      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
> -- 
> 2.34.1
> 


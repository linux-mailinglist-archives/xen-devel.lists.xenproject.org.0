Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E880F60D7C2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430254.681720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onT7p-0001sL-Ba; Tue, 25 Oct 2022 23:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430254.681720; Tue, 25 Oct 2022 23:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onT7p-0001qP-8X; Tue, 25 Oct 2022 23:14:25 +0000
Received: by outflank-mailman (input) for mailman id 430254;
 Tue, 25 Oct 2022 23:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onT7o-0001qF-1p
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 23:14:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24327b4-54ba-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 01:14:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F60061BF8;
 Tue, 25 Oct 2022 23:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA0FC433C1;
 Tue, 25 Oct 2022 23:14:19 +0000 (UTC)
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
X-Inumbo-ID: c24327b4-54ba-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666739660;
	bh=MzpMrjWsH19E0r9kWq1TaDGhbd1xbuNvnFOB0rRZuG0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tKirTCrkpCCd3YLx/m4i2cluGCr9cIfpNNUIUtlNsJ/DZNQjfoX454lPX3VSqBQ2p
	 zhdBBTCDI3Q/KNfgVzdKOcXyveQC0zAfn/yHE9NAStjzn9I32Wnc7r0HrWZTZU/gw9
	 s5NM24A32ZlFXUF1n5wbPgtTkHWYNV6saz+VHXhHEFIslvwIYGzQf3YRQlZSRkexc0
	 cnRFvzSqm/RaywfgWrwzuIJRuW1gPPW814LYsY4hj3Q/c3gTrLm2S5zQLuvH/NbnAM
	 acQ4G7Bu7ri3Vmx+Ka4TA9M/7IWQC7ZfyjOy4yqCejJjrl1zGDyVIY+UmbSTOvjB3c
	 obBl5/YTcTp6A==
Date: Tue, 25 Oct 2022 16:14:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH V4 2/2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
In-Reply-To: <20221025162004.8501-3-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210251614110.1397955@ubuntu-linux-20-04-desktop>
References: <20221025162004.8501-1-olekstysh@gmail.com> <20221025162004.8501-3-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Oct 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Use the same "xen-grant-dma" device concept for the PCI devices
> behind device-tree based PCI Host controller, but with one modification.
> Unlike for platform devices, we cannot use generic IOMMU bindings
> (iommus property), as we need to support more flexible configuration.
> The problem is that PCI devices under the single PCI Host controller
> may have the backends running in different Xen domains and thus have
> different endpoints ID (backend domains ID).
> 
> Add ability to deal with generic PCI-IOMMU bindings (iommu-map/
> iommu-map-mask properties) which allows us to describe relationship
> between PCI devices and backend domains ID properly.
> 
> To avoid having to look up for the PCI Host bridge twice and reduce
> the amount of checks pass an extra struct device_node *np to
> xen_dt_grant_init_backend_domid().
> 
> So with current patch the code expects iommus property for the platform
> devices and iommu-map/iommu-map-mask properties for PCI devices.
> 
> The example of generated by the toolstack iommu-map property
> for two PCI devices 0000:00:01.0 and 0000:00:02.0 whose
> backends are running in different Xen domains with IDs 1 and 2
> respectively:
> iommu-map = <0x08 0xfde9 0x01 0x08 0x10 0xfde9 0x02 0x08>;
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
> on Arm at some point in the future. The Xen toolstack side is not completely ready yet.
> Here, for PCI devices we use more flexible way to pass backend domid to the guest
> than for platform devices.
> 
> Changes V1 -> V2:
>    - update commit description
>    - rebase
>    - rework to use generic PCI-IOMMU bindings instead of generic IOMMU bindings
> 
> Changes V2 -> V3:
>    - update commit description, add an example
>    - drop xen_dt_map_id() and squash xen_dt_get_pci_host_node() with
>      xen_dt_get_node()
>    - pass struct device_node *np to xen_is_dt_grant_dma_device() and
>      xen_dt_grant_init_backend_domid()
>    - pass domid_t *backend_domid instead of struct xen_grant_dma_data *data
>      to xen_dt_grant_init_backend_domid()
> 
> Changes V3 -> V4:
>    - just rebase on new prereq patch
>      "xen/virtio: Optimize the setup of "xen-grant-dma" devices"
> 
> Previous discussion is at:
> https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/20221015153409.918775-1-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/20221021172408.77397-1-olekstysh@gmail.com/
> 
> Based on:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
> ---
> ---
>  drivers/xen/grant-dma-ops.c | 46 +++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1e797a043980..9784a77fa3c9 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/of.h>
> +#include <linux/pci.h>
>  #include <linux/pfn.h>
>  #include <linux/xarray.h>
>  #include <linux/virtio_anchor.h>
> @@ -292,15 +293,43 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>  	.dma_supported = xen_grant_dma_supported,
>  };
>  
> +static struct device_node *xen_dt_get_node(struct device *dev)
> +{
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		struct pci_bus *bus = pdev->bus;
> +
> +		/* Walk up to the root bus to look for PCI Host controller */
> +		while (!pci_is_root_bus(bus))
> +			bus = bus->parent;
> +
> +		return of_node_get(bus->bridge->parent->of_node);
> +	}
> +
> +	return of_node_get(dev->of_node);
> +}
> +
>  static int xen_dt_grant_init_backend_domid(struct device *dev,
> +					   struct device_node *np,
>  					   domid_t *backend_domid)
>  {
> -	struct of_phandle_args iommu_spec;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  
> -	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> -			0, &iommu_spec)) {
> -		dev_dbg(dev, "Cannot parse iommus property\n");
> -		return -ESRCH;
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> +
> +		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> +				iommu_spec.args)) {
> +			dev_dbg(dev, "Cannot translate ID\n");
> +			return -ESRCH;
> +		}
> +	} else {
> +		if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
> +				0, &iommu_spec)) {
> +			dev_dbg(dev, "Cannot parse iommus property\n");
> +			return -ESRCH;
> +		}
>  	}
>  
>  	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> @@ -324,10 +353,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  static int xen_grant_init_backend_domid(struct device *dev,
>  					domid_t *backend_domid)
>  {
> +	struct device_node *np;
>  	int ret = -ENODEV;
>  
> -	if (dev->of_node) {
> -		ret = xen_dt_grant_init_backend_domid(dev, backend_domid);
> +	np = xen_dt_get_node(dev);
> +	if (np) {
> +		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
> +		of_node_put(np);
>  	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
>  		dev_info(dev, "Using dom0 as backend\n");
>  		*backend_domid = 0;
> -- 
> 2.25.1
> 


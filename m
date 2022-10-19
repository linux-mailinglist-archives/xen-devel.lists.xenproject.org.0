Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA746603754
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 02:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425398.673175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okxPN-0005Tf-Ps; Wed, 19 Oct 2022 00:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425398.673175; Wed, 19 Oct 2022 00:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okxPN-0005Rq-Mu; Wed, 19 Oct 2022 00:58:09 +0000
Received: by outflank-mailman (input) for mailman id 425398;
 Wed, 19 Oct 2022 00:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PkOC=2U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okxPM-0005Rj-6A
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 00:58:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16b8c9de-4f49-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 02:58:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 885816172E;
 Wed, 19 Oct 2022 00:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308A6C433D6;
 Wed, 19 Oct 2022 00:58:03 +0000 (UTC)
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
X-Inumbo-ID: 16b8c9de-4f49-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666141084;
	bh=pnxCyzPm3hjqwJLkvTjMO+xVkN+jfmiHlHruC5BM2xU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l8P6dB7L/PRrKCfkvtxwg0woenifQcNqkdaxEJJT12zZg+mgPS102pKwLkZWhtf4O
	 J191jNBUX1ZOYGCmKRSQPOo8HfUlEX0gzeo99VYeDnSnTzxxaExkxia0oEhF7DG6ca
	 Y8Q65n3IINzP58lQknYtLnBABCQi4qoaaLpTNT6nJHGDxSl/RtsSJSDZeAbWTwIMCR
	 O4sRFI2PegWbckVWyqub8rAgqKuSaDoKgmeUtjagtKdyYFaso/aCkBbAsiiuJIo9sw
	 20c9yLt26Uq8ctE3ko6HMZL/YAoEKa0wR50NKO8VLpMmVWSorKjPMYCyKy2dk+HS9I
	 rxgF34+Hnfrzw==
Date: Tue, 18 Oct 2022 17:58:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
In-Reply-To: <20221015153409.918775-1-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210181734440.4587@ubuntu-linux-20-04-desktop>
References: <20221015153409.918775-1-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 Oct 2022, Oleksandr Tyshchenko wrote:
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
> So use generic PCI-IOMMU bindings instead (iommu-map/iommu-map-mask
> properties) which allows us to describe relationship between PCI
> devices and backend domains ID properly.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Now that I understood the approach and the reasons for it, I can review
the patch :-)

Please add an example of the bindings in the commit message.


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
> Previous discussion is at:
> https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
> 
> Based on:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
> ---
>  drivers/xen/grant-dma-ops.c | 87 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 76 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index daa525df7bdc..b79d9d6ce154 100644
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
> @@ -292,12 +293,55 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>  	.dma_supported = xen_grant_dma_supported,
>  };
>  
> +static struct device_node *xen_dt_get_pci_host_node(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct pci_bus *bus = pdev->bus;
> +
> +	/* Walk up to the root bus to look for PCI Host controller */
> +	while (!pci_is_root_bus(bus))
> +		bus = bus->parent;
> +
> +	return of_node_get(bus->bridge->parent->of_node);
> +}

It seems silly that we need to walk the hierachy that way, but I
couldn't find another way to do it


> +static struct device_node *xen_dt_get_node(struct device *dev)
> +{
> +	if (dev_is_pci(dev))
> +		return xen_dt_get_pci_host_node(dev);
> +
> +	return of_node_get(dev->of_node);
> +}
> +
> +static int xen_dt_map_id(struct device *dev, struct device_node **iommu_np,
> +			 u32 *sid)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	struct device_node *host_np;
> +	int ret;
> +
> +	host_np = xen_dt_get_pci_host_node(dev);
> +	if (!host_np)
> +		return -ENODEV;
> +
> +	ret = of_map_id(host_np, rid, "iommu-map", "iommu-map-mask", iommu_np, sid);
> +	of_node_put(host_np);
> +	return ret;
> +}
> +
>  static bool xen_is_dt_grant_dma_device(struct device *dev)
>  {
> -	struct device_node *iommu_np;
> +	struct device_node *iommu_np = NULL;
>  	bool has_iommu;
>  
> -	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> +	if (dev_is_pci(dev)) {
> +		if (xen_dt_map_id(dev, &iommu_np, NULL))
> +			return false;
> +	} else
> +		iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> +
>  	has_iommu = iommu_np &&
>  		    of_device_is_compatible(iommu_np, "xen,grant-dma");
>  	of_node_put(iommu_np);
> @@ -307,9 +351,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
>  
>  bool xen_is_grant_dma_device(struct device *dev)
>  {
> +	struct device_node *np;
> +
>  	/* XXX Handle only DT devices for now */
> -	if (dev->of_node)
> -		return xen_is_dt_grant_dma_device(dev);
> +	np = xen_dt_get_node(dev);
> +	if (np) {
> +		bool ret;
> +
> +		ret = xen_is_dt_grant_dma_device(dev);
> +		of_node_put(np);
> +		return ret;
> +	}

We don't need to walk the PCI hierachy twice. Maybe we can add the
of_node check directly to xen_is_dt_grant_dma_device?


>  	return false;
>  }
> @@ -325,12 +377,19 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
>  static int xen_dt_grant_init_backend_domid(struct device *dev,
>  					   struct xen_grant_dma_data *data)
>  {
> -	struct of_phandle_args iommu_spec;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  
> -	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> -			0, &iommu_spec)) {
> -		dev_err(dev, "Cannot parse iommus property\n");
> -		return -ESRCH;
> +	if (dev_is_pci(dev)) {
> +		if (xen_dt_map_id(dev, &iommu_spec.np, iommu_spec.args)) {
> +			dev_err(dev, "Cannot translate ID\n");
> +			return -ESRCH;
> +		}
> +	} else {
> +		if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> +				0, &iommu_spec)) {
> +			dev_err(dev, "Cannot parse iommus property\n");
> +			return -ESRCH;
> +		}
>  	}
>  
>  	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> @@ -354,6 +413,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  void xen_grant_setup_dma_ops(struct device *dev)
>  {
>  	struct xen_grant_dma_data *data;
> +	struct device_node *np;
>  
>  	data = find_xen_grant_dma_data(dev);
>  	if (data) {
> @@ -365,8 +425,13 @@ void xen_grant_setup_dma_ops(struct device *dev)
>  	if (!data)
>  		goto err;
>  
> -	if (dev->of_node) {
> -		if (xen_dt_grant_init_backend_domid(dev, data))
> +	np = xen_dt_get_node(dev);
> +	if (np) {
> +		int ret;
> +
> +		ret = xen_dt_grant_init_backend_domid(dev, data);
> +		of_node_put(np);
> +		if (ret)
>  			goto err;
>  	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
>  		dev_info(dev, "Using dom0 as backend\n");
> -- 
> 2.25.1
> 


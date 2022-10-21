Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACD607F85
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 22:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427971.677640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olyJv-0007QF-Pd; Fri, 21 Oct 2022 20:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427971.677640; Fri, 21 Oct 2022 20:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olyJv-0007NX-MN; Fri, 21 Oct 2022 20:08:43 +0000
Received: by outflank-mailman (input) for mailman id 427971;
 Fri, 21 Oct 2022 20:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QljK=2W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olyJu-0007NR-Pk
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 20:08:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 282091fe-517c-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 22:08:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C71D1B82C98;
 Fri, 21 Oct 2022 20:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B79BC433C1;
 Fri, 21 Oct 2022 20:08:37 +0000 (UTC)
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
X-Inumbo-ID: 282091fe-517c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666382918;
	bh=JvVuwGFgzjcQue281gO7KLG4H7q04b7BOWjJNOmrTUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oyARZFzA3Rybv6jI7P9f+9HpWEf0RZJ0DACP+ZaQMq1CVLeiwU24NZVXLzIKoYa2r
	 NFXpTq4n9sZGDkVpC3qrsj9MOSXfl/tPXQA/DZHI8ZTw2sWsVrwqakbg+/kAvXZuLn
	 Hvev14eUbaecZGUxS0huWBMslcXIVMKkrWue+hBc1gkvPBjk29bmJ9TGR7Z1MhE0eM
	 VqA6GCek1wJR3c5dsZAw9SYczD9rqAaeMhReSIJZrj5ypvUBVXXsTmVJ8oc9TPMMux
	 GWFvazRrepCZWvKVcXDNRkvbJ8f4zAqraXGwYcJms2WdCdvrw4z4yRlL7Sa7ypOovC
	 tWjNnkZjOkU4A==
Date: Fri, 21 Oct 2022 13:08:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH V3] xen/virtio: Handle PCI devices which Host controller
 is described in DT
In-Reply-To: <20221021172408.77397-1-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210211258050.3873@ubuntu-linux-20-04-desktop>
References: <20221021172408.77397-1-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Oct 2022, Oleksandr Tyshchenko wrote:
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
> the amount of checks pass an extra struct device_node *np to both
> xen_dt_grant_init_backend_domid() and xen_is_dt_grant_dma_device().
> While at it also pass domid_t *backend_domid instead of
> struct xen_grant_dma_data *data to the former.
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
> Previous discussion is at:
> https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/20221015153409.918775-1-olekstysh@gmail.com/
> 
> Based on:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
> ---
>  drivers/xen/grant-dma-ops.c | 80 ++++++++++++++++++++++++++++++-------
>  1 file changed, 66 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index daa525df7bdc..76b29d20aeee 100644
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
> @@ -292,12 +293,37 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>  	.dma_supported = xen_grant_dma_supported,
>  };
>  
> -static bool xen_is_dt_grant_dma_device(struct device *dev)
> +static struct device_node *xen_dt_get_node(struct device *dev)
>  {
> -	struct device_node *iommu_np;
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
> +static bool xen_is_dt_grant_dma_device(struct device *dev,
> +					struct device_node *np)
> +{
> +	struct device_node *iommu_np = NULL;
>  	bool has_iommu;
>  
> -	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> +
> +		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_np, NULL))
> +			return false;
> +	} else
> +		iommu_np = of_parse_phandle(np, "iommus", 0);
> +
>  	has_iommu = iommu_np &&
>  		    of_device_is_compatible(iommu_np, "xen,grant-dma");
>  	of_node_put(iommu_np);

I think we can remove xen_is_dt_grant_dma_device and just call
xen_dt_grant_init_backend_domid passing a NULL backend_domid?

It is a bit annoying that we are basically doing the same device tree
parsing twice in a row given that the callers do:

	if (xen_is_grant_dma_device(dev))
		xen_grant_setup_dma_ops(dev);

Maybe we could move the backend_domid allocation and setting to
xen_dt_grant_init_backend_domid, which would end up being done from
the xen_is_grant_dma_device() call chain, and only leave setting
dev->dma_ops from xen_grant_setup_dma_ops().

This way the parsing would be done only once? What do you think? This
suggestion is optional, I am OK also with only removing
xen_is_dt_grant_dma_device.


> @@ -307,9 +333,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
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
> +		ret = xen_is_dt_grant_dma_device(dev, np);
> +		of_node_put(np);
> +		return ret;
> +	}
>  
>  	return false;
>  }
> @@ -323,14 +357,26 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
>  }
>  
>  static int xen_dt_grant_init_backend_domid(struct device *dev,
> -					   struct xen_grant_dma_data *data)
> +					   struct device_node *np,
> +					   domid_t *backend_domid)
>  {
> -	struct of_phandle_args iommu_spec;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  
> -	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> -			0, &iommu_spec)) {
> -		dev_err(dev, "Cannot parse iommus property\n");
> -		return -ESRCH;
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> +
> +		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> +				iommu_spec.args)) {
> +			dev_err(dev, "Cannot translate ID\n");
> +			return -ESRCH;
> +		}
> +	} else {
> +		if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
> +				0, &iommu_spec)) {
> +			dev_err(dev, "Cannot parse iommus property\n");
> +			return -ESRCH;
> +		}
>  	}
>  
>  	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> @@ -346,7 +392,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  	 * The endpoint ID here means the ID of the domain where the
>  	 * corresponding backend is running
>  	 */
> -	data->backend_domid = iommu_spec.args[0];
> +	*backend_domid = iommu_spec.args[0];
>  
>  	return 0;
>  }
> @@ -354,6 +400,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  void xen_grant_setup_dma_ops(struct device *dev)
>  {
>  	struct xen_grant_dma_data *data;
> +	struct device_node *np;
>  
>  	data = find_xen_grant_dma_data(dev);
>  	if (data) {
> @@ -365,8 +412,13 @@ void xen_grant_setup_dma_ops(struct device *dev)
>  	if (!data)
>  		goto err;
>  
> -	if (dev->of_node) {
> -		if (xen_dt_grant_init_backend_domid(dev, data))
> +	np = xen_dt_get_node(dev);
> +	if (np) {
> +		int ret;
> +
> +		ret = xen_dt_grant_init_backend_domid(dev, np, &data->backend_domid);
> +		of_node_put(np);
> +		if (ret)
>  			goto err;
>  	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
>  		dev_info(dev, "Using dom0 as backend\n");
> -- 
> 2.25.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0325605120
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 22:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426013.674188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFSD-0002cD-Cb; Wed, 19 Oct 2022 20:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426013.674188; Wed, 19 Oct 2022 20:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFSD-0002Zd-99; Wed, 19 Oct 2022 20:14:17 +0000
Received: by outflank-mailman (input) for mailman id 426013;
 Wed, 19 Oct 2022 20:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PkOC=2U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olFSB-0002ZX-Nh
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 20:14:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99e1e86c-4fea-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 22:14:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E79D8B82565;
 Wed, 19 Oct 2022 20:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D1CC433C1;
 Wed, 19 Oct 2022 20:14:11 +0000 (UTC)
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
X-Inumbo-ID: 99e1e86c-4fea-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666210452;
	bh=FF9KbNdQHNh5m0gRXO+KOo0OL+lC7nTVEehSa0aIgP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SRl92ku75ud54oQvG8QH8BzfmVKYxQYsk+dzgPMOj0s+FUkIoFBmtl2p6aI/i1Vnw
	 VJLWRDlYIGUMfie9r2qSSh3u99HN5fM+tLMo3S6ZdwlnUXR+6Or3hIr+y7KTZRUVWy
	 LpWhuVgdg0iV/YrS7ySBJcgTUbnQrEgnPR6oJBorUCtwTqOMHgEmRBKJTMal59osZv
	 21K41MB9XgMD1uzxwAzO5ShGfrHfQTlY0Iq6vlyhsMX+zKSZVT5Qn/pnjPCUh2SRJO
	 clK5e1+MHMSwiPeBHcv3QjXeecWSLUamp+7RY3N9nsiiVomlolBnTivGON9yjPlovl
	 tUmsYBorV9soQ==
Date: Wed, 19 Oct 2022 13:14:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
In-Reply-To: <af1a47f4-be0a-141d-8e53-0be303486a1a@epam.com>
Message-ID: <alpine.DEB.2.22.394.2210191313070.3873@ubuntu-linux-20-04-desktop>
References: <20221015153409.918775-1-olekstysh@gmail.com> <alpine.DEB.2.22.394.2210181734440.4587@ubuntu-linux-20-04-desktop> <af1a47f4-be0a-141d-8e53-0be303486a1a@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1494198937-1666210452=:3873"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1494198937-1666210452=:3873
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Oct 2022, Oleksandr Tyshchenko wrote:
> On 19.10.22 03:58, Stefano Stabellini wrote:
> > On Sat, 15 Oct 2022, Oleksandr Tyshchenko wrote:
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> Use the same "xen-grant-dma" device concept for the PCI devices
> >> behind device-tree based PCI Host controller, but with one modification.
> >> Unlike for platform devices, we cannot use generic IOMMU bindings
> >> (iommus property), as we need to support more flexible configuration.
> >> The problem is that PCI devices under the single PCI Host controller
> >> may have the backends running in different Xen domains and thus have
> >> different endpoints ID (backend domains ID).
> >>
> >> So use generic PCI-IOMMU bindings instead (iommu-map/iommu-map-mask
> >> properties) which allows us to describe relationship between PCI
> >> devices and backend domains ID properly.
> >>
> >> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Now that I understood the approach and the reasons for it, I can review
> > the patch :-)
> 
> perfect, thanks.
> 
> 
> >
> > Please add an example of the bindings in the commit message.
> 
> ok, will do
> 
> 
> >
> >
> >> ---
> >> Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
> >> on Arm at some point in the future. The Xen toolstack side is not completely ready yet.
> >> Here, for PCI devices we use more flexible way to pass backend domid to the guest
> >> than for platform devices.
> >>
> >> Changes V1 -> V2:
> >>     - update commit description
> >>     - rebase
> >>     - rework to use generic PCI-IOMMU bindings instead of generic IOMMU bindings
> >>
> >> Previous discussion is at:
> >> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/__;!!GF_29dbcQIUBPA!xJPdZO3-3Wmgo_79HuDsD53RkH_eAN96NmwuwFE7dArt_xNYGdD6LeLsq4B_QPrrvX-x23tJl6jQlNqgyNjgzT2NE3Pqjg$  [lore[.]kernel[.]org]
> >>
> >> Based on:
> >> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1__;!!GF_29dbcQIUBPA!xJPdZO3-3Wmgo_79HuDsD53RkH_eAN96NmwuwFE7dArt_xNYGdD6LeLsq4B_QPrrvX-x23tJl6jQlNqgyNjgzT2J40LOxg$  [git[.]kernel[.]org]
> >> ---
> >>   drivers/xen/grant-dma-ops.c | 87 ++++++++++++++++++++++++++++++++-----
> >>   1 file changed, 76 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >> index daa525df7bdc..b79d9d6ce154 100644
> >> --- a/drivers/xen/grant-dma-ops.c
> >> +++ b/drivers/xen/grant-dma-ops.c
> >> @@ -10,6 +10,7 @@
> >>   #include <linux/module.h>
> >>   #include <linux/dma-map-ops.h>
> >>   #include <linux/of.h>
> >> +#include <linux/pci.h>
> >>   #include <linux/pfn.h>
> >>   #include <linux/xarray.h>
> >>   #include <linux/virtio_anchor.h>
> >> @@ -292,12 +293,55 @@ static const struct dma_map_ops xen_grant_dma_ops = {
> >>   	.dma_supported = xen_grant_dma_supported,
> >>   };
> >>   
> >> +static struct device_node *xen_dt_get_pci_host_node(struct device *dev)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(dev);
> >> +	struct pci_bus *bus = pdev->bus;
> >> +
> >> +	/* Walk up to the root bus to look for PCI Host controller */
> >> +	while (!pci_is_root_bus(bus))
> >> +		bus = bus->parent;
> >> +
> >> +	return of_node_get(bus->bridge->parent->of_node);
> >> +}
> > It seems silly that we need to walk the hierachy that way, but I
> > couldn't find another way to do it
> 
> I also couldn't, but is it a really problem? This code is only gets 
> called during initialization.
> 
> 
> >
> >
> >> +static struct device_node *xen_dt_get_node(struct device *dev)
> >> +{
> >> +	if (dev_is_pci(dev))
> >> +		return xen_dt_get_pci_host_node(dev);
> >> +
> >> +	return of_node_get(dev->of_node);
> >> +}
> >> +
> >> +static int xen_dt_map_id(struct device *dev, struct device_node **iommu_np,
> >> +			 u32 *sid)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(dev);
> >> +	u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> >> +	struct device_node *host_np;
> >> +	int ret;
> >> +
> >> +	host_np = xen_dt_get_pci_host_node(dev);
> >> +	if (!host_np)
> >> +		return -ENODEV;
> >> +
> >> +	ret = of_map_id(host_np, rid, "iommu-map", "iommu-map-mask", iommu_np, sid);
> >> +	of_node_put(host_np);
> >> +	return ret;
> >> +}
> >> +
> >>   static bool xen_is_dt_grant_dma_device(struct device *dev)
> >>   {
> >> -	struct device_node *iommu_np;
> >> +	struct device_node *iommu_np = NULL;
> >>   	bool has_iommu;
> >>   
> >> -	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> >> +	if (dev_is_pci(dev)) {
> >> +		if (xen_dt_map_id(dev, &iommu_np, NULL))
> >> +			return false;
> >> +	} else
> >> +		iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> >> +
> >>   	has_iommu = iommu_np &&
> >>   		    of_device_is_compatible(iommu_np, "xen,grant-dma");
> >>   	of_node_put(iommu_np);
> >> @@ -307,9 +351,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
> >>   
> >>   bool xen_is_grant_dma_device(struct device *dev)
> >>   {
> >> +	struct device_node *np;
> >> +
> >>   	/* XXX Handle only DT devices for now */
> >> -	if (dev->of_node)
> >> -		return xen_is_dt_grant_dma_device(dev);
> >> +	np = xen_dt_get_node(dev);
> >> +	if (np) {
> >> +		bool ret;
> >> +
> >> +		ret = xen_is_dt_grant_dma_device(dev);
> >> +		of_node_put(np);
> >> +		return ret;
> >> +	}
> > We don't need to walk the PCI hierachy twice. Maybe we can add the
> > of_node check directly to xen_is_dt_grant_dma_device?
> 
> 
> Good point. I was thinking that we would likely need the following 
> construct is the future:
> 
> 
> if (np) /* DT device */
>     return xen_is_dt_grant_dma_device(dev);
> else /* ACPI device */
>     return xen_is_acpi_grant_dma_device(dev);
> 
> 
> So, if we use the check directly in xen_is_dt_grant_dma_device() and it 
> returns false we won't be able to recognize a reason then
> (whether dev is not related to DT, or it is related to DT but it is not 
> a "xen,grant-dma" device).

That problem can easily be solved by having xen_is_dt_grant_dma_device
return more than 2 possible values. It could return an int for example,
with 3 valid values.


> But, I am ok to eliminate one walk right now, then we will see.
> 
> xen_is_grant_dma_device() will became the following:
> 
> bool xen_is_grant_dma_device(struct device *dev)
> {
>      return xen_is_dt_grant_dma_device(dev);
> }
> 
> xen_is_dt_grant_dma_device() will need to gain a check that dev->of_node 
> is not a NULL.
> 
> 
> Shall I?

--8323329-1494198937-1666210452=:3873--


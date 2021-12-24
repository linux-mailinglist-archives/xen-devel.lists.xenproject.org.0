Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A285347EA66
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 02:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251205.432512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ZkI-0006lP-Jf; Fri, 24 Dec 2021 01:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251205.432512; Fri, 24 Dec 2021 01:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ZkI-0006jf-GF; Fri, 24 Dec 2021 01:51:46 +0000
Received: by outflank-mailman (input) for mailman id 251205;
 Fri, 24 Dec 2021 01:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0ZkH-0006jG-9a
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 01:51:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afc148c-645c-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 02:51:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F75661F9E;
 Fri, 24 Dec 2021 01:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512B0C36AE5;
 Fri, 24 Dec 2021 01:51:41 +0000 (UTC)
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
X-Inumbo-ID: 0afc148c-645c-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640310701;
	bh=+Yuj+jIIU5uavavlXqFjjqLLM2Y8gy6tn41H9Y3xIlk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m0B3GCxmmeYD2b4CD0pnEoZvfJM8sO+RdJiyFpZ2A6Ir6G0W+X3wb8rSBbTYGSPGo
	 KdbSHlK62cLIxtS0ovrBGCoh7KlQ4YoVv60azrJ79+5D91EmpKtbhDUOlPdLrE9xl5
	 hg18PBX0JcirQTJS3f1yRyz0JwKXNAIjE+GU8oYeCD8KdChjf4LNjaSYEoLgxadWBg
	 qW8bkxXk6tQ1I2D+5ZsX+9zUgyqBZhs75UiDtzOC110CDj24eRyrujYd6qQ/7KSWPN
	 9IoGtS65RQZTGaC8dYDo0Qx4bAq8vQXc2AmDLW1bPGGxsqXqyrxmzMurYuI75WKtiD
	 x5zZoa7d6XkHg==
Date: Thu, 23 Dec 2021 17:51:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/1] arm/xen: don't use xen DMA ops when the device is
 protected by an IOMMU
In-Reply-To: <20211222131847.2476835-3-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2112231738550.2060010@ubuntu-linux-20-04-desktop>
References: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com> <20211222131847.2476835-3-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Sergiy Kibrik wrote:
> Only Xen is able to know if a device can safely avoid to use xen-swiotlb.
> However since Xen links FDT nodes of protected devices to special dummy
> xen-iommu node we can use that information to decide whether
> xen-swiotlb is needed.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  arch/arm/mm/dma-mapping.c   | 2 +-
>  arch/arm/xen/enlighten.c    | 9 +++++++++
>  arch/arm64/mm/dma-mapping.c | 2 +-
>  include/xen/swiotlb-xen.h   | 1 +
>  4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index c4b8df2ad328..fc875dd16e0e 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2280,7 +2280,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  	set_dma_ops(dev, dma_ops);
>  
>  #ifdef CONFIG_XEN
> -	if (xen_initial_domain())
> +	if (xen_initial_domain() && !xen_is_protected_device(dev))
>  		dev->dma_ops = &xen_swiotlb_dma_ops;
>  #endif
>  	dev->archdata.dma_ops_setup = true;
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 49f566ad9acb..b36659238db3 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -66,6 +66,15 @@ static __read_mostly unsigned int xen_events_irq;
>  uint32_t xen_start_flags;
>  EXPORT_SYMBOL(xen_start_flags);
>  
> +bool xen_is_protected_device(struct device *dev)
> +{
> +	struct fwnode_handle *fwnode =
> +		fwnode_find_reference(dev_fwnode(dev), "iommus", 0) ;
> +	if (IS_ERR(fwnode))
> +		return false;
> +	return of_device_is_compatible(to_of_node(fwnode), "xen,iommu-el2-v1");
> +}

We need to add a description of the "xen,iommu-el2-v1" compatible node
under Documentation/devicetree/bindings. Maybe it could be added to
Documentation/devicetree/bindings/arm/xen.txt, but it could also be its
own new file.


>  int xen_unmap_domain_gfn_range(struct vm_area_struct *vma,
>  			       int nr, struct page **pages)
>  {
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 93e87b287556..68248e72e052 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  		iommu_setup_dma_ops(dev, dma_base, size);
>  
>  #ifdef CONFIG_XEN
> -	if (xen_initial_domain())
> +	if (xen_initial_domain() && !xen_is_protected_device(dev))
>  		dev->dma_ops = &xen_swiotlb_dma_ops;

This patch needs to be rebased on the latest master. You'll see that now
we have a more sophisticated xen_swiotlb_detect(), instead of the simple
xen_initial_domain() we used to have. Still, xen_swiotlb_detect() is
global, not per device, so I think this change would still apply as is,
resulting in:

if (xen_swiotlb_detect() && !xen_is_protected_device(dev))
    dev->dma_ops = &xen_swiotlb_dma_ops;


>  #endif
>  }
> diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
> index d5eaf9d682b8..00b2782430fb 100644
> --- a/include/xen/swiotlb-xen.h
> +++ b/include/xen/swiotlb-xen.h
> @@ -8,6 +8,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
>  			  size_t size, enum dma_data_direction dir);
>  void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
>  			     size_t size, enum dma_data_direction dir);
> +bool xen_is_protected_device(struct device *dev);
>  
>  extern int xen_swiotlb_init(int verbose, bool early);
>  extern const struct dma_map_ops xen_swiotlb_dma_ops;


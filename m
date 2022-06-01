Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F2539A8C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 02:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340121.565070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCcU-0002iF-Ea; Wed, 01 Jun 2022 00:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340121.565070; Wed, 01 Jun 2022 00:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCcU-0002fE-BS; Wed, 01 Jun 2022 00:53:54 +0000
Received: by outflank-mailman (input) for mailman id 340121;
 Wed, 01 Jun 2022 00:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwCcT-0002f8-BS
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 00:53:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d04c200-e145-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 02:53:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D39666149D;
 Wed,  1 Jun 2022 00:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADDDC385A9;
 Wed,  1 Jun 2022 00:53:48 +0000 (UTC)
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
X-Inumbo-ID: 4d04c200-e145-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654044829;
	bh=EQ7y3MecILqxCm4jEd/aUGty8mqg6Pqf5GSMHZ3CV4A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iT2Hr0gEyj9nwHnMgGrg5ZFexC2dH48t7hzBN1IDF9PAB6qUaRSinConRCTu8BtPE
	 R1tuk/hLs/JgCcKEnZF5j9oLorGTg7DzoDSvFqO/vBKtO/JRHkeam7mqEoA2a+djs4
	 lKbMCzYh91dyRR5NW1X38ykgpdgx6O1b5QyzaXy7k0yyZYx/WtqiKC/ahl+i0FE+8W
	 GtN/07/8TzuFpbJcmZTqbfjai2y1dAUNiTnch5ddRsKJIMmFMqsD4VF61FuxALvEZZ
	 9PkilrXJ03elxU2G0UwJs/nlGnXPscuyIx7TkTVve2azJnESxMwH6ccexp8qW2NAFK
	 tbfL7jOR/49tg==
Date: Tue, 31 May 2022 17:53:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V3 7/8] xen/grant-dma-ops: Retrieve the ID of backend's
 domain for DT devices
In-Reply-To: <1653944417-17168-8-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205311741470.1905099@ubuntu-linux-20-04-desktop>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com> <1653944417-17168-8-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Use the presence of "iommus" property pointed to the IOMMU node with
> recently introduced "xen,grant-dma" compatible as a clear indicator
> of enabling Xen grant mappings scheme for that device and read the ID
> of Xen domain where the corresponding backend is running. The domid
> (domain ID) is used as an argument to the Xen grant mapping APIs.
> 
> To avoid the deferred probe timeout which takes place after reusing
> generic IOMMU device tree bindings (because the IOMMU device never
> becomes available) enable recently introduced stub IOMMU driver by
> selecting XEN_GRANT_DMA_IOMMU.
> 
> Also introduce xen_is_grant_dma_device() to check whether xen-grant
> DMA ops need to be set for a passed device.
> 
> Remove the hardcoded domid 0 in xen_grant_setup_dma_ops().
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes RFC -> V1:
>    - new patch, split required changes from commit:
>     "[PATCH 4/6] virtio: Various updates to xen-virtio DMA ops layer"
>    - update checks in xen_virtio_setup_dma_ops() to only support
>      DT devices for now
>    - remove the "virtio,mmio" check from xen_is_virtio_device()
>    - remane everything according to the new naming scheme:
>      s/virtio/grant_dma
> 
> Changes V1 -> V2:
>    - remove dev_is_pci() check in xen_grant_setup_dma_ops()
>    - remove EXPORT_SYMBOL_GPL(xen_is_grant_dma_device);
> 
> Changes V2 -> V3:
>    - Stefano already gave his Reviewed-by, I dropped it due to the changes (significant)
>    - update commit description
>    - reuse generic IOMMU device tree bindings, select XEN_GRANT_DMA_IOMMU
>      to avoid the deferred probe timeout
> ---
>  drivers/xen/Kconfig         |  1 +
>  drivers/xen/grant-dma-ops.c | 48 ++++++++++++++++++++++++++++++++++++++-------
>  include/xen/xen-ops.h       |  5 +++++
>  3 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 35d20d9..bfd5f4f 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -347,6 +347,7 @@ config XEN_VIRTIO
>  	bool "Xen virtio support"
>  	depends on VIRTIO
>  	select XEN_GRANT_DMA_OPS
> +	select XEN_GRANT_DMA_IOMMU if OF
>  	help
>  	  Enable virtio support for running as Xen guest. Depending on the
>  	  guest type this will require special support on the backend side
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 44659f4..6586152 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -55,11 +55,6 @@ static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
>   * Such a DMA address is formed by using the grant reference as a frame
>   * number and setting the highest address bit (this bit is for the backend
>   * to be able to distinguish it from e.g. a mmio address).
> - *
> - * Note that for now we hard wire dom0 to be the backend domain. In order
> - * to support any domain as backend we'd need to add a way to communicate
> - * the domid of this backend, e.g. via Xenstore, via the PCI-device's
> - * config space or DT/ACPI.
>   */
>  static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>  				 dma_addr_t *dma_handle, gfp_t gfp,
> @@ -275,9 +270,26 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>  	.dma_supported = xen_grant_dma_supported,
>  };
>  
> +bool xen_is_grant_dma_device(struct device *dev)
> +{
> +	struct device_node *iommu_np;
> +	bool has_iommu;
> +
> +	/* XXX Handle only DT devices for now */
> +	if (!dev->of_node)
> +		return false;
> +
> +	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> +	has_iommu = iommu_np && of_device_is_compatible(iommu_np, "xen,grant-dma");
> +	of_node_put(iommu_np);
> +
> +	return has_iommu;
> +}
> +
>  void xen_grant_setup_dma_ops(struct device *dev)
>  {
>  	struct xen_grant_dma_data *data;
> +	struct of_phandle_args iommu_spec;
>  
>  	data = find_xen_grant_dma_data(dev);
>  	if (data) {
> @@ -285,12 +297,34 @@ void xen_grant_setup_dma_ops(struct device *dev)
>  		return;
>  	}
>  
> +	/* XXX ACPI device unsupported for now */
> +	if (!dev->of_node)
> +		goto err;
> +
> +	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> +			0, &iommu_spec)) {
> +		dev_err(dev, "Cannot parse iommus property\n");
> +		goto err;
> +	}
> +
> +	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> +			iommu_spec.args_count != 1) {
> +		dev_err(dev, "Incompatible IOMMU node\n");
> +		of_node_put(iommu_spec.np);
> +		goto err;
> +	}
> +
> +	of_node_put(iommu_spec.np);
> +
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		goto err;
>  
> -	/* XXX The dom0 is hardcoded as the backend domain for now */
> -	data->backend_domid = 0;
> +	/*
> +	 * The endpoint ID here means the ID of the domain where the corresponding
> +	 * backend is running
> +	 */
> +	data->backend_domid = iommu_spec.args[0];
>  
>  	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
>  			GFP_KERNEL))) {
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index 4f9fad5..62be9dc 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -223,10 +223,15 @@ static inline void xen_preemptible_hcall_end(void) { }
>  
>  #ifdef CONFIG_XEN_GRANT_DMA_OPS
>  void xen_grant_setup_dma_ops(struct device *dev);
> +bool xen_is_grant_dma_device(struct device *dev);
>  #else
>  static inline void xen_grant_setup_dma_ops(struct device *dev)
>  {
>  }
> +static inline bool xen_is_grant_dma_device(struct device *dev)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_XEN_GRANT_DMA_OPS */
>  
>  #endif /* INCLUDE_XEN_OPS_H */
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


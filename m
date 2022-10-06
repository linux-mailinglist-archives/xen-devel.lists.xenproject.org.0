Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E45F5F5D9D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 02:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416543.661161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogEbd-00072N-QU; Thu, 06 Oct 2022 00:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416543.661161; Thu, 06 Oct 2022 00:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogEbd-00070N-NF; Thu, 06 Oct 2022 00:19:17 +0000
Received: by outflank-mailman (input) for mailman id 416543;
 Thu, 06 Oct 2022 00:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogEbc-00070H-Fb
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 00:19:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817e3496-450c-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 02:19:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 430E5CE13C6;
 Thu,  6 Oct 2022 00:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A161DC433D6;
 Thu,  6 Oct 2022 00:19:09 +0000 (UTC)
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
X-Inumbo-ID: 817e3496-450c-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665015550;
	bh=gNH9JFMRj4028X6vghjl+A/oKEsjEpj+6Qt/m1foJc4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sjA7iFR0DU+H8mqfrY4QeN/vh/sdujzUR/RI4Ja/fRy1jhEOxTS3JsxSkk/gm56Wg
	 LjOaaSVKwLbUrF0rwmNhrDuxAjRVWVHBPoFhFOy12E4OafGNJZgY3obwPjSQ7exUnb
	 HCJ035iqG1pPJIV/pJPnv1Wq/+6RM/hDsfB3rNcCk48TUU8nQ9bOXWqjqRsfSyJG+0
	 ICf6RpzSXUQvmS6Zg6b7+4Z07Ps08YYM/+i3vfePRwruzuSCN38SR6jSDTQQcSGE4U
	 Q5I+Ht1gsxadn6LZ9BkMJJJuesKzmT3X0FbNTqExf67hXN+7wvRyA+NyAEqYgtsCoj
	 AR/dGeOsNiksA==
Date: Wed, 5 Oct 2022 17:19:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/virtio: Fix potential deadlock when accessing
 xen_grant_dma_devices
In-Reply-To: <20221005174823.1800761-3-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210051719000.3690179@ubuntu-linux-20-04-desktop>
References: <20221005174823.1800761-1-olekstysh@gmail.com> <20221005174823.1800761-3-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Oct 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As find_xen_grant_dma_data() is called from both interrupt and process
> contexts, the access to xen_grant_dma_devices XArray must be protected
> by xa_lock_irqsave to avoid deadlock scenario.
> As XArray API doesn't provide xa_store_irqsave helper, call lockless
> __xa_store directly and guard it externally.
> 
> Also move the storage of the XArray's entry to a separate helper.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory access under Xen")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/grant-dma-ops.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1998d0e8ce82..c66f56d24013 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -25,7 +25,7 @@ struct xen_grant_dma_data {
>  	bool broken;
>  };
>  
> -static DEFINE_XARRAY(xen_grant_dma_devices);
> +static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices, XA_FLAGS_LOCK_IRQ);
>  
>  #define XEN_GRANT_DMA_ADDR_OFF	(1ULL << 63)
>  
> @@ -42,14 +42,29 @@ static inline grant_ref_t dma_to_grant(dma_addr_t dma)
>  static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
>  {
>  	struct xen_grant_dma_data *data;
> +	unsigned long flags;
>  
> -	xa_lock(&xen_grant_dma_devices);
> +	xa_lock_irqsave(&xen_grant_dma_devices, flags);
>  	data = xa_load(&xen_grant_dma_devices, (unsigned long)dev);
> -	xa_unlock(&xen_grant_dma_devices);
> +	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
>  
>  	return data;
>  }
>  
> +static int store_xen_grant_dma_data(struct device *dev,
> +				    struct xen_grant_dma_data *data)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	xa_lock_irqsave(&xen_grant_dma_devices, flags);
> +	ret = xa_err(__xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
> +			GFP_ATOMIC));
> +	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
> +
> +	return ret;
> +}
> +
>  /*
>   * DMA ops for Xen frontends (e.g. virtio).
>   *
> @@ -338,8 +353,7 @@ void xen_grant_setup_dma_ops(struct device *dev)
>  	 */
>  	data->backend_domid = iommu_spec.args[0];
>  
> -	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
> -			GFP_KERNEL))) {
> +	if (store_xen_grant_dma_data(dev, data)) {
>  		dev_err(dev, "Cannot store Xen grant DMA data\n");
>  		goto err;
>  	}
> -- 
> 2.25.1
> 


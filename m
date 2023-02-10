Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A366692B39
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 00:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493686.763684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQct1-0000yi-Tq; Fri, 10 Feb 2023 23:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493686.763684; Fri, 10 Feb 2023 23:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQct1-0000w7-Qe; Fri, 10 Feb 2023 23:32:59 +0000
Received: by outflank-mailman (input) for mailman id 493686;
 Fri, 10 Feb 2023 23:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MSan=6G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQct0-0000w1-Dq
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 23:32:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5e98d6-a99b-11ed-933c-83870f6b2ba8;
 Sat, 11 Feb 2023 00:32:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4628261EB4;
 Fri, 10 Feb 2023 23:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB79C433D2;
 Fri, 10 Feb 2023 23:32:54 +0000 (UTC)
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
X-Inumbo-ID: 3f5e98d6-a99b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676071975;
	bh=viXOvaeCoLP52MV8gaJBodxikjoeBS1XcEbdT3P79ZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IFc1Yh/BULyN7rXPWP8Bc15yRXRRsuJqwPyXLCCJU14Bz3DP6/QdM9qVC1NUNyTTu
	 SzO4cZyepM86ffMRAFoUYAYM/Mu/qpBxBAbYgiLMHeP0PmnZGaVfcbBQnoagQLNY/t
	 qNNd2vBvlXcAi32p6mA5QdttayEyN529liiP98+Uf1Xr9TQOuNScQRVCtMy0tYhdZH
	 OVz+Hl4MtOO33J/Vq2Ni4cxuKJ+qhFFXEjhRx8q7Ic3PqoiXdm/glRznb964kpaY+J
	 pDMdKndLnbTzlID8rIKsqz047ALFqqdNJgXEjPtMLP82xzXXFw+yDKU6tRWT0cQa9/
	 hxx/IH1E7j/xA==
Date: Fri, 10 Feb 2023 15:32:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] xen/grant-dma-iommu: Implement a dummy probe_device()
 callback
In-Reply-To: <20230208153649.3604857-1-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2302101532460.4661@ubuntu-linux-20-04-desktop>
References: <20230208153649.3604857-1-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Feb 2023, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Update stub IOMMU driver (which main purpose is to reuse generic
> IOMMU device-tree bindings by Xen grant DMA-mapping layer on Arm)
> according to the recent changes done in the following
> commit 57365a04c921 ("iommu: Move bus setup to IOMMU device registration").
> 
> With probe_device() callback being called during IOMMU device registration,
> the uninitialized callback just leads to the "kernel NULL pointer
> dereference" issue during boot. Fix that by adding a dummy callback.
> 
> Looks like the release_device() callback is not mandatory to be
> implemented as IOMMU framework makes sure that callback is initialized
> before dereferencing.
> 
> Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/grant-dma-iommu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-iommu.c b/drivers/xen/grant-dma-iommu.c
> index 16b8bc0c0b33..6a9fe02c6bfc 100644
> --- a/drivers/xen/grant-dma-iommu.c
> +++ b/drivers/xen/grant-dma-iommu.c
> @@ -16,8 +16,15 @@ struct grant_dma_iommu_device {
>  	struct iommu_device iommu;
>  };
>  
> -/* Nothing is really needed here */
> -static const struct iommu_ops grant_dma_iommu_ops;
> +static struct iommu_device *grant_dma_iommu_probe_device(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +/* Nothing is really needed here except a dummy probe_device callback */
> +static const struct iommu_ops grant_dma_iommu_ops = {
> +	.probe_device = grant_dma_iommu_probe_device,
> +};
>  
>  static const struct of_device_id grant_dma_iommu_of_match[] = {
>  	{ .compatible = "xen,grant-dma" },
> -- 
> 2.34.1
> 


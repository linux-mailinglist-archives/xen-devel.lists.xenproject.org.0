Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E013A539A68
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 02:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340103.565048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCNg-0007xo-Qh; Wed, 01 Jun 2022 00:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340103.565048; Wed, 01 Jun 2022 00:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCNg-0007vD-NR; Wed, 01 Jun 2022 00:38:36 +0000
Received: by outflank-mailman (input) for mailman id 340103;
 Wed, 01 Jun 2022 00:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwCNe-0007ur-Su
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 00:38:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2932b8cf-e143-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 02:38:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EBE7FCE1902;
 Wed,  1 Jun 2022 00:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C660CC385A9;
 Wed,  1 Jun 2022 00:38:27 +0000 (UTC)
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
X-Inumbo-ID: 2932b8cf-e143-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654043908;
	bh=2Ox7lz8z9nRCuRY+W2ivcqHbD3jf8K4mU3wNbncCJvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ACXErPAVzHV3tUf/6olYKLPTuR5bOIjlhKKUyY3xFc6DSImyxGo37EY6xCnvD9bgw
	 4DM4E4vCLd9QLtYd71Fm48/NYJeeO3fxr3RYtBwZBdZAw1NvXfvLDGSBjRqk1TJg9o
	 ULhrZzG+WwQZXpVQXGUygWPinwY5HeAFfxKwWBc8TSkrAq1iOEM7QeNmt0iYnZcdpf
	 77HGEjp94iX1h/RI/iX9rREkuHalhYGzwGp2nRYo0a93bxi2pNVZJfU3CHiiQBxeKC
	 OMuqFBYwGsevlojee5Bjqd3LRBKuefX41tvKdrqypPorQ2gX65nGe8y/DoyrPYAfDV
	 9AModjdsChDtg==
Date: Tue, 31 May 2022 17:38:26 -0700 (PDT)
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
Subject: Re: [PATCH V3 6/8] xen/grant-dma-iommu: Introduce stub IOMMU
 driver
In-Reply-To: <1653944417-17168-7-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205311738180.1905099@ubuntu-linux-20-04-desktop>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com> <1653944417-17168-7-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In order to reuse generic IOMMU device tree bindings by Xen grant
> DMA-mapping layer we need to add this stub driver from a fw_devlink
> perspective (grant-dma-ops cannot be converted into the proper
> IOMMU driver).
> 
> Otherwise, just reusing IOMMU bindings (without having a corresponding
> driver) leads to the deferred probe timeout afterwards, because
> the IOMMU device never becomes available.
> 
> This stub driver does nothing except registering empty iommu_ops,
> the upper layer "of_iommu" will treat this as NO_IOMMU condition
> and won't return -EPROBE_DEFER.
> 
> As this driver is quite different from the most hardware IOMMU
> implementations and only needed in Xen guests, place it in drivers/xen
> directory. The subsequent commit will make use of it.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> According to the discussion at:
> https://lore.kernel.org/xen-devel/c0f78aab-e723-fe00-a310-9fe52ec75e48@gmail.com/
> 
> Change V2 -> V3:
>    - new patch
> ---
>  drivers/xen/Kconfig           |  4 +++
>  drivers/xen/Makefile          |  1 +
>  drivers/xen/grant-dma-iommu.c | 78 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 drivers/xen/grant-dma-iommu.c
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a7bd8ce..35d20d9 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -335,6 +335,10 @@ config XEN_UNPOPULATED_ALLOC
>  	  having to balloon out RAM regions in order to obtain physical memory
>  	  space to create such mappings.
>  
> +config XEN_GRANT_DMA_IOMMU
> +	bool
> +	select IOMMU_API
> +
>  config XEN_GRANT_DMA_OPS
>  	bool
>  	select DMA_OPS
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index 1a23cb0..c0503f1 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -40,3 +40,4 @@ xen-privcmd-y				:= privcmd.o privcmd-buf.o
>  obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
>  obj-$(CONFIG_XEN_UNPOPULATED_ALLOC)	+= unpopulated-alloc.o
>  obj-$(CONFIG_XEN_GRANT_DMA_OPS)		+= grant-dma-ops.o
> +obj-$(CONFIG_XEN_GRANT_DMA_IOMMU)	+= grant-dma-iommu.o
> diff --git a/drivers/xen/grant-dma-iommu.c b/drivers/xen/grant-dma-iommu.c
> new file mode 100644
> index 00000000..16b8bc0
> --- /dev/null
> +++ b/drivers/xen/grant-dma-iommu.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Stub IOMMU driver which does nothing.
> + * The main purpose of it being present is to reuse generic IOMMU device tree
> + * bindings by Xen grant DMA-mapping layer.
> + *
> + * Copyright (C) 2022 EPAM Systems Inc.
> + */
> +
> +#include <linux/iommu.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +struct grant_dma_iommu_device {
> +	struct device *dev;
> +	struct iommu_device iommu;
> +};
> +
> +/* Nothing is really needed here */
> +static const struct iommu_ops grant_dma_iommu_ops;
> +
> +static const struct of_device_id grant_dma_iommu_of_match[] = {
> +	{ .compatible = "xen,grant-dma" },
> +	{ },
> +};
> +
> +static int grant_dma_iommu_probe(struct platform_device *pdev)
> +{
> +	struct grant_dma_iommu_device *mmu;
> +	int ret;
> +
> +	mmu = devm_kzalloc(&pdev->dev, sizeof(*mmu), GFP_KERNEL);
> +	if (!mmu)
> +		return -ENOMEM;
> +
> +	mmu->dev = &pdev->dev;
> +
> +	ret = iommu_device_register(&mmu->iommu, &grant_dma_iommu_ops, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, mmu);
> +
> +	return 0;
> +}
> +
> +static int grant_dma_iommu_remove(struct platform_device *pdev)
> +{
> +	struct grant_dma_iommu_device *mmu = platform_get_drvdata(pdev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +	iommu_device_unregister(&mmu->iommu);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver grant_dma_iommu_driver = {
> +	.driver = {
> +		.name = "grant-dma-iommu",
> +		.of_match_table = grant_dma_iommu_of_match,
> +	},
> +	.probe = grant_dma_iommu_probe,
> +	.remove = grant_dma_iommu_remove,
> +};
> +
> +static int __init grant_dma_iommu_init(void)
> +{
> +	struct device_node *iommu_np;
> +
> +	iommu_np = of_find_matching_node(NULL, grant_dma_iommu_of_match);
> +	if (!iommu_np)
> +		return 0;
> +
> +	of_node_put(iommu_np);
> +
> +	return platform_driver_register(&grant_dma_iommu_driver);
> +}
> +subsys_initcall(grant_dma_iommu_init);
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1C852287
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 00:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679729.1057366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZfjX-0001TU-9K; Mon, 12 Feb 2024 23:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679729.1057366; Mon, 12 Feb 2024 23:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZfjX-0001Qd-6a; Mon, 12 Feb 2024 23:29:07 +0000
Received: by outflank-mailman (input) for mailman id 679729;
 Mon, 12 Feb 2024 23:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rW7E=JV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rZfjW-0001NL-94
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 23:29:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8277d347-c9fe-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 00:29:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F151A60ECD;
 Mon, 12 Feb 2024 23:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606FCC433F1;
 Mon, 12 Feb 2024 23:29:02 +0000 (UTC)
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
X-Inumbo-ID: 8277d347-c9fe-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707780543;
	bh=OZmWRyAZ96aIiqGUnApBj9/GzU1LECVikVIx9OJtviQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sUhjCLeyJQSC+hYpQL8kqbT2BVhPqwCcgcfsMisIAG+uQqimRkMNRF9PL9cfIRKWh
	 yRUbEFI3XOWQKFB1UR0dJ93ghozW/fXhgrK30ChKeAve0qshx7Wc1y+sXH7Ay3TZnO
	 wkgJg07KcZaPhuYqRXw7wJrwi4jp95t7xecibBbo8B8ZPlhcnJ68jwo9iuOql/9IrY
	 EopbupN+xxGkeFL29wrjUI15kTwGaCaygI4nAdrKVLMaTQVfdOsNmov+B3+ehDu+Im
	 iQIqRFZP5eT+ZBuUJjvfoMHuqhyiGdZ78Uza/0kXjFxS7X1f6EzKp7sLoDlhMyjDst
	 ncPa8BgzLi+mQ==
Date: Mon, 12 Feb 2024 15:29:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Daniil Dulov <d.dulov@aladdin.ru>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, 
    linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] swiotlb-xen: remove redundant NULL check
In-Reply-To: <20240211150958.4112-1-d.dulov@aladdin.ru>
Message-ID: <alpine.DEB.2.22.394.2402121528340.1925432@ubuntu-linux-20-04-desktop>
References: <20240211150958.4112-1-d.dulov@aladdin.ru>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Daniil,

Against which Linux branch was this patch generated?

Cheers,

Stefano


On Sun, 11 Feb 2024, Daniil Dulov wrote:
> In this case hwdev cannot be NULL, so remove redundant NULL check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: b097186fd29d ("swiotlb-xen: SWIOTLB library for Xen PV guest with PCI passthrough.")
> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
> ---
>  drivers/xen/swiotlb-xen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2b385c1b4a99..b166f6efea26 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -305,7 +305,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>  	if (!ret)
>  		return ret;
>  
> -	if (hwdev && hwdev->coherent_dma_mask)
> +	if (hwdev->coherent_dma_mask)
>  		dma_mask = hwdev->coherent_dma_mask;
>  
>  	/* At this point dma_handle is the dma address, next we are
> -- 
> 2.25.1
> 


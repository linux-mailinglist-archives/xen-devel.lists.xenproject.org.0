Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF202AB6016
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 02:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983672.1369903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzlY-0007MU-Rv; Wed, 14 May 2025 00:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983672.1369903; Wed, 14 May 2025 00:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzlY-0007KJ-PC; Wed, 14 May 2025 00:14:32 +0000
Received: by outflank-mailman (input) for mailman id 983672;
 Wed, 14 May 2025 00:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXN3=X6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEzlX-0007KD-Fn
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 00:14:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64cbddb1-3058-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 02:14:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E18A5C3939;
 Wed, 14 May 2025 00:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB457C4CEE4;
 Wed, 14 May 2025 00:14:22 +0000 (UTC)
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
X-Inumbo-ID: 64cbddb1-3058-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747181664;
	bh=jDk0BvPdBOsudd297pGyGFep8goSpk+trsNoQeXfyGQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PqKGWCg8dh3loYFuR0jSEDNpWVH6sczf9s2k3j6fH+99wPEjDU5mG84IBYH5MbgD6
	 bjR2nxsM3pC2s89muWEUGZTb5OpRY+NhJX4YTbeneW+NCPR0lCE+BFYg5zPy8Yv0vs
	 8RLxEJgzLKFwjZ6k9OyVd8HdRr+7o1BoJNcRiFq1GVK8wBC3J5GLJscsFxtzpbNeaR
	 5o7g2Tedq+gTAJ8DP6FhEoyUi8KqEgjQeehOQg9wJepzLb2012iEcqacZ+iTAFaRtW
	 MsXRcMgbsLAI8UZlKD9z2Nytq530gIRICfeorKFZ+sL0L4v+WL7V0rsSewojSI0eoA
	 J4dtDhDgnN/Rw==
Date: Tue, 13 May 2025 17:14:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: John Ernberg <john.ernberg@actia.se>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Christoph Hellwig <hch@infradead.org>, 
    "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] xen: swiotlb: Wire up map_resource callback
In-Reply-To: <20250512071440.3726697-1-john.ernberg@actia.se>
Message-ID: <alpine.DEB.2.22.394.2505131714100.368682@ubuntu-linux-20-04-desktop>
References: <20250512071440.3726697-1-john.ernberg@actia.se>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, John Ernberg wrote:
> When running Xen on iMX8QXP, an Arm SoC without IOMMU, DMA performed via
> its eDMA v3 DMA engine fail with a mapping error.
> 
> The eDMA performs DMA between RAM and MMIO space, and it's the MMIO side
> that cannot be mapped.
> 
> MMIO->RAM DMA access cannot be bounce buffered if it would straddle a page
> boundary and on Xen the MMIO space is 1:1 mapped for Arm, and x86 PV Dom0.
> Cases where MMIO space is not 1:1 mapped, such as x86 PVH Dom0, requires an
> IOMMU present to deal with the mapping.
> 
> Considering the above the map_resource callback can just be wired to the
> existing dma_direct_map_resource() function.
> 
> There is nothing to do for unmap so the unmap callback is not needed.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> v2:
>  - Just use dma_direct_map_resource() directly (Stefano Stabellini)
>  - Incorporate some of the discussion and explanations from v1 into the
>     commit message (Stefano, Christoph)
>  - General English improvements in the commit message.
>  - Just this patch now, 1/2 in the previous set was applied
> 
> v1: (series) https://lore.kernel.org/xen-devel/20250502114043.1968976-1-john.ernberg@actia.se/
> ---
>  drivers/xen/swiotlb-xen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index ef56a2500ed6..da1a7d3d377c 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -426,4 +426,5 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
>  	.alloc_pages_op = dma_common_alloc_pages,
>  	.free_pages = dma_common_free_pages,
>  	.max_mapping_size = swiotlb_max_mapping_size,
> +	.map_resource = dma_direct_map_resource,
>  };
> -- 
> 2.49.0
> 


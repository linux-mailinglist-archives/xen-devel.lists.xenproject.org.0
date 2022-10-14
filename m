Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3325FE647
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 02:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422429.668441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj8Te-0006aC-5o; Fri, 14 Oct 2022 00:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422429.668441; Fri, 14 Oct 2022 00:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj8Te-0006Xb-2u; Fri, 14 Oct 2022 00:23:02 +0000
Received: by outflank-mailman (input) for mailman id 422429;
 Fri, 14 Oct 2022 00:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdf0=2P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oj8Tb-0006XV-OQ
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 00:22:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac83c8f-4b56-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 02:22:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56AA4B8091A;
 Fri, 14 Oct 2022 00:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B50C433C1;
 Fri, 14 Oct 2022 00:22:54 +0000 (UTC)
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
X-Inumbo-ID: 5ac83c8f-4b56-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665706976;
	bh=Ff1BF7LSPAhz412OPTKrZbCVDW8pPmUf/xYI7GplSUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KL9HUHAhlho4iWCQ5qYncwYFT/2xZat5NUswgsVHQQVxcPagVSUnMEBEGHy+9P4uu
	 ZVUnU7aJo5UkQZpigKDqTA16Kqw2vnqT94CMCt/W/vyaLWXRoAAs49JUnRcRqjHS4r
	 KSILW5yCHvZDrZwDVGjWBPB2e6fcmLqdGIVKfQN275W2UXbkVE90gflRDZsUiaGWkB
	 gBPxtQFQZEHwBHBfHiZcUlSerr1KUyPjlaC+6ZRnBjZEchsAKs6saf+V3aMELlvALp
	 quscZDBjqYutrQN2Ufro5uSeVPpcN9H0J9YkXCEu6oVcl3pEZ0K5ApjqOyzZRU2lCv
	 +JIwy6TvJ75hg==
Date: Thu, 13 Oct 2022 17:22:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH V2 1/2] xen/virtio: Handle cases when page offset >
 PAGE_SIZE properly
In-Reply-To: <20221008151013.2537826-2-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210131722080.3690179@ubuntu-linux-20-04-desktop>
References: <20221008151013.2537826-1-olekstysh@gmail.com> <20221008151013.2537826-2-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Oct 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Passed to xen_grant_dma_map_page() offset in the page
> can be > PAGE_SIZE even if the guest uses the same page granularity
> as Xen (4KB).
> 
> Before current patch, if such case happened we ended up providing
> grants for the whole region in xen_grant_dma_map_page() which
> was really unnecessary. The more, we ended up not releasing all
> grants which represented that region in xen_grant_dma_unmap_page().
> 
> Current patch updates the code to be able to deal with such cases.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Changes V1 -> V2:
>    - s/gfn_offset/pfn_offset
>    - clarify gfn calculation when granting a page
> 
> Previous discussion is at:
> https://lore.kernel.org/lkml/20221007132736.2275574-1-olekstysh@gmail.com/
> ---
>  drivers/xen/grant-dma-ops.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c66f56d24013..1d018e3a68a0 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>  					 unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned long dma_offset = offset_in_page(offset),
> +			pfn_offset = PFN_DOWN(offset);
> +	unsigned int i, n_pages = PFN_UP(dma_offset + size);
>  	grant_ref_t grant;
>  	dma_addr_t dma_handle;
>  
> @@ -187,10 +189,11 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>  
>  	for (i = 0; i < n_pages; i++) {
>  		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
> -				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
> +				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
> +				dir == DMA_TO_DEVICE);
>  	}
>  
> -	dma_handle = grant_to_dma(grant) + offset;
> +	dma_handle = grant_to_dma(grant) + dma_offset;
>  
>  	return dma_handle;
>  }
> -- 
> 2.25.1
> 


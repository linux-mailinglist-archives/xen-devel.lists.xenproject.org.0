Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B35FE650
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 02:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422435.668452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj8VZ-00079T-JJ; Fri, 14 Oct 2022 00:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422435.668452; Fri, 14 Oct 2022 00:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj8VZ-00076F-FH; Fri, 14 Oct 2022 00:25:01 +0000
Received: by outflank-mailman (input) for mailman id 422435;
 Fri, 14 Oct 2022 00:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdf0=2P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oj8VX-000769-Rz
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 00:24:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b4554c-4b56-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 02:24:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5074B82178;
 Fri, 14 Oct 2022 00:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB86C433D6;
 Fri, 14 Oct 2022 00:24:54 +0000 (UTC)
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
X-Inumbo-ID: a1b4554c-4b56-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665707095;
	bh=/23VSTNLYqmIWscuKhGhxVVaLvk1lahcvAz0t7UyFSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DOmniJWJR564x1ZOxEyQENlrjEcyVUDUE4aV0qeDC4E7W1NPd4Smk1M72wHSNjNb+
	 zfkmxfm626kykQNeN3zmlDfxc1nn9PYzDBwWDu16GPJDZl3IB23VFZwYiZN+CWMZIs
	 JrnlTrylfmy8u+j0M/2PiOqzwlFjxUjyQanrsOllIXpYGJD1T+pEaHha+8dk+8UToW
	 S87QUA8FlhpS7hgs6aG2joppsT692IGOjONOonPvzcbhLY13BvqeQsQu2Z3AmpDWzF
	 h/R/EXWcjFTgFsBaytsP9t0IsPHU0UgnbHvDTBiuulnrYyOPzRxrQ/G5F0pV6fwD0q
	 UzxkM0aw/O00w==
Date: Thu, 13 Oct 2022 17:24:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH V2 2/2] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP
 to Xen counterparts
In-Reply-To: <20221008151013.2537826-3-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210131724440.3690179@ubuntu-linux-20-04-desktop>
References: <20221008151013.2537826-1-olekstysh@gmail.com> <20221008151013.2537826-3-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Oct 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Currently, a grant ref is always based on the Xen page granularity
> (4KB), and guest commonly uses the same page granularity.
> But the guest may use a different page granularity (i.e 64KB).
> So adopt the code to be able to deal with it.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Changes V1 -> V2:
>    - update commit description
>    - rebase
>    - use xen_offset_in_page() in xen_grant_dma_map(unmap)_page()
> 
> Previous discussion is at:
> https://lore.kernel.org/xen-devel/20221006120912.1948459-1-olekstysh@gmail.com/
> ---
>  drivers/xen/grant-dma-ops.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1d018e3a68a0..aff0f95ed954 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -31,12 +31,12 @@ static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices, XA_FLAGS_LOCK_IRQ);
>  
>  static inline dma_addr_t grant_to_dma(grant_ref_t grant)
>  {
> -	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
> +	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << XEN_PAGE_SHIFT);
>  }
>  
>  static inline grant_ref_t dma_to_grant(dma_addr_t dma)
>  {
> -	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> PAGE_SHIFT);
> +	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> XEN_PAGE_SHIFT);
>  }
>  
>  static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
> @@ -79,7 +79,7 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>  				 unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = XEN_PFN_UP(size);
>  	unsigned long pfn;
>  	grant_ref_t grant;
>  	void *ret;
> @@ -91,14 +91,14 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>  	if (unlikely(data->broken))
>  		return NULL;
>  
> -	ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
> +	ret = alloc_pages_exact(n_pages * XEN_PAGE_SIZE, gfp);
>  	if (!ret)
>  		return NULL;
>  
>  	pfn = virt_to_pfn(ret);
>  
>  	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
> -		free_pages_exact(ret, n_pages * PAGE_SIZE);
> +		free_pages_exact(ret, n_pages * XEN_PAGE_SIZE);
>  		return NULL;
>  	}
>  
> @@ -116,7 +116,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
>  			       dma_addr_t dma_handle, unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = XEN_PFN_UP(size);
>  	grant_ref_t grant;
>  
>  	data = find_xen_grant_dma_data(dev);
> @@ -138,7 +138,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
>  
>  	gnttab_free_grant_reference_seq(grant, n_pages);
>  
> -	free_pages_exact(vaddr, n_pages * PAGE_SIZE);
> +	free_pages_exact(vaddr, n_pages * XEN_PAGE_SIZE);
>  }
>  
>  static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
> @@ -168,9 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>  					 unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned long dma_offset = offset_in_page(offset),
> -			pfn_offset = PFN_DOWN(offset);
> -	unsigned int i, n_pages = PFN_UP(dma_offset + size);
> +	unsigned long dma_offset = xen_offset_in_page(offset),
> +			pfn_offset = XEN_PFN_DOWN(offset);
> +	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
>  	grant_ref_t grant;
>  	dma_addr_t dma_handle;
>  
> @@ -203,8 +203,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>  				     unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned long dma_offset = xen_offset_in_page(dma_handle);
> +	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
>  	grant_ref_t grant;
>  
>  	if (WARN_ON(dir == DMA_NONE))
> -- 
> 2.25.1
> 


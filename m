Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1875F5D85
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 02:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416534.661150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogEQk-0005Y5-Oc; Thu, 06 Oct 2022 00:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416534.661150; Thu, 06 Oct 2022 00:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogEQk-0005VS-L3; Thu, 06 Oct 2022 00:08:02 +0000
Received: by outflank-mailman (input) for mailman id 416534;
 Thu, 06 Oct 2022 00:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogEQi-0005V6-Ml
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 00:08:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed79cec-450a-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 02:07:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57531617F1;
 Thu,  6 Oct 2022 00:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB950C433D6;
 Thu,  6 Oct 2022 00:07:55 +0000 (UTC)
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
X-Inumbo-ID: eed79cec-450a-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665014876;
	bh=EgI5M5TZ7BXqRvIKSX8CVCy28PNbu8v3l83emSft2nY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O4ZbMxFbU6j4RmRFHUi23ZOJvwnBTO1TjieTJErvhUv7V94SIH4cmt/mCkLuw2vMI
	 sL0l6ODgVeWmczm584ssbe6JPJ1Yu9yl6++jLUbVcXHP3S5eplE2u9SpHzmDlbvt9A
	 eY3/0pTHSuSgBv/u3Us4DzIwLKm80l4m/0RydAXZI/UjJKsG81/jqTlzDbz6M4ikXp
	 c4WGSEuLRRCZHaTCe7DCwZ1fd9WVc+MqndCcz4FDM0th3OyLf42l7Whwwjvsv/FR3W
	 oM3SywnqeRJ+/WQYTt40Ki3DFWOT6E1tuCBXfib1jpi2cC38J4AiiGz3NbF44kQgKX
	 o0EF/aJv/Cz0g==
Date: Wed, 5 Oct 2022 17:07:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen/virtio: Fix n_pages calculation in
 xen_grant_dma_map(unmap)_page()
In-Reply-To: <20221005174823.1800761-2-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210051707380.3690179@ubuntu-linux-20-04-desktop>
References: <20221005174823.1800761-1-olekstysh@gmail.com> <20221005174823.1800761-2-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Oct 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Take page offset into the account when calculating the number of pages
> to be granted.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory access under Xen")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/grant-dma-ops.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 8973fc1e9ccc..1998d0e8ce82 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -153,7 +153,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>  					 unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = PFN_UP(offset + size);
>  	grant_ref_t grant;
>  	dma_addr_t dma_handle;
>  
> @@ -185,7 +185,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>  				     unsigned long attrs)
>  {
>  	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
> +	unsigned int i, n_pages = PFN_UP(offset + size);
>  	grant_ref_t grant;
>  
>  	if (WARN_ON(dir == DMA_NONE))
> -- 
> 2.25.1
> 


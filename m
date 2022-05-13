Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71BB525969
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328144.551082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npK9z-0003ti-NL; Fri, 13 May 2022 01:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328144.551082; Fri, 13 May 2022 01:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npK9z-0003sT-JY; Fri, 13 May 2022 01:32:03 +0000
Received: by outflank-mailman (input) for mailman id 328144;
 Fri, 13 May 2022 01:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npK9y-0003sN-2n
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:32:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0b32fa-d25c-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 03:32:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4BB962111;
 Fri, 13 May 2022 01:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD566C385B8;
 Fri, 13 May 2022 01:31:58 +0000 (UTC)
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
X-Inumbo-ID: 7c0b32fa-d25c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652405519;
	bh=qjctFxJKv3PzS7uzlW76cYZ2Kpe6i9eksyNQBmQzjxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CltnUnZO6wz0jn//IYGNbjRZOzX7g3zIXYcWvlZqHxtthBJUAr+banq/01hYoijjp
	 7Ez0+AWThXRb3t92m7BfwU5Ow+FBw6wWo0Mw6gFP3Be0LvMc7l/EUY4uDWpkdO1Izp
	 Fs7O6+3nf+NCvq1fFwc1MRjpViq2gA1wJRwid26sZguxblQQNWQbsOI0ZpEaKJ6Pet
	 cFL03OxYL7kjcZwb3qDFHQG4D+nuu6Py4uNbHIZDK4ZqO31aPLmWylKY3/Aq6QBRID
	 tkHYYjdRcLOXUuCe1eB4qBnluUWtfT+Cks87VyjJbnrJrlp899sYhntxr93v3aGNA6
	 Fa7do414QlbIg==
Date: Thu, 12 May 2022 18:31:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: iommu@lists.linux-foundation.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, Conor.Dooley@microchip.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] swiotlb: don't panic when the swiotlb buffer can't
 be allocated
In-Reply-To: <20220511125805.1377025-2-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2205121831340.3842@ubuntu-linux-20-04-desktop>
References: <20220511125805.1377025-1-hch@lst.de> <20220511125805.1377025-2-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Christoph Hellwig wrote:
> For historical reasons the switlb code paniced when the metadata could
> not be allocated, but just printed a warning when the actual main
> swiotlb buffer could not be allocated.  Restore this somewhat unexpected
> behavior as changing it caused a boot failure on the Microchip RISC-V
> PolarFire SoC Icicle kit.
> 
> Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
> Reported-by: Conor Dooley <Conor.Dooley@microchip.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Conor Dooley <Conor.Dooley@microchip.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  kernel/dma/swiotlb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index e2ef0864eb1e5..3e992a308c8a1 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -254,8 +254,10 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		tlb = memblock_alloc(bytes, PAGE_SIZE);
>  	else
>  		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
> -	if (!tlb)
> -		panic("%s: failed to allocate tlb structure\n", __func__);
> +	if (!tlb) {
> +		pr_warn("%s: failed to allocate tlb structure\n", __func__);
> +		return;
> +	}
>  
>  	if (remap && remap(tlb, nslabs) < 0) {
>  		memblock_free(tlb, PAGE_ALIGN(bytes));
> -- 
> 2.30.2
> 


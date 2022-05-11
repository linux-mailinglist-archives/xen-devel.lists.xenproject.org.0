Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86708523EEA
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327296.550075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noswJ-0003Bn-Ul; Wed, 11 May 2022 20:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327296.550075; Wed, 11 May 2022 20:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noswJ-00039c-Qn; Wed, 11 May 2022 20:28:07 +0000
Received: by outflank-mailman (input) for mailman id 327296;
 Wed, 11 May 2022 20:28:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfEy=VT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1noswI-00039W-Vv
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:28:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcc7e116-d168-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 22:28:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9B3FB82622;
 Wed, 11 May 2022 20:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72760C340EE;
 Wed, 11 May 2022 20:28:02 +0000 (UTC)
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
X-Inumbo-ID: dcc7e116-d168-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652300883;
	bh=aqsoCvtdR+zz0dA1DNGarTzDOHpfs5A6XpKMT8xqPOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pMwK+ZNueI6AJjV7vbGATVbILl14UMy4p+hOg2BNOug+M6rvPrN8UL/yKJOIFKBOx
	 7iFJ/u+2UqawSTsNNa3EK+yZjholM2lT9aiLcR4CDkWYdRf4y60KavdKEuPtLwxyl9
	 uBmcugCkgu4GQ1qENN3t9bIFa+oGEXVlw+sKW6swGMIPUiW3Pv5EqOMKSnjMyl0rqi
	 yAvxH/VvvXY0kptwTzwpHSQrBIM6vArAuow10lsvg8GbWdjq44dEvCgdI19/q3ZIu/
	 i14PdKWE8+jUQ5/nximFi10JHmsflSZBmypI1k/bZkjZplWA2IYwLxqVuFXZdNGNqK
	 ngpYy/Bie6jvg==
Date: Wed, 11 May 2022 13:28:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
In-Reply-To: <20220511141328.GA31939@lst.de>
Message-ID: <alpine.DEB.2.22.394.2205111327530.43560@ubuntu-linux-20-04-desktop>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop> <20220428132737.GA13999@lst.de> <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop> <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com>
 <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop> <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com> <alpine.DEB.2.22.394.2204291615130.1947187@ubuntu-linux-20-04-desktop> <20220511141328.GA31939@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Christoph Hellwig wrote:
> On Fri, Apr 29, 2022 at 04:15:38PM -0700, Stefano Stabellini wrote:
> > Great! Christoph you can go ahead and pick it up in your tree if you are
> > up for it.
> 
> The patch is in the dma-mapping for-next brancch now:
> 
> http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/62cb1ca1654b57589c582efae2748159c74ee356
> 
> There were a few smaller merge conflicts with the swiotlb refactoring.
> I think everything is fine, but please take another look if possible.

Looks good to me


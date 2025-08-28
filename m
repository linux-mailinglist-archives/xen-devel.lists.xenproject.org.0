Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FDB3A706
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099740.1453491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urftX-0001pi-IP; Thu, 28 Aug 2025 16:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099740.1453491; Thu, 28 Aug 2025 16:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urftX-0001nq-Ff; Thu, 28 Aug 2025 16:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1099740;
 Thu, 28 Aug 2025 16:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8r6=3I=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1urftV-0001nk-Lr
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:54:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac117987-842f-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:54:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F66D45196;
 Thu, 28 Aug 2025 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C34C4CEED;
 Thu, 28 Aug 2025 16:54:31 +0000 (UTC)
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
X-Inumbo-ID: ac117987-842f-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756400072;
	bh=3QSqWFwhLXFpgIQB1AhDzeFYEFSsyOykW/t8YMcdvDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Utug3C4qHAngGkUPRUqPcVpMv2skHSOiyTR1dzioCxiyV/N0D3D3xwLMN4kKVhjRg
	 R1e3GaQ66/QDlvAbclIdn1b0xrBO+DODu7rLesJ54dZQOJ+qr4UwXmhZorK6X6L1pe
	 /mKnN3THYo/PX+SSQI5FBBXcz4a8pvxXQG8iBycA9jlkdj9zJMMNMWOCxqVVHcRMG0
	 jrJGkyKqRduB/ujzl45UowCIqtVEnLBTqm/vLH4mWU4+vwRxIYccg9OHedq9aiILZs
	 hmuixBFk7xqznER0ERf4UjMVjXknV66U4Y9wYKKHbgLQRBDuheIDJSUa9AzDEN/7Pr
	 p4K8MwEWQi7/w==
Date: Thu, 28 Aug 2025 19:54:27 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <20250828165427.GB10073@unreal>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLBzeMNT3WOrjprC@kbusch-mbp>

On Thu, Aug 28, 2025 at 09:19:20AM -0600, Keith Busch wrote:
> On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > index 09b99d52fd36..283058bcb5b1 100644
> > --- a/include/linux/blk_types.h
> > +++ b/include/linux/blk_types.h
> > @@ -387,6 +387,7 @@ enum req_flag_bits {
> >  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
> >  	__REQ_ATOMIC,		/* for atomic write operations */
> >  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> > +	__REQ_MMIO,		/* contains MMIO memory */
> >  	/*
> >  	 * Command specific flags, keep last:
> >  	 */
> > @@ -420,6 +421,7 @@ enum req_flag_bits {
> >  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
> >  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
> >  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> > +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
> 
> Now that my integrity metadata DMA series is staged, I don't think we
> can use REQ flags like this because data and metadata may have different
> mapping types. I think we should add a flags field to the dma_iova_state
> instead.

Before integrity metadata code was merged, the assumption was that request is
only one type or p2p or host. Is it still holding now?

And we can't store in dma_iova_state() as HMM/RDMA code works in page-based
granularity and one dma_iova_state() can mix different types.

Thanks

> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C1B3A77E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 19:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099772.1453501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgDi-0005Wc-5x; Thu, 28 Aug 2025 17:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099772.1453501; Thu, 28 Aug 2025 17:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgDi-0005V9-3B; Thu, 28 Aug 2025 17:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1099772;
 Thu, 28 Aug 2025 17:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5LM=3I=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1urgDh-0005V3-2l
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 17:15:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 969d84d5-8432-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 19:15:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECDE644C27;
 Thu, 28 Aug 2025 17:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A72BC4CEF4;
 Thu, 28 Aug 2025 17:15:23 +0000 (UTC)
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
X-Inumbo-ID: 969d84d5-8432-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756401324;
	bh=ou3iD8shgadPVxQRtF41FaHPfXiCub7fMhAggBLVXMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnmNyIm6kveacQ6zFjHwSr/ld+cbNXoqmfCrawHp1gvsXVCDDljqqxTV+b1zApRgH
	 5lcwKbYEv5XvzJ74pZRRlHz4xMMdbU2hypSAtpXWfDMqRVbb/qc2SqQSSCNqbZ1peQ
	 BdR01HGV590kQ600i1NoQpXCyGOYKnHeIsk3mGhcH3PGq+tQybbYkfchgS5mr5H49F
	 IvJGdW2sSi79scStsbkC/ihQucpNHR67O3EvTjBCfBwOnwU2YHvQc3Mh/Yo09lKjUz
	 oioVDuGo8iH8GapTPxpdVPh2h5wOe61XtWreqwSjOT2z6hU8npwTgtY7JSO24epBr/
	 2W6Y4P8WQ/UJw==
Date: Thu, 28 Aug 2025 11:15:20 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
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
Message-ID: <aLCOqIaoaKUEOdeh@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828165427.GB10073@unreal>

On Thu, Aug 28, 2025 at 07:54:27PM +0300, Leon Romanovsky wrote:
> On Thu, Aug 28, 2025 at 09:19:20AM -0600, Keith Busch wrote:
> > On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> > > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > > index 09b99d52fd36..283058bcb5b1 100644
> > > --- a/include/linux/blk_types.h
> > > +++ b/include/linux/blk_types.h
> > > @@ -387,6 +387,7 @@ enum req_flag_bits {
> > >  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
> > >  	__REQ_ATOMIC,		/* for atomic write operations */
> > >  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> > > +	__REQ_MMIO,		/* contains MMIO memory */
> > >  	/*
> > >  	 * Command specific flags, keep last:
> > >  	 */
> > > @@ -420,6 +421,7 @@ enum req_flag_bits {
> > >  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
> > >  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
> > >  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> > > +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
> > 
> > Now that my integrity metadata DMA series is staged, I don't think we
> > can use REQ flags like this because data and metadata may have different
> > mapping types. I think we should add a flags field to the dma_iova_state
> > instead.
> 
> Before integrity metadata code was merged, the assumption was that request is
> only one type or p2p or host. Is it still holding now?

I don't think that was ever the case. Metadata is allocated
independently of the data payload, usually by the kernel in
bio_integrity_prep() just before dispatching the request. The bio may
have a p2p data payload, but the integrity metadata is just a kmalloc
buf in that path.

> And we can't store in dma_iova_state() as HMM/RDMA code works in page-based
> granularity and one dma_iova_state() can mix different types.

I see.


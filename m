Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C0B40FCC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 00:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107567.1457949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZ2X-00050y-TG; Tue, 02 Sep 2025 21:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107567.1457949; Tue, 02 Sep 2025 21:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utZ2X-0004y6-QR; Tue, 02 Sep 2025 21:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1107567;
 Tue, 02 Sep 2025 21:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NCTg=3N=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1utZ2X-0004y0-8W
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 21:59:45 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21192ced-8848-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 23:59:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 55E3F405D0;
 Tue,  2 Sep 2025 21:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15CEC4CEED;
 Tue,  2 Sep 2025 21:59:39 +0000 (UTC)
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
X-Inumbo-ID: 21192ced-8848-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756850381;
	bh=zUOixGI5e23gDVx/zmq/5QWAYGpvZZ1gzj0irhRA2AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/Eu3RveeWFJ7QPQZS0HMJnJ18RJisbVk4Pk4B2mkUogsXCsDnOh5nmkT6QJ4KkpV
	 WAD5v3cszsJls2vJneW0RL/RKpho+ZzAZhFpATDVsn7wwLvJDFu6zSx6RUEKSctSsY
	 MYZrvd5dFbrPEZmkILy8ZxDbNlA6Ej38GRHuRquE0I86IxDtV1kdU0Sm1EDnwtGqEF
	 c1keYzFalxZPfGjORlUbEIAtFrtMdhOixv+lPDaKzXO5a+aOyNEdMKgtKZcG+wqmef
	 IRgJjgP6zlr77O2RCDhrfy6xxK73ZGX0o3JyM4rB09vZuyTewz4+/r6JUDL31Kg2Mp
	 O1zPH9rjxq5Aw==
Date: Tue, 2 Sep 2025 15:59:37 -0600
From: Keith Busch <kbusch@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
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
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
Message-ID: <aLdoyWevrQMQUGyz@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250819173845eucas1p221cd6842839f5e7130f131cd341df566@eucas1p2.samsung.com>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
 <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>

On Tue, Sep 02, 2025 at 10:49:48PM +0200, Marek Szyprowski wrote:
> On 19.08.2025 19:36, Leon Romanovsky wrote:
> > @@ -87,8 +87,8 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
> >   static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
> >   		struct blk_dma_iter *iter, struct phys_vec *vec)
> >   {
> > -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> > -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> > +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> > +			rq_dma_dir(req), 0);
> >   	if (dma_mapping_error(dma_dev, iter->addr)) {
> >   		iter->status = BLK_STS_RESOURCE;
> >   		return false;
> 
> I wonder where is the corresponding dma_unmap_page() call and its change 
> to dma_unmap_phys()...

You can't do that in the generic layer, so it's up to the caller. The
dma addrs that blk_dma_iter yield are used in a caller specific
structure. For example, for NVMe, it goes into an NVMe PRP. The generic
layer doesn't know what that is, so the driver has to provide the
unmapping.


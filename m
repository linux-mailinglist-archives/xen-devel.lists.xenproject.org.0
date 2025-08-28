Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AEB3AC15
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 22:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099964.1453592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urjdu-0002sK-S7; Thu, 28 Aug 2025 20:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099964.1453592; Thu, 28 Aug 2025 20:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urjdu-0002qq-OT; Thu, 28 Aug 2025 20:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1099964;
 Thu, 28 Aug 2025 20:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5LM=3I=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1urjdt-0002qk-I2
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 20:54:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b1279d-8451-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 22:54:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBC0C60139;
 Thu, 28 Aug 2025 20:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF632C4CEEB;
 Thu, 28 Aug 2025 20:54:39 +0000 (UTC)
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
X-Inumbo-ID: 38b1279d-8451-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756414481;
	bh=G+6sPUUIFuKNkRdpDGh7oyzJRLExx6mM3Rr0TsrNav4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCjN9TPmsmkv2CErZmw7eY4jhfo/PPQcCij3sdHoAaturic23UjSbV5/eD841QBrO
	 q5lqa5UXldETsQDMVxoOfW90mr401cd2aNU4qwzO6IO/5MHaurrX5r01OojjZShQEf
	 15Kqtld44h3aDOleBeJLOpcwjkQTTYAEhyrx8SC3goTrfnxyjVjHpigzIsE/EQK5r7
	 FqO3qkArHFFA2cKutZwYB5+zz+dbLtckQEfa3MaBKs+Sg/PNA0jXRALMJBXOlqNLWJ
	 BYklmKx3JSZ1NevsWbUBFS2Jp771ITiW6KubcU3EOHWT7p/JyrZiu2Mj04cW80QHY7
	 3fGPgcRndIPdQ==
Date: Thu, 28 Aug 2025 14:54:35 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <aLDCC4rXcIKF8sRg@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
 <aLCpqI-VQ7KeB6DL@kbusch-mbp>
 <20250828191820.GH7333@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828191820.GH7333@nvidia.com>

On Thu, Aug 28, 2025 at 04:18:20PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 28, 2025 at 01:10:32PM -0600, Keith Busch wrote:
> > 
> > Data and metadata are mapped as separate operations. They're just
> > different parts of one blk-mq request.
> 
> In that case the new bit leon proposes should only be used for the
> unmap of the data pages and the metadata unmap should always be
> unmapped as CPU?

The common path uses host allocated memory to attach integrity metadata,
but that isn't the only path. A user can attach their own metadata with
nvme passthrough or the recent io_uring application metadata, and that
could have been allocated from anywhere.

In truth though, I hadn't tried p2p metadata before today, and it looks
like bio_integrity_map_user() is missing the P2P extraction flags to
make that work. Just added this patch below, now I can set p2p or host
memory independently for data and integrity payloads:

---
diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index 6b077ca937f6b..cf45603e378d5 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -265,6 +265,7 @@ int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
 	unsigned int align = blk_lim_dma_alignment_and_pad(&q->limits);
 	struct page *stack_pages[UIO_FASTIOV], **pages = stack_pages;
 	struct bio_vec stack_vec[UIO_FASTIOV], *bvec = stack_vec;
+	iov_iter_extraction_t extraction_flags = 0;
 	size_t offset, bytes = iter->count;
 	unsigned int nr_bvecs;
 	int ret, nr_vecs;
@@ -286,7 +287,12 @@ int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
 	}
 
 	copy = !iov_iter_is_aligned(iter, align, align);
-	ret = iov_iter_extract_pages(iter, &pages, bytes, nr_vecs, 0, &offset);
+
+	if (blk_queue_pci_p2pdma(q))
+		extraction_flags |= ITER_ALLOW_P2PDMA;
+
+	ret = iov_iter_extract_pages(iter, &pages, bytes, nr_vecs,
+					extraction_flags, &offset);
 	if (unlikely(ret < 0))
 		goto free_bvec;
 
--


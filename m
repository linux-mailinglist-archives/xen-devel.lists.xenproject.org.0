Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAFB3FA5C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105932.1456741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNKW-0006UD-7M; Tue, 02 Sep 2025 09:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105932.1456741; Tue, 02 Sep 2025 09:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNKW-0006RA-43; Tue, 02 Sep 2025 09:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1105932;
 Tue, 02 Sep 2025 09:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uTXE=3N=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1utNKV-0006KE-4T
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:29:31 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52a4557a-87df-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:29:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6678F43E7E;
 Tue,  2 Sep 2025 09:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793FEC4CEED;
 Tue,  2 Sep 2025 09:29:26 +0000 (UTC)
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
X-Inumbo-ID: 52a4557a-87df-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805367;
	bh=DnDVES5Jg8WrIGoMPMfvxV9Wox20mcRcpnotwmcTmTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+YP0LKc7Ca9KSEGyhHI9LWKXOpYxDkmlx+xi/d94i28PXwnbkADYdG/kMj0eiK5B
	 zd/GooYAccyXKqdo2LtN0swNMmhiizGQIgjHrkSZ2IAXK/1jBPSRk3StbcZycbdrVP
	 g5quZtmGQMVEWVOV9clnOLPmMIcFNqak1dVeFhnzWaY1VIAyIlM9TCnw1bUSOb10fT
	 eYPBFQEGyOkOZzS7K5YPtS3dmkawe2LLvJU33SWPAwVjDdMQDDLsS8LD6Qfe4rZdHI
	 wki/IP/V+av0oWZTHcazqMPHDSPlXAIhw9qhWxKa10uhggFEbKZZEF+GYaHO+zcGYb
	 634HFrNZvr1dg==
Date: Tue, 2 Sep 2025 12:29:20 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250902092920.GE10073@unreal>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250828115738eucas1p24f3c17326b318c95a5569a2c9651ff92@eucas1p2.samsung.com>
 <20250828115729.GA10073@unreal>
 <26bd901a-0812-492d-9736-4a7bb2e6d6b4@samsung.com>
 <20250901222302.GA186519@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901222302.GA186519@nvidia.com>

On Mon, Sep 01, 2025 at 07:23:02PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 01, 2025 at 11:47:59PM +0200, Marek Szyprowski wrote:
> > I would like to give those patches a try in linux-next, but in meantime 
> > I tested it on my test farm and found a regression in dma_map_resource() 
> > handling. Namely the dma_map_resource() is no longer possible with size 
> > not aligned to kmalloc()'ed buffer, as dma_direct_map_phys() calls 
> > dma_kmalloc_needs_bounce(),
> 
> Hmm, it's this bit:
> 
> 	capable = dma_capable(dev, dma_addr, size, !(attrs & DMA_ATTR_MMIO));
> 	if (unlikely(!capable) || dma_kmalloc_needs_bounce(dev, size, dir)) {
> 		if (is_swiotlb_active(dev) && !(attrs & DMA_ATTR_MMIO))
> 			return swiotlb_map(dev, phys, size, dir, attrs);
> 
> 		goto err_overflow;
> 	}
> 
> We shouldn't be checking dma_kmalloc_needs_bounce() on mmio as there
> is no cache flushing so the "dma safe alignment" for non-coherent DMA
> does not apply.
> 
> Like you say looks good to me, and more of the surrouding code can be
> pulled in too, no sense in repeating the boolean logic:
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		dma_addr = phys;
> 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
> 			goto err_overflow;
> 	} else {
> 		dma_addr = phys_to_dma(dev, phys);
> 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||

I tried to reuse same code as much as possible :(

> 		    dma_kmalloc_needs_bounce(dev, size, dir)) {
> 			if (is_swiotlb_active(dev))
> 				return swiotlb_map(dev, phys, size, dir, attrs);
> 
> 			goto err_overflow;
> 		}
> 		if (!dev_is_dma_coherent(dev) &&
> 		    !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> 			arch_sync_dma_for_device(phys, size, dir);
> 	}

Like Jason wrote, but in diff format:

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 92dbadcd3b2f..3f4792910604 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -85,7 +85,6 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
                unsigned long attrs)
 {
        dma_addr_t dma_addr;
-       bool capable;

        if (is_swiotlb_force_bounce(dev)) {
                if (attrs & DMA_ATTR_MMIO)
@@ -94,17 +93,19 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
                return swiotlb_map(dev, phys, size, dir, attrs);
        }

-       if (attrs & DMA_ATTR_MMIO)
+       if (attrs & DMA_ATTR_MMIO) {
                dma_addr = phys;
-       else
+               if (unlikely(dma_capable(dev, dma_addr, size, false)))
+                       goto err_overflow;
+       } else {
                dma_addr = phys_to_dma(dev, phys);
+               if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
+                   dma_kmalloc_needs_bounce(dev, size, dir)) {
+                       if (is_swiotlb_active(dev))
+                               return swiotlb_map(dev, phys, size, dir, attrs);

-       capable = dma_capable(dev, dma_addr, size, !(attrs & DMA_ATTR_MMIO));
-       if (unlikely(!capable) || dma_kmalloc_needs_bounce(dev, size, dir)) {
-               if (is_swiotlb_active(dev) && !(attrs & DMA_ATTR_MMIO))
-                       return swiotlb_map(dev, phys, size, dir, attrs);
-
-               goto err_overflow;
+                       goto err_overflow;
+               }
        }

        if (!dev_is_dma_coherent(dev) &&


I created new tag with fixed code.
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/tag/?h=dma-phys-Sep-2

Thanks

> 
> Jason


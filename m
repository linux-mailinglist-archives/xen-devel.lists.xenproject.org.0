Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8829B1A1B3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 14:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069175.1433038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuXY-0008G7-NO; Mon, 04 Aug 2025 12:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069175.1433038; Mon, 04 Aug 2025 12:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuXY-0008F0-Jh; Mon, 04 Aug 2025 12:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1069175;
 Mon, 04 Aug 2025 12:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lO+m=2Q=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uiuXW-0006VD-Il
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:43:42 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60fbd40-7130-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 14:43:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EDCF4423C;
 Mon,  4 Aug 2025 12:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6868C4CEF0;
 Mon,  4 Aug 2025 12:43:38 +0000 (UTC)
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
X-Inumbo-ID: a60fbd40-7130-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311420;
	bh=KuB85oQ1zEvHewxjvaa7TgR+vPeGP91gwiah2Yizc2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwpc/2Lt2D3anuuHX/CywReJ+JevkzY6FynhQNLZcPcidH3a8z4Y3cZmYKqJx40aB
	 HuWBeZEysO6t3oSzFklaWg8fzR58b4rw4vPFNALiUc9A9irWH9TDeW0nOLlTcNMjg5
	 8y75jvY8oofTniAsxP4pz8Mu3KaSfgmilMiaTliZ/mjlKSNBhY+c10mFYtQHZ4AR/7
	 Xmk6xDyL82OWzMQWw/B3tiObakK+I7qRBS7g9Wgz6viepi3WB5CZHiWKKRcEEGPKzI
	 Kj0BbJnhOLGzRPSZ09k5YVjeQRC0y6mBjsRtkaL/iwYbfSRrLhH2F4a0OA4eEyJn4C
	 wZIRnvkij7dkA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 06/16] iommu/dma: extend iommu_dma_*map_phys API to handle MMIO memory
Date: Mon,  4 Aug 2025 15:42:40 +0300
Message-ID: <09c04e0428f422c1b13d2b054af16e719de318a3.1754292567.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754292567.git.leon@kernel.org>
References: <cover.1754292567.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Combine iommu_dma_*map_phys with iommu_dma_*map_resource interfaces in
order to allow single phys_addr_t flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 11c5d5f8c0981..0a19ce50938b3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1193,12 +1193,17 @@ static inline size_t iova_unaligned(struct iova_domain *iovad, phys_addr_t phys,
 dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	bool coherent = dev_is_dma_coherent(dev);
-	int prot = dma_info_to_prot(dir, coherent, attrs);
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	dma_addr_t iova, dma_mask = dma_get_mask(dev);
+	bool coherent;
+	int prot;
+
+	if (attrs & DMA_ATTR_MMIO)
+		return __iommu_dma_map(dev, phys, size,
+				dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+				dma_get_mask(dev));
 
 	/*
 	 * If both the physical buffer start address and size are page aligned,
@@ -1211,6 +1216,9 @@ dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 			return DMA_MAPPING_ERROR;
 	}
 
+	coherent = dev_is_dma_coherent(dev);
+	prot = dma_info_to_prot(dir, coherent, attrs);
+
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		arch_sync_dma_for_device(phys, size, dir);
 
@@ -1223,10 +1231,14 @@ dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 void iommu_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	phys_addr_t phys;
 
-	phys = iommu_iova_to_phys(domain, dma_handle);
+	if (attrs & DMA_ATTR_MMIO) {
+		__iommu_dma_unmap(dev, dma_handle, size);
+		return;
+	}
+
+	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
 	if (WARN_ON(!phys))
 		return;
 
-- 
2.50.1



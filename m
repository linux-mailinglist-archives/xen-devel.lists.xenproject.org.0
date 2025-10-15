Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A8BDDB32
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 11:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143467.1477213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xcK-0008Ax-3X; Wed, 15 Oct 2025 09:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143467.1477213; Wed, 15 Oct 2025 09:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xcJ-0008A7-Uq; Wed, 15 Oct 2025 09:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1143467;
 Wed, 15 Oct 2025 09:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aLBx=4Y=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v8xa5-0002lL-Cu
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 09:14:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4847017d-a9a7-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 11:13:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A99C41ABA;
 Wed, 15 Oct 2025 09:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA70C116D0;
 Wed, 15 Oct 2025 09:13:57 +0000 (UTC)
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
X-Inumbo-ID: 4847017d-a9a7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519638;
	bh=jbBStLIP7sXhH5ASWp90/3Kel7nJYFQjjdng7+NCqnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cYni+pn0hntzXMjiHeAuS5C74xt5skwmhT36I3n+0lgrdCfhhRxdMz4DFq9bbtcE6
	 KyshYgEW2BEQMCguUhfamAui6SDGk97Pwkv6cy20V4cWR1TsHKQXW5pPWPZJB0bROU
	 z4ZKgWbbq79xXqedNuYW1MC9dow455r9BBysavYn2gIaxdDnPgefyKpbQmttDiywRR
	 XVHkKv/NSbuh2sEJWfTis1y15Zck5wSXJQZhSm+nGRhMqLrjGmqENY85tfi+Y0OYZP
	 t5B2ZZLAkMXiTAZ3Qc6jG3RANx5TxKdOkQVsq+nUWiPqAyNSSsDxWgXnNXCMBoBXwP
	 N8uyupiJgjgjg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 14/14] dma-mapping: remove unused map_page callback
Date: Wed, 15 Oct 2025 12:13:00 +0300
Message-ID: <20251015-remove-map-page-v5-14-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

After conversion of arch code to use physical address mapping,
there are no users of .map_page() and .unmap_page() callbacks,
so let's remove them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 -------
 kernel/dma/mapping.c        | 12 ------------
 kernel/dma/ops_helpers.c    |  8 +-------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 2e98ecc313a3..4809204c674c 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -31,13 +31,6 @@ struct dma_map_ops {
 			void *cpu_addr, dma_addr_t dma_addr, size_t size,
 			unsigned long attrs);
 
-	dma_addr_t (*map_page)(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir, unsigned long attrs);
-	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-
 	dma_addr_t (*map_phys)(struct device *dev, phys_addr_t phys,
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 32a85bfdf873..37163eb49f9f 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -171,16 +171,6 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (!is_mmio && ops->map_page) {
-		struct page *page = phys_to_page(phys);
-		size_t offset = offset_in_page(phys);
-
-		/*
-		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory.
-		 */
-		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	}
 
 	if (!is_mmio)
 		kmsan_handle_dma(phys, size, dir);
@@ -222,8 +212,6 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else
-		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
 }
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 1eccbdbc99c1..20caf9cabf69 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -76,11 +76,8 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	if (use_dma_iommu(dev))
 		*dma_handle = iommu_dma_map_phys(dev, phys, size, dir,
 						 DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->map_phys)
-		*dma_handle = ops->map_phys(dev, phys, size, dir,
-					    DMA_ATTR_SKIP_CPU_SYNC);
 	else
-		*dma_handle = ops->map_page(dev, page, 0, size, dir,
+		*dma_handle = ops->map_phys(dev, phys, size, dir,
 					    DMA_ATTR_SKIP_CPU_SYNC);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		dma_free_contiguous(dev, page, size);
@@ -102,8 +99,5 @@ void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, dma_handle, size, dir,
 				DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->unmap_page)
-		ops->unmap_page(dev, dma_handle, size, dir,
-				DMA_ATTR_SKIP_CPU_SYNC);
 	dma_free_contiguous(dev, page, size);
 }

-- 
2.51.0



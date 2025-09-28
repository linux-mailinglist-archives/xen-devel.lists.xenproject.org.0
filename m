Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F768BA73A6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132481.1470831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2syc-0005sx-Ay; Sun, 28 Sep 2025 15:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132481.1470831; Sun, 28 Sep 2025 15:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2syc-0005ra-6e; Sun, 28 Sep 2025 15:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1132481;
 Sun, 28 Sep 2025 15:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2svn-0001Mg-8M
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:03:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42437926-9c7c-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:03:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF484621A8;
 Sun, 28 Sep 2025 15:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1811C116C6;
 Sun, 28 Sep 2025 15:03:13 +0000 (UTC)
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
X-Inumbo-ID: 42437926-9c7c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071794;
	bh=Nw/X8vX+8f0l2pbMmARhDnsF0lUGz2K7mDJQIwz58Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FsaEhpyeGH3xgtFa1Y8w5h7Ts5l82ievUD0lfLRGlqV4tl7HVv9bjHbYliznmCWjs
	 XIswOwbrLhL/lqBZDDpgUGa8gdF4R6bcCbJBPSqa9GRkFwHJMd2nGn9jeZAzizyOfu
	 54DTvGsE/K3wvtVyzMCHvcvGz9R9dmQ3OT+/w0ZCM3FzAhtlqzlY+kCeIKxno1O0Od
	 C1Ih5862x6UMYSCAAaLZ2E1CW3M0tASDzvlC2jUWGNlTgPEIUjab8JpmERGcGq50t3
	 CdD1LnfZcH17lDECmZ4j1WinLIfELZhHuaYwgHhdXOlf+ghx9/qq03uAwI9Cvhcn38
	 JtS6nCcss5SzQ==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Date: Sun, 28 Sep 2025 18:02:29 +0300
Message-ID: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

After conversion of arch code to use physical address mapping,
there are no users of .map_page() and .unmap_page() callbacks,
so let's remove them.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 -------
 kernel/dma/mapping.c        | 12 ------------
 kernel/dma/ops_helpers.c    |  8 +-------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a2ec1566aa27..e0a78991fa8a 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EAB86756
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126438.1468035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdg-0004Sf-OO; Thu, 18 Sep 2025 18:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126438.1468035; Thu, 18 Sep 2025 18:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdg-0004P2-Kd; Thu, 18 Sep 2025 18:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1126438;
 Thu, 18 Sep 2025 18:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzJde-0003Vt-Rq
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:45:50 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1703eb6-94bf-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 20:45:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 441A56020F;
 Thu, 18 Sep 2025 18:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160A2C4CEE7;
 Thu, 18 Sep 2025 18:45:47 +0000 (UTC)
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
X-Inumbo-ID: b1703eb6-94bf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221147;
	bh=cZbejEi6nkNmkzheeCBAGk92h84S9bA1MI/LRocXjWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sNr2edIlUVPpwBqbOV9yBQP1/FOhaJ6YeDv3YF3kmR8I+TMxL1QjnGjSU1FxrbpQ/
	 lQ6VcMvO1t0Fx87meU0SneChvQ6BiwlfAXAVkQw/+mZLpALEBWt/7dbuxqQajOetpg
	 E0UpfldbzcJ5ehVg/st5XBRiSC6U7x11vRJ6y4GDfv5SOH4qS/egi0PrkYatzt2/al
	 IaK4aFx2ASuaQdtIxto4VB/hGINa/kGkbBcnJ0j1gtF3HkRNcWWSOO8gn40Leemglo
	 4dtHyTyMQB3UcRW4eJch2wTwtgCcaQp2MoPH5kDS581Z+XWWHAWeK4xod4u549Jg4N
	 Sqf5FMk/Rnwhw==
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/9] MIPS/jazzdma: Provide physical address directly
Date: Thu, 18 Sep 2025 21:45:02 +0300
Message-ID: <a2e23245b2b6d43c72dd9d994131743b47f6b285.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

MIPS jazz uses physical addresses for mapping pages, so convert
it to get them directly from DMA mapping routine.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/mips/jazz/jazzdma.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index c97b089b99029..45fe71aa454b7 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -521,18 +521,24 @@ static void jazz_dma_free(struct device *dev, size_t size, void *vaddr,
 	__free_pages(virt_to_page(vaddr), get_order(size));
 }
 
-static dma_addr_t jazz_dma_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t jazz_dma_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t phys = page_to_phys(page) + offset;
+	if (attrs & DMA_ATTR_MMIO)
+		/*
+		 * This check is included because older versions of the code lacked
+		 * MMIO path support, and my ability to test this path is limited.
+		 * However, from a software technical standpoint, there is no restriction,
+		 * as the following code operates solely on physical addresses.
+		 */
+		return DMA_MAPPING_ERROR;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		arch_sync_dma_for_device(phys, size, dir);
 	return vdma_alloc(phys, size);
 }
 
-static void jazz_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void jazz_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
@@ -607,8 +613,8 @@ static void jazz_dma_sync_sg_for_cpu(struct device *dev,
 const struct dma_map_ops jazz_dma_ops = {
 	.alloc			= jazz_dma_alloc,
 	.free			= jazz_dma_free,
-	.map_page		= jazz_dma_map_page,
-	.unmap_page		= jazz_dma_unmap_page,
+	.map_phys		= jazz_dma_map_phys,
+	.unmap_phys		= jazz_dma_unmap_phys,
 	.map_sg			= jazz_dma_map_sg,
 	.unmap_sg		= jazz_dma_unmap_sg,
 	.sync_single_for_cpu	= jazz_dma_sync_single_for_cpu,
-- 
2.51.0



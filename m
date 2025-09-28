Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4BCBA730A
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132398.1470751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svI-0001Pt-Og; Sun, 28 Sep 2025 15:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132398.1470751; Sun, 28 Sep 2025 15:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svI-0001Mn-LR; Sun, 28 Sep 2025 15:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1132398;
 Sun, 28 Sep 2025 15:02:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2svH-0001Mh-BN
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:02:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2feeb819-9c7c-11f0-9d14-b5c5bf9af7f9;
 Sun, 28 Sep 2025 17:02:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 58F4545F48;
 Sun, 28 Sep 2025 15:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81470C116B1;
 Sun, 28 Sep 2025 15:02:42 +0000 (UTC)
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
X-Inumbo-ID: 2feeb819-9c7c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071763;
	bh=joV1RJXfMRWLzhpnIVMn+yDni/E+0b2XTKZNLoQGaO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DSOYpsgikSOy8MZ87jPu/KYUDc+l4cdaniO8RKKeI+Ogx+vIbjw3PFXybhxCGiVkL
	 Svbf9LCD/OLSu1+BhYWYUN2NsbU1qvbAJmkVnyM+ehBPWXa1P8Dfsr10VqVfh+CJ3/
	 fK0PydC9i55IUTpcrx/WEa8jZeqt059f7qwZBuoA4bLcGPLmEQkD0cguNeebMBEFKT
	 3RrvQyQn8dehTNH48u0yl6WLA+Tz2ziEbgsKR0IERUfTbFnsVdNo8hdbmtk8QqvVxt
	 7HSong2gEFWSxqgarqeXxYxR/Gye8uoIqVAF8qNmGQXTAkUC6S5UaNNMSjuWnuDC7u
	 prcP+vXzgDPsQ==
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
Subject: [PATCH v1 2/9] MIPS/jazzdma: Provide physical address directly
Date: Sun, 28 Sep 2025 18:02:22 +0300
Message-ID: <f64ece5bdf9dc4c7e9407a5089be68a8c5c011a5.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
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
index c97b089b9902..45fe71aa454b 100644
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



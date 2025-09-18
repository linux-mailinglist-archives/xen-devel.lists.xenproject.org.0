Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF475B86764
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126443.1468046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdm-0004su-4j; Thu, 18 Sep 2025 18:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126443.1468046; Thu, 18 Sep 2025 18:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdl-0004rv-WA; Thu, 18 Sep 2025 18:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1126443;
 Thu, 18 Sep 2025 18:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzJdk-0003Gi-Sj
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:45:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ba0a1e-94bf-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 20:45:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2518444D6;
 Thu, 18 Sep 2025 18:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED33C4CEF1;
 Thu, 18 Sep 2025 18:45:51 +0000 (UTC)
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
X-Inumbo-ID: b4ba0a1e-94bf-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221152;
	bh=t2K4sW07xLmohMbEHNKuCoco8SWkCKi7+Pye3QSpGNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApQAftbQR/jnJU2HzvT/hfBSzMBH8l9oVxYJvIJILBwOkF6XJJC/bSesqHAbmBP6u
	 P4kPqKENM/py7u+cYWOMrhH3+pE/5jyp4qqyE4UDzVb5l/1iNNb4ImC6JoUa2UrQ9g
	 HoDSVJ65VO2VyCLe7wSh33JQyAtAUnbol0LakPZkT5VHxvJDQfwyo07wdmIvS+pi4k
	 JMnu0sgJrSZKHOTVtah/XqsI+nbf7OeODzaRmr6BIlvfuaSaKWkBbjh/9OLnt/fQR+
	 lKPYEZvVCBIvFLx87aT6KZk9bOv12pyvRFyBIive/3aZYoD0fFeZBsrH9oOTiFNFcj
	 4zp+LosB4q3Vw==
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
Subject: [PATCH 6/9] x86: Use physical address for DMA mapping
Date: Thu, 18 Sep 2025 21:45:06 +0300
Message-ID: <d79efd8add2678d883d79aedda68d54add61d3ec.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Perform mechanical conversion from DMA .map_page to .map_phys.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5e..f1ffdc0e4a3ab 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -222,13 +222,14 @@ static dma_addr_t dma_map_area(struct device *dev, dma_addr_t phys_mem,
 }
 
 /* Map a single area into the IOMMU */
-static dma_addr_t gart_map_page(struct device *dev, struct page *page,
-				unsigned long offset, size_t size,
-				enum dma_data_direction dir,
+static dma_addr_t gart_map_phys(struct device *dev, phys_addr_t paddr,
+				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	unsigned long bus;
-	phys_addr_t paddr = page_to_phys(page) + offset;
+
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
 	if (!need_iommu(dev, paddr, size))
 		return paddr;
@@ -242,7 +243,7 @@ static dma_addr_t gart_map_page(struct device *dev, struct page *page,
 /*
  * Free a DMA mapping.
  */
-static void gart_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void gart_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 			    size_t size, enum dma_data_direction dir,
 			    unsigned long attrs)
 {
@@ -282,7 +283,7 @@ static void gart_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 	for_each_sg(sg, s, nents, i) {
 		if (!s->dma_length || !s->length)
 			break;
-		gart_unmap_page(dev, s->dma_address, s->dma_length, dir, 0);
+		gart_unmap_phys(dev, s->dma_address, s->dma_length, dir, 0);
 	}
 }
 
@@ -487,7 +488,7 @@ static void
 gart_free_coherent(struct device *dev, size_t size, void *vaddr,
 		   dma_addr_t dma_addr, unsigned long attrs)
 {
-	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
+	gart_unmap_phys(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
 	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
 }
 
@@ -668,8 +669,8 @@ static __init int init_amd_gatt(struct agp_kern_info *info)
 static const struct dma_map_ops gart_dma_ops = {
 	.map_sg				= gart_map_sg,
 	.unmap_sg			= gart_unmap_sg,
-	.map_page			= gart_map_page,
-	.unmap_page			= gart_unmap_page,
+	.map_phys			= gart_map_phys,
+	.unmap_phys			= gart_unmap_phys,
 	.alloc				= gart_alloc_coherent,
 	.free				= gart_free_coherent,
 	.mmap				= dma_common_mmap,
-- 
2.51.0



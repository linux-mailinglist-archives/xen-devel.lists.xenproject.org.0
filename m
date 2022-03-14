Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374AA4D7BAB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289939.491692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBR-00061z-Va; Mon, 14 Mar 2022 07:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289939.491692; Mon, 14 Mar 2022 07:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBR-0005zK-Oi; Mon, 14 Mar 2022 07:32:01 +0000
Received: by outflank-mailman (input) for mailman id 289939;
 Mon, 14 Mar 2022 07:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BEku=TZ=bombadil.srs.infradead.org=BATV+605a0c0c3369109790a8+6777+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nTfBP-0005vt-RH
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:31:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2d9e783-a368-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 08:31:56 +0100 (CET)
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBB-0044WZ-0Z; Mon, 14 Mar 2022 07:31:45 +0000
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
X-Inumbo-ID: d2d9e783-a368-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fPWsO1iHHAQagtBcoXAydAb96o6DVHP7RWGjrq+6LwY=; b=qwDfXCpOs1g0/zHivF8J3Pa2kj
	TSEGk1jWRMtKhEWhGNTpplhyN3HAXMPj2LczMjlRItqHl2EU4O94m52uTs7+XplZ9Kz3G8NQbVgDe
	8sYKcoI1GNnHZg+/WDfK7cVDrptgMrK0dKcNymVgO1rg5DAYC7x7npVpM/i4b21NILmU5aJ0/my+6
	kyYkMNI5HH4L9WZ2hdaZTVXBgc1A0S2ACtfv5IQXO+1zkiOWQ3JRYYpJ3hCXh6GtWwX4FXtpn++/b
	3fgyxOV7bdJ585bpb0fhRoJk4MsacKntn9Q2zC4rxGGLze7TGvuBGq3nLKTRVjU093NpkROGa7e37
	qjB7pyoQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 04/15] swiotlb: rename swiotlb_late_init_with_default_size
Date: Mon, 14 Mar 2022 08:31:18 +0100
Message-Id: <20220314073129.1862284-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

swiotlb_late_init_with_default_size is an overly verbose name that
doesn't even catch what the function is doing, given that the size is
not just a default but the actual requested size.

Rename it to swiotlb_init_late.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/pci/sta2x11-fixup.c | 2 +-
 include/linux/swiotlb.h      | 2 +-
 kernel/dma/swiotlb.c         | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index 101081ad64b6d..e0c039a75b2db 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_late_init_with_default_size(size))
+		if (swiotlb_init_late(size))
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 9fb3a568f0c51..b48b26bfa0edb 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -40,7 +40,7 @@ extern void swiotlb_init(int verbose);
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-extern int swiotlb_late_init_with_default_size(size_t default_size);
+int swiotlb_init_late(size_t size);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b75943c2a0a0e..14e08fa9621c2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -281,11 +281,9 @@ swiotlb_init(int verbose)
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int
-swiotlb_late_init_with_default_size(size_t default_size)
+int swiotlb_init_late(size_t size)
 {
-	unsigned long nslabs =
-		ALIGN(default_size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
-- 
2.30.2



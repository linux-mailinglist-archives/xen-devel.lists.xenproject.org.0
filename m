Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BD327884
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91295.172543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdGo-0003t3-Go; Mon, 01 Mar 2021 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91295.172543; Mon, 01 Mar 2021 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdGo-0003sM-BK; Mon, 01 Mar 2021 07:47:10 +0000
Received: by outflank-mailman (input) for mailman id 91295;
 Mon, 01 Mar 2021 07:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdGm-0003Px-G6
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:47:08 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 150bf699-19f9-4e2b-9394-11bc25ca000a;
 Mon, 01 Mar 2021 07:46:54 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdGJ-00FRGy-Ot; Mon, 01 Mar 2021 07:46:44 +0000
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
X-Inumbo-ID: 150bf699-19f9-4e2b-9394-11bc25ca000a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EvDfqiSn3rulcjf6po/DEAzkDiYY8dbrnWHudBCB31U=; b=NuEeiEt+jz2nL+G8tqDzAjhDCT
	sk6sMFuu25E/9wU2JOTtwf+LIn3rI3KgAlpoyZOe+7Mx17+VbccT2ZU56rfmAJ587I+611Cv6Eua9
	P05heQ5oMUcxoDbrElSx3XK56ZAjA7Ykza3keQrj7x2FYuE2HaI2HKli9tU4e3LXIpv8p6snIXBJt
	U6oC4aVDBLMcWx4CBS5dL7ZoC00Q0Vb8WtjON8vC6PlFKcqIg2ugdoyrWD9bS7LJoxzsTUJ5t2Ska
	yp+PFgZ3gDWG1NEsIbSXfPb156pc19QFB4tERdHFZHJNeq9oZObZ81KUJSGDAB7JWDe9bxrRiQzY1
	UkjKlPYg==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 14/14] swiotlb: remove swiotlb_nr_tbl
Date: Mon,  1 Mar 2021 08:44:36 +0100
Message-Id: <20210301074436.919889-15-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

All callers just use it to check if swiotlb is active at all, for which
they can just use is_swiotlb_active.  In the longer run drivers need
to stop using is_swiotlb_active as well, but let's do the simple step
first.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 1 -
 kernel/dma/swiotlb.c                         | 7 +------
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ad22f42541bda6..a9d65fc8aa0eab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (swiotlb_nr_tbl()) {
+	if (is_swiotlb_active()) {
 		unsigned int max_segment;
 
 		max_segment = swiotlb_max_segment();
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index a37bc3d7b38b3b..9662522aa0664a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = !!swiotlb_nr_tbl();
+	need_swiotlb = is_swiotlb_active();
 #endif
 
 	ret = ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index c6fe0cfec0f681..a549e822033fd6 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !swiotlb_nr_tbl()) {
+	if (!err && !is_swiotlb_active()) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 63f7a63f61d098..216854a5e5134b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -37,7 +37,6 @@ enum swiotlb_force {
 
 extern void swiotlb_init(int verbose);
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
-extern unsigned long swiotlb_nr_tbl(void);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern int swiotlb_late_init_with_default_size(size_t default_size);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b7bcd7b804bfe8..809d5fdc204675 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -94,12 +94,6 @@ setup_io_tlb_npages(char *str)
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
-unsigned long swiotlb_nr_tbl(void)
-{
-	return io_tlb_default_mem ? io_tlb_default_mem->nslabs : 0;
-}
-EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
-
 unsigned int swiotlb_max_segment(void)
 {
 	return io_tlb_default_mem ? max_segment : 0;
@@ -652,6 +646,7 @@ bool is_swiotlb_active(void)
 {
 	return io_tlb_default_mem != NULL;
 }
+EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.29.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4D340A26
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 17:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99067.188192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvSf-0003L6-70; Thu, 18 Mar 2021 16:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99067.188192; Thu, 18 Mar 2021 16:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvSf-0003Kh-3k; Thu, 18 Mar 2021 16:25:25 +0000
Received: by outflank-mailman (input) for mailman id 99067;
 Thu, 18 Mar 2021 16:25:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YepO=IQ=casper.srs.infradead.org=batv+3da9058682ed8a08391b+6416+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lMvSd-0003Ka-RE
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 16:25:23 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5ae8642-de36-4435-836c-bd10dd68b670;
 Thu, 18 Mar 2021 16:25:22 +0000 (UTC)
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMvRV-003DLG-Ih; Thu, 18 Mar 2021 16:24:22 +0000
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
X-Inumbo-ID: e5ae8642-de36-4435-836c-bd10dd68b670
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9gEP8raZOg3EB9wo1YlmqP5MKZV8/kqbQaScw+YfWuE=; b=JnuhGi9J4kooWrHzFkSJvSQB/f
	H1LyP5FBzoY04johHQs63+EOvbbCIVrj5RI97Wzqrpu5/ANSHEXfUXSSHmdx8qZkrYl0CqZPmQyqD
	gUuOdJ02W96mrTGr0lh+bCwDZO6ub/Uc/WxBzk9LMWBGZefHttJAq4B8N6Oi+F+13iVW8MEutZfAR
	KhQuThABIusZgmw132kdn9enlQGOEPn3Q5pRjO2nNpenvm5KpiptkisJ0z5ZklqDVtXsxC2KvXNFB
	IxMjAONqS2TPXowUqOYB3qGo+qaWd6+I+m/Zd/mrIzgAeF0iNeQFlhB66jMOxkfVk2r8Yaub0v3Mb
	dDfJBBug==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 3/3] swiotlb: remove swiotlb_nr_tbl
Date: Thu, 18 Mar 2021 17:14:24 +0100
Message-Id: <20210318161424.489045-4-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318161424.489045-1-hch@lst.de>
References: <20210318161424.489045-1-hch@lst.de>
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
index 2d75026482197d..b7a8f3a1921f83 100644
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
index 13de669a9b4681..539c76beb52e07 100644
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
2.30.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B878B31489D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83134.154051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQ7-0002lV-EG; Tue, 09 Feb 2021 06:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83134.154051; Tue, 09 Feb 2021 06:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQ7-0002kt-9S; Tue, 09 Feb 2021 06:22:43 +0000
Received: by outflank-mailman (input) for mailman id 83134;
 Tue, 09 Feb 2021 06:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MQ5-0002k8-SD
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:22:41 +0000
Received: from mail-pj1-x1031.google.com (unknown [2607:f8b0:4864:20::1031])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51ad2447-8834-4279-af1e-9195b9f37977;
 Tue, 09 Feb 2021 06:22:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id e9so1049176pjj.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:22:40 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id x14sm20837364pfj.15.2021.02.08.22.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:39 -0800 (PST)
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
X-Inumbo-ID: 51ad2447-8834-4279-af1e-9195b9f37977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KUcKCdqxUtmE3c3/sCLCFX58+aEPLItGYu5wwEcivTc=;
        b=NhEm9T2AwADa9VsvefRZO3hJf81eglORlqEc/M/a8rR0kuSIY5UrlWGbaksqIVirGr
         J6QDJ3CyNkeplzaOrje+vpzgt129yWbwHTzlb+beGZFWZQ8LQ0tH754TJy6h0q3jS8jo
         cGxvFhbRKlBHTIBko/408oiJovV3JTKwJW8QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUcKCdqxUtmE3c3/sCLCFX58+aEPLItGYu5wwEcivTc=;
        b=JZP9wRoKUlJsHxqxeD3m24pjlJBwGjk+Yf3iApErGwFgvXHxqt0KfDuVBbtyxsWDPh
         5S6IvZ2bzu04XotKmisgKVuo2TQp3NGzj3IE4E886vTwKTHPDxnqe2OYFfv9R2wJM67Z
         fWo99QX3OBmVQM5xEfoHNgVhCEe7a0bVucYmiDr2qnvCCclKBdUZPfoZrXAQnaSd/gSz
         vx44tig7Qjc3IzsWTHviJChV2oqisCoPvNtatwO4X3CDdXqZiRycy/GxiFfG2E2ld2rY
         cuwj52LVisqyUN/2Cch+hq7/x9QvaBiQwGbq66x4xm2P9IHFrsYpTvNEpyQ0WwACXgGs
         HxTw==
X-Gm-Message-State: AOAM53259GAGPHUE4DSc5E0T8C0ZTuUPRbojYMohM1DYOAKbxBehZH4n
	WkyVqM+N0baJ2trQTfp2WvF7Zg==
X-Google-Smtp-Source: ABdhPJxTkbyFhURADasjsjB42g8YIEdg4z+Ug1Qla2hS5HdHoxmM0uHRHvdpONYXgEmtPzgr5O1D4Q==
X-Received: by 2002:a17:90a:49c4:: with SMTP id l4mr2647464pjm.33.1612851760260;
        Mon, 08 Feb 2021 22:22:40 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 08/14] swiotlb: Use restricted DMA pool if available
Date: Tue,  9 Feb 2021 14:21:25 +0800
Message-Id: <20210209062131.2300005-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 13 +++++++++++++
 kernel/dma/direct.h     |  2 +-
 kernel/dma/swiotlb.c    | 20 +++++++++++++++++---
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index f13a52a97382..76f86c684524 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -71,6 +71,15 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+bool is_swiotlb_force(struct device *dev);
+#else
+static inline bool is_swiotlb_force(struct device *dev)
+{
+	return unlikely(swiotlb_force == SWIOTLB_FORCE);
+}
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
 bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
@@ -80,6 +89,10 @@ phys_addr_t get_swiotlb_start(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long new_size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
+static inline bool is_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 7b83b1595989..b011db1b625d 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (is_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e22e7ae75f1c..6fdebde8fb1f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -40,6 +40,7 @@
 #include <linux/debugfs.h>
 #endif
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -109,6 +110,10 @@ static struct swiotlb default_swiotlb;
 
 static inline struct swiotlb *get_swiotlb(struct device *dev)
 {
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dev_swiotlb)
+		return dev->dev_swiotlb;
+#endif
 	return &default_swiotlb;
 }
 
@@ -508,7 +513,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, swiotlb->start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
@@ -519,7 +524,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	unsigned long max_slots;
 	unsigned long tmp_io_tlb_used;
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (no_iotlb_memory && !hwdev->dev_swiotlb)
+#else
 	if (no_iotlb_memory)
+#endif
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
 	if (mem_encrypt_active())
@@ -641,7 +650,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, size_t alloc_size,
 			      enum dma_data_direction dir, unsigned long attrs)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
 	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
@@ -689,7 +698,7 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = swiotlb->orig_addr[index];
 
@@ -801,6 +810,11 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+bool is_swiotlb_force(struct device *dev)
+{
+	return unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dev_swiotlb;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.30.0.478.g8a0d178c01-goog



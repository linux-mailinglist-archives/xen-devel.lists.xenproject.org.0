Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2E3A921E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 08:23:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142635.263163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltOxb-0001Nx-Gl; Wed, 16 Jun 2021 06:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142635.263163; Wed, 16 Jun 2021 06:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltOxb-0001L2-DN; Wed, 16 Jun 2021 06:23:35 +0000
Received: by outflank-mailman (input) for mailman id 142635;
 Wed, 16 Jun 2021 06:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR6m=LK=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltOxZ-0007gS-IA
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 06:23:33 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1493b031-134f-4c35-9ab8-397669532dde;
 Wed, 16 Jun 2021 06:23:18 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id i34so1112831pgl.9
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 23:23:18 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id a187sm943813pfb.66.2021.06.15.23.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:23:17 -0700 (PDT)
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
X-Inumbo-ID: 1493b031-134f-4c35-9ab8-397669532dde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4uQkI0iLfUCijuOepwUkiZcSLaj5vr9UchvXk27nRw0=;
        b=i8vpfgPJ9bPz7Z1Al2l+J6+mN/Xl35Xu1XE2A22X8XR/Zq8Z0ZAIZW1TRjKf3ok7nZ
         cVehop1oa/YF7qhuElQsqUmYkYcuOfcjTbNEd4KCXAUWVnRRY2/VoP7cICHlXtOyLHuZ
         HdMm+p5xlQYTdItRv/hg6efoNr1CAhA7jHk00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4uQkI0iLfUCijuOepwUkiZcSLaj5vr9UchvXk27nRw0=;
        b=XIyZkHGMzspX8s4ctM1gXa/pldRiLtTirsrtyVQ7nD65/C5q5ttkWWhoRN2Q39QrYw
         5YGjIPu8VqXDErdzbvtxBwKZ3vjVZh5ICrlbNSNuyFBvQczeikaDgT/t4SBX17YC5Eso
         38VLbka6QbKFHTNwPMkmfyl+w/C5q5V4rtARTTHatX3tLsTpzAtnnd7NDLZj0p6HPm2y
         bMoyityIZJ0kEaKqHROiFzL3uW1Ckk29IPOpIH1hwSjFMcrnuhLBUGK8mi4ZdO6WYrMd
         yBvguoyhxpDjdvc1ikL1Lpxw8h1zfvCu2WzUZHbU/SC15cb5C91jTXMjh+mssQGNprAV
         syZg==
X-Gm-Message-State: AOAM533/Z3fljTm8Zy0UITbWstE/5iKMGwomoY52Yv/2Ru1zZ6EqUNfw
	sn3kQbYaffQDmqJ4cof8IpVB7A==
X-Google-Smtp-Source: ABdhPJzlTcTJITW8roEO1Qs6Oi6y2lI0FUouCTwChc7sW4UDPIgbdbK3IINTmKh9YLKWu+Lc6AZqFA==
X-Received: by 2002:aa7:9118:0:b029:2eb:2ef3:f197 with SMTP id 24-20020aa791180000b02902eb2ef3f197mr7844722pfh.27.1623824597932;
        Tue, 15 Jun 2021 23:23:17 -0700 (PDT)
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
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v12 08/12] swiotlb: Refactor swiotlb_tbl_unmap_single
Date: Wed, 16 Jun 2021 14:21:53 +0800
Message-Id: <20210616062157.953777-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616062157.953777-1-tientzu@chromium.org>
References: <20210616062157.953777-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new function, swiotlb_release_slots, to make the code reusable for
supporting different bounce buffer pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b59e689aa79d..688c6e0c43ff 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -555,27 +555,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	return tlb_addr;
 }
 
-/*
- * tlb_addr is the physical address of the bounce buffer to unmap.
- */
-void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
-			      size_t mapping_size, enum dma_data_direction dir,
-			      unsigned long attrs)
+static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 {
-	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long flags;
-	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
+	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
 	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
 	int count, i;
 
-	/*
-	 * First, sync the memory before unmapping the entry
-	 */
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(hwdev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
-
 	/*
 	 * Return the buffer to the free list by setting the corresponding
 	 * entries to indicate the number of contiguous entries available.
@@ -610,6 +598,23 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
+/*
+ * tlb_addr is the physical address of the bounce buffer to unmap.
+ */
+void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
+			      size_t mapping_size, enum dma_data_direction dir,
+			      unsigned long attrs)
+{
+	/*
+	 * First, sync the memory before unmapping the entry
+	 */
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
+		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+
+	swiotlb_release_slots(dev, tlb_addr);
+}
+
 void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
 		size_t size, enum dma_data_direction dir)
 {
-- 
2.32.0.272.g935e593368-goog



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596573A457C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140481.259595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjA2-00072k-6J; Fri, 11 Jun 2021 15:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140481.259595; Fri, 11 Jun 2021 15:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjA2-000703-1P; Fri, 11 Jun 2021 15:33:30 +0000
Received: by outflank-mailman (input) for mailman id 140481;
 Fri, 11 Jun 2021 15:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj5U-0001UV-KM
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:28:48 +0000
Received: from mail-pf1-x432.google.com (unknown [2607:f8b0:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6d191a7-05e8-4411-9f3f-3305a3a0be42;
 Fri, 11 Jun 2021 15:28:33 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id h12so4737284pfe.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:28:33 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id j12sm5784068pgs.83.2021.06.11.08.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:28:32 -0700 (PDT)
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
X-Inumbo-ID: a6d191a7-05e8-4411-9f3f-3305a3a0be42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIGkdODP5I9MRpEvhkJ7HW1s6uTYZn4rnCzwtz1SAMY=;
        b=lhAYxyf+2EghTuKgem3YKjDes+j3ljet4Ra8WAuPAmfLRQfXVHLYxk9WtJsBCtY28E
         IuaqxaEDW5QIxfOZvX0LKXau3+uxIIgMfu0x386ocAscsOejf4LbnCS7xFpX/SEkViXk
         qWH7bieG65MLRgMm+LFtf2LJCaC8caomnkZGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIGkdODP5I9MRpEvhkJ7HW1s6uTYZn4rnCzwtz1SAMY=;
        b=M3F8dAyAg8vSFRHNNl+VOiTDtz7ZEzW97p+v8XTNd8PJshx6ZtfHWvfTcqkEIN0ZPB
         TUyeNGtKYpLtcx8Lj4+TmmgIU+l/MrJeNPg7+TjMTbR4MopT4zqN6uApZTcVd3Z02Tor
         FLxCMICa4YBCTW8lCvgSNeiNXgQ6ht2jRUsFcybMnpyyBccJOsejvvrjrZvpytqKXCFx
         kX1dl+Dg78kX+V7wArYdQHk9T2LMbeheWlxxjT6JySy7yrw/J9M/TzD5PFv/vErfSOw2
         prfnS//4vSSryUUehJ3eeqyD3ELY8nhvBGZKtCQ/VwZSG+uUVwXc6USH7iG89B1+rbOH
         P7Xw==
X-Gm-Message-State: AOAM532h7PICvbY83sZT2vMywlfU4QZJ12k/Udq3nmYptf9SsVzA3EB7
	zI6XZATxu0mWjKbKdL9VZzAg9w==
X-Google-Smtp-Source: ABdhPJzQPgrFOqie91DIAajE2oiuNE8F7FW4Yfc8mGamEZxew4gLUUvHH/uFdPCPIOoRHfVNxt8tNA==
X-Received: by 2002:a63:571d:: with SMTP id l29mr4136061pgb.179.1623425312945;
        Fri, 11 Jun 2021 08:28:32 -0700 (PDT)
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
Subject: [PATCH v9 09/14] swiotlb: Refactor swiotlb_tbl_unmap_single
Date: Fri, 11 Jun 2021 23:26:54 +0800
Message-Id: <20210611152659.2142983-10-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new function, release_slots, to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 364c6c822063..a6562573f090 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -554,27 +554,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	return tlb_addr;
 }
 
-/*
- * tlb_addr is the physical address of the bounce buffer to unmap.
- */
-void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
-			      size_t mapping_size, enum dma_data_direction dir,
-			      unsigned long attrs)
+static void release_slots(struct device *dev, phys_addr_t tlb_addr)
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
@@ -609,6 +597,23 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
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
+	release_slots(dev, tlb_addr);
+}
+
 void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
 		size_t size, enum dma_data_direction dir)
 {
-- 
2.32.0.272.g935e593368-goog



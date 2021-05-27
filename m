Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDB392EEE
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133275.248506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFg5-0005O6-MB; Thu, 27 May 2021 13:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133275.248506; Thu, 27 May 2021 13:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFg5-0005KW-FJ; Thu, 27 May 2021 13:03:57 +0000
Received: by outflank-mailman (input) for mailman id 133275;
 Thu, 27 May 2021 13:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFd6-0008B4-8f
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:00:52 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7a7143-5b5f-42e2-894b-9d300fe461f9;
 Thu, 27 May 2021 13:00:28 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso372328pji.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:00:28 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id 66sm2009117pgj.9.2021.05.27.06.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:00:22 -0700 (PDT)
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
X-Inumbo-ID: 3e7a7143-5b5f-42e2-894b-9d300fe461f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCZEoBF15DvIVGSc+3j8Uk27721eHnYQC5cQOW6yZk4=;
        b=FaFXCFWJLCD/gigBOGfY4F270yO0Alvb7EMZVKQJ9L8utcEPvn3XtnKI3BEMvmJtEK
         gYgjai80HZHDiRLWnq4ZnWFUPWMggGA/Wo+QuTb4wDh5MX+6KsOXKwWCEnZzHAaiuA3T
         2/Aqi7L4LhIRGkedSPRMYz9qyuKketwP3p78k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCZEoBF15DvIVGSc+3j8Uk27721eHnYQC5cQOW6yZk4=;
        b=Hymu/xwylAU+dLhd+O9BiDQMjPpxNveb59vsOiwP56T+5tcD+nKYgZFr5lSbDVfJPf
         IdTO2YMabxETffgHfuwlNm22391IMroXvxjTWwxo3k77ze4TRdQuEoFrrfK50g3F36CL
         qOvdDpm6792I7MpvAFqwSppiIjKTZz5wp3MgrZVzpXKBmv6SzANGvSrqC/mvHAf/qkpe
         m7nJVYm7Z/nrSTC07uYOEjNoupTQlVGk4XXfdn0lUsoNtWPDfD4tA8yNd/ikZBwqnp7f
         bfLoiFmq4LXW0eRNn+v1nViZ2IwLSvJCNlkAjTY+nPm6XOwSZqiYFM3rbevSQhTV+vuQ
         KMvg==
X-Gm-Message-State: AOAM532vknpBfikTAk0Pz2js6L/vn4mfyr6+IyL2BQKYjg6SLkPO6k8C
	JF1T7KcKIhvbGjdiEw9q9EFF4A==
X-Google-Smtp-Source: ABdhPJyRdfD5aP84oP+O3UZ9D5kP+7R8Jjf69TCVtMPqoqtl6dZXUjZXcnaxnn4OXnc5bmDzFDOgsA==
X-Received: by 2002:a17:90a:74f:: with SMTP id s15mr4091622pje.90.1622120423164;
        Thu, 27 May 2021 06:00:23 -0700 (PDT)
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
Subject: [PATCH v8 10/15] swiotlb: Refactor swiotlb_tbl_unmap_single
Date: Thu, 27 May 2021 20:58:40 +0800
Message-Id: <20210527125845.1852284-11-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new function, release_slots, to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 88b3471ac6a8..c4fc2e444e7a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -550,27 +550,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
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
-	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
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
@@ -605,6 +593,23 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
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
2.31.1.818.g46aad6cb9e-goog



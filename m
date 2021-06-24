Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A83B3320
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146907.270515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRiV-0002Hq-HD; Thu, 24 Jun 2021 15:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146907.270515; Thu, 24 Jun 2021 15:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRiV-0002FN-DZ; Thu, 24 Jun 2021 15:56:35 +0000
Received: by outflank-mailman (input) for mailman id 146907;
 Thu, 24 Jun 2021 15:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRiU-0002ED-9Y
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:56:34 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 688a7c78-e76d-4e48-baed-983584c8d738;
 Thu, 24 Jun 2021 15:56:33 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 bv7-20020a17090af187b029016fb18e04cfso5696842pjb.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:56:33 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id 10sm3356835pfh.174.2021.06.24.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:56:32 -0700 (PDT)
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
X-Inumbo-ID: 688a7c78-e76d-4e48-baed-983584c8d738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vWWa68OFQeb7FNC92AYjUweQlraoAtZ2qywuTutOPN8=;
        b=VXwSpljaHyT9CGsX566zaWUYjLWqT6EZGvW+HUV35ZUKMCtL+5WOxJcFRf4L1/7RFc
         qGeV6pbn94x/vW7fLhV34a5kH7V7Jg+oyk1mVqp0p88iltTd6zaG8ZqWhoFwX03BHlru
         OGskxuzkvEXUDLIs9WCRDc/Gg2nJw/vs7F2Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vWWa68OFQeb7FNC92AYjUweQlraoAtZ2qywuTutOPN8=;
        b=IwX7ih9KwTOqoXEaN6RWN9KkP8r9hI/xCNl+/zh0iSwoxSmWmsmIXycBPw4tN7jMrk
         czQReVDm+JmeQ/aa3z7U75tR7sWfkgykHte82CrF7BcSacPw9c7mhrCMTwKbhhI3X+bp
         3mLkXXLt2+qpybYDoXwbAAAgPfR6rp4dgQOOWk0siB4FN3PWruM67UY/XIMfocnLG41m
         NGIl0dVf9UU/kNIxVWFs220s6Ek6LLH1ANi6++UYaAzYDr93DI0zcrHryR4w4+49ksT3
         /ouWothH0Xltm3dKBMsuspUh/WWOTlzDSXzYYk+0GI9jPTzx6yCvO36FFdL4DHjpGSWA
         br7Q==
X-Gm-Message-State: AOAM530qdD4qAdXau9Ra4bENTmjRTgsFvSeLuneMij1sHeKmdJ8SrDj4
	gqbzn2yFJyzZ5GQ9MQ18641Kfg==
X-Google-Smtp-Source: ABdhPJyM3ZtD9p071nGaZ41yrN00ryvbfXJ3YxQAdjvfE9uJr/thaI9NsyuGT18oKxVn0E9uAB208g==
X-Received: by 2002:a17:90a:db8a:: with SMTP id h10mr16188658pjv.50.1624550192680;
        Thu, 24 Jun 2021 08:56:32 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing
Date: Thu, 24 Jun 2021 23:55:20 +0800
Message-Id: <20210624155526.2775863-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
use it to determine whether to bounce the data or not. This will be
useful later to allow for different pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/swiotlb-xen.c |  2 +-
 include/linux/swiotlb.h   | 13 +++++++++++++
 kernel/dma/direct.c       |  2 +-
 kernel/dma/direct.h       |  2 +-
 kernel/dma/swiotlb.c      |  4 ++++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 0c6ed09f8513..4730a146fa35 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -369,7 +369,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	if (dma_capable(dev, dev_addr, size, true) &&
 	    !range_straddles_page_boundary(phys, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
-		swiotlb_force != SWIOTLB_FORCE)
+		!is_swiotlb_force_bounce(dev))
 		goto done;
 
 	/*
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index dd1c30a83058..da348671b0d5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -84,6 +84,7 @@ extern enum swiotlb_force swiotlb_force;
  *		unmap calls.
  * @debugfs:	The dentry to debugfs.
  * @late_alloc:	%true if allocated using the page allocator
+ * @force_bounce: %true if swiotlb bouncing is forced
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -94,6 +95,7 @@ struct io_tlb_mem {
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	bool force_bounce;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -109,6 +111,13 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+	return mem && mem->force_bounce;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -120,6 +129,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	return false;
+}
 static inline void swiotlb_exit(void)
 {
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a88c34d0867..a92465b4eb12 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || is_swiotlb_force_bounce(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..4632b0f4f72e 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (is_swiotlb_force_bounce(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8a120f42340b..0d294bbf274c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -179,6 +179,10 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+
+	if (swiotlb_force == SWIOTLB_FORCE)
+		mem->force_bounce = true;
+
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
-- 
2.32.0.288.g62a8d224e6-goog



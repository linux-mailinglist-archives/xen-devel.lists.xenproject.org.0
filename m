Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAED3A457A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140476.259584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj9x-0006aP-Rc; Fri, 11 Jun 2021 15:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140476.259584; Fri, 11 Jun 2021 15:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj9x-0006Wl-MR; Fri, 11 Jun 2021 15:33:25 +0000
Received: by outflank-mailman (input) for mailman id 140476;
 Fri, 11 Jun 2021 15:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj5t-0001UV-LA
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:29:13 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe381c5a-0df4-4c6a-8657-b67434233f7b;
 Fri, 11 Jun 2021 15:28:51 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id ei4so5887851pjb.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:28:51 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id p11sm3312697pjj.43.2021.06.11.08.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:28:49 -0700 (PDT)
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
X-Inumbo-ID: fe381c5a-0df4-4c6a-8657-b67434233f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kF6lfFlm47ewlGSwNHdOa0bRh+k/2w/JyGCG+Bsk7jg=;
        b=H/C67oW7mc9oS6nqFrlyQ5bKo2M4IEytOonNmobjWozjPKJmD5foT/Xw7AFSNzd2Jo
         0wjSUN2RW/ppa8UiQ09kGN695gbXZ6TGfgjGghWkAaCeHdylaYggXNn7A87sM831TjH9
         l31C3Fl2eMIXd/0uX15rNLpBd42Axwn6s/C8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kF6lfFlm47ewlGSwNHdOa0bRh+k/2w/JyGCG+Bsk7jg=;
        b=YD03UHNz3zMhFquW0h1nVYYD+4Cg2oUn2bsAlDtJZeLe2QDxnporCS40LkyVInGJCH
         8WssS2lbL34EDli0srSKHz9iSUZPTop2tTYXz00Pk44rdq4RUxRKiBCsxtWc4A77Hujr
         lLqCSaHnNIeTVlDNdFJnQEXnhJx1VChtQupeILb1sK8wwitvw0LAEllk6SPQLJTHJe9i
         pQfLYpILjFC/147dJpYKfUBUwCoPZ11p/tfVYffLgLOHxPCRktSdNS7dKGo/1V5RIKqE
         KuljBxXpeUTUPqg1FZ3JojowrYxBwB6PV3s1urbgLiNbvcGVjZC40sJLzlGW3HlP6Nix
         BWfQ==
X-Gm-Message-State: AOAM532zuARjH8LK1hqKd2zQbSOTzuCVhoWihlBosmWPt6D25lHKaBya
	uACdzU7eTKJlsjTDArZGRQghxA==
X-Google-Smtp-Source: ABdhPJwmTa5xH/d7onV720jkujld6c+EE1EDx86RTuZajd94EHAxdcF++t/hrsHfq11H6lXLYCr71w==
X-Received: by 2002:a17:902:d4d0:b029:113:fb3d:3644 with SMTP id o16-20020a170902d4d0b0290113fb3d3644mr4373020plg.58.1623425330334;
        Fri, 11 Jun 2021 08:28:50 -0700 (PDT)
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
Subject: [PATCH v9 11/14] swiotlb: Add restricted DMA alloc/free support.
Date: Fri, 11 Jun 2021 23:26:56 +0800
Message-Id: <20210611152659.2142983-12-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the functions, swiotlb_{alloc,free} to support the memory allocation
from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 15 +++++++++++++++
 kernel/dma/swiotlb.c    | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 8200c100fe10..d3374497a4f8 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -162,4 +162,19 @@ static inline void swiotlb_adjust_size(unsigned long size)
 extern void swiotlb_print_info(void);
 extern void swiotlb_set_max_segment(unsigned int);
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size);
+bool swiotlb_free(struct device *dev, struct page *page, size_t size);
+#else
+static inline struct page *swiotlb_alloc(struct device *dev, size_t size)
+{
+	return NULL;
+}
+static inline bool swiotlb_free(struct device *dev, struct page *page,
+				size_t size)
+{
+	return false;
+}
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
 #endif /* __LINUX_SWIOTLB_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a6562573f090..0a19858da5b8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -461,8 +461,9 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 
 	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
 	do {
-		if ((slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
-		    (orig_addr & iotlb_align_mask)) {
+		if (orig_addr &&
+		    (slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
+			    (orig_addr & iotlb_align_mask)) {
 			index = wrap_index(mem, index + 1);
 			continue;
 		}
@@ -702,6 +703,36 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	phys_addr_t tlb_addr;
+	int index;
+
+	if (!mem)
+		return NULL;
+
+	index = find_slots(dev, 0, size);
+	if (index == -1)
+		return NULL;
+
+	tlb_addr = slot_addr(mem->start, index);
+
+	return pfn_to_page(PFN_DOWN(tlb_addr));
+}
+
+bool swiotlb_free(struct device *dev, struct page *page, size_t size)
+{
+	phys_addr_t tlb_addr = page_to_phys(page);
+
+	if (!is_swiotlb_buffer(dev, tlb_addr))
+		return false;
+
+	release_slots(dev, tlb_addr);
+
+	return true;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.32.0.272.g935e593368-goog



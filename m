Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC5392EED
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133276.248510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFg5-0005Qv-VD; Thu, 27 May 2021 13:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133276.248510; Thu, 27 May 2021 13:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFg5-0005Nx-Os; Thu, 27 May 2021 13:03:57 +0000
Received: by outflank-mailman (input) for mailman id 133276;
 Thu, 27 May 2021 13:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFg3-0005ED-M5
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:03:55 +0000
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d859fc2-d424-4032-9379-b632696215ba;
 Thu, 27 May 2021 13:03:54 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y15so501191pfn.13
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:03:54 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id p11sm2096443pjo.19.2021.05.27.06.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:03:53 -0700 (PDT)
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
X-Inumbo-ID: 9d859fc2-d424-4032-9379-b632696215ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hq3dk3sdVo1Aiyz3oEGqQdxJF9bgRO7on7tVtGrwREA=;
        b=Fc1gvJ3n84xz3JxOO0N55rsBPx0BRwCnJqQGnPap/zK0pI1U/L+kL/kcQzWLQ84Riq
         0j/pqlcmWQYQydyVIRDN+PwShThBXOPgJ9Tt5RavIwKiqavfO6y+wHM9/KEWCh+zM9+b
         bTIS7XzvK0G3Tb5c5LYB9BTAV5sVenH8dr8s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hq3dk3sdVo1Aiyz3oEGqQdxJF9bgRO7on7tVtGrwREA=;
        b=ngM91AlHPnHI/iOLRJuXQwOGKwaMHxcQ0RwhuHPdzSDfIuevYl+BNhaGsLJZ5twjE3
         tquxy9Xf7+h1ZU9gTC7X7uM7l/ydwc0KTzVzH71ylA9/9T6Fbd4kgp/C1UHykPGSLaeR
         1I7eYeDsszYkj1nXuMp6Df/BOtabYHLZ9ujIbEO+d/qCnyT6ykE+yYaMRKdI9+2iMkj9
         bP2VXqVyG2QAVcE1PuQcr2+zhTwOkBRR2CNxlGwqxRpLIShe9FCM91jjjXlICSGXztiB
         9/EvxZUcinypythNkzhe8/LgFQ6A8HKBIWJD6DhDVIfmS5LvppXz0VcxADF2AAlpgAwq
         HoNw==
X-Gm-Message-State: AOAM530gLDlR9WPiBEctR6+AfIhJvHNC2Ga7lxPzALqXPa1O6J5vEdfd
	l/iwwIRaWjbg5HhAWVLLBPKgrw==
X-Google-Smtp-Source: ABdhPJwek6kyZnVLp6SkoYltLcwOXMIMY+AUL7OjyvyvB2fw/uVSfHyOeaCWcshB7EYERK97204FCg==
X-Received: by 2002:aa7:8588:0:b029:28e:dfa1:e31a with SMTP id w8-20020aa785880000b029028edfa1e31amr3587263pfn.77.1622120633858;
        Thu, 27 May 2021 06:03:53 -0700 (PDT)
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
Subject: [PATCH v8 12/15] swiotlb: Add restricted DMA alloc/free support.
Date: Thu, 27 May 2021 21:03:26 +0800
Message-Id: <20210527130329.1853588-2-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527130329.1853588-1-tientzu@chromium.org>
References: <20210527130329.1853588-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the functions, swiotlb_{alloc,free} to support the memory allocation
from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |  4 ++++
 kernel/dma/swiotlb.c    | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0c5a18d9cf89..e8cf49bd90c5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -134,6 +134,10 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size);
+bool swiotlb_free(struct device *dev, struct page *page, size_t size);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c4fc2e444e7a..648bfdde4b0c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -457,8 +457,9 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 
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
@@ -704,6 +705,36 @@ late_initcall(swiotlb_create_default_debugfs);
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
2.31.1.818.g46aad6cb9e-goog



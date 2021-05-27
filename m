Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA89392EE0
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133270.248479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFft-0004HL-Q8; Thu, 27 May 2021 13:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133270.248479; Thu, 27 May 2021 13:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFft-0004Es-Js; Thu, 27 May 2021 13:03:45 +0000
Received: by outflank-mailman (input) for mailman id 133270;
 Thu, 27 May 2021 13:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFcm-0008B4-83
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:00:32 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aa84d79-370f-4126-b495-7b1f156bc2f5;
 Thu, 27 May 2021 13:00:06 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h12so2284627plf.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:00:06 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id m1sm2027143pgd.78.2021.05.27.05.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:00:04 -0700 (PDT)
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
X-Inumbo-ID: 6aa84d79-370f-4126-b495-7b1f156bc2f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B7RrpH6OgXx/lTZyexKL+IWeAI7yB0yfCFBVtG2zWbw=;
        b=kcN4x88wnIqA2eddyBkI1s+5ccQseApdZLb8/RSr2+Fa520MxJZZ6NkX9r/ML2uBrj
         kvMXO+zNUanE1yYV9wWE+HheUK89EpCu8v6POAAGHEkAn5qXZCd1I7/7KAUnWJ2R0GFj
         AiEWOWj6q+T+/qXKxk0sPdE2cDhBD8s6mX/Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7RrpH6OgXx/lTZyexKL+IWeAI7yB0yfCFBVtG2zWbw=;
        b=IhNRDs/J/nyPwygPZYYin9Zlz7QIGL7OKgwZcl597P5oMDKg8C9Oh0yqOax3muZiSO
         PQJqR5eKjl2P9CqR+nqHjT/zAaDugC7rCwqm69C3Cq15dYIjP4lzcXZ/aCGzSpWrm0Jm
         iu8ZOMqjMfRy02CAebU8MF79nvUOr5kFimvYpJh17neAASzPcwzB7sKIhk7p8gRBmS9P
         h28L0Q+nkqXSH6zm1WvpaDGSr9x0IoFZmMSlU2aISEGuJqmTKWMr1hePx4h+qb2dtCzK
         1CbT0wGkk/L6LXIkzrtCbtPq/uljbPaBmxAikRx0Raa8twkGMBZ09KalAYOcMm2RLH/7
         TuNw==
X-Gm-Message-State: AOAM532wH1wFTuHWcQosFXfATnWBhNXzuS/hy4rLK7oeY943tPqkvrW0
	T/4DmVa8yb+La0CBV67/pTD9CQ==
X-Google-Smtp-Source: ABdhPJx/S80brWa6yq+WbXDwFafH2VwKxtCuF8GRMQTIN21BHKQJi5x8f1RJPDSguTNDbXCIi1shzA==
X-Received: by 2002:a17:90b:33d1:: with SMTP id lk17mr3678617pjb.154.1622120405435;
        Thu, 27 May 2021 06:00:05 -0700 (PDT)
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
Subject: [PATCH v8 08/15] swiotlb: Bounce data from/to restricted DMA pool if available
Date: Thu, 27 May 2021 20:58:38 +0800
Message-Id: <20210527125845.1852284-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Note that is_dev_swiotlb_force doesn't check if
swiotlb_force == SWIOTLB_FORCE. Otherwise the memory allocation behavior
with default swiotlb will be changed by the following patche
("dma-direct: Allocate memory from restricted DMA pool if available").

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 13 +++++++++++++
 kernel/dma/direct.c     |  3 ++-
 kernel/dma/direct.h     |  3 ++-
 kernel/dma/swiotlb.c    |  8 ++++----
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index c530c976d18b..0c5a18d9cf89 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -120,6 +120,15 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev->dma_io_tlb_mem)
+		return true;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+	return false;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -131,6 +140,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline void swiotlb_exit(void)
 {
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a88c34d0867..078f7087e466 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,8 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE ||
+	     is_dev_swiotlb_force(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..f94813674e23 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,8 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (unlikely(swiotlb_force == SWIOTLB_FORCE) ||
+	    is_dev_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b2b6503ecd88..fa7f23fffc81 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -347,7 +347,7 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 			   enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
@@ -429,7 +429,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -506,7 +506,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int i;
 	int index;
@@ -557,7 +557,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
-- 
2.31.1.818.g46aad6cb9e-goog



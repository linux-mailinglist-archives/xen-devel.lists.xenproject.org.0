Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA953A7FF8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142069.262289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9AU-0004GR-4M; Tue, 15 Jun 2021 13:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142069.262289; Tue, 15 Jun 2021 13:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9AT-0004AN-U9; Tue, 15 Jun 2021 13:31:49 +0000
Received: by outflank-mailman (input) for mailman id 142069;
 Tue, 15 Jun 2021 13:31:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62sT=LJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lt97V-0000bS-NN
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:28:45 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25319a37-1ef3-495c-9766-927262ffd713;
 Tue, 15 Jun 2021 13:28:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so1812886pjn.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 06:28:15 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:1846:5274:e444:139e])
 by smtp.gmail.com with UTF8SMTPSA id q145sm8796577pfc.60.2021.06.15.06.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:28:14 -0700 (PDT)
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
X-Inumbo-ID: 25319a37-1ef3-495c-9766-927262ffd713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gECPOPsCtEK5Wckt8RcLyHfozwB/E+EP94LARsjIoQM=;
        b=mPVHkLymWWoJ5FXza4lDdJkjRkkGCCIqZROcG/jPVhk85ennw8Lh8afIhfaPbKo5fw
         xPoOamL8LmyrImoT77PgcPoa1udPeAWbdwayu1G1kJioGMIeK2BCidzwj4454R/AYVbe
         p31PisuhVJxV7c4fEx4O7jr/Zump68KiUpmW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gECPOPsCtEK5Wckt8RcLyHfozwB/E+EP94LARsjIoQM=;
        b=cgSM6pAXJP2WI/Hg9W/3vFgYn0Q8YYU/yM9jzNcZJ5wFyjFdXAtjP1wu3d0mvl8lxm
         67uOacaMKxMAYHSoVTdkE66t573TZhNMJFPskfFFJdPnhRMEwJ/ayT1OjfKnNlweiNt/
         jSBq6dlcISGbz6RUsXiG78sgNxtd33gJnV3IkzT4UWaO1yOXPrY8bfFgdErHE0rN2zTp
         EuwJ5hya4h9z/lJ3VpA/7oVojC/THYRxIayZRzEElIhOgFrRlzbkOSpBwk/QNwzE2eJg
         aXSHNbEl/LS3/qf/X5u2yDO+6LX32a4lviSWsXl3bRvA9JdeohbNDV/tB/me/1pSmFEv
         H1HA==
X-Gm-Message-State: AOAM530x8lTPr65eOAlxI42Q6LEHv0L3xnlr7wxD8F+4LnQkkMOozP3a
	kXx/qynynNPrsg3aGrSbGUGdWA==
X-Google-Smtp-Source: ABdhPJwap5O4zLmEMY+RUjCuo1vguR5XAd/2u88H1tpc55JUzosxwbsWkllIYJMBsZxK3z6SxqvnHg==
X-Received: by 2002:a17:90a:fe18:: with SMTP id ck24mr5167618pjb.158.1623763695284;
        Tue, 15 Jun 2021 06:28:15 -0700 (PDT)
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
Subject: [PATCH v10 06/12] swiotlb: Use is_dev_swiotlb_force for swiotlb data bouncing
Date: Tue, 15 Jun 2021 21:27:05 +0800
Message-Id: <20210615132711.553451-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210615132711.553451-1-tientzu@chromium.org>
References: <20210615132711.553451-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the swiotlb_force setting into io_tlb_default_mem->force and
use it to determine whether to bounce the data or not. This will be
useful later to allow for different pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 kernel/dma/direct.c     |  2 +-
 kernel/dma/direct.h     |  2 +-
 kernel/dma/swiotlb.c    |  4 ++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index dd1c30a83058..efcd56e3a16c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -84,6 +84,7 @@ extern enum swiotlb_force swiotlb_force;
  *		unmap calls.
  * @debugfs:	The dentry to debugfs.
  * @late_alloc:	%true if allocated using the page allocator
+ * @force:      %true if swiotlb is forced
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -94,6 +95,7 @@ struct io_tlb_mem {
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	bool force;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -109,6 +111,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return dev->dma_io_tlb_mem->force;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -120,6 +127,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
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
index 7a88c34d0867..3713461d6fe0 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || is_dev_swiotlb_force(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..6c4d13caceb1 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (is_dev_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d07e32020edf..5af47a8f68b8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -179,6 +179,10 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+
+	if (swiotlb_force == SWIOTLB_FORCE)
+		mem->force = true;
+
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
-- 
2.32.0.272.g935e593368-goog



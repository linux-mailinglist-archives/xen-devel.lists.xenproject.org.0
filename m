Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C668B392EB6
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133237.248436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFcJ-0001RV-5v; Thu, 27 May 2021 13:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133237.248436; Thu, 27 May 2021 13:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFcJ-0001OD-2T; Thu, 27 May 2021 13:00:03 +0000
Received: by outflank-mailman (input) for mailman id 133237;
 Thu, 27 May 2021 13:00:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFcI-0008B4-6v
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:00:02 +0000
Received: from mail-pf1-x436.google.com (unknown [2607:f8b0:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0c42614-a3d2-47ed-a196-38eebc41ff34;
 Thu, 27 May 2021 12:59:56 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x18so506569pfi.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 05:59:56 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id z6sm1943314pgp.89.2021.05.27.05.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 05:59:55 -0700 (PDT)
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
X-Inumbo-ID: c0c42614-a3d2-47ed-a196-38eebc41ff34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mi4fzGLZAevgWkOrJd5AqwgkgacGpqhm6BO8mxVKx0M=;
        b=cC0gm2frLrJhtkllrartdi/IJ10NPfAYEcwXPEVpQV2EiZmW5wSJj1wWFHn6TpRrf2
         HaqrP/OROCg0MWl2jqREsiM0RPu9M17H/istHD5+5fpOYHJ0bBQL7eAhc04shOaWsUE6
         dFPx9rNBosC2Q2M9oPdfJQj93f1q/HMozBcKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mi4fzGLZAevgWkOrJd5AqwgkgacGpqhm6BO8mxVKx0M=;
        b=jAtSNVSPn+4JuNnyT19bVnZwJOWXMTZhm8jb271AaKsfoN8zcwlzOUUnbVBk6eCZMt
         IMAaILs205GWvEiPcUa/wQBv7scDrBAFGhewLSpagCJy8piRZZ/ySYHgj+qLIfuLdfoQ
         QnKBcN+HLWmcEG+RssH9i/528twoZLQ3qhHb3tSUFklOIA8D8L8UwYJN4Tz+7YSSWKnV
         dpS8W09R/1F7grAfgfk6pzKhyTCvhNm7Ou/CSt3UIFiF2csJoLr9epb4dLz+JxZdHhV6
         HbTRJKtY0T1hoqnih9eP7TIZv0bNDeQ3lVdIqPYUVuI1HvxOHKKPz0K6dR6DrL7dOzEk
         lckw==
X-Gm-Message-State: AOAM533RZV9n94CeMPYyWrT32bIRCZaRrFxwvgkY5zFHeOXDgR5qGWsU
	SXBwvMYcmyTf3BnzG5APLUfqjQ==
X-Google-Smtp-Source: ABdhPJzPlZfJRITEebp1ZlzGxNW3wGUcc2uIEGsv6usjxbdSMuBRFFThGIAIIadsB2Kn5HYh1wQOKg==
X-Received: by 2002:a05:6a00:bcd:b029:2e5:694c:1c96 with SMTP id x13-20020a056a000bcdb02902e5694c1c96mr3610267pfu.53.1622120396288;
        Thu, 27 May 2021 05:59:56 -0700 (PDT)
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
Subject: [PATCH v8 07/15] swiotlb: Update is_swiotlb_active to add a struct device argument
Date: Thu, 27 May 2021 20:58:37 +0800
Message-Id: <20210527125845.1852284-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update is_swiotlb_active to add a struct device argument. This will be
useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 4 ++--
 kernel/dma/direct.c                          | 2 +-
 kernel/dma/swiotlb.c                         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ce6b664b10aa..7d48c433446b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active()) {
+	if (is_swiotlb_active(NULL)) {
 		unsigned int max_segment;
 
 		max_segment = swiotlb_max_segment();
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 65430912ff72..d0e998b9e2e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -270,7 +270,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active();
+	need_swiotlb = is_swiotlb_active(NULL);
 #endif
 
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index b7a8f3a1921f..6d548ce53ce7 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !is_swiotlb_active()) {
+	if (!err && !is_swiotlb_active(NULL)) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 2a6cca07540b..c530c976d18b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -123,7 +123,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
-bool is_swiotlb_active(void);
+bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
@@ -143,7 +143,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
-static inline bool is_swiotlb_active(void)
+static inline bool is_swiotlb_active(struct device *dev)
 {
 	return false;
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 84c9feb5474a..7a88c34d0867 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active() &&
+	if (is_swiotlb_active(dev) &&
 	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d99b403144a8..b2b6503ecd88 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -662,9 +662,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
 }
 
-bool is_swiotlb_active(void)
+bool is_swiotlb_active(struct device *dev)
 {
-	return io_tlb_default_mem != NULL;
+	return get_io_tlb_mem(dev) != NULL;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
-- 
2.31.1.818.g46aad6cb9e-goog



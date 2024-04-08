Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54989BEF3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 14:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701717.1096559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto69-0002Mz-68; Mon, 08 Apr 2024 12:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701717.1096559; Mon, 08 Apr 2024 12:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto69-0002L3-2P; Mon, 08 Apr 2024 12:27:41 +0000
Received: by outflank-mailman (input) for mailman id 701717;
 Mon, 08 Apr 2024 04:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KUbC=LN=gmail.com=mhkelley58@srs-se1.protection.inumbo.net>)
 id 1rtgMm-0002ih-LB
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 04:12:20 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30697297-f55e-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 06:12:19 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1e2232e30f4so35334955ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 21:12:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net.
 [73.254.87.52]) by smtp.gmail.com with ESMTPSA id
 u17-20020a17090341d100b001e3f0cde2desm2474666ple.253.2024.04.07.21.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 21:12:17 -0700 (PDT)
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
X-Inumbo-ID: 30697297-f55e-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712549538; x=1713154338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SjsV4HsSTItvj/ELiLD1hTF0cgJwLOFyNGElV0Kd8Z8=;
        b=ckQrcuqsApytau1YCZybRsoxIH3lVOdy1smvNdmo5TzV+ocVc3qLVP81dLE5aAnmwk
         kA3GTmo88lvoVzXU8CShKuAmZ+wvzO/4/4Ot9Q+MmfYJXWHozKpS2/3n5gaSFUrdVzts
         Ynmvse8cGPIP3dQynggA8GzNskAroQp6mSksOov+FTblvSkd/fnED6YdwtLLxRpA3vJE
         RZL9CTnlBSOcVeFCCZxnPiLfkTdQpTRjN6eN/YGE9H2xcw+uECj7S+//wPHODf0uIB/Z
         BNrxmpjHouAowFIozr8ox1X41D49KvpolTgtxPEDS7NiNsuZt9HMpMJ4KL/numzD/1AT
         lvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712549538; x=1713154338;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjsV4HsSTItvj/ELiLD1hTF0cgJwLOFyNGElV0Kd8Z8=;
        b=A6rIA8MjStN/lYLWKSClGsbCj7r85bBIE+cTlTZvm0HbnBlWwFmQgobA8zgaY+5qOf
         d15N5f0GyrZWOJOo810lXxBLlOiveG3AvewkjRgL/5pLIDIVTJH200y4jpq/SiWDbOVs
         OJ+e2agrMhIow1yAzqtivMM2226jnGZ3VopiBk6GxQBExEVQvcRO9nMtcjQun2oZSOx/
         ynaaicXl1GbDvFQgjvnedu3RYsKdiki9mKs6LPHsP3RSzjbZHXFRj5jFkypf20+f46iK
         /NLohR7pOukcC6bZ3oQ8VdIZi+YszCydOBnP3iLYw1NhSYZWgd/H42II5pXlTWlvmweY
         SULA==
X-Forwarded-Encrypted: i=1; AJvYcCUIUc6J5YrQEivhb/7dTgrwWy/liYsfOJs7kazxiJ3yMrUNeMUFIpBc4J45ZPhhm7Z8Y0e3eEbkLDaT4YT0rJJjasp89t604TEBPXIEJEU=
X-Gm-Message-State: AOJu0Yxjy9rZmH8VtRGhsnCJ4+ATPLyXS1yYeUYWdaJ76Ogtn8PP429G
	6KnwDobI8B8zLPQohWiuGdVM6Q/45J+9PbYKQQYag8Ba/Ry6XOnNp/9x5FhW
X-Google-Smtp-Source: AGHT+IEj4y4ne2ojXfNRa+AYfBs5hBPbD1UVM1VUfINpDFwALspJKDqHWO1VwvTTYi56XGeWrvjrIg==
X-Received: by 2002:a17:903:246:b0:1e2:6b80:95b0 with SMTP id j6-20020a170903024600b001e26b8095b0mr7483729plh.6.1712549537683;
        Sun, 07 Apr 2024 21:12:17 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: robin.murphy@arm.com,
	joro@8bytes.org,
	will@kernel.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: petr@tesarici.cz,
	roberto.sassu@huaweicloud.com
Subject: [PATCH 2/2] iommu/dma: Fix zero'ing of bounce buffer padding used by untrusted devices
Date: Sun,  7 Apr 2024 21:11:42 -0700
Message-Id: <20240408041142.665563-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408041142.665563-1-mhklinux@outlook.com>
References: <20240408041142.665563-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

iommu_dma_map_page() allocates swiotlb memory as a bounce buffer when
an untrusted device wants to map only part of the memory in an
granule. The goal is to disallow the untrusted device having
DMA access to unrelated kernel data that may be sharing the granule.
To meet this goal, the bounce buffer itself is zero'ed, and any
additional swiotlb memory up to alloc_size after the bounce buffer
end (i.e., "post-padding") is also zero'ed.

However, as of commit 901c7280ca0d ("Reinstate some of "swiotlb: rework
"fix info leak with DMA_FROM_DEVICE"""), swiotlb_tbl_map_single()
always initializes the contents of the bounce buffer to the original
memory. Zero'ing the bounce buffer is redundant and probably wrong per
the discussion in that commit. Only the post-padding needs to be
zero'ed.

Also, when the DMA min_align_mask is non-zero, the allocated bounce
buffer space may not start on a granule boundary. The swiotlb memory
from the granule boundary to the start of the allocated bounce buffer
might belong to some unrelated bounce buffer. So as described in the
"second issue" in [1], it can't be zero'ed to protect against untrusted
devices. But as of commit XXXXXXXXXXXX ("swiotlb: extend buffer
pre-padding to alloc_align_mask if necessary"), swiotlb_tbl_map_single()
allocates pre-padding slots when necessary to meet min_align_mask
requirements, making it possible to zero the pre-padding area as well.

Finally, iommu_dma_map_page() uses the swiotlb for untrusted devices
and also for certain kmalloc() memory. Current code does the zero'ing
for both cases, but it is needed only for the untrusted device case.

Fix all of this by updating iommu_dma_map_page() to zero both the
pre-padding and post-padding areas, but not the actual bounce buffer.
Do this only in the case where the bounce buffer is used because
of an untrusted device.

[1] https://lore.kernel.org/all/20210929023300.335969-1-stevensd@google.com/

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
I've wondered if this code for zero'ing the pre- and post-padding
should go in swiotlb_tbl_map_single(). The bounce buffer proper is
already being initialized there. But swiotlb_tbl_map_single()
would need to test for an untrusted device (or have a "zero the
padding" flag passed in as part of the "attrs" argument), which
adds complexity. Thoughts?

The commit ID of Petr's patch is X'ed out above because Petr's patch
hasn't gone into Linus' tree yet. We can add the real commit ID once
this patch is ready to go in.

Also I've haven't used any "Fixes:" tags. This patch really should
be backported only if all the other recent swiotlb fixes get
backported, and I'm unclear on whether that will happen.

 drivers/iommu/dma-iommu.c | 29 ++++++++++++++++-------------
 include/linux/iova.h      |  5 +++++
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c21ef1388499..ecac39b3190d 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1154,9 +1154,6 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	 */
 	if (dev_use_swiotlb(dev, size, dir) &&
 	    iova_offset(iovad, phys | size)) {
-		void *padding_start;
-		size_t padding_size, aligned_size;
-
 		if (!is_swiotlb_active(dev)) {
 			dev_warn_once(dev, "DMA bounce buffers are inactive, unable to map unaligned transaction.\n");
 			return DMA_MAPPING_ERROR;
@@ -1164,24 +1161,30 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 
 		trace_swiotlb_bounced(dev, phys, size);
 
-		aligned_size = iova_align(iovad, size);
 		phys = swiotlb_tbl_map_single(dev, phys, size,
 					      iova_mask(iovad), dir, attrs);
 
 		if (phys == DMA_MAPPING_ERROR)
 			return DMA_MAPPING_ERROR;
 
-		/* Cleanup the padding area. */
-		padding_start = phys_to_virt(phys);
-		padding_size = aligned_size;
+		/*
+		 * Untrusted devices should not see padding areas with random
+		 * leftover kernel data, so zero the pre- and post-padding.
+		 * swiotlb_tbl_map_single() has initialized the bounce buffer
+		 * proper to the contents of the original memory buffer.
+		 */
+		if (dev_is_untrusted(dev)) {
+			size_t start, virt = (size_t)phys_to_virt(phys);
 
-		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-		    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)) {
-			padding_start += size;
-			padding_size -= size;
-		}
+			/* Pre-padding */
+			start = iova_align_down(iovad, virt);
+			memset((void *)start, 0, virt - start);
 
-		memset(padding_start, 0, padding_size);
+			/* Post-padding */
+			start = virt + size;
+			memset((void *)start, 0,
+			       iova_align(iovad, start) - start);
+		}
 	}
 
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 83c00fac2acb..d2c4fd923efa 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -65,6 +65,11 @@ static inline size_t iova_align(struct iova_domain *iovad, size_t size)
 	return ALIGN(size, iovad->granule);
 }
 
+static inline size_t iova_align_down(struct iova_domain *iovad, size_t size)
+{
+	return ALIGN_DOWN(size, iovad->granule);
+}
+
 static inline dma_addr_t iova_dma_addr(struct iova_domain *iovad, struct iova *iova)
 {
 	return (dma_addr_t)iova->pfn_lo << iova_shift(iovad);
-- 
2.25.1



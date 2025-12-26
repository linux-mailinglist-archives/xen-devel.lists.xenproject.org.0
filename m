Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CAFCDFD63
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193520.1512216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-0007HH-FT; Sat, 27 Dec 2025 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193520.1512216; Sat, 27 Dec 2025 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-00079o-9k; Sat, 27 Dec 2025 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1193520;
 Fri, 26 Dec 2025 22:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGgx-0005LS-TI
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:53:52 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be534a05-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:53:50 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-34a4078f669so7787370a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:53:50 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:48 -0800 (PST)
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
X-Inumbo-ID: be534a05-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789629; x=1767394429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CBlUJRZIbYM1prFWy/0G8KDccWD/YxTB/AJqWrZ/Ys=;
        b=B9BV2hvxKWKha2D5IxGBNkC3dMvkslwO5soa+SKC9sZ/Z0c/8M9RyNpVFw9nnTf1+8
         8jRbrZes+HspOj6yz3AxIHWox5h3q2x2m2UeZbLvmEPuXeV7D2IoAnlf1Ko8W+JHKFB/
         WFX/dASYvpD4Z49QSwaPkTgNoSUUsEB3h1F02NF6Jcb/VV9QZVuUSb3urUHMHo8uDDOT
         g8Rs19vxqJ7PAMOCZwE5DKZ46p7rBu1p4iWuJlcHEi5H2zHKDTKPlodySuLezY7HvyNy
         xkAjEAhOlVLNncCxYy/d6AUup7pyl0Zsd88FJ+XFtXcWqcc03mAb8tNhnwsJCYLZNMsC
         hZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789629; x=1767394429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CBlUJRZIbYM1prFWy/0G8KDccWD/YxTB/AJqWrZ/Ys=;
        b=LeYorYIAT6cy3UouEi3zaOKPxCiuv9+SY+mHCoMyg8COMkUJe5SZgGf6dt7H1aCBvV
         GQL+L2fVoJpcHenrNDIhvGUWmal5ZdPVTTZVQo9wxLjZUZhStBxVd1SD2mcMctpyh4W0
         o3+V6c11TyH/7gGnx5yQvnZ9AL2rWJcXxQBd4X22HeEseR44ep8WyFskAkisUGHvXtXl
         tGHXXBDgRnx3odlvdx583AkOa7NrUudlnkGdsKp38ucK5fWhk/Q9ctfTdRImklfJVE+h
         5Hs3XaJzka4mfUJ++EyfkrJBZ326DOMD3hBzPVnZvzOGu+DCUCbVGPoS+xoEXqI9S59A
         yoHA==
X-Forwarded-Encrypted: i=1; AJvYcCUiKBGS+rkf9gSVYaojmz43IZ53bfI1+LAbt9SNDqoQ6CU/ydA+Tp+YvE+xuJJ/VPjCfDMnrukhrPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaeaGFcd9Y+GINJfhuQXsFGlYN5eSFEHGskcTnWac1q80Vwzjs
	WnmP/lwx12KRRRwBCcyKRXjT9FIBFM+ForuBBvNAkrtFT3JSMD6+cN4O
X-Gm-Gg: AY/fxX52ACoAc/OUwboU2mY3k5nvDuIYgVvi01nEIr/oVSwlbhO4V4xV6/e1jCT14fI
	HtDbsfSP1pZeIVeNBmlcKFLHCVDsw55ZeLntHzz+SmCFahtKQh18QRDRIJGYNdCGBbOTv6lgwuh
	cHC4JHyhiTr9CjdEABeRXvAIor/JNdZPt7S5BQttTRrXW+t6f/g98mxtfLsPMadFhu9Q3QssYbm
	Gnju3CBtq4z3yOKqrjwV+vw8ji/KcgPYcPRfPOy8Y/zmjagg9rQPqZXFOIoy6RAHj29w9NLIeFG
	nHsnXMB2LPRuVJRR5el3UP+w61niEuYgQbiPOpNFTupni4FpnH0vrbcKFtdM7rVI/5VDUom8VRq
	bkrezkzt3W+mgpAC1X0f4GLjiZzAKQWW5rT8p7yhL2oC7H+590sMKf+1dmn0tXpGpdaQQZqDZ9k
	xd48bVgC0Iztpx
X-Google-Smtp-Source: AGHT+IF6GTCerKOqMOKSYSeLfAiimvUN3+7D1SxAsR14bBFsurGjwmGev9rAORcjp7S0YIZTn6CThQ==
X-Received: by 2002:a17:90b:560c:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-34e921c3003mr16987619a91.22.1766789629137;
        Fri, 26 Dec 2025 14:53:49 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and completion waiting
Date: Sat, 27 Dec 2025 11:52:44 +1300
Message-ID: <20251226225254.46197-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
always wait for the completion of each DMA buffer. That is,
issuing the DMA sync and waiting for completion is done in a
single API call.

For scatter-gather lists with multiple entries, this means
issuing and waiting is repeated for each entry, which can hurt
performance. Architectures like ARM64 may be able to issue all
DMA sync operations for all entries first and then wait for
completion together.

To address this, arch_sync_dma_for_* now issues DMA operations in
batch, followed by a flush. On ARM64, the flush is implemented
using a dsb instruction within arch_sync_dma_flush().

For now, add arch_sync_dma_flush() after each
arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
no-op on all architectures except arm64, so this patch does not
change existing behavior. Subsequent patches will introduce true
batching for SG DMA buffers.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cache.h |  6 ++++++
 arch/arm64/mm/dma-mapping.c    |  4 ++--
 drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
 drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
 include/linux/dma-map-ops.h    |  6 ++++++
 kernel/dma/direct.c            |  8 ++++++--
 kernel/dma/direct.h            |  9 +++++++--
 kernel/dma/swiotlb.c           |  4 +++-
 8 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index dd2c8586a725..487fb7c355ed 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -87,6 +87,12 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+static inline void arch_sync_dma_flush(void)
+{
+	dsb(sy);
+}
+#define arch_sync_dma_flush arch_sync_dma_flush
+
 /* Compress a u64 MPIDR value into 32 bits. */
 static inline u64 arch_compact_of_hwid(u64 id)
 {
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..ae1ae0280eef 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 
-	dcache_clean_poc(start, start + size);
+	dcache_clean_poc_nosync(start, start + size);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
@@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	if (dir == DMA_TO_DEVICE)
 		return;
 
-	dcache_inval_poc(start, start + size);
+	dcache_inval_poc_nosync(start, start + size);
 }
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c92088855450..6827763a3877 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1095,8 +1095,10 @@ void iommu_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	swiotlb_sync_single_for_cpu(dev, phys, size, dir);
 }
@@ -1112,8 +1114,10 @@ void iommu_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
 	swiotlb_sync_single_for_device(dev, phys, size, dir);
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 }
 
 void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
@@ -1122,13 +1126,16 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	int i;
 
-	if (sg_dma_is_swiotlb(sgl))
+	if (sg_dma_is_swiotlb(sgl)) {
 		for_each_sg(sgl, sg, nelems, i)
 			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
 						      sg->length, dir);
-	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i)
+	} else if (!dev_is_dma_coherent(dev)) {
+		for_each_sg(sgl, sg, nelems, i) {
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
+			arch_sync_dma_flush();
+		}
+	}
 }
 
 void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
@@ -1143,8 +1150,10 @@ void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 							 sg_dma_address(sg),
 							 sg->length, dir);
 	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i)
+		for_each_sg(sgl, sg, nelems, i) {
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
+			arch_sync_dma_flush();
+		}
 }
 
 static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
@@ -1219,8 +1228,10 @@ dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 			return DMA_MAPPING_ERROR;
 	}
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	iova = __iommu_dma_map(dev, phys, size, prot, dma_mask);
 	if (iova == DMA_MAPPING_ERROR && !(attrs & DMA_ATTR_MMIO))
@@ -1242,8 +1253,10 @@ void iommu_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 	if (WARN_ON(!phys))
 		return;
 
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	__iommu_dma_unmap(dev, dma_handle, size);
 
@@ -1836,8 +1849,10 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	bool coherent = dev_is_dma_coherent(dev);
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -2008,8 +2023,10 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 			end - addr, iovad->granule - iova_start_pad);
 
 		if (!dev_is_dma_coherent(dev) &&
-		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 			arch_sync_dma_for_cpu(phys, len, dir);
+			arch_sync_dma_flush();
+		}
 
 		swiotlb_tbl_unmap_single(dev, phys, len, dir, attrs);
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ccf25027bec1..b79917e785a5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -262,10 +262,12 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
 			arch_sync_dma_for_device(phys, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_device(dev, dev_addr, size, dir);
+		}
 	}
 	return dev_addr;
 }
@@ -287,10 +289,12 @@ static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr)))) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
+		}
 	}
 
 	/* NOTE: We use dev_addr here, not paddr! */
@@ -308,10 +312,12 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	struct io_tlb_pool *pool;
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_cpu(dev, dma_addr, size, dir);
+		}
 	}
 
 	pool = xen_swiotlb_find_pool(dev, dma_addr);
@@ -331,10 +337,12 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		__swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
 			arch_sync_dma_for_device(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_device(dev, dma_addr, size, dir);
+		}
 	}
 }
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4809204c674c..e7dd8a63b40e 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
 
+#ifndef arch_sync_dma_flush
+static inline void arch_sync_dma_flush(void)
+{
+}
+#endif
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 void arch_sync_dma_for_cpu_all(void);
 #else
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 50c3fe2a1d55..a219911c7b90 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -402,9 +402,11 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
-		if (!dev_is_dma_coherent(dev))
+		if (!dev_is_dma_coherent(dev)) {
 			arch_sync_dma_for_device(paddr, sg->length,
 					dir);
+			arch_sync_dma_flush();
+		}
 	}
 }
 #endif
@@ -421,8 +423,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (!dev_is_dma_coherent(dev))
+		if (!dev_is_dma_coherent(dev)) {
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+			arch_sync_dma_flush();
+		}
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..a69326eed266 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -60,8 +60,10 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 
 	swiotlb_sync_single_for_device(dev, paddr, size, dir);
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_device(paddr, size, dir);
+		arch_sync_dma_flush();
+	}
 }
 
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
@@ -71,6 +73,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -109,8 +112,10 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	}
 
 	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 	return dma_addr;
 
 err_overflow:
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a547c7693135..7cdbfcdfef86 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1595,8 +1595,10 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 		return DMA_MAPPING_ERROR;
 	}
 
-	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
 		arch_sync_dma_for_device(swiotlb_addr, size, dir);
+		arch_sync_dma_flush();
+	}
 	return dma_addr;
 }
 
-- 
2.43.0



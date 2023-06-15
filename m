Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07840731DC3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 18:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549748.858474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ppC-0006LD-Vc; Thu, 15 Jun 2023 16:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549748.858474; Thu, 15 Jun 2023 16:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ppC-0006Io-Rg; Thu, 15 Jun 2023 16:27:54 +0000
Received: by outflank-mailman (input) for mailman id 549748;
 Thu, 15 Jun 2023 16:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9ppB-0006Ii-AF
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 16:27:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b74df8-0b99-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 18:27:51 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30e412a852dso6009350f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 09:27:51 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v18-20020adfebd2000000b0030789698eebsm21410353wrn.89.2023.06.15.09.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 09:27:50 -0700 (PDT)
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
X-Inumbo-ID: 92b74df8-0b99-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686846471; x=1689438471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxikZb+F64c+mT8kOHYJ8gz8gbxDCfn/MPVB7fzFoGg=;
        b=JNanJcgbNM6B9GBriYaiFW0xnPW9hcEDInNYbF61K6bqXjskRSWbtVTfDCfrboru7L
         znB2aGSd1g0938fbcuNMoNb9TjMGyyhRbCvwr7JO21TC4BU6ePTxPa4L7UHO/ZK2zp9a
         MkJV4aClZUcxZImB5dIAzciHSNZ3Y0bPavr9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686846471; x=1689438471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxikZb+F64c+mT8kOHYJ8gz8gbxDCfn/MPVB7fzFoGg=;
        b=ViZLgOJOzkn5QBfnvgOdyFfpb96KAUKdfnCmo2rEkUl0T8wYc9fGWVWe+G7nlW8Szk
         /aCXOelpQ24PvhXO4c5rQ2jzTu8Q7VU3R8Mv+pdVdMiIelbu4kNrV+SVLLKiKqhUX8Bw
         7Lcy9qV5AYgRuP2nuoWeBkQ635AyRcyN0qZi89OY84oLlb3gJedBZt1CQ65nvJniGRP0
         P+CAIYwJyXedxQ31XdJxMQfhPoWgIJAfRa3Zvt5gWnujRPzgHPGLMHRwMEMuaE//o4MZ
         q9F9mvAUUkLO9UGQyaC++ofaeQAjH7tVd2Szy7Seo8YSqqYsr4D2cjOLMQpKkmOfvJrj
         qb1Q==
X-Gm-Message-State: AC+VfDx8GLsYaOk6IEFYHQu7/P6mEo7+kIF1CZ2qivsZdNSzC7Vb+sGH
	mfJapFrRbCm0OgoB0pobGY7+rrGcUeWWWGKPW7o=
X-Google-Smtp-Source: ACHHUZ60fqGUju3VGUCV/vJ9e/5cqEJL73VgEXr8d9YiM6Qw4jHu55b5ztdb/8lqYVLnzVYiv0mI/A==
X-Received: by 2002:a05:6000:51:b0:30a:f3ca:17bb with SMTP id k17-20020a056000005100b0030af3ca17bbmr9848670wrx.35.1686846470585;
        Thu, 15 Jun 2023 09:27:50 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
Date: Thu, 15 Jun 2023 17:27:41 +0100
Message-Id: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the behaviour of the pdx machinery in Xen. Some logic is fairly
opaque and hard to follow without it being documented anywhere. This
explains the rationale behind compression and its relationship to
frametable indexing and directmap management.

While modifying the file:
  * Convert u64 -> uint64_t
  * Remove extern keyword from function prototypes

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/pdx.c      |  66 ++++++++++++++++++++--
 xen/include/xen/mm.h  |  16 ++++++
 xen/include/xen/pdx.h | 128 ++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 202 insertions(+), 8 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index c91875fabe..0121ab1915 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -20,13 +20,55 @@
 #include <xen/bitops.h>
 #include <xen/nospec.h>
 
-/* Parameters for PFN/MADDR compression. */
+/*
+ * Diagram to make sense of the following variables. The masks and shifts
+ * are done on mfn values in order to convert to/from pdx:
+ *
+ *                      pfn_hole_mask
+ *                      pfn_pdx_hole_shift (mask bitsize)
+ *                      |
+ *                 |---------|
+ *                 |         |
+ *                 V         V
+ *         --------------------------
+ *         |HHHHHHH|000000000|LLLLLL| <--- mfn
+ *         --------------------------
+ *         ^       ^         ^      ^
+ *         |       |         |------|
+ *         |       |             |
+ *         |       |             pfn_pdx_bottom_mask
+ *         |       |
+ *         |-------|
+ *             |
+ *             pfn_top_mask
+ *
+ * ma_{top,bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask where the
+ * bottom one shifts in 1s rather than 0s.
+ */
+
+/** Maximum (non-inclusive) usable pdx */
 unsigned long __read_mostly max_pdx;
+
+/** Mask for the lower non-compressible bits of an mfn */
 unsigned long __read_mostly pfn_pdx_bottom_mask = ~0UL;
+
+/** Mask for the lower non-compressible bits of an maddr or vaddr */
 unsigned long __read_mostly ma_va_bottom_mask = ~0UL;
+
+/** Mask for the higher non-compressible bits of an mfn */
 unsigned long __read_mostly pfn_top_mask = 0;
+
+/** Mask for the higher non-compressible bits of an maddr or vaddr */
 unsigned long __read_mostly ma_top_mask = 0;
+
+/**
+ * Mask for a pdx compression bit slice.
+ *
+ *  Invariant: valid(mfn) implies (mfn & pfn_hole_mask) == 0
+ */
 unsigned long __read_mostly pfn_hole_mask = 0;
+
+/** Number of bits of the "compressible" bit slice of an mfn */
 unsigned int __read_mostly pfn_pdx_hole_shift = 0;
 
 unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
@@ -42,7 +84,7 @@ bool __mfn_valid(unsigned long mfn)
 }
 
 /* Sets all bits from the most-significant 1-bit down to the LSB */
-static u64 __init fill_mask(u64 mask)
+static uint64_t __init fill_mask(uint64_t mask)
 {
     while (mask & (mask + 1))
         mask |= mask + 1;
@@ -57,9 +99,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-u64 __init pdx_region_mask(u64 base, u64 len)
+uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
 {
-    return fill_mask(base ^ (base + len - 1));
+    uint64_t last = base + len - 1;
+    /*
+     * The only bit that matters in base^last is the MSB. There are 2 cases.
+     *
+     * case msb(base) < msb(last):
+     *     then fill_mask(base^last) == fill_mask(last). This is non
+     *     compressible.
+     * case msb(base) == msb(last):
+     *     This means that there _may_ be a sequence of compressible zeroes
+     *     for all addresses between `base` and `last` iff `base` has enough
+     *     trailing zeroes. That is, it's compressible when
+     *     fill_mask(base^last) < fill_mask(last)
+     *
+     * The resulting mask is effectively the moving bits between `base` and
+     * `last`
+     */
+    return fill_mask(base ^ last);
 }
 
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b0dc3ba9c9..568cc396ab 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -31,6 +31,22 @@
  *   (i.e. all devices assigned to) a guest share a single DMA address space
  *   and, by default, Xen will ensure dfn == pfn.
  *
+ * pdx: Page InDeX
+ *   Indices into the frame table holding the per-page's book-keeping
+ *   metadata. A compression scheme is used and there's a non-identity
+ *   mapping between valid(mfn) <-> valid(pdx) See the comments in pdx.c
+ *   for an in-depth explanation of that mapping.
+ *
+ * maddr: Machine Address
+ *   The physical address that corresponds to an mfn
+ *
+ * vaddr: Xen Virtual Address
+ *   A virtual address of memory accesible to Xen. It is typically either
+ *   an address into the direct map or to Xen's own code/data. The direct
+ *   map implements several compression tricks to save memory, so an offset
+ *   into it does _not_ necessarily correspond to an maddr due to pdx
+ *   compression.
+ *
  * WARNING: Some of these terms have changed over time while others have been
  * used inconsistently, meaning that a lot of existing code does not match the
  * definitions above.  New code should use these terms as described here, and
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 9fcfb0ce52..adc5707e88 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -1,6 +1,62 @@
 #ifndef __XEN_PDX_H__
 #define __XEN_PDX_H__
 
+/*
+ * PDX (Page inDeX)
+ *
+ * This file deals with optimisations pertaining frame table indexing,
+ * A pdx is an index into the frame table. However, having an identity
+ * relationship between mfn and pdx could waste copious amounts of memory
+ * in empty frame table entries. There are some techniques to bring memory
+ * wastage down.
+ *
+ * ## PDX grouping
+ *
+ * The frame table may have some sparsity even on systems where the memory
+ * banks are tightly packed. This is due to system quirks (like the PCI
+ * hole) which might introduce several GiB of unused page frame numbers
+ * that uselessly waste memory in the frame table. PDX grouping addresses
+ * this by keeping a bitmap of the ranges in the frame table containing
+ * invalid entries and not allocating backing memory for them.
+ *
+ * ## PDX compression
+ *
+ * This is a technique to avoid wasting memory on machines known to have
+ * split their machine address space in two big discontinuous and highly
+ * disjoint chunks.
+ *
+ * In its uncompressed form the frame table must have book-keeping metadata
+ * structures for every page between [0, max_mfn) (whether they exist or
+ * not), and a similar condition exists for the direct map. We know some
+ * architectures, however, that have some sparsity in their address space,
+ * leading to a lot of wastage in the form of unused frame table entries.
+ *
+ * This is where compression becomes useful. The idea is to note that if
+ * you have 2 big chunks of memory sufficiently far apart you can ignore
+ * the middle part of the address because it will always contain zeroes as
+ * long as the base address is sufficiently well aligned and the length of
+ * the region is much smaller than the base address.
+ *
+ * i.e:
+ *   Consider 2 regions of memory. One starts at 0 while the other starts
+ *   at offset 2^off_h. Furthermore, let's assume both regions are smaller
+ *   than 2^off_l. This means that all addresses between [2^off_l, 2^off_h)
+ *   are invalid and we can assume them to be zero on all valid addresses
+ *
+ *                 off_h     off_l
+ *                 |         |
+ *                 V         V
+ *         --------------------------
+ *         |HHHHHHH|000000000|LLLLLL| <--- mfn
+ *         --------------------------
+ *           ^ |
+ *           | | (de)compression by adding/removing "useless" zeroes
+ *           | V
+ *         ---------------
+ *         |HHHHHHHLLLLLL| <--- pdx
+ *         ---------------
+ */
+
 #ifdef CONFIG_HAS_PDX
 
 extern unsigned long max_pdx;
@@ -13,22 +69,77 @@ extern unsigned long pfn_top_mask, ma_top_mask;
                          (sizeof(*frame_table) & -sizeof(*frame_table)))
 extern unsigned long pdx_group_valid[];
 
-extern uint64_t pdx_init_mask(u64 base_addr);
-extern u64 pdx_region_mask(u64 base, u64 len);
+/**
+ * Calculates a mask covering "moving" bits of all addresses of a region
+ *
+ * e.g:
+ *       base=0x1B00000000
+ *   len+base=0x1B0008200;
+ *
+ *   ought to return 0x00000FFFFF;
+ *
+ * @param base Base address of the region
+ * @param len  Size in octets of the region
+ * @return Mask of moving bits at the bottom of all the region addresses
+ */
+uint64_t pdx_init_mask(u64 base_addr);
 
-extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
+/**
+ * Calculates a mask covering "moving" bits of all addresses of a region
+ *
+ * e.g:
+ *       base=0x1B00000000
+ *   len+base=0x1B0008200;
+ *
+ *   ought to return 0x00000FFFFF;
+ *
+ * @param base Base address of the region
+ * @param len  Size in octets of the region
+ * @return Mask of moving bits at the bottom of all the region addresses
+ */
+uint64_t pdx_region_mask(uint64_t base, uint64_t len);
+
+/**
+ * Mark range between smfn and emfn is allocatable in the frame table
+ *
+ * @param smfn Start mfn
+ * @param emfn End mfn
+ */
+void set_pdx_range(unsigned long smfn, unsigned long emfn);
 
 #define page_to_pdx(pg)  ((pg) - frame_table)
 #define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
 
+/**
+ * Invoked to determine if an mfn maps to a legal pdx
+ *
+ * In order for it to be legal it must pass bounds, grouping and
+ * compression sanity checks.
+ *
+ * @param smfn Start mfn
+ * @param emfn End mfn
+ * @return True iff all checks pass
+ */
 bool __mfn_valid(unsigned long mfn);
 
+/**
+ * Map pfn to its corresponding pdx
+ *
+ * @param pfn Frame number
+ * @return Obtained pdx after compressing the pfn
+ */
 static inline unsigned long pfn_to_pdx(unsigned long pfn)
 {
     return (pfn & pfn_pdx_bottom_mask) |
            ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift);
 }
 
+/**
+ * Map a pdx to its corresponding pfn
+ *
+ * @param pdx Page index
+ * @return Obtained pfn after decompressing the pdx
+ */
 static inline unsigned long pdx_to_pfn(unsigned long pdx)
 {
     return (pdx & pfn_pdx_bottom_mask) |
@@ -38,7 +149,16 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
-extern void pfn_pdx_hole_setup(unsigned long);
+/**
+ * Initializes global variables with information about the compressible
+ * range of the current memory regions.
+ *
+ * @param mask This mask is the biggest pdx_mask of every region in the
+ *             system ORed with all base addresses of every region in the
+ *             system. The result is a mask where every sequence of zeroes
+ *             surrounded by ones is compressible.
+ */
+void pfn_pdx_hole_setup(unsigned long mask);
 
 #endif /* HAS_PDX */
 #endif /* __XEN_PDX_H__ */
-- 
2.34.1



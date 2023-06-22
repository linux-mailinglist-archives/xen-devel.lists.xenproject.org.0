Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8773A29D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 16:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553612.864264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKta-000318-Lz; Thu, 22 Jun 2023 14:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553612.864264; Thu, 22 Jun 2023 14:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKta-0002yM-Ij; Thu, 22 Jun 2023 14:02:46 +0000
Received: by outflank-mailman (input) for mailman id 553612;
 Thu, 22 Jun 2023 14:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCKtZ-0002yE-I9
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 14:02:45 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750039d9-1105-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 16:02:43 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f9b4a71623so38526345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 07:02:43 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bcd14000000b003f7f2a1484csm7836764wmj.5.2023.06.22.07.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:02:41 -0700 (PDT)
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
X-Inumbo-ID: 750039d9-1105-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687442562; x=1690034562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpLFuadE1Tji+ZRr40/2UDaxu9mY/3/yOY5AA4QxcqU=;
        b=JFz76u/4j709JsQU+Qg5rXN6fW5GNW763CzTnruXzgDnz9gUq49s07A1Bte8dfw9A8
         VyOm9tXIpmkf8lIltzxjwiXW7STHPGALc045lUQfW794VGYNN7LOcSljv/HkJ5PZFIFJ
         wZG32jqTFkX4+lnrvTiY3onrSfdbzVdBVrqy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442562; x=1690034562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpLFuadE1Tji+ZRr40/2UDaxu9mY/3/yOY5AA4QxcqU=;
        b=g9AWPzqfF6gvmjK+s4D24knqDz4bGPnPQ9Ven0EfOAVUjhJkArTSV69uzeevtf21v7
         uA/gAkvu8ezdgdzWBGT24xqmjbFCc3iuX6CsRAxFxVpGF8arJopIPYKc3LRmL11J9SZ8
         q/AdyzS5+2MPiyfe9qle4J3QGJl8heta0csh9PFc0sMnX9nau5F9JV36Ad9osYTKqZ8r
         ZGU9jJlqq+xwHYJc0xrZBo0UUmeoc9SZl11SODFxsB0Lp0+enumMUI47rCyrYDUplH5V
         PXqChCIUttvMSpZkLyPSZYjlNMKoq4kSCi0Jfw28Vbjbh0f5WL1BOkOCttWhkLhEpn1m
         gFOg==
X-Gm-Message-State: AC+VfDxM0s8ea6/iihebRuQueIPyy32mAhkH1+yZI0wMmHEcKqf/dJXP
	1X98jc4E5GAl59ewLlEqH3gtU32x1wbn/F1N6HY=
X-Google-Smtp-Source: ACHHUZ4q0HbugizOqAUK8bv35FZEKXbgMOn+iBKR+Tqu0qucEs2TRx2HlO3TuRLLKgr1scwJdkPf8Q==
X-Received: by 2002:a1c:f310:0:b0:3f8:f382:8e1f with SMTP id q16-20020a1cf310000000b003f8f3828e1fmr1485674wmq.24.1687442562045;
        Thu, 22 Jun 2023 07:02:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
Date: Thu, 22 Jun 2023 15:02:37 +0100
Message-Id: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
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
v2:
  * [pdx.h] Moved pdx_init_mask() after pdx_region_mask() so comments are
            more self-documenting

  (Jan feedback)
  * [pdx.c] Rewrote ma_bottom_mask as ma_va_bottom in comment.
  * [pdx.c] Rewrote comment in pdx_region_mask() to explain in terms of
            msb() rather than fill_mask().
  * [mm.h] Made it explicit that the compression scheme might still yield
           an identity mapping between mfn and pdx.
  * [mm.h] Removed vaddr definition in mm.h
  * [pdx.h] Refine definition of compression so it's clear it can apply to
            many regions
  * [pdx.h] s/they exist/they are backed by RAM/
  * [pdx.h] Improved comment in pdx_region_mask()
  * [pdx.h] Corrected mistaken comment in pdx_init_mask()
  * [pdx.h] Added mathematical interval in comment for set_pdx_range()
  * [pdx.h] Rewrote __mfn_valid() to refer to the frame table rather than
            a pdx
---
 xen/common/pdx.c      |  67 +++++++++++++++++++--
 xen/include/xen/mm.h  |  10 +++
 xen/include/xen/pdx.h | 137 ++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 206 insertions(+), 8 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index c91875fabe..27cdb49e17 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -20,13 +20,56 @@
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
+ * ma_{top,va_bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask,
+ * where ma_top_mask has zeroes shifted in while ma_va_bottom_mask has
+ * ones.
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
@@ -42,7 +85,7 @@ bool __mfn_valid(unsigned long mfn)
 }
 
 /* Sets all bits from the most-significant 1-bit down to the LSB */
-static u64 __init fill_mask(u64 mask)
+static uint64_t __init fill_mask(uint64_t mask)
 {
     while (mask & (mask + 1))
         mask |= mask + 1;
@@ -57,9 +100,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
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
+     *     then msb(fill_mask(base^last)) == msb(last). This is non
+     *     compressible.
+     * case msb(base) == msb(last):
+     *     This means that there _may_ be a sequence of compressible zeroes
+     *     for all addresses between `base` and `last` iff `base` has enough
+     *     trailing zeroes. That is, it's compressible when
+     *     msb(fill_mask(base^last)) < msb(last)
+     *
+     * The resulting mask is effectively the moving bits between `base` and
+     * `last`.
+     */
+    return fill_mask(base ^ last);
 }
 
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b0dc3ba9c9..7e4b190357 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -31,6 +31,16 @@
  *   (i.e. all devices assigned to) a guest share a single DMA address space
  *   and, by default, Xen will ensure dfn == pfn.
  *
+ * pdx: Page InDeX
+ *   Indices into the frame table holding the per-page's book-keeping
+ *   metadata. A compression scheme is used and there's a possibly non
+ *   identity mapping between valid(mfn) <-> valid(pdx). In particular, the
+ *   mapping happens to be identity when the ranges are not compressible.
+ *   See the comments in pdx.c for an in-depth explanation of that mapping.
+ *
+ * maddr: Machine Address
+ *   The physical address that corresponds to an mfn
+ *
  * WARNING: Some of these terms have changed over time while others have been
  * used inconsistently, meaning that a lot of existing code does not match the
  * definitions above.  New code should use these terms as described here, and
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 9fcfb0ce52..b3ff2aad09 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -1,6 +1,67 @@
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
+ * split their machine address space in several big discontinuous and highly
+ * disjoint chunks.
+ *
+ * In its uncompressed form the frame table must have book-keeping metadata
+ * structures for every page between [0, max_mfn) (whether they are backed
+ * by RAM or not), and a similar condition exists for the direct map. We
+ * know some systems, however, that have some sparsity in their address
+ * space, leading to a lot of wastage in the form of unused frame table
+ * entries.
+ *
+ * This is where compression becomes useful. The idea is to note that if
+ * you have several big chunks of memory sufficiently far apart you can
+ * ignore the middle part of the address because it will always contain
+ * zeroes as long as the base address is sufficiently well aligned and the
+ * length of the region is much smaller than the base address.
+ *
+ * i.e:
+ *   Consider 2 regions of memory. One starts at 0 while the other starts
+ *   at offset 2^off_h. Furthermore, let's assume both regions are smaller
+ *   than 2^off_l. This means that all addresses between [2^off_l, 2^off_h)
+ *   are invalid and we can assume them to be zero on all valid addresses.
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
+ *
+ * This scheme also holds for multiple regions, where HHHHHHH acts as
+ * the region identifier and LLLLLL fully contains the span of every
+ * region involved. Consider the following 3 regions.
+ */
+
 #ifdef CONFIG_HAS_PDX
 
 extern unsigned long max_pdx;
@@ -13,22 +74,81 @@ extern unsigned long pfn_top_mask, ma_top_mask;
                          (sizeof(*frame_table) & -sizeof(*frame_table)))
 extern unsigned long pdx_group_valid[];
 
-extern uint64_t pdx_init_mask(u64 base_addr);
-extern u64 pdx_region_mask(u64 base, u64 len);
+/**
+ * Calculates a mask covering "moving" bits of all addresses of a region
+ *
+ * The i-th bit of the mask must be set if there's 2 different addresses
+ * in the region that have different j-th bits. where j >= i.
+ *
+ * e.g:
+ *       base=0x1B00000000
+ *   len+base=0x1B00082000
+ *
+ *   ought to return 0x00000FFFFF, which implies that every bit position
+ *   with a zero in the mask remains unchanged in every address of the
+ *   region.
+ *
+ * @param base Base address of the region
+ * @param len  Size in octets of the region
+ * @return Mask of moving bits at the bottom of all the region addresses
+ */
+uint64_t pdx_region_mask(uint64_t base, uint64_t len);
 
-extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
+/**
+ * Creates a basic pdx mask
+ *
+ * This mask is used to determine non-compressible bits. No address in the
+ * system shall have compressible bits covered by this initial mask.
+ *
+ * It's the larger of:
+ *   - A mask of MAX_ORDER + PAGESHIFT 1s
+ *   - base_addr rounded up to the nearest `2^n - 1`
+ *
+ * @param base_addr Address of the first maddr in the system
+ * @return An integer of the form 2^n - 1
+ */
+uint64_t pdx_init_mask(uint64_t base_addr);
+
+/**
+ * Mark [smfn, emfn) as allocatable in the frame table
+ *
+ * @param smfn Start mfn
+ * @param emfn End mfn
+ */
+void set_pdx_range(unsigned long smfn, unsigned long emfn);
 
 #define page_to_pdx(pg)  ((pg) - frame_table)
 #define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
 
+/**
+ * Invoked to determine if an mfn has an associated valid frame table entry
+ *
+ * In order for it to be legal it must pass bounds, grouping and
+ * compression sanity checks.
+ *
+ * @param mfn To-be-checked mfn
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
@@ -38,7 +158,16 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
-extern void pfn_pdx_hole_setup(unsigned long);
+/**
+ * Initializes global variables with information about the compressible
+ * range of the current memory regions.
+ *
+ * @param mask This mask is the biggest pdx_mask of every region in the
+ *             system ORed with all base addresses of every region in the
+ *             system. This results in a mask where every zero in a bit
+ *             position marks a potentially compressible bit.
+ */
+void pfn_pdx_hole_setup(unsigned long mask);
 
 #endif /* HAS_PDX */
 #endif /* __XEN_PDX_H__ */
-- 
2.34.1



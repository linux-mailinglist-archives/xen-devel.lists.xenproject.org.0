Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CBE74B4E7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 18:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560571.876593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHo07-00046R-9n; Fri, 07 Jul 2023 16:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560571.876593; Fri, 07 Jul 2023 16:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHo07-000442-6q; Fri, 07 Jul 2023 16:08:07 +0000
Received: by outflank-mailman (input) for mailman id 560571;
 Fri, 07 Jul 2023 16:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X2dY=CZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qHo05-00043w-Dz
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 16:08:05 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d86aa2-1ce0-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 18:08:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51d80d81d6eso2782859a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 09:08:03 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020aa7d594000000b0051e166f342asm2192094edq.66.2023.07.07.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 09:08:02 -0700 (PDT)
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
X-Inumbo-ID: 73d86aa2-1ce0-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688746083; x=1691338083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGIFba9dcTnwZYyj5Ocyv8eJoh5iiQBvZlW6yEveKKg=;
        b=dpDhbws6+DHOhDWCAFHCXTJouhZ+nECYr6tdqqM/tQNEwhwdL1CoPPm8ze/KhLyRoz
         giiLguqT5+T+MWWcyqRVM+k2jmHX4FAleUOocUDsqZrAT724cbL4IFp977ZEm/RKhS6o
         SDDTpugh6tulYrd/hXLO6NfObA0SHZgWc2OdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688746083; x=1691338083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGIFba9dcTnwZYyj5Ocyv8eJoh5iiQBvZlW6yEveKKg=;
        b=cdR6SIOGv1ybb2FsE9kfuAtMnPB7k3o0PUusYLy9OWLS07i1kA18S9Dmaoj6+pehH/
         eu2xBCBNd7JNLizIx3IgoWRd/DFyClOspwveQQm9q2nd+ndyXSxsnFNe/nBKfRW8wIdO
         DtfnTOhM2YpJw8/h6wEum+imZHu9lQp+BClfdx7yMdAdrQGdtMfeqTxdMociI5s6KDg6
         XrIZ+3VksFKGyXwVGb5N4WvY+seiJngQr1cAv4Yoq2ABopvBy4ZELGRBPXGnIXVcbf8V
         IIFuQO6HbUDrIadsvHexH+pGLNpxgDSfF9ohUMe0iMJvGCKFIkRC0IujBjBK8eK7dEfm
         YziQ==
X-Gm-Message-State: ABy/qLa1mgSEYnrM3wtQHgVkzkKOkBramO2iJbdu63pXsDao3k9jThrO
	8PFGZ11f313D4kq9OH/Dk2gC1Rfmh6krVfpFMSA=
X-Google-Smtp-Source: APBJJlFXK30YnTOKSE1ZENZ+/rZ6fNt+eW1c5o6ikzDuLbeIszt+nNJuywBl8fMVNeACT357faj9KA==
X-Received: by 2002:a05:6402:892:b0:51d:96d2:6578 with SMTP id e18-20020a056402089200b0051d96d26578mr4280733edy.28.1688746083031;
        Fri, 07 Jul 2023 09:08:03 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] mm/pdx: Add comments throughout the codebase for pdx
Date: Fri,  7 Jul 2023 17:07:59 +0100
Message-Id: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
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
v3:
  * Exended the pdx=frametableindex definition also cover the directmap (to
    the extent that it still applies to every port)
  * [pdx.c] Removed auxiliary variable and turned the case analysis comment
            into a full paragraph.
  * [pdx.h] Removed stray sentence in pdx.h
  * [pdx.h] Made example in pdx_region_mask() clearer
  * [pdx.h] Clarified set_pdx_range() and pdx_init_mask()
---
 xen/common/pdx.c      |  59 +++++++++++++++++-
 xen/include/xen/mm.h  |  11 ++++
 xen/include/xen/pdx.h | 140 ++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 203 insertions(+), 7 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index c91875fabe..ec64d3d2ef 100644
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
@@ -57,8 +100,18 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-u64 __init pdx_region_mask(u64 base, u64 len)
+uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
 {
+    /*
+     * We say a bit "moves" in a range if there exist 2 addresses in that
+     * range that have that bit both set and cleared respectively. We want
+     * to create a mask of _all_ moving bits in this range. We do this by
+     * comparing the first and last addresses in the range, discarding the
+     * bits that remain the same (this is logically an XOR operation). The
+     * MSB of the resulting expression is the most significant moving bit
+     * in the range. Then it's a matter of setting every bit in lower
+     * positions in order to get the mask of moving bits.
+     */
     return fill_mask(base ^ (base + len - 1));
 }
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b0dc3ba9c9..f23aff3af2 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -31,6 +31,17 @@
  *   (i.e. all devices assigned to) a guest share a single DMA address space
  *   and, by default, Xen will ensure dfn == pfn.
  *
+ * pdx: Page InDeX
+ *   Indices into the frame table holding the per-page's book-keeping
+ *   metadata. A compression scheme may be used, so there's a possibly non
+ *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
+ *   in pdx.c for an in-depth explanation of that mapping. This also has a
+ *   knock-on effect on the directmap, as "compressed" pfns have no
+ *   corresponding mapped frames.
+ *
+ * maddr: Machine Address
+ *   The physical address that corresponds to an mfn
+ *
  * WARNING: Some of these terms have changed over time while others have been
  * used inconsistently, meaning that a lot of existing code does not match the
  * definitions above.  New code should use these terms as described here, and
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 9fcfb0ce52..cc4fce71b1 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -1,6 +1,73 @@
 #ifndef __XEN_PDX_H__
 #define __XEN_PDX_H__
 
+/*
+ * PDX (Page inDeX)
+ *
+ * This file deals with optimisations pertaining to frame table and
+ * directmap indexing, A pdx is an index into the frame table, which
+ * typically also means an index into the directmap[1]. However, having an
+ * identity relationship between mfn and pdx could waste copious amounts of
+ * memory in empty frame table entries and page tables. There are some
+ * techniques to bring memory wastage down.
+ *
+ * [1] Some ports apply further modifications to a pdx before indexing the
+ *     directmap. This doesn't change the fact that the same compression
+ *     present in the frame table is also present in the directmap
+ *     whenever said map is present.
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
+ * region involved.
+ */
+
 #ifdef CONFIG_HAS_PDX
 
 extern unsigned long max_pdx;
@@ -13,22 +80,78 @@ extern unsigned long pfn_top_mask, ma_top_mask;
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
+ *   len+base=0x1B00042000
+ *
+ *   ought to return 0x000007FFFF, which implies that every bit position
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
+ * Creates the mask to start from when calculating non-compressible bits
+ *
+ * This function is intimately related to pdx_region_mask(), and together
+ * they are meant to calculate the mask of non-compressible bits given the
+ * current memory map.
+ *
+ * @param base_addr Address of the first maddr in the system
+ * @return An integer of the form 2^n - 1
+ */
+uint64_t pdx_init_mask(uint64_t base_addr);
+
+/**
+ * Mark [smfn, emfn) as accesible in the frame table
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
@@ -38,7 +161,16 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
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



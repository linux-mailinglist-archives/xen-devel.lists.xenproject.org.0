Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A676660E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571351.895005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINe-0007Eg-DF; Fri, 28 Jul 2023 07:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571351.895005; Fri, 28 Jul 2023 07:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINe-0007Cu-9r; Fri, 28 Jul 2023 07:59:22 +0000
Received: by outflank-mailman (input) for mailman id 571351;
 Fri, 28 Jul 2023 07:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINd-0006EL-03
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b0df59-2d1c-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 09:59:19 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3172144c084so1889023f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:19 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:17 -0700 (PDT)
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
X-Inumbo-ID: a7b0df59-2d1c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531158; x=1691135958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcWQ5zRXoU9dhWUyJ3dp40kLLDXm9GQitAHD/nVjJUI=;
        b=Ks75G9eIjp1DomfZ0l4x05OtEkPTL8zT/5QQwOE+sAJVVokWnoNz7GRNF5cf8j9TvG
         X7JVUY1XARLgnJ8OhmlMZZDlgkMQc08Bv3xfUo1qBFqp0haNCcaUVPqaGPkcjeytpkFh
         mDTpggK5CNr5TCejb3tlTSttIwdFPlTc1tLKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531158; x=1691135958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcWQ5zRXoU9dhWUyJ3dp40kLLDXm9GQitAHD/nVjJUI=;
        b=dHnKDZJV3hg7b2oxnW5d86mz1ayZ7khuNmyopsHpJEnS+ya4ko9gv2HHANdBohfrYV
         tm1O0FlfBFI2q3b+h2gSRNVkrrZyoC71U7Pbnb1Bg4BxRWQx5wqTrIleCCgxgE0NTUB0
         NclCSZ2XBeMPvI3qzXK7tfscheCrB6n1IjpFkFG09gjKPo652dLkeoEjn4A9XHPHyG56
         wIXFNwzdFvWNfU3aaqyx/OBDsNQCO3BoT56DRn/HLCUCUqgSvhB1bp3sCLWWPxZGZ15F
         YHlnO/k7mpj/kRgSxVxYoLURalfMQv6zxFG/W714xbbhn6n0GBcddTewexgQ+UjLEjiu
         3wOQ==
X-Gm-Message-State: ABy/qLbqf0t5IzpJhgd1ygvroyqOi0XHaNQi0w+pqQ9izogvwuejekY+
	f5uHLhPr9gY0mOmslxo7jVhNhuwgDCFZIEq58xZ9zA==
X-Google-Smtp-Source: APBJJlEySriUpv9Ig2e0yAVPhSQsFI8f3TbcqUN2hcrX6Cfyh406FH7C7doEfRI3AxpifZccvyOxiQ==
X-Received: by 2002:adf:ec86:0:b0:314:3b1f:8ea2 with SMTP id z6-20020adfec86000000b003143b1f8ea2mr1312456wrn.6.1690531158618;
        Fri, 28 Jul 2023 00:59:18 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/5] pdx: Reorder pdx.[ch]
Date: Fri, 28 Jul 2023 08:59:02 +0100
Message-Id: <20230728075903.7838-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next patch compiles out compression-related chunks, and it's helpful to
have them grouped together beforehand.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Fix rebase error by which some function prototypes were left intact
    when they should've been removed
---
 xen/common/pdx.c      | 58 +++++++++++++++++++++---------------------
 xen/include/xen/pdx.h | 59 ++++++++++++++++++++++---------------------
 2 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 3c88ceeb9c..d3d38965bd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -20,6 +20,35 @@
 #include <xen/bitops.h>
 #include <xen/nospec.h>
 
+/**
+ * Maximum (non-inclusive) usable pdx. Must be
+ * modifiable after init due to memory hotplug
+ */
+unsigned long __read_mostly max_pdx;
+
+unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
+    (FRAMETABLE_NR + PDX_GROUP_COUNT - 1) / PDX_GROUP_COUNT)] = { [0] = 1 };
+
+bool __mfn_valid(unsigned long mfn)
+{
+    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
+        return false;
+    return likely(!(mfn & pfn_hole_mask)) &&
+           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
+                           pdx_group_valid));
+}
+
+void set_pdx_range(unsigned long smfn, unsigned long emfn)
+{
+    unsigned long idx, eidx;
+
+    idx = pfn_to_pdx(smfn) / PDX_GROUP_COUNT;
+    eidx = (pfn_to_pdx(emfn - 1) + PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
+
+    for ( ; idx < eidx; ++idx )
+        __set_bit(idx, pdx_group_valid);
+}
+
 /*
  * Diagram to make sense of the following variables. The masks and shifts
  * are done on mfn values in order to convert to/from pdx:
@@ -47,12 +76,6 @@
  * ones.
  */
 
-/**
- * Maximum (non-inclusive) usable pdx. Must be
- * modifiable after init due to memory hotplug
- */
-unsigned long __read_mostly max_pdx;
-
 /** Mask for the lower non-compressible bits of an mfn */
 unsigned long __ro_after_init pfn_pdx_bottom_mask = ~0UL;
 
@@ -75,18 +98,6 @@ unsigned long __ro_after_init pfn_hole_mask = 0;
 /** Number of bits of the "compressible" bit slice of an mfn */
 unsigned int __ro_after_init pfn_pdx_hole_shift = 0;
 
-unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
-    (FRAMETABLE_NR + PDX_GROUP_COUNT - 1) / PDX_GROUP_COUNT)] = { [0] = 1 };
-
-bool __mfn_valid(unsigned long mfn)
-{
-    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
-        return false;
-    return likely(!(mfn & pfn_hole_mask)) &&
-           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
-                           pdx_group_valid));
-}
-
 /* Sets all bits from the most-significant 1-bit down to the LSB */
 static uint64_t fill_mask(uint64_t mask)
 {
@@ -124,17 +135,6 @@ uint64_t pdx_region_mask(uint64_t base, uint64_t len)
     return fill_mask(base ^ (base + len - 1));
 }
 
-void set_pdx_range(unsigned long smfn, unsigned long emfn)
-{
-    unsigned long idx, eidx;
-
-    idx = pfn_to_pdx(smfn) / PDX_GROUP_COUNT;
-    eidx = (pfn_to_pdx(emfn - 1) + PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
-
-    for ( ; idx < eidx; ++idx )
-        __set_bit(idx, pdx_group_valid);
-}
-
 void __init pfn_pdx_hole_setup(unsigned long mask)
 {
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 8c6aec2aea..5a82b6bde2 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -70,15 +70,41 @@
 #ifdef CONFIG_HAS_PDX
 
 extern unsigned long max_pdx;
-extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
-extern unsigned int pfn_pdx_hole_shift;
-extern unsigned long pfn_hole_mask;
-extern unsigned long pfn_top_mask, ma_top_mask;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
                          (sizeof(*frame_table) & -sizeof(*frame_table)))
 extern unsigned long pdx_group_valid[];
 
+/**
+ * Mark [smfn, emfn) as allocatable in the frame table
+ *
+ * @param smfn Start mfn
+ * @param emfn End mfn
+ */
+void set_pdx_range(unsigned long smfn, unsigned long emfn);
+
+/**
+ * Invoked to determine if an mfn has an associated valid frame table entry
+ *
+ * In order for it to be legal it must pass bounds, grouping and
+ * compression sanity checks.
+ *
+ * @param mfn To-be-checked mfn
+ * @return True iff all checks pass
+ */
+bool __mfn_valid(unsigned long mfn);
+
+#define page_to_pdx(pg)  ((pg) - frame_table)
+#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
+
+#define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
+#define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
+
+extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
+extern unsigned int pfn_pdx_hole_shift;
+extern unsigned long pfn_hole_mask;
+extern unsigned long pfn_top_mask, ma_top_mask;
+
 /**
  * Validate a region's compatibility with the current compression runtime
  *
@@ -120,28 +146,6 @@ uint64_t pdx_region_mask(uint64_t base, uint64_t len);
  */
 uint64_t pdx_init_mask(uint64_t base_addr);
 
-/**
- * Mark [smfn, emfn) as accesible in the frame table
- *
- * @param smfn Start mfn
- * @param emfn End mfn
- */
-void set_pdx_range(unsigned long smfn, unsigned long emfn);
-
-#define page_to_pdx(pg)  ((pg) - frame_table)
-#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
-
-/**
- * Invoked to determine if an mfn has an associated valid frame table entry
- *
- * In order for it to be legal it must pass bounds, grouping and
- * compression sanity checks.
- *
- * @param mfn To-be-checked mfn
- * @return True iff all checks pass
- */
-bool __mfn_valid(unsigned long mfn);
-
 /**
  * Map pfn to its corresponding pdx
  *
@@ -166,9 +170,6 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
            ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
 }
 
-#define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
-#define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
-
 /**
  * Computes the offset into the direct map of an maddr
  *
-- 
2.34.1



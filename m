Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56877773A54
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579785.907934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMF-00049S-V6; Tue, 08 Aug 2023 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579785.907934; Tue, 08 Aug 2023 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMF-000469-Nd; Tue, 08 Aug 2023 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 579785;
 Tue, 08 Aug 2023 13:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMME-0003uf-8Q
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:02:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa46d75-35eb-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:02:40 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe4b95c371so23264865e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:02:40 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d4acf000000b003144b50034esm13567072wrs.110.2023.08.08.06.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:02:38 -0700 (PDT)
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
X-Inumbo-ID: daa46d75-35eb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499759; x=1692104559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw5ydlPzexz1P1bvK3hrQOjcFc77zxXZqKmERgYMjHk=;
        b=RgIsn4uEOt+KjgK2T9EVYtD4z2FBCAK55OG2bEpL7qWYK1VEylPO8+JC7Uimb+w/h5
         c/pOGK8spbPUZmHBk+F7aBBQwcoxu5wTMqYgbk/rwbWOnrRaO7RCUyUUASKpmLfFOFLi
         +olC7T2HgdoQgeDjsW50FW/0s6DTYxVFf2Iqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499759; x=1692104559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw5ydlPzexz1P1bvK3hrQOjcFc77zxXZqKmERgYMjHk=;
        b=ifh0C4ftYhrYMhDioCqYR24WszCLUuquqfirScwa6I655qyZbzfchpX1ckCdtKep2Y
         FLK0sLuxJ7G7TJeuPXheDfl6pPo4MQ1lDv6/oOjFzPDOtlWPsEe19EmfgHs/WwxvhRAl
         39K1Zi6Lla+8O7VKwqyZxk3VFrMlhUsfB4Jk6Y9j8PbhgvoUjE1RP4s5wYbiaW9Upwd6
         IuFmoWN2fCK2+wIUethvCjrAWtkFY2cwOiroWb6R7AvFUtq4NHD/+TfnywgBYB+2eYD6
         QFpKwEA/nJMpqsbrIw8tgHRDA7lYXg7m8P80I95HO9bZBJ5TrB5QyBFx4IL4Ra5nENej
         MRBA==
X-Gm-Message-State: AOJu0Yy2/ZZMD7q5pV7NIeqlSBnMRvEtUC9T3S7o6wZYEBzVS+4y0RLa
	u3tX/u+iGfk2PTMf4s8snsOPyZ+H0N5a/O8M8F8=
X-Google-Smtp-Source: AGHT+IG5t63tS6JnlI7jLQBy9wATzP5e8eansQp2xZQ2UfnvSwZDyJeO9dhLA0qeSeJUwSS4AguJmA==
X-Received: by 2002:a05:600c:2212:b0:3fa:aeac:e978 with SMTP id z18-20020a05600c221200b003faaeace978mr8102633wml.0.1691499759057;
        Tue, 08 Aug 2023 06:02:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 3/4] pdx: Reorder pdx.[ch]
Date: Tue,  8 Aug 2023 14:02:19 +0100
Message-Id: <20230808130220.27891-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next patch compiles out compression-related chunks, and it's helpful to
have them grouped together beforehand.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
  * No changes
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
index 5674506f3a..b5367a33ca 100644
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



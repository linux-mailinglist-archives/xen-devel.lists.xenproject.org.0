Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB507568A5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564735.882438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh8-0003Zt-VZ; Mon, 17 Jul 2023 16:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564735.882438; Mon, 17 Jul 2023 16:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh8-0003Sr-KQ; Mon, 17 Jul 2023 16:03:30 +0000
Received: by outflank-mailman (input) for mailman id 564735;
 Mon, 17 Jul 2023 16:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh6-0002Zo-B9
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c48538-24bb-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 18:03:26 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fba74870abso7440332e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:26 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
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
X-Inumbo-ID: 76c48538-24bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609806; x=1692201806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgGX9V3xdVqjoBF9z1oNCiSxRVEcUKRWlOAV3af9M+4=;
        b=BNbG3GmEohiD+wkcErA+NgY75lkbwVbS38Sr2VrBTPEoBpQzxWm2irAT5/NNR58loy
         VVWQyPj/JrHX6BVI4DDkeX39jDBSk8Xm5uew71HUJi8cNb09gjRwGnzvSaJV66BSYtsm
         K0TUkLCyM6roQlTDVMYddaI90/ailSkcp5ouU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609806; x=1692201806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgGX9V3xdVqjoBF9z1oNCiSxRVEcUKRWlOAV3af9M+4=;
        b=Zl3p13GSvqSMARnDjBv+FkRr8kEjCSFOD29gQhA5Ah4vrkJGwsKjMicHdhJDxQk7HQ
         FBEIghyYHO2XIaVv9VXNt0FqKLcMT0a5LMrM4U0Cry2a+LkENJLHttL99dFht7gXskyB
         Xkdu0RzH6uqTpGOcvDQrd9vBExWQSEPCr+aILVUNlvLdM0jC96YH6lUhF3B6I6qJOUFH
         sMkhUZpDHStz4VwX6fumoaVIbLGcoFHfbztdb9bZA2JL5+DtUar2qnL9IdpXFcAfqEOp
         1SL3oCgImdh3LpG9ydFZGH6snTK9/X6QfY0TsNBB6EbzOndh5apKhf7vIhJ5Dg0JXx+Z
         BXMg==
X-Gm-Message-State: ABy/qLYaj8EbemCz/smQ1BjA9PT79cBOAE9X0G3BKztE7oF4Xm5nPcPU
	KEhZvXKq+IKnEXp/UTDzUWSymqC1U4JU0YeJnek=
X-Google-Smtp-Source: APBJJlFJxGwk4jlCMhmmUrOdLTtWrCITKqaYX+v7ey5mw1dcyCM/XhITGM6eD6gFd8eNs+sa/JQ8sQ==
X-Received: by 2002:a05:6512:711:b0:4fb:751a:98d5 with SMTP id b17-20020a056512071100b004fb751a98d5mr7144788lfs.18.1689609805885;
        Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 7/8] pdx: Reorder pdx.[ch]
Date: Mon, 17 Jul 2023 17:03:17 +0100
Message-Id: <20230717160318.2113-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next patch compiles out compression-related chunks, and it's helpful to
have them grouped together beforehand.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/pdx.c      | 58 +++++++++++++++++++++----------------------
 xen/include/xen/pdx.h | 37 +++++++++++++++++++++------
 2 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 72845e4bab..cc963a3cb3 100644
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
@@ -127,17 +138,6 @@ uint64_t pdx_region_mask(uint64_t base, uint64_t len)
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
index 5378e664c2..ce27177b56 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -68,15 +68,41 @@
  */
 
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
@@ -164,9 +190,6 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
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



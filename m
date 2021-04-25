Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353F36A91F
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117302.223119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8A-0001Sc-FV; Sun, 25 Apr 2021 20:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117302.223119; Sun, 25 Apr 2021 20:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8A-0001Rp-B0; Sun, 25 Apr 2021 20:13:26 +0000
Received: by outflank-mailman (input) for mailman id 117302;
 Sun, 25 Apr 2021 20:13:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal89-0001RJ-KT
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal89-0000o9-9c; Sun, 25 Apr 2021 20:13:25 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal89-0005m7-0v; Sun, 25 Apr 2021 20:13:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=LKWf7A+MF6uxi0Yzj4E+EHypbxoopwZaOMfIEc68W2U=; b=1SDMm0QKKs7ZTmqP/oyO5AZh9
	0OPJ6JkxMteNKRWqu9oagsX/IqwziRYQxxOGM+zopceh8gifGisQ16kLw7DSM1BBWXXCHBqUL/WzF
	PG9/sViCrlB0jH55Aa9+Sr5Vu6QiedEczvB96Tb6NYy7xL2yVOyb9zzQBanYC1wVznCQ4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to defined the Xen PT helpers
Date: Sun, 25 Apr 2021 21:13:05 +0100
Message-Id: <20210425201318.15447-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, Xen PT helpers are only working with 4KB page granularity
and open-code the generic helpers. To allow more flexibility, we can
re-use the generic helpers and pass Xen's page granularity
(PAGE_SHIFT).

As Xen PT helpers are used in both C and assembly, we need to move
the generic helpers definition outside of the !__ASSEMBLY__ section.

Note the aliases for each level are still kept for the time being so we
can avoid a massive patch to change all the callers.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/include/asm-arm/lpae.h | 71 +++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
index 4fb9a40a4ca9..310f5225e056 100644
--- a/xen/include/asm-arm/lpae.h
+++ b/xen/include/asm-arm/lpae.h
@@ -159,6 +159,17 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define lpae_get_mfn(pte)    (_mfn((pte).walk.base))
 #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
 
+/* Generate an array @var containing the offset for each level from @addr */
+#define DECLARE_OFFSETS(var, addr)          \
+    const unsigned int var[4] = {           \
+        zeroeth_table_offset(addr),         \
+        first_table_offset(addr),           \
+        second_table_offset(addr),          \
+        third_table_offset(addr)            \
+    }
+
+#endif /* __ASSEMBLY__ */
+
 /*
  * AArch64 supports pages with different sizes (4K, 16K, and 64K).
  * Provide a set of generic helpers that will compute various
@@ -190,17 +201,6 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
     (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
 
-/* Generate an array @var containing the offset for each level from @addr */
-#define DECLARE_OFFSETS(var, addr)          \
-    const unsigned int var[4] = {           \
-        zeroeth_table_offset(addr),         \
-        first_table_offset(addr),           \
-        second_table_offset(addr),          \
-        third_table_offset(addr)            \
-    }
-
-#endif /* __ASSEMBLY__ */
-
 /*
  * These numbers add up to a 48-bit input address space.
  *
@@ -211,26 +211,35 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
  * therefore 39-bits are sufficient.
  */
 
-#define LPAE_SHIFT      9
-#define LPAE_ENTRIES    (_AC(1,U) << LPAE_SHIFT)
-#define LPAE_ENTRY_MASK (LPAE_ENTRIES - 1)
-
-#define THIRD_SHIFT    (PAGE_SHIFT)
-#define THIRD_ORDER    (THIRD_SHIFT - PAGE_SHIFT)
-#define THIRD_SIZE     (_AT(paddr_t, 1) << THIRD_SHIFT)
-#define THIRD_MASK     (~(THIRD_SIZE - 1))
-#define SECOND_SHIFT   (THIRD_SHIFT + LPAE_SHIFT)
-#define SECOND_ORDER   (SECOND_SHIFT - PAGE_SHIFT)
-#define SECOND_SIZE    (_AT(paddr_t, 1) << SECOND_SHIFT)
-#define SECOND_MASK    (~(SECOND_SIZE - 1))
-#define FIRST_SHIFT    (SECOND_SHIFT + LPAE_SHIFT)
-#define FIRST_ORDER    (FIRST_SHIFT - PAGE_SHIFT)
-#define FIRST_SIZE     (_AT(paddr_t, 1) << FIRST_SHIFT)
-#define FIRST_MASK     (~(FIRST_SIZE - 1))
-#define ZEROETH_SHIFT  (FIRST_SHIFT + LPAE_SHIFT)
-#define ZEROETH_ORDER  (ZEROETH_SHIFT - PAGE_SHIFT)
-#define ZEROETH_SIZE   (_AT(paddr_t, 1) << ZEROETH_SHIFT)
-#define ZEROETH_MASK   (~(ZEROETH_SIZE - 1))
+#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
+#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
+#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
+
+#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
+#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
+#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
+#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
+
+/* Convenience aliases */
+#define THIRD_SHIFT         LEVEL_SHIFT(3)
+#define THIRD_ORDER         LEVEL_ORDER(3)
+#define THIRD_SIZE          LEVEL_SIZE(3)
+#define THIRD_MASK          LEVEL_MASK(3)
+
+#define SECOND_SHIFT        LEVEL_SHIFT(2)
+#define SECOND_ORDER        LEVEL_ORDER(2)
+#define SECOND_SIZE         LEVEL_SIZE(2)
+#define SECOND_MASK         LEVEL_MASK(2)
+
+#define FIRST_SHIFT         LEVEL_SHIFT(1)
+#define FIRST_ORDER         LEVEL_ORDER(1)
+#define FIRST_SIZE          LEVEL_SIZE(1)
+#define FIRST_MASK          LEVEL_MASK(1)
+
+#define ZEROETH_SHIFT       LEVEL_SHIFT(0)
+#define ZEROETH_ORDER       LEVEL_ORDER(0)
+#define ZEROETH_SIZE        LEVEL_SIZE(0)
+#define ZEROETH_MASK        LEVEL_MASK(0)
 
 /* Calculate the offsets into the pagetables for a given VA */
 #define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
-- 
2.17.1



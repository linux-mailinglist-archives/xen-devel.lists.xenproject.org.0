Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B2735C9E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 19:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551245.860708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFp-000412-GC; Mon, 19 Jun 2023 17:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551245.860708; Mon, 19 Jun 2023 17:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFp-0003yR-Bf; Mon, 19 Jun 2023 17:01:25 +0000
Received: by outflank-mailman (input) for mailman id 551245;
 Mon, 19 Jun 2023 17:01:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBIFo-0003qc-Bf
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 17:01:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFo-0002eo-42; Mon, 19 Jun 2023 17:01:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFn-00079R-Rf; Mon, 19 Jun 2023 17:01:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=SH8S9cGEeNkU74yrhDG+H2R2qeyKdQ/sIjdnJLK2qzg=; b=o3jppnO3+Xh0lCKXkbanOMK5CC
	0nCAYBYCBY5nm9HJj9yP4/yILVsRX56mIwBZAgRM36foyDYC7ZvjLIevSsbXWtmcGf8Q3xRF1tJfP
	/ihkAa+LZFlsUK9jFAC3ikARzweed4ExmVKuiqhgJNysd6dRmPS8Un3WVyxxX6jaTHLU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify the documentation
Date: Mon, 19 Jun 2023 18:01:12 +0100
Message-Id: <20230619170115.81398-5-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619170115.81398-1-julien@xen.org>
References: <20230619170115.81398-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The implementation of write_pte() is pretty much the same on arm32
and arm64. So it would be good to consolidate it as this would help
to clarify the requirements when using the helper.

Take the opportunity to switch from assembly to call macros. Note there
is a difference on arm32 because the option was not specified. But this
meant 'sy' (system wide).

Futhermore, the requirements for the ISB is incomplete. Per the Arm Arm,
(Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12), DSB will only
affect explicit accesses. So an ISB is necessary after DSB to ensure
the completion. Having an ISB after each update to the page-tables is
probably too much, so let the caller add the instruction when it is
convenient.

Lastly, the barrier in write_pte() may be too restrictive but I haven't
yet find the proper section(s) in the Arm Arm.

Signed-off-by: Julien Grall <jgrall@amazon.com>
----

I am a bit split on whether we should add an ISB in write_pte(). It
would make easier for the developper, but would likely force a pipeline
flush too often.

It might also be possible to drop the ISB (and even DSB) when updating
stage-2 PTE (Linux already does it, see 120798d2e7d1). But I am not sure
this is worth it in Xen.
---
 xen/arch/arm/include/asm/arm32/page.h | 16 ----------------
 xen/arch/arm/include/asm/arm64/page.h | 11 -----------
 xen/arch/arm/include/asm/page.h       | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/page.h b/xen/arch/arm/include/asm/arm32/page.h
index 715a9e4fef48..6d1ff0636ce3 100644
--- a/xen/arch/arm/include/asm/arm32/page.h
+++ b/xen/arch/arm/include/asm/arm32/page.h
@@ -3,22 +3,6 @@
 
 #ifndef __ASSEMBLY__
 
-/* Write a pagetable entry.
- *
- * If the table entry is changing a text mapping, it is responsibility
- * of the caller to issue an ISB after write_pte.
- */
-static inline void write_pte(lpae_t *p, lpae_t pte)
-{
-    asm volatile (
-        /* Ensure any writes have completed with the old mappings. */
-        "dsb;"
-        /* Safely write the entry (STRD is atomic on CPUs that support LPAE) */
-        "strd %0, %H0, [%1];"
-        "dsb;"
-        : : "r" (pte.bits), "r" (p) : "memory");
-}
-
 /* Inline ASM to invalidate dcache on register R (may be an inline asm operand) */
 #define __invalidate_dcache_one(R) STORE_CP32(R, DCIMVAC)
 
diff --git a/xen/arch/arm/include/asm/arm64/page.h b/xen/arch/arm/include/asm/arm64/page.h
index 0cba2663733b..4f58c0382adc 100644
--- a/xen/arch/arm/include/asm/arm64/page.h
+++ b/xen/arch/arm/include/asm/arm64/page.h
@@ -5,17 +5,6 @@
 
 #include <asm/alternative.h>
 
-/* Write a pagetable entry */
-static inline void write_pte(lpae_t *p, lpae_t pte)
-{
-    asm volatile (
-        /* Ensure any writes have completed with the old mappings. */
-        "dsb sy;"
-        "str %0, [%1];"         /* Write the entry */
-        "dsb sy;"
-        : : "r" (pte.bits), "r" (p) : "memory");
-}
-
 /* Inline ASM to invalidate dcache on register R (may be an inline asm operand) */
 #define __invalidate_dcache_one(R) "dc ivac, %" #R ";"
 
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index e7cd62190c7f..ea96983ab976 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -126,6 +126,7 @@
 #include <xen/errno.h>
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <asm/atomic.h>
 #include <asm/system.h>
 
 #if defined(CONFIG_ARM_32)
@@ -237,6 +238,22 @@ static inline int clean_and_invalidate_dcache_va_range
             : : "r" (_p), "m" (*_p));                                   \
 } while (0)
 
+/*
+ * Write a pagetable entry.
+ *
+ * It is the responsibility of the caller to issue an ISB (if a new entry)
+ * or a TLB flush (if modified or removed) after write_pte().
+ */
+static inline void write_pte(lpae_t *p, lpae_t pte)
+{
+    /* Ensure any writes have completed with the old mappings. */
+    dsb(sy);
+    /* Safely write the entry. This should always be an atomic write. */
+    write_atomic(p, pte);
+    dsb(sy);
+}
+
+
 /* Flush the dcache for an entire page. */
 void flush_page_to_ram(unsigned long mfn, bool sync_icache);
 
-- 
2.40.1



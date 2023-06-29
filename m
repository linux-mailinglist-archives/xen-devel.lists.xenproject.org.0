Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D469742E2A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557071.870114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzN-0005vB-37; Thu, 29 Jun 2023 20:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557071.870114; Thu, 29 Jun 2023 20:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzN-0005sp-0K; Thu, 29 Jun 2023 20:11:37 +0000
Received: by outflank-mailman (input) for mailman id 557071;
 Thu, 29 Jun 2023 20:11:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExzL-0005dv-EL
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 20:11:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzL-0006l4-7y; Thu, 29 Jun 2023 20:11:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzK-0000KI-Vw; Thu, 29 Jun 2023 20:11:35 +0000
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
	bh=M6dL6+xvQ08WsYJRT4gNYr41k53D+4zoHoNEXSx9M1c=; b=s9pmGW+Ymm5wP8Q1LWJeF6zT3u
	2YvTX51hdiRO9hoY/pkxfrIeVMSRGCCOwd3aakXWEe+4LOLZgqYD0B6Wxu9xoILsKQXWIH+6Ht+WG
	Q2vLD9CWYTlv/V3m7R+J4mJ+xsTiKkucOUnNbeZJ94XrhBkqBUcbKm9VrliD51Um1J/o=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Date: Thu, 29 Jun 2023 21:11:26 +0100
Message-Id: <20230629201129.12934-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629201129.12934-1-julien@xen.org>
References: <20230629201129.12934-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, we are mapping the size of the reserved area for Xen
(i.e. 2MB) even if the binary is smaller. We don't exactly know what's
after Xen, so it is not a good idea to map more than necessary for a
couple of reasons:
    * We would need to use break-before-make if the extra PTE needs to
      be updated to point to another region
    * The extra area mapped may be mapped again by Xen with different
      memory attribute. This would result to attribute mismatch.

Therefore, rework the logic in create_page_tables() to map only what's
necessary. To simplify the logic, we also want to make sure _end
is page-aligned. So align the symbol in the linker and add an assert
to catch any change.

Lastly, take the opportunity to confirm that _start is equal to
XEN_VIRT_START as the assembly is using both interchangeably.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v2:
        - Fix typo and coding style
        - Check _start == XEN_VIRT_START
---
 xen/arch/arm/arm64/head.S | 15 ++++++++++++++-
 xen/arch/arm/xen.lds.S    |  9 +++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index c0e03755bb10..5e9562a22240 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -572,6 +572,19 @@ create_page_tables:
         create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
         create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
 
+        /*
+         * Find the size of Xen in pages and multiply by the size of a
+         * PTE. This will then be compared in the mapping loop below.
+         *
+         * Note the multiplication is just to avoid using an extra
+         * register/instruction per iteration.
+         */
+        ldr   x0, =_start            /* x0 := vaddr(_start) */
+        ldr   x1, =_end              /* x1 := vaddr(_end) */
+        sub   x0, x1, x0             /* x0 := effective size of Xen */
+        lsr   x0, x0, #PAGE_SHIFT    /* x0 := Number of pages for Xen */
+        lsl   x0, x0, #3             /* x0 := Number of pages * PTE size */
+
         /* Map Xen */
         adr_l x4, boot_third
 
@@ -585,7 +598,7 @@ create_page_tables:
 1:      str   x2, [x4, x1]           /* Map vaddr(start) */
         add   x2, x2, #PAGE_SIZE     /* Next page */
         add   x1, x1, #8             /* Next slot */
-        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
+        cmp   x1, x0                 /* Loop until we map all of Xen */
         b.lt  1b
 
         /*
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d36b67708ab1..a3c90ca82316 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -212,6 +212,7 @@ SECTIONS
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
+  . = ALIGN(PAGE_SIZE);
   _end = . ;
 
   /* Section for the device tree blob (if any). */
@@ -226,6 +227,12 @@ SECTIONS
   ELF_DETAILS_SECTIONS
 }
 
+/*
+ * The assembly code use _start and XEN_VIRT_START interchangeably to
+ * match the context.
+ */
+ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
+
 /*
  * We require that Xen is loaded at a page boundary, so this ensures that any
  * code running on the identity map cannot cross a section boundary.
@@ -241,4 +248,6 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
 ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
 ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
+/* To simplify the logic in head.S, we want to _end to be page aligned */
+ASSERT(IS_ALIGNED(_end,             PAGE_SIZE), "_end is not page aligned")
 ASSERT((_end - _start) <= XEN_VIRT_SIZE, "Xen is too big")
-- 
2.40.1



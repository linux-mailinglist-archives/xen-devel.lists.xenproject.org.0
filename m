Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3E4D2DDA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287731.487894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNp-0007jf-Aq; Wed, 09 Mar 2022 11:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287731.487894; Wed, 09 Mar 2022 11:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNp-0007fE-73; Wed, 09 Mar 2022 11:21:33 +0000
Received: by outflank-mailman (input) for mailman id 287731;
 Wed, 09 Mar 2022 11:21:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNo-0007Kl-1H
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNn-0002kV-Jy; Wed, 09 Mar 2022 11:21:31 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNn-0004wn-CE; Wed, 09 Mar 2022 11:21:31 +0000
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
	bh=dYgEWr81tlTzWi28Pdn1NFHJfMGO9dd29hy4ZTHlKlQ=; b=nCGiFSchNCffHryZ9zn6E4ovmE
	qeyTdgG1TVW0VfYQcAHo5MD0Baz2sqTtvX87CZV9WBcOcrmiTBZFPN7U4bF0i2yihphkS6o1t0w4K
	P4MJtr7CjEeAOW124yqnZTiSU0thzSEtvEg+Yr7GQKX5L1ebFV6OZhlg8ocgVdrrHEUc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
Date: Wed,  9 Mar 2022 11:20:45 +0000
Message-Id: <20220309112048.17377-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309112048.17377-1-julien@xen.org>
References: <20220309112048.17377-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Xen is currently not fully compliant with the Arm because it will
switch the TTBR with the MMU on.

In order to be compliant, we need to disable the MMU before
switching the TTBR. The implication is the page-tables should
contain an identity mapping of the code switching the TTBR.

If we don't rework the memory layout, we would need to find a
virtual address that matches a physical address and doesn't clash
with the static virtual regions. This can be a bit tricky.

On arm64, the memory layout  has plenty of unused space. In most of
the case we expect Xen to be loaded in low memory.

The memory layout is reshuffled to keep the 0th slot free. Xen will now
be loaded at (512GB + 2MB). This requires a slight tweak of the boot
code as XEN_VIRT_START cannot be used as an immediate.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    TODO:
        - I vaguely recall that one of the early platform we supported add
          the memory starting in high memory (> 1TB). I need to check
          whether the new layout will be fine.
        - Update the documentation to reflect the new layout
---
 xen/arch/arm/arm64/head.S         |  3 ++-
 xen/arch/arm/include/asm/config.h | 20 ++++++++++++++------
 xen/arch/arm/mm.c                 | 14 +++++++-------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 66d862fc8137..878649280d73 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -594,7 +594,8 @@ create_page_tables:
          * need an additional 1:1 mapping, the virtual mapping will
          * suffice.
          */
-        cmp   x19, #XEN_VIRT_START
+        ldr   x0, =XEN_VIRT_START
+        cmp   x19, x0
         bne   1f
         ret
 1:
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 5db28a8dbd56..b2f31a914103 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -107,8 +107,20 @@
  *  Unused
  */
 
+#ifdef CONFIG_ARM_32
+
 #define COMMON_VIRT_START       _AT(vaddr_t, 0)
 
+#else
+
+#define SLOT0_ENTRY_BITS  39
+#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
+#define SLOT0_ENTRY_SIZE  SLOT0(1)
+
+#define COMMON_VIRT_START       SLOT(1)
+
+#endif
+
 #define XEN_VIRT_START          (COMMON_VIRT_START + MB(2))
 #define XEN_SLOT_SIZE           MB(2)
 #define XEN_VIRT_END            (XEN_VIRT_START + XEN_SLOT_SIZE)
@@ -161,14 +173,10 @@
 
 #else /* ARM_64 */
 
-#define SLOT0_ENTRY_BITS  39
-#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
-#define SLOT0_ENTRY_SIZE  SLOT0(1)
-
-#define VMAP_VIRT_START  GB(1)
+#define VMAP_VIRT_START  (SLOT0(1) + GB(1))
 #define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
 
-#define FRAMETABLE_VIRT_START  GB(32)
+#define FRAMETABLE_VIRT_START  (SLOT0(1) + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6b7c41d827ca..75ed9a3ce249 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -187,11 +187,10 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
 #endif
     /* Page table structure constraints */
-#ifdef CONFIG_ARM_64
-    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
-#endif
     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
+#ifdef CONFIG_ARM_32
     BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= XEN_PT_LPAE_ENTRIES);
+#endif
 #ifdef CONFIG_DOMAIN_PAGE
     BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
 #endif
@@ -611,10 +610,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     phys_offset = boot_phys_offset;
 
 #ifdef CONFIG_ARM_64
-    p = (void *) xen_pgtable;
-    p[0] = pte_of_xenaddr((uintptr_t)xen_first);
-    p[0].pt.table = 1;
-    p[0].pt.xn = 0;
+    pte = pte_of_xenaddr((uintptr_t)xen_first);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
+
     p = (void *) xen_first;
 #else
     p = (void *) cpu0_pgtable;
-- 
2.32.0



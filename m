Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E357BDFD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372154.604014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh2-0003lG-7U; Wed, 20 Jul 2022 18:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372154.604014; Wed, 20 Jul 2022 18:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh2-0003hx-2M; Wed, 20 Jul 2022 18:45:08 +0000
Received: by outflank-mailman (input) for mailman id 372154;
 Wed, 20 Jul 2022 18:45:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEh0-0003Zu-2Q
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:45:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEgz-00077P-Ia; Wed, 20 Jul 2022 18:45:05 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEgz-000309-AI; Wed, 20 Jul 2022 18:45:05 +0000
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
	bh=hYBserRHCKnxjEBZbsMua2qzdvwsIdV+2glCDCaTlZQ=; b=XdW7vqYlbVh26LBYfdiQxTq3rk
	6GHrE0ZwYKd8nwVfpe/XwbcyPC5YwYI/TxYGxhRNEKCradEp3S6BPzZDjNkgnE6StTutfhnEipk3m
	HSrfNl0TIRhVu0RmI7mwdESxZ+gyfRjSjPJ7V0t1SHEV7s7qCD19rC5i11VGQk+V9n9g=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/5] xen/arm: Remove most of the *_VIRT_END defines
Date: Wed, 20 Jul 2022 19:44:55 +0100
Message-Id: <20220720184459.51582-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
References: <20220720184459.51582-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, *_VIRT_END may either point to the address after the end
or the last address of the region.

The lack of consistency make quite difficult to reason with them.

Furthermore, there is a risk of overflow in the case where the address
points past to the end. I am not aware of any cases, so this is only a
latent bug.

Start to solve the problem by removing all the *_VIRT_END exclusively used
by the Arm code and add *_VIRT_SIZE when it is not present.

Take the opportunity to rename BOOT_FDT_SLOT_SIZE to BOOT_FDT_VIRT_SIZE
for better consistency and use _AT(vaddr_t, ).

Also take the opportunity to fix the coding style of the comment touched
in mm.c.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I noticed that a few functions in Xen expect [start, end[. This is risky
as we may end up with end < start if the region is defined right at the
top of the address space.

I haven't yet tackle this issue. But I would at least like to get rid
of *_VIRT_END.

This was originally sent separately (lets call it v0).

    Changes in v2:
        - Correct the check in domain_page_map_to_mfn()

    Changes in v1:
        - Mention the coding style change.
---
 xen/arch/arm/include/asm/config.h | 18 ++++++++----------
 xen/arch/arm/livepatch.c          |  2 +-
 xen/arch/arm/mm.c                 | 13 ++++++++-----
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 3e2a55a91058..66db618b34e7 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -111,12 +111,11 @@
 #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
 
 #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
-#define BOOT_FDT_SLOT_SIZE     MB(4)
-#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
+#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
 
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
-#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
+#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
 #endif
 
 #define HYPERVISOR_VIRT_START  XEN_VIRT_START
@@ -132,18 +131,18 @@
 #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
 
 #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
+#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
 
 #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
-#define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
-#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
-#define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
+#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
 
-#define VMAP_VIRT_END    XENHEAP_VIRT_START
+#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
+#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
 
 #define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
 
 /* Number of domheap pagetable pages required at the second level (2MB mappings) */
-#define DOMHEAP_SECOND_PAGES ((DOMHEAP_VIRT_END - DOMHEAP_VIRT_START + 1) >> FIRST_SHIFT)
+#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
 
 #else /* ARM_64 */
 
@@ -152,12 +151,11 @@
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
 #define VMAP_VIRT_START  GB(1)
-#define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
+#define VMAP_VIRT_SIZE   GB(1)
 
 #define FRAMETABLE_VIRT_START  GB(32)
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
 
 #define DIRECTMAP_VIRT_START   SLOT0(256)
 #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 75e8adcfd6a1..57abc746e60b 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -175,7 +175,7 @@ void __init arch_livepatch_init(void)
     void *start, *end;
 
     start = (void *)LIVEPATCH_VMAP_START;
-    end = (void *)LIVEPATCH_VMAP_END;
+    end = start + LIVEPATCH_VMAP_SIZE;
 
     vm_init_type(VMAP_XEN, start, end);
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 56fd0845861f..0177bc6b34d2 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
 /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
 static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
 #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
-/* xen_dommap == pages used by map_domain_page, these pages contain
+/*
+ * xen_dommap == pages used by map_domain_page, these pages contain
  * the second level pagetables which map the domheap region
- * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
+ * starting at DOMHEAP_VIRT_START in 2MB chunks.
+ */
 static DEFINE_PER_CPU(lpae_t *, xen_dommap);
 /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
 static DEFINE_PAGE_TABLE(cpu0_pgtable);
@@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
     int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
     unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
 
-    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
+    if ( (va >= VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE) )
         return virt_to_mfn(va);
 
     ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
@@ -570,7 +572,8 @@ void __init remove_early_mappings(void)
     int rc;
 
     /* destroy the _PAGE_BLOCK mapping */
-    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
+    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
+                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
                              _PAGE_BLOCK);
     BUG_ON(rc);
 }
@@ -850,7 +853,7 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
 
 void *__init arch_vmap_virt_end(void)
 {
-    return (void *)VMAP_VIRT_END;
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
 
 /*
-- 
2.32.0



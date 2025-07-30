Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A3B15AE2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 10:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063531.1429245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Rg-0007Vd-BR; Wed, 30 Jul 2025 08:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063531.1429245; Wed, 30 Jul 2025 08:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Rg-0007Sf-8d; Wed, 30 Jul 2025 08:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1063531;
 Wed, 30 Jul 2025 08:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUWP=2L=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uh2Rf-0006zM-7H
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 08:45:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9a72fa0e-6d21-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 10:45:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2C8A1515;
 Wed, 30 Jul 2025 01:45:45 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.73.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 439EB3F66E;
 Wed, 30 Jul 2025 01:45:52 -0700 (PDT)
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
X-Inumbo-ID: 9a72fa0e-6d21-11f0-a320-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
Date: Wed, 30 Jul 2025 09:45:31 +0100
Message-ID: <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1753864612.git.hari.limaye@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement `setup_mm` for MPU systems. This variant doesn't need to set
up the direct map.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
 xen/arch/arm/mpu/mm.c | 64 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 6a16fa348d..0b05103180 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -8,9 +8,12 @@
 #include <xen/sizes.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
+#include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
 #include <asm/page.h>
+#include <asm/setup.h>
 #include <asm/sysregs.h>
 
 struct page_info *frame_table;
@@ -364,9 +367,68 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
     return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
 }
 
+/*
+ * Heap must be statically configured in Device Tree through "xen,static-heap"
+ * on MPU systems.
+ */
+static void __init setup_staticheap_mappings(void)
+{
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    unsigned int bank = 0;
+
+    for ( ; bank < reserved_mem->nr_banks; bank++ )
+    {
+        if ( reserved_mem->bank[bank].type == MEMBANK_STATIC_HEAP )
+        {
+            paddr_t bank_start = round_pgup(reserved_mem->bank[bank].start);
+            paddr_t bank_size = round_pgdown(reserved_mem->bank[bank].size);
+            paddr_t bank_end = bank_start + bank_size;
+
+            /* Map static heap with one MPU protection region */
+            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
+                panic("Failed to map static heap\n");
+
+            break;
+        }
+    }
+
+    if ( bank == reserved_mem->nr_banks )
+        panic("No static heap memory bank found\n");
+}
+
 void __init setup_mm(void)
 {
-    BUG_ON("unimplemented");
+    const struct membanks *mem = bootinfo_get_mem();
+    paddr_t ram_start = INVALID_PADDR, ram_end = 0, ram_size = 0;
+
+    if ( !mem->nr_banks )
+        panic("No memory bank\n");
+
+    init_pdx();
+
+    populate_boot_allocator();
+
+    total_pages = 0;
+    for ( unsigned int bank = 0 ; bank < mem->nr_banks; bank++ )
+    {
+        paddr_t bank_start = round_pgup(mem->bank[bank].start);
+        paddr_t bank_size = round_pgdown(mem->bank[bank].size);
+        paddr_t bank_end = bank_start + bank_size;
+
+        ram_size = ram_size + bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end = max(ram_end, bank_end);
+    }
+
+    setup_staticheap_mappings();
+
+    total_pages += ram_size >> PAGE_SHIFT;
+    max_page = PFN_DOWN(ram_end);
+
+    setup_frametable_mappings(ram_start, ram_end);
+
+    init_staticmem_pages();
+    init_sharedmem_pages();
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F91C4CDC00
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284409.483685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU5-0002W8-K5; Fri, 04 Mar 2022 18:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284409.483685; Fri, 04 Mar 2022 18:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU5-0002Mr-7n; Fri, 04 Mar 2022 18:16:57 +0000
Received: by outflank-mailman (input) for mailman id 284409;
 Fri, 04 Mar 2022 17:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC22-0005R5-Kj
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:47:58 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384e0956-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:55 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC1y-0008PH-8A; Fri, 04 Mar 2022 18:47:54 +0100
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
X-Inumbo-ID: 384e0956-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 02/36] Revert "xen/arm: mm: Initialize page-tables earlier"
Date: Fri,  4 Mar 2022 18:46:27 +0100
Message-Id: <20220304174701.1453977-3-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This reverts commit 3a5d341681af650825bbe3bee9be5d187da35080.

The coloring support  will be configurable within the Xen command line
but it will be initialized before the page-tables; this is necessary
for coloring the hypervisor itself beacuse we will create a specific
mapping for it that could be configured using some options.
In order to parse all the needed information from the device tree, we
need to revert the above commit and restore the previous order for
page-tables initialization.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
---
 xen/arch/arm/mm.c    | 11 +++++++++--
 xen/arch/arm/setup.c |  4 ++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b1eae767c2..e6381e46e6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -551,6 +551,7 @@ static inline lpae_t pte_of_xenaddr(vaddr_t va)
     return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
 }
 
+/* Map the FDT in the early boot page table */
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* We are using 2MB superpage for mapping the FDT */
@@ -573,7 +574,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     /* The FDT is mapped using 2MB superpage */
     BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
 
-    create_mappings(xen_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
+    create_mappings(boot_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
                     SZ_2M >> PAGE_SHIFT, SZ_2M);
 
     offset = fdt_paddr % SECOND_SIZE;
@@ -588,7 +589,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     if ( (offset + size) > SZ_2M )
     {
-        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
+        create_mappings(boot_second, BOOT_FDT_VIRT_START + SZ_2M,
                         paddr_to_pfn(base_paddr + SZ_2M),
                         SZ_2M >> PAGE_SHIFT, SZ_2M);
     }
@@ -699,6 +700,12 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
+    /* ... DTB */
+    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
+    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] = pte;
+    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
+    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;
+
 #ifdef CONFIG_ARM_64
     ttbr = (uintptr_t) xen_pgtable + phys_offset;
 #else
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c5a556855e..100b322b3e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -877,8 +877,6 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -900,6 +898,8 @@ void __init start_xen(unsigned long boot_phys_offset,
                              (paddr_t)(uintptr_t)(_end - _start + 1), false);
     BUG_ON(!xen_bootmodule);
 
+    setup_pagetables(boot_phys_offset);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.30.2



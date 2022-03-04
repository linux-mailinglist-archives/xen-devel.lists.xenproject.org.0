Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1FF4CDC11
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284440.483831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUT-0007V1-91; Fri, 04 Mar 2022 18:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284440.483831; Fri, 04 Mar 2022 18:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUR-0006zY-Nd; Fri, 04 Mar 2022 18:17:19 +0000
Received: by outflank-mailman (input) for mailman id 284440;
 Fri, 04 Mar 2022 17:48:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2I-0005R4-OZ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:14 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c46fe5-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:14 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2H-0000Av-9l; Fri, 04 Mar 2022 18:48:13 +0100
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
X-Inumbo-ID: 43c46fe5-9be3-11ec-8eba-a37418f5ba1a
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
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 26/36] xen/arm: add argument to remove_early_mappings
Date: Fri,  4 Mar 2022 18:46:51 +0100
Message-Id: <20220304174701.1453977-27-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Upcoming patches will need to remove temporary mappings created during
Xen coloring process. The function remove_early_mappings does what we
need but it is case-specific. Parametrize the function to avoid code
replication.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Acked-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/include/asm/mm.h | 2 +-
 xen/arch/arm/mm.c             | 8 ++++----
 xen/arch/arm/setup.c          | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 9ac1767595..041ec4ee70 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -184,7 +184,7 @@ extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
-extern void remove_early_mappings(void);
+extern void remove_early_mappings(unsigned long va, unsigned long size);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index fd7a313d88..d69f18b5d2 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -597,13 +597,13 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     return fdt_virt;
 }
 
-void __init remove_early_mappings(void)
+void __init remove_early_mappings(unsigned long va, unsigned long size)
 {
     lpae_t pte = {0};
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
+    write_pte(xen_second + second_table_offset(va), pte);
+    write_pte(xen_second + second_table_offset(va + size),
               pte);
-    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
+    flush_xen_tlb_range_va(va, size);
 }
 
 /*
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 8d980ce18d..13b10515a8 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -41,6 +41,7 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/acpi.h>
 #include <xen/warning.h>
+#include <xen/sizes.h>
 #include <asm/alternative.h>
 #include <asm/page.h>
 #include <asm/current.h>
@@ -426,7 +427,7 @@ void __init discard_initial_modules(void)
 
     mi->nr_mods = 0;
 
-    remove_early_mappings();
+    remove_early_mappings(BOOT_FDT_VIRT_START, SZ_2M);
 }
 
 /* Relocate the FDT in Xen heap */
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F77A5DE6E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910346.1317156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWQ-0000jV-IG; Wed, 12 Mar 2025 13:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910346.1317156; Wed, 12 Mar 2025 13:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWQ-0000d1-Bv; Wed, 12 Mar 2025 13:53:22 +0000
Received: by outflank-mailman (input) for mailman id 910346;
 Wed, 12 Mar 2025 13:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWO-0007NP-9v
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5a25673b-ff49-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 14:53:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB751595;
 Wed, 12 Mar 2025 06:53:28 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3F23F5A1;
 Wed, 12 Mar 2025 06:53:16 -0700 (PDT)
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
X-Inumbo-ID: 5a25673b-ff49-11ef-9898-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more generic name
Date: Wed, 12 Mar 2025 13:52:56 +0000
Message-Id: <20250312135258.1815706-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the setup_pagetables function to setup_mappings in
order to be implemented also for MPU system that does not
have page tables.

Introduce a stub implementation for MPU in order to allow
the compilation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mm.h |  2 +-
 xen/arch/arm/mmu/setup.c      |  2 +-
 xen/arch/arm/mpu/Makefile     |  1 +
 xen/arch/arm/mpu/setup.c      | 18 ++++++++++++++++++
 xen/arch/arm/setup.c          |  6 +++---
 5 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/mpu/setup.c

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index c96d33aceaf0..9bf5c846c86c 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -206,7 +206,7 @@ extern unsigned long frametable_base_pdx;
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
-extern void setup_pagetables(void);
+extern void setup_mappings(void);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe9778194..35ffa5479dd3 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -354,7 +354,7 @@ static void __init create_llc_coloring_mappings(void)
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
  */
-void __init setup_pagetables(void)
+void __init setup_mappings(void)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index b18cec483671..04df0b2ee760 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1 +1,2 @@
 obj-y += mm.o
+obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
new file mode 100644
index 000000000000..45214bfeb661
--- /dev/null
+++ b/xen/arch/arm/mpu/setup.c
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+
+void __init setup_mappings(void)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ffcae900d72e..4c9ed747f9a8 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -338,10 +338,10 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     llc_coloring_init();
 
     /*
-     * Page tables must be setup after LLC coloring initialization because
-     * coloring info are required in order to create colored mappings
+     * On MMU, page tables must be setup after LLC coloring initialization
+     * because coloring info are required in order to create colored mappings
      */
-    setup_pagetables();
+    setup_mappings();
     /* Device-tree was mapped in boot page tables, remap it in the new tables */
     device_tree_flattened = early_fdt_map(fdt_paddr);
 
-- 
2.34.1



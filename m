Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4AF73D660
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554962.866473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0g-0000fe-45; Mon, 26 Jun 2023 03:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554962.866473; Mon, 26 Jun 2023 03:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0g-0000cM-07; Mon, 26 Jun 2023 03:35:26 +0000
Received: by outflank-mailman (input) for mailman id 554962;
 Mon, 26 Jun 2023 03:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0e-0007ej-74
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7b18fd6d-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9401FB;
 Sun, 25 Jun 2023 20:36:06 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A98723F64C;
 Sun, 25 Jun 2023 20:35:19 -0700 (PDT)
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
X-Inumbo-ID: 7b18fd6d-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 05/52] xen/arm64: head: Introduce enable_boot_mmu and enable_runtime_mmu
Date: Mon, 26 Jun 2023 11:33:56 +0800
Message-Id: <20230626033443.2943270-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

At the moment, on MMU system, enable_mmu() will return to an
address in the 1:1 mapping, then each path is responsible to
switch to virtual runtime mapping. Then remove_identity_mapping()
is called to remove all 1:1 mapping.

Since remove_identity_mapping() is not necessary on Non-MMU system,
and we also avoid creating empty function for Non-MMU system, trying
to keep only one codeflow in arm64/head.S, we move path switch and
remove_identity_mapping() in enable_mmu() on MMU system.

As the remove_identity_mapping should only be called for the boot
CPU only, so we introduce enable_boot_mmu for boot CPU and
enable_runtime_mmu for secondary CPUs in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/arm64/head.S | 87 +++++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 10a07db428..4dfbe0bc6f 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -314,21 +314,12 @@ real_start_efi:
 
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
-        load_paddr x0, boot_pgtable
-        bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =primary_switched
-        br    x0
+        ldr   lr, =primary_switched
+        b     enable_boot_mmu
+
 primary_switched:
-        /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to
-         * avoid having to worry about replacing existing mapping
-         * afterwards.
-         */
-        bl    remove_identity_mapping
         bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -373,13 +364,11 @@ GLOBAL(init_secondary)
 #endif
         bl    check_cpu_mode
         bl    cpu_init
-        load_paddr x0, init_ttbr
-        ldr   x0, [x0]
-        bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =secondary_switched
-        br    x0
+        ldr   lr, =secondary_switched
+        b     enable_runtime_mmu
+
 secondary_switched:
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -694,6 +683,70 @@ enable_mmu:
         ret
 ENDPROC(enable_mmu)
 
+/*
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+enable_runtime_mmu:
+        mov   x5, lr
+
+        load_paddr x0, init_ttbr
+        ldr   x0, [x0]
+
+        bl    enable_mmu
+        mov   lr, x5
+
+        /* return to secondary_switched */
+        ret
+ENDPROC(enable_runtime_mmu)
+
+/*
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+enable_boot_mmu:
+        mov   x5, lr
+
+        bl    create_page_tables
+        load_paddr x0, boot_pgtable
+
+        bl    enable_mmu
+        mov   lr, x5
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        ldr   x0, =1f
+        br    x0
+1:
+        /*
+         * The 1:1 map may clash with other parts of the Xen virtual memory
+         * layout. As it is not used anymore, remove it completely to
+         * avoid having to worry about replacing existing mapping
+         * afterwards. Function will return to primary_switched.
+         */
+        b     remove_identity_mapping
+
+        /*
+         * Here might not be reached, as "ret" in remove_identity_mapping
+         * will use the return address in LR in advance. But keep ret here
+         * might be more safe if "ret" in remove_identity_mapping is removed
+         * in future.
+         */
+        ret
+ENDPROC(enable_boot_mmu)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1



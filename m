Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD687C50C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693511.1081680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMt-0000BB-RM; Thu, 14 Mar 2024 22:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693511.1081680; Thu, 14 Mar 2024 22:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMt-0008UV-OU; Thu, 14 Mar 2024 22:16:07 +0000
Received: by outflank-mailman (input) for mailman id 693511;
 Thu, 14 Mar 2024 22:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMs-0008HV-Q3
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72dc1d32-e250-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 23:16:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F1101828673E;
 Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PsppJZOTuu59; Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3AF578286A4B;
 Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tgjB4xl8g7Ku; Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BA7988286CDC;
 Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
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
X-Inumbo-ID: 72dc1d32-e250-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3AF578286A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454561; bh=ImWiIfCHbaewHCZffKSjHa8JvgXFPUKjK9FnpBwpojM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=gaVilxusz+uoUP3SZd87R5ePrtO3uSDmeGW6+2ItIMFg5fe9LIdtDsfPPX29ELf36
	 jezQawQXoEsi4jiOmdrPxkZlJJrcUpBs2BMjIamka1RRn0gmW4mv5+HaT+KdoHkFFP
	 NQY7f8pC6SCN2L+EhqCCqpNs6dimIFGQjmE0YEtY=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 7/9] xen/ppc: Enable bootfdt and boot allocator
Date: Thu, 14 Mar 2024 17:15:45 -0500
Message-Id: <adebcaa145af5e3de7fba07dc84b0993866e98ac.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Enable usage of bootfdt for populating the boot info struct from the
firmware-provided device tree.  Also enable the Xen boot page allocator.

Includes minor changes to bootfdt.c's boot_fdt_info() to tolerate the
scenario in which the FDT overlaps a reserved memory region, as is the
case on PPC when booted directly from skiboot.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/setup.h |  5 +++++
 xen/arch/ppc/setup.c             | 21 ++++++++++++++++++++-
 xen/common/device-tree/bootfdt.c | 11 +++++++++--
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index 1b2d29c5b6..fe27f61fc3 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -115,4 +115,9 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
 struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
 void populate_boot_allocator(void);
 
+/*
+ * bootfdt.c
+ */
+size_t boot_fdt_info(const void *fdt, paddr_t paddr);
+
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 101bdd8bb6..946167a56f 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,12 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
 #include <asm/mm.h>
 #include <asm/processor.h>
+#include <asm/setup.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
@@ -24,6 +26,9 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    void *boot_fdt;
+    struct bootmodule *xen_bootmodule;
+
     if ( r5 )
     {
         /* Unsupported OpenFirmware boot protocol */
@@ -32,11 +37,25 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
     else
     {
         /* kexec boot protocol */
-        boot_opal_init((void *)r3);
+        boot_fdt = (void *)r3;
+        boot_opal_init(boot_fdt);
     }
 
     setup_exceptions();
 
+    device_tree_flattened = boot_fdt;
+    boot_fdt_info(boot_fdt, r3);
+
+    /*
+     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
+     * the kernel module.
+     */
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN, __pa(_start),
+                                     PAGE_ALIGN(__pa(_end)), false);
+    BUG_ON(!xen_bootmodule);
+
+    populate_boot_allocator();
+
     setup_initial_pagetables();
 
     early_printk("Hello, ppc64le!\n");
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 35dbdf3384..1985648b31 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -543,12 +543,19 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     if ( ret < 0 )
         panic("No valid device tree\n");
 
-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
     ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
     if ( ret )
         panic("Early FDT parsing failed (%d)\n", ret);
 
+    /*
+     * Add module for the FDT itself after the device tree has been parsed. This
+     * is required on ppc64le where the device tree passed to Xen may have been
+     * allocated by skiboot, in which case it will exist within a reserved
+     * region and this call will fail. This is fine, however, since either way
+     * the allocator will know not to step on the device tree.
+     */
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5475B8A2492
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 05:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704319.1100684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80r-0004T7-3A; Fri, 12 Apr 2024 03:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704319.1100684; Fri, 12 Apr 2024 03:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80q-0004ME-S5; Fri, 12 Apr 2024 03:55:40 +0000
Received: by outflank-mailman (input) for mailman id 704319;
 Fri, 12 Apr 2024 03:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv80p-0003cg-4w
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 03:55:39 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84322b76-f880-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 05:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F0A6D828703A;
 Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SYBZZGVPgQS8; Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3C9488287026;
 Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wNLJwx4J2Rdd; Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C98908285A02;
 Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
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
X-Inumbo-ID: 84322b76-f880-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3C9488287026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712894134; bh=eg1UVmj1RCeFzD5J2HKUl3hljqZ0KApTIh1L8o/IKLs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Vjot6yvEsM8vakaSq49ltR7MBPmmnNkRLFqDeRxVGKgjgxv47slVKl3JxqPc0Wfa8
	 LIW7XCRVSzA/pfcskXtOhbecYxB6PK217oZihc2AcB0yuDoFXblvo4lvYNZoskKmdu
	 wK5RPp86hxlDqvvfzWdvId4RopPqXNXmhUwDUJ5U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/6] xen/ppc: Enable bootfdt and boot allocator
Date: Thu, 11 Apr 2024 22:55:21 -0500
Message-Id: <46e6d4ddd74b9ecc4937d1086efe06eb39c499dd.1712893887.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1712893887.git.sanastasio@raptorengineering.com>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Enable usage of bootfdt for populating the boot info struct from the
firmware-provided device tree.  Also enable the Xen boot page allocator.

Additionally, modify bootfdt.c's boot_fdt_info() to tolerate the
scenario in which the FDT overlaps a reserved memory region, as is the
case on PPC when booted directly from skiboot. Since this means that Xen
can now boot without a BOOTMOD_FDT present in bootinfo, clarify this
fact in a comment above BOOTMOD_FDT's definition.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v4:
  - drop unnecessary libfdt.h include in setup.c
  - make boot_fdt and xen_bootmodule const
  - more clearly document that BOOTMOD_FDT is now optional
  - add explicit (void) cast to BOOTMOD_FDT creation

 xen/arch/ppc/setup.c             | 22 +++++++++++++++++++++-
 xen/common/device-tree/bootfdt.c | 11 +++++++++--
 xen/include/xen/bootfdt.h        |  7 +++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 101bdd8bb6..47e997969f 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,12 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
 #include <xen/mm.h>
 #include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
 #include <asm/mm.h>
 #include <asm/processor.h>
+#include <asm/setup.h>

 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
@@ -24,6 +27,9 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    const void *boot_fdt;
+    const struct bootmodule *xen_bootmodule;
+
     if ( r5 )
     {
         /* Unsupported OpenFirmware boot protocol */
@@ -32,11 +38,25 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
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
index f01a5b5d76..76d0f72ef9 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -542,12 +542,19 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
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
+    (void)add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 577618da16..ea3ad96bb9 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -13,7 +13,14 @@

 typedef enum {
     BOOTMOD_XEN,
+
+    /*
+     * The BOOTMOD_FDT type will only be present when the firmware-provided FDT
+     * blob exists outside of a reserved memory region which is platform-
+     * dependent and may not be relied upon.
+     */
     BOOTMOD_FDT,
+
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
     BOOTMOD_XSM,
--
2.30.2



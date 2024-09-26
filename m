Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D0987B25
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805918.1217176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv4-0002cq-6N; Thu, 26 Sep 2024 22:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805918.1217176; Thu, 26 Sep 2024 22:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv4-0002WN-0i; Thu, 26 Sep 2024 22:25:06 +0000
Received: by outflank-mailman (input) for mailman id 805918;
 Thu, 26 Sep 2024 22:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ruc3=QY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1stwv2-0002UO-GF
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:25:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2be2bbc6-7c56-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 00:25:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6939282870A9;
 Thu, 26 Sep 2024 17:25:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sGWagBPL-OlG; Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 70EA282875D8;
 Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3idvsJlGmI57; Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id DF44C828533D;
 Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
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
X-Inumbo-ID: 2be2bbc6-7c56-11ef-a0ba-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 70EA282875D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1727389500; bh=uf+p5oYWeDWMIe5J8t9kSJGpxs9iSz6D7blh9z+2pl4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=theODZizRtAWRlJ2NF+GaN5HbU8wM/FAdQ63+ydPxTeeuhBIJ1qYrNvW6ojPyc0ci
	 puCoaur0m5fez+lZZb+gc+5MdrHayJI2i0VvqYBHnYV7mNgBleVgbFxOKrd1mZUXiD
	 YVzYDkAZENpgnRu3xWZu0jHLAg3D0HHWht44VkuY=
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
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 2/3] xen/ppc: Enable bootfdt and boot allocator
Date: Thu, 26 Sep 2024 17:24:43 -0500
Message-Id: <423472f8bcc4b6800e2ed8d6065b2bb0fc1f8ebc.1727388925.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1727388925.git.sanastasio@raptorengineering.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
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
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v5:
  - Drop setup.c's unnecessary `boot_fdt` variable per Julien's suggestion

 xen/arch/ppc/setup.c             | 20 +++++++++++++++++++-
 xen/common/device-tree/bootfdt.c | 11 +++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 5fb5ab64e3..17bc1aed34 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,4 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -9,6 +11,7 @@
 #include <asm/early_printk.h>
 #include <asm/mm.h>
 #include <asm/processor.h>
+#include <asm/setup.h>

 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
@@ -26,6 +29,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    const struct bootmodule *xen_bootmodule;
+
     if ( r5 )
     {
         /* Unsupported OpenFirmware boot protocol */
@@ -34,11 +39,24 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
     else
     {
         /* kexec boot protocol */
-        boot_opal_init((void *)r3);
+        device_tree_flattened = (void *)r3;
+        boot_opal_init(device_tree_flattened);
     }

     setup_exceptions();

+    boot_fdt_info(device_tree_flattened, r3);
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

     init_constructors();
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 2a51ee44a3..5facd683b8 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -584,8 +584,6 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     if ( ret < 0 )
         panic("No valid device tree\n");

-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
     nr_rsvd = fdt_num_mem_rsv(fdt);
     if ( nr_rsvd < 0 )
         panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
@@ -632,6 +630,15 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
             panic("Cannot allocate reserved memory bank\n");
     }

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
--
2.30.2



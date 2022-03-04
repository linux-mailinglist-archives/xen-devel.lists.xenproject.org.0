Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893CF4CDC05
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284405.483672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU4-0002Df-GJ; Fri, 04 Mar 2022 18:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284405.483672; Fri, 04 Mar 2022 18:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU4-000294-A9; Fri, 04 Mar 2022 18:16:56 +0000
Received: by outflank-mailman (input) for mailman id 284405;
 Fri, 04 Mar 2022 17:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC20-0005R5-R1
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:47:56 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384aa71f-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:55 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC1x-0008PE-IK; Fri, 04 Mar 2022 18:47:53 +0100
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
X-Inumbo-ID: 384aa71f-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 01/36] Revert "xen/arm: setup: Add Xen as boot module before printing all boot modules"
Date: Fri,  4 Mar 2022 18:46:26 +0100
Message-Id: <20220304174701.1453977-2-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This reverts commit 48fb2a9deba11ee48dde21c5c1aa93b4d4e1043b.
---
 xen/arch/arm/setup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..c5a556855e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -888,18 +888,18 @@ void __init start_xen(unsigned long boot_phys_offset,
               "Please check your bootloader.\n",
               fdt_paddr);
 
-    /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
-                             (paddr_t)(uintptr_t)(_end - _start), false);
-    BUG_ON(!xen_bootmodule);
-
     fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
 
     cmdline = boot_fdt_cmdline(device_tree_flattened);
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    /* Register Xen's load address as a boot module. */
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
+                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
+                             (paddr_t)(uintptr_t)(_end - _start + 1), false);
+    BUG_ON(!xen_bootmodule);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.30.2



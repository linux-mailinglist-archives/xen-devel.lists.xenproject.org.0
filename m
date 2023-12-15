Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E38814044
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654838.1022285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJj-0003yQ-6f; Fri, 15 Dec 2023 02:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654838.1022285; Fri, 15 Dec 2023 02:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJj-0003sb-1O; Fri, 15 Dec 2023 02:52:47 +0000
Received: by outflank-mailman (input) for mailman id 654838;
 Fri, 15 Dec 2023 02:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJh-0002yh-9g
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0514dcdf-9af5-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 03:52:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8CB878285558;
 Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6BPePTQqDQM2; Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E70A78286129;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7y2vHdqhNRYr; Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 560CE8286790;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
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
X-Inumbo-ID: 0514dcdf-9af5-11ee-98ea-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E70A78286129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608761; bh=1DibHtcfh6jkTS269svt4kmE2LEah8edNOuQ9qxlV+s=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uJ6J6of4YCWZ2BvZaBL42Zh0KGb+aS3r7OPWFmBNtTCNdvcnahgouNKeSv7eW0ozq
	 VBXLk3LeAj8szrkuI5r76Dq/RQtRttaZqj1Fnog43orLBoLQMbCfmQFzTtuigW2HnO
	 qbcnOAMEQn8OCxKio8Bc3GTNEmzZkOhXwxwr8N5I=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Date: Thu, 14 Dec 2023 20:43:58 -0600
Message-Id: <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Move Arm's bootfdt.c to xen/common so that it can be used by other
device tree architectures like PPC and RISCV. Only a minor change to
conditionalize a call to a function only available on EFI-supporting
targets was made to the code itself.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/Makefile                          |  1 -
 xen/common/Makefile                            |  1 +
 xen/common/device-tree/Makefile                |  1 +
 xen/{arch/arm => common/device-tree}/bootfdt.c | 15 +++++++++------
 4 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 xen/common/device-tree/Makefile
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (98%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 33c677672f..64fdf84170 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
-obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 69d6aa626c..6e175626d5 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
new file mode 100644
index 0000000000..66c2500df9
--- /dev/null
+++ b/xen/common/device-tree/Makefile
@@ -0,0 +1 @@
+obj-y += bootfdt.init.o
diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
similarity index 98%
rename from xen/arch/arm/bootfdt.c
rename to xen/common/device-tree/bootfdt.c
index f496a8cf94..ae9fa1e3d6 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    /*
-     * If Xen has been booted via UEFI, the memory banks are
-     * populated. So we should skip the parsing.
-     */
-    if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_node_matches(fdt, node, "memory") )
+    if ( device_tree_node_matches(fdt, node, "memory") )
+#if defined(CONFIG_ARM_EFI)
+        /*
+         * If Xen has been booted via UEFI, the memory banks are
+         * populated. So we should skip the parsing.
+         */
+        if ( efi_enabled(EFI_BOOT) )
+            return rc;
+#endif
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-- 
2.30.2



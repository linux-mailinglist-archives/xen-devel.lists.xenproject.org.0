Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C838A2493
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 05:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704318.1100677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80q-0004MI-M5; Fri, 12 Apr 2024 03:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704318.1100677; Fri, 12 Apr 2024 03:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80q-0004Ja-HM; Fri, 12 Apr 2024 03:55:40 +0000
Received: by outflank-mailman (input) for mailman id 704318;
 Fri, 12 Apr 2024 03:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv80o-0003cg-UK
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 03:55:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84118175-f880-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 05:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A642C8286D98;
 Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NAsXlbbp8DZW; Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C36DD8285556;
 Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m3PLhvj5tDYh; Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 49A0D8287026;
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
X-Inumbo-ID: 84118175-f880-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C36DD8285556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712894133; bh=9DEDygZK7p/Loek4mAbH1z9o5S1b+BWpvMpymX80HZI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=DjBkXOKKwz+n7R8dZy6Zpmhaf4thjnQZXGOcyA+pbucZ3VX+UVnk0Np0gmGS3A5IT
	 hc4+2Uh661wzpPIJxigqaRj0QyRnqwoozDgeGSCiCpXg6A4q2EkqU2EekQKj9My7Wo
	 ijDvKcU7TM5KkCB5DyDLyaw/4iglz+LLTffgTyzk=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 3/6] xen/common: Move Arm's bootfdt.c to common
Date: Thu, 11 Apr 2024 22:55:20 -0500
Message-Id: <6df5d50608898f0a7ff48d96176d1c7d15424812.1712893887.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1712893887.git.sanastasio@raptorengineering.com>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Move Arm's bootfdt.c to xen/common so that it can be used by other
device tree architectures like PPC and RISCV.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Julien Grall <julien@xen.org>
---
Changes in v4:
  - move function prototypes to patch 2's xen/include/bootfdt.h
  - clean up #includes

 xen/arch/arm/Makefile                          |  1 -
 xen/arch/arm/include/asm/setup.h               | 13 -------------
 xen/common/device-tree/Makefile                |  1 +
 xen/{arch/arm => common/device-tree}/bootfdt.c | 11 +++++------
 xen/include/xen/bootfdt.h                      | 14 ++++++++++++++
 5 files changed, 20 insertions(+), 20 deletions(-)
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (99%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7b1350e2ef..9e1548378c 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o

 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
-obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index bf16afe31c..f955b7653a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -39,19 +39,6 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);

-bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
-
-struct bootmodule *add_boot_module(bootmodule_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
-struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      bootmodule_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(bootmodule_kind kind);
-
 void init_pdx(void);
 void setup_mm(void);

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 947bad979c..ff2de71c96 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1 +1,2 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
similarity index 99%
rename from xen/arch/arm/bootfdt.c
rename to xen/common/device-tree/bootfdt.c
index 35dbdf3384..f01a5b5d76 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -4,13 +4,12 @@
  *
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
-#include <xen/types.h>
-#include <xen/lib.h>
-#include <xen/kernel.h>
-#include <xen/init.h>
-#include <xen/efi.h>
+
+#include <xen/bootfdt.h>
 #include <xen/device_tree.h>
-#include <xen/lib.h>
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index b0487bdbbd..577618da16 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -107,6 +107,20 @@ struct bootinfo {

 extern struct bootinfo bootinfo;

+bool check_reserved_regions_overlap(paddr_t region_start,
+                                    paddr_t region_size);
+
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
+struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
+
 void populate_boot_allocator(void);

 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
--
2.30.2



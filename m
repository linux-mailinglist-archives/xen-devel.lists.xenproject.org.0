Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9237AD44F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 11:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607721.945994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkhdb-0006ZQ-JC; Mon, 25 Sep 2023 09:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607721.945994; Mon, 25 Sep 2023 09:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkhdb-0006XX-FH; Mon, 25 Sep 2023 09:12:19 +0000
Received: by outflank-mailman (input) for mailman id 607721;
 Mon, 25 Sep 2023 09:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPzs=FJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qkhdZ-0006XR-Qu
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 09:12:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d5d02fc-5b83-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 11:12:13 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 68B0C4EE0737;
 Mon, 25 Sep 2023 11:12:12 +0200 (CEST)
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
X-Inumbo-ID: 9d5d02fc-5b83-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v4] drivers/video: make declarations of defined functions available
Date: Mon, 25 Sep 2023 11:11:41 +0200
Message-Id: <5830a4d838883a20a6b320dd9af44ef4bb18ddaa.1695632599.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declarations for 'vesa_{init,early_init,endboot}' needed by
'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
are now available by moving the relative code inside 'vga.h'.

While moving the code, the alternative definitions are now guarded by
CONFIG_VGA. The alternative #define-s for 'vesa_early_init' and 'vesa_endboot'
are dropped, since currently they have no callers when CONFIG_VGA is not defined. 

This also resolves violations of MISRA C:2012 Rule 8.4.

Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Moved fill_console_start_info to vga.h
  (21bee1787021 introduced this function)
Changes in v3:
- Changed the preprocessor guard
- Replace the inclusions of <xen/console.h> with <xen/vga.h> where needed.
Changes in v4:
- Reworded commit message
- Removed superfluous stub definitions
---
 xen/arch/x86/include/asm/setup.h  | 6 ------
 xen/arch/x86/platform_hypercall.c | 2 +-
 xen/arch/x86/pv/dom0_build.c      | 2 +-
 xen/drivers/video/vga.c           | 8 --------
 xen/include/xen/console.h         | 2 --
 xen/include/xen/vga.h             | 6 ++++++
 6 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b0e6a39e2365..dfdd9e555149 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -25,12 +25,6 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-#ifdef CONFIG_VIDEO
-void vesa_init(void);
-#else
-static inline void vesa_init(void) {};
-#endif
-
 int construct_dom0(
     struct domain *d,
     const module_t *image, unsigned long image_headroom,
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 9ff2da8fc324..9469de9045c7 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -14,7 +14,6 @@
 #include <xen/event.h>
 #include <xen/domain_page.h>
 #include <xen/trace.h>
-#include <xen/console.h>
 #include <xen/iocap.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -24,6 +23,7 @@
 #include <xen/pmstat.h>
 #include <xen/irq.h>
 #include <xen/symbols.h>
+#include <xen/vga.h>
 #include <asm/current.h>
 #include <public/platform.h>
 #include <acpi/cpufreq/processor_perf.h>
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 909ee9a899a4..5bbed3a36a21 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
-#include <xen/console.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/init.h>
@@ -13,6 +12,7 @@
 #include <xen/pfn.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/vga.h>
 
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 0a03508bee60..18b590cdf072 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -54,14 +54,6 @@ string_param("vga", opt_vga);
 static unsigned int columns, lines;
 #define ATTRIBUTE   7
 
-#ifdef CONFIG_X86
-void vesa_early_init(void);
-void vesa_endboot(bool_t keep);
-#else
-#define vesa_early_init() ((void)0)
-#define vesa_endboot(x)   ((void)0)
-#endif
-
 void __init video_init(void)
 {
     char *p;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 53c56191ba9e..ab5c30c0daf2 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -20,8 +20,6 @@ void console_init_postirq(void);
 void console_endboot(void);
 int console_has(const char *device);
 
-int fill_console_start_info(struct dom0_vga_console_info *);
-
 unsigned long console_lock_recursive_irqsave(void);
 void console_unlock_recursive_irqrestore(unsigned long flags);
 void console_force_unlock(void);
diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
index f72b63d446b1..9b2c47971d0c 100644
--- a/xen/include/xen/vga.h
+++ b/xen/include/xen/vga.h
@@ -13,6 +13,12 @@
 
 #ifdef CONFIG_VGA
 extern struct xen_vga_console_info vga_console_info;
+int fill_console_start_info(struct dom0_vga_console_info *);
+void vesa_init(void);
+void vesa_early_init(void);
+void vesa_endboot(bool keep);
+#else
+static inline void vesa_init(void) {};
 #endif
 
 #endif /* _XEN_VGA_H */
-- 
2.34.1



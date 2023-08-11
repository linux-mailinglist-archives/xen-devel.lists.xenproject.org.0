Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7E778805
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582283.911981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRC-0004Vu-7R; Fri, 11 Aug 2023 07:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582283.911981; Fri, 11 Aug 2023 07:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRB-0004Ot-Tj; Fri, 11 Aug 2023 07:19:57 +0000
Received: by outflank-mailman (input) for mailman id 582283;
 Fri, 11 Aug 2023 07:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMRA-0003ey-J0
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e422eb-3817-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 09:19:56 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 5DBD54EE0745;
 Fri, 11 Aug 2023 09:19:55 +0200 (CEST)
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
X-Inumbo-ID: 78e422eb-3817-11ee-b284-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 6/6] drivers/video: make declarations of defined functions available
Date: Fri, 11 Aug 2023 09:19:31 +0200
Message-Id: <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declarations for 'vesa_{init,early_init,endboot}' needed by
'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
are now available by moving the relative code inside 'vga.h' and
including "<xen/console.h>" respectively.
This also resolves violations of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: ebb26b509f1a ("xen/x86: make VGA support selectable")
Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")
---
 xen/arch/x86/include/asm/setup.h |  6 ------
 xen/drivers/video/vga.c          |  9 +--------
 xen/include/xen/vga.h            | 14 ++++++++++++++
 3 files changed, 15 insertions(+), 14 deletions(-)

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
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 0a03508bee60..b62a47e000e7 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -9,6 +9,7 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/vga.h>
+#include <xen/console.h>
 #include <xen/pci.h>
 #include <asm/io.h>
 
@@ -54,14 +55,6 @@ string_param("vga", opt_vga);
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
diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
index f72b63d446b1..ffd73c9db135 100644
--- a/xen/include/xen/vga.h
+++ b/xen/include/xen/vga.h
@@ -15,4 +15,18 @@
 extern struct xen_vga_console_info vga_console_info;
 #endif
 
+#ifdef CONFIG_X86
+void vesa_early_init(void);
+void vesa_endboot(bool_t keep);
+#else
+#define vesa_early_init() ((void)0)
+#define vesa_endboot(x)   ((void)0)
+#endif
+
+#ifdef CONFIG_VIDEO
+void vesa_init(void);
+#else
+static inline void vesa_init(void) {};
+#endif
+
 #endif /* _XEN_VGA_H */
-- 
2.34.1



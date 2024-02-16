Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4A857CD5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682189.1061301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV4-0007PC-7l; Fri, 16 Feb 2024 12:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682189.1061301; Fri, 16 Feb 2024 12:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV4-0007JU-2H; Fri, 16 Feb 2024 12:39:30 +0000
Received: by outflank-mailman (input) for mailman id 682189;
 Fri, 16 Feb 2024 12:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV3-0006oP-5c
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:29 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0f7a5b-ccc8-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 13:39:27 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso1917233a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:27 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:25 -0800 (PST)
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
X-Inumbo-ID: 6c0f7a5b-ccc8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087166; x=1708691966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThFYlqJK5oTZpY8W/cIg7Lb/8W/p8jm22dHZpYH2e2M=;
        b=g18ZyPL6DZGbI1XbJJ/pOsMnhC1qgil3AsgbM/i+4rUhJaEanKRMTbA8rjSXXtiZcq
         CkHzb7elCmt0CWRy6QgtDBiMF9ygwwg+10iEaY06w3EbzFQT1Fg43suOB3hyykQrD3Yd
         OT8n37upIIdCEbcPXEizjOFE6xJ0A58JHtevqDsBm+ocz88tHrCQaJPr5296Hu7fM9JK
         gHnhNr1Z2qAblPRGcGsRnNem8FnWmKeoOvH43N7MYdmraMQoH5vWWkyyljTKwZTDNu39
         ujYbk/oJOlnt0GRDnDfNwtgFMFfJNHOwiIZ6jsVMU459xqcl6X87G+QqxCwEMSD99Wsq
         YokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087166; x=1708691966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThFYlqJK5oTZpY8W/cIg7Lb/8W/p8jm22dHZpYH2e2M=;
        b=UvwUxUpFbLj/LrwE8tChBF4fzapf30xVhL4YeICQgcyJZVNO0kNOWnw+ZufYt0cs8f
         6i9mM0w1T1m9iUiVy1kiwv+s5RHiqfdWRgQCh5Ky5CS9w2OdnfiMhJIOoi5AWeHwFFy1
         2dzIAFfDmpI/KruXEpwtSKOjYShiO0kzX0RmuSUCN7jsHgQGQYgkNxGfXVtzt5VcrjHR
         sSpXdS3wBA5xtVkQuTQpw9R5Mf8ShKKJY3WEOnrwCMKU4yqoEp6/KBrJxczvnVhVwXiy
         coSj3nYaB/CCgq1y7PH2wVlOcAxzqfR4AG26IGXIGRt2r8lvyJkYY0QRYbK62bdPcgHu
         /fZw==
X-Gm-Message-State: AOJu0Ywd4nNW5BEXow7QsbJTKOrz2hdDhVEcpWUniau5MufleAFCOVH6
	V8edHqRl/7tTEZeJlcn0veCXWT1E0rsL9HDHQ/kIQGjkxe5DA+zkkITFrYf3
X-Google-Smtp-Source: AGHT+IFgq4auslyaCnWeuNKH+MtZ4S5D0tRHphnqTMD5UeBYjyISJtyIhIEUjTq7mMP+mc7a+GeRGA==
X-Received: by 2002:a17:906:2b09:b0:a3d:6592:a72 with SMTP id a9-20020a1709062b0900b00a3d65920a72mr3093778ejg.8.1708087166161;
        Fri, 16 Feb 2024 04:39:26 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 2/7] xen/asm-generic: introduce stub header monitor.h
Date: Fri, 16 Feb 2024 13:39:14 +0100
Message-ID: <296530c13b8400f6872d4afc8cc14e2fcfc7a2d5.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Switch partly Arm and PPC to asm-generic/monitor.h and only
arch_monitor_get_capabilities() left in arch-specific/monitor.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V9:
 - Add Acked-by: Julien Grall <jgrall@amazon.com> for Arm part
---
Changes in V8:
 - Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in V7:
 - Drop definition of arch_monitor_domctl_event for PPC.
 - define arch_monitor_domctl_event in asm-generic/monitor.h.
 - add "define HAS_ARCH_MONITOR_DOMCTL_EVENT" in arm/.../monitor.h as it has arch specific implementation.
---
Changes in V6:
 - Rebase only.
---
Changes in V5:
  - Switched partly Arm and PPC to asm-generic monitor.h only
    arch_monitor_get_capabilities() left in arch-specific/monitor.h.
  - Updated the commit message.
---
Changes in V4:
 - Removed the double blank line.
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>.
 - Update the commit message
---
Changes in V3:
 - Use forward-declaration of struct domain instead of " #include <xen/sched.h> ".
 - Add ' include <xen/errno.h> '
 - Drop PPC's monitor.h.
---
Changes in V2:
	- remove inclusion of "+#include <public/domctl.h>"
	- add "struct xen_domctl_monitor_op;"
	- remove one of SPDX tags.
---
 xen/arch/arm/include/asm/monitor.h | 25 +-----------
 xen/arch/ppc/include/asm/monitor.h | 28 +------------
 xen/arch/ppc/stubs.c               |  8 ----
 xen/include/asm-generic/monitor.h  | 64 ++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 58 deletions(-)
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/arch/arm/include/asm/monitor.h b/xen/arch/arm/include/asm/monitor.h
index 7567be66bd..77a3c1a36c 100644
--- a/xen/arch/arm/include/asm/monitor.h
+++ b/xen/arch/arm/include/asm/monitor.h
@@ -25,34 +25,13 @@
 #include <xen/sched.h>
 #include <public/domctl.h>
 
-static inline
-void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
-{
-}
+#define HAS_ARCH_MONITOR_DOMCTL_EVENT
 
-static inline
-int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
-{
-    /* No arch-specific monitor ops on ARM. */
-    return -EOPNOTSUPP;
-}
+#include <asm-generic/monitor.h>
 
 int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop);
 
-static inline
-int arch_monitor_init_domain(struct domain *d)
-{
-    /* No arch-specific domain initialization on ARM. */
-    return 0;
-}
-
-static inline
-void arch_monitor_cleanup_domain(struct domain *d)
-{
-    /* No arch-specific domain cleanup on ARM. */
-}
-
 static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 {
     uint32_t capabilities = 0;
diff --git a/xen/arch/ppc/include/asm/monitor.h b/xen/arch/ppc/include/asm/monitor.h
index e5b0282bf1..89000dacc6 100644
--- a/xen/arch/ppc/include/asm/monitor.h
+++ b/xen/arch/ppc/include/asm/monitor.h
@@ -6,33 +6,7 @@
 #include <public/domctl.h>
 #include <xen/errno.h>
 
-static inline
-void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
-{
-}
-
-static inline
-int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
-{
-    /* No arch-specific monitor ops on PPC. */
-    return -EOPNOTSUPP;
-}
-
-int arch_monitor_domctl_event(struct domain *d,
-                              struct xen_domctl_monitor_op *mop);
-
-static inline
-int arch_monitor_init_domain(struct domain *d)
-{
-    /* No arch-specific domain initialization on PPC. */
-    return 0;
-}
-
-static inline
-void arch_monitor_cleanup_domain(struct domain *d)
-{
-    /* No arch-specific domain cleanup on PPC. */
-}
+#include <asm-generic/monitor.h>
 
 static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index a96e45626d..da193839bd 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -95,14 +95,6 @@ void arch_get_domain_info(const struct domain *d,
     BUG_ON("unimplemented");
 }
 
-/* monitor.c */
-
-int arch_monitor_domctl_event(struct domain *d,
-                              struct xen_domctl_monitor_op *mop)
-{
-    BUG_ON("unimplemented");
-}
-
 /* smp.c */
 
 void arch_flush_tlb_mask(const cpumask_t *mask)
diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
new file mode 100644
index 0000000000..1ade289099
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/asm-generic/monitor.h
+ *
+ * Arch-specific monitor_op domctl handler.
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ * Copyright (c) 2016, Bitdefender S.R.L.
+ *
+ */
+
+#ifndef __ASM_GENERIC_MONITOR_H__
+#define __ASM_GENERIC_MONITOR_H__
+
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+struct domain;
+struct xen_domctl_monitor_op;
+
+static inline
+void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
+{
+}
+
+static inline
+int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
+{
+    /* No arch-specific monitor ops on GENERIC. */
+    return -EOPNOTSUPP;
+}
+
+#ifndef HAS_ARCH_MONITOR_DOMCTL_EVENT
+static inline
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop)
+{
+    BUG_ON("unimplemented");
+}
+#endif
+
+static inline
+int arch_monitor_init_domain(struct domain *d)
+{
+    /* No arch-specific domain initialization on GENERIC. */
+    return 0;
+}
+
+static inline
+void arch_monitor_cleanup_domain(struct domain *d)
+{
+    /* No arch-specific domain cleanup on GENERIC. */
+}
+
+#endif /* __ASM_GENERIC_MONITOR_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0



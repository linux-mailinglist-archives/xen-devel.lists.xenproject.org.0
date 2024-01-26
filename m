Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A928583DDBD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672093.1045792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLR-0003fY-Rj; Fri, 26 Jan 2024 15:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672093.1045792; Fri, 26 Jan 2024 15:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLR-0003XX-Mb; Fri, 26 Jan 2024 15:42:17 +0000
Received: by outflank-mailman (input) for mailman id 672093;
 Fri, 26 Jan 2024 15:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLP-00039n-Nq
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:15 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c0cb68-bc61-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:42:13 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5101f2dfdadso1011819e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:13 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:12 -0800 (PST)
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
X-Inumbo-ID: 79c0cb68-bc61-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283733; x=1706888533; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEnbKoxUIDJ0rSJ2LPqRBVQnrHP4+bmWPqcwN9Vjt2M=;
        b=CGNMMHbXhVG/+tUMrNF+8F9QEn7L4jgLW2L3R/MtbEECpPtnLxj/H9VAQMcP/YIAh8
         fu1iOMohBwH11iBeedCrR7rAPQtS3qTnOEe7xW5WoAsE3j8mMvBB6W7KY+KpiLvF4sEQ
         fP7XlGhcmhaWdOEO3xKaqpKLHUKwtWP188lgwI/d5EV3ky9tWk71cN0l3qLlrlmK8KFS
         NzZsSHu5tsi/UX/vLjplfITq2OlobFOVtSkVHFm+2sQhTRzRfNNYxw8C8CCCeuWX6VYx
         dAy0zf7kJa8O1f3em0ZVAQx2+HpbcnGNubo0Y2+THXiuVXYrhWqsRqQM4Rvh7fB8g/nr
         UN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283733; x=1706888533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEnbKoxUIDJ0rSJ2LPqRBVQnrHP4+bmWPqcwN9Vjt2M=;
        b=admZFuASGWb/yT3Ajv464jMlMAcGz7LZItv13BLhWOwLH2YcCuEbYSgr6gjJV3YM7n
         npO1m+R1tYK/qbFo1MJ7BtWFpSh37KISWTp47YVZVbVwUXBB9ovsvR3Bzbfc7jCAZOF6
         r2RI9RASz0uOkh+4W3DaraBIjWxevlJTlH3QlGOKKVkvWqCrysFPWxpgEJd+peiBsWL/
         Q7eUM/EFL2O7HjrWLW3iJkAR4aXy7ck1YWIS6L+cIE1PZerxNEcVfuDVXmpxuQrxMiGK
         iihHhejLNIDm8Ih2Hss1g8hCFFdfcCyhMR9fCNnrpdkvDP0VSSMV+5y4tTfZVOMk6hww
         21cg==
X-Gm-Message-State: AOJu0YwN6Kil0PkBZTuEkWsUOlguSGqNzczXmzf66vNwJdgCCPlhSn1P
	TyE9QWh0fVfd9LCOIJv2gNC/APty9r0VBhE8SJGq64xd5NHR2fRIttFITjS0
X-Google-Smtp-Source: AGHT+IGK8zG93Ct3BE/l1gWNjoWtAbdCtC8/XUbclrxLoCZbTAuapgwts2d3sdINbocUwJ5FtNnxdQ==
X-Received: by 2002:a19:8c14:0:b0:50e:1d6a:48d4 with SMTP id o20-20020a198c14000000b0050e1d6a48d4mr765012lfd.122.1706283732888;
        Fri, 26 Jan 2024 07:42:12 -0800 (PST)
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
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 3/7] xen/asm-generic: introduce stub header monitor.h
Date: Fri, 26 Jan 2024 17:42:03 +0200
Message-ID: <da7d16d1ab857e103c1b729d5ee3c9d588e1d3e0.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Switch partly Arm and PPC to asm-generic/monitor.h and only
arch_monitor_get_capabilities() left in arch-specific/monitor.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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



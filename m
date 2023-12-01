Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7838014CD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645739.1008019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQv-0007mH-Bh; Fri, 01 Dec 2023 20:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645739.1008019; Fri, 01 Dec 2023 20:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQv-0007jr-8D; Fri, 01 Dec 2023 20:48:21 +0000
Received: by outflank-mailman (input) for mailman id 645739;
 Fri, 01 Dec 2023 20:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQt-0007Cg-95
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4fa5bb2-908a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:48:18 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bc811d12fso3606748e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:18 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:16 -0800 (PST)
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
X-Inumbo-ID: f4fa5bb2-908a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463698; x=1702068498; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/Fa3V+suVuY5Wl4cnMTSRfOG8VUNxvSJcflHXogt7E=;
        b=WPcrJlWDVWLfTosghFwDp3uH2wzUSNYO2ieyUJus8OX8vYMPvJPDOJVoZOfWUk4sMB
         Ou6Dc7Znj0tdHKIks8J9HdC8sQTrqNOxbF7mE/ZcR9puwqnOY77RkypcoE3RLLSJm+9o
         XpJpUehMH9rV5pHxC+zyeEcRJWk/PfELOXy2LKMgRYl78FRqf+s6vnYuao5wCMy+Sw/K
         7NN6eK5IdEzNslDaJL+nVJbFzMQRtTBTLhuNh+7n2xZ6F4dlFCtmS11oz9nNpv/NQZyW
         q+RYwfB6KSdibz0qNZKmkNV/J7l2Goty9Fj4v+LEYp5hVQtlLhpKv6B1yn+lqRJPG62m
         RPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463698; x=1702068498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/Fa3V+suVuY5Wl4cnMTSRfOG8VUNxvSJcflHXogt7E=;
        b=gbwkXHBmBEFeePo98uBr/Dt1EBaZMbVcuts8Bac6wOiCAq2epveCyM/kBl6BjwJsU6
         fg0LYMR+GxMrN4Ac01BJs24nx3hNDCguc6fByCLiG8o9bbljNiAEnJxsCvqzMCwmvWIc
         skXkfrJdzX8Jmrozucg825FDFo0sGBzkYdueaAQ15iHU6Yss7TQ5dwe37ERk1V1yGJRo
         IAphYxWPuWmyVhPnog3IV9O4sBXelW08dt4/fXs/L+ozkPoyobCHamturHXrLg2z1D43
         67TKUDJmhPvWFX2dRxQEOI64K6/4JjWpJdCrrl9OnTJiSDPpcNbVhOsdXZzsQww6e/Dn
         9KdA==
X-Gm-Message-State: AOJu0Yy+t5g6HEMEDm5KE4fqLNvud13pt4Htg14sRoYvdqakl8/bqU1H
	FB8hYDR7bwY9V2cKajOMugxCMFfc5keOcw==
X-Google-Smtp-Source: AGHT+IFWs2H8CtxOHc9wOx2zpzoQ08DIixhbTwRslXs2DSEgkFsBo4hLz8/rpY8QZwzf66GVzWMLww==
X-Received: by 2002:a2e:8017:0:b0:2c9:dae6:43f4 with SMTP id j23-20020a2e8017000000b002c9dae643f4mr633507ljg.118.1701463697700;
        Fri, 01 Dec 2023 12:48:17 -0800 (PST)
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
Subject: [PATCH v5 2/7] xen/asm-generic: introduce stub header monitor.h
Date: Fri,  1 Dec 2023 22:48:05 +0200
Message-ID: <e968b9763890ca784b8da0a83f65c43470748e9b.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Switch partly Arm and PPC to asm-generic/monitor.h and only
arch_monitor_get_capabilities() left in arch-specific/monitor.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
 xen/arch/arm/include/asm/monitor.h | 28 +--------------
 xen/arch/ppc/include/asm/monitor.h | 28 +--------------
 xen/include/asm-generic/monitor.h  | 57 ++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 54 deletions(-)
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/arch/arm/include/asm/monitor.h b/xen/arch/arm/include/asm/monitor.h
index 7567be66bd..045217c310 100644
--- a/xen/arch/arm/include/asm/monitor.h
+++ b/xen/arch/arm/include/asm/monitor.h
@@ -25,33 +25,7 @@
 #include <xen/sched.h>
 #include <public/domctl.h>
 
-static inline
-void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
-{
-}
-
-static inline
-int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
-{
-    /* No arch-specific monitor ops on ARM. */
-    return -EOPNOTSUPP;
-}
-
-int arch_monitor_domctl_event(struct domain *d,
-                              struct xen_domctl_monitor_op *mop);
-
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
+#include <asm-generic/monitor.h>
 
 static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 {
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
diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
new file mode 100644
index 0000000000..74e4870cd7
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,57 @@
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
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop);
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



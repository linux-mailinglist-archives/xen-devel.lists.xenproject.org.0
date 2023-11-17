Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B747EF295
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635120.990958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuA-0003Sh-7y; Fri, 17 Nov 2023 12:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635120.990958; Fri, 17 Nov 2023 12:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu9-0003O9-SK; Fri, 17 Nov 2023 12:25:01 +0000
Received: by outflank-mailman (input) for mailman id 635120;
 Fri, 17 Nov 2023 12:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu8-0000iK-18
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:25:00 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 528193c7-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:58 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507adc3381cso2497182e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:56 -0800 (PST)
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
X-Inumbo-ID: 528193c7-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223897; x=1700828697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqCrA4cmi94JGuUu0rnXEvBAcFwzLBG4Gu65+9LoXrk=;
        b=Xo5iLFYzImETXXLIyZYNWRTkQNTfqxYNCB6VcyGFlWIN8Okf7PRE+eXthgNy/+n9i8
         8Noi1b2mACxISHpIkSf8UvEns5pGNwgsrbOwuKrwKt5WpJwDXiK/05RAmp/aHgYyropS
         H55zzZ2BsifPDS5fDuhaDMgeHNxuUjCUSZsXKO7/6jtdE8d1/+DkcmNXibKqXEo6p5NZ
         516Bb7i5fSCVEUUar643X+UHwbQDZUdM+n8Z93q2iqpHMBalZMamy3yDphPYM4Le5u0+
         ltzmV5X0UN1TP4IwHF/VGA7F16+7RcVZ5mE6dzDGDLxK4ljhRguzeJ8jDn3DqlxM/vAo
         +DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223897; x=1700828697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqCrA4cmi94JGuUu0rnXEvBAcFwzLBG4Gu65+9LoXrk=;
        b=qf8HlbXDQwd6PIUTOiVKYkT4Lj3OM/A8hRaIdJ6bjlccuXj0PIBXwhjspMMQ/jbfNf
         xlXpZ92pmXw4M/aZIeOySIW8nw1ZvVHy+oCVlH7alg+FDdOo2n2i30x6OCax555avl62
         77RZDNTfEe80vKjPmU/MiN/shJOS5TSX3rpvoF+O2uoITpBM9dtMi6HvAiI3vp0rmd5W
         CJGJS7REhkGESec/Mff1HUMQww14fq7BulPCQPPcYpdBPSm/Oi2cJUg1NEniNkJsUVHi
         pBOeMGYFTbmn1hQYC6GnRJwjRAvyQp2gGxfvEv33sWdX9BSWSTmwDjFhHsAimOkbwuD1
         sFFg==
X-Gm-Message-State: AOJu0YyZZUcm44EALy2RPepkb0Mu260Tz6aixwE9ISv3NDUwfLs5934S
	OrdbKOFLdBX5YzDOqNs3zVKOGileeHo=
X-Google-Smtp-Source: AGHT+IF33WHJwCt7yNZckLw2DNZfPJoO6TTBXIL1PFamgLtEsYrhqTxI/ztYReLy+R7TTatUyOQLHw==
X-Received: by 2002:ac2:5f76:0:b0:507:9a05:1aed with SMTP id c22-20020ac25f76000000b005079a051aedmr12378937lfc.4.1700223897254;
        Fri, 17 Nov 2023 04:24:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v3 10/14] xen/asm-generic: introduce stub header monitor.h
Date: Fri, 17 Nov 2023 14:24:34 +0200
Message-ID: <4340a173244ddf933979331762ccb0d523969738.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between archs so it is moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/ppc/include/asm/Makefile  |  1 +
 xen/arch/ppc/include/asm/monitor.h | 43 --------------------
 xen/include/asm-generic/monitor.h  | 63 ++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 43 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/monitor.h
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index a8e848d4d0..9bbae4cec8 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -4,6 +4,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += monitor.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/monitor.h b/xen/arch/ppc/include/asm/monitor.h
deleted file mode 100644
index e5b0282bf1..0000000000
--- a/xen/arch/ppc/include/asm/monitor.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Derived from xen/arch/arm/include/asm/monitor.h */
-#ifndef __ASM_PPC_MONITOR_H__
-#define __ASM_PPC_MONITOR_H__
-
-#include <public/domctl.h>
-#include <xen/errno.h>
-
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
-
-static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
-{
-    BUG_ON("unimplemented");
-    return 0;
-}
-
-#endif /* __ASM_PPC_MONITOR_H__ */
diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
new file mode 100644
index 0000000000..57b2256db7
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/asm-GENERIC/monitor.h
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
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_MONITOR_H__ */
+
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
2.41.0



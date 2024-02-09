Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B184FB5C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678783.1056321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBM-0007li-1M; Fri, 09 Feb 2024 18:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678783.1056321; Fri, 09 Feb 2024 18:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBL-0007h7-Tu; Fri, 09 Feb 2024 18:00:59 +0000
Received: by outflank-mailman (input) for mailman id 678783;
 Fri, 09 Feb 2024 18:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBK-0007AX-Nw
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:00:58 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7e2771-c775-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 19:00:56 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d0e20b7375so5703001fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:00:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:55 -0800 (PST)
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
X-Inumbo-ID: 2c7e2771-c775-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501656; x=1708106456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDTJW+iXXU/pmzqRlWGMRI2OkRV6YQ3UWt7y5c2dJ2o=;
        b=EIUakyFiLdSVq/sWfKoNBlnT7tFZchSqvfm2C7aEkZm3ki4EpOOlphHBBriNoXU9xq
         vUeQY21nqMsPeW3ZCSBR+ioBPMaD8jtati7RO1SX98q8DHH3F3nbmBZ43JXgUSHqTdPS
         A4Js4UHI4BLi0a72hMIze8jPxkFpLbgw3V4Zt+L+phOQKTjO8FE+RH8AiE18sSW061de
         3y2UPa43y7dWK8LbNvzsJVeDq4Ye+GCVyRr+UXZO+DwslV3v0qIUhyNPz/ClnN2HXth7
         /E2OaspXRfyriZ9O9WKzY3+ga8lfaUvO0ncOFC8CTIY2BENqRSQHQxSWtME9C4f0LJ54
         wJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501656; x=1708106456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDTJW+iXXU/pmzqRlWGMRI2OkRV6YQ3UWt7y5c2dJ2o=;
        b=YQMKYpEbLoPMTIB803B0X88CuAQsj6YRCxa0H6iiJ3kXo+Yzx8eISaBwZZi5qOUk3N
         EY/ecIuK3EYEe5xqJ+83wJRG569ykrqXfjfIklnGBp8VXgF8dPL0/JotA/48YWMu4fCY
         eprEPt2B8Mal78O6oA6bKAWHqF+KXEv4MbQ7gWijaT6j+QcCbtWh9VVhzfcdol3DRK0t
         Xi0Aw0sDO7kwaFX0XRi0gSRNBaBNtGcCF4xiqZUoBZCGwTcaRs9qD6835o8hGtVEWbHN
         60TN7xhShRhzYd8PRWXWf5Bi0op4UGjb9xbK9YzD880ddTJImzRB9SknyhuE5cygoaIz
         hN3Q==
X-Gm-Message-State: AOJu0YxfHzcGDflwiyXPDefhMDDudITX0agaXmsCVLu0PCqzjaeJkXKM
	78thgR7jqiHTQFzQMfvYcjqTYUsi+DH/fPy+QspeBsZtAE5Wf3PPokhi1iBo
X-Google-Smtp-Source: AGHT+IGFHZ+cyVVb2L4PXW3RObTBtjdUa76Y9tfpmFyQ15SpxFnJRcY7kMAciBx9g1Gmhpoh26N8PQ==
X-Received: by 2002:a2e:9b58:0:b0:2d0:9fac:bdff with SMTP id o24-20020a2e9b58000000b002d09facbdffmr1844374ljj.38.1707501655965;
        Fri, 09 Feb 2024 10:00:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUH3gne00j+NV48jUiaBFjkD6wtBIFi6UDcL+hC2C9BHR0akOBxRpJk06JaF27iQgDmJYSoKiw271l71n38cPcehtHkDw4GZeN4/o0UZoZgiwYUkuGOc1SUnN3Stf2IaofQtbDzaPYd7Y6ZxGgICYhuMNzD3aaqZunBY9mfvY5oAliHqO16bNb1OPdX+e7TGhlvcPybwopcD4QWABy7Bhpib587TZh5KdDOdHo7SdTczil7JdsBtxzu58zcRsIzI2g5DZ4wsIUkg9MEwRiyRPbMDbRp/gKsuRTF0EMutMoCI6PGIoytQXrveu/NZc+Fle8nnXLnZbXbVJb+8GauwM48vLahZ/f5CmoNpnodJ2mPnnzlgziBc9jr0hYXijxMvOi
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
Subject: [PATCH v8 3/7] xen/asm-generic: introduce stub header monitor.h
Date: Fri,  9 Feb 2024 19:00:45 +0100
Message-ID: <84568b0c24a5ec96244f3f34537e9a148367facf.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Switch partly Arm and PPC to asm-generic/monitor.h and only
arch_monitor_get_capabilities() left in arch-specific/monitor.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
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



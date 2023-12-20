Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9981A0BF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657917.1027045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFg-0005rr-4s; Wed, 20 Dec 2023 14:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657917.1027045; Wed, 20 Dec 2023 14:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFg-0005oZ-08; Wed, 20 Dec 2023 14:08:48 +0000
Received: by outflank-mailman (input) for mailman id 657917;
 Wed, 20 Dec 2023 14:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFe-0004kf-FZ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:46 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 494ff2da-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:44 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cc6b5a8364so41467161fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:44 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:43 -0800 (PST)
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
X-Inumbo-ID: 494ff2da-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081323; x=1703686123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jf70xM9Lw8ScUvVg/zsyH4o0egKTjOtTh0z+8+kQOs=;
        b=WLYmOZF+bgtmgru5jLjZoul7oLrwGF3czaPabDya+zQIABcBszCOtzs3fTWvhHormA
         dc4QkWnFWe5r4QlYEmC07iS2m/80lVVqDCOfeo+d5N3ZCwg8Tgz+GVtb+UKt7+whIdRw
         Iqn/GgakVOUhljBiwkibiAA/9sbM4mflRp6tvyJs4ffyf91oeh7M61SpZyDBGY51Y1MZ
         D7GsoKmzpNYC50anQC/6ZanBASh7vGLdra2AEuuOmVKbRJNlB4A27vZVVM6JOyaygxOy
         CcX16L47MQiFXyjzN2tE+UhWUTAUwrbNbY9QlmvfxTJUkZcbCy7EbdojhMCftjs02ISn
         burA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081323; x=1703686123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jf70xM9Lw8ScUvVg/zsyH4o0egKTjOtTh0z+8+kQOs=;
        b=S5p5kKsLtEksLvBcuDQxZZZiEFc9nF1O8cHdW+ItH1Tm/LNkvtfR0JsG4okJifMIhc
         vgMGA/RIY13DCHvqHxPWmiebBXnKKly8+zs/pABUMfFuE5qtdOIv5RxcRl9p1wfV8YgD
         eBNQDn5yrtR58I0oObeM8QcZ567rrAlzu4MflLeWnkrQ2zV/BmtrIxLdchl2J06fnDN+
         V9JTxnU6PbZRsH6DPx89T2dfR3G0DqXQESv+mjirtoVPjs8rgN3y/ihxgiUEP5hNpbHv
         fcVrTk46Mg/x2tigEDxdnHanjr2lvuV7pvCSJlqgHjz8M/xXIaSQ6mBB4fiR+y91q6kr
         IR+Q==
X-Gm-Message-State: AOJu0YyijJgFfh7HCccIBkAyC3n5HVlmophkUxu548OpaqkLE5M1gdFh
	XKFEDnl1MOW4gu4R70RzJs10iqRvzqqtiA==
X-Google-Smtp-Source: AGHT+IHOeHconq3jj9jtskaQDnnkjl+YGg7Nsbq5vTJMwQ4eQJ48UkLy98EJKfCvf2wnrMAFd8nAoA==
X-Received: by 2002:a2e:be9d:0:b0:2cc:6fb6:703 with SMTP id a29-20020a2ebe9d000000b002cc6fb60703mr3155533ljr.43.1703081323567;
        Wed, 20 Dec 2023 06:08:43 -0800 (PST)
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
Subject: [PATCH v6 4/9] xen/asm-generic: introduce stub header monitor.h
Date: Wed, 20 Dec 2023 16:08:26 +0200
Message-ID: <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Switch partly Arm and PPC to asm-generic/monitor.h and only
arch_monitor_get_capabilities() left in arch-specific/monitor.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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



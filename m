Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C17FA218
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642127.1001396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMt-0008K4-TU; Mon, 27 Nov 2023 14:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642127.1001396; Mon, 27 Nov 2023 14:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMt-0008F1-LY; Mon, 27 Nov 2023 14:13:47 +0000
Received: by outflank-mailman (input) for mailman id 642127;
 Mon, 27 Nov 2023 14:13:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMs-0005in-DY
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:46 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c95ebc5-8d2f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:13:44 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507c5249d55so6474024e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:44 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:43 -0800 (PST)
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
X-Inumbo-ID: 2c95ebc5-8d2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094423; x=1701699223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnIg8DAf+y9I4dvM43pjfdMpTdd4ChaNYKivfQNekNQ=;
        b=R+yLmRlOPLVRbLjrLZr8TmPEv7ofHHuWbbTvl6xe9l5xX/9kGmcCNQqI7A7inF/525
         fLmkaJ1/1g1kyHFGP+5S7vgJer2mAZC/Fdlzl/usTh1FF0z9TX5INxteRyUyPdGMdNCk
         VFloflCBgZR0TEIfg0mjD2gPmydwNJu8BaHboL3eO0DXnBA+4wJQ8Jb+HQEto40zjFIu
         PTr+PCNdiIcA4z0sjV/Liw59LgkgD/uOZkCW8dD52B30jqF2yDHT+gjDVj7TB9440YzQ
         /Fw6D4Nd3lPgHdLganMG6BtorUI9E/CUGvg3iNs2i43c9oy4sAhu5le94jB+xRjH0a2U
         fc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094423; x=1701699223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnIg8DAf+y9I4dvM43pjfdMpTdd4ChaNYKivfQNekNQ=;
        b=dHYKs8wzjr//hGNYNjzZ+6fnscBwMb8Zh03jSGXkLGeMPmofy3Ae+oNeo2mVGDiI8i
         4EJXnFbUX2pNKaGFjYAwg5GVkeEkXqlqIF5SSWCt26OO0WCpVPuG4Zd6qh71uBQIYxXE
         9ssLWt8OprJa8hDwkM5gpxbr/18KkyQmIKC1wuZ/ev7JHKdHKo/J/7STlcVdAFoizRul
         +iLroC/WB+3LWXOfTuJdmQ2u7tCadomBvTXgBABYGESy2VMkHnXTCT0dtCXT4kvfFHXs
         TZrw9hImhhp4yPOZq7/OetNlT9FBDj4flp74S9aKu667UGlXhM1pIv8E6dKEQYdguW1S
         acMQ==
X-Gm-Message-State: AOJu0YznDyYZ7mN104+OFf3EVtjACXyng4gC+3vOsLx1sZ6GA54sv1oc
	nMAv4aqPVhazIG6vk8oh8tEEPNEBx2N6Gg==
X-Google-Smtp-Source: AGHT+IEz0BsFdd9YfJPJCwRyQXF90Zskc6ipeZE43MBh+1q4c9KD9668ivj++xWsjE+B2qEDYYjk+g==
X-Received: by 2002:a05:6512:3b2c:b0:4fb:9f93:365f with SMTP id f44-20020a0565123b2c00b004fb9f93365fmr5720616lfv.38.1701094423201;
        Mon, 27 Nov 2023 06:13:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 10/14] xen/asm-generic: introduce stub header monitor.h
Date: Mon, 27 Nov 2023 16:13:23 +0200
Message-ID: <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between several archs so it is
moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/ppc/include/asm/Makefile  |  1 +
 xen/arch/ppc/include/asm/monitor.h | 43 ---------------------
 xen/include/asm-generic/monitor.h  | 62 ++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 43 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/monitor.h
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 319e90955b..bcddcc181a 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
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
index 0000000000..6be8614431
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,62 @@
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652F78B4EA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 17:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591664.924110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaec7-0004GU-Tb; Mon, 28 Aug 2023 15:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591664.924110; Mon, 28 Aug 2023 15:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaec7-0004AP-Oj; Mon, 28 Aug 2023 15:57:15 +0000
Received: by outflank-mailman (input) for mailman id 591664;
 Mon, 28 Aug 2023 15:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Xqe=EN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaec6-00047N-D7
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 15:57:14 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df39594-45bb-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 17:57:13 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso5127605e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 08:57:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 t25-20020ac24c19000000b004fe8424c750sm1636027lfq.47.2023.08.28.08.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 08:57:12 -0700 (PDT)
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
X-Inumbo-ID: 8df39594-45bb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693238233; x=1693843033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3FaCqqef1K6tiSJmi/bsptj2FfnmcLKjLPutexhzjQ=;
        b=NG1uJqOs7gckb9FG6vLdhgJ60RYiThCABQ1w+fUQekEQQ7TmLQc4ndYWybOWD2e1Kd
         Btn8QHz35iNdAVuh9dlRrWr6g/RTxHiL0aRYOAg70c+P30yNdyUyeqebktHglNzmztUq
         XgCLRXemZStC+KI2R/rcka8R+pQY9/auWtoz9vgV/4K1ZQYuci1hWzEJpsxQhK9lAnUn
         V3WkX5dwQ7Z/SLncZ3R3EJLgIfNJzOyWqziksmU+W9vuk5lNB9yOb3eyXR/+ltqNBjcA
         1hTIL8j0qkNyE7lh/N59sJhef8WB2ZwGtKJo0iy+F6YgrYIWl/01LdHIJoziotAzOjy+
         jVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693238233; x=1693843033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3FaCqqef1K6tiSJmi/bsptj2FfnmcLKjLPutexhzjQ=;
        b=hRFfA9HjPAdJduBS+bsruIpkhXPJjc5WOl2Ls8UXJD8w8VuOo939qPSiYhgM9ZYoWQ
         eneARSqH6o5gMWRFPn9vdECncu66t4rUfKifqfyKs/rvm/0VK8f5qYd9UTl1Vah6EGHc
         ur8p6NxIXvqSsDfx9KmKPw42k/iOC/OwTRH4n4Ynvijti9TjjmzRM+j0xSpCzVa+pGx3
         Bjb/cnpgaPZpK+sRVK+QiTzfILquo5D2uTcV/qwGap0kQRLKAm7tyV88ZamA4AtbNN+R
         GCI+tRaqOxpZNZqBRsBRGS25B1hScmI3X3a3sMLtw9keR9FSpPn3qgGe5ci004+HzO2A
         2DpQ==
X-Gm-Message-State: AOJu0Yw5z2AGM6+C6BciZMSL+2v4FWmQwemVhLmhTLcqsTb7RCjonc11
	1ZbfMjcxJoTgLclPdBPzvf5s2dptx4E=
X-Google-Smtp-Source: AGHT+IEgCNqkQbwxbUq2+JJ9ec0uCdTXRxqRu83pTJZOIsx1HiIj5+8iry6SCJuLx8jd09JUriiJOQ==
X-Received: by 2002:ac2:4bd4:0:b0:4fb:9f24:bba9 with SMTP id o20-20020ac24bd4000000b004fb9f24bba9mr21609949lfq.5.1693238233044;
        Mon, 28 Aug 2023 08:57:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 2/2] xen: move arm/include/asm/vm_event.h to stubs
Date: Mon, 28 Aug 2023 18:57:08 +0300
Message-ID: <c61f930fed46e2312f460333401488af4b0adfc4.1693235841.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693235841.git.oleksii.kurochko@gmail.com>
References: <cover.1693235841.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
stubs dir.

Original asm/vm_event.h from ARM was updated:
 * use SPDX-License-Identifier.
 * update comment messages of stubs.
 * update #ifdef

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/stubs/asm/vm_event.h    | 55 ++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 66 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/stubs/asm/vm_event.h

diff --git a/xen/arch/arm/include/asm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
deleted file mode 100644
index 4d861373b3..0000000000
--- a/xen/arch/arm/include/asm/vm_event.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * vm_event.h: architecture specific vm_event handling routines
- *
- * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef __ASM_ARM_VM_EVENT_H__
-#define __ASM_ARM_VM_EVENT_H__
-
-#include <xen/sched.h>
-#include <public/domctl.h>
-
-static inline int vm_event_init_domain(struct domain *d)
-{
-    /* Nothing to do. */
-    return 0;
-}
-
-static inline void vm_event_cleanup_domain(struct domain *d)
-{
-    memset(&d->monitor, 0, sizeof(d->monitor));
-}
-
-static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
-                                              vm_event_response_t *rsp)
-{
-    /* Not supported on ARM. */
-}
-
-static inline
-void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
-{
-    /* Not supported on ARM. */
-}
-
-static inline
-void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
-{
-    /* Not supported on ARM. */
-}
-
-static inline
-void vm_event_sync_event(struct vcpu *v, bool value)
-{
-    /* Not supported on ARM. */
-}
-
-static inline
-void vm_event_reset_vmtrace(struct vcpu *v)
-{
-    /* Not supported on ARM. */
-}
-
-#endif /* __ASM_ARM_VM_EVENT_H__ */
diff --git a/xen/include/stubs/asm/vm_event.h b/xen/include/stubs/asm/vm_event.h
new file mode 100644
index 0000000000..6bda6ce7df
--- /dev/null
+++ b/xen/include/stubs/asm/vm_event.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier:  GPL-2.0 */
+/*
+ * vm_event.h: stubs for architecture specific vm_event handling routines
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ */
+
+#ifndef __ASM_STUB_VM_EVENT_H__
+#define __ASM_STUB_VM_EVENT_H__
+
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+static inline int vm_event_init_domain(struct domain *d)
+{
+    /* Nothing to do. */
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+    memset(&d->monitor, 0, sizeof(d->monitor));
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
+                                              vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* Nothing to do. */
+}
+
+#endif /* __ASM_STUB_VM_EVENT_H__ */
-- 
2.41.0



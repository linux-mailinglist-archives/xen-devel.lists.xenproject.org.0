Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF078D7BA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 18:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593174.926125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVK-0003QJ-1y; Wed, 30 Aug 2023 16:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593174.926125; Wed, 30 Aug 2023 16:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVJ-0003Mc-UN; Wed, 30 Aug 2023 16:57:17 +0000
Received: by outflank-mailman (input) for mailman id 593174;
 Wed, 30 Aug 2023 16:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FTw=EP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbOVI-00034Q-0w
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 16:57:16 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45773672-4756-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 18:57:15 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-500d13a8fafso17358e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 09:57:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 er7-20020a05651248c700b004fd36c89c3csm2458240lfb.43.2023.08.30.09.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 09:57:14 -0700 (PDT)
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
X-Inumbo-ID: 45773672-4756-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693414635; x=1694019435; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJZrTgBzzdxBeCWZcRLvZVazbgGNtSI0NZG/c8XfBMQ=;
        b=UOaxEh1lb4AvZy7UwrZayUqlRx13kzE2uHnuQ5zYjckevFmnuYhdC69yUXhGdTyc3O
         RKm+3iJ5vFS0p9AUNtkiMgHiS+I/YDm6cY1Zp/AEYRaCL+yTDfTQjEPt0X2w/xsbrAeI
         S91Th39LdfYOJR8jzbXtgZLNCy3eHF7rkzGu1FGJ74xkNowZFbc64bLoVAkvCAS2n7cf
         INA53RJScGlQXMmQNfHfeRN0X0criuHYC7/0gWQPsrAzPX3HjXot824wUExsc2QWi0/+
         ORdOreqObh/vPgIFvmeavRxu5R47zmQfmLkqy6cGm9WBPK/f3bEunXfL4agSNsAJjBQP
         BeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414635; x=1694019435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJZrTgBzzdxBeCWZcRLvZVazbgGNtSI0NZG/c8XfBMQ=;
        b=OBM/aiz7UxJ9rM/5dKFu7UW4yi/DNza1X6szovDhMKSSyW2mCPnYE3savfjkLO8/6/
         INHl3ma+1H87M3rY3/r0UyRsaQiqPX00LWOttvF9QAVzaKkFWP9OY7ihK3RhS74h3Pjp
         Ta9zGsBZrjpiF7WXyrcpZ/Cma9s4YcyjDtIJDeN44atQ207Yk0cIuAFcGGRd0zMvUugd
         uWezsEjN+dgF1bQ9BP7oVH+X+yyd6d2YQQ8aQfhiAlCahcO3zZxJsAuEHin4y56Tmj+Y
         PkBq5ScbnbPzQVQiPy1D6ZnEc6zu/AusjUpPY54oW9AhozNAqyfWnJUg8ZDPcltanV13
         WmiQ==
X-Gm-Message-State: AOJu0YyznvLM7XIoHm+nwyE6ISk0y5Jbj95sUe4k8cFd80OD9ohcNJN/
	VCYvMyEqXW7l747XNunDEpattwBoi5E=
X-Google-Smtp-Source: AGHT+IHOCwoXzO42Oj97tvPkXhDAbErRlPtO5B5CSO1jVrpkHhlaO5DfQUwPs/iTcNB5Rz/mD/jFCQ==
X-Received: by 2002:a19:e054:0:b0:500:81fa:46f1 with SMTP id g20-20020a19e054000000b0050081fa46f1mr1863117lfj.67.1693414634464;
        Wed, 30 Aug 2023 09:57:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] xen: move arm/include/asm/vm_event.h to asm-generic
Date: Wed, 30 Aug 2023 19:57:07 +0300
Message-ID: <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693414172.git.oleksii.kurochko@gmail.com>
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
asm-generic dir.

Original asm/vm_event.h from ARM was updated:
 * use SPDX-License-Identifier.
 * update comment messages of stubs.
 * update #ifdef.
 * change public/domctl.h to public/vm_event.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V3:
 - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
 - update SPDX tag.
 - move asm/vm_event.h to asm-generic.
---
Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
---
 xen/arch/arm/include/asm/vm_event.h    | 66 --------------------------
 xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
 2 files changed, 55 insertions(+), 66 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/asm/vm_event.h

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
diff --git a/xen/include/asm-generic/asm/vm_event.h b/xen/include/asm-generic/asm/vm_event.h
new file mode 100644
index 0000000000..29ab1b01b4
--- /dev/null
+++ b/xen/include/asm-generic/asm/vm_event.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
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
+#include <public/vm_event.h>
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



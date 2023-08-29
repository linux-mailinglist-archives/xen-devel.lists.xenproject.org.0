Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593D78C7A6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592336.925047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznz-0001FO-HV; Tue, 29 Aug 2023 14:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592336.925047; Tue, 29 Aug 2023 14:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznz-000193-A3; Tue, 29 Aug 2023 14:34:55 +0000
Received: by outflank-mailman (input) for mailman id 592336;
 Tue, 29 Aug 2023 14:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8Qf=EO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaznx-0000r8-MF
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:34:53 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3640b907-4679-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:34:51 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ff9b389677so6945823e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 07:34:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 21-20020ac24835000000b00500a2091e30sm1963770lft.115.2023.08.29.07.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 07:34:50 -0700 (PDT)
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
X-Inumbo-ID: 3640b907-4679-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693319691; x=1693924491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8kgryzR8q+ikO/cKWzA/ywCNibZGw3rXJamJP+9Z3Q=;
        b=Hn8s+UGm0Cl1seaV/cUWJoz/LGRRl7hyJ9fCbu+2E2Fy5QxolVKl0GP7tuwtj18g8S
         kjC7WvdMIvsZ+NRTmB47VtfJigSTa4fZxam3I+jkUOqNDYkob9SeCd51q4rRAnga7Gpu
         AYs1AETuk2TZJ1CRRMT4wexXZS+NQnv1mPF3O48Y2rAn6hI3V+mrAiEGwhEsvv2wQghQ
         7XSHXEhPcPzR/vhuXkuORdMtZp6dOKLH4wQ1tQFLh88ma/0nuciVFKwQnLOSv+tkwO+v
         0RsBN0hWFIioDw9NwHAfdAc7NoxGbqMgLBkwzuDoDs73/WhV2g/U8NtpV6H7z6I4Q586
         wCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319691; x=1693924491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8kgryzR8q+ikO/cKWzA/ywCNibZGw3rXJamJP+9Z3Q=;
        b=gk+MX2CDfl5gzxIfhrsi+pglyejIBSrRdwaCVR/MIpDXY6lKPCXJxfax189cr3th3J
         Y6DJOFHhgddREituawyGc83fdGBM+kPuYhyaJF9Lq4yBfGFrYl3SbRFX4PNeSdDFF15y
         xLDPneI9dp3ukTwWga23HuYW62VTBKy4y3Qn3oVEKjzFQpz7f3PNfzZngwPQAJLXOZzb
         4ObnUfBuw1HpGyi6CJdC9UU1SPUzgMLpXLaQr8Wm2WspJj1xaZpBoSQnE4WA2Nf9EEK0
         jO7QbHNKOwgyxTneMSvExctBfl/ROH2TVctYx+g7PBkBpUdrXEGH9u7jcBhLs7n/+CjN
         fiSw==
X-Gm-Message-State: AOJu0YyY6hr/unjLUsvpVEm6LRWYsunaH5D3kocVMjnLnTba5HPsbLht
	i/H4LTrkWOMXztVTDXS5QlpacqW36MI=
X-Google-Smtp-Source: AGHT+IHSkdBG+DIsjUsSawlIt4FtSHo0xjbp3x2B71RvAgDI/tD4IRsz3o/q7d4KSeVX8ZyV+n30WQ==
X-Received: by 2002:a05:6512:3d8a:b0:500:c709:5845 with SMTP id k10-20020a0565123d8a00b00500c7095845mr775025lfv.4.1693319691222;
        Tue, 29 Aug 2023 07:34:51 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
Date: Tue, 29 Aug 2023 17:34:39 +0300
Message-ID: <31fb5b635fc5a02fd7103ecd64d2b66443c6e038.1693319118.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693319118.git.oleksii.kurochko@gmail.com>
References: <cover.1693319118.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
stubs dir.

Original asm/vm_event.h from ARM was updated:
 * use SPDX-License-Identifier.
 * update comment messages of stubs.
 * update #ifdef.
 * change public/domctl.h to public/vm_event.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
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
index 0000000000..cc89ffe5fb
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



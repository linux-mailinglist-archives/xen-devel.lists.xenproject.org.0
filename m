Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD45797342
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 17:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597478.931727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGjt-0003S9-MK; Thu, 07 Sep 2023 15:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597478.931727; Thu, 07 Sep 2023 15:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGjt-0003PW-Jd; Thu, 07 Sep 2023 15:16:13 +0000
Received: by outflank-mailman (input) for mailman id 597478;
 Thu, 07 Sep 2023 15:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeGjr-0003AI-Dq
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 15:16:11 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c58c85-4d91-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 17:16:10 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so19336211fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 08:16:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x2-20020a2e8802000000b002bbacc6c523sm3944055ljh.49.2023.09.07.08.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 08:16:08 -0700 (PDT)
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
X-Inumbo-ID: 79c58c85-4d91-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694099770; x=1694704570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgYSo7DZzzYqnhzSFLB9XVyVN1T4yIUqP15YWWRhIHw=;
        b=JimElWEuHtwtmxWix7nhE9Gs2TZHF75bluJRUrHAJxE1i5Oss4SNi4hq3ObLruRSmE
         CJ91mY53Z+Hm2Xuux6IgmAGkw+zrqzt/KkksF2fsThig4c3Hs/3yQoBO9exsnaDeQgQA
         oilNJc6NbHBHh77My1Gbte1SevZ9jDvcGyENpWC3rgqdIqrfXq0zDa8tU+BQ0sLCx79+
         aLkWsG/Y0Q+V1pDNtOfwnDTB6guogvOw2AI1vKHndfhMd4bHkpiEMNfKc7cHz16f2L2Q
         cfHQBY96Tn7kMeGY0MVVbYBsU4HAFLak1kaUsufqVQ+ApRCQLn7ngnHBSZYLoyOn9rcV
         C2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694099770; x=1694704570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgYSo7DZzzYqnhzSFLB9XVyVN1T4yIUqP15YWWRhIHw=;
        b=HjDVUwxvAwW8QcACB6O+5B7HGmAmI98MSXt93m4xNUOBPPRhuYYnQ3OvVkv/CzNAiG
         B9qkQpXNtnRCd7QaK93nDPkGLe3IghOlnDeJPKznmRkfwVH0r42wh41homi2tJ3WI72t
         fhQjJk+RFeUyxQBTLyb9miCa9PyiMn4VMPEoZ7j53sW9hPe3QKwslyPjTZR4mXmj93co
         lCs+EOeP7fAEbFk4XYbBpS1CbQR3LUUPFdjFZITdpmQZ/rWF1Bc+0+wqNyaFOE66kVPl
         BD5lC9Ltvk4wwkr0m9YDIGZPJwmiARRYYvq32D4XLvYQ/awti2U8eotHzJluxwkAPYgI
         faQA==
X-Gm-Message-State: AOJu0Yy9tXiW1/1KS8TRzuh72iP+qkj+4bKwkpbN11c8Rc4ZfRqky6Ql
	Uy8G9rGGMbsaENiDkzx2+iwKQT3wJxU=
X-Google-Smtp-Source: AGHT+IELS9ppTUSojnzqfwGXeBPnrBczNmjv4sIpk7AK2gNYRokiax/g9aSarzN+KASVnSpX23TTCQ==
X-Received: by 2002:a2e:9b04:0:b0:2b5:7f93:b3b0 with SMTP id u4-20020a2e9b04000000b002b57f93b3b0mr4765080lji.17.1694099769663;
        Thu, 07 Sep 2023 08:16:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 2/2] xen: move arm/include/asm/vm_event.h to asm-generic
Date: Thu,  7 Sep 2023 18:16:00 +0300
Message-ID: <5ff2d32ddd56f98a9c4a28c600457d6df022f755.1694097564.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694097564.git.oleksii.kurochko@gmail.com>
References: <cover.1694097564.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
asm-generic dir.

Original asm/vm_event.h from ARM was updated:
 * use SPDX-License-Identifier.
 * update comment messages of stubs.
 * update #ifdef
 * instead of "include <public/domctl.h>" -> "public/vm_event.h"

As vm_event.h was moved to asm-generic then it is needed to create
Makefile in arm/include/asm/ and add generated-y += vm_event.h to
it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in V7:
 - update guards in asm-generic/vm_event.h.
 - add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in V6:
 - update the commit message.
---
Changes in V5:
 - Update the commit message
 - Remove Acked-by:...
 - Switch ARM to use asm-generic/vm_event.h
---
Changes in V4:
 - update path of vm_event.h from include/asm-generic/asm to include/asm-generic
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
 xen/arch/arm/include/asm/Makefile   |  2 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/asm-generic/vm_event.h  | 55 ++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 66 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/Makefile
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/vm_event.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
new file mode 100644
index 0000000000..821addb0bf
--- /dev/null
+++ b/xen/arch/arm/include/asm/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += vm_event.h
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
diff --git a/xen/include/asm-generic/vm_event.h b/xen/include/asm-generic/vm_event.h
new file mode 100644
index 0000000000..620c7b971c
--- /dev/null
+++ b/xen/include/asm-generic/vm_event.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+/*
+ * vm_event.h: stubs for architecture specific vm_event handling routines
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ */
+
+#ifndef __ASM_GENERIC_VM_EVENT_H__
+#define __ASM_GENERIC_VM_EVENT_H__
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
+#endif /* __ASM_GENERIC_VM_EVENT_H__ */
-- 
2.41.0



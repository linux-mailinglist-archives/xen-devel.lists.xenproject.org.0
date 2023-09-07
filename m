Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18055797147
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 11:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597192.931399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPO-0007Wo-7X; Thu, 07 Sep 2023 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597192.931399; Thu, 07 Sep 2023 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPO-0007R1-0l; Thu, 07 Sep 2023 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 597192;
 Thu, 07 Sep 2023 09:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeBPM-0007Hd-5h
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:34:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c40d9f3c-4d61-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 11:34:39 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so13195901fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 02:34:39 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e9b13000000b002ba586d27a2sm3797539lji.26.2023.09.07.02.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 02:34:38 -0700 (PDT)
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
X-Inumbo-ID: c40d9f3c-4d61-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694079279; x=1694684079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0i1L5EVdzU0FCwpknTZBdJpHLn8zWZSeORY08bU9o8=;
        b=ExMwVhPusgSHIoIj7ULP7gVJxC90UbhCiDUROhlFJaK2lE6gQEKvyAZba0eYzNJG+d
         nNkL++Qp/wzY1saxeeNMyC1s0E9OMH7ZTUnhyxPyd05HNihNk00qR309CtkKmol2LKMt
         tkSeuRoekoFaKG5/Q5ANRe38qK+/W87Ps/5PCqLo8SLbWVclHsrZ1m76SFQ83pPUmIlT
         vj9QqW6GV8RwToSVhFzSaZc5ZsG1jqpLSR2adAKGDpfP01eba1MS/dzSdlh+HmuZI1jj
         fHFLWxTlWb3OhLxKo4qALQPL8rj8I/SETk7xrgyO2iIMkN02TyB1AOkGu9Y+KkOO4FIZ
         5d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079279; x=1694684079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0i1L5EVdzU0FCwpknTZBdJpHLn8zWZSeORY08bU9o8=;
        b=PHjqr4sPucni1JImTatyUXWiHIB+4n2VjsABWBBAR+V53Vj7LskfIh2MI9BLIFMuEL
         +iG3QzotkKu/B2qqD+Foy/ehedj91/4TeVIyFc0o6WTTIOBeZa9TfmbU+u4BXvTy2UCn
         sF0uTa5w7YbKoNTpRrLrlmDqFC8+0nLIkkijfCjn4Oycg/HajU8uEPKwreabFJuZcyXz
         +63gslnqiOsoSNiFdEyYpFsHr4A4rDkiTDquQTCGxOCar420wk6pn3BmrSIz5kF597LQ
         ygGBiV16zVe1Ti4nbGL5a0Cuq55gT0w+eecktwty7yj0pYGsIC7UZtBGORzvREht5M1s
         I0ZA==
X-Gm-Message-State: AOJu0YwA9rnMfzaevjqOao0UiU18p3FccFZHBnuH2kbeqQ/kcxVlEkbz
	FSTKrJCk9gh8dTnmyIlV/lVKq+3xQF0=
X-Google-Smtp-Source: AGHT+IHKzZZBJuwhDbCPo2KED9eJsJqIj4oG8WXxRjUcwudQM3ahmjzYvhuZ5av+UbGL5sSc0xlglA==
X-Received: by 2002:a2e:b16e:0:b0:2b6:e283:32cb with SMTP id a14-20020a2eb16e000000b002b6e28332cbmr3907930ljm.23.1694079278489;
        Thu, 07 Sep 2023 02:34:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/2] xen: move arm/include/asm/vm_event.h to asm-generic
Date: Thu,  7 Sep 2023 12:32:57 +0300
Message-ID: <47e12756edfefdb5ff1112ae6b78ae95baadbbef.1694078544.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694078544.git.oleksii.kurochko@gmail.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
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
index 0000000000..29ab1b01b4
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



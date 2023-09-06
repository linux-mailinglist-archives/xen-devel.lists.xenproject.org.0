Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A37943DE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596800.930866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRz-0007ar-1w; Wed, 06 Sep 2023 19:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596800.930866; Wed, 06 Sep 2023 19:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRy-0007Xl-VF; Wed, 06 Sep 2023 19:44:30 +0000
Received: by outflank-mailman (input) for mailman id 596800;
 Wed, 06 Sep 2023 19:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdyRx-00073v-HJ
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:44:29 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9ee1acc-4ced-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 21:44:27 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5008d16cc36so227307e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 12:44:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x26-20020a19e01a000000b00500d1f67be9sm2895825lfg.43.2023.09.06.12.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:44:26 -0700 (PDT)
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
X-Inumbo-ID: c9ee1acc-4ced-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694029467; x=1694634267; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RY7OtZagCYc1AZV4czHy5Fw88OzBUmzWwNM4JA2qmA=;
        b=LI49whOjcBfJAeyvOZHMkuzaJ0ZG4nkk8hPV07LA4LTh//MXz5MAA1sM79JNUmXSa8
         0AUu1svD0EdYAm0qkpbNUSPG+YRyqjNM9jyOjiMiSqyyxUwJEisYLGvXqjllVXFoBcty
         0zKVQZopsHvn1F2syejxuCd12oPNt68JRWLRpUMApumhRCNRsWy3A2u7H4L9IN89AtBR
         KW1bjBryLZkktNhmm665BIwK70B4xH19/G+APGMgubE71fxu+OAxvALn3rBGKWNJJX2n
         CIWMv3h3bVA416T1ImDKDB4VNfZVYJZqpYvn805Wvm8v6wphRdS37SB//2Lozwlq6sOj
         Awsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029467; x=1694634267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RY7OtZagCYc1AZV4czHy5Fw88OzBUmzWwNM4JA2qmA=;
        b=IrmjqKqz2QsLSBTYENc7L1o/nQAbhqSZJg5JU7Pr7VYXKEEZT704+5kcS5GLeuiM4q
         0jkeqf/R/HCpUVHnpQZ6SAAnzaPuVJa/oGPyzDV8jySPHsOOjqtHfQ9g8hemBu5vD7WU
         /8poRTTun2iqZcDfVr0R594G7r38Ql8vl7gY4VON54CTVOmKncVpppjehmHJVtrXpdaQ
         UAzyeQx5GZFjS5jfHYCJr0WWh1Eue7Jxvtxty74iDwCq3ylHA7rG8p/qZi+oLkB7DQD8
         39cr7Yvn2HBm9U4WX0Kj+pbMpwV0bwvLLWEA8FjN728eKl7eO6SyYlbnGoVmxoUUs9qV
         jVWw==
X-Gm-Message-State: AOJu0Yxs/ZblD8KwngPwhHS8so8aUejouHuQsaZw9PTVDYhqnAM+zdSV
	GcwUjj2URbjR5XypcOIhWdK2voxJKXc=
X-Google-Smtp-Source: AGHT+IGZPcNLB5HfUF/MMbTWn0yhCJ/MUbMQLijvx07c7PkPj4GQKdwLaxishM2uqyE6oGuGev3iUw==
X-Received: by 2002:ac2:5b8f:0:b0:4ff:ae42:19e2 with SMTP id o15-20020ac25b8f000000b004ffae4219e2mr2661589lfn.58.1694029466697;
        Wed, 06 Sep 2023 12:44:26 -0700 (PDT)
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
Subject: [PATCH v5 2/2] xen: move arm/include/asm/vm_event.h to stubs
Date: Wed,  6 Sep 2023 22:44:22 +0300
Message-ID: <108a5bd46316993684bf6325d7843cdfb126a530.1694024884.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694024884.git.oleksii.kurochko@gmail.com>
References: <cover.1694024884.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
stubs dir.

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



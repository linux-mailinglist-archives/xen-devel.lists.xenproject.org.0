Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9447FA216
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642126.1001385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMs-00080q-DI; Mon, 27 Nov 2023 14:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642126.1001385; Mon, 27 Nov 2023 14:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMs-0007wP-7V; Mon, 27 Nov 2023 14:13:46 +0000
Received: by outflank-mailman (input) for mailman id 642126;
 Mon, 27 Nov 2023 14:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMq-0005XE-F8
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:44 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c28e230-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:43 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507c5249d55so6473999e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:43 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:42 -0800 (PST)
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
X-Inumbo-ID: 2c28e230-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094423; x=1701699223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfFkIWV/5QoXgBfRidEiq3DVpTBnfp3dPpbyHjgJaBY=;
        b=hraTyRggYQESA8UfITKKImw3TsG4mc2Xo1KFagAyRWt6WmFNXVQnHPCxrG+/v4vbat
         y0l+iW+Sapq1WS2OmWL7Cv+u6EhSBcWpfS5JcH1o8X1FvlJGMqXWM+OD8G2zaHHRxxI4
         ES9XTXfFtIGlpDPhQg+VzII+1htiYEFL1/bbGhBHrYrB2LRE6mK3EC/UBktYP45Rj1h2
         YACDKT0ib7DIJ3kO3LD1b2AvYkpxsahCjUsCbdAeu0qOlTHDTCMWpWqaa9o9aOHcobXM
         2Y9s+4OOfHbZEN7fVGzny3TztbR/NSCujEtTBhcUfpAFAIyYeT1oEgEeZ0dVYG+vtCoa
         rCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094423; x=1701699223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfFkIWV/5QoXgBfRidEiq3DVpTBnfp3dPpbyHjgJaBY=;
        b=pBGq2Jz83Tc5/9GSaz4DSNzPGdJlcYmlMSlmiw51d90TmwbLSzWQCuxafXFbHBNp/i
         B1EHS3Jr35as0F2IC62v13nvamowUnyCzfdQt3FwxlMKA/jqmNpCOUIsEMMPcHTuJ6la
         pej1EPAXnuu/yXcGGf443B8L/SfxD3GYkFbksYc/BWBFNz/C3xqhyafDFKIf1gIqdH0a
         vfyinXPp8UaKTkOrJc6UKw9Ag3WZF19F1/Vpg/9mDKeHj/aHJjsDmFLoYI2mGO5r/554
         8O47VlovKIS/lfJtXa9M3BTAxJFJLesKmglYZPZOOa6hvsBEb8FOUqDcky9FDKe+o36e
         Iyew==
X-Gm-Message-State: AOJu0YyQZohu0PStcdoac3zhWjI2obAAEu3IXDtgxkT6Dl8o6kKx18dA
	CVZ4Y1leVs0M6WJVR2W9PNBnTHJght9dtg==
X-Google-Smtp-Source: AGHT+IHKIKz8d5RLuVwcYataUKXp7A3JIB7f6KQ7x0z9RxUJeoO8rwo+r/odpwVF2RJzG4fFifOa7w==
X-Received: by 2002:ac2:4c55:0:b0:507:a1b3:2d47 with SMTP id o21-20020ac24c55000000b00507a1b32d47mr8022420lfk.17.1701094422549;
        Mon, 27 Nov 2023 06:13:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 09/14] xen/asm-generic: introduce generic header altp2m.h
Date: Mon, 27 Nov 2023 16:13:22 +0200
Message-ID: <5e1846febdbc5b9ebfe61993231dbebc9457f083.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/alt2pm.h> is common between several archs so it is
moved to asm-generic.

Arm and PPC were switched to asm-generic version of altp2m.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

 Michal asked the following:
  Shouldn't this copyright be moved to generic header as well?

 It seems to me that it is fine to leave the stub altp2m header
 without the copyright "Copyright (c) 2014, Intel Corporation.".
 
 If an absense of the copyright violates something I will be
 happy to add it during merge.

---
Changes in V4:
 - Update the commit message
 - Added Acked-by: Michal Orzel <michal.orzel@amd.com>
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Drop Arm and PPC's altp2m.h
 - Update the commit message.
---
Changes in V2:
	- change uint16_t to unsigned int in declaration of altp2m_vcpu_idx
	- update the commit message
---
 xen/arch/arm/include/asm/Makefile |  1 +
 xen/arch/arm/include/asm/altp2m.h | 39 -------------------------------
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/altp2m.h | 25 --------------------
 xen/include/asm-generic/altp2m.h  | 34 +++++++++++++++++++++++++++
 5 files changed, 36 insertions(+), 64 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/altp2m.h
 delete mode 100644 xen/arch/ppc/include/asm/altp2m.h
 create mode 100644 xen/include/asm-generic/altp2m.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index f6f108bbb8..55d153ed82 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
deleted file mode 100644
index df50cb2f09..0000000000
--- a/xen/arch/arm/include/asm/altp2m.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Alternate p2m
- *
- * Copyright (c) 2014, Intel Corporation.
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
-#ifndef __ASM_ARM_ALTP2M_H
-#define __ASM_ARM_ALTP2M_H
-
-#include <xen/sched.h>
-
-/* Alternate p2m on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    /* Not implemented on ARM. */
-    return false;
-}
-
-/* Alternate p2m VCPU */
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
-{
-    /* Not implemented on ARM, should not be reached. */
-    BUG();
-    return 0;
-}
-
-#endif /* __ASM_ARM_ALTP2M_H */
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 5364bb1d59..319e90955b 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
 generic-y += device.h
 generic-y += div64.h
 generic-y += hardirq.h
diff --git a/xen/arch/ppc/include/asm/altp2m.h b/xen/arch/ppc/include/asm/altp2m.h
deleted file mode 100644
index bd5c9aa415..0000000000
--- a/xen/arch/ppc/include/asm/altp2m.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_ALTP2M_H__
-#define __ASM_PPC_ALTP2M_H__
-
-#include <xen/bug.h>
-
-struct domain;
-struct vcpu;
-
-/* Alternate p2m on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    /* Not implemented on PPC. */
-    return false;
-}
-
-/* Alternate p2m VCPU */
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
-{
-    /* Not implemented on PPC, should not be reached. */
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-
-#endif /* __ASM_PPC_ALTP2M_H__ */
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
new file mode 100644
index 0000000000..39865a842a
--- /dev/null
+++ b/xen/include/asm-generic/altp2m.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_ALTP2M_H
+#define __ASM_GENERIC_ALTP2M_H
+
+#include <xen/bug.h>
+
+struct domain;
+struct vcpu;
+
+/* Alternate p2m on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    /* Not implemented on GENERIC. */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented on GENERIC, should not be reached. */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_ALTP2M_H */
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



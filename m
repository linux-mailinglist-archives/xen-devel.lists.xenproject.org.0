Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985D7EF290
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635119.990947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu8-00039w-J9; Fri, 17 Nov 2023 12:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635119.990947; Fri, 17 Nov 2023 12:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu8-00037Y-CA; Fri, 17 Nov 2023 12:25:00 +0000
Received: by outflank-mailman (input) for mailman id 635119;
 Fri, 17 Nov 2023 12:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu6-0000iK-Lq
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:58 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51b6f61a-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:57 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507cd62472dso3284831e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:55 -0800 (PST)
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
X-Inumbo-ID: 51b6f61a-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223896; x=1700828696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl4iF/FkI2FedcYr2gK5iEVqy4B8r/7vxJoL3llru3Y=;
        b=Q9xGDPf3UTgOG//69XRx6MNhY2U8JxPD0+I9aOFfuhjwTHaUIsQ8sF1EloAafWPhsZ
         BkfbtF8I57bc0bVNRXXNI7ZMan0Omr//+h+il7j8kdOo0NmveI5F3048dHvUdf7ulwOA
         8ddEkKiFGVHAJB6fBroTbBo9ptQHFN7yRAcd8/TLQ8J1YMUu2y+mnfMFXaEywOrH9VKo
         Lmn1KeFoDPjW6m+cYW2F7vtcrNxU5q5iSLteLZm6neD2ZMO1T/TL53WmCMZVl+F/tapL
         2qrRnlFwSZgs1EitCB/SXlfeU2xtFu5WLhaYk5zfsw43l0GQCpg4GQldgDAThCGWxc7r
         D84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223896; x=1700828696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl4iF/FkI2FedcYr2gK5iEVqy4B8r/7vxJoL3llru3Y=;
        b=C5LtZD/vnmsz9fVXxkKEjomoS0QiTTBJ4kA+O2xAKHGJ0dCw1pGSMBpMT47Gb1rqu4
         67ruO29mVQwZcfeHdBJBds2Rg3WcT0Dyjd4vJ26+Hqk/AbWpzYoiDHMNCCA8tLMI+JnP
         ES5c9+qtmJSCgoHfYEp12D8kYGLcJYbU19iQA0/kAQmUUuWhZI4hMUu3dorqLp4QygdT
         qNyumDLma+nb5JncYli14Tx4jUQVpOKIyZMDEgI6UqjTwF6iCGHGUeRbdE9iPKF46bk0
         Odhci26gwjK6SArziMLjlh8bPar2C8pbjSKk5yo4wTRX3ir3IfdwWaGt9Zp+WtbN8x9h
         KRAQ==
X-Gm-Message-State: AOJu0YwNCHgIG30OpGQ5fEZbYddbtQ7gaXpPO2KqeuIkZmuMlhGstgd8
	gmECfsGPb4NqQnZlnwr+KclpkpY71L4=
X-Google-Smtp-Source: AGHT+IGS/KYKzWD4X2WyiU5KxDXlxhn6lkHLzh8Ep5tZGdrI6Za/XhwkhBv3v/L1gzuf8l5qz49yEw==
X-Received: by 2002:a05:6512:e9c:b0:509:dd1:74f8 with SMTP id bi28-20020a0565120e9c00b005090dd174f8mr2493853lfb.2.1700223895492;
        Fri, 17 Nov 2023 04:24:55 -0800 (PST)
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
Subject: [PATCH v3 09/14] xen/asm-generic: introduce generic header altp2m.h
Date: Fri, 17 Nov 2023 14:24:33 +0200
Message-ID: <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/alt2pm.h> is common between archs so it is moved to
asm-generic.

Arm and PPC were switched to asm-generic version of altp2m.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 36d95d6310..8221429c2c 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
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
index b4fbcc897b..a8e848d4d0 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
 generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
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
2.41.0



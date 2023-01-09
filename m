Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A49662A65
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473750.734531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMh-0002X5-40; Mon, 09 Jan 2023 15:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473750.734531; Mon, 09 Jan 2023 15:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMg-0002Tr-VO; Mon, 09 Jan 2023 15:47:10 +0000
Received: by outflank-mailman (input) for mailman id 473750;
 Mon, 09 Jan 2023 15:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMf-0001Ok-Td
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:10 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df406b08-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:07 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id u19so21089343ejm.8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:08 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:07 -0800 (PST)
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
X-Inumbo-ID: df406b08-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWY8J8kAj1GiWYViPSk623jkw9JIRhe7Xct39qK260A=;
        b=faYE9gRMjOWUAZnlxR0n2k9ulExL3BU8gI18/Go4uLkUS4fR5scoMfT35S9KZX6uOZ
         HYcsprc8PFa524gIL0PuYzj83/O0v76JhM9H0K71qV4HBkB1VbcvsHS9CsBandHEWM6v
         h6RSj/hpZPc6kaZrGllx0TIOL5weII6SDKKXrdHybOsF0lkyVfqUnyMR+QA4cpiiNvAH
         jJykCOSQewTcwUzVCbX8SQHJeNvHvrZovH3LDTsOph02VLCdUgOFaLKIQ15PUsNNoKTf
         c4vgdZn2MqTMN0j/Th5xBT2e2TryjD1gKV9oV+Ni4u/sO3SC56gvlhVsd5lqKmhT3lyt
         Vngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWY8J8kAj1GiWYViPSk623jkw9JIRhe7Xct39qK260A=;
        b=gXMB/0PkkuIUe3w+qUiNu0M81ModaJNGFYTQpRUVuFb9TO70Dgp0Ehz0w6XeOIIuOA
         AtiKyP8It5zziN7zdb69VmHkGBdUYg6L5ZQxPO/f7LqVsA5Ytd80QP6JQDZ0fhbvCvpr
         iwdoMdqj9LNiIzMndFwVt/JptU8GLWf7xpCFSIlXH1ZfuovW0dg2HxjvA5sruDmK/tcC
         hpU40rnLfKETMyPHiyiJMw8Q17WRZLnNgyhRWjIsgGvM1kVZbjPVRGu0OhM0FDx1EcqN
         uIA0HmoETt52I1e0d069Zs3Ckg9kt+pkML9hRPIHsiEqfeqIq1XjlWTVD1fcAolwZtmC
         Kvgg==
X-Gm-Message-State: AFqh2kodYfOoFdBZB3XrolJPVZdCVJFnOT3DXg+7mTP6otPUxQhe0r7h
	rH5i3cRBi17eSh0n1Y3AF7Rp+9UTmrO53w==
X-Google-Smtp-Source: AMrXdXs1yjbXpCwoz+bkJ3Hs45mkL4PCi7WcVeUtjcR0VS78Hau/5cELtha3tptBw3sIe+pxnYA3NA==
X-Received: by 2002:a17:907:d48e:b0:7ae:b2e4:7b3f with SMTP id vj14-20020a170907d48e00b007aeb2e47b3fmr60936186ejc.8.1673279227517;
        Mon, 09 Jan 2023 07:47:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 4/8] xen/riscv: introduce sbi call to putchar to console
Date: Mon,  9 Jan 2023 17:46:51 +0200
Message-Id: <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduce sbi_putchar() SBI call which is necessary
to implement initial early_printk

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - add an explanatory comment about sbi_console_putchar() function.
    - order the files alphabetically in Makefile
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
 xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/sbi.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5a67a3f493..fd916e1004 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
+obj-y += sbi.o
 obj-y += setup.o
 
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
new file mode 100644
index 0000000000..34b53f8eaf
--- /dev/null
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later) */
+/*
+ * Copyright (c) 2021 Vates SAS.
+ *
+ * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Taken/modified from Xvisor project with the following copyright:
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef __CPU_SBI_H__
+#define __CPU_SBI_H__
+
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
+
+struct sbiret {
+    long error;
+    long value;
+};
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
+        unsigned long arg1, unsigned long arg2,
+        unsigned long arg3, unsigned long arg4,
+        unsigned long arg5);
+
+/**
+ * Writes given character to the console device.
+ *
+ * @param ch The data to be written to the console.
+ */
+void sbi_console_putchar(int ch);
+
+#endif // __CPU_SBI_H__
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
new file mode 100644
index 0000000000..67cf5dd982
--- /dev/null
+++ b/xen/arch/riscv/sbi.c
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Taken and modified from the xvisor project with the copyright Copyright (c)
+ * 2019 Western Digital Corporation or its affiliates and author Anup Patel
+ * (anup.patel@wdc.com).
+ *
+ * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2021 Vates SAS.
+ */
+
+#include <xen/errno.h>
+#include <asm/sbi.h>
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
+            unsigned long arg1, unsigned long arg2,
+            unsigned long arg3, unsigned long arg4,
+            unsigned long arg5)
+{
+    struct sbiret ret;
+    register unsigned long a0 asm ("a0") = arg0;
+    register unsigned long a1 asm ("a1") = arg1;
+    register unsigned long a2 asm ("a2") = arg2;
+    register unsigned long a3 asm ("a3") = arg3;
+    register unsigned long a4 asm ("a4") = arg4;
+    register unsigned long a5 asm ("a5") = arg5;
+    register unsigned long a6 asm ("a6") = fid;
+    register unsigned long a7 asm ("a7") = ext;
+
+    asm volatile ("ecall"
+              : "+r" (a0), "+r" (a1)
+              : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+              : "memory");
+    ret.error = a0;
+    ret.value = a1;
+
+    return ret;
+}
+
+void sbi_console_putchar(int ch)
+{
+    sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
+}
-- 
2.38.1



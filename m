Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475CB664465
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474745.736092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOB-00065M-3N; Tue, 10 Jan 2023 15:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474745.736092; Tue, 10 Jan 2023 15:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOA-00062R-UF; Tue, 10 Jan 2023 15:18:10 +0000
Received: by outflank-mailman (input) for mailman id 474745;
 Tue, 10 Jan 2023 15:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGO9-0005G6-6Y
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:09 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcf25e3e-90f9-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 16:18:08 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id cf42so18983025lfb.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:08 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:07 -0800 (PST)
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
X-Inumbo-ID: fcf25e3e-90f9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVqSKi3nBOpTA6dXyBr5PLcPAxdksP3ri3d2O1B85MY=;
        b=e2u5zuLmD7mk4FxQARC1xRPXgyKyXnF3t4Yk95+zbf8PkkCQhdV7QU9z0YjZZsD6qI
         cmAw/MNs2iw1wZEbQjHLjeNOigxMPX6cmixeVIZaCwIHK51wKDb5nvrDcObYubWFzD+c
         S6Sz7Fw8ztE40Cb7wBCn1cyN9Tx72k28cD1nISynFxkcqfn4Dd87EuQkZavg0ihrrxKO
         ue29Tp3yoyJFBy4tf8D8kG02PwjrGx1CWtqcelIw+lqiZ0WQj1vSq9WBFKJJ6IJxDFin
         W7tiSBtmRyADQyhuTHq+BjTYMVQXlVtQdIoKUC6vyp7pzUrLAwgT/GusaQNxQLwX1nxD
         m7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVqSKi3nBOpTA6dXyBr5PLcPAxdksP3ri3d2O1B85MY=;
        b=JCDwHbqrIfGjLo9FFcjyizeL3hFM3uyD34c+yAM/aCRpfGVo0iQpYh4Nwu+D7dYSYJ
         T8+l61DkQY7+Cnu8yIITv69qnVH+b8/dAX2iELTOqz3nMJX4Mf7nAoKm4/kAKbFIlG+m
         lkLnnl4npQg/B5Y5cb8tpzd4HF319z1T6LICFumeKaml5EhIM0laadYMhlnA+/wdKpgG
         Cu6lj8cK62hF8aqY4tpqvX6AFhZuys+66/8Xo/+1vPoIkI5VeuvHg6ahKFIGsUf3LPft
         LmTufIJR8RHIjzUTeLyoRI+vG3TEBvH/T+3c4hl5+LVhqfghIpevS5Q9O5qTVJg6yZ9b
         2lSQ==
X-Gm-Message-State: AFqh2kpIBfUlN8e0soFnwZICXrL4Z3XMY2aKlAw9ant4ErMWM9/2CEN1
	uUg1URpynkBpDLitIoyrGUFUdUwGM+6FGP12
X-Google-Smtp-Source: AMrXdXvEEnHVFscJyoj3h6ACK+mgIxiDwomDke1B0mbazKc+zfgoTaWIWDhMTSP1SuM7C7x5V83Fkw==
X-Received: by 2002:a05:6512:3d11:b0:4b5:2ef3:fd2a with SMTP id d17-20020a0565123d1100b004b52ef3fd2amr32153648lfv.47.1673363887859;
        Tue, 10 Jan 2023 07:18:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 4/6] xen/riscv: introduce sbi call to putchar to console
Date: Tue, 10 Jan 2023 17:17:57 +0200
Message-Id: <daa3dff9b0993b0e6706d7b0ebe2f0e5ef46d3d9.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

Originally SBI implementation for Xen was introduced by
Bobby Eshleman <bobby.eshleman@gmail.com> but it was removed
all the stuff for simplicity  except SBI call for putting
character to console.

The patch introduces sbi_putchar() SBI call which is necessary
to implement initial early_printk.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
    - update copyright's year
    - rename define __CPU_SBI_H__ to __ASM_RISCV_SBI_H__
    - fix identations
    - change an author of the commit
---
Changes in V2:
    - add an explanatory comment about sbi_console_putchar() function.
    - order the files alphabetically in Makefile
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
 xen/arch/riscv/sbi.c             | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
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
index 0000000000..0e6820a4ed
--- /dev/null
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later) */
+/*
+ * Copyright (c) 2021-2023 Vates SAS.
+ *
+ * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Taken/modified from Xvisor project with the following copyright:
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef __ASM_RISCV_SBI_H__
+#define __ASM_RISCV_SBI_H__
+
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
+
+struct sbiret {
+    long error;
+    long value;
+};
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
+                        unsigned long arg0, unsigned long arg1,
+                        unsigned long arg2, unsigned long arg3,
+                        unsigned long arg4, unsigned long arg5);
+
+/**
+ * Writes given character to the console device.
+ *
+ * @param ch The data to be written to the console.
+ */
+void sbi_console_putchar(int ch);
+
+#endif /* __ASM_RISCV_SBI_H__ */
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
new file mode 100644
index 0000000000..dc0eb44bc6
--- /dev/null
+++ b/xen/arch/riscv/sbi.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Taken and modified from the xvisor project with the copyright Copyright (c)
+ * 2019 Western Digital Corporation or its affiliates and author Anup Patel
+ * (anup.patel@wdc.com).
+ *
+ * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2021-2023 Vates SAS.
+ */
+
+#include <xen/errno.h>
+#include <asm/sbi.h>
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
+                        unsigned long arg0, unsigned long arg1,
+                        unsigned long arg2, unsigned long arg3,
+                        unsigned long arg4, unsigned long arg5)
+{
+    struct sbiret ret;
+
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



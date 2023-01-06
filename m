Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD406660108
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472544.732828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYa-00047u-Lf; Fri, 06 Jan 2023 13:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472544.732828; Fri, 06 Jan 2023 13:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYa-000458-GX; Fri, 06 Jan 2023 13:14:48 +0000
Received: by outflank-mailman (input) for mailman id 472544;
 Fri, 06 Jan 2023 13:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYY-0003zy-Jd
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16168da3-8dc4-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 14:14:44 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id bp15so1865644lfb.13
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:44 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:43 -0800 (PST)
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
X-Inumbo-ID: 16168da3-8dc4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szof3vhqcf1cuBmqVq5Q2IZcNa/4nJpd7CeH5aS/VM8=;
        b=cQzbsV1We3uOandm0dnfdaj/H7IIIhcsfpN/Lxb7zZEiEQWUgLQ4F9PMzPlKUVHcXY
         jRSZco3lfG1JhL/PTtNL7XwLktSfpwQQPYNJ1d8F0CfgrXGn0EfOkFV8iO9DqQpHj6j5
         60YsQ63IXJTO1yh7XAumMCtqfgb/wNJtY1saMKPfMfW913cDSM61f+kLg/zBzPlghdPq
         uuoErP5j9CAIfWku6Qdh1xr1Wa1dq4fIGHpkRozz7IuzyJxZGdgk779OoZINEAKJCGq6
         tjhrvsqOEvkmRuxkyGpg/lQeYe0+5RkvngIsCvKtpTzVl3YD0IPli5DJGsdkopklAup8
         kwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szof3vhqcf1cuBmqVq5Q2IZcNa/4nJpd7CeH5aS/VM8=;
        b=FwZCyupFCjNZq1d+nmAg73AMVK7AvMOoT3uGXLJp62W529RSlzmU6dY6PqcMPO6MpO
         aj57YQnlGK1jvnGO9uDLkCePYxwXa/0cKjVq0gX0edZPH/ciAm2HHST1+FDCgYvluUJw
         BKFVGxJxWDjCEVtGAiVvJ+/LbGyoHq0teaGg2F03I1VQhRgkQeyMRo9+tUbsPBOlOE4Y
         dSkF1fdRPvSyzifY3sFCHvnf79S2ZK1O1BD7100gnK3TR1mHJwtC8yRQE6NqS9sbTuds
         PrEy8RbbawVjuiOg5w64I90leJcfaPcmAy4RNCMISsdW0cyqFhv6ReHQjIqX0Lzl6i/E
         jmrA==
X-Gm-Message-State: AFqh2kq462u/jLGdE86KSGpch86/sVfnVHZJbydqR4c4xIIL/p05zGD4
	Tl2K2Hzv9vpWkx7m9t9KvWlRyXbUuNYmZHrf
X-Google-Smtp-Source: AMrXdXvNq2lNiXoqpUOykfZiuBP8QUksdxBOvF4zWSj54AMf05ZpoqtWPB5OqFs7UVSr9Xh6n0qkVA==
X-Received: by 2002:a05:6512:32cc:b0:4cb:4378:9c6 with SMTP id f12-20020a05651232cc00b004cb437809c6mr3292688lfg.23.1673010883600;
        Fri, 06 Jan 2023 05:14:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to console
Date: Fri,  6 Jan 2023 15:14:25 +0200
Message-Id: <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduce sbi_putchar() SBI call which is necessary
to implement initial early_printk

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
 xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/sbi.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5a67a3f493..60db415654 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += setup.o
+obj-y += sbi.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
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



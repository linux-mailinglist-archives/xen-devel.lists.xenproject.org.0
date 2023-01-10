Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE466445F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474746.736101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOB-0006El-OJ; Tue, 10 Jan 2023 15:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474746.736101; Tue, 10 Jan 2023 15:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOB-00065E-9b; Tue, 10 Jan 2023 15:18:11 +0000
Received: by outflank-mailman (input) for mailman id 474746;
 Tue, 10 Jan 2023 15:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGOA-0005G6-AI
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:10 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd9ff4e1-90f9-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 16:18:09 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id v25so18922394lfe.12
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:09 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:08 -0800 (PST)
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
X-Inumbo-ID: fd9ff4e1-90f9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4b0mCw5TWzzOfe9k1UrEZyIfTtwrFP3j0Uq+Wi1atU=;
        b=XvQ0/I+z48juzNDTq8nzooq2ZPekH2xUSqZvlbohxfYhFJZ81wYOyb19SIA/idZOET
         1LSYl7gVq2SJgJDIeDVMmj8OLR6bvModgWrPzFBBngFOChV4+SYXxO9/gxkKwm2EUikJ
         6seJ1954bJ4UVpnCtNHN2g3te/FnsdUEgj92ZKZNWevHNUqWgTOrErEybjqAVHdDkoLg
         cy6MKyKYXyEsEChdUziQU2BxLcb1JXg+nnb6WWP7Ryh4veGy2x00te/wwlWrUhREEcG6
         JkJKI/ceOiTsKHPaG68MNGuHGhZ6o4ZTrfXwWbqiD1NNnfrV7hP9e148/5puEI9xrj7q
         ot3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4b0mCw5TWzzOfe9k1UrEZyIfTtwrFP3j0Uq+Wi1atU=;
        b=GPBQlco/ktccUHrALcHrWZC8Q81cWryEH0oKPRgTqzbo5pLOlamJTM1CpHX5B5v6o9
         CFjF6cw+efEn0Qw4oWxnZSQfo4e0n36/3TXjgaXicnhezlXDvqgjFJGo9Jrsz3x3qRFr
         mx7V5AeQDSXdr8ZaFAji02DMiokFIYD+EAOuiimZdGL/eN8U1vDL5OyVlAghlNkYIwer
         QwSJhXD4ukQuurrttGeq3eDHfbSatqcqWSxGVQO3u05otvwXLzqfXh5DVf7KZCYQOYAW
         3UgoXqsOZrOEqypvfPv69HP0XSn730OD/P9sp0rRSwVY4VswQB5nkBKd+zdsPnes5vzX
         Bdhw==
X-Gm-Message-State: AFqh2koRSiNbEksNL8Fon5RkYz5lwU3fA0EIP+m0SLzFbqaoZCv32KKH
	tdJ7W3WLcmwgRy9S0UOyFz+tgdCtwnYUU6cG
X-Google-Smtp-Source: AMrXdXsaqM3PTnIRlw1RNlmG8XdcZtW5YW9PgDIR2zm2mvrS1lTxNUQV4v/ttVeXp1U7869rBWk4Yw==
X-Received: by 2002:a05:6512:3d94:b0:4a4:68b8:f4f4 with SMTP id k20-20020a0565123d9400b004a468b8f4f4mr24770124lfv.58.1673363889023;
        Tue, 10 Jan 2023 07:18:09 -0800 (PST)
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
Subject: [PATCH v3 5/6] xen/riscv: introduce early_printk basic stuff
Date: Tue, 10 Jan 2023 17:17:58 +0200
Message-Id: <25cd3586fa51980279f25a82eed5ded1622bc212.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

The patch introduces a basic stuff of early_printk functionality
which will be enough to print 'hello from C environment".
early_printk() function was changed in comparison with original as
common isn't being built now so there is no vscnprintf.

Because printk() relies on a serial driver (like the ns16550 driver)
and drivers require working virtual memory (ioremap()) there is not
print functionality early in Xen boot.

This commit adds early printk implementation built on the putc SBI call.

As sbi_console_putchar() is being already planned for deprecation
it is used temporary now and will be removed or reworked after
real uart will be ready.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
    - reorder "include <header>" in erly_printk.c
    - change an author of the commit
---
Changes in V2:
    - add license to early_printk.c
    - add signed-off-by Bobby
    - add RISCV_32 to Kconfig.debug to EARLY_PRINTK config
    - update commit message
    - order the files alphabetically in Makefile
---
 xen/arch/riscv/Kconfig.debug              |  7 +++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
 xen/arch/riscv/setup.c                    |  4 +++
 5 files changed, 57 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..e21649781d 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,7 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
+    depends on RISCV_64 || RISCV_32
+    help
+
+      Enables early printk debug messages
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fd916e1004..1a4f1a6015 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
new file mode 100644
index 0000000000..348c21bdaa
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISC-V early printk using SBI
+ *
+ * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
+ */
+#include <asm/early_printk.h>
+#include <asm/sbi.h>
+
+/*
+ * TODO:
+ *   sbi_console_putchar is already planned for deprecation
+ *   so it should be reworked to use UART directly.
+*/
+void early_puts(const char *s, size_t nr)
+{
+    while ( nr-- > 0 )
+    {
+        if (*s == '\n')
+            sbi_console_putchar('\r');
+        sbi_console_putchar(*s);
+        s++;
+    }
+}
+
+void early_printk(const char *str)
+{
+    while (*str)
+    {
+        early_puts(str, 1);
+        str++;
+    }
+}
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
new file mode 100644
index 0000000000..05106e160d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -0,0 +1,12 @@
+#ifndef __EARLY_PRINTK_H__
+#define __EARLY_PRINTK_H__
+
+#include <xen/early_printk.h>
+
+#ifdef CONFIG_EARLY_PRINTK
+void early_printk(const char *str);
+#else
+static inline void early_printk(const char *s) {};
+#endif
+
+#endif /* __EARLY_PRINTK_H__ */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13e24e2fe1..d09ffe1454 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,12 +1,16 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/early_printk.h>
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
 void __init noreturn start_xen(void)
 {
+    early_printk("Hello from C env\n");
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.38.1



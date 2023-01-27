Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B7C67E395
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485492.752770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4v-0001r3-2j; Fri, 27 Jan 2023 11:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485492.752770; Fri, 27 Jan 2023 11:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4u-0001nO-TZ; Fri, 27 Jan 2023 11:39:32 +0000
Received: by outflank-mailman (input) for mailman id 485492;
 Fri, 27 Jan 2023 11:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLN4s-0001VA-EN
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:39:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 418b6290-9e37-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:39:28 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id l8so3239842wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:39:28 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c420a00b003c6b70a4d69sm3919529wmh.42.2023.01.27.03.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:39:26 -0800 (PST)
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
X-Inumbo-ID: 418b6290-9e37-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD9WTDzKXvdc7hcj/tM3aNt9EYeu8WRQj4/RhYxhaQs=;
        b=fiuBhFv3Q1w6K1BLC1mZXHcPqytGRc5HF9W2Jov993P3ucMGjedlzzFnQzwpkgmY6B
         JoloqYCghreioF3HjMMSOOs/PomMn3N3IcHFswthvzvhqM00nFeKzGlOe/HQrO/E1I2p
         7tQG04+5e/5AHAZ3mHmduuuYs8fpJqZ8F6xlD+S5zIyZ7lqrIVwTlccFcmS56FZKCxoS
         7/eAKN5P9XOkHhkfjv4b893bRwZshkQtg9JSEHmFje4bJK9nrOKS8v3q0L7pfoEOK/f1
         CqnuvXtdNV6xJ+uXriY+Jt14AFoM1ggcbe0DLz7LATbGRGLFvimdYu5wEcs7SOmpDm5a
         T9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD9WTDzKXvdc7hcj/tM3aNt9EYeu8WRQj4/RhYxhaQs=;
        b=LqOLUtUeoFWMmcTiDz6jwcu3G/2/8iShR7VJKs0F1fTV/qoJ9wa0xE8vXMqRv4PyrZ
         shOeiX3cpEIbSWvv7Wge/hfwjW4hyVMznkCTZ0IxWlOdc7Truvh3p/nG2BTrVntgm4FO
         mi7Ysv9T6mnmbNMsmo1xlcpGDSxlRE0ypvDQ7c3Vztf+O6bvrnwRboMYHPw2gOiVqzyp
         Yc58m2J3zW04rNxCWrC11qr21TEIhfjJwul8ow7EBX3vrOXXy0SN0BqlX+J26mJ4VSbB
         ptdt5aHztzlKTp1phuWjfY1W2j4mV9jy0nYtD/eqGy+xDcDxBkgp0/8MV1zEgisGsD4M
         HMGg==
X-Gm-Message-State: AO0yUKXMnu6l1jG+LgRIDpDOB8UY5iNR7FOO2zIkBI+j/DT41j+u5MzQ
	vl5q+Rn4AXv6IukWCUdPpHhkI/t7CRg=
X-Google-Smtp-Source: AK7set/d68ZSvlXnJnOPBgabJIFxl+Gzsa1TZe8Nq5jnlvFxiIE9QQ6jIjoMC6/yY5gu/q6/f5B0ig==
X-Received: by 2002:a05:600c:19c8:b0:3dc:353c:8b44 with SMTP id u8-20020a05600c19c800b003dc353c8b44mr2106455wmq.5.1674819567139;
        Fri, 27 Jan 2023 03:39:27 -0800 (PST)
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
	Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
Date: Fri, 27 Jan 2023 13:39:14 +0200
Message-Id: <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674819203.git.oleksii.kurochko@gmail.com>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because printk() relies on a serial driver (like the ns16550 driver)
and drivers require working virtual memory (ioremap()) there is not
print functionality early in Xen boot.

The patch introduces the basic stuff of early_printk functionality
which will be enough to print 'hello from C environment".

Originally early_printk.{c,h} was introduced by Bobby Eshleman
(https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1aab71384)
but some functionality was changed:
early_printk() function was changed in comparison with the original as
common isn't being built now so there is no vscnprintf.

This commit adds early printk implementation built on the putc SBI call.

As sbi_console_putchar() is already being planned for deprecation
it is used temporarily now and will be removed or reworked after
real uart will be ready.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in V7:
    - Nothing was changed
---
Changes in V6:
    - Remove __riscv_cmodel_medany check from early_printk.c
---
Changes in V5:
    - Code style fixes
    - Change an error message of #error in case of __riscv_cmodel_medany
      isn't defined
---
Changes in V4:
    - Remove "depends on RISCV*" from Kconfig.debug as it is located in
      arch specific folder so by default RISCV configs should be ebabled.
    - Add "ifdef __riscv_cmodel_medany" to be sure that PC-relative addressing
      is used as early_*() functions can be called from head.S with MMU-off and
      before relocation (if it would be needed at all for RISC-V)
    - fix code style
---
Changes in V3:
    - reorder headers in alphabetical order
    - merge changes related to start_xen() function from "[PATCH v2 7/8]
      xen/riscv: print hello message from C env" to this patch
    - remove unneeded parentheses in definition of STACK_SIZE
---
Changes in V2:
    - introduce STACK_SIZE define.
    - use consistent padding between instruction mnemonic and operand(s)
---
 xen/arch/riscv/Kconfig.debug              |  5 ++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
 xen/arch/riscv/setup.c                    |  4 +++
 5 files changed, 55 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..608c9ff832 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,5 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
+    help
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
index 0000000000..b66a11f1bc
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
+        if ( *s == '\n' )
+            sbi_console_putchar('\r');
+        sbi_console_putchar(*s);
+        s++;
+    }
+}
+
+void early_printk(const char *str)
+{
+    while ( *str )
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
2.39.0



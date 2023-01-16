Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695EC66C260
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478690.742087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeK-00085d-Bh; Mon, 16 Jan 2023 14:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478690.742087; Mon, 16 Jan 2023 14:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeK-0007xu-20; Mon, 16 Jan 2023 14:39:48 +0000
Received: by outflank-mailman (input) for mailman id 478690;
 Mon, 16 Jan 2023 14:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQeI-0007HD-73
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:39:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9de12272-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:39:44 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id r2so27680620wrv.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:39:44 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm26543406wrn.25.2023.01.16.06.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:39:42 -0800 (PST)
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
X-Inumbo-ID: 9de12272-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht+yXJXCQ416rH9qG+XVpEx3bPoAaETeI1O2ZSFKNnE=;
        b=UUWnka02cSQQtVrEyziF41obENY8bhSj51iQ0Vz9CybDkAIVsGwYXjCoPHEw5Gm3UK
         KCGUaN1F0fm5awItPipqA2tyhtE+TR9dIk4eF4BueY4cVQccLzydc8sRP4429zPpza3c
         eujOg9PFQsdpSEpDhBnfwUu7HNshJ5dD+OmretWGFmLUh+9csJ+oP/WR4b4VZZp8kcU5
         NoaVIsK6rvzUMwEvS4ptp0pkOUbzPewNTRLRAuOHxvlOa4kiS4kTJISBJ2XUyci810qK
         qIBVaT4FWAuyyfUgjjQmJMEaaV/2JR3O7SKY/wxWjgrclt2VXzNaepIWjUDVHDbxblB3
         fTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht+yXJXCQ416rH9qG+XVpEx3bPoAaETeI1O2ZSFKNnE=;
        b=G9sLeWvFdacIgrlLAGK61Olwtntt+RAWNk2oxpgbbNWxUSOcGQgTuomcTehOVkhb7T
         bFH4uWDBL9t4UObMDMN7qCDHeda06qOtC73wyhQ6J/oOkpXygmqUEAkQAosiaZddEpFR
         U+PhXFneddAs+uD0bmkTB6ubj3w3gaMPFGk9ipi/aBvaU00l3uPBEXKfmxx9P8XeXm2D
         LW621bcfONjCguan9F4ekGRKBH1TvCLLZjY6fbr3pTfslrakt3K82TDkQEc5aU1dqkKA
         l/k6d2GNjt2LuzVhgt6Gl+DouRhdAWWYMwILmNmJ9h8qTJ0iQnpXEM80mDaab41UICOA
         /Mqw==
X-Gm-Message-State: AFqh2koiA44E6V0uedxT4TtF1rDtNZ/Eu4zIC8zFUxDy4Ce8GA5qZvuk
	4fB2rWjWg1nbcRpBDpWqiqL3o4TY3DjB8Q==
X-Google-Smtp-Source: AMrXdXuvKN+KpsWx1NAJ0UyAmvRb8fksqDc6ChVgzirE65cUacUYQ5kZPsvDdu2nCkr3QoIszEBDnA==
X-Received: by 2002:a05:6000:a0e:b0:2bd:fdd8:2d0a with SMTP id co14-20020a0560000a0e00b002bdfdd82d0amr5175166wrb.40.1673879983306;
        Mon, 16 Jan 2023 06:39:43 -0800 (PST)
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
Subject: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
Date: Mon, 16 Jan 2023 16:39:31 +0200
Message-Id: <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
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
---
 xen/arch/riscv/Kconfig.debug              |  6 +++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 45 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
 xen/arch/riscv/setup.c                    |  6 ++-
 5 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..e139e44873 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,6 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
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
index 0000000000..6bc29a1942
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,45 @@
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
+ * early_*() can be called from head.S with MMU-off.
+ *
+ * The following requiremets should be honoured for early_*() to
+ * work correctly:
+ *    It should use PC-relative addressing for accessing symbols.
+ *    To achieve that GCC cmodel=medany should be used.
+ */
+#ifndef __riscv_cmodel_medany
+#error "early_*() can be called from head.S before relocate so it should not use absolute addressing."
+#endif
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
index 13e24e2fe1..9c9412152a 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,13 +1,17 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/early_printk.h>
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
 void __init noreturn start_xen(void)
 {
-    for ( ;; )
+    early_printk("Hello from C env\n");
+
+    for ( ; ; )
         asm volatile ("wfi");
 
     unreachable();
-- 
2.39.0



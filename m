Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1E6738EE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480997.745664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIS-0002SN-CC; Thu, 19 Jan 2023 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480997.745664; Thu, 19 Jan 2023 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIS-0002Pn-5Y; Thu, 19 Jan 2023 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 480997;
 Thu, 19 Jan 2023 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIUIR-0001sI-02
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 12:45:35 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 293745f0-97f7-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 13:45:32 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id h16so1715875wrz.12
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 04:45:33 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm17909808wrw.33.2023.01.19.04.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:45:31 -0800 (PST)
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
X-Inumbo-ID: 293745f0-97f7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht+yXJXCQ416rH9qG+XVpEx3bPoAaETeI1O2ZSFKNnE=;
        b=aku3f1za6ol9pQR5r9gDhprz9Kjx0Xh/Em1sk4axVDKHkdludLfPL2E0ilSWRO8e5I
         wdyzaBHSXTLnz9dFeMgHL/ljkTPDrvJBMO3B5MSiwJbxuM6cztccvPSzjBAP3ox/+IR1
         9A/S+/ErFucd1mVAyPT8y/N6H4GwCezc0/WjPoEzr6xVPG16avhO8Via4l89hoF+kNuG
         7QjrdJxt/Fl3ENEZ9HeVJBqREgp2NjhHk9oSzax2pHtY+wJqM+Hcha+VonQ4+wuUQCOq
         IUiz3Y7nK1dVscDwABCEw875T7KFmgJjEaVGNAyXyLWU0ZIP3OfZv33gZYjgIds6KhVg
         GZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht+yXJXCQ416rH9qG+XVpEx3bPoAaETeI1O2ZSFKNnE=;
        b=rMPA8lgf7G7fwCljniiLIWdcnA6+Kt6rbX46wa6FllEFjHvmlnKQMFWMVqTLP5oTh8
         SXWOxgR7KKt/Io/2DHRrc0twjlmcAe+gJd8KBALL6ZmspoaNwnrNEZtIqIBnIpwzQHZm
         NgJ89QxW+vqYFMDBBCeODgtJpoIs+qQ+/e96nvKHrZk1POpKSJPaOFESsEIgJMAsnziF
         JYgWLF7WsVxODXrUImSruucM1bZJmG8dBffNPpH+MtNdX2mQ5aD0VQzDruVvxFpBHLXY
         CSCo1JlEePr7IKeEf94ObMAlcEwPe4ybbVG0TvAmtbkGDoHC6GAZKqlfqwrqGhqhNni7
         9boA==
X-Gm-Message-State: AFqh2ko8ZLl1XYqf2WSJQvQL+O/FniflkIh+swwb7iDKxst4viuqljjk
	fegC7MWpBB9mgPHUQnA8fAqgqjx7TXZEtQ==
X-Google-Smtp-Source: AMrXdXumEDvfsGhKIUpCgzd+Gs9h6UaiWfIZqdyaqaJ7tl+kfx/T6QNNAhQq6tObRNUwXRKuPglBBg==
X-Received: by 2002:a5d:43cd:0:b0:26b:8177:a5e6 with SMTP id v13-20020a5d43cd000000b0026b8177a5e6mr8920405wrr.51.1674132332232;
        Thu, 19 Jan 2023 04:45:32 -0800 (PST)
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
Date: Thu, 19 Jan 2023 14:45:16 +0200
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



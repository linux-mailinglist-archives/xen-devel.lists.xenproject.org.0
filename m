Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D457068D709
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491071.760039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIZ-0001Bp-MI; Tue, 07 Feb 2023 12:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491071.760039; Tue, 07 Feb 2023 12:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIZ-00016y-I2; Tue, 07 Feb 2023 12:42:11 +0000
Received: by outflank-mailman (input) for mailman id 491071;
 Tue, 07 Feb 2023 12:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNIY-0000om-Co
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:42:10 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3288455-a6e4-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:42:04 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so13083590wmb.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:42:04 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056000114300b002c3f9404c45sm19632wrx.7.2023.02.07.04.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:42:03 -0800 (PST)
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
X-Inumbo-ID: d3288455-a6e4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rviyH505nsbYK2ozmVytpLFJQlUNOXPwSYuCd3kmF7A=;
        b=ZbZcaBRqoKsBUHy+yBzw6A7IpcZoHc11piFNhJxND8DTmVn8up8S5sS7e9Oz958NJ5
         C0Mdm6Ah//0tNwSH7l4B7u3s6qzhTU3CwtT2ZEdxGyldffM0irGPQ0PQwZXa+bzHg7Rl
         sdCMeVrV4pzXX2v7jJ7592Ve6TGr5HgHUqX3WrofTgr9PzJd/myOD/5SpcqWU9Jw1xS4
         wtE7o8xWYT8XmKnK3YWF/R554SYMgPxk4FCOjuzitIwob4mL1aRzt/G2zgVo0Nk434mn
         OJS64KwMLHwuasw3/C4bx8pILsmP57blSrtFG8BdNdo73AF9doeTqCsWEDvfhzsKr6UN
         WQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rviyH505nsbYK2ozmVytpLFJQlUNOXPwSYuCd3kmF7A=;
        b=DNW76a1V1b4eEa/mWbD6fQSGPiohYYy+pgTZlo3ufPUaXxcJxpNhGtbkRzN0BarCV2
         EKNOjzM31lzK7KG5Is9ai4jhcZzW4uPUiCBHOQ7Alf7PA2rlOumORnLXbJzst302wPGr
         RAo5T540m0ApU23nG02OVVYqzpN/X5TkbL/lkDGxdev36Iz5NvYPRnfWNCH7KGyHgtDj
         U8cmtYvjqFpKTWPKAisemqwLgKqkvSW8hAIuH63yNqrMBfRB1tCybi3AJLPePOMbxhAu
         qNfVS9Aw3lNPMqNPmQekrJy6FvlYnUliiSe5Ztyir7YaoH0S+n6BM0QM0iJ8uGZvfiqE
         DEmQ==
X-Gm-Message-State: AO0yUKVaUVeNfNSHhN+O2naE5BAzoLmv7bqh8cYc4yD2czxgUAxiHV15
	ulIh9Rhi6oZv/yAeC0xIRlhp/NCnjy8=
X-Google-Smtp-Source: AK7set8zdSCBTXeP8zqZSORJdmDP/4UE3Fy1x6QxZBzmptqONrAoC2Dlln7oY75Qh8V1nEU8NWO8/w==
X-Received: by 2002:a05:600c:3596:b0:3df:d431:cf64 with SMTP id p22-20020a05600c359600b003dfd431cf64mr2909266wmq.39.1675773723875;
        Tue, 07 Feb 2023 04:42:03 -0800 (PST)
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
Subject: [PATCH v9 1/2] xen/riscv: introduce early_printk basic stuff
Date: Tue,  7 Feb 2023 14:41:52 +0200
Message-Id: <06c2c36bd68b2534c757dc4087476e855253680a.1675772422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675772422.git.oleksii.kurochko@gmail.com>
References: <cover.1675772422.git.oleksii.kurochko@gmail.com>
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
Changes in V9:
    - Bring "cmodel=medany" check back to be sure that C function is safe to be
      called in early boot when MMU is off ( e.g. VA != PA ) 
---
Changes in V8:
    - Nothing was changed
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



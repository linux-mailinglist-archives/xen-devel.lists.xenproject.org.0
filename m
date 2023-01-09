Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D9662A67
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473752.734552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMk-00039N-Sh; Mon, 09 Jan 2023 15:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473752.734552; Mon, 09 Jan 2023 15:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMk-000373-O3; Mon, 09 Jan 2023 15:47:14 +0000
Received: by outflank-mailman (input) for mailman id 473752;
 Mon, 09 Jan 2023 15:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMi-0002mL-IQ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e18a58d2-9034-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 16:47:11 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id s5so13089777edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:11 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:10 -0800 (PST)
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
X-Inumbo-ID: e18a58d2-9034-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/b1TrvDNNnrrBRjP6bD1TxMqmwHjv5FMfqQgK0ByUg=;
        b=RHU8wslsnUIOk0uJuOjVkpeHjI2zvT+TuWTUPIQBT8VG0gCJcnsUUdUqL0zrx7BlRA
         Ja4DMX7g8dlejSPSJdZnwcpTPDsROkFouutpy9jfH0AUv9F7DWb7fWnUgiMOgnhcN+cA
         K4Hj+xck+8lKZu1dWSshADexdjJBAQTgOwlC/i1NBhQIi3kZ/o2eoH6DgZztxByv5P1w
         DHwTWlWoPPteVHZhczHDwcDpyOGl6QpRVZK6yopgpRQw/CTHxukX5xICpq7Or3ph5OqF
         KlAilXyN5qRL2hzgdmMicADniLRmtR5lKVR7E7UE+WCLqEsEL/siJoPu+75ViPSuTA2C
         INCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/b1TrvDNNnrrBRjP6bD1TxMqmwHjv5FMfqQgK0ByUg=;
        b=GfSymHcjSt7Xu7MTBR5v4/x7ncEsdBno0kGeSUMzEFRL48NkdOdmiYZPtHRuYpgu8K
         cW01tiXfzoLG3OV9ZtKrS5bUalqgFKxJkaB+IfrR5ckR6qiOEQc2/nRrmLpmWDPKOk3p
         qUkkvS4nITiZKZ7qCTLlGjWNf1BxKoFIqozYddFL6zBqSalDF0+uIst9nStmSAf90uZL
         EULUqJLAM4ghr2rPlUpzUe2L3S9XP3DRu3RkNxRI7VBuGvHyXpBOHDl/Nvf/ALJp/RT1
         SfpX1GhCuBJpJO5xaWfb1NrscgvLgRx8Z8diNfTfHtcDPPQKVkmwU1M7nLX3fTMlC4ga
         suIg==
X-Gm-Message-State: AFqh2koch8JGsQkwHPsAykOgv7SQ/imDE119Oqn7TxWmSFBk5VvsLuy1
	ALBWlZ9DDguDQelsB4AJkED5LruIh0dfAA==
X-Google-Smtp-Source: AMrXdXsMBfaLg7SGeLcx3dyX1xcH85/vA1FA9saSCXMCHzMRkNQd/aKJMn8Y/yKpnXpS2+KReFwA5Q==
X-Received: by 2002:a05:6402:1f89:b0:47b:16c7:492c with SMTP id c9-20020a0564021f8900b0047b16c7492cmr63677275edc.25.1673279230974;
        Mon, 09 Jan 2023 07:47:10 -0800 (PST)
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
Subject: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
Date: Mon,  9 Jan 2023 17:46:53 +0200
Message-Id: <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 4 files changed, 53 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..6ba0bd1e5a 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,7 @@
+config EARLY_PRINTK
+    bool "Enable early printk config"
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
index 0000000000..88da5169ed
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISC-V early printk using SBI
+ *
+ * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
+ */
+#include <asm/sbi.h>
+#include <asm/early_printk.h>
+
+/*
+ * TODO: 
+ *   sbi_console_putchar is already planned for deprication
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
-- 
2.38.1



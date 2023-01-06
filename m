Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828966010A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472547.732856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYd-0004n2-3k; Fri, 06 Jan 2023 13:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472547.732856; Fri, 06 Jan 2023 13:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYc-0004ef-S1; Fri, 06 Jan 2023 13:14:50 +0000
Received: by outflank-mailman (input) for mailman id 472547;
 Fri, 06 Jan 2023 13:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYa-0003zy-CY
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 176521e3-8dc4-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 14:14:46 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id bu8so1902321lfb.4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:46 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:45 -0800 (PST)
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
X-Inumbo-ID: 176521e3-8dc4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deWE8GI9Ntl4m3olds6B452/c7DgLQANjeRayM/Lyr4=;
        b=KkPDjBNkaIRh+ppwZJdsQCOYaVYRO59kzdiLFP1dy8UBa5sP3DpybFKTltLHwEWE5g
         KAYOkw4Ci8qbPUnqpCIYzjYOAAvc5e5XHrQJWr5LnptUGHBoVk2xY8Q+UTnTPPfYY1nB
         uEVVSm42l9BMNhgPTuLO4qNUCxGOzEIZmVmRuXkZleKJbitUzjbO8a+s4sZMXEM8PAkF
         EbAeJCKxY0SikI/TczNSG4E2MiRweJNsScgLFwAnlxnoQd/3S2zzPPQjcB5/dBm1SCrC
         wn8XpSFiW60HixsnBnthHs0wFp2MdPqZspdADTGemwPHVSi7qrXnDJopky9SG7Vmw21Y
         DLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deWE8GI9Ntl4m3olds6B452/c7DgLQANjeRayM/Lyr4=;
        b=0zdFsieWuRshahHRoaJ9HeeX6qiAUOeXOnenmFvBW1lo5+x1Jlz48JYZOaX5ph/nox
         dVSTAVu/bbX4OA51/snCrLS/2JX7soPJBiwhEmnvYNrKTD9CZRcdRbB1U//ZC5BBqWiD
         NMxl+oQsSQo/G1p5gxgIGcfQ5KYDv+VvcVd3PSdw5I9PfmlzeNU7dqGc83s7F39ThWCV
         6EsYLKov/07OP7tgaI1o8fLj2eF/QTkEdvePfODSK25Xl7/L/QiotQDyltA//kgWtNVV
         9BzDyz8cS7Zhy5O1JefXeMy5mHDGMMfsjyN8bpnJu7/9qprHyYC4gsAcwUKJovwKIBTB
         Pzyg==
X-Gm-Message-State: AFqh2kq8jRR7RN1xDTOzD+E+o/gcHn7QfqfLcsVzimM4kDQuEIlwAnxV
	jgbOMKD+Bc47tu+Ti7e2Ma/+8U9pxGokCBR6
X-Google-Smtp-Source: AMrXdXtd7Mm879/iojPZdzolaaaSsCDSS6dg4V03gg7DzzioaB2FFkJaTLjtD/LgOltwFLEIDf5Tag==
X-Received: by 2002:a05:6512:4020:b0:4b6:f595:89a7 with SMTP id br32-20020a056512402000b004b6f59589a7mr16272641lfb.14.1673010885964;
        Fri, 06 Jan 2023 05:14:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 6/8] xen/riscv: introduce early_printk basic stuff
Date: Fri,  6 Jan 2023 15:14:27 +0200
Message-Id: <3f30a60729b45ee01adc2d4c0eec5a89bb083abd.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces a basic stuff of early_printk functionality
which will be enough to print 'hello from C environment"

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig.debug              |  7 ++++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 27 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..940630fd62 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,7 @@
+config EARLY_PRINTK
+    bool "Enable early printk config"
+    default DEBUG
+    depends on RISCV_64
+    help
+
+      Enables early printk debug messages
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 60db415654..e8630fe68d 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += setup.o
 obj-y += sbi.o
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
new file mode 100644
index 0000000000..f357f3220b
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,27 @@
+/*
+ * RISC-V early printk using SBI
+ *
+ * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
+ */
+#include <asm/sbi.h>
+#include <asm/early_printk.h>
+
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



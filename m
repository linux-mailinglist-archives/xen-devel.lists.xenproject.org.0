Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE57AACB8B
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977624.1364641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWZ-0006mV-0b; Tue, 06 May 2025 16:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977624.1364641; Tue, 06 May 2025 16:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWY-0006gW-Kk; Tue, 06 May 2025 16:52:06 +0000
Received: by outflank-mailman (input) for mailman id 977624;
 Tue, 06 May 2025 16:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWW-0005Fd-QZ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:04 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4dc4d7-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:52:03 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so8043963a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:03 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:01 -0700 (PDT)
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
X-Inumbo-ID: 6f4dc4d7-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550322; x=1747155122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHCbbRGzj4TST1ZsXheYq6XK3zRbfzwB/XvisLJirH0=;
        b=ag6sWFCV+p+di9Xz75ujonVLLUglMX9kcPcLu/iINlB74xCwanukKOkrW8MknUkg79
         N+fz5be2s1GT2NlbnE2oUK5g+Q1AMlGja968XSqXnuVtWdx9+SZMIccwbpuBDfj1+u1V
         IqdUOTVUWwOWQXvGwK6DzuUOTvubQzUZaedy+59FV0fXE+L0qTwzmbuZDHjpNBoqja1/
         Vy+YNZ5zZUusGGYT5fmE+iCnHjzKke401MU2eCQy+sT7oxMrcYeEVYY67M+GkmUEpbTt
         0N3BuCcF8lge8Kpuw8CbdEfJEfvDlOO55xTKEvwrdaNf6hfgc/6fb9Ji0PkYAiADsR28
         Ld/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550322; x=1747155122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHCbbRGzj4TST1ZsXheYq6XK3zRbfzwB/XvisLJirH0=;
        b=KY9QCKWV2UJyDWV3VrBDBmSMf6tzHBNz6S3q9NANgr9BXeK3CK9xgvLZS2mOxDXi6K
         Emu4/aGqX3dmgv19G52COJPCkCbdugLwUbXH4t4BXkRvTU6NxLwczC91ay5Q7DtP532y
         9h7C0DOELGLHwCtHkhmG+829gTheVVxoU5Eqwxeu/1oJKyS4xKJyTw3S8tkPzy9so/ii
         uDw7PzNulGwvP0teEOafF2niX1K5DarN3Wo5Nbb7za7Qsd8zXmigz2RUVz+WObLBDLrd
         vIJDEIIYYXEpQFGP+ibUUDDjkJxvXkzd7IBrqQE/FvzYFRuf/kTVQVemPlEVrT3LWWtN
         041Q==
X-Gm-Message-State: AOJu0YwtBwu46yLwKfGlGcFJhCEivd2ZAn0snidTkRIheAohxDh9Pro8
	XJ6MIGDFJNptbaEk3v8nR+Mkm4fIsGEuR+k8EjfGIt8z0iz1EkfvXbS17w==
X-Gm-Gg: ASbGncsn/Ht7p+Uk0SP8MQTVOswyR8MDLXG1D31aqgUvO6YtGURMWpJwNmZCB433ZVk
	3uwDN0x4vNt23rZkG5CvcHk1QZBZ9ZJ2zBfHoQIM3Zh7jNtxTlvmGQdw3+E0nn37DaBOlMnxILq
	9LCc7HYb9oTd/VJTpuMu3J25cSPtCkUEwkw/1D+5f1jZIHOJjs6dv4TjnJTWB489/1tBdskj8px
	UHDkQxlAb/7SAKjSlk44NczCdXGSj9usCmFZMjR+d65fGOArZZxTAlo8Z013xQ4i1GJ9LujoBCJ
	vGGdnwMlQzvQ4lbqudfdBZAgQW7vBR9C0RxT4IRznRWnwIPg96Tq6+vHxchYZo5WMCVAFPz9psG
	WaSe3XLNcWg==
X-Google-Smtp-Source: AGHT+IHhSY+w3Z9D7TNCdbEZhWTvpADf4qlmFfIEJoqjGUaK29lnjmPIHlr+7GaSvrY9Z1VrTlwMVg==
X-Received: by 2002:a17:907:874e:b0:ace:cb59:6c4d with SMTP id a640c23a62f3a-ad1e8d545eemr16010866b.43.1746550321861;
        Tue, 06 May 2025 09:52:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 06/16] xen/riscv: introduce init_IRQ()
Date: Tue,  6 May 2025 18:51:36 +0200
Message-ID: <2a57200785c710a5203a116bf9a933b4ea12d112.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement init_IRQ() to initalize various IRQs.

Currently, this function initializes the irq_desc[] array,
which stores IRQ descriptors containing various information
about each IRQ, such as the type of hardware handling, whether
the IRQ is disabled, etc.
The initialization is basic at this point and includes setting
IRQ_TYPE_INVALID as the IRQ type, assigning the IRQ number ( which
is just a consequent index of irq_desc[] array ) to
desc->irq, and setting desc->action to NULL.

Additionally, the function init_irq_data() is introduced to
initialize the IRQ descriptors for all IRQs in the system.

Reuse defines of IRQ_TYPE_* from asm-generic/irq-dt.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Move an introduction of IRQ_TYPE_* defines to the separate patch.
 - Reuse asm-generic/irq-dt.h.
 - Use 'unsigned int' for local irq variable inside init_irq_data().
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/include/asm/Makefile |  1 +
 xen/arch/riscv/include/asm/irq.h    |  7 +++++
 xen/arch/riscv/irq.c                | 45 +++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |  3 ++
 xen/arch/riscv/stubs.c              |  5 ----
 6 files changed, 57 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/irq.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index f42cf3dfa6..a1c145c506 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -3,6 +3,7 @@ obj-y += cpufeature.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += intc.o
+obj-y += irq.o
 obj-y += mm.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index c989a7f89b..bfdf186c68 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += irq-dt.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 2a48da2651..f609df466e 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -3,6 +3,11 @@
 #define ASM__RISCV__IRQ_H
 
 #include <xen/bug.h>
+#include <xen/device_tree.h>
+
+#include <asm/irq-dt.h>
+
+#define NR_IRQS 1024
 
 /* TODO */
 #define nr_irqs 0U
@@ -25,6 +30,8 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+void init_IRQ(void);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
new file mode 100644
index 0000000000..26a8556b2c
--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * RISC-V Trap handlers
+ *
+ * Copyright (c) 2024 Vates
+ */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+
+static irq_desc_t irq_desc[NR_IRQS];
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    desc->arch.type = IRQ_TYPE_INVALID;
+
+    return 0;
+}
+
+static int __init init_irq_data(void)
+{
+    unsigned int irq;
+
+    for ( irq = 0; irq < NR_IRQS; irq++ )
+    {
+        struct irq_desc *desc = irq_to_desc(irq);
+        int rc = init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq = irq;
+        desc->action  = NULL;
+    }
+
+    return 0;
+}
+
+void __init init_IRQ(void)
+{
+    if ( init_irq_data() < 0 )
+        panic("initialization of IRQ data failed\n");
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 2a564512d7..82f8839eff 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,6 +6,7 @@
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
@@ -127,6 +128,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    init_IRQ();
+
     riscv_fill_hwcap();
 
     preinit_xen_time();
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index fdcf91054e..e396b67cd3 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -107,11 +107,6 @@ void irq_ack_none(struct irq_desc *desc)
     BUG_ON("unimplemented");
 }
 
-int arch_init_one_irq_desc(struct irq_desc *desc)
-{
-    BUG_ON("unimplemented");
-}
-
 void smp_send_state_dump(unsigned int cpu)
 {
     BUG_ON("unimplemented");
-- 
2.49.0



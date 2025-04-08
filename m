Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530DA810DF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942503.1341675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKN-0005cI-Cv; Tue, 08 Apr 2025 15:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942503.1341675; Tue, 08 Apr 2025 15:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKN-0005ZV-9E; Tue, 08 Apr 2025 15:57:31 +0000
Received: by outflank-mailman (input) for mailman id 942503;
 Tue, 08 Apr 2025 15:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKL-0004Yr-4O
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:29 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bf79871-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:28 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so995725366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:28 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:27 -0700 (PDT)
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
X-Inumbo-ID: 2bf79871-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127848; x=1744732648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT8rKSfyX7xZtUnDKHJfH2FXwyt339CMWYXyLpe8kCY=;
        b=cTgnzBWIMzLA2uur8rlx6Wo6LNzZq9gXz3fG/9N3U696e0Y1qJHJWgWJ9ahPJ1RrcP
         DGSrotC8uHZth+7jXFDSNK9XDIk6aAIJsep5CMfWSgiMfLLsbiz5iHmbBDPbYCpPz946
         lYlCVIoIoMnwTaxTEzaMlhIDobfz/uAXZg8Fs0bZlvYIGgJ1c8dKVJI3sCCXqCt5fQvh
         kz5VNyJE90P7HAfuLl2jQo3c/k+xorpJKivY9wE6ZfO4bd7li9ZHaQdb4/m9y4iyR0ty
         Q1gGzcxaCroSkAe2cqziNfkfPH+vPZDs5kOgecANztJIPIGypsgD568Dzgmdmc5Da9Bt
         RPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127848; x=1744732648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT8rKSfyX7xZtUnDKHJfH2FXwyt339CMWYXyLpe8kCY=;
        b=Rvfn8oa6Gns3WdQv8RkQbroftWDp84F/EgEPCyTgMhxCKS3Fc7gOHMx7SqfA6ErQWY
         DUNZbCRk1lJHJKDbea8n8ysT5lNhFui854PkrcN6R9kerjoKa4ngy/jq6O8g4hjh7PBY
         pNEzypb09EDQRH8VygkhLSs1IMKbDV1CoNIG1bQFcekuQj2AKaXs8GrivRrYEg0g96Hh
         JS3CHdzMd6z/qthqVB9ShOUyIMdHQQR++/A+wH5BnqLYynW6KTAMIc/abvh0vQg6eB4i
         DWicXmhDUppjiB3jvsqFlD7oFelhlSsvCgrekJbox24ieRP3vnPEAhl42LLpT0yf8bLP
         GKzg==
X-Gm-Message-State: AOJu0Yx2JeiEcl7nzaXPbf3XKw2qTR+6PehSwzYWusqGxSn7f0veri6p
	3my89b36cD5jppAQvG50nsz0m1nk0a2oRL/GG6otI2Mpxh6Ngjk4CHFjAw==
X-Gm-Gg: ASbGncvlUs9mZhgPWbgRIEMvW+d34uynGrborgN2b9wCnsWM+eSELhknOK0GU25TUmX
	b/BUffUppyuAyf1xYqH1KATwAVWRho67nc9doOEqDruTPE6Na9ck9+OntjxXSrnEH2UV6WZ/x7j
	Ik7u8o0TeHKmXZSZEfBNSzGUBv30kEQI4osJ0IFrq3O7/iwPbSm4ObraWlxX1kIcdNB23iCG45o
	WjcRxjw9pOrqbWD0HPApup2xBLYyrmpu0re9/F9P2xg6Zz8ntIqq3sGTDdwk9fB2gHGtkYSVGA4
	O4mVOOuf8sIr4LSeGtlgPnkjBJk8OjT2NvFgNtEJIKsqWMAET1PLK2/PWjdvsgr265CE2ttFK5r
	qHWsGKaaEXsl0uA==
X-Google-Smtp-Source: AGHT+IEBhPbeHE6U5+TNIa3utiAycGcioh0lgV4ejRRW9dYFHNRnq6I7mJsucHWf/Rq1QAHevan8Mg==
X-Received: by 2002:a17:907:c26:b0:ac3:bf36:80e2 with SMTP id a640c23a62f3a-ac7d6d29f49mr1725840666b.20.1744127847578;
        Tue, 08 Apr 2025 08:57:27 -0700 (PDT)
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
Subject: [PATCH v1 04/14] xen/riscv: introduce init_IRQ()
Date: Tue,  8 Apr 2025 17:57:08 +0200
Message-ID: <dff8b0a4a83fbd2b84c3427093a63fcee8a7122f.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
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

Also, define IRQ_TYPE_* which are the same as the existing device
tree definitions for convenience.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/irq.h | 24 +++++++++++++++++
 xen/arch/riscv/irq.c             | 44 ++++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c           |  3 +++
 xen/arch/riscv/stubs.c           |  5 ----
 5 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/irq.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index f551bf32a2..457e8e88a4 100644
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
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 2a48da2651..8f936b7d01 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -3,6 +3,28 @@
 #define ASM__RISCV__IRQ_H
 
 #include <xen/bug.h>
+#include <xen/device_tree.h>
+
+#define NR_IRQS 1024
+
+/*
+ * TODO: Should IRQ_TYPE_* be moved to xen/irq.h and wrapped into
+ * #ifdef CONFIG_HAS_DEVICE_TREE?
+ */
+/*
+ * These defines correspond to the Xen internal representation of the
+ * IRQ types. We choose to make them the same as the existing device
+ * tree definitions for convenience.
+ */
+#define IRQ_TYPE_NONE           DT_IRQ_TYPE_NONE
+#define IRQ_TYPE_EDGE_RISING    DT_IRQ_TYPE_EDGE_RISING
+#define IRQ_TYPE_EDGE_FALLING   DT_IRQ_TYPE_EDGE_FALLING
+#define IRQ_TYPE_EDGE_BOTH      DT_IRQ_TYPE_EDGE_BOTH
+#define IRQ_TYPE_LEVEL_HIGH     DT_IRQ_TYPE_LEVEL_HIGH
+#define IRQ_TYPE_LEVEL_LOW      DT_IRQ_TYPE_LEVEL_LOW
+#define IRQ_TYPE_LEVEL_MASK     DT_IRQ_TYPE_LEVEL_MASK
+#define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
+#define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
 
 /* TODO */
 #define nr_irqs 0U
@@ -25,6 +47,8 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+void init_IRQ(void);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
new file mode 100644
index 0000000000..99b8f2095e
--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,44 @@
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
+    return 0;
+}
+
+static int __init init_irq_data(void)
+{
+    int irq;
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
index 7f68f3f5b7..a3189697da 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,6 +6,7 @@
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
 #include <xen/vmap.h>
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



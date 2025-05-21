Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02EABFAA0
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992141.1375955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvK-0005Mf-As; Wed, 21 May 2025 16:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992141.1375955; Wed, 21 May 2025 16:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvK-0005JY-4M; Wed, 21 May 2025 16:04:06 +0000
Received: by outflank-mailman (input) for mailman id 992141;
 Wed, 21 May 2025 16:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvI-0004XB-UM
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:04 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b46271-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:04 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-601d10de7e1so5959327a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:04 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:02 -0700 (PDT)
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
X-Inumbo-ID: 37b46271-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843443; x=1748448243; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/elDcf0J+uEdYg0IcO9C9ITYyw5kGwji+p9HGpFOSE=;
        b=NCxNBcm79HEVCHuevHxMMiV7UoJqRfFEzLFCAM65zywkWPEMy0WzYQ48tdUspAGjlh
         lRpDq7fPNEmPPAB1GLiR7bQjiXDP2N3vbrjovyNjWpIpkLGx6oISQ2Nd0y+klAgTFjHP
         /q6cmLpWbrR+qLNvUU29uCsR5Vt0/lSXyZ1K106pRvqfnZb3R3URIZF2+RuTn/VQ6jqI
         79o3WVUWTkV9a+Y1nOq3zeWOwbtzZfxkVEVt2lAiML1JwSaufJ3fuWtp1O3oa+fYyTXa
         quDBHIw0WsJY+9gSkOP0P6cQsSTTbqSF00bsN+FnJKtBlC1gpVz+pwUOw1P2PFcG/tnj
         fslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843443; x=1748448243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/elDcf0J+uEdYg0IcO9C9ITYyw5kGwji+p9HGpFOSE=;
        b=bA6e8k0I0cD2st0dUT7ggJDLzw/7WjMZ7S/5BqftAMmUZvTOwUpSOdUmoikARWoF3l
         RDlkCGCxgb62tm/fL5FERJX1nixI89JGb8i/bRgT6gxhEO6jiekuVGwA34PiTqSCPkby
         TmrTAx/BHlMpOj4maQLVjE5mbT4LfxCin5ff++94RT/skj4DwmLb6fbWcCpXTwPslWAp
         OuZKUC0o/Da5vNAC9KtMpk45FoGJvH8F6wlGkZg3/9vc2+LQRbSyormRXNVrm/MIg3de
         HEWs6F/prgdwMuEyqEtupCP6njuKwmk3tdSMtixGxpYOhawM1m2EKT0p488BXn2Y4WOe
         MJ8A==
X-Gm-Message-State: AOJu0YxPjNZtveQ9tNdy6iNjB3Wuopxx/+ExNEgecJBsrZirxjkW1m5N
	Qfa5PBJwkXCYHmuHGZ9J31+Ngl18Few1WY63o1NcaloTHGNeltJ9uD3oi9niDQ==
X-Gm-Gg: ASbGncsoprYmWUm4fqwX2L8tUsbWwHQwQvgHafIFpgoWvyBbWp2ykfL8oWNE8wpo9h0
	KLjlaCo7slsncFXmFQRf36j9+YMpSGu8DighxSFS1UZmom+DT1/fEa2yjOkKHetLZERsGMgIjZD
	+JUXQ3CuGDMlJeV+/NXIT39RW6+VJnbYJJK+wCXwwtxb83LKM202ipvJzl5i7p0mukhtSpOJFnB
	lPrYvvnacLJ6bimyG+SHK2FEgGZlDkN8OS5JvX73aokj5YXO+OdVUWC+WI8m2tU5Wl4B/haY5h7
	pe8JFMsIYAwj6ysi5cABfx+qvQ6TIBceu5GRGs47z9lk9HbHr2EarrfMzlGj9quPFwEuODSoz8i
	lykXSATMOevz8exUnqg==
X-Google-Smtp-Source: AGHT+IEa+JUzcbczAQq8o2/fg/s1PT8cuwXsa9rgrAfOnPixs0ymYOgRRJ6fCt3JnFSA4qtF1tmLyw==
X-Received: by 2002:a05:6402:2786:b0:602:29e0:5e05 with SMTP id 4fb4d7f45d1cf-60229e0615dmr3984646a12.14.1747843442984;
        Wed, 21 May 2025 09:04:02 -0700 (PDT)
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
Subject: [PATCH v3 04/14] xen/riscv: introduce init_IRQ()
Date: Wed, 21 May 2025 18:03:44 +0200
Message-ID: <3f86f284ebccff9de877844f33c4588ac5631906.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
desc->irq.

Additionally, the function init_irq_data() is introduced to
initialize the IRQ descriptors for all IRQs in the system.

Reuse defines of IRQ_TYPE_* from asm-generic/irq-dt.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 - Add an explanatory comment about NR_IRQS definitions.
 - Init desc->irq and desc->action before call of init_one_irq_desc().
 - Drop "desc->action = NULL" as irq_desc[] is zero-initialized.
 - Update the commit message: drop mention of NULLing of desc->action.
 - Drop year in Copyright.
---
Changes in v2:
 - Move an introduction of IRQ_TYPE_* defines to the separate patch.
 - Reuse asm-generic/irq-dt.h.
 - Use 'unsigned int' for local irq variable inside init_irq_data().
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/include/asm/Makefile |  1 +
 xen/arch/riscv/include/asm/irq.h    | 15 ++++++++++
 xen/arch/riscv/irq.c                | 45 +++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |  3 ++
 xen/arch/riscv/stubs.c              |  5 ----
 6 files changed, 65 insertions(+), 5 deletions(-)
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
index 2a48da2651..ea555afd1a 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -3,6 +3,19 @@
 #define ASM__RISCV__IRQ_H
 
 #include <xen/bug.h>
+#include <xen/device_tree.h>
+
+#include <asm/irq-dt.h>
+
+/*
+ * According to the AIA spec:
+ *   The maximum number of interrupt sources an APLIC may support is 1023.
+ *
+ * The same is true for PLIC.
+ *
+ * Interrupt Source 0 is reserved and shall never generate an interrupt.
+ */
+#define NR_IRQS 1024
 
 /* TODO */
 #define nr_irqs 0U
@@ -25,6 +38,8 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+void init_IRQ(void);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
new file mode 100644
index 0000000000..b5ae7a114b
--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * RISC-V Interrupt support
+ *
+ * Copyright (c) Vates
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
+        int rc;
+
+        desc->irq = irq;
+
+        rc = init_one_irq_desc(desc);
+        if ( rc )
+            return rc;
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
index a9c0c61fb6..8bcd19218d 100644
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
@@ -125,6 +126,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
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



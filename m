Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D70A8112E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942660.1341776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BPX-0006oq-04; Tue, 08 Apr 2025 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942660.1341776; Tue, 08 Apr 2025 16:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BPW-0006mb-Qg; Tue, 08 Apr 2025 16:02:50 +0000
Received: by outflank-mailman (input) for mailman id 942660;
 Tue, 08 Apr 2025 16:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKd-0004Yq-Ke
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321cb1c9-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:38 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac34257295dso1159022166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:38 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:37 -0700 (PDT)
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
X-Inumbo-ID: 321cb1c9-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127858; x=1744732658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5MfS/RCT0nwsF9Q5OHJGcjmsqWxZxRjAc5GG+C/zxw=;
        b=mEZ/dfqV0MZsQCNw+vM09W4DV1GUmlgZY6TUjvqIHrhuO0WzAbZ+YlhoIBOgvzICcF
         S5pXgHRyLsl7x1xV0v1xfNGusWT/2mA0ll8ud006V7rBPqCxpZxDCbBn+/ZNSdN39jRb
         Nso74lsimKmiFdJXcEq3VWjHz6evS6Q7Q3R6Xbz6EFQbuOjyPwDMQzZbkOz91vmURMxp
         Z7VNYSUqS6V4lj3zHxtImim88m/RcTG2n6NwXlvFCawBzK7qeSzl/Q7CTE3Xts4uMM+N
         w6y0y8rIXk+Vamioi9ImTo0atxzao3RoBi0VGvLTHA9vapYBmQfRXRDJcxGrLKNZaTZC
         zABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127858; x=1744732658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5MfS/RCT0nwsF9Q5OHJGcjmsqWxZxRjAc5GG+C/zxw=;
        b=evPP9hFIarw5G6dcxdvJNDZtB/OrN51+/Cl9bcBvL7AgJ8vhFEqMsuDWd/43JqAwMG
         p5MpJ7kUjtka6hZE65J5MRSiN6JXxT7c0z9QPsasegf8q0Oqf20sPQ9ppPVABsAXdlQf
         jouDQv/++/bDhionwOzctg3PTa3gXkou5IE7Yc1jvwz19u+wRItTv3Lt685UUh4V6gOc
         +zbGzvd90GJpAi0vpiW97pRfwcSPdSxUgh+7OQhdexVFNftrR5vIrfhVVsP9xImWs9vN
         fB9SRgXzr34W9jUHrsKHGOpXiDarRIiI8BiecPR2Z/XsbGsLzFbMRN/vFIeQferF2yNy
         dpDA==
X-Gm-Message-State: AOJu0Yz/Xwteo3iPeT0RJYCNymWtZ+mk57ET2ic9HP+gbsTAURokUPYm
	zFAkKP6azK1UclgSbEiD+6lRBGqOtZaEpSwgcP70XNmp3+NyiJKFv4ivmw==
X-Gm-Gg: ASbGncsHX2qL5fw+v+3ZiofDjEOlZJExJPS9c7M2Tb95G/BMVLYdL4waCoxMeQbfdSe
	6nuzJAN4fi6O/NLyivGwuIsd7clvcdUj/eS0HXilKZ9yD2pCWdyrTULFwkcGOpU3wZNruF8A3pM
	ZGjYGcY8z+FVrD54GueUICe2OsIz6nu3D1CgUsJFmp00Wm7123RGTracYTRsds1ki0u9AbnFXMa
	k9zD/kLHt2TZruw10o/cOKj/3MlCFh77ZOY7fvUkS7+kyypxB6gOHAOa8keB0NnWA4pZ8gLNJ1L
	vPzGGf9631sa81jNRMDp+WWzGBk/4y6CREb6pCGWMGEqk7hG8nNPeCu7AoNoUVShn4oQ5BGkvWE
	VzcZpLQfyG7Yl0Q==
X-Google-Smtp-Source: AGHT+IE/2DZRCwTazvLgcDQywNiSAH0C+uTl83jSwdGu1ZFmHLbA0vroaE/EPAgT3N5sYUM2ad0JHA==
X-Received: by 2002:a17:907:86a1:b0:ac7:d10c:1f39 with SMTP id a640c23a62f3a-ac7d6d04c9fmr1393082266b.20.1744127857948;
        Tue, 08 Apr 2025 08:57:37 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v1 12/14] xen/riscv: implement setup_irq()
Date: Tue,  8 Apr 2025 17:57:17 +0200
Message-ID: <2bc37c3996978129a5b2c888917307ea32448651.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for IRQ setup on RISC-V by implementing `setup_irq()` and
`__setup_irq()`, adapted and extended from an initial implementation by [1].

__setup_irq() does the following:
  - Sets up an IRQ action.
  - Validates that shared IRQs have non-NULL `dev_id` and are only used when
    existing handlers allow sharing.
  - Uses `smp_mb()` to enforce memory ordering after assigning `desc->action`
    to ensure visibility before enabling the IRQ.
  - Supports multi-action setups via `CONFIG_IRQ_HAS_MULTIPLE_ACTION`.

setup_irq() does the following:
  - Converts IRQ number to descriptor and acquires its lock.
  - Rejects registration if the IRQ is already assigned to a guest domain,
    printing an error.
  - Delegates the core setup to `__setup_irq()`.
  - On first-time setup, disables the IRQ, routes it to Xen using
    `intc_route_irq_to_xen()`, sets default CPU affinity (current CPU),
    calls the handler’s startup routine, and finally enables the IRQ.

irq_set_affinity() invokes `set_affinity` callback from the IRQ handler
if present.

Defined `IRQ_NO_PRIORITY` as default priority used when routing IRQs to Xen.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/irq.h |  6 ++
 xen/arch/riscv/irq.c             | 95 ++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 9558d3fa61..bba3a97e3e 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -26,6 +26,8 @@
 #define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
 #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
 
+#define IRQ_NO_PRIORITY 0
+
 /* TODO */
 #define nr_static_irqs 0
 #define arch_hwdom_irqs(domid) 0U
@@ -54,6 +56,10 @@ void init_IRQ(void);
 struct cpu_user_regs;
 void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
 
+struct irq_desc;
+struct cpumask_t;
+void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 3c0b95220a..1e937d4306 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -6,7 +6,9 @@
  * Copyright (c) 2024 Vates
  */
 
+#include <xen/bitops.h>
 #include <xen/bug.h>
+#include <xen/cpumask.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -57,6 +59,99 @@ int platform_get_irq(const struct dt_device_node *device, int index)
     return dt_irq.irq;
 }
 
+static int __setup_irq(struct irq_desc *desc, unsigned int irqflags,
+                       struct irqaction *new)
+{
+    bool shared = irqflags & IRQF_SHARED;
+
+    ASSERT(new != NULL);
+
+    /* Sanity checks:
+     *  - if the IRQ is marked as shared
+     *  - dev_id is not NULL when IRQF_SHARED is set
+     */
+    if ( desc->action != NULL && (!test_bit(_IRQF_SHARED, &desc->status)
+         || !shared) )
+        return -EINVAL;
+    if ( shared && new->dev_id == NULL )
+        return -EINVAL;
+
+    if ( shared )
+        set_bit(_IRQF_SHARED, &desc->status);
+
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    new->next = desc->action;
+    smp_mb();
+#endif
+
+    desc->action = new;
+    smp_mb();
+
+    return 0;
+}
+
+void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
+{
+    if ( desc != NULL )
+        desc->handler->set_affinity(desc, cpu_mask);
+}
+
+int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
+{
+    int rc;
+    unsigned long flags;
+    struct irq_desc *desc;
+    bool disabled;
+
+    desc = irq_to_desc(irq);
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    disabled = (desc->action == NULL);
+
+    if ( test_bit(_IRQ_GUEST, &desc->status) )
+    {
+        spin_unlock_irqrestore(&desc->lock, flags);
+        /*
+         * TODO: would be nice to have functionality to print which domain owns
+         *       an IRQ.
+         */
+        printk(XENLOG_ERR "ERROR: IRQ %u is already in use by a domain\n", irq);
+        return -EBUSY;
+    }
+
+    rc = __setup_irq(desc, irqflags, new);
+    if ( rc )
+        goto err;
+
+    /* First time the IRQ is setup */
+    if ( disabled )
+    {
+        /* disable irq by default */
+        set_bit(_IRQ_DISABLED, &desc->status);
+
+        /* route interrupt to xen */
+        intc_route_irq_to_xen(desc, IRQ_NO_PRIORITY);
+
+        /*
+         * we don't care for now which CPU will receive the
+         * interrupt
+         *
+         * TODO: Handle case where IRQ is setup on different CPU than
+         * the targeted CPU and the priority.
+         */
+        irq_set_affinity(desc, cpumask_of(smp_processor_id()));
+        desc->handler->startup(desc);
+        /* enable irq */
+        clear_bit(_IRQ_DISABLED, &desc->status);
+    }
+
+err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    return rc;
+}
+
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
     desc->arch.type = IRQ_TYPE_INVALID;
-- 
2.49.0



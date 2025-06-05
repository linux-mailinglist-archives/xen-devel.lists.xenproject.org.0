Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC1ACF394
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007090.1386426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND03-0000QF-1X; Thu, 05 Jun 2025 15:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007090.1386426; Thu, 05 Jun 2025 15:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND02-0000Mw-R5; Thu, 05 Jun 2025 15:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1007090;
 Thu, 05 Jun 2025 15:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uND00-00071f-Qe
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3ffca9-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:23 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-602c3f113bbso2161628a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:23 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:21 -0700 (PDT)
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
X-Inumbo-ID: 0c3ffca9-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139162; x=1749743962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kv20kch9bDGD4TNotY+8eQw9KowyHoxlqMsSxAa/+hA=;
        b=WAVxSHJw+ht2HSYL5jXSZ0FAHG26FbX7Koi1MdjeDHQo1xhPAAsGJSgKhyqhN8l4Wc
         dJiuw8uDlJBaJbIEHjtZyWyGegHo9xMWeGGcjzOcukjbJQ2DSeDh/46KbFCQyHGhqYCY
         EC2SYQzHIksRWyB4WtDbVR0LwnipmAu34E1eEXiOA1deVGuYRWsujSobxcf+MdAJ7G8/
         gHbIybaVcKkO1IZJyFHg/IIcDyhs5iHjUg5a94pJWgTGM7bFqU45pFq8TIb2l8xSEcs0
         jOqlWqaOD2QbdszOzL4YsZmGfXWvHXt0wviFrsSMsdiDENYj4r88FKMTtO2b9CxeU3NG
         T79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139162; x=1749743962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv20kch9bDGD4TNotY+8eQw9KowyHoxlqMsSxAa/+hA=;
        b=sKRd1nc3EbjNx9Ise3tFL1S7aqUvfOSA881mPKkDuG9UXYHdkRzM9a54zI0HJhgI9o
         GfX85f9V9jM0aPtBbfoR63v4AF1mxCmDfavYWQTf8QpxPlcxjguGrz5W3A8ZFDWm8+5K
         XhQFAd+nWkI93l0WodLs67L29c3At82T4Fb47tVgwpkLl6rwmnOrOcRoTNyZMPwFj98s
         T3ljeTbUgxPBunYjVPpysreZ/kmI9umAytTO5L6COObPkHGDfdMTAJVDa16bdUiVS5eF
         LJwYWsmwDasUuUDwHtYUsWTBeLIYBfeXC7CHCcpBS/nQ9Pfxqp5fb80sar7FMUxEjt6P
         JfGw==
X-Gm-Message-State: AOJu0Yy6PLPGJo1e08jhb5GmZPLJpzh2QLkXTFBhi3D0AZ9Tnpo4yfeT
	qka3X5Sc9e0QYA9+jPlbYxA/bMospEOIiFf6qrbH2Ad5US2o8ZxCCAsYVL/rMA==
X-Gm-Gg: ASbGncuTEd904Ed4rpAnrG10e/vb0TU7qc6oO9pkVpNgg9KEiOcqFNn7Zyqqhe7S8o4
	pkDcU8038g/GDDKWVxXt3Xf760xLK1tjx4HEQNtFvn1fjJ52IvTZBKraq/N9h1xQGCfrDKNPl0t
	o5n1o8VwN4PCJ8kC/5h1LWXqOFAefLmEGe5cKXMCUDW7ocfcIv9lVKBhlaVGIWLCUySOjnnZ2pC
	kQAO/6rsO3XdBVXW/UMRg4TzC8cHkCUusgzIh6skKO9uhj901lxZV5fnYl1CKc4v4l96cFVvsgR
	j/MVz5sHQILUZY06fMgXmkhhdwVhWhCBgBJxvpxwwaj1ANiElEQ/zocEeQdrrIphoi6jtzI2dAC
	0l2ZKHG1eF4MLZovFpFCp2N5NbW64
X-Google-Smtp-Source: AGHT+IFRa/H01EBeyohHhNxBqX5VxipZYGxyxs5l0TWWU+GFwSXjhsFtNbIO+zOEIcjCIhesJBtVsQ==
X-Received: by 2002:a05:6402:2707:b0:606:b997:ae58 with SMTP id 4fb4d7f45d1cf-606e967a348mr6854304a12.8.1749139162237;
        Thu, 05 Jun 2025 08:59:22 -0700 (PDT)
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
Subject: [PATCH v4 7/9] xen/riscv: add external interrupt handling for hypervisor mode
Date: Thu,  5 Jun 2025 17:59:03 +0200
Message-ID: <583dd5d3e87230961f7f895f1abf5702cda677bb.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit

Implement functions necessarry to have working external interrupts in
hypervisor mode. The following changes are done:
  - Add a common function intc_handle_external_irq() to call APLIC specific
    function to handle an interrupt.
  - Update do_trap() function to handle IRQ_S_EXT case; add the check to catch
    case when cause of trap is an interrupt.
  - Add handle_interrrupt() member to intc_hw_operations structure.
  - Enable local interrupt delivery for IMSIC by calling of
    imsic_ids_local_delivery() in imsic_init(); additionally introduce helper
    imsic_csr_write() to update IMSIC_EITHRESHOLD and IMSIC_EITHRESHOLD.
  - Enable hypervisor external interrupts.
  - Implement aplic_handler_interrupt() and use it to init ->handle_interrupt
    member of intc_hw_operations for APLIC.
  - Add implementation of do_IRQ() to dispatch the interrupt.

The current patch is based on the code from [1].

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Add ASSERT(spin_is_locked(&desc->lock)) to aplic_set_irq_type().
 - Fix code style for switch () in aplic_set_irq_type().
 - Drop fallthrough between "case IRQ_TYPE_NONE: case IRQ_TYPE_INVALID:" as there
   is no other statements in "case IRQ_TYPE_NONE".
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - use BIT() macros instead of 1UL << bit_num in aplic.c.
 - Drop passing of a cause to aplic_handle_interrupt() function. And update
   prototype of handle_interrupt() callback.
 - Drop ASSERT() in intc_handle_external_irqs() as it is useless.
 - Code style fixes.
 - Drop cause argument for intc_handle_external_irqs().
 - Update the commit message: drop words that imsic_ids_local_delivery() is
   implemented in this patch, it is only called.
 - Add cf_check for aplic_handle_interrupt(), aplic_set_irq_type().
 - Move forward declarations in asm/intc.h up.
 - Use plain C operator instead if {clear,set}_bit() for desc->status as it
   is always used under spinlock().
 - use writel() for writing to APLIC's sourcecfg in aplic_set_irq_type().
---
 xen/arch/riscv/aplic.c             | 71 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  7 +++
 xen/arch/riscv/include/asm/imsic.h |  1 +
 xen/arch/riscv/include/asm/intc.h  |  6 +++
 xen/arch/riscv/include/asm/irq.h   |  6 ++-
 xen/arch/riscv/intc.c              |  5 +++
 xen/arch/riscv/irq.c               | 47 ++++++++++++++++++++
 xen/arch/riscv/traps.c             | 19 ++++++++
 8 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 7d2a1ea7aa..763c78617b 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -228,6 +229,71 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
     spin_unlock(&aplic.lock);
 }
 
+static void cf_check aplic_handle_interrupt(struct cpu_user_regs *regs)
+{
+    /* disable to avoid more external interrupts */
+    csr_clear(CSR_SIE, BIT(IRQ_S_EXT, UL));
+
+    /* clear the pending bit */
+    csr_clear(CSR_SIP, BIT(IRQ_S_EXT, UL));
+
+    /* dispatch the interrupt */
+    do_IRQ(regs, csr_swap(CSR_STOPEI, 0) >> TOPI_IID_SHIFT);
+
+    /* enable external interrupts */
+    csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
+}
+
+static void cf_check aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    /*
+    * Interrupt 0 isn't possible based on the spec:
+    *   Each of an APLIC’s interrupt sources has a fixed unique identity number in the range 1 to N,
+    *   where N is the total number of sources at the APLIC. The number zero is not a valid interrupt
+    *   identity number at an APLIC. The maximum number of interrupt sources an APLIC may support
+    *   is 1023.
+    *
+    * Thereby interrupt 1 will correspond to bit 0 in sourcecfg[] register,
+    * interrupt 2 ->sourcecfg[1] and so on.
+    *
+    * And that is the reason why we need -1.
+    */
+    unsigned int irq_bit = desc->irq - 1;
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock(&aplic.lock);
+
+    switch ( type )
+    {
+    case IRQ_TYPE_EDGE_RISING:
+        writel(APLIC_SOURCECFG_SM_EDGE_RISE, &aplic.regs->sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_EDGE_FALLING:
+        writel(APLIC_SOURCECFG_SM_EDGE_FALL, &aplic.regs->sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_LEVEL_HIGH:
+        writel(APLIC_SOURCECFG_SM_LEVEL_HIGH, &aplic.regs->sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_LEVEL_LOW:
+        writel(APLIC_SOURCECFG_SM_LEVEL_LOW, &aplic.regs->sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_NONE:
+    case IRQ_TYPE_INVALID:
+        writel(APLIC_SOURCECFG_SM_INACTIVE, &aplic.regs->sourcecfg[irq_bit]);
+        break;
+
+    default:
+        panic("%s: APLIC doesnt support IRQ type: 0x%x?\n", __func__, type);
+    }
+
+    spin_unlock(&aplic.lock);
+}
+
 static const hw_irq_controller aplic_xen_irq_type = {
     .typename     = "aplic",
     .startup      = aplic_irq_startup,
@@ -241,6 +307,8 @@ static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
+    .handle_interrupt    = aplic_handle_interrupt,
+    .set_irq_type        = aplic_set_irq_type,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
@@ -280,6 +348,9 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     register_intc_ops(&aplic_ops);
 
+    /* Enable supervisor external interrupt */
+    csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index c3f00238f2..b335b29d34 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,13 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
+#define APLIC_SOURCECFG_SM_INACTIVE     0x0
+#define APLIC_SOURCECFG_SM_DETACH       0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL    0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
+
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
 struct aplic_regs {
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 378e49d933..c6c59215df 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -12,6 +12,7 @@
 #define ASM_RISCV_IMSIC_H
 
 #include <xen/spinlock.h>
+#include <xen/stdbool.h>
 #include <xen/types.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT   12
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index a11b7aa55e..ecdc8a5e65 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -14,6 +14,7 @@ enum intc_version {
     INTC_APLIC,
 };
 
+struct cpu_user_regs;
 struct irq_desc;
 
 struct intc_info {
@@ -37,6 +38,9 @@ struct intc_hw_operations {
     void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
     /* Set IRQ priority */
     void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+
+    /* handle external interrupt */
+    void (*handle_interrupt)(struct cpu_user_regs *regs);
 };
 
 void intc_preinit(void);
@@ -47,4 +51,6 @@ void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
+void intc_handle_external_irqs(struct cpu_user_regs *regs);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 84c3c2904d..94151eb083 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -33,16 +33,20 @@ struct arch_irq_desc {
     unsigned int type;
 };
 
+struct cpu_user_regs;
+struct dt_device_node;
+
 static inline void arch_move_irqs(struct vcpu *v)
 {
     BUG_ON("unimplemented");
 }
 
-struct dt_device_node;
 int platform_get_irq(const struct dt_device_node *device, int index);
 
 void init_IRQ(void);
 
+void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index f2823267a9..ea317aea5a 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -50,6 +50,11 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
         intc_hw_ops->set_irq_priority(desc, priority);
 }
 
+void intc_handle_external_irqs(struct cpu_user_regs *regs)
+{
+    intc_hw_ops->handle_interrupt(regs);
+}
+
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(desc->status & IRQ_DISABLED);
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 669ef3ae9e..466f1b4ba9 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -11,6 +11,10 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/spinlock.h>
+
+#include <asm/hardirq.h>
+#include <asm/intc.h>
 
 static irq_desc_t irq_desc[NR_IRQS];
 
@@ -90,3 +94,46 @@ void __init init_IRQ(void)
     if ( init_irq_data() < 0 )
         panic("initialization of IRQ data failed\n");
 }
+
+/* Dispatch an interrupt */
+void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
+{
+    struct irq_desc *desc = irq_to_desc(irq);
+    struct irqaction *action;
+
+    irq_enter();
+
+    spin_lock(&desc->lock);
+
+    if ( desc->handler->ack )
+        desc->handler->ack(desc);
+
+    if ( desc->status & IRQ_DISABLED )
+        goto out;
+
+    desc->status |= IRQ_INPROGRESS;
+
+    action = desc->action;
+
+    spin_unlock_irq(&desc->lock);
+
+#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    action->handler(irq, action->dev_id);
+#else
+    do {
+        action->handler(irq, action->dev_id);
+        action = action->next;
+    } while ( action );
+#endif /* CONFIG_IRQ_HAS_MULTIPLE_ACTION */
+
+    spin_lock_irq(&desc->lock);
+
+    desc->status &= ~IRQ_INPROGRESS;
+
+ out:
+    if ( desc->handler->end )
+        desc->handler->end(desc);
+
+    spin_unlock(&desc->lock);
+    irq_exit();
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ea3638a54f..f061004d83 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -11,6 +11,7 @@
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
+#include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
@@ -128,6 +129,24 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         }
         fallthrough;
     default:
+        if ( cause & CAUSE_IRQ_FLAG )
+        {
+            /* Handle interrupt */
+            unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
+
+            switch ( icause )
+            {
+            case IRQ_S_EXT:
+                intc_handle_external_irqs(cpu_regs);
+                break;
+
+            default:
+                break;
+            }
+
+            break;
+        }
+
         do_unexpected_trap(cpu_regs);
         break;
     }
-- 
2.49.0



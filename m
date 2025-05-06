Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5946AACBD0
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977771.1364735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhc-0006xY-Dd; Tue, 06 May 2025 17:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977771.1364735; Tue, 06 May 2025 17:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhc-0006v7-AD; Tue, 06 May 2025 17:03:32 +0000
Received: by outflank-mailman (input) for mailman id 977771;
 Tue, 06 May 2025 17:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWf-00058E-AM
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:13 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c51a7d-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:10 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso11138294a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:10 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:09 -0700 (PDT)
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
X-Inumbo-ID: 73c51a7d-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550330; x=1747155130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6Bqs4HUZYvlu7+UKZCeflArWZzpdjYXovI0MbCmOOQ=;
        b=TUxILspRiu/N+p+mxbWi5uTmvv9OTkoPYKTf3Bj3b6Qp5bt0QvHBa9bhj3fmEncmhy
         MkXRaXR160BeBP7HlE4tcQgLP7gew4V5PO6RKd13b36GIzKRDr8+MQVM8z3ti3pXhEFT
         dLe0zuPAtlCELS9yBaI+x5epheUq3lVr75k8Im7Ap05eedjGVLCG0gJnGSHbKgEUoVea
         z4BUrAPWnQ5ToJeW+igrNqMFqNOEkqi0Hqe81F3EoHjmjTUWa3QJ9o4KcqUT86jaIVdy
         y/EgyKAnn916WztrhvAkq5J4nep975QndqzRt4T+G2ikNL3DOnWeE5C1PHfzv1jSqi6p
         l+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550330; x=1747155130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6Bqs4HUZYvlu7+UKZCeflArWZzpdjYXovI0MbCmOOQ=;
        b=Rr7exofxNEb3JKLTQBh/dULoM2TLwtZnJxTpFsWcb+FXsrpTe7piHEKaQBOEN3c+8u
         46l/oxvLBMY9RNWIAFRpBrBsANv5gj+ooux685Hger26c6xPlmHcGusdqRfZpMdiLsNf
         93QhMRUTJw2CTOIjUpYTk5dMg0VnorVUvdP8I1RqweETF/jgKL/d5e0OaA2qtB3aWKgL
         uGn655IH58Tpj7qM9KqX4GFi2gPHXdnjqRIo/PpM3yFWM4DBB2v8kt4IIjLRY/sFHeSc
         ddNSK2+zZi+JApGhEFy4wcHVOtXo7jjMskVuTOCsen9bzRPRGZQDSHolhEjHB2TKpwih
         /m0w==
X-Gm-Message-State: AOJu0YzPF5DlDHjcIXYII4aLlx9zYPWTpL/XQHK1rczTVGP9XN6nwzVz
	pooOCorq4it8uSq/4rB0fnRa480RiIc1/4LVEOEWI++VWIesGg8v5GsFGQ==
X-Gm-Gg: ASbGnctMXlCm+YvdGG9+BzWrNAwARkPesaIV2MOdsWnMFZCKVQooTIOzlgQTrIDMggb
	F2khTJDlVdzYSilAKlzyxhFyWPDXXN3fKWjhBDYFSdHR86+78Et5sihZhHV6Oz+i7AIEjOSXg/7
	sC4gnil/ovpZQSk4ujF4SxFfhpQfuyvjCYl9VfVhfQmngN89cdLcr6FRSAmw87hlSlQ2O11f7df
	qJld/oBz8IvPNb8u3XW1GNFWuG8J7OeQq8wEckI/b2EhQKKx1Uiy2KRSdMYpyLNbMRaJg1XgOLi
	C8LNoBhp9rhoZYpNH9T60UtifrQeuXJ274lZDusbLXTtoXcLu+7eJRVv/Qe4AEgo/O5pf3u3cGw
	+XzkWt0z7QQ==
X-Google-Smtp-Source: AGHT+IGmp6lEcZuOM7EOyfKzzNLgVyhyK3ohwHus5N69zv5PaqpnW7B0bPc6iRwxRjxJgODrKgddtQ==
X-Received: by 2002:a17:907:d87:b0:ad1:8b5c:114b with SMTP id a640c23a62f3a-ad1e8bc3344mr23293766b.18.1746550329573;
        Tue, 06 May 2025 09:52:09 -0700 (PDT)
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
Subject: [PATCH v2 14/16] xen/riscv: add external interrupt handling for hypervisor mode
Date: Tue,  6 May 2025 18:51:44 +0200
Message-ID: <5688ed044febf734d9c75aa2e6f52affccd3fce9.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic.c             | 70 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  7 +++
 xen/arch/riscv/include/asm/imsic.h |  1 +
 xen/arch/riscv/include/asm/intc.h  |  5 +++
 xen/arch/riscv/include/asm/irq.h   |  6 ++-
 xen/arch/riscv/intc.c              |  5 +++
 xen/arch/riscv/irq.c               | 47 ++++++++++++++++++++
 xen/arch/riscv/traps.c             | 19 ++++++++
 8 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index e2bee7ad23..ef7fc2562d 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -220,6 +221,70 @@ static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
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
+    spin_lock(&aplic.lock);
+
+    switch(type)
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
+        fallthrough;
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
@@ -233,6 +298,8 @@ static struct intc_hw_operations __ro_after_init aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
+    .handle_interrupt    = aplic_handle_interrupt,
+    .set_irq_type        = aplic_set_irq_type,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
@@ -274,6 +341,9 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     register_intc_ops(&aplic_ops);
 
+    /* Enable supervisor external interrupt */
+    csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index dc4ccbb9aa..661d9f294f 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,13 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, UL)
 #define APLIC_DOMAINCFG_DM      BIT(2, UL)
 
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
index 1d6ab4d685..c765d3d8e4 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -12,6 +12,7 @@
 #define ASM__RISCV__IMSIC_H
 
 #include <xen/spinlock.h>
+#include <xen/stdbool.h>
 #include <xen/types.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT   12
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 45a41147a6..1efa80fff6 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -22,6 +22,7 @@ struct intc_info {
     unsigned int num_irqs;
 };
 
+struct cpu_user_regs;
 struct irq_desc;
 
 struct intc_hw_operations {
@@ -38,6 +39,8 @@ struct intc_hw_operations {
     /* Set IRQ priority */
     void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
 
+    /* handle external interrupt */
+    void (*handle_interrupt)(struct cpu_user_regs *regs);
 };
 
 void intc_preinit(void);
@@ -48,4 +51,6 @@ void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
+void intc_handle_external_irqs(struct cpu_user_regs *regs);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 6223bbbed5..1a05c5ff88 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -25,16 +25,20 @@ struct arch_irq_desc {
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
index 15f358601d..478401cc74 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -54,6 +54,11 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
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
index 4c518bbd97..056bdf3ca8 100644
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
 
@@ -85,3 +89,46 @@ void __init init_IRQ(void)
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



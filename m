Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F837AD91DE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014634.1392801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eV-0000PF-4f; Fri, 13 Jun 2025 15:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014634.1392801; Fri, 13 Jun 2025 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eU-0000KB-PW; Fri, 13 Jun 2025 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1014634;
 Fri, 13 Jun 2025 15:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eS-0006cn-Mu
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f011e806-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:49:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-adb5cb6d8f1so399733566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:49:05 -0700 (PDT)
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
X-Inumbo-ID: f011e806-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829746; x=1750434546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/8G0maLAdS7qiUNN1zQIFAqq4669vsyHIhw5b6gzZ8=;
        b=H5nIUquYVfIr+5UBu8MVnElaJthCWjE6NQQo3omwJzfKHHUxZ+iECw7bfwwK37Rjik
         m5vvCL2VSRlOCiYbZ3Irl4OnS9y9cCUOwPlrvWmr70ePlxTuUCo2scr3ZqzOuYpHbvaR
         DDc07ZyOA4mzZAekLGK6sb1Spyluv/GoauSX7x/41rJEMfNOdaiFPA7A3pLc8IgfK5al
         4L4voC4udOc23EZao0h9IpQXZPGUT5uG+OTLK8w9Heu/ssmhtoEiVBdcQlwEansXUTXa
         bkER1sY186dQvCoQdLBZHDv+c5Qz839Y7garIfPQ+5IWkBZz6uR5mnMQ2oAIilfQJYYz
         lcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829746; x=1750434546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/8G0maLAdS7qiUNN1zQIFAqq4669vsyHIhw5b6gzZ8=;
        b=p6zVEFnb/ZJ3d5R1PxsL4RDONFDmJRbKS3lWi/IWHb0b96nYKW1kMXx7l4SJwy4OLf
         6Ayu6p7TZzeZ9fAr7jfk03bIoLjTFcoFWikihlgHGhk9oUFyrNdN3DqS6BNyOLar8q6w
         OKm3IrCsvTq1AoRlE4Vlrv3cp2WlgdC5aGfJ0SdASjVWui+O1UVLxk4KjCkAYwoEd8s0
         3QamNewo1z2ILBW/6PnEhS84qFc+olzx9Qyz6028cgvGM0o2nMy76Vf8gvG3PV03B1Ul
         nW1KMIaP2MQ6I1igUD1NxvKncuCN1HQlO0Ozb7aIkLykqNsqPJtrjG7LDl1oXEKpkr84
         P2iA==
X-Gm-Message-State: AOJu0YzxPu64QTzXH5javTajyhRZ7bZHrSHy6NqhEBXJRm6AhQ0nusMi
	K0V45BsBJIOG1nacIOBvd5La10ldyeYjja3R/TFSnA66yANam82g8k9WAhXhvA==
X-Gm-Gg: ASbGncse/4WATuoT9B3RovwQj/9TBBwSXeYy1drFYWv5DA+MiEDhs9DcGFsJWkNSFOC
	v4R/TAVoatXYG95Ew+Ob+xBf7DRh7Pmiz+3CHyokjC19h9YCXrimxIubmbqrv/DC0jOHn1sJvDG
	0YIQQthUqUFmJXKICQZYajR8NFTC45F/2b6AlYA7Fovb7UR9Snsm9T5ghXp0hxV0adqIs6v2hft
	N7Rg1Tf/3/I/YsfN/udw9UGn59cSuTYGwm8aUe8FkWY/z6L8B7Ao0LrZQdxbdApeqlMSq7ANcsf
	OmT6gBdsrDy4Oep1P6F3qbvwMCRX8X0YB9voO1G5dwYuRj89OiyTdQOaqmeKjhIe2go5W9oVA6D
	50t0kPkW9eaPsldvt+L/lnxp6NlF1
X-Google-Smtp-Source: AGHT+IE5T5Qjocief1oZduJTAONzPqr4yUERGVSSj6rRcJmvFl4TpiHXOdDafhuF40U3bNtdSpEV7w==
X-Received: by 2002:a17:907:9623:b0:ad5:a29c:efed with SMTP id a640c23a62f3a-adec5cb0022mr351633666b.33.1749829745688;
        Fri, 13 Jun 2025 08:49:05 -0700 (PDT)
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
Subject: [PATCH v5 7/9] xen/riscv: add external interrupt handling for hypervisor mode
Date: Fri, 13 Jun 2025 17:48:46 +0200
Message-ID: <af61c892114d4d61b688646021645cfa33ad0ee6.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Changes in V4 - V5:
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
index f3f4a44649..7e0cacc8d2 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -227,6 +228,71 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
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
@@ -240,6 +306,8 @@ static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
+    .handle_interrupt    = aplic_handle_interrupt,
+    .set_irq_type        = aplic_set_irq_type,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
@@ -279,6 +347,9 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D731A8112F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942664.1341781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BPX-0006rQ-7q; Tue, 08 Apr 2025 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942664.1341781; Tue, 08 Apr 2025 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BPX-0006oo-0c; Tue, 08 Apr 2025 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 942664;
 Tue, 08 Apr 2025 16:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKc-0004Yq-KZ
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3168b3ad-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:37 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e61da95244so9512658a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:37 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:36 -0700 (PDT)
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
X-Inumbo-ID: 3168b3ad-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127857; x=1744732657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc7wfWEtEETos3Xy4ASDsRUDXv0bfhmJEvEO/7TawQo=;
        b=D61MvuwlhhT/iHjVl6KJsI8boKoCmvfGA8ZBmL52WQt30wmheVc8wPZtdIbPUW2Aa0
         TAc4ZBm13fVg/R1b48S8DyT95OJTxlaSDzUeBJrM/IaJcjxYRiLziYkuPyieotta6Wd6
         g5HdJS0LRcmGXvQFa0IR97w4yOn+dJ74FcKRH+g+9tapkCugDrXLwE0lfudbHMXCj4ec
         diTvT84ZzH4xlPVP1L7o2NCp+T5M2yvk/9aniLpVAjskrcfpoVMhUhXBlk1/r4+kV9NL
         2Ust8vMSuCCHPziUnhoxHx8TlzreByuz6sqLwPvWXMne7VsThNRcpH3yLerLLnLMIrZ7
         HOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127857; x=1744732657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sc7wfWEtEETos3Xy4ASDsRUDXv0bfhmJEvEO/7TawQo=;
        b=H6vr8TuqfbwdJkT4KP75hvJYQ7gc8XfgdeKXkRVRmqeAVm49iS//IUwIU+qsBQjjva
         IeO8qzFjJXolpDY5U29LwDXLhNXmGh6K9wgmJWsWvc3pE7Ok+3GyIu6OAosCWt5mCKAo
         hERpLXyvl5ECNdKBGhE/gXCHa7aJM60F8EEdO0kkX0WvmJvR//au1W4nasct5RLuXKj/
         dDZsQQMTdE+4aq9WSggkfSGT2QFdROPCtxKnhSDugC+ldbMhEFOzRsExvxmZmIQN/InE
         vR4WvK/e8Q2K7xonMTSwIKTq4mpPRVEjA0yaXx5d/NO4EBaIWd43M3jP4TKJTuIPUqTO
         4QmA==
X-Gm-Message-State: AOJu0Yw2MOmEhOqhkBgPi/yHx6gKvAE6hF3Bm4YR27GAQmzZnQThQsTz
	9ce8ICRQSrbZgJ28dcZSwwe53mtCd23tMceYe1Qq+Wnpjhqpf84IqfGopA==
X-Gm-Gg: ASbGnctq48V1gmSzFSqFg7k5rnH8U18aA3NryJkijw98rObfjuekTWFlgL+9SeZRPuY
	j6dMV4UyqLTttwukM7Qf2GjQ1nGWQcRJyxA8JgjKXkyrb3f3WOimotccVQNvEDGTUryOBfwSB1V
	XR3O6F1USGLQ3rST8Tbsbx3zWEUdczI4PFEIjKdkraTCsF9YwjsL7PLqy0sj77WATLT3Y9bV1KZ
	iiA8JYZ/deQUekXEWp48jXaiWThkoN3jPlxBL7obBzDyCNsoF8Q/5+Z/5zG6lb7fcf/ZDyWe6/n
	rRrZx9uqXALgybDsa6brvGY728QuYBBGDU5G/l+0qOLyWmGutPR1xlCFNiLcmj/4YGUqkvgPJQ+
	o/IfzPOnuGDNWkg==
X-Google-Smtp-Source: AGHT+IFL3WNhj77fFPxV0cWMP8yo+oe1QoIkzk3e18tqqolBdgOLMj6ctPGIvdYduEJRVIBY++KgZA==
X-Received: by 2002:a17:907:97d6:b0:ac7:391b:e68a with SMTP id a640c23a62f3a-ac7d1c14826mr1306772666b.60.1744127856612;
        Tue, 08 Apr 2025 08:57:36 -0700 (PDT)
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
Subject: [PATCH v1 11/14] xen/riscv: add external interrupt handling for hypervisor mode
Date: Tue,  8 Apr 2025 17:57:16 +0200
Message-ID: <1685488b8c1b48149e94bd3625c7b46b78c72e8e.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement functions necessarry to have working external interrupts in
hypervisor mode. The following changes are done:
 - Add a common function intc_handle_external_irq() to call APLIC specific
   function to handle an interrupt.
 - Update do_trap() function to handle IRQ_S_EXT case; add the check to catch
   case when cause of trap is an interrupt.
 - Add handle_interrrupt() member to intc_hw_operations structure.
 - Enable local interrupt delivery for IMSIC by implementation and calling of
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
 xen/arch/riscv/aplic.c             | 19 +++++++++++++
 xen/arch/riscv/imsic.c             | 25 +++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  7 +++++
 xen/arch/riscv/include/asm/intc.h  |  5 ++++
 xen/arch/riscv/include/asm/irq.h   |  3 +++
 xen/arch/riscv/intc.c              |  7 +++++
 xen/arch/riscv/irq.c               | 43 ++++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c             | 18 +++++++++++++
 8 files changed, 127 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 4b60cb9a77..38b57ed1ac 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -261,6 +261,21 @@ static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
     spin_unlock(&aplic.lock);
 }
 
+static void aplic_handle_interrupt(unsigned long cause, struct cpu_user_regs *regs)
+{
+    /* disable to avoid more external interrupts */
+    csr_clear(CSR_SIE, 1UL << IRQ_S_EXT);
+
+    /* clear the pending bit */
+    csr_clear(CSR_SIP, 1UL << IRQ_S_EXT);
+
+    /* dispatch the interrupt */
+    do_IRQ(regs, csr_swap(CSR_STOPEI, 0) >> TOPI_IID_SHIFT);
+
+    /* enable external interrupts */
+    csr_set(CSR_SIE, 1UL << IRQ_S_EXT);
+}
+
 static hw_irq_controller aplic_host_irq_type = {
     .typename     = "aplic",
     .startup      = aplic_irq_startup,
@@ -278,6 +293,7 @@ static const struct intc_hw_operations aplic_ops = {
     .host_irq_type       = &aplic_host_irq_type,
     .set_irq_priority    = aplic_set_irq_priority,
     .set_irq_type        = aplic_set_irq_type,
+    .handle_interrupt    = aplic_handle_interrupt,
 };
 
 static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
@@ -318,6 +334,9 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     register_intc_ops(&aplic_ops);
 
+    /* Enable supervisor external interrupt */
+    csr_set(CSR_SIE, 1UL << IRQ_S_EXT);
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 8198d008ef..e00f2d69df 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -19,8 +19,19 @@
 
 #include <asm/imsic.h>
 
+#define IMSIC_DISABLE_EIDELIVERY    0
+#define IMSIC_ENABLE_EIDELIVERY     1
+#define IMSIC_DISABLE_EITHRESHOLD   1
+#define IMSIC_ENABLE_EITHRESHOLD    0
+
 static struct imsic_config imsic_cfg;
 
+#define imsic_csr_write(c, v)   \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_write(CSR_SIREG, v);    \
+} while (0)
+
 #define imsic_csr_set(c, v)     \
 do {                            \
     csr_write(CSR_SISELECT, c); \
@@ -33,6 +44,20 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+void imsic_ids_local_delivery(bool enable)
+{
+    if ( enable )
+    {
+        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
+        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
+    }
+    else
+    {
+        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
+        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
+    }
+}
+
 static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
                                    bool pend, bool val)
 {
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index d2c0178529..b2c674f271 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -12,6 +12,7 @@
 #define ASM__RISCV__IMSIC_H
 
 #include <xen/spinlock.h>
+#include <xen/stdbool.h>
 #include <xen/types.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT   12
@@ -20,6 +21,10 @@
 #define IMSIC_MIN_ID            63
 #define IMSIC_MAX_ID            2048
 
+#define IMSIC_EIDELIVERY        0x70
+
+#define IMSIC_EITHRESHOLD       0x72
+
 #define IMSIC_EIP0              0x80
 #define IMSIC_EIPx_BITS         32
 
@@ -78,4 +83,6 @@ const struct imsic_config *imsic_get_config(void);
 void imsic_irq_enable(unsigned int hwirq);
 void imsic_irq_disable(unsigned int hwirq);
 
+void imsic_ids_local_delivery(bool enable);
+
 #endif /* ASM__RISCV__IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index db53caa07b..e4363af87d 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -34,6 +34,8 @@ struct intc_hw_operations {
     /* Set IRQ priority */
     void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
 
+    /* handle external interrupt */
+    void (*handle_interrupt)(unsigned long cause, struct cpu_user_regs *regs);
 };
 
 void intc_preinit(void);
@@ -45,4 +47,7 @@ void register_intc_ops(const struct intc_hw_operations *ops);
 struct irq_desc;
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
+struct cpu_user_regs;
+void intc_handle_external_irqs(unsigned long cause, struct cpu_user_regs *regs);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 163a478d78..9558d3fa61 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -51,6 +51,9 @@ int platform_get_irq(const struct dt_device_node *device, int index);
 
 void init_IRQ(void);
 
+struct cpu_user_regs;
+void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 8274897d8c..41a4310ead 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -51,6 +51,13 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
     intc_hw_ops->set_irq_priority(desc, priority);
 }
 
+void intc_handle_external_irqs(unsigned long cause, struct cpu_user_regs *regs)
+{
+    ASSERT(intc_hw_ops && intc_hw_ops->handle_interrupt);
+
+    intc_hw_ops->handle_interrupt(cause, regs);
+}
+
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index c332e000c4..3c0b95220a 100644
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
 
@@ -83,3 +87,42 @@ void __init init_IRQ(void)
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
+    desc->handler->ack(desc);
+
+    if ( test_bit(_IRQ_DISABLED, &desc->status) )
+        goto out;
+
+    set_bit(_IRQ_INPROGRESS, &desc->status);
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
+    clear_bit(_IRQ_INPROGRESS, &desc->status);
+
+out:
+    desc->handler->end(desc);
+    spin_unlock(&desc->lock);
+    irq_exit();
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ea3638a54f..da5813e34a 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -11,6 +11,7 @@
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
+#include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
@@ -128,6 +129,23 @@ void do_trap(struct cpu_user_regs *cpu_regs)
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
+                intc_handle_external_irqs(cause, cpu_regs);
+                break;
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



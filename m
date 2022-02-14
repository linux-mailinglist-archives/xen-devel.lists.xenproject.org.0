Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F54B5116
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271711.466355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3Z-0007sw-3Q; Mon, 14 Feb 2022 13:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271711.466355; Mon, 14 Feb 2022 13:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3Y-0007dK-I2; Mon, 14 Feb 2022 13:06:16 +0000
Received: by outflank-mailman (input) for mailman id 271711;
 Mon, 14 Feb 2022 13:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2a-00023t-2E
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde2d12a-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:12 +0100 (CET)
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
X-Inumbo-ID: bde2d12a-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=h36fBx0LFuxnyE677FLM/COl0irN2W1vke1lrZtnkVs=;
  b=eJoAgxtOGX1ha3LQRp167aB0V47GguagKGZ0wiJSvj35ld7YPn9DoRB7
   bPZryP1bYjeRu0zmOklXp/rtXRSNIStvaJ0qNzernalUtfVIjIDdzBacJ
   uwUIi3Nr1WM/10C6822pUALzJjEUfJ36YOS3jv92q2cJYdq/6TIL1GOiF
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oG2RzYEMxtvV1Y9hwhqCFCQDucZgsQTYSRna3POglRxV+qwki062O3WwLloF6of6BYFGXhJQkY
 raO7T4peL+c5uQ4+XGybny7OuFyDv1JgZ/QTB3RnzlX4Nh2QrFAgcHjDWJzeR6RmlqGPf9lxt0
 czN5YWYQpqNRGJ/+rS3Ks3NmWxiL1FwqbXwzdFN+uu2wNrHWBc6ufxUygI6tuEskyxXAMVhEGt
 YCsqey8UqE6HboXrPVWftZJCQfF0fx68nBI1lim4wHZjQvBBMX36NuA3Ob/EaVegcOPa/SY6ll
 i0Ha7Xd6nxzB9+6A+M65ocsC
X-SBRS: 5.1
X-MesageID: 63592601
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wUHFDa2ctH4asle9e/bD5c12kn2cJEfYwER7XKvMYLTBsI5bp2NWz
 WAeXW2FOPeKajT0eN5xa4yz8E5X7ZHVz9FiGgpppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhhsl7j
 /ZEnpyKSQ4rOI2TiMJBazNyKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3Z0fR6iGP
 qL1bxJCVTfhQgBRJms6M8xnhPrzonnOawdX/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTuOCzzW23cNJlK
 0UW/ApxvY5uzGaBd4yoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3l35unTuJHfgWDX2PiNKjWZJccp9dWHPmUwzzxP/sTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:+pxzu6/PWM23dmoNKOduk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592601"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 51/70] x86/irq: CFI hardening
Date: Mon, 14 Feb 2022 12:51:08 +0000
Message-ID: <20220214125127.17985-52-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hpet.c                      | 11 ++++++-----
 xen/arch/x86/i8259.c                     | 10 +++++-----
 xen/arch/x86/include/asm/irq.h           |  8 ++++----
 xen/arch/x86/include/asm/msi.h           |  8 ++++----
 xen/arch/x86/io_apic.c                   | 24 ++++++++++++------------
 xen/arch/x86/irq.c                       |  6 +++---
 xen/arch/x86/msi.c                       | 14 +++++++-------
 xen/common/irq.c                         |  6 +++---
 xen/drivers/passthrough/amd/iommu_init.c | 15 ++++++++-------
 xen/drivers/passthrough/vtd/iommu.c      | 13 +++++++------
 xen/include/xen/irq.h                    |  6 +++---
 11 files changed, 62 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 20fca839907c..dcc9e16693e9 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -256,7 +256,7 @@ static void cf_check hpet_interrupt_handler(
     ch->event_handler(ch);
 }
 
-static void hpet_msi_unmask(struct irq_desc *desc)
+static void cf_check hpet_msi_unmask(struct irq_desc *desc)
 {
     u32 cfg;
     struct hpet_event_channel *ch = desc->action->dev_id;
@@ -267,7 +267,7 @@ static void hpet_msi_unmask(struct irq_desc *desc)
     ch->msi.msi_attrib.host_masked = 0;
 }
 
-static void hpet_msi_mask(struct irq_desc *desc)
+static void cf_check hpet_msi_mask(struct irq_desc *desc)
 {
     u32 cfg;
     struct hpet_event_channel *ch = desc->action->dev_id;
@@ -296,7 +296,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
     return 0;
 }
 
-static unsigned int hpet_msi_startup(struct irq_desc *desc)
+static unsigned int cf_check hpet_msi_startup(struct irq_desc *desc)
 {
     hpet_msi_unmask(desc);
     return 0;
@@ -304,14 +304,15 @@ static unsigned int hpet_msi_startup(struct irq_desc *desc)
 
 #define hpet_msi_shutdown hpet_msi_mask
 
-static void hpet_msi_ack(struct irq_desc *desc)
+static void cf_check hpet_msi_ack(struct irq_desc *desc)
 {
     irq_complete_move(desc);
     move_native_irq(desc);
     ack_APIC_irq();
 }
 
-static void hpet_msi_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
+static void cf_check hpet_msi_set_affinity(
+    struct irq_desc *desc, const cpumask_t *mask)
 {
     struct hpet_event_channel *ch = desc->action->dev_id;
     struct msi_msg msg = ch->msi.msg;
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index b389bb217622..6b35be10f09a 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -40,18 +40,18 @@ bool bogus_8259A_irq(unsigned int irq)
     return _mask_and_ack_8259A_irq(irq);
 }
 
-static void mask_and_ack_8259A_irq(struct irq_desc *desc)
+static void cf_check mask_and_ack_8259A_irq(struct irq_desc *desc)
 {
     _mask_and_ack_8259A_irq(desc->irq);
 }
 
-static unsigned int startup_8259A_irq(struct irq_desc *desc)
+static unsigned int cf_check startup_8259A_irq(struct irq_desc *desc)
 {
     enable_8259A_irq(desc);
     return 0; /* never anything pending */
 }
 
-static void end_8259A_irq(struct irq_desc *desc, u8 vector)
+static void cf_check end_8259A_irq(struct irq_desc *desc, u8 vector)
 {
     if (!(desc->status & (IRQ_DISABLED|IRQ_INPROGRESS)))
         enable_8259A_irq(desc);
@@ -108,12 +108,12 @@ static void _disable_8259A_irq(unsigned int irq)
     spin_unlock_irqrestore(&i8259A_lock, flags);
 }
 
-void disable_8259A_irq(struct irq_desc *desc)
+void cf_check disable_8259A_irq(struct irq_desc *desc)
 {
     _disable_8259A_irq(desc->irq);
 }
 
-void enable_8259A_irq(struct irq_desc *desc)
+void cf_check enable_8259A_irq(struct irq_desc *desc)
 {
     unsigned int mask = ~(1 << desc->irq);
     unsigned long flags;
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index b3f49abc5556..76e6ed6d60aa 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -111,8 +111,8 @@ void alloc_direct_apic_vector(
 
 void do_IRQ(struct cpu_user_regs *regs);
 
-void disable_8259A_irq(struct irq_desc *);
-void enable_8259A_irq(struct irq_desc *);
+void cf_check disable_8259A_irq(struct irq_desc *);
+void cf_check enable_8259A_irq(struct irq_desc *);
 int i8259A_irq_pending(unsigned int irq);
 void mask_8259A(void);
 void unmask_8259A(void);
@@ -173,7 +173,7 @@ int create_irq(nodeid_t node, bool grant_access);
 void destroy_irq(unsigned int irq);
 int assign_irq_vector(int irq, const cpumask_t *);
 
-extern void irq_complete_move(struct irq_desc *);
+void cf_check irq_complete_move(struct irq_desc *);
 
 extern struct irq_desc *irq_desc;
 
@@ -187,7 +187,7 @@ void move_masked_irq(struct irq_desc *);
 
 int bind_irq_vector(int irq, int vector, const cpumask_t *);
 
-void end_nonmaskable_irq(struct irq_desc *, uint8_t vector);
+void cf_check end_nonmaskable_irq(struct irq_desc *, uint8_t vector);
 void irq_set_affinity(struct irq_desc *, const cpumask_t *mask);
 
 int init_domain_irq_mapping(struct domain *);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index e228b0f3f344..117379318f2c 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -247,10 +247,10 @@ void early_msi_init(void);
 void msi_compose_msg(unsigned vector, const cpumask_t *mask,
                      struct msi_msg *msg);
 void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable);
-void mask_msi_irq(struct irq_desc *);
-void unmask_msi_irq(struct irq_desc *);
+void cf_check mask_msi_irq(struct irq_desc *);
+void cf_check unmask_msi_irq(struct irq_desc *);
 void guest_mask_msi_irq(struct irq_desc *, bool mask);
-void ack_nonmaskable_msi_irq(struct irq_desc *);
-void set_msi_affinity(struct irq_desc *, const cpumask_t *);
+void cf_check ack_nonmaskable_msi_irq(struct irq_desc *);
+void cf_check set_msi_affinity(struct irq_desc *, const cpumask_t *);
 
 #endif /* __ASM_MSI_H */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 4c5eaef86273..c086f40f6314 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -473,7 +473,7 @@ static void __level_IO_APIC_irq (unsigned int irq)
     modify_IO_APIC_irq(irq, IO_APIC_REDIR_LEVEL_TRIGGER, 0);
 }
 
-static void mask_IO_APIC_irq(struct irq_desc *desc)
+static void cf_check mask_IO_APIC_irq(struct irq_desc *desc)
 {
     unsigned long flags;
 
@@ -482,7 +482,7 @@ static void mask_IO_APIC_irq(struct irq_desc *desc)
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
 
-static void unmask_IO_APIC_irq(struct irq_desc *desc)
+static void cf_check unmask_IO_APIC_irq(struct irq_desc *desc)
 {
     unsigned long flags;
 
@@ -567,7 +567,7 @@ static void clear_IO_APIC (void)
     }
 }
 
-static void
+static void cf_check
 set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
 {
     unsigned int dest;
@@ -1547,7 +1547,7 @@ static int __init timer_irq_works(void)
  * This is not complete - we should be able to fake
  * an edge even if it isn't on the 8259A...
  */
-static unsigned int startup_edge_ioapic_irq(struct irq_desc *desc)
+static unsigned int cf_check startup_edge_ioapic_irq(struct irq_desc *desc)
 {
     int was_pending = 0;
     unsigned long flags;
@@ -1569,7 +1569,7 @@ static unsigned int startup_edge_ioapic_irq(struct irq_desc *desc)
  * interrupt for real. This prevents IRQ storms from unhandled
  * devices.
  */
-static void ack_edge_ioapic_irq(struct irq_desc *desc)
+static void cf_check ack_edge_ioapic_irq(struct irq_desc *desc)
 {
     irq_complete_move(desc);
     move_native_irq(desc);
@@ -1594,7 +1594,7 @@ static void ack_edge_ioapic_irq(struct irq_desc *desc)
  * generic IRQ layer and by the fact that an unacked local
  * APIC does not accept IRQs.
  */
-static unsigned int startup_level_ioapic_irq(struct irq_desc *desc)
+static unsigned int cf_check startup_level_ioapic_irq(struct irq_desc *desc)
 {
     unmask_IO_APIC_irq(desc);
 
@@ -1652,7 +1652,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
     return 0;
 }
 
-static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
+static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
 {
     unsigned long v;
     int i;
@@ -1702,7 +1702,7 @@ static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
     }
 }
 
-static void end_level_ioapic_irq_old(struct irq_desc *desc, u8 vector)
+static void cf_check end_level_ioapic_irq_old(struct irq_desc *desc, u8 vector)
 {
     if ( directed_eoi_enabled )
     {
@@ -1723,7 +1723,7 @@ static void end_level_ioapic_irq_old(struct irq_desc *desc, u8 vector)
         unmask_IO_APIC_irq(desc);
 }
 
-static void end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
+static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
 {
 /*
  * It appears there is an erratum which affects at least version 0x11
@@ -1807,7 +1807,7 @@ static inline void init_IO_APIC_traps(void)
             make_8259A_irq(irq);
 }
 
-static void enable_lapic_irq(struct irq_desc *desc)
+static void cf_check enable_lapic_irq(struct irq_desc *desc)
 {
     unsigned long v;
 
@@ -1815,7 +1815,7 @@ static void enable_lapic_irq(struct irq_desc *desc)
     apic_write(APIC_LVT0, v & ~APIC_LVT_MASKED);
 }
 
-static void disable_lapic_irq(struct irq_desc *desc)
+static void cf_check disable_lapic_irq(struct irq_desc *desc)
 {
     unsigned long v;
 
@@ -1823,7 +1823,7 @@ static void disable_lapic_irq(struct irq_desc *desc)
     apic_write(APIC_LVT0, v | APIC_LVT_MASKED);
 }
 
-static void ack_lapic_irq(struct irq_desc *desc)
+static void cf_check ack_lapic_irq(struct irq_desc *desc)
 {
     ack_APIC_irq();
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 61e09a356f97..285ac399fbfd 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -468,7 +468,7 @@ int __init init_irq_data(void)
     return 0;
 }
 
-static void ack_none(struct irq_desc *desc)
+static void cf_check ack_none(struct irq_desc *desc)
 {
     ack_bad_irq(desc->irq);
 }
@@ -832,7 +832,7 @@ static void send_cleanup_vector(struct irq_desc *desc)
     desc->arch.move_in_progress = 0;
 }
 
-void irq_complete_move(struct irq_desc *desc)
+void cf_check irq_complete_move(struct irq_desc *desc)
 {
     unsigned vector, me;
 
@@ -1086,7 +1086,7 @@ bool cpu_has_pending_apic_eoi(void)
     return pending_eoi_sp(this_cpu(pending_eoi)) != 0;
 }
 
-void end_nonmaskable_irq(struct irq_desc *desc, uint8_t vector)
+void cf_check end_nonmaskable_irq(struct irq_desc *desc, uint8_t vector)
 {
     struct pending_eoi *peoi = this_cpu(pending_eoi);
     unsigned int sp = pending_eoi_sp(peoi);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 77a4fbf13f9f..b32b1378f84e 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -241,7 +241,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
     return 0;
 }
 
-void set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask)
+void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     struct msi_msg msg;
     unsigned int dest;
@@ -416,14 +416,14 @@ static int msi_get_mask_bit(const struct msi_desc *entry)
     return -1;
 }
 
-void mask_msi_irq(struct irq_desc *desc)
+void cf_check mask_msi_irq(struct irq_desc *desc)
 {
     if ( unlikely(!msi_set_mask_bit(desc, 1,
                                     desc->msi_desc->msi_attrib.guest_masked)) )
         BUG_ON(!(desc->status & IRQ_DISABLED));
 }
 
-void unmask_msi_irq(struct irq_desc *desc)
+void cf_check unmask_msi_irq(struct irq_desc *desc)
 {
     if ( unlikely(!msi_set_mask_bit(desc, 0,
                                     desc->msi_desc->msi_attrib.guest_masked)) )
@@ -435,26 +435,26 @@ void guest_mask_msi_irq(struct irq_desc *desc, bool mask)
     msi_set_mask_bit(desc, desc->msi_desc->msi_attrib.host_masked, mask);
 }
 
-static unsigned int startup_msi_irq(struct irq_desc *desc)
+static unsigned int cf_check startup_msi_irq(struct irq_desc *desc)
 {
     if ( unlikely(!msi_set_mask_bit(desc, 0, !!(desc->status & IRQ_GUEST))) )
         WARN();
     return 0;
 }
 
-static void shutdown_msi_irq(struct irq_desc *desc)
+static void cf_check shutdown_msi_irq(struct irq_desc *desc)
 {
     if ( unlikely(!msi_set_mask_bit(desc, 1, 1)) )
         BUG_ON(!(desc->status & IRQ_DISABLED));
 }
 
-void ack_nonmaskable_msi_irq(struct irq_desc *desc)
+void cf_check ack_nonmaskable_msi_irq(struct irq_desc *desc)
 {
     irq_complete_move(desc);
     move_native_irq(desc);
 }
 
-static void ack_maskable_msi_irq(struct irq_desc *desc)
+static void cf_check ack_maskable_msi_irq(struct irq_desc *desc)
 {
     ack_nonmaskable_msi_irq(desc);
     ack_APIC_irq(); /* ACKTYPE_NONE */
diff --git a/xen/common/irq.c b/xen/common/irq.c
index f42512db33b7..727cf8bd22da 100644
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -27,15 +27,15 @@ int init_one_irq_desc(struct irq_desc *desc)
     return err;
 }
 
-void no_action(int cpl, void *dev_id, struct cpu_user_regs *regs)
+void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs)
 {
 }
 
-void irq_actor_none(struct irq_desc *desc)
+void cf_check irq_actor_none(struct irq_desc *desc)
 {
 }
 
-unsigned int irq_startup_none(struct irq_desc *desc)
+unsigned int cf_check irq_startup_none(struct irq_desc *desc)
 {
     return 0;
 }
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index d2ad282e93d3..657c7f619a51 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -410,7 +410,7 @@ static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
                      PCI_FUNC(iommu->bdf), iommu->msi.msi_attrib.pos, flag);
 }
 
-static void iommu_msi_unmask(struct irq_desc *desc)
+static void cf_check iommu_msi_unmask(struct irq_desc *desc)
 {
     unsigned long flags;
     struct amd_iommu *iommu = desc->action->dev_id;
@@ -421,7 +421,7 @@ static void iommu_msi_unmask(struct irq_desc *desc)
     iommu->msi.msi_attrib.host_masked = 0;
 }
 
-static void iommu_msi_mask(struct irq_desc *desc)
+static void cf_check iommu_msi_mask(struct irq_desc *desc)
 {
     unsigned long flags;
     struct amd_iommu *iommu = desc->action->dev_id;
@@ -434,13 +434,13 @@ static void iommu_msi_mask(struct irq_desc *desc)
     iommu->msi.msi_attrib.host_masked = 1;
 }
 
-static unsigned int iommu_msi_startup(struct irq_desc *desc)
+static unsigned int cf_check iommu_msi_startup(struct irq_desc *desc)
 {
     iommu_msi_unmask(desc);
     return 0;
 }
 
-static void iommu_msi_end(struct irq_desc *desc, u8 vector)
+static void cf_check iommu_msi_end(struct irq_desc *desc, u8 vector)
 {
     iommu_msi_unmask(desc);
     end_nonmaskable_irq(desc, vector);
@@ -458,14 +458,14 @@ static hw_irq_controller iommu_msi_type = {
     .set_affinity = set_msi_affinity,
 };
 
-static unsigned int iommu_maskable_msi_startup(struct irq_desc *desc)
+static unsigned int cf_check iommu_maskable_msi_startup(struct irq_desc *desc)
 {
     iommu_msi_unmask(desc);
     unmask_msi_irq(desc);
     return 0;
 }
 
-static void iommu_maskable_msi_shutdown(struct irq_desc *desc)
+static void cf_check iommu_maskable_msi_shutdown(struct irq_desc *desc)
 {
     mask_msi_irq(desc);
     iommu_msi_mask(desc);
@@ -489,7 +489,8 @@ static hw_irq_controller iommu_maskable_msi_type = {
     .set_affinity = set_msi_affinity,
 };
 
-static void set_x2apic_affinity(struct irq_desc *desc, const cpumask_t *mask)
+static void cf_check set_x2apic_affinity(
+    struct irq_desc *desc, const cpumask_t *mask)
 {
     struct amd_iommu *iommu = desc->action->dev_id;
     unsigned int dest = set_desc_affinity(desc, mask);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index fc3ff064b692..c05670eb68a8 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1128,7 +1128,7 @@ static void cf_check iommu_page_fault(
     tasklet_schedule(&vtd_fault_tasklet);
 }
 
-static void dma_msi_unmask(struct irq_desc *desc)
+static void cf_check dma_msi_unmask(struct irq_desc *desc)
 {
     struct vtd_iommu *iommu = desc->action->dev_id;
     unsigned long flags;
@@ -1143,7 +1143,7 @@ static void dma_msi_unmask(struct irq_desc *desc)
     iommu->msi.msi_attrib.host_masked = 0;
 }
 
-static void dma_msi_mask(struct irq_desc *desc)
+static void cf_check dma_msi_mask(struct irq_desc *desc)
 {
     unsigned long flags;
     struct vtd_iommu *iommu = desc->action->dev_id;
@@ -1158,26 +1158,27 @@ static void dma_msi_mask(struct irq_desc *desc)
     iommu->msi.msi_attrib.host_masked = 1;
 }
 
-static unsigned int dma_msi_startup(struct irq_desc *desc)
+static unsigned int cf_check dma_msi_startup(struct irq_desc *desc)
 {
     dma_msi_unmask(desc);
     return 0;
 }
 
-static void dma_msi_ack(struct irq_desc *desc)
+static void cf_check dma_msi_ack(struct irq_desc *desc)
 {
     irq_complete_move(desc);
     dma_msi_mask(desc);
     move_masked_irq(desc);
 }
 
-static void dma_msi_end(struct irq_desc *desc, u8 vector)
+static void cf_check dma_msi_end(struct irq_desc *desc, u8 vector)
 {
     dma_msi_unmask(desc);
     end_nonmaskable_irq(desc, vector);
 }
 
-static void dma_msi_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
+static void cf_check dma_msi_set_affinity(
+    struct irq_desc *desc, const cpumask_t *mask)
 {
     struct msi_msg msg;
     unsigned int dest;
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 43d567fe445c..d8beadd16b9f 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -116,9 +116,9 @@ extern int request_irq(unsigned int irq, unsigned int irqflags,
                const char * devname, void *dev_id);
 
 extern hw_irq_controller no_irq_type;
-extern void no_action(int cpl, void *dev_id, struct cpu_user_regs *regs);
-extern unsigned int irq_startup_none(struct irq_desc *);
-extern void irq_actor_none(struct irq_desc *);
+void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs);
+unsigned int cf_check irq_startup_none(struct irq_desc *);
+void cf_check irq_actor_none(struct irq_desc *);
 #define irq_shutdown_none irq_actor_none
 #define irq_disable_none irq_actor_none
 #define irq_enable_none irq_actor_none
-- 
2.11.0



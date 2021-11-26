Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE445EEB4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232844.403997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax5-0004wx-Gd; Fri, 26 Nov 2021 13:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232844.403997; Fri, 26 Nov 2021 13:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax4-0004dh-Nb; Fri, 26 Nov 2021 13:07:42 +0000
Received: by outflank-mailman (input) for mailman id 232844;
 Fri, 26 Nov 2021 13:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaux-0003W9-D8
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855b1c0e-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:25 +0100 (CET)
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
X-Inumbo-ID: 855b1c0e-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jO+OyPCKEQLuTMUlOqQ6gopRTA925Ji5NSM1T3yoqwY=;
  b=ObdLe2wZu8uOuaL9AAgDTWTORNdcX+ZGdv949mlOt95n0tMDLj+x7JFM
   KnDrtTVRJAtf1lCtBZGQKHRCK3l9KmgjfDsbZZvR+Nbw7nPJQTvGhMQMP
   +Jy4x9n21YmJjCS7ZPtE8wTZp/3PXa75KU8vIFHsl0nNHPLXRmoXe7mhU
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iQ0EbjAT+kP/KRVWw/Ea31SAZ+x2zqcw+aSEQQhT8Q7/XUrjt4J8bPnasK+F7yoYWUyIYQeFjR
 zvOtFSKIcw0IakMq8ANW1DFVR84rUzL6lUmFyNhlIMXIrEBGeRwnhZTGqWbuBpvKs7EcRUM/VB
 9i5CqaZTe8eqm75J4/SHzWtq79/kCyokW2iA3WhjAfYa/VMf2bcm5oEelNCnegyEjuU84ZXBUv
 zQ1GE/zGRPphkK4Evq3kdhvrOKJnBT4W4eI9+yj187vwPL57powQGB+drDwQFEFRuWJjKzN/Xd
 vEAG+w0gDZC79L8OWe+EvRpw
X-SBRS: 5.1
X-MesageID: 59064014
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:f6wbma6QaHTHuQrtNoFmKQxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mMbXWDUPfnYYzGhco0iOYjlp0NVvZ/czdNjQAtk/C5kHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 ed/jsa9cgcTFfPRieIaehVfVDB6MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTK6AO
 5JANVKDajzDcyVAfVQWL6kylbapi1DgUCR+oW+K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9NiIdZg5TqN8IGK/hefAUEISXlQbNNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:hURw5q3dQJfRWkRGY2tgigqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064014"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 47/65] x86/irq: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:28 +0000
Message-ID: <20211126123446.32324-48-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hpet.c                      | 11 ++++++-----
 xen/arch/x86/i8259.c                     | 10 +++++-----
 xen/arch/x86/io_apic.c                   | 24 ++++++++++++------------
 xen/arch/x86/irq.c                       |  6 +++---
 xen/arch/x86/msi.c                       | 14 +++++++-------
 xen/common/irq.c                         |  6 +++---
 xen/drivers/passthrough/amd/iommu_init.c | 15 ++++++++-------
 xen/drivers/passthrough/vtd/iommu.c      | 13 +++++++------
 xen/include/asm-x86/irq.h                |  8 ++++----
 xen/include/asm-x86/msi.h                |  8 ++++----
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
index ad3abdcdacfd..708ba2b31565 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1096,7 +1096,7 @@ static void cf_check iommu_page_fault(
     tasklet_schedule(&vtd_fault_tasklet);
 }
 
-static void dma_msi_unmask(struct irq_desc *desc)
+static void cf_check dma_msi_unmask(struct irq_desc *desc)
 {
     struct vtd_iommu *iommu = desc->action->dev_id;
     unsigned long flags;
@@ -1111,7 +1111,7 @@ static void dma_msi_unmask(struct irq_desc *desc)
     iommu->msi.msi_attrib.host_masked = 0;
 }
 
-static void dma_msi_mask(struct irq_desc *desc)
+static void cf_check dma_msi_mask(struct irq_desc *desc)
 {
     unsigned long flags;
     struct vtd_iommu *iommu = desc->action->dev_id;
@@ -1126,26 +1126,27 @@ static void dma_msi_mask(struct irq_desc *desc)
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
diff --git a/xen/include/asm-x86/irq.h b/xen/include/asm-x86/irq.h
index b3f49abc5556..76e6ed6d60aa 100644
--- a/xen/include/asm-x86/irq.h
+++ b/xen/include/asm-x86/irq.h
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
diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
index e228b0f3f344..117379318f2c 100644
--- a/xen/include/asm-x86/msi.h
+++ b/xen/include/asm-x86/msi.h
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



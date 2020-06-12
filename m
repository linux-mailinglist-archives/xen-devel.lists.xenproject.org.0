Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBC1F7B30
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3d-0006QK-3e; Fri, 12 Jun 2020 15:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3b-0006Lr-7v
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:27 +0000
X-Inumbo-ID: 68f94766-acc5-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68f94766-acc5-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 15:57:26 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e9FMHbQmSlccb0Jggp39FUntV+V/2kY/Ao2hQtNDe/d3ibdKdm+2PCrv+MVa30FpSoq8nCZeyF
 utxdsI6K51kThM8vjkvV9DuV4cRHN2qFugt9dKv+i0FpLJYEfZ7zCp4wlF1dtLzC1zo0MtASSa
 RWHL67SkdL4x4mgB/KYbiuNcmyKc1MRIdiIBk4W29SjBYsyLQS/Ci4IGO58uHHHB+9fzAgnTee
 vbj5DA3vBx8KjhQ109vzwa1cptO6srROKY5cduAcAJGlkmRWtq1nwsJvU56XKVLWtQ4SgfT0GX
 2Yc=
X-SBRS: 2.7
X-MesageID: 20688217
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20688217"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 7/8] x86/hvm: add hardware domain support to
 hvm_isa_irq_to_gsi
Date: Fri, 12 Jun 2020 17:56:39 +0200
Message-ID: <20200612155640.4101-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612155640.4101-1-roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The current function has the ISA IRQ 0 hardcoded to GSI 2 for HVM
domUs. Allow such function to also be used by the hardware domain by
taking into account the ACPI interrupt overwrites in order to get the
correct ISA to GSI mappings.

This requires passing a domain parameter to the helper, since it's not
guaranteed to always be called with current being the destination
vCPU.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/irq.c        | 20 +++++++++++++++++---
 xen/arch/x86/hvm/vioapic.c    |  2 +-
 xen/arch/x86/hvm/vpic.c       |  7 +++++--
 xen/arch/x86/hvm/vpt.c        |  5 +++--
 xen/arch/x86/io_apic.c        | 16 ++++++++--------
 xen/include/asm-x86/hvm/irq.h |  2 +-
 xen/include/asm-x86/io_apic.h |  3 +++
 7 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index fd02cf2e8d..6cbea63f4c 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -23,6 +23,7 @@
 #include <xen/sched.h>
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
+#include <asm/io_apic.h>
 #include <asm/hvm/domain.h>
 #include <asm/hvm/support.h>
 #include <asm/msi.h>
@@ -212,12 +213,25 @@ void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
     spin_unlock(&d->arch.hvm.irq_lock);
 }
 
+unsigned int hvm_isa_irq_to_gsi(const struct domain *d, unsigned int irq)
+{
+    int pin, apic;
+
+    if ( !is_hardware_domain(d) )
+        return irq ?: 2;
+
+    pin  = io_apic_find_isa_irq_pin(irq, mp_INT);
+    apic = io_apic_find_isa_irq_apic(irq, mp_INT);
+
+    return (pin < 0 || apic < 0) ? irq : (io_apic_gsi_base(apic) + pin);
+}
+
 int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
                        int (*get_vector)(const struct domain *d,
                                          unsigned int gsi))
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
+    unsigned int gsi = hvm_isa_irq_to_gsi(d, isa_irq);
     int vector = -1;
 
     ASSERT(isa_irq <= 15);
@@ -240,7 +254,7 @@ void hvm_isa_irq_deassert(
     struct domain *d, unsigned int isa_irq)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
+    unsigned int gsi = hvm_isa_irq_to_gsi(d, isa_irq);
 
     ASSERT(isa_irq <= 15);
 
@@ -754,7 +768,7 @@ static int irq_load_isa(struct domain *d, hvm_domain_context_t *h)
      * This relies on the PCI IRQ state being loaded first. */
     for ( irq = 0; platform_legacy_irq(irq); irq++ )
         if ( test_bit(irq, &hvm_irq->isa_irq.i) )
-            hvm_irq->gsi_assert_count[hvm_isa_irq_to_gsi(irq)]++;
+            hvm_irq->gsi_assert_count[hvm_isa_irq_to_gsi(d, irq)]++;
 
     return 0;
 }
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index e1417cc6a7..34bec715b7 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -425,7 +425,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
         struct vlapic *lapic0 = vcpu_vlapic(d->vcpu[0]);
 
         /* Force to pick vCPU 0 if part of the destination list */
-        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() &&
+        if ( (irq == hvm_isa_irq_to_gsi(d, 0)) && pit_channel0_enabled() &&
              vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
              vlapic_enabled(lapic0) )
             target = lapic0;
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 61f4b6784c..0ce3371a80 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -230,6 +230,8 @@ static void vpic_ioport_write(
         }
         else
         {
+            struct domain *currd = current->domain;
+
             /* OCW2 */
             cmd = val >> 5;
             switch ( cmd )
@@ -260,8 +262,9 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (irq|8) : irq),
+                hvm_dpci_eoi(currd,
+                             hvm_isa_irq_to_gsi(currd, (addr >> 7) ? (irq | 8)
+                                                                   : irq),
                              NULL);
                 return; /* bail immediately */
             case 6: /* Set Priority                */
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 52ad5b90a7..1b3f902106 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -86,7 +86,8 @@ static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
         return pt->irq;
 
     isa_irq = pt->irq;
-    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
+    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(v->domain, isa_irq)
+                                  : pt->irq;
 
     if ( src == hvm_intsrc_pic )
         return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
@@ -128,7 +129,7 @@ static int pt_irq_masked(struct periodic_time *pt)
         if ( !(pic_imr & (1 << (pt->irq & 7))) && vlapic_accept_pic_intr(v) )
             return 0;
 
-        gsi = hvm_isa_irq_to_gsi(pt->irq);
+        gsi = hvm_isa_irq_to_gsi(v->domain, pt->irq);
     }
 
     /* Fallthrough to check if the interrupt is masked on the IO APIC. */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 878ee5192d..1c000e8f76 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -608,7 +608,7 @@ static int find_irq_entry(int apic, int pin, int type)
 /*
  * Find the pin to which IRQ[irq] (ISA) is connected
  */
-static int __init find_isa_irq_pin(int irq, int type)
+int io_apic_find_isa_irq_pin(int irq, int type)
 {
     int i;
 
@@ -628,7 +628,7 @@ static int __init find_isa_irq_pin(int irq, int type)
     return -1;
 }
 
-static int __init find_isa_irq_apic(int irq, int type)
+int io_apic_find_isa_irq_apic(int irq, int type)
 {
     int i;
 
@@ -1306,8 +1306,8 @@ static void __init enable_IO_APIC(void)
      * the i8259 probably is not connected the ioapic but give the
      * mptable a chance anyway.
      */
-    i8259_pin  = find_isa_irq_pin(0, mp_ExtINT);
-    i8259_apic = find_isa_irq_apic(0, mp_ExtINT);
+    i8259_pin  = io_apic_find_isa_irq_pin(0, mp_ExtINT);
+    i8259_apic = io_apic_find_isa_irq_apic(0, mp_ExtINT);
     /* Trust the MP table if nothing is setup in the hardware */
     if ((ioapic_i8259.pin == -1) && (i8259_pin >= 0)) {
         printk(KERN_WARNING "ExtINT not setup in hardware but reported by MP table\n");
@@ -1834,8 +1834,8 @@ static void __init unlock_ExtINT_logic(void)
     struct IO_APIC_route_entry entry0, entry1;
     unsigned char save_control, save_freq_select;
 
-    pin = find_isa_irq_pin(8, mp_INT);
-    apic = find_isa_irq_apic(8, mp_INT);
+    pin = io_apic_find_isa_irq_pin(8, mp_INT);
+    apic = io_apic_find_isa_irq_apic(8, mp_INT);
     if ( pin == -1 || apic == -1 )
         return;
 
@@ -1913,8 +1913,8 @@ static void __init check_timer(void)
     /*timer_ack = 1;*/
     /*enable_8259A_irq(irq_to_desc(0));*/
 
-    pin1  = find_isa_irq_pin(0, mp_INT);
-    apic1 = find_isa_irq_apic(0, mp_INT);
+    pin1  = io_apic_find_isa_irq_pin(0, mp_INT);
+    apic1 = io_apic_find_isa_irq_apic(0, mp_INT);
     pin2  = ioapic_i8259.pin;
     apic2 = ioapic_i8259.apic;
 
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 532880d497..aa034bc73c 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -100,7 +100,7 @@ struct hvm_irq {
 #define hvm_domain_irq(d) ((d)->arch.hvm.irq)
 #define hvm_irq_size(cnt) offsetof(struct hvm_irq, gsi_assert_count[cnt])
 
-#define hvm_isa_irq_to_gsi(isa_irq) ((isa_irq) ? : 2)
+unsigned int hvm_isa_irq_to_gsi(const struct domain *d, unsigned int irq);
 
 /* Check/Acknowledge next pending interrupt. */
 struct hvm_intack hvm_vcpu_has_pending_irq(struct vcpu *v);
diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/asm-x86/io_apic.h
index e006b2b8dd..1c63d1df56 100644
--- a/xen/include/asm-x86/io_apic.h
+++ b/xen/include/asm-x86/io_apic.h
@@ -205,4 +205,7 @@ unsigned highest_gsi(void);
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 pval);
 
+int io_apic_find_isa_irq_pin(int irq, int type);
+int io_apic_find_isa_irq_apic(int irq, int type);
+
 #endif
-- 
2.26.2



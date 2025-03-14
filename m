Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDBA60703
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 02:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913680.1319611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tstjN-0006cH-6D; Fri, 14 Mar 2025 01:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913680.1319611; Fri, 14 Mar 2025 01:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tstjN-0006as-1K; Fri, 14 Mar 2025 01:20:57 +0000
Received: by outflank-mailman (input) for mailman id 913680;
 Fri, 14 Mar 2025 01:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X8m4=WB=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tstjK-0006ah-Rq
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 01:20:56 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b4c62c7-0072-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 02:20:41 +0100 (CET)
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
X-Inumbo-ID: 8b4c62c7-0072-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741915240; x=1742174440;
	bh=d/FeSQcbrR3V+F32qIcaQA6q7A6YDnF+ZPVJg1zOWfc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Sx8vmCrvKLt520g07xg8eGB2Uu42iRURM1DLO3q+jd3gzOk75eVba/tEuVZFR/Ti+
	 iTviC/XGHWed8Npz2S4kayogkdi/D1cCxPXL3kOI2yO80NV2abHmFD71a+s2Ix/c94
	 6lmNbjYcG9u/SSRWhHtt1DtRPrCVc2nIiM/pxXfnZ6tpznIZDAbeSjG9GRcI5i0+2L
	 xt72wMZrm8y5A9qC5y0/rQxgMsS+lAVCeVfjWmENipFWPzeRnY7nt/XawRf5T7QeZr
	 rm4piaftjibyAvblcROQKFrFc0oCFSq0Ros/KZCNOstrcf9UxxVL0yigngFLpiXU2Q
	 fT1i9CvstQ0RQ==
Date: Fri, 14 Mar 2025 01:20:35 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
Message-ID: <20250314011528.2608217-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 163c1ec1db06e885859b1bb0ce361c103b1b997d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
readability.

No functional changes.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/dm.c          |  2 +-
 xen/arch/x86/hvm/irq.c         | 17 +++++++++--------
 xen/arch/x86/hvm/vlapic.c      | 10 +++++-----
 xen/arch/x86/hvm/vpic.c        |  4 ++--
 xen/arch/x86/include/asm/irq.h |  2 +-
 xen/arch/x86/io_apic.c         | 12 ++++++------
 xen/arch/x86/irq.c             |  6 +++---
 7 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index a1f7a4d30a..36d47664e9 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -90,7 +90,7 @@ static int set_pci_intx_level(struct domain *d, uint16_t =
domain,
 static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
                              uint8_t level)
 {
-    if ( isa_irq > 15 )
+    if ( isa_irq >=3D NR_ISAIRQS )
         return -EINVAL;
=20
     switch ( level )
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 1eab44defc..1f7d8ca43e 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -209,7 +209,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int i=
sa_irq,
     unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
     int vector =3D -1;
=20
-    ASSERT(isa_irq <=3D 15);
+    ASSERT(isa_irq < NR_ISAIRQS);
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
@@ -231,7 +231,7 @@ void hvm_isa_irq_deassert(
     struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
     unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
=20
-    ASSERT(isa_irq <=3D 15);
+    ASSERT(isa_irq < NR_ISAIRQS);
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
@@ -266,12 +266,12 @@ static void hvm_set_callback_irq_level(struct vcpu *v=
)
         if ( asserted && (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
         {
             vioapic_irq_positive_edge(d, gsi);
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISAIRQS )
                 vpic_irq_positive_edge(d, gsi);
         }
         else if ( !asserted && (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0)=
 )
         {
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISAIRQS )
                 vpic_irq_negative_edge(d, gsi);
         }
         break;
@@ -328,7 +328,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u=
8 isa_irq)
     u8 old_isa_irq;
     int i;
=20
-    if ( (link > 3) || (isa_irq > 15) )
+    if ( (link > 3) || (isa_irq >=3D NR_ISAIRQS) )
         return -EINVAL;
=20
     spin_lock(&d->arch.hvm.irq_lock);
@@ -440,7 +440,8 @@ void hvm_set_callback_via(struct domain *d, uint64_t vi=
a)
         {
         case HVMIRQ_callback_gsi:
             gsi =3D hvm_irq->callback_via.gsi;
-            if ( (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) && (gsi <=3D =
15) )
+            if ( (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) &&
+                 (gsi < NR_ISAIRQS) )
                 vpic_irq_negative_edge(d, gsi);
             break;
         case HVMIRQ_callback_pci_intx:
@@ -464,7 +465,7 @@ void hvm_set_callback_via(struct domain *d, uint64_t vi=
a)
                   (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
         {
             vioapic_irq_positive_edge(d, gsi);
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISAIRQS )
                 vpic_irq_positive_edge(d, gsi);
         }
         break;
@@ -764,7 +765,7 @@ static int cf_check irq_check_link(const struct domain =
*d,
             return -EINVAL;
=20
     for ( link =3D 0; link < ARRAY_SIZE(pci_link->route); link++ )
-        if ( pci_link->route[link] > 15 )
+        if ( pci_link->route[link] >=3D NR_ISAIRQS )
         {
             printk(XENLOG_G_ERR
                    "HVM restore: PCI-ISA link %u out of range (%u)\n",
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 065b2aab5b..7511d6c434 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
              * will end up back here.  Break the cycle by only injecting L=
VTERR
              * if it will succeed, and folding in RECVILL otherwise.
              */
-            if ( (lvterr & APIC_VECTOR_MASK) >=3D 16 )
+            if ( (lvterr & APIC_VECTOR_MASK) >=3D NR_ISAIRQS )
                 inj =3D true;
             else
                 set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
@@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigne=
d int err_bit)
=20
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
 {
-    if ( unlikely(vec < 16) )
+    if ( unlikely(vec < NR_ISAIRQS) )
         return false;
=20
     if ( hvm_funcs.test_pir &&
@@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,=
 uint8_t trig)
 {
     struct vcpu *target =3D vlapic_vcpu(vlapic);
=20
-    if ( unlikely(vec < 16) )
+    if ( unlikely(vec < NR_ISAIRQS) )
     {
         vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
         return;
@@ -523,7 +523,7 @@ void vlapic_ipi(
         struct vlapic *target =3D vlapic_lowest_prio(
             vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
=20
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
         else if ( target )
             vlapic_accept_irq(vlapic_vcpu(target), icr_low);
@@ -531,7 +531,7 @@ void vlapic_ipi(
     }
=20
     case APIC_DM_FIXED:
-        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
+        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
         {
             vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
             break;
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 6427b08086..c4ff96a2ad 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -523,7 +523,7 @@ void vpic_irq_positive_edge(struct domain *d, int irq)
     uint8_t mask =3D 1 << (irq & 7);
=20
     ASSERT(has_vpic(d));
-    ASSERT(irq <=3D 15);
+    ASSERT(irq < NR_ISAIRQS);
     ASSERT(vpic_is_locked(vpic));
=20
     TRACE_TIME(TRC_HVM_EMUL_PIC_POSEDGE, irq);
@@ -541,7 +541,7 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
     uint8_t mask =3D 1 << (irq & 7);
=20
     ASSERT(has_vpic(d));
-    ASSERT(irq <=3D 15);
+    ASSERT(irq < NR_ISAIRQS);
     ASSERT(vpic_is_locked(vpic));
=20
     TRACE_TIME(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.=
h
index f9ed5dc86c..c7a557133b 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -108,7 +108,7 @@ extern bool opt_noirqbalance;
=20
 extern int opt_irq_vector_map;
=20
-#define platform_legacy_irq(irq)=09((irq) < 16)
+#define platform_legacy_irq(irq)=09((irq) < NR_ISAIRQS)
=20
 void cf_check event_check_interrupt(void);
 void cf_check invalidate_interrupt(void);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c6cf944811..e224fae80f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2715,15 +2715,15 @@ void __init ioapic_init(void)
                               " than \"nr_irqs=3D\"\n");
         max_gsi_irqs =3D nr_irqs;
     }
-    if ( max_gsi_irqs < 16 )
-        max_gsi_irqs =3D 16;
+    if ( max_gsi_irqs < NR_ISAIRQS )
+        max_gsi_irqs =3D NR_ISAIRQS;
=20
     /* for PHYSDEVOP_pirq_eoi_gmfn guest assumptions */
     if ( max_gsi_irqs > PAGE_SIZE * 8 )
         max_gsi_irqs =3D PAGE_SIZE * 8;
=20
-    if ( !smp_found_config || skip_ioapic_setup || nr_irqs_gsi < 16 )
-        nr_irqs_gsi =3D 16;
+    if ( !smp_found_config || skip_ioapic_setup || nr_irqs_gsi < NR_ISAIRQ=
S )
+        nr_irqs_gsi =3D NR_ISAIRQS;
     else if ( nr_irqs_gsi > max_gsi_irqs )
     {
         printk(XENLOG_WARNING "Limiting to %u GSI IRQs (found %u)\n",
@@ -2736,8 +2736,8 @@ void __init ioapic_init(void)
                   max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
                       8 * nr_irqs_gsi) :
                   nr_irqs_gsi;
-    else if ( nr_irqs < 16 )
-        nr_irqs =3D 16;
+    else if ( nr_irqs < NR_ISAIRQS )
+        nr_irqs =3D NR_ISAIRQS;
     printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
            nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f35894577b..8c64cf1605 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -36,7 +36,7 @@
 bool __read_mostly opt_noirqbalance;
 boolean_param("noirqbalance", opt_noirqbalance);
=20
-unsigned int __read_mostly nr_irqs_gsi =3D 16;
+unsigned int __read_mostly nr_irqs_gsi =3D NR_ISAIRQS;
 unsigned int __read_mostly nr_irqs;
 integer_param("nr_irqs", nr_irqs);
=20
@@ -1525,7 +1525,7 @@ void desc_guest_eoi(struct irq_desc *desc, struct pir=
q *pirq)
 int pirq_guest_unmask(struct domain *d)
 {
     unsigned int pirq =3D 0, n, i;
-    struct pirq *pirqs[16];
+    struct pirq *pirqs[NR_ISAIRQS];
=20
     do {
         n =3D radix_tree_gang_lookup(&d->pirq_tree, (void **)pirqs, pirq,
@@ -2113,7 +2113,7 @@ int get_free_pirq(struct domain *d, int type)
=20
     if ( type =3D=3D MAP_PIRQ_TYPE_GSI )
     {
-        for ( i =3D 16; i < nr_irqs_gsi; i++ )
+        for ( i =3D NR_ISAIRQS; i < nr_irqs_gsi; i++ )
             if ( is_free_pirq(d, pirq_info(d, i)) )
             {
                 pirq_get_info(d, i);
--=20
2.34.1




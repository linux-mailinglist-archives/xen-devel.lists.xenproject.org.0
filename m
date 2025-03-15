Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E7A62391
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915596.1321091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtb-0005da-T8; Sat, 15 Mar 2025 01:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915596.1321091; Sat, 15 Mar 2025 01:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtb-0005aE-QC; Sat, 15 Mar 2025 01:00:59 +0000
Received: by outflank-mailman (input) for mailman id 915596;
 Sat, 15 Mar 2025 01:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFtZ-0003LX-N2
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:00:57 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3d209f9-0138-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 02:00:57 +0100 (CET)
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
X-Inumbo-ID: f3d209f9-0138-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000455; x=1742259655;
	bh=VgICWf/0L3aRWRS3ZzhM6wzowwRkjjVOrPqBoDmn4Io=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gnxBfY7RfTJ0OKgqkgwIi+Z1uGq7Jp6yx8i49P2BfEEYTS6DtLiXImXmc5JmDnxL2
	 aqz3aE0nakD7aRwQ4Ie8KHfSL7MhMNU9haI8c8kbp62l+Ivn8kd/E5+JI7r2jLQiZd
	 tMolneYDqYqVx6MYF/M7ccdjg+2zvgzHA++ofOUZy/fG0HiXws1apWB+P6SzIxXIUn
	 72cLZCniNdNEqwRtpI3vcAUw77VyD2TZZF4YdGeZTscHZmfZ/BOzfsQPDxjtCFubKn
	 r+t9KH3jS+x12g97IWo5JdEKn9vU+Qnyg6hTczRfHvHFmATqmrEACFfzbDvXTB4rlo
	 SY+9Z4OMSV1bQ==
Date: Sat, 15 Mar 2025 01:00:51 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH 2/3] x86/irq: use NR_ISA_IRQS instead of open-coded value
Message-ID: <20250315010033.2917197-3-dmukhin@ford.com>
In-Reply-To: <20250315010033.2917197-1-dmukhin@ford.com>
References: <20250315010033.2917197-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f3148e4b784f25b54c3d5b94135fb3f479f74331
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace the open-coded value 16 with the NR_ISA_IRQS symbol to enhance
readability.

No functional changes.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/dm.c          |  2 +-
 xen/arch/x86/hvm/irq.c         | 17 +++++++++--------
 xen/arch/x86/hvm/vpic.c        |  4 ++--
 xen/arch/x86/include/asm/irq.h |  2 +-
 xen/arch/x86/io_apic.c         | 12 ++++++------
 xen/arch/x86/irq.c             |  6 +++---
 6 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index a1f7a4d30a..3b53471af0 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -90,7 +90,7 @@ static int set_pci_intx_level(struct domain *d, uint16_t =
domain,
 static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
                              uint8_t level)
 {
-    if ( isa_irq > 15 )
+    if ( isa_irq >=3D NR_ISA_IRQS )
         return -EINVAL;
=20
     switch ( level )
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 1eab44defc..5f64361113 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -209,7 +209,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int i=
sa_irq,
     unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
     int vector =3D -1;
=20
-    ASSERT(isa_irq <=3D 15);
+    ASSERT(isa_irq < NR_ISA_IRQS);
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
@@ -231,7 +231,7 @@ void hvm_isa_irq_deassert(
     struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
     unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
=20
-    ASSERT(isa_irq <=3D 15);
+    ASSERT(isa_irq < NR_ISA_IRQS);
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
@@ -266,12 +266,12 @@ static void hvm_set_callback_irq_level(struct vcpu *v=
)
         if ( asserted && (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
         {
             vioapic_irq_positive_edge(d, gsi);
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISA_IRQS )
                 vpic_irq_positive_edge(d, gsi);
         }
         else if ( !asserted && (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0)=
 )
         {
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISA_IRQS )
                 vpic_irq_negative_edge(d, gsi);
         }
         break;
@@ -328,7 +328,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u=
8 isa_irq)
     u8 old_isa_irq;
     int i;
=20
-    if ( (link > 3) || (isa_irq > 15) )
+    if ( (link > 3) || (isa_irq >=3D NR_ISA_IRQS) )
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
+                 (gsi < NR_ISA_IRQS) )
                 vpic_irq_negative_edge(d, gsi);
             break;
         case HVMIRQ_callback_pci_intx:
@@ -464,7 +465,7 @@ void hvm_set_callback_via(struct domain *d, uint64_t vi=
a)
                   (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
         {
             vioapic_irq_positive_edge(d, gsi);
-            if ( gsi <=3D 15 )
+            if ( gsi < NR_ISA_IRQS )
                 vpic_irq_positive_edge(d, gsi);
         }
         break;
@@ -764,7 +765,7 @@ static int cf_check irq_check_link(const struct domain =
*d,
             return -EINVAL;
=20
     for ( link =3D 0; link < ARRAY_SIZE(pci_link->route); link++ )
-        if ( pci_link->route[link] > 15 )
+        if ( pci_link->route[link] >=3D NR_ISA_IRQS )
         {
             printk(XENLOG_G_ERR
                    "HVM restore: PCI-ISA link %u out of range (%u)\n",
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 6427b08086..22020322fb 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -523,7 +523,7 @@ void vpic_irq_positive_edge(struct domain *d, int irq)
     uint8_t mask =3D 1 << (irq & 7);
=20
     ASSERT(has_vpic(d));
-    ASSERT(irq <=3D 15);
+    ASSERT(irq < NR_ISA_IRQS);
     ASSERT(vpic_is_locked(vpic));
=20
     TRACE_TIME(TRC_HVM_EMUL_PIC_POSEDGE, irq);
@@ -541,7 +541,7 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
     uint8_t mask =3D 1 << (irq & 7);
=20
     ASSERT(has_vpic(d));
-    ASSERT(irq <=3D 15);
+    ASSERT(irq < NR_ISA_IRQS);
     ASSERT(vpic_is_locked(vpic));
=20
     TRACE_TIME(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.=
h
index f9ed5dc86c..3c73073b71 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -108,7 +108,7 @@ extern bool opt_noirqbalance;
=20
 extern int opt_irq_vector_map;
=20
-#define platform_legacy_irq(irq)=09((irq) < 16)
+#define platform_legacy_irq(irq)=09((irq) < NR_ISA_IRQS)
=20
 void cf_check event_check_interrupt(void);
 void cf_check invalidate_interrupt(void);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c6cf944811..84bd87a5e4 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2715,15 +2715,15 @@ void __init ioapic_init(void)
                               " than \"nr_irqs=3D\"\n");
         max_gsi_irqs =3D nr_irqs;
     }
-    if ( max_gsi_irqs < 16 )
-        max_gsi_irqs =3D 16;
+    if ( max_gsi_irqs < NR_ISA_IRQS )
+        max_gsi_irqs =3D NR_ISA_IRQS;
=20
     /* for PHYSDEVOP_pirq_eoi_gmfn guest assumptions */
     if ( max_gsi_irqs > PAGE_SIZE * 8 )
         max_gsi_irqs =3D PAGE_SIZE * 8;
=20
-    if ( !smp_found_config || skip_ioapic_setup || nr_irqs_gsi < 16 )
-        nr_irqs_gsi =3D 16;
+    if ( !smp_found_config || skip_ioapic_setup || nr_irqs_gsi < NR_ISA_IR=
QS )
+        nr_irqs_gsi =3D NR_ISA_IRQS;
     else if ( nr_irqs_gsi > max_gsi_irqs )
     {
         printk(XENLOG_WARNING "Limiting to %u GSI IRQs (found %u)\n",
@@ -2736,8 +2736,8 @@ void __init ioapic_init(void)
                   max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
                       8 * nr_irqs_gsi) :
                   nr_irqs_gsi;
-    else if ( nr_irqs < 16 )
-        nr_irqs =3D 16;
+    else if ( nr_irqs < NR_ISA_IRQS )
+        nr_irqs =3D NR_ISA_IRQS;
     printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
            nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f35894577b..dd8d921f18 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -36,7 +36,7 @@
 bool __read_mostly opt_noirqbalance;
 boolean_param("noirqbalance", opt_noirqbalance);
=20
-unsigned int __read_mostly nr_irqs_gsi =3D 16;
+unsigned int __read_mostly nr_irqs_gsi =3D NR_ISA_IRQS;
 unsigned int __read_mostly nr_irqs;
 integer_param("nr_irqs", nr_irqs);
=20
@@ -1525,7 +1525,7 @@ void desc_guest_eoi(struct irq_desc *desc, struct pir=
q *pirq)
 int pirq_guest_unmask(struct domain *d)
 {
     unsigned int pirq =3D 0, n, i;
-    struct pirq *pirqs[16];
+    struct pirq *pirqs[NR_ISA_IRQS];
=20
     do {
         n =3D radix_tree_gang_lookup(&d->pirq_tree, (void **)pirqs, pirq,
@@ -2113,7 +2113,7 @@ int get_free_pirq(struct domain *d, int type)
=20
     if ( type =3D=3D MAP_PIRQ_TYPE_GSI )
     {
-        for ( i =3D 16; i < nr_irqs_gsi; i++ )
+        for ( i =3D NR_ISA_IRQS; i < nr_irqs_gsi; i++ )
             if ( is_free_pirq(d, pirq_info(d, i)) )
             {
                 pirq_get_info(d, i);
--=20
2.34.1




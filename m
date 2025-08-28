Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B99B3AEB0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100192.1453865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRu-0007uC-9E; Thu, 28 Aug 2025 23:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100192.1453865; Thu, 28 Aug 2025 23:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRt-0007Yp-Ep; Thu, 28 Aug 2025 23:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1100192;
 Thu, 28 Aug 2025 23:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRp-00076P-In
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRp-00B9vM-07;
 Thu, 28 Aug 2025 23:54:29 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRp-006h9H-06;
 Thu, 28 Aug 2025 23:54:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=zH+Ml0xpNcmzc186mKizKSEiGAMZCRDPd3343TaJluU=; b=CePpDAmPxy5vuyFqPC22eqCIWN
	ewQbHhdcOzjO7upv0uo0hwjDuV6zi32QJl2TChIFivOXQJvBcR8pQmdyUYshlvCinCAGAqPvMee8O
	qvS47kQzgXVVBzEFV2+54T0ahyMlcPC5fTtX2/6R94pUsK2wkszMjH3vJ+R8t+Ajx3jM=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 15/15] emul/ns16x50: implement IRQ emulation via vIOAPIC
Date: Thu, 28 Aug 2025 16:54:09 -0700
Message-ID: <20250828235409.2835815-16-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
be asserted on vIOAPIC.

{map,unmap}_domain_emuirq_pirq() infrastructure is modified by adding new
type of interrupt resources 'IRQ_EMU' which means 'emulated device IRQ'
(similarly to IRQ_MSI_EMU).

This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mapping
(vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin corresponding to
virtual device's IRQ.

Also, hvm_gsi_eoi() is modified to trigger assertion in hvm_gsi_deassert()
path for ISA IRQs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- dropped xl bits
- cosmetic renames
- fix hvm_gsi_eoi()
- Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-8-dmukhin@ford.com/
---
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/hvm/vioapic.c        | 10 ++++++++++
 xen/arch/x86/include/asm/irq.h    |  3 ++-
 xen/arch/x86/irq.c                |  4 ++--
 xen/arch/x86/physdev.c            |  8 ++++----
 xen/common/emul/vuart/ns16x50.c   | 32 +++++++++++++++++++++++++++++--
 xen/drivers/passthrough/x86/hvm.c | 13 ++++++++-----
 7 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88d2..0815d0b31827 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1048,7 +1048,7 @@ int arch_domain_soft_reset(struct domain *d)
     write_lock(&d->event_lock);
     for ( i = 0; i < d->nr_pirqs ; i++ )
     {
-        if ( domain_pirq_to_emuirq(d, i) != IRQ_UNBOUND )
+        if ( domain_irq_to_emuirq(d, i) != IRQ_UNBOUND )
         {
             ret = unmap_domain_pirq_emuirq(d, i);
             if ( ret )
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e471f..fd073f6fba4b 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
 
     ASSERT(is_hardware_domain(currd));
 
+    /*
+     * Interrupt is claimed by one of the platform virtual devices (e.g.
+     * NS16550); do nothing.
+     */
+    write_lock(&currd->event_lock);
+    ret = domain_irq_to_emuirq(currd, gsi);
+    write_unlock(&currd->event_lock);
+    if ( ret != IRQ_UNBOUND )
+        return 0;
+
     /* Interrupt has been unmasked, bind it now. */
     ret = mp_register_gsi(gsi, trig, pol);
     if ( ret == -EEXIST )
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 8bffec3bbfee..3b24decb05e4 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -212,7 +212,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
     __ret ? radix_tree_ptr_to_int(__ret) : 0;                   \
 })
 #define PIRQ_ALLOCATED (-1)
-#define domain_pirq_to_emuirq(d, pirq) pirq_field(d, pirq,              \
+#define domain_irq_to_emuirq(d, pirq) pirq_field(d, pirq,              \
     arch.hvm.emuirq, IRQ_UNBOUND)
 #define domain_emuirq_to_pirq(d, emuirq) ({                             \
     void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, emuirq);\
@@ -221,6 +221,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
 #define IRQ_UNBOUND (-1)
 #define IRQ_PT      (-2)
 #define IRQ_MSI_EMU (-3)
+#define IRQ_EMU     (-4)
 
 bool cpu_has_pending_apic_eoi(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 079277be719d..7a8093cd3238 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2790,7 +2790,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
         return -EINVAL;
     }
 
-    old_emuirq = domain_pirq_to_emuirq(d, pirq);
+    old_emuirq = domain_irq_to_emuirq(d, pirq);
     if ( emuirq != IRQ_PT )
         old_pirq = domain_emuirq_to_pirq(d, emuirq);
 
@@ -2845,7 +2845,7 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pirq)
 
     ASSERT(rw_is_write_locked(&d->event_lock));
 
-    emuirq = domain_pirq_to_emuirq(d, pirq);
+    emuirq = domain_irq_to_emuirq(d, pirq);
     if ( emuirq == IRQ_UNBOUND )
     {
         dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 4dfa1c019105..90a9e7d2f120 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -145,7 +145,7 @@ int physdev_unmap_pirq(struct domain *d, int pirq)
     if ( is_hvm_domain(d) && has_pirq(d) )
     {
         write_lock(&d->event_lock);
-        if ( domain_pirq_to_emuirq(d, pirq) != IRQ_UNBOUND )
+        if ( domain_irq_to_emuirq(d, pirq) != IRQ_UNBOUND )
             ret = unmap_domain_pirq_emuirq(d, pirq);
         write_unlock(&d->event_lock);
         if ( d == current->domain || ret )
@@ -191,10 +191,10 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( is_pv_domain(currd) || domain_pirq_to_irq(currd, eoi.irq) > 0 )
             pirq_guest_eoi(pirq);
         if ( is_hvm_domain(currd) &&
-             domain_pirq_to_emuirq(currd, eoi.irq) > 0 )
+             domain_irq_to_emuirq(currd, eoi.irq) > 0 )
         {
             struct hvm_irq *hvm_irq = hvm_domain_irq(currd);
-            int gsi = domain_pirq_to_emuirq(currd, eoi.irq);
+            int gsi = domain_irq_to_emuirq(currd, eoi.irq);
 
             /* if this is a level irq and count > 0, send another
              * notification */ 
@@ -267,7 +267,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         irq_status_query.flags = 0;
         if ( is_hvm_domain(currd) &&
              domain_pirq_to_irq(currd, irq) <= 0 &&
-             domain_pirq_to_emuirq(currd, irq) == IRQ_UNBOUND )
+             domain_irq_to_emuirq(currd, irq) == IRQ_UNBOUND )
         {
             ret = -EINVAL;
             break;
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index aea38304b60c..1126b53c30df 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -287,7 +287,9 @@ static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
     const struct vuart_info *info = vdev->info;
     int vector;
 
-    if ( has_vpic(d) ) /* HVM */
+    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
+        vector = hvm_ioapic_assert(d, info->irq, false);
+    else if ( has_vpic(d) ) /* HVM */
         vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
     else
         ASSERT_UNREACHABLE();
@@ -300,7 +302,9 @@ static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
     struct domain *d = vdev->owner;
     const struct vuart_info *info = vdev->info;
 
-    if ( has_vpic(d) ) /* HVM */
+    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
+        hvm_ioapic_deassert(d, info->irq);
+    else if ( has_vpic(d) ) /* HVM */
         hvm_isa_irq_deassert(d, info->irq);
     else
         ASSERT_UNREACHABLE();
@@ -803,6 +807,17 @@ static int ns16x50_init(void *arg)
         return rc;
     }
 
+    /* Claim virtual IRQ */
+    write_lock(&d->event_lock);
+    rc = map_domain_emuirq_pirq(d, info->irq, IRQ_EMU);
+    write_unlock(&d->event_lock);
+    if ( rc )
+    {
+        ns16x50_err(info, "virtual IRQ#%d: cannot claim: %d\n",
+                    info->irq, rc);
+        return rc;
+    }
+
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
@@ -822,9 +837,22 @@ static int ns16x50_init(void *arg)
 static void cf_check ns16x50_deinit(void *arg)
 {
     struct vuart_ns16x50 *vdev = arg;
+    const struct vuart_info *info;
+    struct domain *d;
+    int rc;
 
     ASSERT(vdev);
 
+    d = vdev->owner;
+    info = vdev->info;
+
+    write_lock(&d->event_lock);
+    rc = unmap_domain_pirq_emuirq(d, info->irq);
+    write_unlock(&d->event_lock);
+    if ( rc )
+        ns16x50_err(vdev, "virtual IRQ#%d: cannot unclaim: %d\n",
+                    info->irq, rc);
+
     spin_lock(&vdev->lock);
     ns16x50_fifo_tx_flush(vdev);
     spin_unlock(&vdev->lock);
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index a2ca7e0e570c..11711d20a7ea 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -923,13 +923,16 @@ static void __hvm_dpci_eoi(struct domain *d,
 static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
 {
     struct pirq *pirq = pirq_info(d, gsi);
+    int rc;
+
+    /* Check if GSI is claimed by one of the virtual devices. */
+    rc = domain_irq_to_emuirq(d, gsi);
+    if ( rc != IRQ_UNBOUND )
+        hvm_gsi_deassert(d, gsi);
 
     /* Check if GSI is actually mapped. */
-    if ( !pirq_dpci(pirq) )
-        return;
-
-    hvm_gsi_deassert(d, gsi);
-    hvm_pirq_eoi(pirq);
+    if ( pirq_dpci(pirq) )
+        hvm_pirq_eoi(pirq);
 }
 
 static int cf_check _hvm_dpci_isairq_eoi(
-- 
2.51.0



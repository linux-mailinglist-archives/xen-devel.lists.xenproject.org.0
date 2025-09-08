Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B7B49B93
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115556.1462227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9q-0003XO-QD; Mon, 08 Sep 2025 21:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115556.1462227; Mon, 08 Sep 2025 21:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9p-0003Ct-RQ; Mon, 08 Sep 2025 21:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1115556;
 Mon, 08 Sep 2025 21:12:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9l-0002aN-RZ
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:12:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9l-000FVX-2F;
 Mon, 08 Sep 2025 21:12:09 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9l-000gNi-2T;
 Mon, 08 Sep 2025 21:12:09 +0000
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
	bh=QgoMqHbu0tUc+lVtvyYl2w5a013VrqpmgCwPwd2nRFw=; b=sOqZXpCXdQNe+SfB8ANsxd7Vn4
	ZxrzEB4O/VMXSs0Fr3nr5FmWbheVLjFkqlmzUFrSF1+D0tmWM43cGV0CSvKydOw7dY9AbSw45y7M6
	FsI9G9nOelJVlrFjztHRmbcjYGVEGob1snavNNwQppzgnhaWoUNvvV0i+b7LRE+TMm6E=;
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
Subject: [PATCH v7 16/16] emul/ns16x50: implement IRQ emulation via vIOAPIC
Date: Mon,  8 Sep 2025 14:11:49 -0700
Message-ID: <20250908211149.279143-17-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
be asserted on vIOAPIC.

{map,unmap}_domain_pirq_emuirq() infrastructure is modified by adding new
type of interrupt resources 'IRQ_EMU' which means 'emulated device IRQ'
(similarly to IRQ_MSI_EMU).

This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mapping
(vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin corresponding to
virtual device's IRQ.

Also, hvm_gsi_eoi() is modified to trigger assertion in hvm_gsi_deassert()
path for ISA IRQs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- n/a
---
 xen/arch/x86/hvm/vioapic.c        | 10 ++++++++++
 xen/arch/x86/include/asm/irq.h    |  6 ++++++
 xen/common/emul/vuart/ns16x50.c   | 28 ++++++++++++++++++++++++++--
 xen/drivers/passthrough/x86/hvm.c | 11 ++++++++++-
 4 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e471f..6314874b64f7 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
 
     ASSERT(is_hardware_domain(currd));
 
+    /*
+     * Interrupt is claimed by one of the platform virtual devices (e.g.
+     * NS16550); do nothing.
+     */
+    write_lock(&currd->event_lock);
+    ret = is_domain_emuirq_claimed(currd, gsi);
+    write_unlock(&currd->event_lock);
+    if ( ret )
+        return 0;
+
     /* Interrupt has been unmasked, bind it now. */
     ret = mp_register_gsi(gsi, trig, pol);
     if ( ret == -EEXIST )
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 8bffec3bbfee..bdbe700274e9 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -168,6 +168,11 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
+#define domain_emuirq_claim(d, irq)     map_domain_emuirq_pirq(d, irq, IRQ_EMU)
+#define domain_emuirq_unclaim(d, irq)   unmap_domain_pirq_emuirq(d, irq)
+#define is_domain_emuirq_claimed(d, irq) \
+    (domain_pirq_to_emuirq(d, irq) != IRQ_UNBOUND)
+
 /* Evacuate interrupts assigned to CPUs not present in the CPU online map. */
 void fixup_irqs(void);
 void fixup_eoi(void);
@@ -221,6 +226,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
 #define IRQ_UNBOUND (-1)
 #define IRQ_PT      (-2)
 #define IRQ_MSI_EMU (-3)
+#define IRQ_EMU     (-4)
 
 bool cpu_has_pending_apic_eoi(void);
 
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 6bd58ba5540b..081d2639aa7a 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -299,7 +299,7 @@ static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
     if ( has_vpic(d) )
         vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
     else if ( has_vioapic(d) )
-        /* TODO */
+        vector = hvm_ioapic_assert(d, info->irq, false);
     else
         ASSERT_UNREACHABLE();
 
@@ -314,7 +314,7 @@ static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
     if ( has_vpic(d) )
         hvm_isa_irq_deassert(d, info->irq);
     else if ( has_vioapic(d) )
-        /* TODO */
+        hvm_ioapic_deassert(d, info->irq);
     else
         ASSERT_UNREACHABLE();
 
@@ -806,6 +806,17 @@ static int ns16x50_init(void *arg)
         return rc;
     }
 
+    /* Claim virtual IRQ */
+    write_lock(&d->event_lock);
+    rc = domain_emuirq_claim(d, info->irq);
+    write_unlock(&d->event_lock);
+    if ( rc )
+    {
+        ns16x50_err(info, "virtual IRQ#%d: cannot claim: %d\n",
+                    info->irq, rc);
+        return rc;
+    }
+
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
@@ -822,9 +833,22 @@ static int ns16x50_init(void *arg)
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
+    rc = domain_emuirq_unclaim(d, info->irq);
+    write_unlock(&d->event_lock);
+    if ( rc )
+        ns16x50_err(vdev, "virtual IRQ#%d: cannot unclaim: %d\n",
+                    info->irq, rc);
+
     spin_lock(&vdev->lock);
     ns16x50_fifo_tx_flush(vdev);
     spin_unlock(&vdev->lock);
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index a2ca7e0e570c..20641194561f 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -922,7 +922,16 @@ static void __hvm_dpci_eoi(struct domain *d,
 
 static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
 {
-    struct pirq *pirq = pirq_info(d, gsi);
+    struct pirq *pirq;
+
+    /* Check if GSI is claimed by one of the virtual devices. */
+    if ( is_domain_emuirq_claimed(d, gsi) )
+    {
+        hvm_gsi_deassert(d, gsi);
+        return;
+    }
+
+    pirq = pirq_info(d, gsi);
 
     /* Check if GSI is actually mapped. */
     if ( !pirq_dpci(pirq) )
-- 
2.51.0



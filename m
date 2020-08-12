Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B72429A9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 14:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAO-0006Zb-HN; Wed, 12 Aug 2020 12:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAM-0006ZO-Kx
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:38 +0000
X-Inumbo-ID: e585d38a-a1df-46b2-974a-99492b04e3b9
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e585d38a-a1df-46b2-974a-99492b04e3b9;
 Wed, 12 Aug 2020 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdpiKKQKGV+KOXDSfz7N1UpSnACi0zOdRo+Vf79VXGs=;
 b=Qgl9LK4tToPQQE7Ya9uPX4KMo3Qo3rd37r8tDSeERHkwsGZC3h113BFc
 8ocN8XXGMRPt7GHW8ryOlO/R6DjJtM0mYMsSVtNkAzj7qre1AO49ubwJA
 trz3+KtmyT7HONJ0UbK04KaplNojCdAgzvR/FY2vEypkBv87xrVClGfYy 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ONrAu3atxNDYyfZUlT90eLDY4OnQmuawYElEt/qnjJIzjYB8TDB6b6hFz8XBYE9WHwIX2UvP+T
 6+eWz7a41edY2XGl8sv6DujQUP8MaCMlcMNy8dwijuILGPNUohFF63FjepT+SXsbt4/H9NXhc0
 nYtIbjeZYHZpvx0MJC7U7acIpfK0UsTixUPDg+SOEy14eJ7e/i7R7tk6W2Jpf1UFnEWFu08vx+
 k1/YuhwqyTEP299wOtTzmeLbhCIVjhscP+082XX4MFi0gDUmAb4771o6r6KWIzqoNQkbVNm2hh
 vx0=
X-SBRS: 2.7
X-MesageID: 24693521
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24693521"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
Date: Wed, 12 Aug 2020 14:47:07 +0200
Message-ID: <20200812124709.4165-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812124709.4165-1-roger.pau@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
and instead use the newly introduced EOI callback mechanism in order
to register a callback for MSI vectors injected from passed through
devices.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vlapic.c    |  2 --
 xen/arch/x86/hvm/vmsi.c      | 36 ++++++++++++++++++++++--------------
 xen/drivers/passthrough/io.c |  4 +++-
 xen/include/asm-x86/hvm/io.h |  2 +-
 4 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 7369be468b..3b3b3d7621 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     else if ( has_viridian_synic(d) )
         viridian_synic_ack_sint(v, vector);
 
-    hvm_dpci_msi_eoi(d, vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[vector].callback;
     data = vlapic->callbacks[vector].data;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 7ca19353ab..e192c4c6da 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -44,11 +44,9 @@
 #include <asm/event.h>
 #include <asm/io_apic.h>
 
-static void vmsi_inj_irq(
-    struct vlapic *target,
-    uint8_t vector,
-    uint8_t trig_mode,
-    uint8_t delivery_mode)
+static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
+                         uint8_t trig_mode, uint8_t delivery_mode,
+                         vlapic_eoi_callback_t *callback, void *data)
 {
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm %d\n",
                 vector, trig_mode, delivery_mode);
@@ -57,17 +55,17 @@ static void vmsi_inj_irq(
     {
     case dest_Fixed:
     case dest_LowestPrio:
-        vlapic_set_irq(target, vector, trig_mode);
+        vlapic_set_irq_callback(target, vector, trig_mode, callback, data);
         break;
     default:
         BUG();
     }
 }
 
-int vmsi_deliver(
-    struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
-    uint8_t delivery_mode, uint8_t trig_mode)
+static int vmsi_deliver_callback(struct domain *d, int vector, uint8_t dest,
+                                 uint8_t dest_mode, uint8_t delivery_mode,
+                                 uint8_t trig_mode,
+                                 vlapic_eoi_callback_t *callback, void *data)
 {
     struct vlapic *target;
     struct vcpu *v;
@@ -78,7 +76,8 @@ int vmsi_deliver(
         target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
+            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, callback,
+                         data);
             break;
         }
         HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: vector=%02x\n",
@@ -89,8 +88,8 @@ int vmsi_deliver(
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
                                    0, dest, dest_mode) )
-                vmsi_inj_irq(vcpu_vlapic(v), vector,
-                             trig_mode, delivery_mode);
+                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, delivery_mode,
+                             callback, data);
         break;
 
     default:
@@ -103,6 +102,14 @@ int vmsi_deliver(
     return 0;
 }
 
+
+int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t dest_mode,
+                 uint8_t delivery_mode, uint8_t trig_mode)
+{
+    return vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode,
+                                 trig_mode, NULL, NULL);
+}
+
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
@@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 
     ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
 
-    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
+    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
+                          hvm_dpci_msi_eoi, NULL);
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..3793029b29 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -874,8 +874,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(struct domain *d, int vector)
+void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *data)
 {
+    struct domain *d = v->domain;
+
     if ( !is_iommu_enabled(d) ||
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 558426b772..450c7c8acb 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -159,7 +159,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
+void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *data);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-- 
2.28.0



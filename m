Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391127E6D7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545.1823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY6-0000n9-6V; Wed, 30 Sep 2020 10:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545.1823; Wed, 30 Sep 2020 10:41:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY6-0000mP-29; Wed, 30 Sep 2020 10:41:26 +0000
Received: by outflank-mailman (input) for mailman id 545;
 Wed, 30 Sep 2020 10:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZY3-0000iF-Sx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e7f82c6-9899-44cb-bf66-643ff8a83cd4;
 Wed, 30 Sep 2020 10:41:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZY3-0000iF-Sx
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:23 +0000
X-Inumbo-ID: 4e7f82c6-9899-44cb-bf66-643ff8a83cd4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e7f82c6-9899-44cb-bf66-643ff8a83cd4;
	Wed, 30 Sep 2020 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fg2n4En+8hTvTykx+q5VMiSwKU3OIKUaqIxvn9D7J6g=;
  b=MBaKJVFqjT1QSCZxsBXoksF+U3Dupyky7PfsUyExiqAZS203OdKuS1m4
   LaVkTXcsMMqj7SpQW/tmlkY2sHo9sIZyGqOmUcDW4AhSCr8MOHbL6X1Ww
   zK8AIIMf6f5EbKnn7NRKQsfUMqna3Np8zwnmzZHeGB4pZSk+gGp+qZGRb
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Cc3krNVpuXZTcFEsccDXCa+c1jIVPGsLt/9fSSm+VKrnjXdz9PpEadutCUL5LlH2zp0rKIZKLu
 CMOuXtZ75Mxjgv1brsqN/4ddSlTWb2okiwWDYP9iSdf8nZsAj6s/D+PbBqVqqYupCv8YcDyduP
 1YUX3qAjtzVG1mTxRxgMayzDhCbFGr8fXbBDMDE/PksJvHiKMzs84mz2ue3bQjBizRhb0+GjeJ
 lPttDq2cCRw8bwAhnFXgPbHC5PMyOs4fyiev6F9kvO3+ukceG7YY1z4r52ipIeFliEqldtRsnV
 cY0=
X-SBRS: None
X-MesageID: 27954185
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27954185"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
Date: Wed, 30 Sep 2020 12:40:58 +0200
Message-ID: <20200930104108.35969-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

EOIs are always executed in guest vCPU context, so there's no reason to
pass a vCPU parameter around as can be fetched from current.

While there make the vector parameter of both callbacks unsigned int.

No functional change intended.

Suggested-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        | 5 +++--
 xen/arch/x86/hvm/vlapic.c         | 7 ++-----
 xen/drivers/passthrough/io.c      | 4 +++-
 xen/include/asm-x86/hvm/io.h      | 2 +-
 xen/include/asm-x86/hvm/vioapic.h | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..0fb9147d99 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -353,7 +353,7 @@ static int vioapic_write(
 
 #if VIOAPIC_VERSION_ID >= 0x20
     case VIOAPIC_REG_EOI:
-        vioapic_update_EOI(v->domain, val);
+        vioapic_update_EOI(val);
         break;
 #endif
 
@@ -495,8 +495,9 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(struct domain *d, u8 vector)
+void vioapic_update_EOI(unsigned int vector)
 {
+    struct domain *d = current->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     union vioapic_redir_entry *ent;
     unsigned int i;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 4e3861eb7d..ae737403f3 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
-    struct vcpu *v = vlapic_vcpu(vlapic);
-    struct domain *d = v->domain;
-
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(d, vector);
+        vioapic_update_EOI(vector);
 
-    hvm_dpci_msi_eoi(d, vector);
+    hvm_dpci_msi_eoi(vector);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..54f3e7b540 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -874,8 +874,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(struct domain *d, int vector)
+void hvm_dpci_msi_eoi(unsigned int vector)
 {
+    struct domain *d = current->domain;
+
     if ( !is_iommu_enabled(d) ||
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 558426b772..adec0f566a 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -159,7 +159,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
+extern void hvm_dpci_msi_eoi(unsigned int vector);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/include/asm-x86/hvm/vioapic.h
index d6f4e12d54..fd602f8830 100644
--- a/xen/include/asm-x86/hvm/vioapic.h
+++ b/xen/include/asm-x86/hvm/vioapic.h
@@ -64,7 +64,7 @@ int vioapic_init(struct domain *d);
 void vioapic_deinit(struct domain *d);
 void vioapic_reset(struct domain *d);
 void vioapic_irq_positive_edge(struct domain *d, unsigned int irq);
-void vioapic_update_EOI(struct domain *d, u8 vector);
+void vioapic_update_EOI(unsigned int vector);
 
 int vioapic_get_mask(const struct domain *d, unsigned int gsi);
 int vioapic_get_vector(const struct domain *d, unsigned int gsi);
-- 
2.28.0



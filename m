Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5B27E6DE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550.1883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYK-0001Bg-VL; Wed, 30 Sep 2020 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550.1883; Wed, 30 Sep 2020 10:41:40 +0000
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
	id 1kNZYK-0001AH-Kr; Wed, 30 Sep 2020 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 550;
 Wed, 30 Sep 2020 10:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYI-0000jt-Fl
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57e3c386-e6d7-4652-8d0b-2bc22afc7b5a;
 Wed, 30 Sep 2020 10:41:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYI-0000jt-Fl
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:38 +0000
X-Inumbo-ID: 57e3c386-e6d7-4652-8d0b-2bc22afc7b5a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 57e3c386-e6d7-4652-8d0b-2bc22afc7b5a;
	Wed, 30 Sep 2020 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A0Aqq4yp9EoV5C+st3+iFmjne1L+WWNEt1JeXbNWQns=;
  b=eFHiKc2v9M+3qj38j/yZuW18MDWYRCJ3rpu9xkvnm++pObNyX1QvKwKS
   Ok4Kkne9FO7LkoZVVsQ7WhINihFNMhVh65j0IdSIDCPONS2vh02TlaMB4
   Gm0N9Fag0MgxeEhaCar7uQEyGu/6QSBaUa7zuOnthoShXj4E3bLpRYq90
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FuJee6easIHdYzXWuN2ZL2b/VBPSAV3wYWmQf8lfWUlWHEGX1UUSRmPVvyeJzlQJgKNVJz4UGX
 RcWSrSHaybpC4S8UxqNh6C3XJCS2HHiIjtQAXEdfbysD2KU0twToVGL6fy89aC1HWBmCA6t9Jc
 4HDbt5NCdExlEAu//ghyb80iwfOrCS/SG9PA6vqU9e77X9TNrw1t3+b/K1AtQBCGFa1BbHQn2t
 WUvgC21JUbOAFDe+jEixexjV+ahzIaD/pAMyQQlIm/wjzONuG1MpaeNIl1K5jThl07YpXpHVBj
 jdc=
X-SBRS: None
X-MesageID: 27927012
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27927012"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 07/11] x86/dpci: move code
Date: Wed, 30 Sep 2020 12:41:04 +0200
Message-ID: <20200930104108.35969-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is code movement in order to simply further changes.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/drivers/passthrough/io.c | 172 +++++++++++++++++------------------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index bff0f6628a..770a5cce6b 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -276,6 +276,92 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
     return dest;
 }
 
+static void hvm_pirq_eoi(struct pirq *pirq,
+                         const union vioapic_redir_entry *ent)
+{
+    struct hvm_pirq_dpci *pirq_dpci;
+
+    if ( !pirq )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    pirq_dpci = pirq_dpci(pirq);
+
+    /*
+     * No need to get vector lock for timer
+     * since interrupt is still not EOIed
+     */
+    if ( --pirq_dpci->pending ||
+         (ent && ent->fields.mask) ||
+         !pt_irq_need_timer(pirq_dpci->flags) )
+        return;
+
+    stop_timer(&pirq_dpci->timer);
+    pirq_guest_eoi(pirq);
+}
+
+static void __hvm_dpci_eoi(struct domain *d,
+                           const struct hvm_girq_dpci_mapping *girq,
+                           const union vioapic_redir_entry *ent)
+{
+    struct pirq *pirq = pirq_info(d, girq->machine_gsi);
+
+    if ( !hvm_domain_use_pirq(d, pirq) )
+        hvm_pci_intx_deassert(d, girq->device, girq->intx);
+
+    hvm_pirq_eoi(pirq, ent);
+}
+
+static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
+                        const union vioapic_redir_entry *ent)
+{
+    struct pirq *pirq = pirq_info(d, gsi);
+
+    /* Check if GSI is actually mapped. */
+    if ( !pirq_dpci(pirq) )
+        return;
+
+    hvm_gsi_deassert(d, gsi);
+    hvm_pirq_eoi(pirq, ent);
+}
+
+void hvm_dpci_eoi(unsigned int guest_gsi, const union vioapic_redir_entry *ent)
+{
+    struct domain *d = current->domain;
+    const struct hvm_irq_dpci *hvm_irq_dpci;
+    const struct hvm_girq_dpci_mapping *girq;
+
+    if ( !is_iommu_enabled(d) )
+        return;
+
+    if ( is_hardware_domain(d) )
+    {
+        spin_lock(&d->event_lock);
+        hvm_gsi_eoi(d, guest_gsi, ent);
+        goto unlock;
+    }
+
+    if ( guest_gsi < NR_ISAIRQS )
+    {
+        hvm_dpci_isairq_eoi(d, guest_gsi);
+        return;
+    }
+
+    spin_lock(&d->event_lock);
+    hvm_irq_dpci = domain_get_irq_dpci(d);
+
+    if ( !hvm_irq_dpci )
+        goto unlock;
+
+    list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
+        __hvm_dpci_eoi(d, girq, ent);
+
+unlock:
+    spin_unlock(&d->event_lock);
+}
+
 int pt_irq_create_bind(
     struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
 {
@@ -952,92 +1038,6 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
     spin_unlock(&d->event_lock);
 }
 
-static void hvm_pirq_eoi(struct pirq *pirq,
-                         const union vioapic_redir_entry *ent)
-{
-    struct hvm_pirq_dpci *pirq_dpci;
-
-    if ( !pirq )
-    {
-        ASSERT_UNREACHABLE();
-        return;
-    }
-
-    pirq_dpci = pirq_dpci(pirq);
-
-    /*
-     * No need to get vector lock for timer
-     * since interrupt is still not EOIed
-     */
-    if ( --pirq_dpci->pending ||
-         (ent && ent->fields.mask) ||
-         !pt_irq_need_timer(pirq_dpci->flags) )
-        return;
-
-    stop_timer(&pirq_dpci->timer);
-    pirq_guest_eoi(pirq);
-}
-
-static void __hvm_dpci_eoi(struct domain *d,
-                           const struct hvm_girq_dpci_mapping *girq,
-                           const union vioapic_redir_entry *ent)
-{
-    struct pirq *pirq = pirq_info(d, girq->machine_gsi);
-
-    if ( !hvm_domain_use_pirq(d, pirq) )
-        hvm_pci_intx_deassert(d, girq->device, girq->intx);
-
-    hvm_pirq_eoi(pirq, ent);
-}
-
-static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
-                        const union vioapic_redir_entry *ent)
-{
-    struct pirq *pirq = pirq_info(d, gsi);
-
-    /* Check if GSI is actually mapped. */
-    if ( !pirq_dpci(pirq) )
-        return;
-
-    hvm_gsi_deassert(d, gsi);
-    hvm_pirq_eoi(pirq, ent);
-}
-
-void hvm_dpci_eoi(unsigned int guest_gsi, const union vioapic_redir_entry *ent)
-{
-    struct domain *d = current->domain;
-    const struct hvm_irq_dpci *hvm_irq_dpci;
-    const struct hvm_girq_dpci_mapping *girq;
-
-    if ( !is_iommu_enabled(d) )
-        return;
-
-    if ( is_hardware_domain(d) )
-    {
-        spin_lock(&d->event_lock);
-        hvm_gsi_eoi(d, guest_gsi, ent);
-        goto unlock;
-    }
-
-    if ( guest_gsi < NR_ISAIRQS )
-    {
-        hvm_dpci_isairq_eoi(d, guest_gsi);
-        return;
-    }
-
-    spin_lock(&d->event_lock);
-    hvm_irq_dpci = domain_get_irq_dpci(d);
-
-    if ( !hvm_irq_dpci )
-        goto unlock;
-
-    list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
-        __hvm_dpci_eoi(d, girq, ent);
-
-unlock:
-    spin_unlock(&d->event_lock);
-}
-
 /*
  * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get to
  * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-counting.
-- 
2.28.0



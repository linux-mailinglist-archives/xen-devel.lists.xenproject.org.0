Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E318D1F56D1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1jd-0005mq-No; Wed, 10 Jun 2020 14:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jj1jc-0005mB-3K
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:29:44 +0000
X-Inumbo-ID: d1b5259a-ab26-11ea-b44c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b5259a-ab26-11ea-b44c-12813bfff9fa;
 Wed, 10 Jun 2020 14:29:40 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GJLjP7ff4EuEieDZJLxNjrBIVSzjkb8E/aRLYSRCwvDs0aQ7cM9xfIB3V0T1kwJ4mVLMqOkCzU
 gG/ukGGjgU8EjEsZVF9MUSyk1jlH8GjxzlRynFmce1eHmkCMkj1ceVoOZlKgylG417kKDMUXX8
 vdhb24ldULRaHlusPRMqB4pVOKOTkOSL3ixZS0vcYddO3CGOTHVbZ/nsWxUPHpuaTX8BHk2iLC
 f6CollDsE8BWm131ni9qc6LS+xPOzrodg6rYbXVHr3YC71daGG5uIs57HB2iRmRo9YAiuxZKvH
 kIA=
X-SBRS: 2.7
X-MesageID: 20039447
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="20039447"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2 1/2] x86/passthrough: do not assert edge triggered
 GSIs for PVH dom0
Date: Wed, 10 Jun 2020 16:29:22 +0200
Message-ID: <20200610142923.9074-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610142923.9074-1-roger.pau@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
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

Edge triggered interrupts do not assert the line, so the handling done
in Xen should also avoid asserting it. Asserting the line prevents
further edge triggered interrupts on the same vIO-APIC pin from being
delivered, since the line is not de-asserted.

One case of such kind of interrupt is the RTC timer, which is edge
triggered and available to a PVH dom0. Note this should not affect
domUs, as it only modifies the behavior of IDENTITY_GSI kind of passed
through interrupts.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Compare the triggering against VIOAPIC_{EDGE/LEVEL}_TRIG.
---
 xen/arch/x86/hvm/irq.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 9c8adbc495..fd02cf2e8d 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -169,9 +169,10 @@ void hvm_pci_intx_deassert(
 
 void hvm_gsi_assert(struct domain *d, unsigned int gsi)
 {
+    int trig = vioapic_get_trigger_mode(d, gsi);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
-    if ( gsi >= hvm_irq->nr_gsis )
+    if ( gsi >= hvm_irq->nr_gsis || trig < 0 )
     {
         ASSERT_UNREACHABLE();
         return;
@@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
      * to know if the GSI is pending or not.
      */
     spin_lock(&d->arch.hvm.irq_lock);
-    if ( !hvm_irq->gsi_assert_count[gsi] )
+    if ( trig == VIOAPIC_EDGE_TRIG || !hvm_irq->gsi_assert_count[gsi] )
     {
-        hvm_irq->gsi_assert_count[gsi] = 1;
+        if ( trig == VIOAPIC_LEVEL_TRIG )
+            hvm_irq->gsi_assert_count[gsi] = 1;
         assert_gsi(d, gsi);
     }
     spin_unlock(&d->arch.hvm.irq_lock);
@@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
 
 void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
 {
+    int trig = vioapic_get_trigger_mode(d, gsi);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
-    if ( gsi >= hvm_irq->nr_gsis )
+    if ( trig <= VIOAPIC_EDGE_TRIG || gsi >= hvm_irq->nr_gsis )
     {
-        ASSERT_UNREACHABLE();
+        ASSERT(trig == VIOAPIC_EDGE_TRIG && gsi < hvm_irq->nr_gsis);
         return;
     }
 
-- 
2.26.2



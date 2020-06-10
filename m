Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D91F53D5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizGb-0008AH-Ai; Wed, 10 Jun 2020 11:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jizGa-000894-5Q
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:51:36 +0000
X-Inumbo-ID: bb02dff6-ab10-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb02dff6-ab10-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 11:51:33 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SIf3w8dtwNB7iDK3eBGtb9BdQAGPSIashFWNXnaUw2TDk1TmjHPbOeVM7+NVKHoHbhckS6siWf
 6DQBTE932NsEiTRnfDxM4biet1nlEzA+lkdbhU8tvCMcnD7DZ4gc1neCIXs5d8186X6VhOjkkR
 bLnHul6iDqDgaL0aD0eYdMfM0JhEQIE4xhnrF2XZ5suM9XgAFSBdXQNmln1esi5091r3z5zcdq
 4SnYj9bUz1VARA5tVyhKVlmLARENH+kYflbM9r0PF2ZPDR4xfz1Geh0vuJDa7wnunSsNYbv9/s
 tUQ=
X-SBRS: 2.7
X-MesageID: 19673839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19673839"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge triggered
 GSIs for PVH dom0
Date: Wed, 10 Jun 2020 13:51:02 +0200
Message-ID: <20200610115103.7592-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610115103.7592-1-roger.pau@citrix.com>
References: <20200610115103.7592-1-roger.pau@citrix.com>
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
---
 xen/arch/x86/hvm/irq.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 9c8adbc495..9a56543c1b 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -169,9 +169,10 @@ void hvm_pci_intx_deassert(
 
 void hvm_gsi_assert(struct domain *d, unsigned int gsi)
 {
+    int level = vioapic_get_trigger_mode(d, gsi);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
-    if ( gsi >= hvm_irq->nr_gsis )
+    if ( gsi >= hvm_irq->nr_gsis || level < 0 )
     {
         ASSERT_UNREACHABLE();
         return;
@@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
      * to know if the GSI is pending or not.
      */
     spin_lock(&d->arch.hvm.irq_lock);
-    if ( !hvm_irq->gsi_assert_count[gsi] )
+    if ( !level || !hvm_irq->gsi_assert_count[gsi] )
     {
-        hvm_irq->gsi_assert_count[gsi] = 1;
+        if ( !level )
+            hvm_irq->gsi_assert_count[gsi] = 1;
         assert_gsi(d, gsi);
     }
     spin_unlock(&d->arch.hvm.irq_lock);
@@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
 
 void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
 {
+    int level = vioapic_get_trigger_mode(d, gsi);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
-    if ( gsi >= hvm_irq->nr_gsis )
+    if ( level <= 0 || gsi >= hvm_irq->nr_gsis )
     {
-        ASSERT_UNREACHABLE();
+        ASSERT(level == 0 && gsi < hvm_irq->nr_gsis);
         return;
     }
 
-- 
2.26.2



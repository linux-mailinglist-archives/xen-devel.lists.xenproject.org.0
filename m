Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAA2CCBE9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 02:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43069.77479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkdtT-0007QF-5u; Thu, 03 Dec 2020 01:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43069.77479; Thu, 03 Dec 2020 01:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkdtT-0007Pc-15; Thu, 03 Dec 2020 01:58:51 +0000
Received: by outflank-mailman (input) for mailman id 43069;
 Thu, 03 Dec 2020 01:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvcX=FH=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kkdtR-0007PF-DT
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 01:58:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c04a0f03-97b9-44fe-ad2b-dab1b271e495;
 Thu, 03 Dec 2020 01:58:48 +0000 (UTC)
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
X-Inumbo-ID: c04a0f03-97b9-44fe-ad2b-dab1b271e495
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606960728;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=xpXNv8lFLeP6swaENV8AzRveAAHRAeWFit3RYlXNouM=;
  b=AUFQR/ptsKzA1KMFj5Rz3kdqq2Y3z6RvkkdZdnQ5gMffrydcuNmSYCKr
   4WuEBbaXaj1nke8BG9iv5RDHjXNyoNeZVSl4j+PC/+zgKvt1JbSTGq6gI
   7X1aYhyjTgwZIERMa6edfCw8fYMSVnvVGo+fVsIonOtvM1ncmWYJBvs67
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HVkxNvIiq6a4s2clRs+HH8oSk97EohkIr13j11evyH4DuYDWiKPQr998784+E2rINRJJ0W5hS0
 WE/0yNecMujb2oUQByIVuAfSvjKFocldevmaBPxynSoBe3CyHmR2iMVb2U9/R/CQ1Zr1ryEtv6
 yOSiwezK8+etdg630vE+D1696juM1XFRiOobKO0SEiso5ot8g5EbtKcYf9KV0pd3BJxS9aOiHa
 7gaJcmUR8St3a0DNtXuw23GV3DKMU3dI2gQ0WqYigpU/Jig9nCNtTsOps31xZ8X5UG/wAyPWW1
 nTM=
X-SBRS: None
X-MesageID: 33596934
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,388,1599537600"; 
   d="scan'208";a="33596934"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<iwj@xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <wl@xen.org>, <roger.pau@citrix.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v2 1/2] x86/IRQ: make max number of guests for a shared IRQ configurable
Date: Thu, 3 Dec 2020 01:58:25 +0000
Message-ID: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

... and increase the default to 16.

Current limit of 7 is too restrictive for modern systems where one GSI
could be shared by potentially many PCI INTx sources where each of them
corresponds to a device passed through to its own guest. Some systems do not
apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
interrupt pin for the majority of PCI devices behind a single router,
resulting in overuse of a GSI.

Introduce a new command line option to configure that limit and dynamically
allocate an array of the necessary size. Set the default size now to 16 which
is higher than 7 but could later be increased even more if necessary.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

Changes in v2:
- introduced a command line option as suggested
- set the default limit to 16 for now

---
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/arch/x86/irq.c                | 19 +++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b4a0d60..f5f230c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1641,6 +1641,15 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
+### irq_max_guests (x86)
+> `= <integer>`
+
+> Default: `16`
+
+Maximum number of guests IRQ could be shared between, i.e. a limit on
+the number of guests it is possible to start each having assigned a device
+sharing a common interrupt line.  Accepts values between 1 and 255.
+
 ### numa (x86)
 > `= on | off | fake=<integer> | noacpi`
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9..5ae9846 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -42,6 +42,10 @@ integer_param("nr_irqs", nr_irqs);
 int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
 custom_param("irq_vector_map", parse_irq_vector_map_param);
 
+/* Max number of guests IRQ could be shared with */
+static unsigned int __read_mostly irq_max_guests;
+integer_param("irq_max_guests", irq_max_guests);
+
 vmask_t global_used_vector_map;
 
 struct irq_desc __read_mostly *irq_desc = NULL;
@@ -435,6 +439,9 @@ int __init init_irq_data(void)
     for ( ; irq < nr_irqs; irq++ )
         irq_to_desc(irq)->irq = irq;
 
+    if ( !irq_max_guests || irq_max_guests > 255)
+        irq_max_guests = 16;
+
 #ifdef CONFIG_PV
     /* Never allocate the hypercall vector or Linux/BSD fast-trap vector. */
     set_bit(LEGACY_SYSCALL_VECTOR, used_vectors);
@@ -1028,7 +1035,6 @@ int __init setup_irq(unsigned int irq, unsigned int irqflags,
  * HANDLING OF GUEST-BOUND PHYSICAL IRQS
  */
 
-#define IRQ_MAX_GUESTS 7
 typedef struct {
     u8 nr_guests;
     u8 in_flight;
@@ -1039,7 +1045,7 @@ typedef struct {
 #define ACKTYPE_EOI    2     /* EOI on the CPU that was interrupted  */
     cpumask_var_t cpu_eoi_map; /* CPUs that need to EOI this interrupt */
     struct timer eoi_timer;
-    struct domain *guest[IRQ_MAX_GUESTS];
+    struct domain *guest[];
 } irq_guest_action_t;
 
 /*
@@ -1564,7 +1570,8 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         if ( newaction == NULL )
         {
             spin_unlock_irq(&desc->lock);
-            if ( (newaction = xmalloc(irq_guest_action_t)) != NULL &&
+            if ( (newaction = xmalloc_bytes(sizeof(irq_guest_action_t) +
+                  irq_max_guests * sizeof(action->guest[0]))) != NULL &&
                  zalloc_cpumask_var(&newaction->cpu_eoi_map) )
                 goto retry;
             xfree(newaction);
@@ -1633,11 +1640,11 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         goto retry;
     }
 
-    if ( action->nr_guests == IRQ_MAX_GUESTS )
+    if ( action->nr_guests == irq_max_guests )
     {
         printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
-               "Already at max share.\n",
-               pirq->pirq, v->domain->domain_id);
+               "Already at max share %u, increase with irq_max_guests= option.\n",
+               pirq->pirq, v->domain->domain_id, irq_max_guests);
         rc = -EBUSY;
         goto unlock_out;
     }
-- 
2.7.4



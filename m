Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746822D0672
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45737.81159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klyRy-00010E-RB; Sun, 06 Dec 2020 18:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45737.81159; Sun, 06 Dec 2020 18:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klyRy-0000zq-Nh; Sun, 06 Dec 2020 18:07:58 +0000
Received: by outflank-mailman (input) for mailman id 45737;
 Sun, 06 Dec 2020 18:07:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZbG=FK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1klyRw-0000zg-Gh
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:07:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 946a5f03-3572-4cb1-900d-f03293bcd297;
 Sun, 06 Dec 2020 18:07:55 +0000 (UTC)
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
X-Inumbo-ID: 946a5f03-3572-4cb1-900d-f03293bcd297
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607278074;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=MQBlZ1unAHl3xhYSGHiFx1nWofa1ttfc/pz0nrz8Db0=;
  b=Fmg3tmX0n1QiDLMXdFUHqFO9XgQiiFvYJLiVYaVYW/f851RZjdtq+eQY
   d+a1rDvdsVjbuw0AYKQQ2OA+CkMSZLYk6fX5ejPzJLzHZKnw5enCk+pF0
   w5QEpfBR0yU7pnWWN1GVo/hzk66R5pTLcByZhfKBbOhYoWDLtd+4xPnx2
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JuzEmUbSliWrhIawRwrK/2vFOaFvg5JFBZDXYUxf66XViuTVgotwRByk/7ZzwKhvA9oNG1szJ8
 8B0i/V812EmqnZiqxKzCmFjWpiTj9LohTm3Nxs448O124n4zXk95gx0WNaoj/omA2j7yVPf5I5
 EQCFgu3scYXcNMdSKi9Zn8KAvmmCOu4CfNwghZx7WvA3EREvmYavy1gS3yh57sXhAlaRWcY2xM
 AzCNIegbylTG+wev7P4dtW1U2+zdaFdp8cFVNYTd7QXkBDVt6zWzaaaAu2rUvDle3XXgrdaZNo
 s9E=
X-SBRS: 5.1
X-MesageID: 32966870
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,397,1599537600"; 
   d="scan'208";a="32966870"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<iwj@xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <wl@xen.org>, <roger.pau@citrix.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v3 1/2] x86/IRQ: make max number of guests for a shared IRQ configurable
Date: Sun, 6 Dec 2020 17:43:06 +0000
Message-ID: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
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
- set initial default limit to 16

Changes in v3:
- changed option name to us - instead of _
- used uchar instead of uint to utilize integer_param overflow handling logic
- used xmalloc_flex_struct
- restructured printk as suggested

---
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/arch/x86/irq.c                | 22 +++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b4a0d60..53e676b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1641,6 +1641,16 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
+### irq-max-guests (x86)
+> `= <integer>`
+
+> Default: `16`
+
+Maximum number of guests any individual IRQ could be shared between,
+i.e. a limit on the number of guests it is possible to start each having
+assigned a device sharing a common interrupt line.  Accepts values between
+1 and 255.
+
 ### numa (x86)
 > `= on | off | fake=<integer> | noacpi`
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9..4fd0578 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -42,6 +42,10 @@ integer_param("nr_irqs", nr_irqs);
 int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
 custom_param("irq_vector_map", parse_irq_vector_map_param);
 
+/* Max number of guests IRQ could be shared with */
+static unsigned char __read_mostly irq_max_guests;
+integer_param("irq-max-guests", irq_max_guests);
+
 vmask_t global_used_vector_map;
 
 struct irq_desc __read_mostly *irq_desc = NULL;
@@ -435,6 +439,9 @@ int __init init_irq_data(void)
     for ( ; irq < nr_irqs; irq++ )
         irq_to_desc(irq)->irq = irq;
 
+    if ( !irq_max_guests )
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
+            if ( (newaction = xmalloc_flex_struct(irq_guest_action_t, guest,
+                                                  irq_max_guests)) != NULL &&
                  zalloc_cpumask_var(&newaction->cpu_eoi_map) )
                 goto retry;
             xfree(newaction);
@@ -1633,11 +1640,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         goto retry;
     }
 
-    if ( action->nr_guests == IRQ_MAX_GUESTS )
+    if ( action->nr_guests == irq_max_guests )
     {
-        printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
-               "Already at max share.\n",
-               pirq->pirq, v->domain->domain_id);
+        printk(XENLOG_G_INFO
+               "Cannot bind IRQ%d to dom%pd: already at max share %u ",
+               pirq->pirq, v->domain, irq_max_guests);
+        printk("(increase with irq-max-guests= option)\n");
         rc = -EBUSY;
         goto unlock_out;
     }
-- 
2.7.4



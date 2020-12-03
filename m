Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829F2CCBE8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 02:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43068.77474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkdtS-0007Pq-VR; Thu, 03 Dec 2020 01:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43068.77474; Thu, 03 Dec 2020 01:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkdtS-0007PP-N7; Thu, 03 Dec 2020 01:58:50 +0000
Received: by outflank-mailman (input) for mailman id 43068;
 Thu, 03 Dec 2020 01:58:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvcX=FH=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kkdtR-0007PG-Ag
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 01:58:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e775cbf0-7adc-46fb-9b14-6f05a26a7c43;
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
X-Inumbo-ID: e775cbf0-7adc-46fb-9b14-6f05a26a7c43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606960728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=81Rw3lZq98mQJyaIkQSLoiys0ZES5ImYdbwUcQDOUUM=;
  b=MJsw8CDw+JS4C8KZAwdh25fwGlMR616zTUq1whLTv/7cZZ4rBaJRSppy
   mIaYA2tZifi+W+hRx5NLOijG6urwJZwCGU8957wSjFt3/yIxC7VSVmYpK
   i67LkoccBLSmcukELsRKoPfUOIFWqfAolHfM8Yu2VjNMPdrA9PxoI7BBQ
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QbsnmMv0btZoWs0MjOnZTuPOXXG4Sau6n2H6oj8ItV0G3cT4fCUauXYIOkTZU9N+h8/8soDNkQ
 LO5oSZ0gddmvSsHxmauHCYgkonA2BQAZgom2HEX5i55utTSe/sozu6bRd6OL4r8qGpzsPUtjqJ
 bLQu8Xp5Cz2vr+lBd0gImyt99IN0NAG2vr98aZfADxjAPj5t8aRpJ2hL640o0Q5KMLnXBnD2Tm
 wpvJz3X2sBr4XnGM71+qdFv/pfF3sknr/Tzlg527B0aWxa/X/uRpYSWqwyp0wabpRLFishOCBa
 G7U=
X-SBRS: None
X-MesageID: 32749603
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,388,1599537600"; 
   d="scan'208";a="32749603"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<iwj@xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <wl@xen.org>, <roger.pau@citrix.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v2 2/2] x86/IRQ: allocate guest array of max size only for shareable IRQs
Date: Thu, 3 Dec 2020 01:58:26 +0000
Message-ID: <1606960706-21274-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
References: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

... and increase default "irq_max_guests" to 32.

It's not necessary to have an array of a size more than 1 for non-shareable
IRQs and it might impact scalability in case of high "irq_max_guests"
values being used - every IRQ in the system including MSIs would be
supplied with an array of that size.

Since it's now less impactful to use higher "irq_max_guests" value - bump
the default to 32. That should give more headroom for future systems.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

New in v2.
This is suggested by Jan and is optional for me.

---
 docs/misc/xen-command-line.pandoc | 2 +-
 xen/arch/x86/irq.c                | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f5f230c..dea2a22 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1644,7 +1644,7 @@ This option is ignored in **pv-shim** mode.
 ### irq_max_guests (x86)
 > `= <integer>`
 
-> Default: `16`
+> Default: `32`
 
 Maximum number of guests IRQ could be shared between, i.e. a limit on
 the number of guests it is possible to start each having assigned a device
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 5ae9846..70b7a53 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -440,7 +440,7 @@ int __init init_irq_data(void)
         irq_to_desc(irq)->irq = irq;
 
     if ( !irq_max_guests || irq_max_guests > 255)
-        irq_max_guests = 16;
+        irq_max_guests = 32;
 
 #ifdef CONFIG_PV
     /* Never allocate the hypercall vector or Linux/BSD fast-trap vector. */
@@ -1540,6 +1540,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
     unsigned int        irq;
     struct irq_desc         *desc;
     irq_guest_action_t *action, *newaction = NULL;
+    unsigned int        max_nr_guests = will_share ? irq_max_guests : 1;
     int                 rc = 0;
 
     WARN_ON(!spin_is_locked(&v->domain->event_lock));
@@ -1571,7 +1572,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         {
             spin_unlock_irq(&desc->lock);
             if ( (newaction = xmalloc_bytes(sizeof(irq_guest_action_t) +
-                  irq_max_guests * sizeof(action->guest[0]))) != NULL &&
+                  max_nr_guests * sizeof(action->guest[0]))) != NULL &&
                  zalloc_cpumask_var(&newaction->cpu_eoi_map) )
                 goto retry;
             xfree(newaction);
@@ -1640,7 +1641,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         goto retry;
     }
 
-    if ( action->nr_guests == irq_max_guests )
+    if ( action->nr_guests == max_nr_guests )
     {
         printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
                "Already at max share %u, increase with irq_max_guests= option.\n",
-- 
2.7.4



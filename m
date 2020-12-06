Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417852D066F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45732.81146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klyPa-0000qY-9O; Sun, 06 Dec 2020 18:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45732.81146; Sun, 06 Dec 2020 18:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klyPa-0000q9-6C; Sun, 06 Dec 2020 18:05:30 +0000
Received: by outflank-mailman (input) for mailman id 45732;
 Sun, 06 Dec 2020 18:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZbG=FK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1klyPY-0000q4-DF
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:05:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2ff1f83-c7cb-4d53-89fa-cd580fa1c340;
 Sun, 06 Dec 2020 18:05:27 +0000 (UTC)
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
X-Inumbo-ID: b2ff1f83-c7cb-4d53-89fa-cd580fa1c340
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607277926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=hPEg/xcTyqwf1mlGpj4j/c1lKeAMXPZhJ+mEGlPUrac=;
  b=POgSskPi3pWHvJYa1YQrjisfGMYSmd618LEbIN4kP5ondjC0bcduSiRN
   M90UEVfXASA7CnXHTSGDhYDDXU1Nu9Mi9hrGOx3CAH6iMigD1E1gMetcD
   d9HtuS2OOMVs+uKdQCx2oNbv/Mkdq40dLBLuExMVbfw+oLgyIZBZFh8Qo
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tv/Uab4Qve+f99T5GDTW5BPOIqiy8je4JaAvyItLKm4NppSbNzyvUXGRS7TtSbsCI9zNztqPZR
 xBq0bqR7FW5emIgLGC4GfpSYceSF8yEl5XG9IZAd079sHA/tytbLxKYChZ/wBnCEXTlhcCFyol
 BpWdztvJayZ/DCIZNyTWs1skxWGEfZGWGokPBxfwInRl5coz+ssk2CvqadfrVU61uIQPs+0WPu
 wm/hWkB3QVti22pKPLrbp+hrypa6ogH8hLp1tPr7q/DCdNtoy+QGN9VwLnfsThmU7HQXe4Fc3u
 UiM=
X-SBRS: 5.1
X-MesageID: 32638347
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,397,1599537600"; 
   d="scan'208";a="32638347"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<iwj@xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <wl@xen.org>, <roger.pau@citrix.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v3 2/2] x86/IRQ: allocate guest array of max size only for shareable IRQs
Date: Sun, 6 Dec 2020 17:43:07 +0000
Message-ID: <1607276587-19231-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
References: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

... and increase default "irq-max-guests" to 32.

It's not necessary to have an array of a size more than 1 for non-shareable
IRQs and it might impact scalability in case of high "irq-max-guests"
values being used - every IRQ in the system including MSIs would be
supplied with an array of that size.

Since it's now less impactful to use higher "irq-max-guests" value - bump
the default to 32. That should give more headroom for future systems.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

New in v2.
Based on Jan's suggestion.

Changes in v3:
- almost none since I prefer the clarity of the code as is

---
 docs/misc/xen-command-line.pandoc | 2 +-
 xen/arch/x86/irq.c                | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 53e676b..f7db2b6 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1644,7 +1644,7 @@ This option is ignored in **pv-shim** mode.
 ### irq-max-guests (x86)
 > `= <integer>`
 
-> Default: `16`
+> Default: `32`
 
 Maximum number of guests any individual IRQ could be shared between,
 i.e. a limit on the number of guests it is possible to start each having
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 4fd0578..a088818 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -440,7 +440,7 @@ int __init init_irq_data(void)
         irq_to_desc(irq)->irq = irq;
 
     if ( !irq_max_guests )
-        irq_max_guests = 16;
+        irq_max_guests = 32;
 
 #ifdef CONFIG_PV
     /* Never allocate the hypercall vector or Linux/BSD fast-trap vector. */
@@ -1540,6 +1540,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
     unsigned int        irq;
     struct irq_desc         *desc;
     irq_guest_action_t *action, *newaction = NULL;
+    unsigned char       max_nr_guests = will_share ? irq_max_guests : 1;
     int                 rc = 0;
 
     WARN_ON(!spin_is_locked(&v->domain->event_lock));
@@ -1571,7 +1572,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         {
             spin_unlock_irq(&desc->lock);
             if ( (newaction = xmalloc_flex_struct(irq_guest_action_t, guest,
-                                                  irq_max_guests)) != NULL &&
+                                                  max_nr_guests)) != NULL &&
                  zalloc_cpumask_var(&newaction->cpu_eoi_map) )
                 goto retry;
             xfree(newaction);
@@ -1640,7 +1641,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
         goto retry;
     }
 
-    if ( action->nr_guests == irq_max_guests )
+    if ( action->nr_guests >= max_nr_guests )
     {
         printk(XENLOG_G_INFO
                "Cannot bind IRQ%d to dom%pd: already at max share %u ",
-- 
2.7.4



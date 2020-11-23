Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D212C0E52
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34599.65752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDM6-0004UE-K3; Mon, 23 Nov 2020 15:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34599.65752; Mon, 23 Nov 2020 15:02:14 +0000
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
	id 1khDM6-0004Tl-Gn; Mon, 23 Nov 2020 15:02:14 +0000
Received: by outflank-mailman (input) for mailman id 34599;
 Mon, 23 Nov 2020 15:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDM5-0004TX-7C
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:02:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6917ec34-258d-44f8-88ca-c337457f2ffb;
 Mon, 23 Nov 2020 15:02:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 490E0ACD5;
 Mon, 23 Nov 2020 15:02:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDM5-0004TX-7C
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:02:13 +0000
X-Inumbo-ID: 6917ec34-258d-44f8-88ca-c337457f2ffb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6917ec34-258d-44f8-88ca-c337457f2ffb;
	Mon, 23 Nov 2020 15:02:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606143731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeXeUubaQzbsqNUm4P0TNbxNAkoVC7iXWI1ErzBtwJE=;
	b=dzc3866MEIqaIwMbKLZTn/m6MGANimcPuL5QcPLiUd3G7HwuHz0uhk0tJGWSvAHKIuDdAL
	aAUDb03z7pKYgH3I0uKsl8GjbpX89iibjeiiyNbq7xdtKVaiBfJrnmjTonsCqYrbsZsU5P
	TtFk4Rgb2odkFb10FCu631gm3dEjZPU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 490E0ACD5;
	Mon, 23 Nov 2020 15:02:11 +0000 (UTC)
Subject: [PATCH v2 2/2] x86/IRQ: reduce casting involved in guest action
 retrieval
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
Message-ID: <2f817015-29f6-a3d5-0a3a-e9f0c91ea1c6@suse.com>
Date: Mon, 23 Nov 2020 16:02:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Introduce a helper function covering both the IRQ_GUEST check and the
cast involved in obtaining the (correctly typed) pointer. Where possible
add const and/or reduce variable scope.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1042,6 +1042,11 @@ typedef struct {
     struct domain *guest[IRQ_MAX_GUESTS];
 } irq_guest_action_t;
 
+static irq_guest_action_t *guest_action(const struct irq_desc *desc)
+{
+    return desc->status & IRQ_GUEST ? (void *)desc->action : NULL;
+}
+
 /*
  * Stack of interrupts awaiting EOI on each CPU. These must be popped in
  * order, as only the current highest-priority pending irq can be EOIed.
@@ -1111,11 +1116,9 @@ static void irq_guest_eoi_timer_fn(void
 
     spin_lock_irq(&desc->lock);
     
-    if ( !(desc->status & IRQ_GUEST) )
+    if ( !(action = guest_action(desc)) )
         goto out;
 
-    action = (irq_guest_action_t *)desc->action;
-
     ASSERT(action->ack_type != ACKTYPE_NONE);
 
     /*
@@ -1351,16 +1354,15 @@ static void flush_ready_eoi(void)
     pending_eoi_sp(peoi) = sp+1;
 }
 
-static void __set_eoi_ready(struct irq_desc *desc)
+static void __set_eoi_ready(const struct irq_desc *desc)
 {
-    irq_guest_action_t *action = (irq_guest_action_t *)desc->action;
+    irq_guest_action_t *action = guest_action(desc);
     struct pending_eoi *peoi = this_cpu(pending_eoi);
     int                 irq, sp;
 
     irq = desc - irq_desc;
 
-    if ( !(desc->status & IRQ_GUEST) ||
-         (action->in_flight != 0) ||
+    if ( !action || action->in_flight ||
          !cpumask_test_and_clear_cpu(smp_processor_id(),
                                      action->cpu_eoi_map) )
         return;
@@ -1400,18 +1402,11 @@ void pirq_guest_eoi(struct pirq *pirq)
 
 void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq)
 {
-    irq_guest_action_t *action;
+    irq_guest_action_t *action = guest_action(desc);
     cpumask_t           cpu_eoi_map;
 
-    if ( !(desc->status & IRQ_GUEST) )
-    {
-        spin_unlock_irq(&desc->lock);
-        return;
-    }
-
-    action = (irq_guest_action_t *)desc->action;
-
-    if ( unlikely(!test_and_clear_bool(pirq->masked)) ||
+    if ( unlikely(!action) ||
+         unlikely(!test_and_clear_bool(pirq->masked)) ||
          unlikely(--action->in_flight != 0) )
     {
         spin_unlock_irq(&desc->lock);
@@ -1510,8 +1505,8 @@ static int irq_acktype(const struct irq_
 
 int pirq_shared(struct domain *d, int pirq)
 {
-    struct irq_desc         *desc;
-    irq_guest_action_t *action;
+    struct irq_desc    *desc;
+    const irq_guest_action_t *action;
     unsigned long       flags;
     int                 shared;
 
@@ -1519,8 +1514,8 @@ int pirq_shared(struct domain *d, int pi
     if ( desc == NULL )
         return 0;
 
-    action = (irq_guest_action_t *)desc->action;
-    shared = ((desc->status & IRQ_GUEST) && (action->nr_guests > 1));
+    action = guest_action(desc);
+    shared = (action && (action->nr_guests > 1));
 
     spin_unlock_irqrestore(&desc->lock, flags);
 
@@ -1544,9 +1539,7 @@ int pirq_guest_bind(struct vcpu *v, stru
         goto out;
     }
 
-    action = (irq_guest_action_t *)desc->action;
-
-    if ( !(desc->status & IRQ_GUEST) )
+    if ( !(action = guest_action(desc)) )
     {
         if ( desc->action != NULL )
         {
@@ -1659,21 +1652,18 @@ int pirq_guest_bind(struct vcpu *v, stru
 static irq_guest_action_t *__pirq_guest_unbind(
     struct domain *d, struct pirq *pirq, struct irq_desc *desc)
 {
-    irq_guest_action_t *action;
+    irq_guest_action_t *action = guest_action(desc);
     cpumask_t           cpu_eoi_map;
     int                 i;
 
-    action = (irq_guest_action_t *)desc->action;
-
     if ( unlikely(action == NULL) )
     {
         dprintk(XENLOG_G_WARNING, "dom%d: pirq %d: desc->action is NULL!\n",
                 d->domain_id, pirq->pirq);
+        BUG_ON(!(desc->status & IRQ_GUEST));
         return NULL;
     }
 
-    BUG_ON(!(desc->status & IRQ_GUEST));
-
     for ( i = 0; (i < action->nr_guests) && (action->guest[i] != d); i++ )
         continue;
     BUG_ON(i == action->nr_guests);
@@ -1793,14 +1783,12 @@ static bool pirq_guest_force_unbind(stru
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
     BUG_ON(desc == NULL);
 
-    if ( !(desc->status & IRQ_GUEST) )
-        goto out;
-
-    action = (irq_guest_action_t *)desc->action;
+    action = guest_action(desc);
     if ( unlikely(action == NULL) )
     {
-        dprintk(XENLOG_G_WARNING, "dom%d: pirq %d: desc->action is NULL!\n",
-            d->domain_id, pirq->pirq);
+        if ( desc->status & IRQ_GUEST )
+            dprintk(XENLOG_G_WARNING, "%pd: pirq %d: desc->action is NULL!\n",
+                    d, pirq->pirq);
         goto out;
     }
 
@@ -1827,7 +1815,7 @@ static bool pirq_guest_force_unbind(stru
 
 static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
 {
-    irq_guest_action_t *action = (irq_guest_action_t *)desc->action;
+    irq_guest_action_t *action = guest_action(desc);
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
@@ -2444,7 +2432,6 @@ static void dump_irqs(unsigned char key)
 {
     int i, irq, pirq;
     struct irq_desc *desc;
-    irq_guest_action_t *action;
     struct domain *d;
     const struct pirq *info;
     unsigned long flags;
@@ -2454,6 +2441,8 @@ static void dump_irqs(unsigned char key)
 
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
+        const irq_guest_action_t *action;
+
         if ( !(irq & 0x1f) )
             process_pending_softirqs();
 
@@ -2473,10 +2462,9 @@ static void dump_irqs(unsigned char key)
         if ( ssid )
             printk("Z=%-25s ", ssid);
 
-        if ( desc->status & IRQ_GUEST )
+        action = guest_action(desc);
+        if ( action )
         {
-            action = (irq_guest_action_t *)desc->action;
-
             printk("in-flight=%d%c",
                    action->in_flight, action->nr_guests ? ' ' : '\n');
 
@@ -2651,17 +2639,15 @@ void fixup_irqs(const cpumask_t *mask, b
 void fixup_eoi(void)
 {
     unsigned int irq, sp;
-    struct irq_desc *desc;
-    irq_guest_action_t *action;
     struct pending_eoi *peoi;
 
     /* Clean up cpu_eoi_map of every interrupt to exclude this CPU. */
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
-        desc = irq_to_desc(irq);
-        if ( !(desc->status & IRQ_GUEST) )
+        irq_guest_action_t *action = guest_action(irq_to_desc(irq));
+
+        if ( !action )
             continue;
-        action = (irq_guest_action_t *)desc->action;
         cpumask_clear_cpu(smp_processor_id(), action->cpu_eoi_map);
     }
 



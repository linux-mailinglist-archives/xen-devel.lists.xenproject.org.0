Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32D2C3E74
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 11:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37536.69956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsOW-00079z-Ri; Wed, 25 Nov 2020 10:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37536.69956; Wed, 25 Nov 2020 10:51:28 +0000
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
	id 1khsOW-00079Z-OY; Wed, 25 Nov 2020 10:51:28 +0000
Received: by outflank-mailman (input) for mailman id 37536;
 Wed, 25 Nov 2020 10:51:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khsOV-00078k-Gm
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2b96b92-b327-40c4-b27a-902de765b199;
 Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B39CDADCD;
 Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khsOV-00078k-Gm
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:27 +0000
X-Inumbo-ID: f2b96b92-b327-40c4-b27a-902de765b199
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f2b96b92-b327-40c4-b27a-902de765b199;
	Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606301484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tg5vf3t7YsP9mKYoN8C2ngq6yNlhQuq9n9e2uzxQXtU=;
	b=mratzSmJHcroCNNvBvMePISXhf44NkOCthoU477BA+ypVbIhdWtxakdvnPAK9gfx7de619
	B+mv4WoerIQ/W134zLIIqPqxrc/B5C5ZSEGvu/f8OWpalwSd9/sU4NLRssvxcZ/pW8ViHZ
	LRRK6f66CRCYrLvTnxaQrJSNA3KCLOw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B39CDADCD;
	Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 2/3] xen/events: rework fifo queue locking
Date: Wed, 25 Nov 2020 11:51:21 +0100
Message-Id: <20201125105122.3650-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201125105122.3650-1-jgross@suse.com>
References: <20201125105122.3650-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two cpus entering evtchn_fifo_set_pending() for the same event channel
can race in case the first one gets interrupted after setting
EVTCHN_FIFO_PENDING and when the other one manages to set
EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
lead to evtchn_check_pollers() being called before the event is put
properly into the queue, resulting eventually in the guest not seeing
the event pending and thus blocking forever afterwards.

Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel
lock") made the race just more obvious, while the fifo event channel
implementation had this race from the beginning when an unmask operation
was running in parallel with an event channel send operation.

Using a spinlock for the per event channel lock is problematic due to
some paths needing to take the lock are called with interrupts off, so
the lock would need to disable interrupts, which in turn breaks some
use cases related to vm events.

For avoiding this race the queue locking in evtchn_fifo_set_pending()
needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too. Additionally when an
event channel needs to change queues both queues need to be locked
initially.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
Fixes: de6acb78bf0e137c ("evtchn: use a per-event channel lock for sending events")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V7:
- new patch

V8:
- update commit message (Jan Beulich)
- update double locking (Jan Beulich)
- add comment (Jan Beulich)
- fix handling when not getting lock (Jan Beulich)
- add const (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_fifo.c | 128 ++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 58 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index f39e61105f..443593c3b3 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -87,38 +87,6 @@ static void evtchn_fifo_init(struct domain *d, struct evtchn *evtchn)
                  d->domain_id, evtchn->port);
 }
 
-static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
-                                                struct evtchn *evtchn,
-                                                unsigned long *flags)
-{
-    struct vcpu *v;
-    struct evtchn_fifo_queue *q, *old_q;
-    unsigned int try;
-    union evtchn_fifo_lastq lastq;
-
-    for ( try = 0; try < 3; try++ )
-    {
-        lastq.raw = read_atomic(&evtchn->fifo_lastq);
-        v = d->vcpu[lastq.last_vcpu_id];
-        old_q = &v->evtchn_fifo->queue[lastq.last_priority];
-
-        spin_lock_irqsave(&old_q->lock, *flags);
-
-        v = d->vcpu[lastq.last_vcpu_id];
-        q = &v->evtchn_fifo->queue[lastq.last_priority];
-
-        if ( old_q == q )
-            return old_q;
-
-        spin_unlock_irqrestore(&old_q->lock, *flags);
-    }
-
-    gprintk(XENLOG_WARNING,
-            "dom%d port %d lost event (too many queue changes)\n",
-            d->domain_id, evtchn->port);
-    return NULL;
-}          
-
 static int try_set_link(event_word_t *word, event_word_t *w, uint32_t link)
 {
     event_word_t new, old;
@@ -190,6 +158,9 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
     event_word_t *word;
     unsigned long flags;
     bool_t was_pending;
+    struct evtchn_fifo_queue *q, *old_q;
+    unsigned int try;
+    bool linked = true;
 
     port = evtchn->port;
     word = evtchn_fifo_word_from_port(d, port);
@@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         return;
     }
 
+    /*
+     * Lock all queues related to the event channel (in case of a queue change
+     * this might be two).
+     * It is mandatory to do that before setting and testing the PENDING bit
+     * and to hold the current queue lock until the event has put into the
+     * list of pending events in order to avoid waking up a guest without the
+     * event being visibly pending in the guest.
+     */
+    for ( try = 0; try < 4; try++ )
+    {
+        union evtchn_fifo_lastq lastq;
+        const struct vcpu *old_v;
+
+        lastq.raw = read_atomic(&evtchn->fifo_lastq);
+        old_v = d->vcpu[lastq.last_vcpu_id];
+
+        q = &v->evtchn_fifo->queue[evtchn->priority];
+        old_q = &old_v->evtchn_fifo->queue[lastq.last_priority];
+
+        if ( q == old_q )
+            spin_lock_irqsave(&q->lock, flags);
+        else if ( q < old_q )
+        {
+            spin_lock_irqsave(&q->lock, flags);
+            spin_lock(&old_q->lock);
+        }
+        else
+        {
+            spin_lock_irqsave(&old_q->lock, flags);
+            spin_lock(&q->lock);
+        }
+
+        lastq.raw = read_atomic(&evtchn->fifo_lastq);
+        old_v = d->vcpu[lastq.last_vcpu_id];
+        if ( q == &v->evtchn_fifo->queue[evtchn->priority] &&
+             old_q == &old_v->evtchn_fifo->queue[lastq.last_priority] )
+            break;
+
+        if ( q != old_q )
+            spin_unlock(&old_q->lock);
+        spin_unlock_irqrestore(&q->lock, flags);
+    }
+
     was_pending = guest_test_and_set_bit(d, EVTCHN_FIFO_PENDING, word);
 
+    /* If we didn't get the lock bail out. */
+    if ( try == 4 )
+    {
+        gprintk(XENLOG_WARNING,
+                "dom%d port %d lost event (too many queue changes)\n",
+                d->domain_id, evtchn->port);
+        goto done;
+    }
+
     /*
      * Link the event if it unmasked and not already linked.
      */
     if ( !guest_test_bit(d, EVTCHN_FIFO_MASKED, word) &&
          !guest_test_bit(d, EVTCHN_FIFO_LINKED, word) )
     {
-        struct evtchn_fifo_queue *q, *old_q;
         event_word_t *tail_word;
-        bool_t linked = 0;
 
         /*
          * Control block not mapped.  The guest must not unmask an
@@ -225,25 +246,11 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         {
             printk(XENLOG_G_WARNING
                    "%pv has no FIFO event channel control block\n", v);
-            goto done;
+            goto unlock;
         }
 
-        /*
-         * No locking around getting the queue. This may race with
-         * changing the priority but we are allowed to signal the
-         * event once on the old priority.
-         */
-        q = &v->evtchn_fifo->queue[evtchn->priority];
-
-        old_q = lock_old_queue(d, evtchn, &flags);
-        if ( !old_q )
-            goto done;
-
         if ( guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
-        {
-            spin_unlock_irqrestore(&old_q->lock, flags);
-            goto done;
-        }
+            goto unlock;
 
         /*
          * If this event was a tail, the old queue is now empty and
@@ -262,8 +269,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
             lastq.last_priority = q->priority;
             write_atomic(&evtchn->fifo_lastq, lastq.raw);
 
-            spin_unlock_irqrestore(&old_q->lock, flags);
-            spin_lock_irqsave(&q->lock, flags);
+            spin_unlock(&old_q->lock);
+            old_q = q;
         }
 
         /*
@@ -276,6 +283,7 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
          * If the queue is empty (i.e., we haven't linked to the new
          * event), head must be updated.
          */
+        linked = false;
         if ( q->tail )
         {
             tail_word = evtchn_fifo_word_from_port(d, q->tail);
@@ -284,15 +292,19 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         if ( !linked )
             write_atomic(q->head, port);
         q->tail = port;
+    }
 
-        spin_unlock_irqrestore(&q->lock, flags);
+ unlock:
+    if ( q != old_q )
+        spin_unlock(&old_q->lock);
+    spin_unlock_irqrestore(&q->lock, flags);
 
-        if ( !linked
-             && !guest_test_and_set_bit(d, q->priority,
-                                        &v->evtchn_fifo->control_block->ready) )
-            vcpu_mark_events_pending(v);
-    }
  done:
+    if ( !linked &&
+         !guest_test_and_set_bit(d, q->priority,
+                                 &v->evtchn_fifo->control_block->ready) )
+        vcpu_mark_events_pending(v);
+
     if ( !was_pending )
         evtchn_check_pollers(d, port);
 }
-- 
2.26.2



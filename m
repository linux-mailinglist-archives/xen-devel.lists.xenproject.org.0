Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA52C1E93
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 08:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35377.66888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khSKB-0001mE-9E; Tue, 24 Nov 2020 07:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35377.66888; Tue, 24 Nov 2020 07:01:15 +0000
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
	id 1khSKB-0001ls-69; Tue, 24 Nov 2020 07:01:15 +0000
Received: by outflank-mailman (input) for mailman id 35377;
 Tue, 24 Nov 2020 07:01:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khSK9-0001kv-BO
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f16b6f2-66de-4860-8df4-aa00258c40a5;
 Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E99DCADD5;
 Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khSK9-0001kv-BO
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:13 +0000
X-Inumbo-ID: 3f16b6f2-66de-4860-8df4-aa00258c40a5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3f16b6f2-66de-4860-8df4-aa00258c40a5;
	Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606201270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yz6J7wdCjuva4czegeT7IAWoCsKh1vZ7NlNUOs0HkPI=;
	b=Ri1obx6a7eZp4WW1J7KUmJbRyO6puXP6b/7u2DmSYjNGeiGGfx3+oXKKljh8zElqbgaWp1
	OVWRG7/iRhdGbZ9kytMy5IbkDc1fVMtpwgnSf43rYs+nmbRXvRefHBag1Ktys+AuPZFHNY
	P+pFkpiB0GwOeK/fYwk42cme8KNBbrs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E99DCADD5;
	Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
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
Subject: [PATCH v7 3/3] xen/events: rework fifo queue locking
Date: Tue, 24 Nov 2020 08:01:06 +0100
Message-Id: <20201124070106.26854-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124070106.26854-1-jgross@suse.com>
References: <20201124070106.26854-1-jgross@suse.com>
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

For avoiding this race the queue locking in evtchn_fifo_set_pending()
needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too. Additionally when an
event channel needs to change queues both queues need to be locked
initially.

Fixes: 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
Fixes: 88910061ec615b2d ("evtchn: add FIFO-based event channel hypercalls and port ops")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_fifo.c | 115 ++++++++++++++++++++--------------------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 79090c04ca..a57d459cc2 100644
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
@@ -204,6 +175,48 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         return;
     }
 
+    for ( try = 0; ; try++ )
+    {
+        union evtchn_fifo_lastq lastq;
+        struct vcpu *old_v;
+
+        lastq.raw = read_atomic(&evtchn->fifo_lastq);
+        old_v = d->vcpu[lastq.last_vcpu_id];
+
+        q = &v->evtchn_fifo->queue[evtchn->priority];
+        old_q = &old_v->evtchn_fifo->queue[lastq.last_priority];
+
+        if ( q <= old_q )
+        {
+            spin_lock_irqsave(&q->lock, flags);
+            if ( q != old_q )
+                spin_lock(&old_q->lock);
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
+
+        if ( try == 3 )
+        {
+            gprintk(XENLOG_WARNING,
+                    "dom%d port %d lost event (too many queue changes)\n",
+                    d->domain_id, evtchn->port);
+            return;
+        }
+    }
+
     was_pending = guest_test_and_set_bit(d, EVTCHN_FIFO_PENDING, word);
 
     /*
@@ -212,9 +225,7 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
     if ( !guest_test_bit(d, EVTCHN_FIFO_MASKED, word) &&
          !guest_test_bit(d, EVTCHN_FIFO_LINKED, word) )
     {
-        struct evtchn_fifo_queue *q, *old_q;
         event_word_t *tail_word;
-        bool_t linked = 0;
 
         /*
          * Control block not mapped.  The guest must not unmask an
@@ -228,22 +239,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
             goto done;
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
             goto done;
-        }
 
         /*
          * If this event was a tail, the old queue is now empty and
@@ -262,8 +259,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
             lastq.last_priority = q->priority;
             write_atomic(&evtchn->fifo_lastq, lastq.raw);
 
-            spin_unlock_irqrestore(&old_q->lock, flags);
-            spin_lock_irqsave(&q->lock, flags);
+            spin_unlock(&old_q->lock);
+            old_q = q;
         }
 
         /*
@@ -276,6 +273,7 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
          * If the queue is empty (i.e., we haven't linked to the new
          * event), head must be updated.
          */
+        linked = false;
         if ( q->tail )
         {
             tail_word = evtchn_fifo_word_from_port(d, q->tail);
@@ -284,15 +282,18 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         if ( !linked )
             write_atomic(q->head, port);
         q->tail = port;
-
-        spin_unlock_irqrestore(&q->lock, flags);
-
-        if ( !linked
-             && !guest_test_and_set_bit(d, q->priority,
-                                        &v->evtchn_fifo->control_block->ready) )
-            vcpu_mark_events_pending(v);
     }
+
  done:
+    if ( q != old_q )
+        spin_unlock(&old_q->lock);
+    spin_unlock_irqrestore(&q->lock, flags);
+
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E92C1E95
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 08:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35379.66912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khSKI-0001qy-TF; Tue, 24 Nov 2020 07:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35379.66912; Tue, 24 Nov 2020 07:01:22 +0000
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
	id 1khSKI-0001qS-Ov; Tue, 24 Nov 2020 07:01:22 +0000
Received: by outflank-mailman (input) for mailman id 35379;
 Tue, 24 Nov 2020 07:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khSKI-0001kq-4R
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d691081d-7325-4f16-9a49-8c4ac1eeac55;
 Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60C81ADAA;
 Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khSKI-0001kq-4R
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:22 +0000
X-Inumbo-ID: d691081d-7325-4f16-9a49-8c4ac1eeac55
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d691081d-7325-4f16-9a49-8c4ac1eeac55;
	Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606201269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEucFGeONQJdQQwxfd3osX/7AAW0Pbr2/fwfaONhMq0=;
	b=dUiEWDaF3N/1coDsYe6Jr8SuU+TPBtmwdsNxCgNq+fnPQaBki8NY0UTBQjD2XRacgs+JPD
	8xWQqvdH26vDPVUS0G1RaeAidD4K7C+eOOFTyyThhOuUvyTUnh94MXG5DbWPSRgL8MpFeG
	E7Mv5c+1/No5wxDNGTAjWizgL0G1wbs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 60C81ADAA;
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
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 1/3] xen/events: access last_priority and last_vcpu_id together
Date: Tue, 24 Nov 2020 08:01:04 +0100
Message-Id: <20201124070106.26854-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124070106.26854-1-jgross@suse.com>
References: <20201124070106.26854-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The queue for a fifo event is depending on the vcpu_id and the
priority of the event. When sending an event it might happen the
event needs to change queues and the old queue needs to be kept for
keeping the links between queue elements intact. For this purpose
the event channel contains last_priority and last_vcpu_id values
elements for being able to identify the old queue.

In order to avoid races always access last_priority and last_vcpu_id
with a single atomic operation avoiding any inconsistencies.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/event_fifo.c | 25 +++++++++++++++++++------
 xen/include/xen/sched.h |  3 +--
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index c6e58d2a1a..79090c04ca 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -42,6 +42,14 @@ struct evtchn_fifo_domain {
     unsigned int num_evtchns;
 };
 
+union evtchn_fifo_lastq {
+    uint32_t raw;
+    struct {
+        uint8_t last_priority;
+        uint16_t last_vcpu_id;
+    };
+};
+
 static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
                                                        unsigned int port)
 {
@@ -86,16 +94,18 @@ static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
     struct vcpu *v;
     struct evtchn_fifo_queue *q, *old_q;
     unsigned int try;
+    union evtchn_fifo_lastq lastq;
 
     for ( try = 0; try < 3; try++ )
     {
-        v = d->vcpu[evtchn->last_vcpu_id];
-        old_q = &v->evtchn_fifo->queue[evtchn->last_priority];
+        lastq.raw = read_atomic(&evtchn->fifo_lastq);
+        v = d->vcpu[lastq.last_vcpu_id];
+        old_q = &v->evtchn_fifo->queue[lastq.last_priority];
 
         spin_lock_irqsave(&old_q->lock, *flags);
 
-        v = d->vcpu[evtchn->last_vcpu_id];
-        q = &v->evtchn_fifo->queue[evtchn->last_priority];
+        v = d->vcpu[lastq.last_vcpu_id];
+        q = &v->evtchn_fifo->queue[lastq.last_priority];
 
         if ( old_q == q )
             return old_q;
@@ -246,8 +256,11 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         /* Moved to a different queue? */
         if ( old_q != q )
         {
-            evtchn->last_vcpu_id = v->vcpu_id;
-            evtchn->last_priority = q->priority;
+            union evtchn_fifo_lastq lastq = { };
+
+            lastq.last_vcpu_id = v->vcpu_id;
+            lastq.last_priority = q->priority;
+            write_atomic(&evtchn->fifo_lastq, lastq.raw);
 
             spin_unlock_irqrestore(&old_q->lock, flags);
             spin_lock_irqsave(&q->lock, flags);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 7251b3ae3e..a345cc01f8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -117,8 +117,7 @@ struct evtchn
 #ifndef NDEBUG
     u8 old_state;      /* State when taking lock in write mode. */
 #endif
-    u8 last_priority;
-    u16 last_vcpu_id;
+    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
 #ifdef CONFIG_XSM
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
-- 
2.26.2



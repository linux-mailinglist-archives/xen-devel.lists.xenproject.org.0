Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F529039D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7889.20827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTNRe-0005tH-Bu; Fri, 16 Oct 2020 10:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7889.20827; Fri, 16 Oct 2020 10:58:46 +0000
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
	id 1kTNRe-0005ss-7w; Fri, 16 Oct 2020 10:58:46 +0000
Received: by outflank-mailman (input) for mailman id 7889;
 Fri, 16 Oct 2020 10:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTNRc-0005rv-Kl
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 075dc980-4a36-40c8-ab3d-39aca8adcbe4;
 Fri, 16 Oct 2020 10:58:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAA7DAD63;
 Fri, 16 Oct 2020 10:58:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTNRc-0005rv-Kl
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:44 +0000
X-Inumbo-ID: 075dc980-4a36-40c8-ab3d-39aca8adcbe4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 075dc980-4a36-40c8-ab3d-39aca8adcbe4;
	Fri, 16 Oct 2020 10:58:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602845922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PiaK/obgiTv0XRvqmFG9GqAISyxz4e5B/+qnu8lyy8=;
	b=ifARsuR09pu3ja6qReJpPDQA/5SsLNTgOlFQf4OCyEhKgdRLziNBAOvipfOzCGygq0ReE0
	b1JP2WgcHPtbeBtwpMhNPLKtC+CTcUaVdMiAa3WhzUr8+WpM0nRAVN0ZKHm78Y/cQh5U7L
	ZjcjIRgljUqeTDxVZAvvn8HNPULiEMU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BAA7DAD63;
	Fri, 16 Oct 2020 10:58:42 +0000 (UTC)
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
Subject: [PATCH v3 1/2] xen/events: access last_priority and last_vcpu_id together
Date: Fri, 16 Oct 2020 12:58:38 +0200
Message-Id: <20201016105839.14796-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016105839.14796-1-jgross@suse.com>
References: <20201016105839.14796-1-jgross@suse.com>
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
---
 xen/common/event_fifo.c | 25 +++++++++++++++++++------
 xen/include/xen/sched.h |  3 +--
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index fc189152e1..2f4e8c54fc 100644
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
index d8ed83f869..a298ff4df8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -114,8 +114,7 @@ struct evtchn
         u16 virq;      /* state == ECS_VIRQ */
     } u;
     u8 priority;
-    u8 last_priority;
-    u16 last_vcpu_id;
+    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
 #ifdef CONFIG_XSM
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
-- 
2.26.2



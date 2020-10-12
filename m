Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527428B186
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 11:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5837.15207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRu7S-0006yk-4Y; Mon, 12 Oct 2020 09:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5837.15207; Mon, 12 Oct 2020 09:27:50 +0000
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
	id 1kRu7S-0006y8-0f; Mon, 12 Oct 2020 09:27:50 +0000
Received: by outflank-mailman (input) for mailman id 5837;
 Mon, 12 Oct 2020 09:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRu7R-0006v7-5D
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:27:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce4a0cf1-0c20-4fd9-a0e5-c366bb5c8c81;
 Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 144FBB11D;
 Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRu7R-0006v7-5D
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:27:49 +0000
X-Inumbo-ID: ce4a0cf1-0c20-4fd9-a0e5-c366bb5c8c81
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce4a0cf1-0c20-4fd9-a0e5-c366bb5c8c81;
	Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602494863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPhjpyUu4X5OZjRKFYIDjthAXEM4EfUzY2ak6MXL0XA=;
	b=CHYbaBd+EOnDuJN04BBWMP38vzVbnNn2SsJIYp9QWkMv9h0LWO0/0f3f1DBQsXNRpgHZbW
	MJUtU8NXucDeJUFCN9zfBRmcluWw2yLd4ZkRjKCkIf2/h8hf1GPCxLjUj7J5r1cNbH+Zcm
	RuyKJ+7z8y1RVSAa9vwmVFzTSyfVjZc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 144FBB11D;
	Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
Date: Mon, 12 Oct 2020 11:27:40 +0200
Message-Id: <20201012092740.1617-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012092740.1617-1-jgross@suse.com>
References: <20201012092740.1617-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the lock for a single event channel needs to be taken with
interrupts off, which causes deadlocks in some cases.

Rework the per event channel lock to be non-blocking for the case of
sending an event and removing the need for disabling interrupts for
taking the lock.

The lock is needed for avoiding races between sending an event or
querying the channel's state against removal of the event channel.

Use a locking scheme similar to a rwlock, but with some modifications:

- sending an event or querying the event channel's state uses an
  operation similar to read_trylock(), in case of not obtaining the
  lock the sending is omitted or a default state is returned

- closing an event channel is similar to write_lock(), but without
  real fairness regarding multiple writers (this saves some space in
  the event channel structure and multiple writers are impossible as
  closing an event channel requires the domain's event_lock to be
  held).

With this locking scheme it is mandatory that a writer will always
either start with an unbound or free event channel or will end with
an unbound or free event channel, as otherwise the reaction of a reader
not getting the lock would be wrong.

Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- added needed barriers
---
 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 109 +++++++++++++++++--------------------
 xen/include/xen/event.h    |  56 ++++++++++++++++---
 xen/include/xen/sched.h    |   2 +-
 5 files changed, 106 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 93c4fb9a79..77290032f5 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2495,14 +2495,12 @@ static void dump_irqs(unsigned char key)
                 pirq = domain_irq_to_pirq(d, irq);
                 info = pirq_info(d, pirq);
                 evtchn = evtchn_from_port(d, info->evtchn);
-                local_irq_disable();
-                if ( spin_trylock(&evtchn->lock) )
+                if ( evtchn_tryread_lock(evtchn) )
                 {
                     pending = evtchn_is_pending(d, evtchn);
                     masked = evtchn_is_masked(d, evtchn);
-                    spin_unlock(&evtchn->lock);
+                    evtchn_read_unlock(evtchn);
                 }
-                local_irq_enable();
                 printk("d%d:%3d(%c%c%c)%c",
                        d->domain_id, pirq, "-P?"[pending],
                        "-M?"[masked], info->masked ? 'M' : '-',
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 9aef7a860a..3734250bf7 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -660,11 +660,12 @@ void pv_shim_inject_evtchn(unsigned int port)
     if ( port_is_valid(guest, port) )
     {
         struct evtchn *chn = evtchn_from_port(guest, port);
-        unsigned long flags;
 
-        spin_lock_irqsave(&chn->lock, flags);
-        evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
-        spin_unlock_irqrestore(&chn->lock, flags);
+        if ( evtchn_tryread_lock(chn) )
+        {
+            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
+            evtchn_read_unlock(chn);
+        }
     }
 }
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index e365b5498f..398a1e7aa0 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -131,7 +131,7 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
             return NULL;
         }
         chn[i].port = port + i;
-        spin_lock_init(&chn[i].lock);
+        atomic_set(&chn[i].lock, 0);
     }
     return chn;
 }
@@ -253,7 +253,6 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
     int            port;
     domid_t        dom = alloc->dom;
     long           rc;
-    unsigned long  flags;
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
@@ -269,14 +268,14 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
     if ( rc )
         goto out;
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state = ECS_UNBOUND;
     if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
         chn->u.unbound.remote_domid = current->domain->domain_id;
     evtchn_port_init(d, chn);
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     alloc->port = port;
 
@@ -289,32 +288,26 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 }
 
 
-static unsigned long double_evtchn_lock(struct evtchn *lchn,
-                                        struct evtchn *rchn)
+static void double_evtchn_lock(struct evtchn *lchn, struct evtchn *rchn)
 {
-    unsigned long flags;
-
     if ( lchn <= rchn )
     {
-        spin_lock_irqsave(&lchn->lock, flags);
+        evtchn_write_lock(lchn);
         if ( lchn != rchn )
-            spin_lock(&rchn->lock);
+            evtchn_write_lock(rchn);
     }
     else
     {
-        spin_lock_irqsave(&rchn->lock, flags);
-        spin_lock(&lchn->lock);
+        evtchn_write_lock(rchn);
+        evtchn_write_lock(lchn);
     }
-
-    return flags;
 }
 
-static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn,
-                                 unsigned long flags)
+static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
 {
     if ( lchn != rchn )
-        spin_unlock(&lchn->lock);
-    spin_unlock_irqrestore(&rchn->lock, flags);
+        evtchn_write_unlock(lchn);
+    evtchn_write_unlock(rchn);
 }
 
 static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
@@ -324,7 +317,6 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
     int            lport, rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
     long           rc;
-    unsigned long  flags;
 
     if ( rdom == DOMID_SELF )
         rdom = current->domain->domain_id;
@@ -360,7 +352,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
     if ( rc )
         goto out;
 
-    flags = double_evtchn_lock(lchn, rchn);
+    double_evtchn_lock(lchn, rchn);
 
     lchn->u.interdomain.remote_dom  = rd;
     lchn->u.interdomain.remote_port = rport;
@@ -377,7 +369,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
      */
     evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
 
-    double_evtchn_unlock(lchn, rchn, flags);
+    double_evtchn_unlock(lchn, rchn);
 
     bind->local_port = lport;
 
@@ -400,7 +392,6 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     struct domain *d = current->domain;
     int            virq = bind->virq, vcpu = bind->vcpu;
     int            rc = 0;
-    unsigned long  flags;
 
     if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
         return -EINVAL;
@@ -438,14 +429,14 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
 
     chn = evtchn_from_port(d, port);
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state          = ECS_VIRQ;
     chn->notify_vcpu_id = vcpu;
     chn->u.virq         = virq;
     evtchn_port_init(d, chn);
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     v->virq_to_evtchn[virq] = bind->port = port;
 
@@ -462,7 +453,6 @@ static long evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
     struct domain *d = current->domain;
     int            port, vcpu = bind->vcpu;
     long           rc = 0;
-    unsigned long  flags;
 
     if ( domain_vcpu(d, vcpu) == NULL )
         return -ENOENT;
@@ -474,13 +464,13 @@ static long evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
 
     chn = evtchn_from_port(d, port);
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state          = ECS_IPI;
     chn->notify_vcpu_id = vcpu;
     evtchn_port_init(d, chn);
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     bind->port = port;
 
@@ -524,7 +514,6 @@ static long evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     struct pirq   *info;
     int            port = 0, pirq = bind->pirq;
     long           rc;
-    unsigned long  flags;
 
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
@@ -557,14 +546,14 @@ static long evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
         goto out;
     }
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state  = ECS_PIRQ;
     chn->u.pirq.irq = pirq;
     link_pirq_port(port, chn, v);
     evtchn_port_init(d, chn);
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     bind->port = port;
 
@@ -585,7 +574,6 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
     struct evtchn *chn1, *chn2;
     int            port2;
     long           rc = 0;
-    unsigned long  flags;
 
  again:
     spin_lock(&d1->event_lock);
@@ -686,14 +674,14 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         BUG_ON(chn2->state != ECS_INTERDOMAIN);
         BUG_ON(chn2->u.interdomain.remote_dom != d1);
 
-        flags = double_evtchn_lock(chn1, chn2);
+        double_evtchn_lock(chn1, chn2);
 
         evtchn_free(d1, chn1);
 
         chn2->state = ECS_UNBOUND;
         chn2->u.unbound.remote_domid = d1->domain_id;
 
-        double_evtchn_unlock(chn1, chn2, flags);
+        double_evtchn_unlock(chn1, chn2);
 
         goto out;
 
@@ -701,9 +689,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         BUG();
     }
 
-    spin_lock_irqsave(&chn1->lock, flags);
+    evtchn_write_lock(chn1);
     evtchn_free(d1, chn1);
-    spin_unlock_irqrestore(&chn1->lock, flags);
+    evtchn_write_unlock(chn1);
 
  out:
     if ( d2 != NULL )
@@ -723,7 +711,6 @@ int evtchn_send(struct domain *ld, unsigned int lport)
     struct evtchn *lchn, *rchn;
     struct domain *rd;
     int            rport, ret = 0;
-    unsigned long  flags;
 
     if ( !port_is_valid(ld, lport) )
         return -EINVAL;
@@ -736,7 +723,8 @@ int evtchn_send(struct domain *ld, unsigned int lport)
 
     lchn = evtchn_from_port(ld, lport);
 
-    spin_lock_irqsave(&lchn->lock, flags);
+    if ( !evtchn_tryread_lock(lchn) )
+        return 0;
 
     /* Guest cannot send via a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(lchn)) )
@@ -771,7 +759,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
     }
 
 out:
-    spin_unlock_irqrestore(&lchn->lock, flags);
+    evtchn_read_unlock(lchn);
 
     return ret;
 }
@@ -798,9 +786,11 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
 
     d = v->domain;
     chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
-    evtchn_port_set_pending(d, v->vcpu_id, chn);
-    spin_unlock(&chn->lock);
+    if ( evtchn_tryread_lock(chn) )
+    {
+        evtchn_port_set_pending(d, v->vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -829,9 +819,11 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
         goto out;
 
     chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
-    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-    spin_unlock(&chn->lock);
+    if ( evtchn_tryread_lock(chn) )
+    {
+        evtchn_port_set_pending(d, v->vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -841,7 +833,6 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
 {
     int port;
     struct evtchn *chn;
-    unsigned long flags;
 
     /*
      * PV guests: It should not be possible to race with __evtchn_close(). The
@@ -856,9 +847,11 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
     }
 
     chn = evtchn_from_port(d, port);
-    spin_lock_irqsave(&chn->lock, flags);
-    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-    spin_unlock_irqrestore(&chn->lock, flags);
+    if ( evtchn_tryread_lock(chn) )
+    {
+        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 }
 
 static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
@@ -1060,15 +1053,16 @@ int evtchn_unmask(unsigned int port)
 {
     struct domain *d = current->domain;
     struct evtchn *evtchn;
-    unsigned long flags;
 
     if ( unlikely(!port_is_valid(d, port)) )
         return -EINVAL;
 
     evtchn = evtchn_from_port(d, port);
-    spin_lock_irqsave(&evtchn->lock, flags);
-    evtchn_port_unmask(d, evtchn);
-    spin_unlock_irqrestore(&evtchn->lock, flags);
+    if ( evtchn_tryread_lock(evtchn) )
+    {
+        evtchn_port_unmask(d, evtchn);
+        evtchn_read_unlock(evtchn);
+    }
 
     return 0;
 }
@@ -1327,7 +1321,6 @@ int alloc_unbound_xen_event_channel(
 {
     struct evtchn *chn;
     int            port, rc;
-    unsigned long  flags;
 
     spin_lock(&ld->event_lock);
 
@@ -1340,14 +1333,14 @@ int alloc_unbound_xen_event_channel(
     if ( rc )
         goto out;
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state = ECS_UNBOUND;
     chn->xen_consumer = get_xen_consumer(notification_fn);
     chn->notify_vcpu_id = lvcpu;
     chn->u.unbound.remote_domid = remote_domid;
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     /*
      * Increment ->xen_evtchns /after/ ->active_evtchns. No explicit
@@ -1383,7 +1376,6 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
 {
     struct evtchn *lchn, *rchn;
     struct domain *rd;
-    unsigned long flags;
 
     if ( !port_is_valid(ld, lport) )
     {
@@ -1398,7 +1390,8 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
 
     lchn = evtchn_from_port(ld, lport);
 
-    spin_lock_irqsave(&lchn->lock, flags);
+    if ( !evtchn_tryread_lock(lchn) )
+        return;
 
     if ( likely(lchn->state == ECS_INTERDOMAIN) )
     {
@@ -1408,7 +1401,7 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
         evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
     }
 
-    spin_unlock_irqrestore(&lchn->lock, flags);
+    evtchn_read_unlock(lchn);
 }
 
 void evtchn_check_pollers(struct domain *d, unsigned int port)
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 509d3ae861..39a93f7556 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -105,6 +105,45 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
 #define bucket_from_port(d, p) \
     ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
 
+#define EVENT_WRITE_LOCK_INC    MAX_VIRT_CPUS
+static inline void evtchn_write_lock(struct evtchn *evtchn)
+{
+    int val;
+
+    /* No barrier needed, atomic_add_return() is full barrier. */
+    for ( val = atomic_add_return(EVENT_WRITE_LOCK_INC, &evtchn->lock);
+          val != EVENT_WRITE_LOCK_INC;
+          val = atomic_read(&evtchn->lock) )
+        cpu_relax();
+}
+
+static inline void evtchn_write_unlock(struct evtchn *evtchn)
+{
+    arch_lock_release_barrier();
+
+    atomic_sub(EVENT_WRITE_LOCK_INC, &evtchn->lock);
+}
+
+static inline bool evtchn_tryread_lock(struct evtchn *evtchn)
+{
+    if ( atomic_read(&evtchn->lock) >= EVENT_WRITE_LOCK_INC )
+        return false;
+
+    /* No barrier needed, atomic_inc_return() is full barrier. */
+    if ( atomic_inc_return(&evtchn->lock) < EVENT_WRITE_LOCK_INC )
+        return true;
+
+    atomic_dec(&evtchn->lock);
+    return false;
+}
+
+static inline void evtchn_read_unlock(struct evtchn *evtchn)
+{
+    arch_lock_release_barrier();
+
+    atomic_dec(&evtchn->lock);
+}
+
 static inline unsigned int max_evtchns(const struct domain *d)
 {
     return d->evtchn_fifo ? EVTCHN_FIFO_NR_CHANNELS
@@ -249,12 +288,11 @@ static inline bool evtchn_is_masked(const struct domain *d,
 static inline bool evtchn_port_is_masked(struct domain *d, evtchn_port_t port)
 {
     struct evtchn *evtchn = evtchn_from_port(d, port);
-    bool rc;
-    unsigned long flags;
+    bool rc = true;
 
-    spin_lock_irqsave(&evtchn->lock, flags);
-    rc = evtchn_is_masked(d, evtchn);
-    spin_unlock_irqrestore(&evtchn->lock, flags);
+    if ( evtchn_tryread_lock(evtchn) )
+        rc = evtchn_is_masked(d, evtchn);
+    evtchn_read_unlock(evtchn);
 
     return rc;
 }
@@ -274,12 +312,12 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
     if ( port_is_valid(d, port) )
     {
         struct evtchn *evtchn = evtchn_from_port(d, port);
-        unsigned long flags;
 
-        spin_lock_irqsave(&evtchn->lock, flags);
-        if ( evtchn_usable(evtchn) )
+        if ( evtchn_tryread_lock(evtchn) && evtchn_usable(evtchn) )
+        {
             rc = evtchn_is_pending(d, evtchn);
-        spin_unlock_irqrestore(&evtchn->lock, flags);
+            evtchn_read_unlock(evtchn);
+        }
     }
 
     return rc;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a298ff4df8..096e0ec6af 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -85,7 +85,7 @@ extern domid_t hardware_domid;
 
 struct evtchn
 {
-    spinlock_t lock;
+    atomic_t lock;         /* kind of rwlock, use evtchn_*_[un]lock()        */
 #define ECS_FREE         0 /* Channel is available for use.                  */
 #define ECS_RESERVED     1 /* Channel is reserved.                           */
 #define ECS_UNBOUND      2 /* Channel is waiting to bind to a remote domain. */
-- 
2.26.2



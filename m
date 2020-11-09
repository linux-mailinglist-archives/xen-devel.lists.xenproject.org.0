Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB22AC111
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 17:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22721.49142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcABh-0000zZ-R3; Mon, 09 Nov 2020 16:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22721.49142; Mon, 09 Nov 2020 16:38:37 +0000
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
	id 1kcABh-0000ye-J6; Mon, 09 Nov 2020 16:38:37 +0000
Received: by outflank-mailman (input) for mailman id 22721;
 Mon, 09 Nov 2020 16:38:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcABg-0000vD-HK
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92da756d-819c-4ff9-883c-5d9172814c7c;
 Mon, 09 Nov 2020 16:38:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79FB2AD0F;
 Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcABg-0000vD-HK
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:36 +0000
X-Inumbo-ID: 92da756d-819c-4ff9-883c-5d9172814c7c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 92da756d-819c-4ff9-883c-5d9172814c7c;
	Mon, 09 Nov 2020 16:38:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604939909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zA2xJswA/ZiZycp0tBhOJN4sbHBbwAVz3EYB9fQC5Xw=;
	b=i5LB/RS0DMA2RLw7ZpEoGG04PunrSQBzWvQTssLI5OmCcuvvu7HuPpKEH9bmpEr0PgwXFi
	Ngv+nGZDsRuRtsk1MoYi6t9fVk+L1iLgE1EFV8huyEHVXXbV5+0rZ+TmyvSAYrW1/MUemQ
	+caAUpSJ6ypDa8BRtoIWXY6rGMCL8Fw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79FB2AD0F;
	Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
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
Subject: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
Date: Mon,  9 Nov 2020 17:38:25 +0100
Message-Id: <20201109163826.13035-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109163826.13035-1-jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the lock for a single event channel needs to be taken with
interrupts off, which causes deadlocks in some cases.

Rework the per event channel lock to be non-blocking for the case of
sending an event and removing the need for disabling interrupts for
taking the lock.

The lock is needed for avoiding races between event channel state
changes (creation, closing, binding) against normal operations (set
pending, [un]masking, priority changes).

Use a rwlock, but with some restrictions:

- Changing the state of an event channel (creation, closing, binding)
  needs to use write_lock(), with ASSERT()ing that the lock is taken as
  writer only when the state of the event channel is either before or
  after the locked region appropriate (either free or unbound).

- Sending an event needs to use read_trylock() mostly, in case of not
  obtaining the lock the operation is omitted. This is needed as
  sending an event can happen with interrupts off (at least in some
  cases).

- Dumping the event channel state for debug purposes is using
  read_trylock(), too, in order to avoid blocking in case the lock is
  taken as writer for a long time.

- All other cases can use read_lock().

Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- switch to rwlock
- add ASSERT() to verify correct write_lock() usage

V3:
- corrected a copy-and-paste error (Jan Beulich)
- corrected unlocking in two cases (Jan Beulich)
- renamed evtchn_read_trylock() (Jan Beulich)
- added some comments and an ASSERT() for evtchn_write_lock()
- set EVENT_WRITE_LOCK_INC to INT_MIN

V2:
- added needed barriers

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 138 +++++++++++++++++++++----------------
 xen/include/xen/event.h    |  29 ++++++--
 xen/include/xen/sched.h    |   5 +-
 5 files changed, 112 insertions(+), 75 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 93c4fb9a79..8d1f9a9fc6 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2495,14 +2495,12 @@ static void dump_irqs(unsigned char key)
                 pirq = domain_irq_to_pirq(d, irq);
                 info = pirq_info(d, pirq);
                 evtchn = evtchn_from_port(d, info->evtchn);
-                local_irq_disable();
-                if ( spin_trylock(&evtchn->lock) )
+                if ( evtchn_read_trylock(evtchn) )
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
index 9aef7a860a..b4e83e0778 100644
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
+        if ( evtchn_read_trylock(chn) )
+        {
+            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
+            evtchn_read_unlock(chn);
+        }
     }
 }
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index cd4a2c0501..43e3520df6 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -50,6 +50,29 @@
 
 #define consumer_is_xen(e) (!!(e)->xen_consumer)
 
+/*
+ * Lock an event channel exclusively. This is allowed only when the channel is
+ * free or unbound either when taking or when releasing the lock, as any
+ * concurrent operation on the event channel using evtchn_read_trylock() will
+ * just assume the event channel is free or unbound at the moment when the
+ * evtchn_read_trylock() returns false.
+ */
+static inline void evtchn_write_lock(struct evtchn *evtchn)
+{
+    write_lock(&evtchn->lock);
+
+    evtchn->old_state = evtchn->state;
+}
+
+static inline void evtchn_write_unlock(struct evtchn *evtchn)
+{
+    /* Enforce lock discipline. */
+    ASSERT(evtchn->old_state == ECS_FREE || evtchn->old_state == ECS_UNBOUND ||
+           evtchn->state == ECS_FREE || evtchn->state == ECS_UNBOUND);
+
+    write_unlock(&evtchn->lock);
+}
+
 /*
  * The function alloc_unbound_xen_event_channel() allows an arbitrary
  * notifier function to be specified. However, very few unique functions
@@ -133,7 +156,7 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
             return NULL;
         }
         chn[i].port = port + i;
-        spin_lock_init(&chn[i].lock);
+        rwlock_init(&chn[i].lock);
     }
     return chn;
 }
@@ -255,7 +278,6 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
     int            port;
     domid_t        dom = alloc->dom;
     long           rc;
-    unsigned long  flags;
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
@@ -271,14 +293,14 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
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
 
@@ -291,32 +313,26 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
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
@@ -326,7 +342,6 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
     int            lport, rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
     long           rc;
-    unsigned long  flags;
 
     if ( rdom == DOMID_SELF )
         rdom = current->domain->domain_id;
@@ -362,7 +377,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
     if ( rc )
         goto out;
 
-    flags = double_evtchn_lock(lchn, rchn);
+    double_evtchn_lock(lchn, rchn);
 
     lchn->u.interdomain.remote_dom  = rd;
     lchn->u.interdomain.remote_port = rport;
@@ -379,7 +394,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
      */
     evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
 
-    double_evtchn_unlock(lchn, rchn, flags);
+    double_evtchn_unlock(lchn, rchn);
 
     bind->local_port = lport;
 
@@ -402,7 +417,6 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     struct domain *d = current->domain;
     int            virq = bind->virq, vcpu = bind->vcpu;
     int            rc = 0;
-    unsigned long  flags;
 
     if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
         return -EINVAL;
@@ -440,14 +454,14 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
 
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
 
@@ -464,7 +478,6 @@ static long evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
     struct domain *d = current->domain;
     int            port, vcpu = bind->vcpu;
     long           rc = 0;
-    unsigned long  flags;
 
     if ( domain_vcpu(d, vcpu) == NULL )
         return -ENOENT;
@@ -476,13 +489,13 @@ static long evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
 
     chn = evtchn_from_port(d, port);
 
-    spin_lock_irqsave(&chn->lock, flags);
+    evtchn_write_lock(chn);
 
     chn->state          = ECS_IPI;
     chn->notify_vcpu_id = vcpu;
     evtchn_port_init(d, chn);
 
-    spin_unlock_irqrestore(&chn->lock, flags);
+    evtchn_write_unlock(chn);
 
     bind->port = port;
 
@@ -526,7 +539,6 @@ static long evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     struct pirq   *info;
     int            port = 0, pirq = bind->pirq;
     long           rc;
-    unsigned long  flags;
 
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
@@ -559,14 +571,14 @@ static long evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
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
 
@@ -587,7 +599,6 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
     struct evtchn *chn1, *chn2;
     int            port2;
     long           rc = 0;
-    unsigned long  flags;
 
  again:
     spin_lock(&d1->event_lock);
@@ -688,14 +699,14 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
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
 
@@ -703,9 +714,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         BUG();
     }
 
-    spin_lock_irqsave(&chn1->lock, flags);
+    evtchn_write_lock(chn1);
     evtchn_free(d1, chn1);
-    spin_unlock_irqrestore(&chn1->lock, flags);
+    evtchn_write_unlock(chn1);
 
  out:
     if ( d2 != NULL )
@@ -725,7 +736,6 @@ int evtchn_send(struct domain *ld, unsigned int lport)
     struct evtchn *lchn, *rchn;
     struct domain *rd;
     int            rport, ret = 0;
-    unsigned long  flags;
 
     if ( !port_is_valid(ld, lport) )
         return -EINVAL;
@@ -738,7 +748,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
 
     lchn = evtchn_from_port(ld, lport);
 
-    spin_lock_irqsave(&lchn->lock, flags);
+    evtchn_read_lock(lchn);
 
     /* Guest cannot send via a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(lchn)) )
@@ -773,7 +783,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
     }
 
 out:
-    spin_unlock_irqrestore(&lchn->lock, flags);
+    evtchn_read_unlock(lchn);
 
     return ret;
 }
@@ -806,9 +816,11 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
 
     d = v->domain;
     chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
-    evtchn_port_set_pending(d, v->vcpu_id, chn);
-    spin_unlock(&chn->lock);
+    if ( evtchn_read_trylock(chn) )
+    {
+        evtchn_port_set_pending(d, v->vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -837,9 +849,11 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
         goto out;
 
     chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
-    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-    spin_unlock(&chn->lock);
+    if ( evtchn_read_trylock(chn) )
+    {
+        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -849,7 +863,6 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
 {
     int port;
     struct evtchn *chn;
-    unsigned long flags;
 
     /*
      * PV guests: It should not be possible to race with __evtchn_close(). The
@@ -864,9 +877,11 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
     }
 
     chn = evtchn_from_port(d, port);
-    spin_lock_irqsave(&chn->lock, flags);
-    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-    spin_unlock_irqrestore(&chn->lock, flags);
+    if ( evtchn_read_trylock(chn) )
+    {
+        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
+        evtchn_read_unlock(chn);
+    }
 }
 
 static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
@@ -1068,15 +1083,17 @@ int evtchn_unmask(unsigned int port)
 {
     struct domain *d = current->domain;
     struct evtchn *evtchn;
-    unsigned long flags;
 
     if ( unlikely(!port_is_valid(d, port)) )
         return -EINVAL;
 
     evtchn = evtchn_from_port(d, port);
-    spin_lock_irqsave(&evtchn->lock, flags);
+
+    evtchn_read_lock(evtchn);
+
     evtchn_port_unmask(d, evtchn);
-    spin_unlock_irqrestore(&evtchn->lock, flags);
+
+    evtchn_read_unlock(evtchn);
 
     return 0;
 }
@@ -1156,15 +1173,17 @@ static long evtchn_set_priority(const struct evtchn_set_priority *set_priority)
     unsigned int port = set_priority->port;
     struct evtchn *chn;
     long ret;
-    unsigned long flags;
 
     if ( !port_is_valid(d, port) )
         return -EINVAL;
 
     chn = evtchn_from_port(d, port);
-    spin_lock_irqsave(&chn->lock, flags);
+
+    evtchn_read_lock(chn);
+
     ret = evtchn_port_set_priority(d, chn, set_priority->priority);
-    spin_unlock_irqrestore(&chn->lock, flags);
+
+    evtchn_read_unlock(chn);
 
     return ret;
 }
@@ -1332,7 +1351,6 @@ int alloc_unbound_xen_event_channel(
 {
     struct evtchn *chn;
     int            port, rc;
-    unsigned long  flags;
 
     spin_lock(&ld->event_lock);
 
@@ -1345,14 +1363,14 @@ int alloc_unbound_xen_event_channel(
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
@@ -1388,7 +1406,6 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
 {
     struct evtchn *lchn, *rchn;
     struct domain *rd;
-    unsigned long flags;
 
     if ( !port_is_valid(ld, lport) )
     {
@@ -1403,7 +1420,8 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
 
     lchn = evtchn_from_port(ld, lport);
 
-    spin_lock_irqsave(&lchn->lock, flags);
+    if ( !evtchn_read_trylock(lchn) )
+        return;
 
     if ( likely(lchn->state == ECS_INTERDOMAIN) )
     {
@@ -1413,7 +1431,7 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
         evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
     }
 
-    spin_unlock_irqrestore(&lchn->lock, flags);
+    evtchn_read_unlock(lchn);
 }
 
 void evtchn_check_pollers(struct domain *d, unsigned int port)
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 2ed4be78f6..a0a85cdda8 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -105,6 +105,21 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
 #define bucket_from_port(d, p) \
     ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
 
+static inline void evtchn_read_lock(struct evtchn *evtchn)
+{
+    read_lock(&evtchn->lock);
+}
+
+static inline bool evtchn_read_trylock(struct evtchn *evtchn)
+{
+    return read_trylock(&evtchn->lock);
+}
+
+static inline void evtchn_read_unlock(struct evtchn *evtchn)
+{
+    read_unlock(&evtchn->lock);
+}
+
 static inline bool_t port_is_valid(struct domain *d, unsigned int p)
 {
     if ( p >= read_atomic(&d->valid_evtchns) )
@@ -235,11 +250,12 @@ static inline bool evtchn_port_is_masked(struct domain *d, evtchn_port_t port)
 {
     struct evtchn *evtchn = evtchn_from_port(d, port);
     bool rc;
-    unsigned long flags;
 
-    spin_lock_irqsave(&evtchn->lock, flags);
+    evtchn_read_lock(evtchn);
+
     rc = evtchn_is_masked(d, evtchn);
-    spin_unlock_irqrestore(&evtchn->lock, flags);
+
+    evtchn_read_unlock(evtchn);
 
     return rc;
 }
@@ -252,12 +268,13 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
     if ( port_is_valid(d, port) )
     {
         struct evtchn *evtchn = evtchn_from_port(d, port);
-        unsigned long flags;
 
-        spin_lock_irqsave(&evtchn->lock, flags);
+        evtchn_read_lock(evtchn);
+
         if ( evtchn_usable(evtchn) )
             rc = evtchn_is_pending(d, evtchn);
-        spin_unlock_irqrestore(&evtchn->lock, flags);
+
+        evtchn_read_unlock(evtchn);
     }
 
     return rc;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a298ff4df8..66d8f058be 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -85,7 +85,7 @@ extern domid_t hardware_domid;
 
 struct evtchn
 {
-    spinlock_t lock;
+    rwlock_t lock;
 #define ECS_FREE         0 /* Channel is available for use.                  */
 #define ECS_RESERVED     1 /* Channel is reserved.                           */
 #define ECS_UNBOUND      2 /* Channel is waiting to bind to a remote domain. */
@@ -114,6 +114,9 @@ struct evtchn
         u16 virq;      /* state == ECS_VIRQ */
     } u;
     u8 priority;
+#ifndef NDEBUG
+    u8 old_state;      /* State when taking lock in write mode. */
+#endif
     u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
 #ifdef CONFIG_XSM
     union {
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A8293E55
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9667.25420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsLq-00020y-R0; Tue, 20 Oct 2020 14:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9667.25420; Tue, 20 Oct 2020 14:10:58 +0000
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
	id 1kUsLq-00020Y-O0; Tue, 20 Oct 2020 14:10:58 +0000
Received: by outflank-mailman (input) for mailman id 9667;
 Tue, 20 Oct 2020 14:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsLp-00020L-7E
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:10:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8ab37ee-23aa-4929-9bc3-89900844491d;
 Tue, 20 Oct 2020 14:10:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EBC7AC6A;
 Tue, 20 Oct 2020 14:10:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsLp-00020L-7E
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:10:57 +0000
X-Inumbo-ID: d8ab37ee-23aa-4929-9bc3-89900844491d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d8ab37ee-23aa-4929-9bc3-89900844491d;
	Tue, 20 Oct 2020 14:10:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603203055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htCKeLk050dUSTPkbNMbWkMtxwQVWeeYQPtwH2yDG7s=;
	b=XQDD2rgF+nL8IETAnhFBJqQXLoRjN5PBxYjw/Z+puWmois3/RhdAXqzeqFefDZDN69dJHc
	sEPPhn3rLphXG9K1Nv28fWAh2QnJQ4+NHu3T8fSJGDYXQuQmKTPQYsxlWRPPQcfLvsFgze
	QZqX5ENS4U9nIt4RIxpb6Gm/str1lac=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2EBC7AC6A;
	Tue, 20 Oct 2020 14:10:55 +0000 (UTC)
Subject: [PATCH v2 6/8] evtchn: convert vIRQ lock to an r/w one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <53a2fc39-1bf1-38ce-bbdf-b512c5279b4f@suse.com>
Date: Tue, 20 Oct 2020 16:10:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need to serialize all sending of vIRQ-s; all that's needed
is serialization against the closing of the respective event channels
(so far by means of a barrier). To facilitate the conversion, switch to
an ordinary write locked region in evtchn_close().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't introduce/use rw_barrier() here. Add comment to
    evtchn_bind_virq(). Re-base.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -160,7 +160,7 @@ struct vcpu *vcpu_create(struct domain *
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
-    spin_lock_init(&v->virq_lock);
+    rwlock_init(&v->virq_lock);
 
     tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
 
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -449,6 +449,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
 
     spin_unlock_irqrestore(&chn->lock, flags);
 
+    /*
+     * If by any, the update of virq_to_evtchn[] would need guarding by
+     * virq_lock, but since this is the last action here, there's no strict
+     * need to acquire the lock. Hnece holding event_lock isn't helpful
+     * anymore at this point, but utilize that its unlocking acts as the
+     * otherwise necessary smp_wmb() here.
+     */
     v->virq_to_evtchn[virq] = bind->port = port;
 
  out:
@@ -638,10 +645,10 @@ int evtchn_close(struct domain *d1, int
     case ECS_VIRQ:
         for_each_vcpu ( d1, v )
         {
-            if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
-                continue;
-            v->virq_to_evtchn[chn1->u.virq] = 0;
-            spin_barrier(&v->virq_lock);
+            write_lock_irqsave(&v->virq_lock, flags);
+            if ( v->virq_to_evtchn[chn1->u.virq] == port1 )
+                v->virq_to_evtchn[chn1->u.virq] = 0;
+            write_unlock_irqrestore(&v->virq_lock, flags);
         }
         break;
 
@@ -797,7 +804,7 @@ void send_guest_vcpu_virq(struct vcpu *v
 
     ASSERT(!virq_is_global(virq));
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = v->virq_to_evtchn[virq];
     if ( unlikely(port == 0) )
@@ -807,7 +814,7 @@ void send_guest_vcpu_virq(struct vcpu *v
     evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_global_virq(struct domain *d, uint32_t virq)
@@ -826,7 +833,7 @@ void send_guest_global_virq(struct domai
     if ( unlikely(v == NULL) )
         return;
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = v->virq_to_evtchn[virq];
     if ( unlikely(port == 0) )
@@ -836,7 +843,7 @@ void send_guest_global_virq(struct domai
     evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_pirq(struct domain *d, const struct pirq *pirq)
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -235,7 +235,7 @@ struct vcpu
 
     /* IRQ-safe virq_lock protects against delivering VIRQ to stale evtchn. */
     evtchn_port_t    virq_to_evtchn[NR_VIRQS];
-    spinlock_t       virq_lock;
+    rwlock_t         virq_lock;
 
     /* Tasklet for continue_hypercall_on_cpu(). */
     struct tasklet   continue_hypercall_tasklet;



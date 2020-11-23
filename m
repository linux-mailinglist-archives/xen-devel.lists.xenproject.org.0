Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB42C0A6C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34288.65224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBte-0007kd-9O; Mon, 23 Nov 2020 13:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34288.65224; Mon, 23 Nov 2020 13:28:46 +0000
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
	id 1khBte-0007kE-6O; Mon, 23 Nov 2020 13:28:46 +0000
Received: by outflank-mailman (input) for mailman id 34288;
 Mon, 23 Nov 2020 13:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBtc-0007k0-Ty
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1efc338a-1c06-4c6c-b64a-8e394327c95a;
 Mon, 23 Nov 2020 13:28:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4089EACC6;
 Mon, 23 Nov 2020 13:28:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBtc-0007k0-Ty
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:44 +0000
X-Inumbo-ID: 1efc338a-1c06-4c6c-b64a-8e394327c95a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1efc338a-1c06-4c6c-b64a-8e394327c95a;
	Mon, 23 Nov 2020 13:28:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2CaRag6/oUqYllh9jVd06ZD4oOB0HabLrsdZBZjXfs=;
	b=koWTdlgvz4DaO2jfk3SOuhmqC1wZ9ssswhghaExLgcbamSKMFK7KHqaiIZuaBDIML+5ZpJ
	f/JWg62SDspsjzxd2s0574g2S9PSEuff+9DkVPmlvnw1Z5NO1fRkMAU4wc52WvJTg1iefG
	AuERTJ6ZiQmbcNZ6k8AAUuWsgNIfAxA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4089EACC6;
	Mon, 23 Nov 2020 13:28:43 +0000 (UTC)
Subject: [PATCH v3 3/5] evtchn: convert vIRQ lock to an r/w one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Message-ID: <d2461bd6-fb2f-447f-11c6-bd8afd573d7b@suse.com>
Date: Mon, 23 Nov 2020 14:28:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need to serialize all sending of vIRQ-s; all that's needed
is serialization against the closing of the respective event channels
(so far by means of a barrier). To facilitate the conversion, switch to
an ordinary write locked region in evtchn_close().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base over added new earlier patch.
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
@@ -475,6 +475,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
     evtchn_write_unlock(chn);
 
     bind->port = port;
+    /*
+     * If by any, the update of virq_to_evtchn[] would need guarding by
+     * virq_lock, but since this is the last action here, there's no strict
+     * need to acquire the lock. Hence holding event_lock isn't helpful
+     * anymore at this point, but utilize that its unlocking acts as the
+     * otherwise necessary smp_wmb() here.
+     */
     write_atomic(&v->virq_to_evtchn[virq], port);
 
  out:
@@ -661,10 +668,12 @@ int evtchn_close(struct domain *d1, int
     case ECS_VIRQ:
         for_each_vcpu ( d1, v )
         {
-            if ( read_atomic(&v->virq_to_evtchn[chn1->u.virq]) != port1 )
-                continue;
-            write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
-            spin_barrier(&v->virq_lock);
+            unsigned long flags;
+
+            write_lock_irqsave(&v->virq_lock, flags);
+            if ( read_atomic(&v->virq_to_evtchn[chn1->u.virq]) == port1 )
+                write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
+            write_unlock_irqrestore(&v->virq_lock, flags);
         }
         break;
 
@@ -813,7 +822,7 @@ void send_guest_vcpu_virq(struct vcpu *v
 
     ASSERT(!virq_is_global(virq));
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = read_atomic(&v->virq_to_evtchn[virq]);
     if ( unlikely(port == 0) )
@@ -823,7 +832,7 @@ void send_guest_vcpu_virq(struct vcpu *v
     evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_global_virq(struct domain *d, uint32_t virq)
@@ -842,7 +851,7 @@ void send_guest_global_virq(struct domai
     if ( unlikely(v == NULL) )
         return;
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = read_atomic(&v->virq_to_evtchn[virq]);
     if ( unlikely(port == 0) )
@@ -852,7 +861,7 @@ void send_guest_global_virq(struct domai
     evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_pirq(struct domain *d, const struct pirq *pirq)
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -238,7 +238,7 @@ struct vcpu
 
     /* IRQ-safe virq_lock protects against delivering VIRQ to stale evtchn. */
     evtchn_port_t    virq_to_evtchn[NR_VIRQS];
-    spinlock_t       virq_lock;
+    rwlock_t         virq_lock;
 
     /* Tasklet for continue_hypercall_on_cpu(). */
     struct tasklet   continue_hypercall_tasklet;



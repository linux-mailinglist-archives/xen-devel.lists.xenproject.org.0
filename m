Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713B27AC62
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqux-0005oz-PA; Mon, 28 Sep 2020 11:02:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMquw-0005oq-Os
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:02:02 +0000
X-Inumbo-ID: b7436e7f-fa02-4ee2-aefa-6a33848f9953
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7436e7f-fa02-4ee2-aefa-6a33848f9953;
 Mon, 28 Sep 2020 11:02:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eNVqXwgS1BNCxawrz6W6Me07pTESeUHMUnTZhjOhss=;
 b=a2b8fPSun+tjg695SoOs9cuQix3wc49GlgI1DNezAa1JNCyyOZKGs/3hGVZu7TLcX7fI3w
 ZIue0jIIX2RiT3A0UF2rTG9q0SSlKgMTcI3GTl4gBDr2g0L2I3D+8xuFQt3fv52ZuIrGz4
 GGmPAn7AA4qAv54txKdNsjKvv3nb9sY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1489EAE07;
 Mon, 28 Sep 2020 11:02:01 +0000 (UTC)
Subject: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
Date: Mon, 28 Sep 2020 13:02:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's no need to serialize all sending of vIRQ-s; all that's needed
is serialization against the closing of the respective event channels
(by means of a barrier). To facilitate the conversion, introduce a new
rw_barrier().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -640,7 +640,7 @@ int evtchn_close(struct domain *d1, int
             if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
                 continue;
             v->virq_to_evtchn[chn1->u.virq] = 0;
-            spin_barrier(&v->virq_lock);
+            rw_barrier(&v->virq_lock);
         }
         break;
 
@@ -794,7 +794,7 @@ void send_guest_vcpu_virq(struct vcpu *v
 
     ASSERT(!virq_is_global(virq));
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = v->virq_to_evtchn[virq];
     if ( unlikely(port == 0) )
@@ -807,7 +807,7 @@ void send_guest_vcpu_virq(struct vcpu *v
     spin_unlock(&chn->lock);
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_global_virq(struct domain *d, uint32_t virq)
@@ -826,7 +826,7 @@ void send_guest_global_virq(struct domai
     if ( unlikely(v == NULL) )
         return;
 
-    spin_lock_irqsave(&v->virq_lock, flags);
+    read_lock_irqsave(&v->virq_lock, flags);
 
     port = v->virq_to_evtchn[virq];
     if ( unlikely(port == 0) )
@@ -838,7 +838,7 @@ void send_guest_global_virq(struct domai
     spin_unlock(&chn->lock);
 
  out:
-    spin_unlock_irqrestore(&v->virq_lock, flags);
+    read_unlock_irqrestore(&v->virq_lock, flags);
 }
 
 void send_guest_pirq(struct domain *d, const struct pirq *pirq)
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -2,7 +2,7 @@
 #include <xen/irq.h>
 #include <xen/smp.h>
 #include <xen/time.h>
-#include <xen/spinlock.h>
+#include <xen/rwlock.h>
 #include <xen/guest_access.h>
 #include <xen/preempt.h>
 #include <public/sysctl.h>
@@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
     }
 }
 
+void _rw_barrier(rwlock_t *lock)
+{
+    check_barrier(&lock->lock.debug);
+    do { smp_mb(); } while ( _rw_is_locked(lock) );
+}
+
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 struct lock_profile_anc {
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -237,6 +237,8 @@ static inline int _rw_is_write_locked(rw
     return (atomic_read(&lock->cnts) & _QW_WMASK) == _QW_LOCKED;
 }
 
+void _rw_barrier(rwlock_t *lock);
+
 #define read_lock(l)                  _read_lock(l)
 #define read_lock_irq(l)              _read_lock_irq(l)
 #define read_lock_irqsave(l, f)                                 \
@@ -266,6 +268,7 @@ static inline int _rw_is_write_locked(rw
 #define rw_is_locked(l)               _rw_is_locked(l)
 #define rw_is_write_locked(l)         _rw_is_write_locked(l)
 
+#define rw_barrier(l)                 _rw_barrier(l)
 
 typedef struct percpu_rwlock percpu_rwlock_t;
 
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -235,7 +235,7 @@ struct vcpu
 
     /* IRQ-safe virq_lock protects against delivering VIRQ to stale evtchn. */
     evtchn_port_t    virq_to_evtchn[NR_VIRQS];
-    spinlock_t       virq_lock;
+    rwlock_t         virq_lock;
 
     /* Tasklet for continue_hypercall_on_cpu(). */
     struct tasklet   continue_hypercall_tasklet;



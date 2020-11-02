Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25632A2B48
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 14:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17642.42414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZZdd-0007sK-Jd; Mon, 02 Nov 2020 13:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17642.42414; Mon, 02 Nov 2020 13:12:45 +0000
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
	id 1kZZdd-0007rn-GF; Mon, 02 Nov 2020 13:12:45 +0000
Received: by outflank-mailman (input) for mailman id 17642;
 Mon, 02 Nov 2020 13:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZZdb-0007rK-JQ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:12:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7b84fdd6-28e7-4f23-99b9-3f92f0a91a01;
 Mon, 02 Nov 2020 13:12:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A637B8EF;
 Mon,  2 Nov 2020 13:12:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZZdb-0007rK-JQ
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:12:43 +0000
X-Inumbo-ID: 7b84fdd6-28e7-4f23-99b9-3f92f0a91a01
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 7b84fdd6-28e7-4f23-99b9-3f92f0a91a01;
	Mon, 02 Nov 2020 13:12:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604322762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2Y6gfqjASfLX10Wg8Pwm6fRGu9Jh/ZF1PVmHXzkWYQ=;
	b=cuMWbktmuNjtb+fskPzMG61Ak3K97IFTgVS0UmXBlIfcAqmAhOslXS4IA33CvaVGOmLxoK
	Mx8W/FwYYFQ/KevfCJcYeV8NbEI96j8SDjsBgez/NcwqqYlVcrOtTPmjDfMqBXT+CHdJsX
	PK1BwVR3wN5wuB8OXjduqWcYKgvb1Ak=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A637B8EF;
	Mon,  2 Nov 2020 13:12:42 +0000 (UTC)
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
Subject: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
Date: Mon,  2 Nov 2020 14:12:39 +0100
Message-Id: <20201102131239.14134-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102131239.14134-1-jgross@suse.com>
References: <20201102131239.14134-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checking whether a lock is consistently used regarding interrupts on
or off is beneficial for rwlocks, too.

So add check_lock() calls to rwlock functions. For this purpose make
check_lock() globally accessible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- call check_lock() unconditionally in try_lock variants (Jan Beulich)
---
 xen/common/spinlock.c      |  3 +--
 xen/include/xen/rwlock.h   | 11 +++++++++++
 xen/include/xen/spinlock.h |  2 ++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index b4aaf6bce6..405322c6b8 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -13,7 +13,7 @@
 
 static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
 
-static void check_lock(union lock_debug *debug, bool try)
+void check_lock(union lock_debug *debug, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
 
@@ -108,7 +108,6 @@ void spin_debug_disable(void)
 
 #else /* CONFIG_DEBUG_LOCKS */
 
-#define check_lock(l, t) ((void)0)
 #define check_barrier(l) ((void)0)
 #define got_lock(l) ((void)0)
 #define rel_lock(l) ((void)0)
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 427664037a..94496a0f53 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -56,6 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
     u32 cnts;
 
     preempt_disable();
+    check_lock(&lock->lock.debug, true);
     cnts = atomic_read(&lock->cnts);
     if ( likely(_can_read_lock(cnts)) )
     {
@@ -66,6 +67,7 @@ static inline int _read_trylock(rwlock_t *lock)
          */
         if ( likely(_can_read_lock(cnts)) )
             return 1;
+
         atomic_sub(_QR_BIAS, &lock->cnts);
     }
     preempt_enable();
@@ -87,7 +89,10 @@ static inline void _read_lock(rwlock_t *lock)
      * arch_lock_acquire_barrier().
      */
     if ( likely(_can_read_lock(cnts)) )
+    {
+        check_lock(&lock->lock.debug, false);
         return;
+    }
 
     /* The slowpath will decrement the reader count, if necessary. */
     queue_read_lock_slowpath(lock);
@@ -162,7 +167,10 @@ static inline void _write_lock(rwlock_t *lock)
      * arch_lock_acquire_barrier().
      */
     if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
+    {
+        check_lock(&lock->lock.debug, false);
         return;
+    }
 
     queue_write_lock_slowpath(lock);
     /*
@@ -197,6 +205,7 @@ static inline int _write_trylock(rwlock_t *lock)
     u32 cnts;
 
     preempt_disable();
+    check_lock(&lock->lock.debug, true);
     cnts = atomic_read(&lock->cnts);
     if ( unlikely(cnts) ||
          unlikely(atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) != 0) )
@@ -328,6 +337,8 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
         /* Drop the read lock because we don't need it anymore. */
         read_unlock(&percpu_rwlock->rwlock);
     }
+    else
+        check_lock(&percpu_rwlock->rwlock.lock.debug, false);
 }
 
 static inline void _percpu_read_unlock(percpu_rwlock_t **per_cpudata,
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca13b600a0..9fa4e600c1 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -21,11 +21,13 @@ union lock_debug {
     };
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
+void check_lock(union lock_debug *debug, bool try);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
 #define _LOCK_DEBUG { }
+#define check_lock(l, t) ((void)0)
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
-- 
2.26.2



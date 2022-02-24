Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962B4C29EC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278152.475308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBlm-0000yC-Ri; Thu, 24 Feb 2022 10:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278152.475308; Thu, 24 Feb 2022 10:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBlm-0000wL-O1; Thu, 24 Feb 2022 10:54:46 +0000
Received: by outflank-mailman (input) for mailman id 278152;
 Thu, 24 Feb 2022 10:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNBlk-0000gJ-Pv
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:54:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bebc759-9560-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:54:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1A5121136;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68F2713A79;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CI5gGPJjF2L2SQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Feb 2022 10:54:42 +0000
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
X-Inumbo-ID: 2bebc759-9560-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645700082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojjdlGbMc95KyfFklDt/mHMPcKnQ5SgYlPEfROv8euA=;
	b=FZ3VVQKQ9N5KZGY3CNBPoQN1p/zbYprrswdaoV6yeJORXSDKet60wfyv/NQpmwX8+bE9Np
	FeX9q0eH6FZN39XM9nDMkzizWXCYN7kr/xxMr0KmfHZ4mSu3tt5nvZT2sNXslubpJrO11N
	jKpjcXsuem5DcyfXfNoKB5FOTEvCMEo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen/spinlock: use lock address for lock debug functions
Date: Thu, 24 Feb 2022 11:54:35 +0100
Message-Id: <20220224105436.1480-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224105436.1480-1-jgross@suse.com>
References: <20220224105436.1480-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of only passing the lock_debug address to check_lock() et al
use the address of the spinlock.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/spinlock.c      | 34 +++++++++++++++++-----------------
 xen/include/xen/rwlock.h   | 10 +++++-----
 xen/include/xen/spinlock.h | 10 ++++++++--
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 62c83aaa6a..53d6ab6853 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -13,7 +13,7 @@
 
 static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
 
-void check_lock(union lock_debug *debug, bool try)
+void check_lock(spinlock_t *lock, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
 
@@ -49,12 +49,12 @@ void check_lock(union lock_debug *debug, bool try)
     if ( try && irq_safe )
         return;
 
-    if ( unlikely(debug->irq_safe != irq_safe) )
+    if ( unlikely(lock->debug.irq_safe != irq_safe) )
     {
         union lock_debug seen, new = { 0 };
 
         new.irq_safe = irq_safe;
-        seen.val = cmpxchg(&debug->val, LOCK_DEBUG_INITVAL, new.val);
+        seen.val = cmpxchg(&lock->debug.val, LOCK_DEBUG_INITVAL, new.val);
 
         if ( !seen.unseen && seen.irq_safe == !irq_safe )
         {
@@ -65,7 +65,7 @@ void check_lock(union lock_debug *debug, bool try)
     }
 }
 
-static void check_barrier(union lock_debug *debug)
+static void check_barrier(spinlock_t *lock)
 {
     if ( unlikely(atomic_read(&spin_debug) <= 0) )
         return;
@@ -81,19 +81,19 @@ static void check_barrier(union lock_debug *debug)
      * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
      * is clearly wrong, for the same reason outlined in check_lock() above.
      */
-    BUG_ON(!local_irq_is_enabled() && !debug->irq_safe);
+    BUG_ON(!local_irq_is_enabled() && !lock->debug.irq_safe);
 }
 
-static void got_lock(union lock_debug *debug)
+static void got_lock(spinlock_t *lock)
 {
-    debug->cpu = smp_processor_id();
+    lock->debug.cpu = smp_processor_id();
 }
 
-static void rel_lock(union lock_debug *debug)
+static void rel_lock(spinlock_t *lock)
 {
     if ( atomic_read(&spin_debug) > 0 )
-        BUG_ON(debug->cpu != smp_processor_id());
-    debug->cpu = SPINLOCK_NO_CPU;
+        BUG_ON(lock->debug.cpu != smp_processor_id());
+    lock->debug.cpu = SPINLOCK_NO_CPU;
 }
 
 void spin_debug_enable(void)
@@ -164,7 +164,7 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR;
 
-    check_lock(&lock->debug, false);
+    check_lock(lock, false);
     preempt_disable();
     tickets.head_tail = arch_fetch_and_add(&lock->tickets.head_tail,
                                            tickets.head_tail);
@@ -176,7 +176,7 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
         arch_lock_relax();
     }
     arch_lock_acquire_barrier();
-    got_lock(&lock->debug);
+    got_lock(lock);
     LOCK_PROFILE_GOT;
 }
 
@@ -204,7 +204,7 @@ unsigned long _spin_lock_irqsave(spinlock_t *lock)
 void _spin_unlock(spinlock_t *lock)
 {
     LOCK_PROFILE_REL;
-    rel_lock(&lock->debug);
+    rel_lock(lock);
     arch_lock_release_barrier();
     add_sized(&lock->tickets.head, 1);
     arch_lock_signal();
@@ -240,7 +240,7 @@ int _spin_trylock(spinlock_t *lock)
     spinlock_tickets_t old, new;
 
     preempt_disable();
-    check_lock(&lock->debug, true);
+    check_lock(lock, true);
     old = observe_lock(&lock->tickets);
     if ( old.head != old.tail )
     {
@@ -259,7 +259,7 @@ int _spin_trylock(spinlock_t *lock)
      * cmpxchg() is a full barrier so no need for an
      * arch_lock_acquire_barrier().
      */
-    got_lock(&lock->debug);
+    got_lock(lock);
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     if (lock->profile)
         lock->profile->time_locked = NOW();
@@ -274,7 +274,7 @@ void _spin_barrier(spinlock_t *lock)
     s_time_t block = NOW();
 #endif
 
-    check_barrier(&lock->debug);
+    check_barrier(lock);
     smp_mb();
     sample = observe_lock(&lock->tickets);
     if ( sample.head != sample.tail )
@@ -300,7 +300,7 @@ int _spin_trylock_recursive(spinlock_t *lock)
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
-    check_lock(&lock->debug, true);
+    check_lock(lock, true);
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 0cc9167715..188fc809dc 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -56,7 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
     u32 cnts;
 
     preempt_disable();
-    check_lock(&lock->lock.debug, true);
+    check_lock(&lock->lock, true);
     cnts = atomic_read(&lock->cnts);
     if ( likely(_can_read_lock(cnts)) )
     {
@@ -90,7 +90,7 @@ static inline void _read_lock(rwlock_t *lock)
     if ( likely(_can_read_lock(cnts)) )
     {
         /* The slow path calls check_lock() via spin_lock(). */
-        check_lock(&lock->lock.debug, false);
+        check_lock(&lock->lock, false);
         return;
     }
 
@@ -169,7 +169,7 @@ static inline void _write_lock(rwlock_t *lock)
     if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
     {
         /* The slow path calls check_lock() via spin_lock(). */
-        check_lock(&lock->lock.debug, false);
+        check_lock(&lock->lock, false);
         return;
     }
 
@@ -206,7 +206,7 @@ static inline int _write_trylock(rwlock_t *lock)
     u32 cnts;
 
     preempt_disable();
-    check_lock(&lock->lock.debug, true);
+    check_lock(&lock->lock, true);
     cnts = atomic_read(&lock->cnts);
     if ( unlikely(cnts) ||
          unlikely(atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) != 0) )
@@ -341,7 +341,7 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
     else
     {
         /* All other paths have implicit check_lock() calls via read_lock(). */
-        check_lock(&percpu_rwlock->rwlock.lock.debug, false);
+        check_lock(&percpu_rwlock->rwlock.lock, false);
     }
 }
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 961891bea4..5b6b73732f 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -21,13 +21,11 @@ union lock_debug {
     };
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
-void check_lock(union lock_debug *debug, bool try);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
 #define _LOCK_DEBUG { }
-#define check_lock(l, t) ((void)0)
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
@@ -189,6 +187,14 @@ int _spin_trylock_recursive(spinlock_t *lock);
 void _spin_lock_recursive(spinlock_t *lock);
 void _spin_unlock_recursive(spinlock_t *lock);
 
+#ifdef CONFIG_DEBUG_LOCKS
+void check_lock(spinlock_t *lock, bool try);
+#else
+static inline void check_lock(spinlock_t *lock, bool try)
+{
+}
+#endif
+
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
 #define spin_lock_irq(l)              _spin_lock_irq(l)
-- 
2.34.1



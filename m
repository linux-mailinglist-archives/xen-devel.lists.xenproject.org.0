Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF15B4760
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404809.647420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kL-0005Eh-6N; Sat, 10 Sep 2022 15:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404809.647420; Sat, 10 Sep 2022 15:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kL-0005Bd-33; Sat, 10 Sep 2022 15:50:17 +0000
Received: by outflank-mailman (input) for mailman id 404809;
 Sat, 10 Sep 2022 15:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oX2kJ-0004BJ-5f
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:50:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424092a1-3120-11ed-9760-273f2230c3a0;
 Sat, 10 Sep 2022 17:50:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C07BC22033;
 Sat, 10 Sep 2022 15:50:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F72113441;
 Sat, 10 Sep 2022 15:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xUPdHTWyHGNoZAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 10 Sep 2022 15:50:13 +0000
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
X-Inumbo-ID: 424092a1-3120-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662825013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kww+P6/XyomSMqUmxNBEe2RQmOU2q/zA4hDRZaLZnr0=;
	b=jO9o5enxEgzbp+rDcM8wyj6qXdr3ETnN0plv8mu81kEud6L5zAdWNbweOIdnZmWBNFc/tm
	9lpF9YoVdlFmvemJVp72Q2KUgI8bctjewD+G6rxLuUV4n7pYiCGpkxsH0NWzJwdj36EbKa
	FFaD2bF2P90kT/C/b4xpHKPdea/60V0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from normal ones
Date: Sat, 10 Sep 2022 17:49:58 +0200
Message-Id: <20220910154959.15971-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220910154959.15971-1-jgross@suse.com>
References: <20220910154959.15971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recursive and normal spinlocks are sharing the same data structure for
representation of the lock. This has two major disadvantages:

- it is not clear from the definition of a lock, whether it is intended
  to be used recursive or not, while a mixture of both usage variants
  needs to be

- in production builds (builds without CONFIG_DEBUG_LOCKS) the needed
  data size of an ordinary spinlock is 8 bytes instead of 4, due to the
  additional recursion data needed (associated with that the rwlock
  data is using 12 instead of only 8 bytes)

Fix that by introducing a struct spinlock_recursive for recursive
spinlocks only, and switch recursive spinlock functions to require
pointers to this new struct.

This allows to check the correct usage at build time.

The sizes per lock will change:

lock type              debug build     non-debug build
                        old   new        old   new
spinlock                 8     8          8     4
recursive spinlock       8    12          8     8
rwlock                  12    12         12     8

So the only downside is an increase for recursive spinlocks in debug
builds, while in non-debug builds especially normal spinlocks and
rwlocks are consuming less memory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/include/asm/mm.h |  2 +-
 xen/arch/x86/mm/mm-locks.h    |  2 +-
 xen/arch/x86/mm/p2m-pod.c     |  2 +-
 xen/common/domain.c           |  2 +-
 xen/common/spinlock.c         | 21 ++++++-----
 xen/include/xen/sched.h       |  6 ++--
 xen/include/xen/spinlock.h    | 65 +++++++++++++++++++++--------------
 7 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 0fc826de46..8cf86b4796 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -610,7 +610,7 @@ unsigned long domain_get_maximum_gpfn(struct domain *d);
 
 /* Definition of an mm lock: spinlock with extra fields for debugging */
 typedef struct mm_lock {
-    spinlock_t         lock;
+    struct spinlock_recursive lock;
     int                unlock_level;
     int                locker;          /* processor which holds the lock */
     const char        *locker_function; /* func that took it */
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index c1523aeccf..7b54e6914b 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -32,7 +32,7 @@ DECLARE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
 
 static inline void mm_lock_init(mm_lock_t *l)
 {
-    spin_lock_init(&l->lock);
+    spin_lock_recursive_init(&l->lock);
     l->locker = -1;
     l->locker_function = "nobody";
     l->unlock_level = 0;
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index deab55648c..02c149f839 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -397,7 +397,7 @@ int p2m_pod_empty_cache(struct domain *d)
 
     /* After this barrier no new PoD activities can happen. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&p2m->pod.lock.lock);
+    spin_barrier(&p2m->pod.lock.lock.lock);
 
     lock_page_alloc(p2m);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 51160a4b5c..5e5ac4e74b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -929,7 +929,7 @@ int domain_kill(struct domain *d)
     case DOMDYING_alive:
         domain_pause(d);
         d->is_dying = DOMDYING_dying;
-        spin_barrier(&d->domain_lock);
+        spin_barrier(&d->domain_lock.lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
         domain_set_outstanding_pages(d, 0);
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 62c83aaa6a..a48ed17ac6 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -224,6 +224,11 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 }
 
 int _spin_is_locked(spinlock_t *lock)
+{
+    return lock->tickets.head != lock->tickets.tail;
+}
+
+int _spin_recursive_is_locked(struct spinlock_recursive *lock)
 {
     /*
      * Recursive locks may be locked by another CPU, yet we return
@@ -231,7 +236,7 @@ int _spin_is_locked(spinlock_t *lock)
      * ASSERT()s and alike.
      */
     return lock->recurse_cpu == SPINLOCK_NO_CPU
-           ? lock->tickets.head != lock->tickets.tail
+           ? _spin_is_locked(&lock->lock)
            : lock->recurse_cpu == smp_processor_id();
 }
 
@@ -292,7 +297,7 @@ void _spin_barrier(spinlock_t *lock)
     smp_mb();
 }
 
-int _spin_trylock_recursive(spinlock_t *lock)
+int _spin_trylock_recursive(struct spinlock_recursive *lock)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -300,11 +305,11 @@ int _spin_trylock_recursive(spinlock_t *lock)
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
-    check_lock(&lock->debug, true);
+    check_lock(&lock->lock.debug, true);
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        if ( !spin_trylock(lock) )
+        if ( !spin_trylock(&lock->lock) )
             return 0;
         lock->recurse_cpu = cpu;
     }
@@ -316,13 +321,13 @@ int _spin_trylock_recursive(spinlock_t *lock)
     return 1;
 }
 
-void _spin_lock_recursive(spinlock_t *lock)
+void _spin_lock_recursive(struct spinlock_recursive *lock)
 {
     unsigned int cpu = smp_processor_id();
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        _spin_lock(lock);
+        _spin_lock(&lock->lock);
         lock->recurse_cpu = cpu;
     }
 
@@ -331,12 +336,12 @@ void _spin_lock_recursive(spinlock_t *lock)
     lock->recurse_cnt++;
 }
 
-void _spin_unlock_recursive(spinlock_t *lock)
+void _spin_unlock_recursive(struct spinlock_recursive *lock)
 {
     if ( likely(--lock->recurse_cnt == 0) )
     {
         lock->recurse_cpu = SPINLOCK_NO_CPU;
-        spin_unlock(lock);
+        spin_unlock(&lock->lock);
     }
 }
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 557b3229f6..8d45f522d5 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -375,9 +375,9 @@ struct domain
 
     rcu_read_lock_t  rcu_lock;
 
-    spinlock_t       domain_lock;
+    struct spinlock_recursive domain_lock;
 
-    spinlock_t       page_alloc_lock; /* protects all the following fields  */
+    struct spinlock_recursive page_alloc_lock; /* protects following fields  */
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
@@ -595,7 +595,7 @@ struct domain
 #ifdef CONFIG_IOREQ_SERVER
     /* Lock protects all other values in the sub-struct */
     struct {
-        spinlock_t              lock;
+        struct spinlock_recursive lock;
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 20f64102c9..d0cfb4c524 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -89,16 +89,21 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(name) { 0, #name, &name, 0, 0, 0, 0, 0 }
+#define _LOCK_PROFILE(name, var) { 0, #name, &var, 0, 0, 0, 0, 0 }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
     &__lock_profile_data_##name
-#define _SPIN_LOCK_UNLOCKED(x) { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG, x }
+#define _SPIN_LOCK_UNLOCKED(x) { { 0 }, _LOCK_DEBUG, x }
 #define SPIN_LOCK_UNLOCKED _SPIN_LOCK_UNLOCKED(NULL)
 #define DEFINE_SPINLOCK(l)                                                    \
     spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
-    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
+    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l, l); \
+    _LOCK_PROFILE_PTR(l)
+#define DEFINE_SPINLOCK_RECURSIVE(l)                                          \
+    struct spinlock_recursive l = { .lock = _SPIN_LOCK_UNLOCKED(NULL) };      \
+    static struct lock_profile __lock_profile_data_##l =                      \
+                                  _LOCK_PROFILE(l, l.lock);                   \
     _LOCK_PROFILE_PTR(l)
 
 #define spin_lock_init_prof(s, l)                                             \
@@ -136,8 +141,10 @@ extern void cf_check spinlock_profile_reset(unsigned char key);
 
 struct lock_profile_qhead { };
 
-#define SPIN_LOCK_UNLOCKED { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG }
+#define SPIN_LOCK_UNLOCKED { { 0 }, _LOCK_DEBUG }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
+#define DEFINE_SPINLOCK_RECURSIVE(l) \
+    struct spinlock_recursive l = { .lock = SPIN_LOCK_UNLOCKED }
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
 #define lock_profile_register_struct(type, ptr, idx)
@@ -146,8 +153,6 @@ struct lock_profile_qhead { };
 
 #endif
 
-#define DEFINE_SPINLOCK_RECURSIVE(l) DEFINE_SPINLOCK(l)
-
 typedef union {
     u32 head_tail;
     struct {
@@ -160,21 +165,30 @@ typedef union {
 
 typedef struct spinlock {
     spinlock_tickets_t tickets;
-    u16 recurse_cpu:SPINLOCK_CPU_BITS;
-#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
-#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
-#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
     union lock_debug debug;
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     struct lock_profile *profile;
 #endif
 } spinlock_t;
 
+struct spinlock_recursive {
+    struct spinlock lock;
+    u16 recurse_cpu:SPINLOCK_CPU_BITS;
+#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
+#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
+    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
+#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
+};
 
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
-#define spin_lock_recursive_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
-#define spin_lock_recursive_init_prof(s, l) spin_lock_init_prof(s, l)
+#define spin_lock_recursive_init(l) (*(l) = (struct spinlock_recursive){ \
+    .lock = (spinlock_t)SPIN_LOCK_UNLOCKED,                              \
+    .recurse_cpu = SPINLOCK_NO_CPU })
+#define spin_lock_recursive_init_prof(s, l) do {  \
+        spin_lock_init_prof(s, l.lock);           \
+        (s)->l.recurse_cpu = SPINLOCK_NO_CPU;     \
+        (s)->l.recurse_cnt = 0;                   \
+    } while (0)
 
 void _spin_lock(spinlock_t *lock);
 void _spin_lock_cb(spinlock_t *lock, void (*cond)(void *), void *data);
@@ -189,9 +203,10 @@ int _spin_is_locked(spinlock_t *lock);
 int _spin_trylock(spinlock_t *lock);
 void _spin_barrier(spinlock_t *lock);
 
-int _spin_trylock_recursive(spinlock_t *lock);
-void _spin_lock_recursive(spinlock_t *lock);
-void _spin_unlock_recursive(spinlock_t *lock);
+int _spin_recursive_is_locked(struct spinlock_recursive *lock);
+int _spin_trylock_recursive(struct spinlock_recursive *lock);
+void _spin_lock_recursive(struct spinlock_recursive *lock);
+void _spin_unlock_recursive(struct spinlock_recursive *lock);
 
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
@@ -233,14 +248,14 @@ void _spin_unlock_recursive(spinlock_t *lock);
 #define spin_trylock_recursive(l)     _spin_trylock_recursive(l)
 #define spin_lock_recursive(l)        _spin_lock_recursive(l)
 #define spin_unlock_recursive(l)      _spin_unlock_recursive(l)
-#define spin_recursive_is_locked(l)   spin_is_locked(l)
-
-#define spin_trylock_nonrecursive(l)     spin_trylock(l)
-#define spin_lock_nonrecursive(l)        spin_lock(l)
-#define spin_unlock_nonrecursive(l)      spin_unlock(l)
-#define spin_lock_nonrecursive_irq(l)    spin_lock_irq(l)
-#define spin_unlock_nonrecursive_irq(l)  spin_unlock_irq(l)
-#define spin_lock_nonrecursive_irqsave(l, f)      spin_lock_irqsave(l, f)
-#define spin_unlock_nonrecursive_irqrestore(l, f) spin_unlock_irqrestore(l, f)
+#define spin_recursive_is_locked(l)   _spin_recursive_is_locked(l)
+
+#define spin_trylock_nonrecursive(l)     spin_trylock(&(l)->lock)
+#define spin_lock_nonrecursive(l)        spin_lock(&(l)->lock)
+#define spin_unlock_nonrecursive(l)      spin_unlock(&(l)->lock)
+#define spin_lock_nonrecursive_irq(l)    spin_lock_irq(&(l)->lock)
+#define spin_unlock_nonrecursive_irq(l)  spin_unlock_irq(&(l)->lock)
+#define spin_lock_nonrecursive_irqsave(l, f)      spin_lock_irqsave(&(l)->lock, f)
+#define spin_unlock_nonrecursive_irqrestore(l, f) spin_unlock_irqrestore(&(l)->lock, f)
 
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3



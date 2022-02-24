Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D84C29EE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278153.475313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBln-00016I-6y; Thu, 24 Feb 2022 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278153.475313; Thu, 24 Feb 2022 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBln-0000yB-2N; Thu, 24 Feb 2022 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 278153;
 Thu, 24 Feb 2022 10:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNBll-0000gP-1N
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:54:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0ab764-9560-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 11:54:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E7D8A212B6;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A85BA13A79;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uPbOJ/JjF2L2SQAAMHmgww
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
X-Inumbo-ID: 2c0ab764-9560-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645700082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URIjccjwM+WJARLadPEaWbGGRJrYXRvtFlWn552mtiI=;
	b=fLIXfWbRb3zjBOqhts86DZqCB04UL0o2z9JifLcWZ6kaGZy/vV/jBOjbJ53bCqxq2o6eIm
	n/Zk19ePskoyZNPKLmVdL6fMrGRySTYHM96AZ1k6f1zmFx1CgXykOA1xMQwJ9i4xlFbT2Y
	wmUlgkBcSspxhYVOKBW7mD+eAvMNghQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields in struct spinlock
Date: Thu, 24 Feb 2022 11:54:36 +0100
Message-Id: <20220224105436.1480-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224105436.1480-1-jgross@suse.com>
References: <20220224105436.1480-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having two fields in struct spinlock holding a cpu number,
just merge them. For this purpose get rid of union lock_debug and use a
32 bit sized union for cpu, recurse_cnt and the two debug booleans.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/mm/mm-locks.h |  6 ++---
 xen/common/spinlock.c      | 48 +++++++++++++++++++++-----------------
 xen/include/xen/spinlock.h | 43 ++++++++++++++++++----------------
 3 files changed, 52 insertions(+), 45 deletions(-)

diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index fcfd4706ba..01cf3a820d 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -42,7 +42,7 @@ static inline void mm_lock_init(mm_lock_t *l)
 
 static inline bool mm_locked_by_me(const mm_lock_t *l)
 {
-    return (l->lock.recurse_cpu == current->processor);
+    return (l->lock.data.cpu == current->processor);
 }
 
 static inline int _get_lock_level(void)
@@ -94,7 +94,7 @@ static inline void _mm_lock(const struct domain *d, mm_lock_t *l,
     if ( !((mm_locked_by_me(l)) && rec) )
         _check_lock_level(d, level);
     spin_lock_recursive(&l->lock);
-    if ( l->lock.recurse_cnt == 1 )
+    if ( l->lock.data.recurse_cnt == 1 )
     {
         l->locker_function = func;
         l->unlock_level = _get_lock_level();
@@ -209,7 +209,7 @@ static inline void mm_read_unlock(mm_rwlock_t *l)
 
 static inline void mm_unlock(mm_lock_t *l)
 {
-    if ( l->lock.recurse_cnt == 1 )
+    if ( l->lock.data.recurse_cnt == 1 )
     {
         l->locker_function = "nobody";
         _set_lock_level(l->unlock_level);
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 53d6ab6853..33e6aaab1c 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -17,8 +17,6 @@ void check_lock(spinlock_t *lock, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
 
-    BUILD_BUG_ON(LOCK_DEBUG_PAD_BITS <= 0);
-
     if ( unlikely(atomic_read(&spin_debug) <= 0) )
         return;
 
@@ -49,12 +47,12 @@ void check_lock(spinlock_t *lock, bool try)
     if ( try && irq_safe )
         return;
 
-    if ( unlikely(lock->debug.irq_safe != irq_safe) )
+    if ( unlikely(lock->data.irq_safe != irq_safe) )
     {
-        union lock_debug seen, new = { 0 };
+        spinlock_data_t seen, new = { 0 };
 
         new.irq_safe = irq_safe;
-        seen.val = cmpxchg(&lock->debug.val, LOCK_DEBUG_INITVAL, new.val);
+        seen.val = cmpxchg(&lock->data.val, SPINLOCK_DATA_INITVAL, new.val);
 
         if ( !seen.unseen && seen.irq_safe == !irq_safe )
         {
@@ -81,19 +79,19 @@ static void check_barrier(spinlock_t *lock)
      * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
      * is clearly wrong, for the same reason outlined in check_lock() above.
      */
-    BUG_ON(!local_irq_is_enabled() && !lock->debug.irq_safe);
+    BUG_ON(!local_irq_is_enabled() && !lock->data.irq_safe);
 }
 
 static void got_lock(spinlock_t *lock)
 {
-    lock->debug.cpu = smp_processor_id();
+    lock->data.cpu = smp_processor_id();
 }
 
 static void rel_lock(spinlock_t *lock)
 {
     if ( atomic_read(&spin_debug) > 0 )
-        BUG_ON(lock->debug.cpu != smp_processor_id());
-    lock->debug.cpu = SPINLOCK_NO_CPU;
+        BUG_ON(lock->data.cpu != smp_processor_id());
+    lock->data.cpu = SPINLOCK_NO_CPU;
 }
 
 void spin_debug_enable(void)
@@ -230,9 +228,9 @@ int _spin_is_locked(spinlock_t *lock)
      * "false" here, making this function suitable only for use in
      * ASSERT()s and alike.
      */
-    return lock->recurse_cpu == SPINLOCK_NO_CPU
+    return lock->data.cpu == SPINLOCK_NO_CPU
            ? lock->tickets.head != lock->tickets.tail
-           : lock->recurse_cpu == smp_processor_id();
+           : lock->data.cpu == smp_processor_id();
 }
 
 int _spin_trylock(spinlock_t *lock)
@@ -296,22 +294,24 @@ int _spin_trylock_recursive(spinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
-    /* Don't allow overflow of recurse_cpu field. */
+    /* Don't allow overflow of cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
     check_lock(lock, true);
 
-    if ( likely(lock->recurse_cpu != cpu) )
+    if ( likely(lock->data.cpu != cpu) )
     {
         if ( !spin_trylock(lock) )
             return 0;
-        lock->recurse_cpu = cpu;
+#ifndef CONFIG_DEBUG_LOCKS
+        lock->data.cpu = cpu;
+#endif
     }
 
     /* We support only fairly shallow recursion, else the counter overflows. */
-    ASSERT(lock->recurse_cnt < SPINLOCK_MAX_RECURSE);
-    lock->recurse_cnt++;
+    ASSERT(lock->data.recurse_cnt < SPINLOCK_MAX_RECURSE);
+    lock->data.recurse_cnt++;
 
     return 1;
 }
@@ -320,22 +320,26 @@ void _spin_lock_recursive(spinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
-    if ( likely(lock->recurse_cpu != cpu) )
+    if ( likely(lock->data.cpu != cpu) )
     {
         _spin_lock(lock);
-        lock->recurse_cpu = cpu;
+#ifndef CONFIG_DEBUG_LOCKS
+        lock->data.cpu = cpu;
+#endif
     }
 
     /* We support only fairly shallow recursion, else the counter overflows. */
-    ASSERT(lock->recurse_cnt < SPINLOCK_MAX_RECURSE);
-    lock->recurse_cnt++;
+    ASSERT(lock->data.recurse_cnt < SPINLOCK_MAX_RECURSE);
+    lock->data.recurse_cnt++;
 }
 
 void _spin_unlock_recursive(spinlock_t *lock)
 {
-    if ( likely(--lock->recurse_cnt == 0) )
+    if ( likely(--lock->data.recurse_cnt == 0) )
     {
-        lock->recurse_cpu = SPINLOCK_NO_CPU;
+#ifndef CONFIG_DEBUG_LOCKS
+        lock->data.cpu = SPINLOCK_NO_CPU;
+#endif
         spin_unlock(lock);
     }
 }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 5b6b73732f..61731b5d29 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -6,26 +6,34 @@
 #include <asm/spinlock.h>
 #include <asm/types.h>
 
-#define SPINLOCK_CPU_BITS  12
+#define SPINLOCK_CPU_BITS      12
+#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
+#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
+#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
+#define SPINLOCK_PAD_BITS      (30 - SPINLOCK_CPU_BITS - SPINLOCK_RECURSE_BITS)
 
-#ifdef CONFIG_DEBUG_LOCKS
-union lock_debug {
-    uint16_t val;
-#define LOCK_DEBUG_INITVAL 0xffff
+typedef union {
+    u32 val;
     struct {
-        uint16_t cpu:SPINLOCK_CPU_BITS;
-#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
-        uint16_t :LOCK_DEBUG_PAD_BITS;
+        u32 cpu:SPINLOCK_CPU_BITS;
+        u32 recurse_cnt:SPINLOCK_RECURSE_BITS;
+        u32 pad:SPINLOCK_PAD_BITS;
+#ifdef CONFIG_DEBUG_LOCKS
         bool irq_safe:1;
         bool unseen:1;
+#define SPINLOCK_DEBUG_INITVAL 0xc0000000
+#else
+        u32 debug_pad:2;
+#define SPINLOCK_DEBUG_INITVAL 0x00000000
+#endif
     };
-};
-#define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
+} spinlock_data_t;
+#define SPINLOCK_DATA_INITVAL (SPINLOCK_NO_CPU | SPINLOCK_DEBUG_INITVAL)
+
+#ifdef CONFIG_DEBUG_LOCKS
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
-union lock_debug { };
-#define _LOCK_DEBUG { }
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
@@ -92,7 +100,7 @@ struct lock_profile_qhead {
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
     &__lock_profile_data_##name
-#define _SPIN_LOCK_UNLOCKED(x) { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG, x }
+#define _SPIN_LOCK_UNLOCKED(x) { { 0 }, { SPINLOCK_DATA_INITVAL }, x }
 #define SPIN_LOCK_UNLOCKED _SPIN_LOCK_UNLOCKED(NULL)
 #define DEFINE_SPINLOCK(l)                                                    \
     spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
@@ -134,7 +142,7 @@ extern void cf_check spinlock_profile_reset(unsigned char key);
 
 struct lock_profile_qhead { };
 
-#define SPIN_LOCK_UNLOCKED { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG }
+#define SPIN_LOCK_UNLOCKED { { 0 }, { SPINLOCK_DATA_INITVAL } }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
@@ -156,12 +164,7 @@ typedef union {
 
 typedef struct spinlock {
     spinlock_tickets_t tickets;
-    u16 recurse_cpu:SPINLOCK_CPU_BITS;
-#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
-#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
-#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
-    union lock_debug debug;
+    spinlock_data_t data;
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     struct lock_profile *profile;
 #endif
-- 
2.34.1



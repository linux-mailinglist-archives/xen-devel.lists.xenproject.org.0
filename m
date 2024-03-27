Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7562F88E892
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698602.1090501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6z-000801-UQ; Wed, 27 Mar 2024 15:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698602.1090501; Wed, 27 Mar 2024 15:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6z-0007y9-RE; Wed, 27 Mar 2024 15:22:45 +0000
Received: by outflank-mailman (input) for mailman id 698602;
 Wed, 27 Mar 2024 15:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV6y-0007Qx-KO
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:22:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbacd412-ec4d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:22:44 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 791595FF27;
 Wed, 27 Mar 2024 15:22:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B6F213215;
 Wed, 27 Mar 2024 15:22:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0sYKDcM5BGazfQAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:22:43 +0000
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
X-Inumbo-ID: dbacd412-ec4d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNcfOxsm5v7RMnma3LjjKR0Cscie45Q1Vyko4FogwSU=;
	b=tmt8BiVpGRS9VE7HVpTowDPulIKHtD1qAhrexfIaueQDYMGV+UI8+ukvXI/sTkTj9Vuelv
	QKwYeqOTm0+aNmS+VNoi4LxOiI8FyZHC8xLVeMlVmGQNObWpZjl69z4fJ6l8xYplHy7ZZ7
	CEHnV8TBo75E1dJ2vxzf5lLDL303wqc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNcfOxsm5v7RMnma3LjjKR0Cscie45Q1Vyko4FogwSU=;
	b=tmt8BiVpGRS9VE7HVpTowDPulIKHtD1qAhrexfIaueQDYMGV+UI8+ukvXI/sTkTj9Vuelv
	QKwYeqOTm0+aNmS+VNoi4LxOiI8FyZHC8xLVeMlVmGQNObWpZjl69z4fJ6l8xYplHy7ZZ7
	CEHnV8TBo75E1dJ2vxzf5lLDL303wqc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/8] xen/spinlock: add another function level
Date: Wed, 27 Mar 2024 16:22:23 +0100
Message-Id: <20240327152229.25847-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tmt8BiVp
X-Rspamd-Queue-Id: 791595FF27

Add another function level in spinlock.c hiding the spinlock_t layout
from the low level locking code.

This is done in preparation of introducing rspinlock_t for recursive
locks without having to duplicate all of the locking code.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
V5:
- don't regress spin_is_locked() for rspin-lock (Jan Beulich)
- use bool as return type of spin_is_locked_common() and
  spin_trylock_common() (Jan Beulich)
---
 xen/common/spinlock.c      | 103 ++++++++++++++++++++++++-------------
 xen/include/xen/spinlock.h |   1 +
 2 files changed, 68 insertions(+), 36 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 874ed762b4..648393d95f 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -261,29 +261,31 @@ void spin_debug_disable(void)
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
+#define LOCK_PROFILE_PAR lock->profile
 #define LOCK_PROFILE_REL                                                     \
-    if ( lock->profile )                                                     \
+    if ( profile )                                                           \
     {                                                                        \
-        lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
-        lock->profile->lock_cnt++;                                           \
+        profile->time_hold += NOW() - profile->time_locked;                  \
+        profile->lock_cnt++;                                                 \
     }
 #define LOCK_PROFILE_VAR(var, val)    s_time_t var = (val)
 #define LOCK_PROFILE_BLOCK(var)       var = var ? : NOW()
 #define LOCK_PROFILE_BLKACC(tst, val)                                        \
     if ( tst )                                                               \
     {                                                                        \
-        lock->profile->time_block += lock->profile->time_locked - (val);     \
-        lock->profile->block_cnt++;                                          \
+        profile->time_block += profile->time_locked - (val);                 \
+        profile->block_cnt++;                                                \
     }
 #define LOCK_PROFILE_GOT(val)                                                \
-    if ( lock->profile )                                                     \
+    if ( profile )                                                           \
     {                                                                        \
-        lock->profile->time_locked = NOW();                                  \
+        profile->time_locked = NOW();                                        \
         LOCK_PROFILE_BLKACC(val, val);                                       \
     }
 
 #else
 
+#define LOCK_PROFILE_PAR NULL
 #define LOCK_PROFILE_REL
 #define LOCK_PROFILE_VAR(var, val)
 #define LOCK_PROFILE_BLOCK(var)
@@ -307,17 +309,18 @@ static always_inline uint16_t observe_head(const spinlock_tickets_t *t)
     return read_atomic(&t->head);
 }
 
-static void always_inline spin_lock_common(spinlock_t *lock,
+static void always_inline spin_lock_common(spinlock_tickets_t *t,
+                                           union lock_debug *debug,
+                                           struct lock_profile *profile,
                                            void (*cb)(void *data), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR(block, 0);
 
-    check_lock(&lock->debug, false);
+    check_lock(debug, false);
     preempt_disable();
-    tickets.head_tail = arch_fetch_and_add(&lock->tickets.head_tail,
-                                           tickets.head_tail);
-    while ( tickets.tail != observe_head(&lock->tickets) )
+    tickets.head_tail = arch_fetch_and_add(&t->head_tail, tickets.head_tail);
+    while ( tickets.tail != observe_head(t) )
     {
         LOCK_PROFILE_BLOCK(block);
         if ( cb )
@@ -325,18 +328,19 @@ static void always_inline spin_lock_common(spinlock_t *lock,
         arch_lock_relax();
     }
     arch_lock_acquire_barrier();
-    got_lock(&lock->debug);
+    got_lock(debug);
     LOCK_PROFILE_GOT(block);
 }
 
 void _spin_lock(spinlock_t *lock)
 {
-    spin_lock_common(lock, NULL, NULL);
+    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
+                     NULL);
 }
 
 void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *data), void *data)
 {
-    spin_lock_common(lock, cb, data);
+    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, cb, data);
 }
 
 void _spin_lock_irq(spinlock_t *lock)
@@ -355,16 +359,23 @@ unsigned long _spin_lock_irqsave(spinlock_t *lock)
     return flags;
 }
 
-void _spin_unlock(spinlock_t *lock)
+static void always_inline spin_unlock_common(spinlock_tickets_t *t,
+                                             union lock_debug *debug,
+                                             struct lock_profile *profile)
 {
     LOCK_PROFILE_REL;
-    rel_lock(&lock->debug);
+    rel_lock(debug);
     arch_lock_release_barrier();
-    add_sized(&lock->tickets.head, 1);
+    add_sized(&t->head, 1);
     arch_lock_signal();
     preempt_enable();
 }
 
+void _spin_unlock(spinlock_t *lock)
+{
+    spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
 void _spin_unlock_irq(spinlock_t *lock)
 {
     _spin_unlock(lock);
@@ -377,6 +388,11 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
+static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
+{
+    return t->head != t->tail;
+}
+
 int _spin_is_locked(const spinlock_t *lock)
 {
     /*
@@ -385,57 +401,70 @@ int _spin_is_locked(const spinlock_t *lock)
      * ASSERT()s and alike.
      */
     return lock->recurse_cpu == SPINLOCK_NO_CPU
-           ? lock->tickets.head != lock->tickets.tail
+           ? spin_is_locked_common(&lock->tickets)
            : lock->recurse_cpu == smp_processor_id();
 }
 
-int _spin_trylock(spinlock_t *lock)
+static bool always_inline spin_trylock_common(spinlock_tickets_t *t,
+                                              union lock_debug *debug,
+                                              struct lock_profile *profile)
 {
     spinlock_tickets_t old, new;
 
     preempt_disable();
-    check_lock(&lock->debug, true);
-    old = observe_lock(&lock->tickets);
+    check_lock(debug, true);
+    old = observe_lock(t);
     if ( old.head != old.tail )
     {
         preempt_enable();
-        return 0;
+        return false;
     }
     new = old;
     new.tail++;
-    if ( cmpxchg(&lock->tickets.head_tail,
-                 old.head_tail, new.head_tail) != old.head_tail )
+    if ( cmpxchg(&t->head_tail, old.head_tail, new.head_tail) != old.head_tail )
     {
         preempt_enable();
-        return 0;
+        return false;
     }
     /*
      * cmpxchg() is a full barrier so no need for an
      * arch_lock_acquire_barrier().
      */
-    got_lock(&lock->debug);
+    got_lock(debug);
     LOCK_PROFILE_GOT(0);
 
-    return 1;
+    return true;
 }
 
-void _spin_barrier(spinlock_t *lock)
+int _spin_trylock(spinlock_t *lock)
+{
+    return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
+static void always_inline spin_barrier_common(spinlock_tickets_t *t,
+                                              union lock_debug *debug,
+                                              struct lock_profile *profile)
 {
     spinlock_tickets_t sample;
     LOCK_PROFILE_VAR(block, NOW());
 
-    check_barrier(&lock->debug);
+    check_barrier(debug);
     smp_mb();
-    sample = observe_lock(&lock->tickets);
+    sample = observe_lock(t);
     if ( sample.head != sample.tail )
     {
-        while ( observe_head(&lock->tickets) == sample.head )
+        while ( observe_head(t) == sample.head )
             arch_lock_relax();
-        LOCK_PROFILE_BLKACC(lock->profile, block);
+        LOCK_PROFILE_BLKACC(profile, block);
     }
     smp_mb();
 }
 
+void _spin_barrier(spinlock_t *lock)
+{
+    spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
 bool _rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
@@ -448,7 +477,8 @@ bool _rspin_trylock(rspinlock_t *lock)
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        if ( !_spin_trylock(lock) )
+        if ( !spin_trylock_common(&lock->tickets, &lock->debug,
+                                  LOCK_PROFILE_PAR) )
             return false;
         lock->recurse_cpu = cpu;
     }
@@ -466,7 +496,8 @@ void _rspin_lock(rspinlock_t *lock)
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        _spin_lock(lock);
+        spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
+                         NULL);
         lock->recurse_cpu = cpu;
     }
 
@@ -490,7 +521,7 @@ void _rspin_unlock(rspinlock_t *lock)
     if ( likely(--lock->recurse_cnt == 0) )
     {
         lock->recurse_cpu = SPINLOCK_NO_CPU;
-        spin_unlock(lock);
+        spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
     }
 }
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 53a33653f9..8bc4652526 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -165,6 +165,7 @@ extern void cf_check spinlock_profile_reset(unsigned char key);
 #else
 
 struct lock_profile_qhead { };
+struct lock_profile { };
 
 #define SPIN_LOCK_UNLOCKED {                                                  \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
-- 
2.35.3



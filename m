Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C837F1242
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636647.992318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cw-0008Ix-Gw; Mon, 20 Nov 2023 11:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636647.992318; Mon, 20 Nov 2023 11:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cw-0008Dx-DM; Mon, 20 Nov 2023 11:39:42 +0000
Received: by outflank-mailman (input) for mailman id 636647;
 Mon, 20 Nov 2023 11:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52cv-0005BS-BM
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:39:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d126a3b-8799-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 12:39:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13C691F85D;
 Mon, 20 Nov 2023 11:39:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB22C13499;
 Mon, 20 Nov 2023 11:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ypZEMHpFW2U6PgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:39:38 +0000
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
X-Inumbo-ID: 7d126a3b-8799-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFlxtxsX+9lczW/zJBwJuexkoM0jZPtZbEpxpdxkqs4=;
	b=rZeYLvRuVvNEQmHtsekKpvOpXoipWqvBVg9bF/ysMBtpKcBE4Tr3HXHGZOPgAONo39XYbH
	kuFVJ1VVuONiioWe1o89wbE1c0EtUhBy9NGvhk/YJvlZdXp6zdrPOrUUgKeS/LZ4cZPr9C
	QjMdkAafJr4R62T+ijrogSBNRWLfaPQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 09/13] xen/spinlock: add another function level
Date: Mon, 20 Nov 2023 12:38:38 +0100
Message-Id: <20231120113842.5897-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231120113842.5897-1-jgross@suse.com>
References: <20231120113842.5897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add another function level in spinlock.c hiding the spinlock_t layout
from the low level locking code.

This is done in preparation of introducing rspinlock_t for recursive
locks without having to duplicate all of the locking code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/spinlock.c      | 104 +++++++++++++++++++++++--------------
 xen/include/xen/spinlock.h |   1 +
 2 files changed, 65 insertions(+), 40 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 65f180203a..8b991cf385 100644
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
 #define LOCK_PROFILE_BLOCK(var     )  var = var ? : NOW()
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
                                            void (*cb)(void *), void *data)
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
 
 void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
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
@@ -377,25 +388,25 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
+static int always_inline spin_is_locked_common(const spinlock_tickets_t *t)
+{
+    return t->head != t->tail;
+}
+
 int _spin_is_locked(const spinlock_t *lock)
 {
-    /*
-     * Recursive locks may be locked by another CPU, yet we return
-     * "false" here, making this function suitable only for use in
-     * ASSERT()s and alike.
-     */
-    return lock->recurse_cpu == SPINLOCK_NO_CPU
-           ? lock->tickets.head != lock->tickets.tail
-           : lock->recurse_cpu == smp_processor_id();
+    return spin_is_locked_common(&lock->tickets);
 }
 
-int _spin_trylock(spinlock_t *lock)
+static int always_inline spin_trylock_common(spinlock_tickets_t *t,
+                                             union lock_debug *debug,
+                                             struct lock_profile *profile)
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
@@ -403,8 +414,7 @@ int _spin_trylock(spinlock_t *lock)
     }
     new = old;
     new.tail++;
-    if ( cmpxchg(&lock->tickets.head_tail,
-                 old.head_tail, new.head_tail) != old.head_tail )
+    if ( cmpxchg(&t->head_tail, old.head_tail, new.head_tail) != old.head_tail )
     {
         preempt_enable();
         return 0;
@@ -413,29 +423,41 @@ int _spin_trylock(spinlock_t *lock)
      * cmpxchg() is a full barrier so no need for an
      * arch_lock_acquire_barrier().
      */
-    got_lock(&lock->debug);
+    got_lock(debug);
     LOCK_PROFILE_GOT(0);
 
     return 1;
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
 int rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
@@ -448,7 +470,8 @@ int rspin_trylock(rspinlock_t *lock)
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        if ( !spin_trylock(lock) )
+        if ( !spin_trylock_common(&lock->tickets, &lock->debug,
+                                  LOCK_PROFILE_PAR) )
             return 0;
         lock->recurse_cpu = cpu;
     }
@@ -466,7 +489,8 @@ void rspin_lock(rspinlock_t *lock)
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        _spin_lock(lock);
+        spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
+                         NULL);
         lock->recurse_cpu = cpu;
     }
 
@@ -490,7 +514,7 @@ void rspin_unlock(rspinlock_t *lock)
     if ( likely(--lock->recurse_cnt == 0) )
     {
         lock->recurse_cpu = SPINLOCK_NO_CPU;
-        spin_unlock(lock);
+        spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
     }
 }
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 12764bcddf..ccb1cafa5f 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -163,6 +163,7 @@ extern void cf_check spinlock_profile_reset(unsigned char key);
 #else
 
 struct lock_profile_qhead { };
+struct lock_profile { };
 
 #define SPIN_LOCK_UNLOCKED {                                                  \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714D88E899
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698604.1090521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7B-0000Mr-HM; Wed, 27 Mar 2024 15:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698604.1090521; Wed, 27 Mar 2024 15:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7B-0000IU-Dp; Wed, 27 Mar 2024 15:22:57 +0000
Received: by outflank-mailman (input) for mailman id 698604;
 Wed, 27 Mar 2024 15:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV7A-0007Qx-0p
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:22:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e26bc377-ec4d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:22:55 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C72AE38B5D;
 Wed, 27 Mar 2024 15:22:54 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 892FB13215;
 Wed, 27 Mar 2024 15:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id hSwEIM45BGYxfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:22:54 +0000
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
X-Inumbo-ID: e26bc377-ec4d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgUlnwwBECkoxNJznR++n3A26InW+paL4mR0WOpyZEc=;
	b=gwMCVjqS7PK6e7UcFJ+jujzCK+MptUD0Hp5A8HLzkvbVGsea0lam8JcEij1IPOlarwVpZn
	Z330MppBACterCCnPAPqJoxJA8F4BfzTXanFBYycFPh74nkmK+D5Eb59G0q6FdAV5LNKQv
	jFpCmLRFS6vk8vSMaxPuotNw2s7VGxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgUlnwwBECkoxNJznR++n3A26InW+paL4mR0WOpyZEc=;
	b=gwMCVjqS7PK6e7UcFJ+jujzCK+MptUD0Hp5A8HLzkvbVGsea0lam8JcEij1IPOlarwVpZn
	Z330MppBACterCCnPAPqJoxJA8F4BfzTXanFBYycFPh74nkmK+D5Eb59G0q6FdAV5LNKQv
	jFpCmLRFS6vk8vSMaxPuotNw2s7VGxk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 4/8] xen/spinlock: split recursive spinlocks from normal ones
Date: Wed, 27 Mar 2024 16:22:25 +0100
Message-Id: <20240327152229.25847-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Flag: NO

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

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- use shorter names (Jan Beulich)
- don't embed spinlock_t in rspinlock_t (Jan Beulich)
V5:
- some style fixes (Jan Beulich)
- bool instead of int (Jan Beulich)
---
 xen/common/spinlock.c      | 50 ++++++++++++++++++++++++++
 xen/include/xen/spinlock.h | 72 +++++++++++++++++++++++++++++---------
 2 files changed, 105 insertions(+), 17 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 6572c76114..5aaca49a61 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -545,6 +545,56 @@ void _rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
+bool _nrspin_trylock(rspinlock_t *lock)
+{
+    check_lock(&lock->debug, true);
+
+    if ( unlikely(lock->recurse_cpu != SPINLOCK_NO_CPU) )
+        return false;
+
+    return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
+void _nrspin_lock(rspinlock_t *lock)
+{
+    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
+                     NULL);
+}
+
+void _nrspin_unlock(rspinlock_t *lock)
+{
+    spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
+void _nrspin_lock_irq(rspinlock_t *lock)
+{
+    ASSERT(local_irq_is_enabled());
+    local_irq_disable();
+    _nrspin_lock(lock);
+}
+
+void _nrspin_unlock_irq(rspinlock_t *lock)
+{
+    _nrspin_unlock(lock);
+    local_irq_enable();
+}
+
+unsigned long _nrspin_lock_irqsave(rspinlock_t *lock)
+{
+    unsigned long flags;
+
+    local_irq_save(flags);
+    _nrspin_lock(lock);
+
+    return flags;
+}
+
+void _nrspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
+{
+    _nrspin_unlock(lock);
+    local_irq_restore(flags);
+}
+
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 struct lock_profile_anc {
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 148be1e116..f49ba928f0 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -77,8 +77,6 @@ union lock_debug { };
 */
 
 struct spinlock;
-/* Temporary hack until a dedicated struct rspinlock is existing. */
-#define rspinlock spinlock
 
 struct lock_profile {
     struct lock_profile *next;       /* forward link */
@@ -110,6 +108,10 @@ struct lock_profile_qhead {
     __used_section(".lockprofile.data") =                                     \
     &lock_profile_data__##name
 #define SPIN_LOCK_UNLOCKED_(x) {                                              \
+    .debug = LOCK_DEBUG_,                                                     \
+    .profile = x,                                                             \
+}
+#define RSPIN_LOCK_UNLOCKED_(x) {                                             \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
     .debug = LOCK_DEBUG_,                                                     \
     .profile = x,                                                             \
@@ -119,8 +121,9 @@ struct lock_profile_qhead {
     spinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                 \
     static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \
     LOCK_PROFILE_PTR_(l)
+#define RSPIN_LOCK_UNLOCKED RSPIN_LOCK_UNLOCKED_(NULL)
 #define DEFINE_RSPINLOCK(l)                                                   \
-    rspinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                \
+    rspinlock_t l = RSPIN_LOCK_UNLOCKED_(NULL);                               \
     static struct lock_profile lock_profile_data__##l = RLOCK_PROFILE_(l);    \
     LOCK_PROFILE_PTR_(l)
 
@@ -145,8 +148,11 @@ struct lock_profile_qhead {
 
 #define spin_lock_init_prof(s, l)                                             \
     spin_lock_init_prof__(s, l, lock, spinlock_t, false)
-#define rspin_lock_init_prof(s, l)                                            \
-    spin_lock_init_prof__(s, l, rlock, rspinlock_t, true)
+#define rspin_lock_init_prof(s, l) do {                                       \
+        spin_lock_init_prof__(s, l, rlock, rspinlock_t, true);                \
+        (s)->l.recurse_cpu = SPINLOCK_NO_CPU;                                 \
+        (s)->l.recurse_cnt = 0;                                               \
+    } while (0)
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
@@ -168,11 +174,14 @@ struct lock_profile_qhead { };
 struct lock_profile { };
 
 #define SPIN_LOCK_UNLOCKED {                                                  \
+    .debug = LOCK_DEBUG_,                                                     \
+}
+#define RSPIN_LOCK_UNLOCKED {                                                 \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
     .debug = LOCK_DEBUG_,                                                     \
 }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
-#define DEFINE_RSPINLOCK(l) rspinlock_t l = SPIN_LOCK_UNLOCKED
+#define DEFINE_RSPINLOCK(l) rspinlock_t l = RSPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
 #define rspin_lock_init_prof(s, l) rspin_lock_init(&((s)->l))
@@ -193,6 +202,14 @@ typedef union {
 #define SPINLOCK_TICKET_INC { .head_tail = 0x10000, }
 
 typedef struct spinlock {
+    spinlock_tickets_t tickets;
+    union lock_debug debug;
+#ifdef CONFIG_DEBUG_LOCK_PROFILE
+    struct lock_profile *profile;
+#endif
+} spinlock_t;
+
+typedef struct rspinlock {
     spinlock_tickets_t tickets;
     uint16_t recurse_cpu:SPINLOCK_CPU_BITS;
 #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
@@ -203,12 +220,10 @@ typedef struct spinlock {
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     struct lock_profile *profile;
 #endif
-} spinlock_t;
-
-typedef spinlock_t rspinlock_t;
+} rspinlock_t;
 
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
-#define rspin_lock_init(l) (*(l) = (rspinlock_t)SPIN_LOCK_UNLOCKED)
+#define rspin_lock_init(l) (*(l) = (rspinlock_t)RSPIN_LOCK_UNLOCKED)
 
 void _spin_lock(spinlock_t *lock);
 void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *data), void *data);
@@ -312,12 +327,35 @@ static always_inline void rspin_lock(rspinlock_t *lock)
 #define rspin_barrier(l)              _rspin_barrier(l)
 #define rspin_is_locked(l)            _rspin_is_locked(l)
 
-#define nrspin_trylock(l)    spin_trylock(l)
-#define nrspin_lock(l)       spin_lock(l)
-#define nrspin_unlock(l)     spin_unlock(l)
-#define nrspin_lock_irq(l)   spin_lock_irq(l)
-#define nrspin_unlock_irq(l) spin_unlock_irq(l)
-#define nrspin_lock_irqsave(l, f)      spin_lock_irqsave(l, f)
-#define nrspin_unlock_irqrestore(l, f) spin_unlock_irqrestore(l, f)
+bool _nrspin_trylock(rspinlock_t *lock);
+void _nrspin_lock(rspinlock_t *lock);
+#define nrspin_lock_irqsave(l, f)                               \
+    ({                                                          \
+        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
+        (f) = _nrspin_lock_irqsave(l);                         \
+        block_lock_speculation();                               \
+    })
+unsigned long _nrspin_lock_irqsave(rspinlock_t *lock);
+void _nrspin_unlock(rspinlock_t *lock);
+void _nrspin_lock_irq(rspinlock_t *lock);
+void _nrspin_unlock_irq(rspinlock_t *lock);
+void _nrspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
+
+static always_inline void nrspin_lock(rspinlock_t *lock)
+{
+    _nrspin_lock(lock);
+    block_lock_speculation();
+}
+
+static always_inline void nrspin_lock_irq(rspinlock_t *l)
+{
+    _nrspin_lock_irq(l);
+    block_lock_speculation();
+}
+
+#define nrspin_trylock(l)              lock_evaluate_nospec(_nrspin_trylock(l))
+#define nrspin_unlock(l)               _nrspin_unlock(l)
+#define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
+#define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
 
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3



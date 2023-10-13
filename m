Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84A7C833D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616427.958457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFX8-0005Nf-SL; Fri, 13 Oct 2023 10:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616427.958457; Fri, 13 Oct 2023 10:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFX8-0005K0-Nj; Fri, 13 Oct 2023 10:36:42 +0000
Received: by outflank-mailman (input) for mailman id 616427;
 Fri, 13 Oct 2023 10:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrFX6-0002pr-SB
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:36:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 637ba6ca-69b4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:36:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC59B219DA;
 Fri, 13 Oct 2023 10:36:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 688C2138EF;
 Fri, 13 Oct 2023 10:36:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ao5NGLUdKWVmNgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 10:36:37 +0000
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
X-Inumbo-ID: 637ba6ca-69b4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697193397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEI5eqx0qsywHKFAfD59Bl72B8RN9roJeFD/76AWmiE=;
	b=WCAftx5mHHCVfwSqLi7rL8VsQhhLs/EaYO+1W19UhWxSsjmmYaBU5Dh8MCqwNht4/kh7Zb
	d97YobKl8on2x7FwdppZ8vc+onRscXa403QgM9IWtEZlA0R+tw8UXFIrIqG55FwAivg9M9
	SAz8YB7amvc0eVXZPp/hRZ7XAYJOSsY=
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
Subject: [PATCH v2 11/13] xen/spinlock: split recursive spinlocks from normal ones
Date: Fri, 13 Oct 2023 11:42:22 +0200
Message-Id: <20231013094224.7060-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
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
---
V2:
- use shorter names (Jan Beulich)
- don't embed spinlock_t in rspinlock_t (Jan Beulich)
---
 xen/common/spinlock.c      | 49 ++++++++++++++++++++++++++++++++
 xen/include/xen/spinlock.h | 58 +++++++++++++++++++++++++-------------
 2 files changed, 88 insertions(+), 19 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 9159a5a7c3..cff3f126e6 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -541,6 +541,55 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
+int nrspin_trylock(rspinlock_t *lock)
+{
+    check_lock(&lock->debug, true);
+
+    if ( unlikely(lock->recurse_cpu != SPINLOCK_NO_CPU) )
+        return 0;
+
+    return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
+void nrspin_lock(rspinlock_t *lock)
+{
+    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
+                     NULL);
+}
+
+void nrspin_unlock(rspinlock_t *lock)
+{
+    spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
+void nrspin_lock_irq(rspinlock_t *lock)
+{
+    ASSERT(local_irq_is_enabled());
+    local_irq_disable();
+    nrspin_lock(lock);
+}
+
+void nrspin_unlock_irq(rspinlock_t *lock)
+{
+    nrspin_unlock(lock);
+    local_irq_enable();
+}
+
+unsigned long __nrspin_lock_irqsave(rspinlock_t *lock)
+{
+    unsigned long flags;
+
+    local_irq_save(flags);
+    nrspin_lock(lock);
+    return flags;
+}
+
+void nrspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
+{
+    nrspin_unlock(lock);
+    local_irq_restore(flags);
+}
+
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 struct lock_profile_anc {
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index fb6ca1949a..a2b1bb2df6 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -76,8 +76,6 @@ union lock_debug { };
 */
 
 struct spinlock;
-/* Temporary hack until a dedicated struct rspinlock is existing. */
-#define rspinlock spinlock
 
 struct lock_profile {
     struct lock_profile *next;       /* forward link */
@@ -108,6 +106,10 @@ struct lock_profile_qhead {
     __used_section(".lockprofile.data") =                                     \
     &__lock_profile_data_##name
 #define _SPIN_LOCK_UNLOCKED(x) {                                              \
+    .debug =_LOCK_DEBUG,                                                      \
+    .profile = x,                                                             \
+}
+#define _RSPIN_LOCK_UNLOCKED(x) {                                             \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
     .debug =_LOCK_DEBUG,                                                      \
     .profile = x,                                                             \
@@ -117,8 +119,9 @@ struct lock_profile_qhead {
     spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
     static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
     _LOCK_PROFILE_PTR(l)
+#define RSPIN_LOCK_UNLOCKED _RSPIN_LOCK_UNLOCKED(NULL)
 #define DEFINE_RSPINLOCK(l)                                                   \
-    rspinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                \
+    rspinlock_t l = _RSPIN_LOCK_UNLOCKED(NULL);                               \
     static struct lock_profile __lock_profile_data_##l = _RLOCK_PROFILE(l);   \
     _LOCK_PROFILE_PTR(l)
 
@@ -143,8 +146,11 @@ struct lock_profile_qhead {
 
 #define spin_lock_init_prof(s, l)                                             \
     __spin_lock_init_prof(s, l, lock, spinlock_t, 0)
-#define rspin_lock_init_prof(s, l)                                            \
-    __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1)
+#define rspin_lock_init_prof(s, l) do {                                       \
+        __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1);                   \
+        (s)->l.recurse_cpu = SPINLOCK_NO_CPU;                                 \
+        (s)->l.recurse_cnt = 0;                                               \
+    } while (0)
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
@@ -166,11 +172,15 @@ struct lock_profile_qhead { };
 struct lock_profile { };
 
 #define SPIN_LOCK_UNLOCKED {                                                  \
+    .debug =_LOCK_DEBUG,                                                      \
+}
+#define RSPIN_LOCK_UNLOCKED {                                                 \
+    .debug =_LOCK_DEBUG,                                                      \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
     .debug =_LOCK_DEBUG,                                                      \
 }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
-#define DEFINE_RSPINLOCK(l) rspinlock_t l = SPIN_LOCK_UNLOCKED
+#define DEFINE_RSPINLOCK(l) rspinlock_t l = RSPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
 #define rspin_lock_init_prof(s, l) rspin_lock_init(&((s)->l))
@@ -180,7 +190,6 @@ struct lock_profile { };
 
 #endif
 
-
 typedef union {
     uint32_t head_tail;
     struct {
@@ -192,6 +201,14 @@ typedef union {
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
@@ -202,12 +219,10 @@ typedef struct spinlock {
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
 void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data);
@@ -242,6 +257,19 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
 int rspin_is_locked(const rspinlock_t *lock);
 void rspin_barrier(rspinlock_t *lock);
 
+int nrspin_trylock(rspinlock_t *lock);
+void nrspin_lock(rspinlock_t *lock);
+void nrspin_unlock(rspinlock_t *lock);
+void nrspin_lock_irq(rspinlock_t *lock);
+void nrspin_unlock_irq(rspinlock_t *lock);
+#define nrspin_lock_irqsave(l, f)                               \
+    ({                                                          \
+        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
+        ((f) = __nrspin_lock_irqsave(l));                       \
+    })
+unsigned long __nrspin_lock_irqsave(rspinlock_t *lock);
+void nrspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
+
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
 #define spin_lock_irq(l)              _spin_lock_irq(l)
@@ -270,12 +298,4 @@ void rspin_barrier(rspinlock_t *lock);
 /* Ensure a lock is quiescent between two critical operations. */
 #define spin_barrier(l)               _spin_barrier(l)
 
-#define nrspin_trylock(l)    spin_trylock(l)
-#define nrspin_lock(l)       spin_lock(l)
-#define nrspin_unlock(l)     spin_unlock(l)
-#define nrspin_lock_irq(l)   spin_lock_irq(l)
-#define nrspin_unlock_irq(l) spin_unlock_irq(l)
-#define nrspin_lock_irqsave(l, f)      spin_lock_irqsave(l, f)
-#define nrspin_unlock_irqrestore(l, f) spin_unlock_irqrestore(l, f)
-
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3



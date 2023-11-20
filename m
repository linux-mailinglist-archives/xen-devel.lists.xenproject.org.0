Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDC7F1275
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636670.992358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52ok-0006YS-Hx; Mon, 20 Nov 2023 11:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636670.992358; Mon, 20 Nov 2023 11:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52ok-0006Wn-FD; Mon, 20 Nov 2023 11:51:54 +0000
Received: by outflank-mailman (input) for mailman id 636670;
 Mon, 20 Nov 2023 11:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52dB-0004F8-9Z
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:39:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87682d39-8799-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:39:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2451C1F890;
 Mon, 20 Nov 2023 11:39:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB35A13499;
 Mon, 20 Nov 2023 11:39:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sn0pNItFW2VYPgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:39:55 +0000
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
X-Inumbo-ID: 87682d39-8799-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxQm8VKpt/YypSSTQTE1Vlc9wkxVTjdwWV8PElflCfU=;
	b=vWsYhtpt5Kk27mVQDVwvhwVi2ojVq8FtOX9ik8l663yMUtTBlWtPPG0g1SrMp4qJAeX+Qt
	aWVOUzxMCJBAzCFenGuo9XGVi/3AXvSHfVRXiuR75yYRhsG5PVCFEv3H1j0bVHJIN94u3P
	g04jDeMKKCUEDQ4nduyscxxRE/j4Fzk=
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
Subject: [PATCH v3 12/13] xen/spinlock: remove indirection through macros for spin_*() functions
Date: Mon, 20 Nov 2023 12:38:41 +0100
Message-Id: <20231120113842.5897-13-jgross@suse.com>
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

In reality all spin_*() functions are macros which are defined to just
call a related real function.

Remove this macro layer, as it is adding complexity without any gain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/spinlock.c      | 28 +++++++++---------
 xen/include/xen/spinlock.h | 58 +++++++++++++++-----------------------
 2 files changed, 36 insertions(+), 50 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 0467541f43..43c876b64a 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -332,30 +332,30 @@ static void always_inline spin_lock_common(spinlock_tickets_t *t,
     LOCK_PROFILE_GOT(block);
 }
 
-void _spin_lock(spinlock_t *lock)
+void spin_lock(spinlock_t *lock)
 {
     spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
                      NULL);
 }
 
-void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
+void spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
 {
     spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, cb, data);
 }
 
-void _spin_lock_irq(spinlock_t *lock)
+void spin_lock_irq(spinlock_t *lock)
 {
     ASSERT(local_irq_is_enabled());
     local_irq_disable();
-    _spin_lock(lock);
+    spin_lock(lock);
 }
 
-unsigned long _spin_lock_irqsave(spinlock_t *lock)
+unsigned long __spin_lock_irqsave(spinlock_t *lock)
 {
     unsigned long flags;
 
     local_irq_save(flags);
-    _spin_lock(lock);
+    spin_lock(lock);
     return flags;
 }
 
@@ -371,20 +371,20 @@ static void always_inline spin_unlock_common(spinlock_tickets_t *t,
     preempt_enable();
 }
 
-void _spin_unlock(spinlock_t *lock)
+void spin_unlock(spinlock_t *lock)
 {
     spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
 
-void _spin_unlock_irq(spinlock_t *lock)
+void spin_unlock_irq(spinlock_t *lock)
 {
-    _spin_unlock(lock);
+    spin_unlock(lock);
     local_irq_enable();
 }
 
-void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
+void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 {
-    _spin_unlock(lock);
+    spin_unlock(lock);
     local_irq_restore(flags);
 }
 
@@ -393,7 +393,7 @@ static int always_inline spin_is_locked_common(const spinlock_tickets_t *t)
     return t->head != t->tail;
 }
 
-int _spin_is_locked(const spinlock_t *lock)
+int spin_is_locked(const spinlock_t *lock)
 {
     return spin_is_locked_common(&lock->tickets);
 }
@@ -429,7 +429,7 @@ static int always_inline spin_trylock_common(spinlock_tickets_t *t,
     return 1;
 }
 
-int _spin_trylock(spinlock_t *lock)
+int spin_trylock(spinlock_t *lock)
 {
     return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
@@ -453,7 +453,7 @@ static void always_inline spin_barrier_common(spinlock_tickets_t *t,
     smp_mb();
 }
 
-void _spin_barrier(spinlock_t *lock)
+void spin_barrier(spinlock_t *lock)
 {
     spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index a2b1bb2df6..e4f2e36e4f 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -224,18 +224,30 @@ typedef struct rspinlock {
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
 #define rspin_lock_init(l) (*(l) = (rspinlock_t)RSPIN_LOCK_UNLOCKED)
 
-void _spin_lock(spinlock_t *lock);
-void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data);
-void _spin_lock_irq(spinlock_t *lock);
-unsigned long _spin_lock_irqsave(spinlock_t *lock);
+void spin_lock(spinlock_t *lock);
+void spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data);
+void spin_lock_irq(spinlock_t *lock);
+#define spin_lock_irqsave(l, f)                                 \
+    ({                                                          \
+        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
+        ((f) = __spin_lock_irqsave(l));                         \
+    })
+unsigned long __spin_lock_irqsave(spinlock_t *lock);
 
-void _spin_unlock(spinlock_t *lock);
-void _spin_unlock_irq(spinlock_t *lock);
-void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags);
+void spin_unlock(spinlock_t *lock);
+void spin_unlock_irq(spinlock_t *lock);
+void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags);
 
-int _spin_is_locked(const spinlock_t *lock);
-int _spin_trylock(spinlock_t *lock);
-void _spin_barrier(spinlock_t *lock);
+int spin_is_locked(const spinlock_t *lock);
+int spin_trylock(spinlock_t *lock);
+#define spin_trylock_irqsave(lock, flags)       \
+({                                              \
+    local_irq_save(flags);                      \
+    spin_trylock(lock) ?                        \
+    1 : ({ local_irq_restore(flags); 0; });     \
+})
+/* Ensure a lock is quiescent between two critical operations. */
+void spin_barrier(spinlock_t *lock);
 
 /*
  * rspin_[un]lock(): Use these forms when the lock can (safely!) be
@@ -270,32 +282,6 @@ void nrspin_unlock_irq(rspinlock_t *lock);
 unsigned long __nrspin_lock_irqsave(rspinlock_t *lock);
 void nrspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
 
-#define spin_lock(l)                  _spin_lock(l)
-#define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
-#define spin_lock_irq(l)              _spin_lock_irq(l)
-#define spin_lock_irqsave(l, f)                                 \
-    ({                                                          \
-        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
-        ((f) = _spin_lock_irqsave(l));                          \
-    })
-
-#define spin_unlock(l)                _spin_unlock(l)
-#define spin_unlock_irq(l)            _spin_unlock_irq(l)
-#define spin_unlock_irqrestore(l, f)  _spin_unlock_irqrestore(l, f)
-
-#define spin_is_locked(l)             _spin_is_locked(l)
-#define spin_trylock(l)               _spin_trylock(l)
-
-#define spin_trylock_irqsave(lock, flags)       \
-({                                              \
-    local_irq_save(flags);                      \
-    spin_trylock(lock) ?                        \
-    1 : ({ local_irq_restore(flags); 0; });     \
-})
-
 #define spin_lock_kick(l)             arch_lock_signal_wmb()
 
-/* Ensure a lock is quiescent between two critical operations. */
-#define spin_barrier(l)               _spin_barrier(l)
-
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8D7C838C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616448.958486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFfW-0002ga-7X; Fri, 13 Oct 2023 10:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616448.958486; Fri, 13 Oct 2023 10:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFfW-0002eE-48; Fri, 13 Oct 2023 10:45:22 +0000
Received: by outflank-mailman (input) for mailman id 616448;
 Fri, 13 Oct 2023 10:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrFXB-0002pr-TP
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:36:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66d52e32-69b4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:36:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5BE061FD94;
 Fri, 13 Oct 2023 10:36:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19065138EF;
 Fri, 13 Oct 2023 10:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XI/JBLsdKWVtNgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 10:36:43 +0000
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
X-Inumbo-ID: 66d52e32-69b4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697193403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nz51Qlpuj2Tl/kYO3yBEFcQPwvVcconkys6izklRADs=;
	b=iQSg7MhMVf8Ml7Qzqvn5NKW0oBixUtk/gl+kyjLiijTws24A5IcOXlcptgzlFkqDfK3Ncc
	VNs03qyRCYjqpJSmYz4pUy9QoggqmaQuurAq0PXx72RxuNs8d3wzWH1tQzLQ4SVooIKOFw
	R7iLMKxNalmqP7KP7dFK68e0MOvFZ2g=
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
Subject: [PATCH v2 12/13] xen/spinlock: remove indirection through macros for spin_*() functions
Date: Fri, 13 Oct 2023 11:42:23 +0200
Message-Id: <20231013094224.7060-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
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
index cff3f126e6..5fa5c1890a 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E187B870
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692893.1080543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOQ-0006DN-Mp; Thu, 14 Mar 2024 07:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692893.1080543; Thu, 14 Mar 2024 07:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOQ-00069u-IN; Thu, 14 Mar 2024 07:20:46 +0000
Received: by outflank-mailman (input) for mailman id 692893;
 Thu, 14 Mar 2024 07:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOO-0005cd-JJ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:20:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea5b875-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:20:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 849331F79B;
 Thu, 14 Mar 2024 07:20:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C51A13977;
 Thu, 14 Mar 2024 07:20:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 23g9CUul8mVEDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:20:43 +0000
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
X-Inumbo-ID: 5ea5b875-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SoHtTqibFLRHMVIneFYHEvHJn0+Pf8akCVrfANI5Kk=;
	b=UtjjGmvlEZgzkf0ajpqMhzvRwrdgeNDNME2mUCv+CJMiXhz3as7rV/7nj/7fiVFa0hsXix
	uWwNXwxF8MhGnXogt3ROWFqc4KsqhGqQAE0dYclbYLDV1ERRVQcjcsneH4fzA7F/53Bxck
	RNryG3rbnPYxLr2WLz1x3cnU7k1G7as=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SoHtTqibFLRHMVIneFYHEvHJn0+Pf8akCVrfANI5Kk=;
	b=UtjjGmvlEZgzkf0ajpqMhzvRwrdgeNDNME2mUCv+CJMiXhz3as7rV/7nj/7fiVFa0hsXix
	uWwNXwxF8MhGnXogt3ROWFqc4KsqhGqQAE0dYclbYLDV1ERRVQcjcsneH4fzA7F/53Bxck
	RNryG3rbnPYxLr2WLz1x3cnU7k1G7as=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 02/13] xen/spinlock: introduce new type for recursive spinlocks
Date: Thu, 14 Mar 2024 08:20:18 +0100
Message-Id: <20240314072029.16937-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
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
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Introduce a new type "rspinlock_t" to be used for recursive spinlocks.

For now it is only an alias of spinlock_t, so both types can still be
used for recursive spinlocks. This will be changed later, though.

Switch all recursive spinlocks to the new type.

Define the initializer helpers and use them where appropriate.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V2:
- carved out from V1 patch
V5:
- avoid MISRA violation (Julien Grall)
---
 xen/arch/x86/include/asm/mm.h |  2 +-
 xen/arch/x86/mm/mm-locks.h    |  2 +-
 xen/common/domain.c           |  4 ++--
 xen/common/ioreq.c            |  2 +-
 xen/drivers/char/console.c    |  4 ++--
 xen/drivers/passthrough/pci.c |  2 +-
 xen/include/xen/sched.h       |  6 +++---
 xen/include/xen/spinlock.h    | 19 +++++++++++++++----
 8 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 65d209d5ff..98b66edaca 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -597,7 +597,7 @@ unsigned long domain_get_maximum_gpfn(struct domain *d);
 
 /* Definition of an mm lock: spinlock with extra fields for debugging */
 typedef struct mm_lock {
-    spinlock_t         lock;
+    rspinlock_t        lock;
     int                unlock_level;
     int                locker;          /* processor which holds the lock */
     const char        *locker_function; /* func that took it */
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index 2eae73ac68..c25261b4c0 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -20,7 +20,7 @@ DECLARE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
 
 static inline void mm_lock_init(mm_lock_t *l)
 {
-    spin_lock_init(&l->lock);
+    rspin_lock_init(&l->lock);
     l->locker = -1;
     l->locker_function = "nobody";
     l->unlock_level = 0;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f6f5574996..8e0109c590 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -627,8 +627,8 @@ struct domain *domain_create(domid_t domid,
 
     atomic_set(&d->refcnt, 1);
     RCU_READ_LOCK_INIT(&d->rcu_lock);
-    spin_lock_init_prof(d, domain_lock);
-    spin_lock_init_prof(d, page_alloc_lock);
+    rspin_lock_init_prof(d, domain_lock);
+    rspin_lock_init_prof(d, page_alloc_lock);
     spin_lock_init(&d->hypercall_deadlock_mutex);
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 62b907f4c4..652c18a9b5 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1331,7 +1331,7 @@ unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
 
 void ioreq_domain_init(struct domain *d)
 {
-    spin_lock_init(&d->ioreq_server.lock);
+    rspin_lock_init(&d->ioreq_server.lock);
 
     arch_ioreq_domain_init(d);
 }
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d2cb0530b2..6a88a0b32c 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -119,7 +119,7 @@ static int __read_mostly sercon_handle = -1;
 int8_t __read_mostly opt_console_xen; /* console=xen */
 #endif
 
-static DEFINE_SPINLOCK(console_lock);
+static DEFINE_RSPINLOCK(console_lock);
 
 /*
  * To control the amount of printing, thresholds are added.
@@ -1177,7 +1177,7 @@ void console_force_unlock(void)
 {
     watchdog_disable();
     spin_debug_disable();
-    spin_lock_init(&console_lock);
+    rspin_lock_init(&console_lock);
     serial_force_unlock(sercon_handle);
     console_locks_busted = 1;
     console_start_sync();
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 6a1eda675d..b6b2196ab0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -50,7 +50,7 @@ struct pci_seg {
     } bus2bridge[MAX_BUSES];
 };
 
-static spinlock_t _pcidevs_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_RSPINLOCK(_pcidevs_lock);
 
 /* Do not use, as it has no speculation barrier, use pcidevs_lock() instead. */
 void pcidevs_lock_unsafe(void)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f5922f32..bc320f4e55 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -376,9 +376,9 @@ struct domain
 
     rcu_read_lock_t  rcu_lock;
 
-    spinlock_t       domain_lock;
+    rspinlock_t      domain_lock;
 
-    spinlock_t       page_alloc_lock; /* protects all the following fields  */
+    rspinlock_t      page_alloc_lock; /* protects all the following fields  */
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
@@ -620,7 +620,7 @@ struct domain
 #ifdef CONFIG_IOREQ_SERVER
     /* Lock protects all other values in the sub-struct */
     struct {
-        spinlock_t              lock;
+        rspinlock_t             lock;
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 8a443efc19..bbf12b93c4 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -46,7 +46,7 @@ union lock_debug { };
     lock profiling on:
 
     Global locks which should be subject to profiling must be declared via
-    DEFINE_SPINLOCK.
+    DEFINE_[R]SPINLOCK.
 
     For locks in structures further measures are necessary:
     - the structure definition must include a profile_head with exactly this
@@ -57,7 +57,7 @@ union lock_debug { };
     - the single locks which are subject to profiling have to be initialized
       via
 
-      spin_lock_init_prof(ptr, lock);
+      [r]spin_lock_init_prof(ptr, lock);
 
       with ptr being the main structure pointer and lock the spinlock field
 
@@ -110,12 +110,16 @@ struct lock_profile_qhead {
     spinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                 \
     static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \
     LOCK_PROFILE_PTR_(l)
+#define DEFINE_RSPINLOCK(l)                                                   \
+    rspinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                \
+    static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \
+    LOCK_PROFILE_PTR_(l)
 
-#define spin_lock_init_prof(s, l)                                             \
+#define spin_lock_init_prof__(s, l, locktype)                                 \
     do {                                                                      \
         struct lock_profile *prof;                                            \
         prof = xzalloc(struct lock_profile);                                  \
-        (s)->l = (spinlock_t)SPIN_LOCK_UNLOCKED_(prof);                       \
+        (s)->l = (locktype)SPIN_LOCK_UNLOCKED_(prof);                         \
         if ( !prof )                                                          \
         {                                                                     \
             printk(XENLOG_WARNING                                             \
@@ -129,6 +133,9 @@ struct lock_profile_qhead {
         (s)->profile_head.elem_q = prof;                                      \
     } while( 0 )
 
+#define spin_lock_init_prof(s, l) spin_lock_init_prof__(s, l, spinlock_t)
+#define rspin_lock_init_prof(s, l) spin_lock_init_prof__(s, l, rspinlock_t)
+
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
 void _lock_profile_deregister_struct(int32_t type,
@@ -152,8 +159,10 @@ struct lock_profile_qhead { };
     .debug = LOCK_DEBUG_,                                                     \
 }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
+#define DEFINE_RSPINLOCK(l) rspinlock_t l = SPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
+#define rspin_lock_init_prof(s, l) rspin_lock_init(&((s)->l))
 #define lock_profile_register_struct(type, ptr, idx)
 #define lock_profile_deregister_struct(type, ptr)
 #define spinlock_profile_printall(key)
@@ -183,8 +192,10 @@ typedef struct spinlock {
 #endif
 } spinlock_t;
 
+typedef spinlock_t rspinlock_t;
 
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
+#define rspin_lock_init(l) (*(l) = (rspinlock_t)SPIN_LOCK_UNLOCKED)
 
 void _spin_lock(spinlock_t *lock);
 void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *data), void *data);
-- 
2.35.3



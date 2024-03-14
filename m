Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716187B874
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692899.1080571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOi-0007Xp-Jc; Thu, 14 Mar 2024 07:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692899.1080571; Thu, 14 Mar 2024 07:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOi-0007UI-Fr; Thu, 14 Mar 2024 07:21:04 +0000
Received: by outflank-mailman (input) for mailman id 692899;
 Thu, 14 Mar 2024 07:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOg-0005rB-SA
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:21:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69000f81-e1d3-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:21:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CACBB1F79B;
 Thu, 14 Mar 2024 07:21:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BC6813977;
 Thu, 14 Mar 2024 07:21:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 69SvHFyl8mVWDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:21:00 +0000
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
X-Inumbo-ID: 69000f81-e1d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3Lzu5w3Sdvw06E/H34sX80jbLTV1UigAHpKpIJhJHE=;
	b=NJPhIVfe32Lkx0q3Y/1oQNem7v+szp2DChpY95VPQJ3hiKRJIlLgwLhRJecuw4TxPk9WfB
	vE2/JDXx/D3FSMJjDlWHMWaxdl3DM6pRn6hWCuR29OavCQzxQVlZn81x0Yv52Qe7izL1ht
	piKji4mpTMzF80KV1DJ02X8MoI75exM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3Lzu5w3Sdvw06E/H34sX80jbLTV1UigAHpKpIJhJHE=;
	b=NJPhIVfe32Lkx0q3Y/1oQNem7v+szp2DChpY95VPQJ3hiKRJIlLgwLhRJecuw4TxPk9WfB
	vE2/JDXx/D3FSMJjDlWHMWaxdl3DM6pRn6hWCuR29OavCQzxQVlZn81x0Yv52Qe7izL1ht
	piKji4mpTMzF80KV1DJ02X8MoI75exM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 05/13] xen/spinlock: make struct lock_profile rspinlock_t aware
Date: Thu, 14 Mar 2024 08:20:21 +0100
Message-Id: <20240314072029.16937-6-jgross@suse.com>
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
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Struct lock_profile contains a pointer to the spinlock it is associated
with. Prepare support of differing spinlock_t and rspinlock_t types by
adding a type indicator of the pointer. Use the highest bit of the
block_cnt member for this indicator in order to not grow the struct
while hurting only the slow path with slightly less performant code.
Note that this requires a cast when printing the value in order to be
format compliant.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V2:
- new patch
V5:
- use bool for is_rlock (Julien Grall)
- use unsigned int for lockval in spinlock_profile_print_elem()
  (Jan Beulich)
- don't use anonymous union (Jan Beulich)
---
 xen/common/spinlock.c      | 28 ++++++++++++++++++++--------
 xen/include/xen/spinlock.h | 14 ++++++++++----
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 5ef0ac7f89..0e8b525cec 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
 static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
-    struct spinlock *lock = data->lock;
+    unsigned int cpu;
+    unsigned int lockval;
+
+    if ( data->is_rlock )
+    {
+        cpu = data->ptr.rlock->debug.cpu;
+        lockval = data->ptr.rlock->tickets.head_tail;
+    }
+    else
+    {
+        cpu = data->ptr.lock->debug.cpu;
+        lockval = data->ptr.lock->tickets.head_tail;
+    }
 
     printk("%s ", lock_profile_ancs[type].name);
     if ( type != LOCKPROF_TYPE_GLOBAL )
         printk("%d ", idx);
-    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
-           lock->tickets.head_tail);
-    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
+    printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);
+    if ( cpu == SPINLOCK_NO_CPU )
         printk("not locked\n");
     else
-        printk("cpu=%d\n", lock->debug.cpu);
-    printk("  lock:%" PRId64 "(%" PRI_stime "), block:%" PRId64 "(%" PRI_stime ")\n",
-           data->lock_cnt, data->time_hold, data->block_cnt, data->time_block);
+        printk("cpu=%u\n", cpu);
+    printk("  lock:%" PRIu64 "(%" PRI_stime "), block:%" PRIu64 "(%" PRI_stime ")\n",
+           data->lock_cnt, data->time_hold, (uint64_t)data->block_cnt,
+           data->time_block);
 }
 
 void cf_check spinlock_profile_printall(unsigned char key)
@@ -680,7 +692,7 @@ static int __init cf_check lock_prof_init(void)
     {
         (*q)->next = lock_profile_glb_q.elem_q;
         lock_profile_glb_q.elem_q = *q;
-        (*q)->lock->profile = *q;
+        (*q)->ptr.lock->profile = *q;
     }
 
     _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index afa24c8e29..49c5115f52 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -77,13 +77,19 @@ union lock_debug { };
 */
 
 struct spinlock;
+/* Temporary hack until a dedicated struct rspinlock is existing. */
+#define rspinlock spinlock
 
 struct lock_profile {
     struct lock_profile *next;       /* forward link */
     const char          *name;       /* lock name */
-    struct spinlock     *lock;       /* the lock itself */
+    union {
+        struct spinlock *lock;       /* the lock itself */
+        struct rspinlock *rlock;     /* the recursive lock itself */
+    } ptr;
     uint64_t            lock_cnt;    /* # of complete locking ops */
-    uint64_t            block_cnt;   /* # of complete wait for lock */
+    uint64_t            block_cnt:63; /* # of complete wait for lock */
+    bool                is_rlock:1;  /* use rlock pointer */
     s_time_t            time_hold;   /* cumulated lock time */
     s_time_t            time_block;  /* cumulated wait time */
     s_time_t            time_locked; /* system time of last locking */
@@ -95,7 +101,7 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define LOCK_PROFILE_(lockname) { .name = #lockname, .lock = &(lockname), }
+#define LOCK_PROFILE_(lockname) { .name = #lockname, .ptr.lock = &(lockname), }
 #define LOCK_PROFILE_PTR_(name)                                               \
     static struct lock_profile * const lock_profile__##name                   \
     __used_section(".lockprofile.data") =                                     \
@@ -128,7 +134,7 @@ struct lock_profile_qhead {
             break;                                                            \
         }                                                                     \
         prof->name = #l;                                                      \
-        prof->lock = &(s)->l;                                                 \
+        prof->ptr.lock = &(s)->l;                                             \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
     } while( 0 )
-- 
2.35.3



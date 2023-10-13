Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE87C8330
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616413.958416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFWj-0003QD-IP; Fri, 13 Oct 2023 10:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616413.958416; Fri, 13 Oct 2023 10:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFWj-0003Nq-F2; Fri, 13 Oct 2023 10:36:17 +0000
Received: by outflank-mailman (input) for mailman id 616413;
 Fri, 13 Oct 2023 10:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrFWh-0002pr-PO
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:36:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553286f6-69b4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:36:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B66BF1F37E;
 Fri, 13 Oct 2023 10:36:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72EA7138EF;
 Fri, 13 Oct 2023 10:36:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g9q5Gp0dKWUpNgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 10:36:13 +0000
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
X-Inumbo-ID: 553286f6-69b4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697193373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klB1BPybU60Z69KLLAN7OEkcpRKvUZOAtBgC/BqL140=;
	b=Tf/SZchrgUjKSv/FG/Pj5RLnHcRYvnxpZpfTwPj/QRb+hpEtwgcKJNCB3l3BF+svXXQs6W
	BNvUv42W2/KEKxm6hUpCBoQ+HMiS34VoX4JYnpXGwtYnDN2h7+XHWE3X3oFmCLyWPUW63k
	uM4qmoPBY5PXr1exeT/aO4IlDbki94o=
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
Subject: [PATCH v2 07/13] xen/spinlock: make struct lock_profile rspinlock_t aware
Date: Fri, 13 Oct 2023 11:42:18 +0200
Message-Id: <20231013094224.7060-8-jgross@suse.com>
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

Struct lock_profile contains a pointer to the spinlock it is associated
with. Prepare support of differing spinlock_t and rspinlock_t types by
adding a type indicator of the pointer. Use the highest bit of the
block_cnt member for this indicator in order to not grow the struct
while hurting only the slow path with slightly less performant code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/spinlock.c      | 26 +++++++++++++++++++-------
 xen/include/xen/spinlock.h | 10 ++++++++--
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 3b1d1fd8d5..7b8e842eba 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
 static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
-    struct spinlock *lock = data->lock;
+    unsigned int cpu;
+    uint32_t lockval;
+
+    if ( data->is_rlock )
+    {
+        cpu = data->rlock->debug.cpu;
+        lockval = data->rlock->tickets.head_tail;
+    }
+    else
+    {
+        cpu = data->lock->debug.cpu;
+        lockval = data->lock->tickets.head_tail;
+    }
 
     printk("%s ", lock_profile_ancs[type].name);
     if ( type != LOCKPROF_TYPE_GLOBAL )
         printk("%d ", idx);
-    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
-           lock->tickets.head_tail);
-    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
+    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);
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
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 53f0f72ac4..5ada9dce3d 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -76,13 +76,19 @@ union lock_debug { };
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
+    };
     uint64_t            lock_cnt;    /* # of complete locking ops */
-    uint64_t            block_cnt;   /* # of complete wait for lock */
+    uint64_t            block_cnt:63; /* # of complete wait for lock */
+    uint64_t            is_rlock:1;  /* use rlock pointer */
     s_time_t            time_hold;   /* cumulated lock time */
     s_time_t            time_block;  /* cumulated wait time */
     s_time_t            time_locked; /* system time of last locking */
-- 
2.35.3



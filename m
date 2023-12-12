Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FF80E81C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652854.1018950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMz-0000pJ-Lk; Tue, 12 Dec 2023 09:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652854.1018950; Tue, 12 Dec 2023 09:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMz-0000lX-Ig; Tue, 12 Dec 2023 09:48:05 +0000
Received: by outflank-mailman (input) for mailman id 652854;
 Tue, 12 Dec 2023 09:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzMx-0006i7-VO
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:48:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a5709ba-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:48:02 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F229E1F74C;
 Tue, 12 Dec 2023 09:48:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B58C8139E9;
 Tue, 12 Dec 2023 09:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id DcYlK1EseGXSfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:48:01 +0000
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
X-Inumbo-ID: 8a5709ba-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImgxXwya7OlVCWVkU9MisuGH03hg4qJ0KBDJY6FOy/8=;
	b=egqNoIMtSq3uUlnt7OwPH2OSCEPrReq3lJDG0WY8H8IIlp3ftCWMOwz5zGGQK7qUUz2Wg/
	e5ZlVA1M/bd8vHbQRuM7vKgxOcVpwwo4nt33c7fyvU78uIppYm1WfEQj3SBmXnVKBqQxde
	KR9cvPuPUQiZGDDEuOldP7QE6bOnNUg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImgxXwya7OlVCWVkU9MisuGH03hg4qJ0KBDJY6FOy/8=;
	b=egqNoIMtSq3uUlnt7OwPH2OSCEPrReq3lJDG0WY8H8IIlp3ftCWMOwz5zGGQK7qUUz2Wg/
	e5ZlVA1M/bd8vHbQRuM7vKgxOcVpwwo4nt33c7fyvU78uIppYm1WfEQj3SBmXnVKBqQxde
	KR9cvPuPUQiZGDDEuOldP7QE6bOnNUg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v4 06/12] xen/spinlock: make struct lock_profile rspinlock_t aware
Date: Tue, 12 Dec 2023 10:47:19 +0100
Message-Id: <20231212094725.22184-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 8.80
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ********
X-Spam-Score: 8.80
X-Spamd-Result: default: False [8.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[99.99%];
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
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Struct lock_profile contains a pointer to the spinlock it is associated
with. Prepare support of differing spinlock_t and rspinlock_t types by
adding a type indicator of the pointer. Use the highest bit of the
block_cnt member for this indicator in order to not grow the struct
while hurting only the slow path with slightly less performant code.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
V2:
- new patch
---
 xen/common/spinlock.c      | 26 +++++++++++++++++++-------
 xen/include/xen/spinlock.h | 10 ++++++++--
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index c1a9ba1304..7d611d3d7d 100644
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
index 05b97c1e03..ac3bef267a 100644
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



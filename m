Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A67A3C1CF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893001.1301945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkuI-0007DJ-6k; Wed, 19 Feb 2025 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893001.1301945; Wed, 19 Feb 2025 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkuI-0007Ak-2E; Wed, 19 Feb 2025 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 893001;
 Wed, 19 Feb 2025 14:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+C6=VK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tkkuG-00079l-Cw
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:18:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65181e20-eecc-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 15:18:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17D6A216E2;
 Wed, 19 Feb 2025 14:18:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A65FC137DB;
 Wed, 19 Feb 2025 14:18:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /dQ7JTLotWdLGgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 19 Feb 2025 14:18:26 +0000
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
X-Inumbo-ID: 65181e20-eecc-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739974708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIHaPxbqqDmZAc48GzFuZRKqCUFbN6wrxN6iWc0P5C0=;
	b=AWWMiTmPk6LZgjc0u9w/q/8WAPetSsfI8YrCnYeN5kM2Y39MaXQ3YVpzVsK37D/LS4JVPc
	svSMZs1OXn/td0x5h+3jrnM+7XxIKs+edAR0brMdvqo0fd9ITGPEa1auNeufLA/5iByHTJ
	uqVXDwxUEv8JtEnv1cuYscfjOIku+rk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739974707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIHaPxbqqDmZAc48GzFuZRKqCUFbN6wrxN6iWc0P5C0=;
	b=tDC8xgjNLE0Iq6woM0R8Iy/WzsGUVLFBb+1SlhbxsDPOkY/zjFU8slRGqfxKUaxsNPH16d
	u0TDRGB2A8pWTguRqxMiXWzhkZ8tsXrWePCC6XgRRWzfbi9eAppa6xDod2wN2ziCEV2JRI
	39LP5+WloopMMP4psKG0OHy9c0nFIt8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] xen/list: avoid UB in list iterators
Date: Wed, 19 Feb 2025 15:18:17 +0100
Message-ID: <20250219141818.8789-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219141818.8789-1-jgross@suse.com>
References: <20250219141818.8789-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

The list_for_each_entry*() iterators are testing for having reached the
end of the list in a way which relies on undefined behavior: the
iterator (being a pointer to the struct of a list element) is advanced
and only then tested to have reached not the next element, but the list
head. This results in the list head being addressed via a list element
pointer, which is undefined, in case the list elements have a higher
alignment than the list head.

Avoid that by testing for the end of the list before advancing the
iterator. In case of having reached the end of the list, set the
iterator to NULL and use that for stopping the loop. This has the
additional advantage of not leaking the iterator pointing to something
which isn't a list element past the loop.

There is one case in the Xen code where the iterator is used after
the loop: it is tested to be non-NULL to indicate the loop has run
until reaching the end of the list. This case is modified to use the
iterator being NULL for indicating the end of the list has been
reached.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
No proper Fixes: tag, as this bug predates Xen's git and mercurial
history.
V2:
- fix one use case (Jan Beulich)
- let list_is_first() return bool, rename parameter (Jan Beulich)
- paranthesize iterator when used as non-NULL test (Jan Beulich)
- avoid dereferencing NULL in the safe iterators (Jan Beulich)
---
 xen/drivers/passthrough/x86/hvm.c |   3 +-
 xen/include/xen/list.h            | 110 +++++++++++++++++++-----------
 2 files changed, 73 insertions(+), 40 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index f5faff7a49..213dd60340 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -639,12 +639,11 @@ int pt_irq_destroy_bind(
             {
                 list_del(&girq->list);
                 xfree(girq);
-                girq = NULL;
                 break;
             }
         }
 
-        if ( girq )
+        if ( !girq )
         {
             write_unlock(&d->event_lock);
             return -EINVAL;
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 62169f4674..d90b3f6f0d 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -291,6 +291,17 @@ static inline void list_move_tail(struct list_head *list,
     list_add_tail(list, head);
 }
 
+/**
+ * list_is_first - tests whether @entry is the first entry in list @head
+ * @entry: the entry to test
+ * @head: the head of the list
+ */
+static inline bool list_is_first(const struct list_head *entry,
+                                 const struct list_head *head)
+{
+    return entry->prev == head;
+}
+
 /**
  * list_is_last - tests whether @list is the last entry in list @head
  * @list: the entry to test
@@ -440,7 +451,19 @@ static inline void list_splice_init(struct list_head *list,
   */
 #define list_next_entry(pos, member) \
         list_entry((pos)->member.next, typeof(*(pos)), member)
- 
+
+/**
+  * list_next_entry_or_null - get the next element in list
+  * @pos:        the type * to cursor
+  * @member:     the name of the struct list_head within the struct.
+  *
+  * Note that if the end of the list is reached, it returns NULL.
+  */
+#define list_next_entry_or_null(head, pos, member)                 \
+        ((!(pos) || list_is_last(&(pos)->member, head))            \
+         ? NULL                                                    \
+         : list_entry((pos)->member.next, typeof(*(pos)), member))
+
 /**
   * list_prev_entry - get the prev element in list
   * @pos:        the type * to cursor
@@ -449,6 +472,18 @@ static inline void list_splice_init(struct list_head *list,
 #define list_prev_entry(pos, member) \
         list_entry((pos)->member.prev, typeof(*(pos)), member)
 
+/**
+  * list_prev_entry_or_null - get the prev element in list
+  * @pos:        the type * to cursor
+  * @member:     the name of the struct list_head within the struct.
+  *
+  * Note that if the start of the list is reached, it returns NULL.
+  */
+#define list_prev_entry_or_null(head, pos, member)                 \
+        ((!(pos) || list_is_first(&(pos)->member, head))           \
+         ? NULL                                                    \
+         : list_entry((pos)->member.prev, typeof(*(pos)), member))
+
 /**
  * list_for_each    -    iterate over a list
  * @pos:    the &struct list_head to use as a loop cursor.
@@ -492,10 +527,10 @@ static inline void list_splice_init(struct list_head *list,
  * @head:   the head for your list.
  * @member: the name of the list_struct within the struct.
  */
-#define list_for_each_entry(pos, head, member)                          \
-    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
-         &(pos)->member != (head);                                      \
-         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
+#define list_for_each_entry(pos, head, member)                            \
+    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
+          (pos);                                                          \
+          (pos) = list_next_entry_or_null(head, pos, member) )
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
@@ -503,10 +538,10 @@ static inline void list_splice_init(struct list_head *list,
  * @head:   the head for your list.
  * @member: the name of the list_struct within the struct.
  */
-#define list_for_each_entry_reverse(pos, head, member)                  \
-    for ((pos) = list_entry((head)->prev, typeof(*(pos)), member);      \
-         &(pos)->member != (head);                                      \
-         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
+#define list_for_each_entry_reverse(pos, head, member)                   \
+    for ( (pos) = list_last_entry_or_null(head, typeof(*(pos)), member); \
+          (pos);                                                         \
+          (pos) = list_prev_entry_or_null(head, pos, member) )
 
 /**
  * list_prepare_entry - prepare a pos entry for use in
@@ -530,10 +565,10 @@ static inline void list_splice_init(struct list_head *list,
  * Continue to iterate over list of given type, continuing after
  * the current position.
  */
-#define list_for_each_entry_continue(pos, head, member)                   \
-    for ((pos) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
-         &(pos)->member != (head);                                        \
-         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
+#define list_for_each_entry_continue(pos, head, member)        \
+    for ( (pos) = list_next_entry_or_null(head, pos, member);  \
+          (pos);                                               \
+          (pos) = list_next_entry_or_null(head, pos, member) )
 
 /**
  * list_for_each_entry_from - iterate over list of given type from the
@@ -544,9 +579,8 @@ static inline void list_splice_init(struct list_head *list,
  *
  * Iterate over list of given type, continuing from current position.
  */
-#define list_for_each_entry_from(pos, head, member)                     \
-    for (; &(pos)->member != (head);                                    \
-         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
+#define list_for_each_entry_from(pos, head, member)            \
+    for ( ; (pos); (pos) = list_next_entry_or_null(head, pos, member) )
 
 /**
  * list_for_each_entry_safe - iterate over list of given type safe
@@ -556,11 +590,11 @@ static inline void list_splice_init(struct list_head *list,
  * @head:   the head for your list.
  * @member: the name of the list_struct within the struct.
  */
-#define list_for_each_entry_safe(pos, n, head, member)                  \
-    for ((pos) = list_entry((head)->next, typeof(*(pos)), member),      \
-         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
-         &(pos)->member != (head);                                      \
-         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
+#define list_for_each_entry_safe(pos, n, head, member)                     \
+    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member),  \
+          (n) = (pos) ? list_next_entry_or_null(head, pos, member) : NULL; \
+          (pos);                                                           \
+          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )
 
 /**
  * list_for_each_entry_safe_continue
@@ -572,11 +606,11 @@ static inline void list_splice_init(struct list_head *list,
  * Iterate over list of given type, continuing after current point,
  * safe against removal of list entry.
  */
-#define list_for_each_entry_safe_continue(pos, n, head, member)           \
-    for ((pos) = list_entry((pos)->member.next, typeof(*(pos)), member),  \
-         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);    \
-         &(pos)->member != (head);                                        \
-         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
+#define list_for_each_entry_safe_continue(pos, n, head, member)            \
+    for ( (pos) = list_next_entry_or_null(head, pos, member),              \
+          (n) = (pos) ? list_next_entry_or_null(head, pos, member) : NULL; \
+          (pos);                                                           \
+          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )
 
 /**
  * list_for_each_entry_safe_from
@@ -589,9 +623,9 @@ static inline void list_splice_init(struct list_head *list,
  * removal of list entry.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member)             \
-    for ((n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
-         &(pos)->member != (head);                                      \
-         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
+    for ( (n) = list_next_entry_or_null(head, pos, member);             \
+          (pos);                                                        \
+          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )
 
 /**
  * list_for_each_entry_safe_reverse
@@ -603,11 +637,11 @@ static inline void list_splice_init(struct list_head *list,
  * Iterate backwards over list of given type, safe against removal
  * of list entry.
  */
-#define list_for_each_entry_safe_reverse(pos, n, head, member)          \
-    for ((pos) = list_entry((head)->prev, typeof(*(pos)), member),      \
-         (n) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
-         &(pos)->member != (head);                                      \
-         (pos) = (n), (n) = list_entry((n)->member.prev, typeof(*(n)), member))
+#define list_for_each_entry_safe_reverse(pos, n, head, member)             \
+    for ( (pos) = list_last_entry_or_null(head, typeof(*(pos)), member),   \
+          (n) = (pos) ? list_prev_entry_or_null(head, pos, member) : NULL; \
+          (pos);                                                           \
+          (pos) = (n), (n) = list_prev_entry_or_null(head, n, member) )
 
 /**
  * list_for_each_rcu - iterate over an rcu-protected list
@@ -655,10 +689,10 @@ static inline void list_splice_init(struct list_head *list,
  * the _rcu list-mutation primitives such as list_add_rcu()
  * as long as the traversal is guarded by rcu_read_lock().
  */
-#define list_for_each_entry_rcu(pos, head, member)                      \
-    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
-         &rcu_dereference(pos)->member != (head);                       \
-         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
+#define list_for_each_entry_rcu(pos, head, member)                        \
+    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
+          rcu_dereference(pos);                                           \
+          (pos) = list_next_entry_or_null(head, pos, member) )
 
 /**
  * list_for_each_continue_rcu
-- 
2.43.0



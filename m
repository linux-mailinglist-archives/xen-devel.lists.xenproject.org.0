Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4298A373C9
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889559.1298647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbom-0008Kl-OR; Sun, 16 Feb 2025 10:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889559.1298647; Sun, 16 Feb 2025 10:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbom-0008I1-LU; Sun, 16 Feb 2025 10:24:08 +0000
Received: by outflank-mailman (input) for mailman id 889559;
 Sun, 16 Feb 2025 10:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6kBj=VH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjbol-00083Q-Bf
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:24:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 264b0b4d-ec50-11ef-9896-31a8f345e629;
 Sun, 16 Feb 2025 11:24:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BDF52115F;
 Sun, 16 Feb 2025 10:24:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0629136AD;
 Sun, 16 Feb 2025 10:24:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uHQQMcS8sWfDVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 16 Feb 2025 10:24:04 +0000
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
X-Inumbo-ID: 264b0b4d-ec50-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMfhHc8OcBMynqiMBgDjOfMr+fPHZk/oop8YZ+vVWZI=;
	b=BVB7Lwe71CgiwKqisO4xiboZwxIrEXzYbcweOaPLlbAv4XpJx1AqsSYzoCivclDVk3dESK
	Q1+fLwi03LO183OQAnNLiNnBaah6PK9ZE1+kuke7+ovc3GvdCrVJXjgNQrZ/Ey3JQ661AM
	CtyxmoFpHM6gwSJ+7lu1wxXj97EYjjE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMfhHc8OcBMynqiMBgDjOfMr+fPHZk/oop8YZ+vVWZI=;
	b=BVB7Lwe71CgiwKqisO4xiboZwxIrEXzYbcweOaPLlbAv4XpJx1AqsSYzoCivclDVk3dESK
	Q1+fLwi03LO183OQAnNLiNnBaah6PK9ZE1+kuke7+ovc3GvdCrVJXjgNQrZ/Ey3JQ661AM
	CtyxmoFpHM6gwSJ+7lu1wxXj97EYjjE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/list: avoid UB in list iterators
Date: Sun, 16 Feb 2025 11:23:55 +0100
Message-ID: <20250216102356.18801-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216102356.18801-1-jgross@suse.com>
References: <20250216102356.18801-1-jgross@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
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
alignment then the list head.

Avoid that by testing for the end of the list before advancing the
iterator. In case of having reached the end of the list, set the
iterator to NULL and use that for stopping the loop. This has the
additional advantage of not leaking the iterator pointing to something
which isn't a list element past the loop.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
No proper Fixes: tag, as this bug predates Xen's git and mercurial
history.
---
 xen/include/xen/list.h | 110 +++++++++++++++++++++++++++--------------
 1 file changed, 72 insertions(+), 38 deletions(-)

diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 62169f4674..e6ece77225 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -291,6 +291,17 @@ static inline void list_move_tail(struct list_head *list,
     list_add_tail(list, head);
 }
 
+/**
+ * list_is_first - tests whether @list is the first entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_first(const struct list_head *list,
+                                const struct list_head *head)
+{
+    return list->prev == head;
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
+  * @member:     the name of the struct list_head  within the struct.
+  *
+  * Note that if the end of the list is reached, it returns NULL.
+  */
+#define list_next_entry_or_null(head, pos, member)               \
+        list_is_last(&(pos)->member, head)                       \
+        ? NULL                                                   \
+        : list_entry((pos)->member.next, typeof(*(pos)), member)
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
+#define list_prev_entry_or_null(head, pos, member)               \
+        list_is_first(&(pos)->member, head)                      \
+        ? NULL                                                   \
+        : list_entry((pos)->member.prev, typeof(*(pos)), member)
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
+          pos;                                                            \
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
+          pos;                                                           \
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
+          pos;                                                 \
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
+    for ( ; pos; (pos) = list_next_entry_or_null(head, pos, member) )
 
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
+          pos;                                                             \
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
+          pos;                                                             \
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
+          pos;                                                          \
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
+          pos;                                                             \
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



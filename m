Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B725AA373CA
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889560.1298658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbor-0000BH-W9; Sun, 16 Feb 2025 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889560.1298658; Sun, 16 Feb 2025 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbor-00008p-SI; Sun, 16 Feb 2025 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 889560;
 Sun, 16 Feb 2025 10:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6kBj=VH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjboq-00007l-Fz
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:24:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29ad1798-ec50-11ef-9aa5-95dc52dad729;
 Sun, 16 Feb 2025 11:24:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04EAD1F37E;
 Sun, 16 Feb 2025 10:24:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A50A8136AD;
 Sun, 16 Feb 2025 10:24:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PqC8Jsq8sWfKVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 16 Feb 2025 10:24:10 +0000
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
X-Inumbo-ID: 29ad1798-ec50-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2qGdWe7POlFskuJ7EcrRsYztKPnOOgfbknkxdVFKfA=;
	b=ctDQgcyPnKbx1A5XOjfLKI6Q/NNbs+NwJjheLRY1oJO1OSvGeZd3/UCaJFH9tAKSQtOb+Q
	BgQTbjYdz1uefI3cGT2gCSQHQOZR8/EHiLF45r8xQh4QoPm8eKx5ID4MlAxF5I2yzcMB71
	JgyvIejTmRdOYgd561xVET8PsPsPaso=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ctDQgcyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2qGdWe7POlFskuJ7EcrRsYztKPnOOgfbknkxdVFKfA=;
	b=ctDQgcyPnKbx1A5XOjfLKI6Q/NNbs+NwJjheLRY1oJO1OSvGeZd3/UCaJFH9tAKSQtOb+Q
	BgQTbjYdz1uefI3cGT2gCSQHQOZR8/EHiLF45r8xQh4QoPm8eKx5ID4MlAxF5I2yzcMB71
	JgyvIejTmRdOYgd561xVET8PsPsPaso=
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
Subject: [PATCH 2/2] xen/list: fix comments in include/xen/list.h
Date: Sun, 16 Feb 2025 11:23:56 +0100
Message-ID: <20250216102356.18801-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216102356.18801-1-jgross@suse.com>
References: <20250216102356.18801-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04EAD1F37E
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

There are several places in list.h where "list_struct" is used instead
of "struct list_head". Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xen/list.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index e6ece77225..e87a433a1d 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -395,7 +395,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_entry - get the struct for this entry
  * @ptr:    the &struct list_head pointer.
  * @type:    the type of the struct this is embedded in.
- * @member:    the name of the list_struct within the struct.
+ * @member:    the name of the struct list_head within the struct.
  */
 #define list_entry(ptr, type, member) \
     container_of(ptr, type, member)
@@ -404,7 +404,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_first_entry - get the first element from a list
  * @ptr:        the list head to take the element from.
  * @type:       the type of the struct this is embedded in.
- * @member:     the name of the list_struct within the struct.
+ * @member:     the name of the struct list_head within the struct.
  *
  * Note, that list is expected to be not empty.
  */
@@ -415,7 +415,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_last_entry - get the last element from a list
  * @ptr:        the list head to take the element from.
  * @type:       the type of the struct this is embedded in.
- * @member:     the name of the list_struct within the struct.
+ * @member:     the name of the struct list_head within the struct.
  *
  * Note, that list is expected to be not empty.
  */
@@ -426,7 +426,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_first_entry_or_null - get the first element from a list
  * @ptr:        the list head to take the element from.
  * @type:       the type of the struct this is embedded in.
- * @member:     the name of the list_struct within the struct.
+ * @member:     the name of the struct list_head within the struct.
  *
  * Note that if the list is empty, it returns NULL.
  */
@@ -437,7 +437,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_last_entry_or_null - get the last element from a list
  * @ptr:        the list head to take the element from.
  * @type:       the type of the struct this is embedded in.
- * @member:     the name of the list_struct within the struct.
+ * @member:     the name of the struct list_head within the struct.
  *
  * Note that if the list is empty, it returns NULL.
  */
@@ -447,7 +447,7 @@ static inline void list_splice_init(struct list_head *list,
 /**
   * list_next_entry - get the next element in list
   * @pos:        the type * to cursor
-  * @member:     the name of the list_struct within the struct.
+  * @member:     the name of the struct list_head within the struct.
   */
 #define list_next_entry(pos, member) \
         list_entry((pos)->member.next, typeof(*(pos)), member)
@@ -467,7 +467,7 @@ static inline void list_splice_init(struct list_head *list,
 /**
   * list_prev_entry - get the prev element in list
   * @pos:        the type * to cursor
-  * @member:     the name of the list_struct within the struct.
+  * @member:     the name of the struct list_head within the struct.
   */
 #define list_prev_entry(pos, member) \
         list_entry((pos)->member.prev, typeof(*(pos)), member)
@@ -525,7 +525,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_for_each_entry - iterate over list of given type
  * @pos:    the type * to use as a loop cursor.
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  */
 #define list_for_each_entry(pos, head, member)                            \
     for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
@@ -536,7 +536,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_for_each_entry_reverse - iterate backwards over list of given type.
  * @pos:    the type * to use as a loop cursor.
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)                   \
     for ( (pos) = list_last_entry_or_null(head, typeof(*(pos)), member); \
@@ -548,7 +548,7 @@ static inline void list_splice_init(struct list_head *list,
  *                      list_for_each_entry_continue
  * @pos:    the type * to use as a start point
  * @head:   the head of the list
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Prepares a pos entry for use as a start point in
  * list_for_each_entry_continue.
@@ -560,7 +560,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_for_each_entry_continue - continue iteration over list of given type
  * @pos:    the type * to use as a loop cursor.
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Continue to iterate over list of given type, continuing after
  * the current position.
@@ -575,7 +575,7 @@ static inline void list_splice_init(struct list_head *list,
  *                            current point
  * @pos:    the type * to use as a loop cursor.
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Iterate over list of given type, continuing from current position.
  */
@@ -588,7 +588,7 @@ static inline void list_splice_init(struct list_head *list,
  * @pos:    the type * to use as a loop cursor.
  * @n:      another type * to use as temporary storage
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)                     \
     for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member),  \
@@ -601,7 +601,7 @@ static inline void list_splice_init(struct list_head *list,
  * @pos:    the type * to use as a loop cursor.
  * @n:      another type * to use as temporary storage
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Iterate over list of given type, continuing after current point,
  * safe against removal of list entry.
@@ -617,7 +617,7 @@ static inline void list_splice_init(struct list_head *list,
  * @pos:    the type * to use as a loop cursor.
  * @n:      another type * to use as temporary storage
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Iterate over list of given type from current point, safe against
  * removal of list entry.
@@ -632,7 +632,7 @@ static inline void list_splice_init(struct list_head *list,
  * @pos:    the type * to use as a loop cursor.
  * @n:      another type * to use as temporary storage
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * Iterate backwards over list of given type, safe against removal
  * of list entry.
@@ -683,7 +683,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_for_each_entry_rcu - iterate over rcu list of given type
  * @pos:    the type * to use as a loop cursor.
  * @head:   the head for your list.
- * @member: the name of the list_struct within the struct.
+ * @member: the name of the struct list_head within the struct.
  *
  * This list-traversal primitive may safely run concurrently with
  * the _rcu list-mutation primitives such as list_add_rcu()
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630C876319
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690222.1076020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006ZS-Or; Fri, 08 Mar 2024 11:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690222.1076020; Fri, 08 Mar 2024 11:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006U9-Ks; Fri, 08 Mar 2024 11:21:14 +0000
Received: by outflank-mailman (input) for mailman id 690222;
 Fri, 08 Mar 2024 11:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHp-00067S-JD
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f86ed5ae-dd3d-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 12:21:12 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id EE06F4EE074F;
 Fri,  8 Mar 2024 12:21:11 +0100 (CET)
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
X-Inumbo-ID: f86ed5ae-dd3d-11ee-afda-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/7] xen/list: address violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:21:00 +0100
Message-Id: <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709896401.git.nicola.vetrini@bugseng.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- changes to list.h are all in this patch;
- Parenthesized some instances of "pos" and "n" even when already
covered by the deviation on the lhs of an assingment for consistency.
---
 xen/include/xen/list.h | 83 +++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index b5eab3a1eb6c..27cafcce2c82 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -479,9 +479,9 @@ static inline void list_splice_init(struct list_head *list,
  * @n:      another &struct list_head to use as temporary storage
  * @head:   the head for your list.
  */
-#define list_for_each_backwards_safe(pos, n, head)              \
-    for ( pos = (head)->prev, n = pos->prev; pos != (head);     \
-          pos = n, n = pos->prev )
+#define list_for_each_backwards_safe(pos, n, head)                 \
+    for ( (pos) = (head)->prev, n = (pos)->prev; (pos) != (head);  \
+          (pos) = n, n = (pos)->prev )
 
 /**
  * list_for_each_entry - iterate over list of given type
@@ -490,9 +490,9 @@ static inline void list_splice_init(struct list_head *list,
  * @member: the name of the list_struct within the struct.
  */
 #define list_for_each_entry(pos, head, member)                          \
-    for (pos = list_entry((head)->next, typeof(*pos), member);          \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
+         &(pos)->member != (head);                                      \
+         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
@@ -501,9 +501,9 @@ static inline void list_splice_init(struct list_head *list,
  * @member: the name of the list_struct within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)                  \
-    for (pos = list_entry((head)->prev, typeof(*pos), member);          \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.prev, typeof(*pos), member))
+    for ((pos) = list_entry((head)->prev, typeof(*(pos)), member);      \
+         &(pos)->member != (head);                                      \
+         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
 
 /**
  * list_prepare_entry - prepare a pos entry for use in
@@ -516,7 +516,7 @@ static inline void list_splice_init(struct list_head *list,
  * list_for_each_entry_continue.
  */
 #define list_prepare_entry(pos, head, member)           \
-    ((pos) ? : list_entry(head, typeof(*pos), member))
+    ((pos) ? : list_entry(head, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_continue - continue iteration over list of given type
@@ -527,10 +527,10 @@ static inline void list_splice_init(struct list_head *list,
  * Continue to iterate over list of given type, continuing after
  * the current position.
  */
-#define list_for_each_entry_continue(pos, head, member)                 \
-    for (pos = list_entry(pos->member.next, typeof(*pos), member);      \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+#define list_for_each_entry_continue(pos, head, member)                   \
+    for ((pos) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                        \
+         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_from - iterate over list of given type from the
@@ -542,8 +542,8 @@ static inline void list_splice_init(struct list_head *list,
  * Iterate over list of given type, continuing from current position.
  */
 #define list_for_each_entry_from(pos, head, member)                     \
-    for (; &pos->member != (head);                                      \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+    for (; &(pos)->member != (head);                                    \
+         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_safe - iterate over list of given type safe
@@ -554,10 +554,10 @@ static inline void list_splice_init(struct list_head *list,
  * @member: the name of the list_struct within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)                  \
-    for (pos = list_entry((head)->next, typeof(*pos), member),          \
-         n = list_entry(pos->member.next, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.next, typeof(*n), member))
+    for ((pos) = list_entry((head)->next, typeof(*(pos)), member),      \
+         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                      \
+         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
 
 /**
  * list_for_each_entry_safe_continue
@@ -569,11 +569,11 @@ static inline void list_splice_init(struct list_head *list,
  * Iterate over list of given type, continuing after current point,
  * safe against removal of list entry.
  */
-#define list_for_each_entry_safe_continue(pos, n, head, member)         \
-    for (pos = list_entry(pos->member.next, typeof(*pos), member),      \
-         n = list_entry(pos->member.next, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.next, typeof(*n), member))
+#define list_for_each_entry_safe_continue(pos, n, head, member)           \
+    for ((pos) = list_entry((pos)->member.next, typeof(*(pos)), member),  \
+         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);    \
+         &(pos)->member != (head);                                        \
+         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
 
 /**
  * list_for_each_entry_safe_from
@@ -586,9 +586,9 @@ static inline void list_splice_init(struct list_head *list,
  * removal of list entry.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member)             \
-    for (n = list_entry(pos->member.next, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.next, typeof(*n), member))
+    for ((n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                      \
+         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
 
 /**
  * list_for_each_entry_safe_reverse
@@ -601,10 +601,10 @@ static inline void list_splice_init(struct list_head *list,
  * of list entry.
  */
 #define list_for_each_entry_safe_reverse(pos, n, head, member)          \
-    for (pos = list_entry((head)->prev, typeof(*pos), member),          \
-         n = list_entry(pos->member.prev, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.prev, typeof(*n), member))
+    for ((pos) = list_entry((head)->prev, typeof(*(pos)), member),      \
+         (n) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                      \
+         (pos) = (n), (n) = list_entry((n)->member.prev, typeof(*(n)), member))
 
 /**
  * list_for_each_rcu - iterate over an rcu-protected list
@@ -616,14 +616,14 @@ static inline void list_splice_init(struct list_head *list,
  * as long as the traversal is guarded by rcu_read_lock().
  */
 #define list_for_each_rcu(pos, head)                            \
-    for (pos = (head)->next;                                    \
+    for ((pos) = (head)->next;                                  \
          rcu_dereference(pos) != (head);                        \
-         pos = pos->next)
+         (pos) = (pos)->next)
 
 #define __list_for_each_rcu(pos, head)          \
-    for (pos = (head)->next;                    \
+    for ((pos) = (head)->next;                  \
          rcu_dereference(pos) != (head);        \
-         pos = pos->next)
+         (pos) = (pos)->next)
 
 /**
  * list_for_each_safe_rcu
@@ -638,9 +638,9 @@ static inline void list_splice_init(struct list_head *list,
  * as long as the traversal is guarded by rcu_read_lock().
  */
 #define list_for_each_safe_rcu(pos, n, head)            \
-    for (pos = (head)->next;                            \
-         n = rcu_dereference(pos)->next, pos != (head); \
-         pos = n)
+    for ((pos) = (head)->next;                          \
+         (n) = rcu_dereference(pos)->next, (pos) != (head); \
+         (pos) = (n))
 
 /**
  * list_for_each_entry_rcu - iterate over rcu list of given type
@@ -653,9 +653,9 @@ static inline void list_splice_init(struct list_head *list,
  * as long as the traversal is guarded by rcu_read_lock().
  */
 #define list_for_each_entry_rcu(pos, head, member)                      \
-    for (pos = list_entry((head)->next, typeof(*pos), member);          \
+    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
          &rcu_dereference(pos)->member != (head);                       \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_continue_rcu
@@ -977,4 +977,3 @@ static inline void hlist_add_after_rcu(struct hlist_node *prev,
           pos = pos->next)
 
 #endif /* __XEN_LIST_H__ */
-
-- 
2.34.1



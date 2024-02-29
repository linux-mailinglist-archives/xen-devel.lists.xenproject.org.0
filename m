Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EC86CCF2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687191.1070229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKS-0008Nc-CU; Thu, 29 Feb 2024 15:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687191.1070229; Thu, 29 Feb 2024 15:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKS-0008M4-7y; Thu, 29 Feb 2024 15:28:12 +0000
Received: by outflank-mailman (input) for mailman id 687191;
 Thu, 29 Feb 2024 15:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKQ-00087e-9P
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a431a6-d717-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:28:09 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id ABBBC4EE074A;
 Thu, 29 Feb 2024 16:28:07 +0100 (CET)
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
X-Inumbo-ID: 24a431a6-d717-11ee-afd8-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:53 +0100
Message-Id: <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/bug.h      |  2 +-
 xen/include/xen/init.h     |  4 +--
 xen/include/xen/kconfig.h  |  2 +-
 xen/include/xen/list.h     | 59 +++++++++++++++++++-------------------
 xen/include/xen/param.h    | 22 +++++++-------
 xen/include/xen/spinlock.h |  2 +-
 6 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 2c45c462fc63..77fe1e1ba840 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -80,7 +80,7 @@ struct bug_frame {
     [bf_type]    "i" (type),                                                 \
     [bf_ptr]     "i" (ptr),                                                  \
     [bf_msg]     "i" (msg),                                                  \
-    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
+    [bf_line_lo] "i" (((line) & ((1 << BUG_LINE_LO_WIDTH) - 1))              \
                       << BUG_DISP_WIDTH),                                    \
     [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
 
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 1d7c0216bc80..0a4223833755 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -63,9 +63,9 @@ typedef int (*initcall_t)(void);
 typedef void (*exitcall_t)(void);
 
 #define presmp_initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("presmp") = fn
+    const static initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("1") = fn
+    const static initcall_t __initcall_##fn __init_call("1") = (fn)
 #define __exitcall(fn) \
     static exitcall_t __exitcall_##fn __exit_call = fn
 
diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
index c25dc0f6c2a9..b7e70289737b 100644
--- a/xen/include/xen/kconfig.h
+++ b/xen/include/xen/kconfig.h
@@ -25,7 +25,7 @@
 #define __ARG_PLACEHOLDER_1 0,
 #define config_enabled(cfg) _config_enabled(cfg)
 #define _config_enabled(value) __config_enabled(__ARG_PLACEHOLDER_##value)
-#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 1, 0)
+#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk (1), (0))
 #define ___config_enabled(__ignored, val, ...) val
 
 /*
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index b5eab3a1eb6c..d803e7848cad 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -490,9 +490,9 @@ static inline void list_splice_init(struct list_head *list,
  * @member: the name of the list_struct within the struct.
  */
 #define list_for_each_entry(pos, head, member)                          \
-    for (pos = list_entry((head)->next, typeof(*pos), member);          \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+    for (pos = list_entry((head)->next, typeof(*(pos)), member);          \
+         &(pos)->member != (head);                                      \
+         pos = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
@@ -501,9 +501,9 @@ static inline void list_splice_init(struct list_head *list,
  * @member: the name of the list_struct within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)                  \
-    for (pos = list_entry((head)->prev, typeof(*pos), member);          \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.prev, typeof(*pos), member))
+    for (pos = list_entry((head)->prev, typeof(*(pos)), member);          \
+         &(pos)->member != (head);                                      \
+         pos = list_entry((pos)->member.prev, typeof(*(pos)), member))
 
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
@@ -528,9 +528,9 @@ static inline void list_splice_init(struct list_head *list,
  * the current position.
  */
 #define list_for_each_entry_continue(pos, head, member)                 \
-    for (pos = list_entry(pos->member.next, typeof(*pos), member);      \
-         &pos->member != (head);                                        \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+    for (pos = list_entry((pos)->member.next, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                      \
+         pos = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_entry_from - iterate over list of given type from the
@@ -542,8 +542,8 @@ static inline void list_splice_init(struct list_head *list,
  * Iterate over list of given type, continuing from current position.
  */
 #define list_for_each_entry_from(pos, head, member)                     \
-    for (; &pos->member != (head);                                      \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+    for (; &(pos)->member != (head);                                    \
+         pos = list_entry((pos)->member.next, typeof(*(pos)), member))
 
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
+    for (pos = list_entry((head)->next, typeof(*(pos)), member),        \
+         n = list_entry((pos)->member.next, typeof(*(pos)), member);    \
+         &(pos)->member != (head);                                      \
+         pos = (n), n = list_entry((n)->member.next, typeof(*(n)), member))
 
 /**
  * list_for_each_entry_safe_continue
@@ -570,10 +570,10 @@ static inline void list_splice_init(struct list_head *list,
  * safe against removal of list entry.
  */
 #define list_for_each_entry_safe_continue(pos, n, head, member)         \
-    for (pos = list_entry(pos->member.next, typeof(*pos), member),      \
-         n = list_entry(pos->member.next, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.next, typeof(*n), member))
+    for (pos = list_entry((pos)->member.next, typeof(*(pos)), member),  \
+         n = list_entry((pos)->member.next, typeof(*(pos)), member);    \
+         &(pos)->member != (head);                                      \
+         pos = (n), n = list_entry((n)->member.next, typeof(*(n)), member))
 
 /**
  * list_for_each_entry_safe_from
@@ -586,9 +586,9 @@ static inline void list_splice_init(struct list_head *list,
  * removal of list entry.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member)             \
-    for (n = list_entry(pos->member.next, typeof(*pos), member);        \
-         &pos->member != (head);                                        \
-         pos = n, n = list_entry(n->member.next, typeof(*n), member))
+    for (n = list_entry((pos)->member.next, typeof(*(pos)), member);    \
+         &(pos)->member != (head);                                      \
+         pos = (n), n = list_entry((n)->member.next, typeof(*(n)), member))
 
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
+    for (pos = list_entry((head)->prev, typeof(*(pos)), member),        \
+         n = list_entry((pos)->member.prev, typeof(*(pos)), member);    \
+         &(pos)->member != (head);                                      \
+         pos = (n), n = list_entry((n)->member.prev, typeof(*(n)), member))
 
 /**
  * list_for_each_rcu - iterate over an rcu-protected list
@@ -653,9 +653,9 @@ static inline void list_splice_init(struct list_head *list,
  * as long as the traversal is guarded by rcu_read_lock().
  */
 #define list_for_each_entry_rcu(pos, head, member)                      \
-    for (pos = list_entry((head)->next, typeof(*pos), member);          \
+    for (pos = list_entry((head)->next, typeof(*(pos)), member);        \
          &rcu_dereference(pos)->member != (head);                       \
-         pos = list_entry(pos->member.next, typeof(*pos), member))
+         pos = list_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
  * list_for_each_continue_rcu
@@ -977,4 +977,3 @@ static inline void hlist_add_after_rcu(struct hlist_node *prev,
           pos = pos->next)
 
 #endif /* __XEN_LIST_H__ */
-
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 13607e0e50e0..1bdbab34ab1f 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -45,42 +45,42 @@ extern const struct kernel_param __setup_start[], __setup_end[];
 #define TEMP_NAME(base) _TEMP_NAME(base, __LINE__)
 
 #define custom_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_CUSTOM, \
-          .par.func = _var }
+          .par.func = (_var) }
 #define boolean_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_BOOL, \
           .len = sizeof(_var) + \
                  BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define integer_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_UINT, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define size_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_SIZE, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define string_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_STR, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define ignore_param(_name)                 \
-    __setup_str TEMP_NAME(__setup_str_ign)[] = _name;    \
+    __setup_str TEMP_NAME(__setup_str_ign)[] = (_name);  \
     __kparam TEMP_NAME(__setup_ign) =                    \
         { .name = TEMP_NAME(__setup_str_ign),            \
           .type = OPT_IGNORE }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 1cd9120eac7a..0e6a083dfb9e 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -94,7 +94,7 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
+#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
-- 
2.34.1



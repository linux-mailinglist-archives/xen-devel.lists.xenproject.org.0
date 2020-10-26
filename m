Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB6298943
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12087.31727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZR-0005BU-Op; Mon, 26 Oct 2020 09:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12087.31727; Mon, 26 Oct 2020 09:13:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZR-0005AF-Ij; Mon, 26 Oct 2020 09:13:41 +0000
Received: by outflank-mailman (input) for mailman id 12087;
 Mon, 26 Oct 2020 09:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZQ-0004ev-E8
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e0e474d-5af9-43b8-8c80-c4d9f6ee50d1;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB53EB23E;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZQ-0004ev-E8
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:40 +0000
X-Inumbo-ID: 4e0e474d-5af9-43b8-8c80-c4d9f6ee50d1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e0e474d-5af9-43b8-8c80-c4d9f6ee50d1;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8a1iKL8UN8o1Ty1vmdQY0A5FOvExIvgwVG3SwZ4QNw=;
	b=qMnllShSIDuFGZF9rkN+h4h10kPIw8LwFXaswJu96zqzAA4PQ7umLDOvK1PREY9jwJ4Uez
	YG7kQ6xkfkDJ/Wun3SX1PQZac7sNxALkwYcqZK2E8aOopkxRkpSzYo/MPoL8trbYsvJeDj
	L1C8PgFcFLOUk7zAR2wF+C3kkKSAP+4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EB53EB23E;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 06/12] xen/hypfs: move per-node function pointers into a dedicated struct
Date: Mon, 26 Oct 2020 10:13:10 +0100
Message-Id: <20201026091316.25680-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function pointers currently stored in each hypfs node into a
dedicated structure in order to save some space for each node. This
will save even more space with additional callbacks added in future.

Provide some standard function vectors.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 25 +++++++++++++++---
 xen/include/xen/hypfs.h | 57 +++++++++++++++++++++++++----------------
 xen/include/xen/param.h | 15 ++++-------
 3 files changed, 62 insertions(+), 35 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 8e932b5cf9..e655e8cfc7 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -24,6 +24,25 @@ CHECK_hypfs_dirlistentry;
     (DIRENTRY_NAME_OFF +        \
      ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
 
+struct hypfs_funcs hypfs_dir_funcs = {
+    .read = hypfs_read_dir,
+};
+struct hypfs_funcs hypfs_leaf_ro_funcs = {
+    .read = hypfs_read_leaf,
+};
+struct hypfs_funcs hypfs_leaf_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_leaf,
+};
+struct hypfs_funcs hypfs_bool_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_bool,
+};
+struct hypfs_funcs hypfs_custom_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_custom,
+};
+
 static DEFINE_RWLOCK(hypfs_lock);
 enum hypfs_lock_state {
     hypfs_unlocked,
@@ -284,7 +303,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
 
     guest_handle_add_offset(uaddr, sizeof(e));
 
-    ret = entry->read(entry, uaddr);
+    ret = entry->funcs->read(entry, uaddr);
 
  out:
     return ret;
@@ -387,14 +406,14 @@ static int hypfs_write(struct hypfs_entry *entry,
 {
     struct hypfs_entry_leaf *l;
 
-    if ( !entry->write )
+    if ( !entry->funcs->write )
         return -EACCES;
 
     ASSERT(entry->max_size);
 
     l = container_of(entry, struct hypfs_entry_leaf, e);
 
-    return entry->write(l, uaddr, ulen);
+    return entry->funcs->write(l, uaddr, ulen);
 }
 
 long do_hypfs_op(unsigned int cmd,
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 5ad99cb558..77916ebb58 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -7,6 +7,20 @@
 #include <public/hypfs.h>
 
 struct hypfs_entry_leaf;
+struct hypfs_entry;
+
+struct hypfs_funcs {
+    int (*read)(const struct hypfs_entry *entry,
+                XEN_GUEST_HANDLE_PARAM(void) uaddr);
+    int (*write)(struct hypfs_entry_leaf *leaf,
+                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+};
+
+extern struct hypfs_funcs hypfs_dir_funcs;
+extern struct hypfs_funcs hypfs_leaf_ro_funcs;
+extern struct hypfs_funcs hypfs_leaf_wr_funcs;
+extern struct hypfs_funcs hypfs_bool_wr_funcs;
+extern struct hypfs_funcs hypfs_custom_wr_funcs;
 
 struct hypfs_entry {
     unsigned short type;
@@ -15,10 +29,7 @@ struct hypfs_entry {
     unsigned int max_size;
     const char *name;
     struct list_head list;
-    int (*read)(const struct hypfs_entry *entry,
-                XEN_GUEST_HANDLE_PARAM(void) uaddr);
-    int (*write)(struct hypfs_entry_leaf *leaf,
-                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+    struct hypfs_funcs *funcs;
 };
 
 struct hypfs_entry_leaf {
@@ -42,7 +53,7 @@ struct hypfs_entry_dir {
         .e.size = 0,                              \
         .e.max_size = 0,                          \
         .e.list = LIST_HEAD_INIT(var.e.list),     \
-        .e.read = hypfs_read_dir,                 \
+        .e.funcs = &hypfs_dir_funcs,              \
         .dirlist = LIST_HEAD_INIT(var.dirlist),   \
     }
 
@@ -52,7 +63,7 @@ struct hypfs_entry_dir {
         .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
         .e.name = (nam),                          \
         .e.max_size = (msz),                      \
-        .e.read = hypfs_read_leaf,                \
+        .e.funcs = &hypfs_leaf_ro_funcs,          \
     }
 
 /* Content and size need to be set via hypfs_string_set_reference(). */
@@ -72,35 +83,37 @@ static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
     leaf->e.size = strlen(str) + 1;
 }
 
-#define HYPFS_FIXEDSIZE_INIT(var, typ, nam, contvar, wr) \
-    struct hypfs_entry_leaf __read_mostly var = {        \
-        .e.type = (typ),                                 \
-        .e.encoding = XEN_HYPFS_ENC_PLAIN,               \
-        .e.name = (nam),                                 \
-        .e.size = sizeof(contvar),                       \
-        .e.max_size = (wr) ? sizeof(contvar) : 0,        \
-        .e.read = hypfs_read_leaf,                       \
-        .e.write = (wr),                                 \
-        .u.content = &(contvar),                         \
+#define HYPFS_FIXEDSIZE_INIT(var, typ, nam, contvar, fn, wr) \
+    struct hypfs_entry_leaf __read_mostly var = {            \
+        .e.type = (typ),                                     \
+        .e.encoding = XEN_HYPFS_ENC_PLAIN,                   \
+        .e.name = (nam),                                     \
+        .e.size = sizeof(contvar),                           \
+        .e.max_size = (wr) ? sizeof(contvar) : 0,            \
+        .e.funcs = (fn),                                     \
+        .u.content = &(contvar),                             \
     }
 
 #define HYPFS_UINT_INIT(var, nam, contvar)                       \
-    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_UINT, nam, contvar, NULL)
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_UINT, nam, contvar, \
+                         &hypfs_leaf_ro_funcs, 0)
 #define HYPFS_UINT_INIT_WRITABLE(var, nam, contvar)              \
     HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_UINT, nam, contvar, \
-                         hypfs_write_leaf)
+                         &hypfs_leaf_wr_funcs, 1)
 
 #define HYPFS_INT_INIT(var, nam, contvar)                        \
-    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_INT, nam, contvar, NULL)
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_INT, nam, contvar,  \
+                         &hypfs_leaf_ro_funcs, 0)
 #define HYPFS_INT_INIT_WRITABLE(var, nam, contvar)               \
     HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_INT, nam, contvar, \
-                         hypfs_write_leaf)
+                         &hypfs_leaf_wr_funcs, 1)
 
 #define HYPFS_BOOL_INIT(var, nam, contvar)                       \
-    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, NULL)
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, \
+                         &hypfs_leaf_ro_funcs, 0)
 #define HYPFS_BOOL_INIT_WRITABLE(var, nam, contvar)              \
     HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, \
-                         hypfs_write_bool)
+                         &hypfs_bool_wr_funcs, 1)
 
 extern struct hypfs_entry_dir hypfs_root;
 
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index d0409d3a0e..1b2c7db954 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -116,8 +116,7 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
         { .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = (nam), \
-          .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_custom, \
+          .hypfs.e.funcs = &hypfs_custom_wr_funcs, \
           .init_leaf = (initfunc), \
           .func = (variable) }
 #define boolean_runtime_only_param(nam, variable) \
@@ -127,8 +126,7 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.name = (nam), \
           .hypfs.e.size = sizeof(variable), \
           .hypfs.e.max_size = sizeof(variable), \
-          .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_bool, \
+          .hypfs.e.funcs = &hypfs_bool_wr_funcs, \
           .hypfs.u.content = &(variable) }
 #define integer_runtime_only_param(nam, variable) \
     __paramfs __parfs_##variable = \
@@ -137,8 +135,7 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.name = (nam), \
           .hypfs.e.size = sizeof(variable), \
           .hypfs.e.max_size = sizeof(variable), \
-          .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.e.funcs = &hypfs_leaf_wr_funcs, \
           .hypfs.u.content = &(variable) }
 #define size_runtime_only_param(nam, variable) \
     __paramfs __parfs_##variable = \
@@ -147,8 +144,7 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.name = (nam), \
           .hypfs.e.size = sizeof(variable), \
           .hypfs.e.max_size = sizeof(variable), \
-          .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.e.funcs = &hypfs_leaf_wr_funcs, \
           .hypfs.u.content = &(variable) }
 #define string_runtime_only_param(nam, variable) \
     __paramfs __parfs_##variable = \
@@ -157,8 +153,7 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.name = (nam), \
           .hypfs.e.size = 0, \
           .hypfs.e.max_size = sizeof(variable), \
-          .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.e.funcs = &hypfs_leaf_wr_funcs, \
           .hypfs.u.content = &(variable) }
 
 #else
-- 
2.26.2



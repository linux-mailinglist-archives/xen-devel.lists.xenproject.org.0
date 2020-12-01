Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0F2C990F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41639.75010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v4-00055X-Rn; Tue, 01 Dec 2020 08:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41639.75010; Tue, 01 Dec 2020 08:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v4-00054E-II; Tue, 01 Dec 2020 08:21:54 +0000
Received: by outflank-mailman (input) for mailman id 41639;
 Tue, 01 Dec 2020 08:21:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0v2-0004VK-5i
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c2e290f-45b7-4f0b-88e8-d03f1bef03bd;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB4D9AF0C;
 Tue,  1 Dec 2020 08:21:32 +0000 (UTC)
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
X-Inumbo-ID: 1c2e290f-45b7-4f0b-88e8-d03f1bef03bd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUqinpHgs7lQk4VZmE9ndgJqbAEUMbPxpoEKorm7mzA=;
	b=aLg6UtsdqCn5u7PfntKCiyCpCF7kvj0R65v/6un82KaisYDyo2w/IllrDI1vPDMZ7C6asF
	fZ6A/M0p8FXu0LnT+JFWn3Lf5nqHF47aEk9dVs8F9qe2PTnaAHulrmq3lsNiTSHUIO2yno
	L8DmQOD0hJeA4od635U9bI5hsdEPp+w=
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
Subject: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into a dedicated struct
Date: Tue,  1 Dec 2020 09:21:20 +0100
Message-Id: <20201201082128.15239-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function pointers currently stored in each hypfs node into a
dedicated structure in order to save some space for each node. This
will save even more space with additional callbacks added in future.

Provide some standard function vectors.

Instead of testing the write pointer to be not NULL provide a dummy
function just returning -EACCESS. ASSERT() all vector entries being
populated when adding a node. This avoids any potential problem (e.g.
pv domain privilege escalations) in case of calling a non populated
vector entry.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make function vector const (Jan Beulich)
- don't allow any NULL entry (Jan Beulich)
- add callback comment
---
 xen/common/hypfs.c      | 41 ++++++++++++++++++++----
 xen/include/xen/hypfs.h | 71 ++++++++++++++++++++++++++++-------------
 xen/include/xen/param.h | 15 +++------
 3 files changed, 88 insertions(+), 39 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 8e932b5cf9..7befd144ba 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -24,6 +24,27 @@ CHECK_hypfs_dirlistentry;
     (DIRENTRY_NAME_OFF +        \
      ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
 
+const struct hypfs_funcs hypfs_dir_funcs = {
+    .read = hypfs_read_dir,
+    .write = hypfs_write_deny,
+};
+const struct hypfs_funcs hypfs_leaf_ro_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_deny,
+};
+const struct hypfs_funcs hypfs_leaf_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_leaf,
+};
+const struct hypfs_funcs hypfs_bool_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_bool,
+};
+const struct hypfs_funcs hypfs_custom_wr_funcs = {
+    .read = hypfs_read_leaf,
+    .write = hypfs_write_custom,
+};
+
 static DEFINE_RWLOCK(hypfs_lock);
 enum hypfs_lock_state {
     hypfs_unlocked,
@@ -74,6 +95,9 @@ static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
     int ret = -ENOENT;
     struct hypfs_entry *e;
 
+    ASSERT(new->funcs->read);
+    ASSERT(new->funcs->write);
+
     hypfs_write_lock();
 
     list_for_each_entry ( e, &parent->dirlist, list )
@@ -284,7 +308,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
 
     guest_handle_add_offset(uaddr, sizeof(e));
 
-    ret = entry->read(entry, uaddr);
+    ret = entry->funcs->read(entry, uaddr);
 
  out:
     return ret;
@@ -297,6 +321,7 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
     int ret;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
+    ASSERT(leaf->e.max_size);
 
     if ( ulen > leaf->e.max_size )
         return -ENOSPC;
@@ -357,6 +382,7 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
     int ret;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
+    ASSERT(leaf->e.max_size);
 
     /* Avoid oversized buffer allocation. */
     if ( ulen > MAX_PARAM_SIZE )
@@ -382,19 +408,20 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
     return ret;
 }
 
+int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+{
+    return -EACCES;
+}
+
 static int hypfs_write(struct hypfs_entry *entry,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
 {
     struct hypfs_entry_leaf *l;
 
-    if ( !entry->write )
-        return -EACCES;
-
-    ASSERT(entry->max_size);
-
     l = container_of(entry, struct hypfs_entry_leaf, e);
 
-    return entry->write(l, uaddr, ulen);
+    return entry->funcs->write(l, uaddr, ulen);
 }
 
 long do_hypfs_op(unsigned int cmd,
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 5ad99cb558..25fdf3ead7 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -7,6 +7,32 @@
 #include <public/hypfs.h>
 
 struct hypfs_entry_leaf;
+struct hypfs_entry;
+
+/*
+ * Per-node callbacks:
+ *
+ * The callbacks are always called with the hypfs lock held.
+ *
+ * The read() callback is used to return the contents of a node (either
+ * directory or leaf). It is NOT used to get directory entries during traversal
+ * of the tree.
+ *
+ * The write() callback is used to modify the contents of a node. Writing
+ * directories is not supported (this means all nodes are added at boot time).
+ */
+struct hypfs_funcs {
+    int (*read)(const struct hypfs_entry *entry,
+                XEN_GUEST_HANDLE_PARAM(void) uaddr);
+    int (*write)(struct hypfs_entry_leaf *leaf,
+                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+};
+
+extern const struct hypfs_funcs hypfs_dir_funcs;
+extern const struct hypfs_funcs hypfs_leaf_ro_funcs;
+extern const struct hypfs_funcs hypfs_leaf_wr_funcs;
+extern const struct hypfs_funcs hypfs_bool_wr_funcs;
+extern const struct hypfs_funcs hypfs_custom_wr_funcs;
 
 struct hypfs_entry {
     unsigned short type;
@@ -15,10 +41,7 @@ struct hypfs_entry {
     unsigned int max_size;
     const char *name;
     struct list_head list;
-    int (*read)(const struct hypfs_entry *entry,
-                XEN_GUEST_HANDLE_PARAM(void) uaddr);
-    int (*write)(struct hypfs_entry_leaf *leaf,
-                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+    const struct hypfs_funcs *funcs;
 };
 
 struct hypfs_entry_leaf {
@@ -42,7 +65,7 @@ struct hypfs_entry_dir {
         .e.size = 0,                              \
         .e.max_size = 0,                          \
         .e.list = LIST_HEAD_INIT(var.e.list),     \
-        .e.read = hypfs_read_dir,                 \
+        .e.funcs = &hypfs_dir_funcs,              \
         .dirlist = LIST_HEAD_INIT(var.dirlist),   \
     }
 
@@ -52,7 +75,7 @@ struct hypfs_entry_dir {
         .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
         .e.name = (nam),                          \
         .e.max_size = (msz),                      \
-        .e.read = hypfs_read_leaf,                \
+        .e.funcs = &hypfs_leaf_ro_funcs,          \
     }
 
 /* Content and size need to be set via hypfs_string_set_reference(). */
@@ -72,35 +95,37 @@ static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
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
 
@@ -112,6 +137,8 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
 int hypfs_read_leaf(const struct hypfs_entry *entry,
                     XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
 int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
 int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
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



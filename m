Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDB2F9ED2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 12:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69612.124729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T7z-0005Ws-1y; Mon, 18 Jan 2021 11:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69612.124729; Mon, 18 Jan 2021 11:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T7y-0005WT-U8; Mon, 18 Jan 2021 11:55:22 +0000
Received: by outflank-mailman (input) for mailman id 69612;
 Mon, 18 Jan 2021 11:55:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1T7x-0005WJ-Nd
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:55:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fdcd800-bc5c-4b1f-9238-a8bacdf01211;
 Mon, 18 Jan 2021 11:55:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E3F8AE6E;
 Mon, 18 Jan 2021 11:55:19 +0000 (UTC)
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
X-Inumbo-ID: 1fdcd800-bc5c-4b1f-9238-a8bacdf01211
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610970919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=puNmDHfyAfcD8/V1nWe0SEp7VXPx3Ta6JdhxgAf41VQ=;
	b=LKhUzS3Mtj5N4dH+eQojKJdwGXU/6AjfDXlVHVOqTGDH43r0t55CioEIJctCzhQcNqpaZV
	OBtDohXKZ2eVamR6DILxGTKPqq5AAiY/yM8Y3jEmU8gEjLrV0u+tUGoYKhpaC4gkB1XSao
	KsdEfMQMqtK1ABBcW5lq/FTfvcgbGZE=
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
Subject: [PATCH v4 1/5] xen/hypfs: support dynamic hypfs nodes
Date: Mon, 18 Jan 2021 12:55:12 +0100
Message-Id: <20210118115516.11001-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118115516.11001-1-jgross@suse.com>
References: <20210118115516.11001-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a HYPFS_VARDIR_INIT() macro for initializing such a directory
statically, taking a struct hypfs_funcs pointer as parameter additional
to those of HYPFS_DIR_INIT().

Modify HYPFS_VARSIZE_INIT() to take the function vector pointer as an
additional parameter as this will be needed for dynamical entries.

For being able to let the generic hypfs coding continue to work on
normal struct hypfs_entry entities even for dynamical nodes add some
infrastructure for allocating a working area for the current hypfs
request in order to store needed information for traversing the tree.
This area is anchored in a percpu pointer and can be retrieved by any
level of the dynamic entries. The normal way to handle allocation and
freeing is to allocate the data in the enter() callback of a node and
to free it in the related exit() callback.

Add a hypfs_add_dyndir() function for adding a dynamic directory
template to the tree, which is needed for having the correct reference
to its position in hypfs.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch to xzalloc_bytes() in hypfs_alloc_dyndata() (Jan Beulich)
- carved out from previous patch
- use enter() and exit() callbacks for allocating and freeing
  dyndata memory
- add hypfs_add_dyndir()

V3:
- switch hypfs_alloc_dyndata() to be type safe (Jan Beulich)
- rename HYPFS_VARDIR_INIT() to HYPFS_DIR_INIT_FUNC() (Jan Beulich)

V4:
- use temporary variables for avoiding multiple per_cpu() uses
  (Jan Beulich)
- add comment (Jan Beulich)
- hide hypfs_alloc_dyndata() type unsafe backing function (Jan Beulich)
---
 xen/common/hypfs.c      | 43 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h | 29 +++++++++++++++++----------
 2 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 73497ea1d7..6c0e59dedd 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -72,6 +72,7 @@ enum hypfs_lock_state {
     hypfs_write_locked
 };
 static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
+static DEFINE_PER_CPU(struct hypfs_dyndata *, hypfs_dyndata);
 
 static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
 
@@ -155,6 +156,36 @@ static void node_exit_all(void)
         node_exit(*last);
 }
 
+#undef hypfs_alloc_dyndata
+void *hypfs_alloc_dyndata(unsigned long size)
+{
+    unsigned int cpu = smp_processor_id();
+    struct hypfs_dyndata **dyndata = &per_cpu(hypfs_dyndata, cpu);
+
+    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
+    ASSERT(*dyndata == NULL);
+
+    *dyndata = xzalloc_bytes(size);
+
+    return *dyndata;
+}
+
+void *hypfs_get_dyndata(void)
+{
+    struct hypfs_dyndata *dyndata = this_cpu(hypfs_dyndata);
+
+    ASSERT(dyndata);
+
+    return dyndata;
+}
+
+void hypfs_free_dyndata(void)
+{
+    struct hypfs_dyndata **dyndata = &this_cpu(hypfs_dyndata);
+
+    XFREE(*dyndata);
+}
+
 static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
 {
     int ret = -ENOENT;
@@ -216,6 +247,18 @@ int hypfs_add_dir(struct hypfs_entry_dir *parent,
     return ret;
 }
 
+void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
+                      struct hypfs_entry_dir *template)
+{
+    /*
+     * As the template is only a placeholder for possibly multiple dynamically
+     * generated directories, the link up to its parent can be static, while
+     * the "real" children of the parent are to be found via the parent's
+     * findentry function only.
+     */
+    template->e.parent = &parent->e;
+}
+
 int hypfs_add_leaf(struct hypfs_entry_dir *parent,
                    struct hypfs_entry_leaf *leaf, bool nofault)
 {
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index a6dfdb7d8e..d028c01283 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -76,7 +76,7 @@ struct hypfs_entry_dir {
     struct list_head dirlist;
 };
 
-#define HYPFS_DIR_INIT(var, nam)                  \
+#define HYPFS_DIR_INIT_FUNC(var, nam, fn)         \
     struct hypfs_entry_dir __read_mostly var = {  \
         .e.type = XEN_HYPFS_TYPE_DIR,             \
         .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
@@ -84,22 +84,25 @@ struct hypfs_entry_dir {
         .e.size = 0,                              \
         .e.max_size = 0,                          \
         .e.list = LIST_HEAD_INIT(var.e.list),     \
-        .e.funcs = &hypfs_dir_funcs,              \
+        .e.funcs = (fn),                          \
         .dirlist = LIST_HEAD_INIT(var.dirlist),   \
     }
 
-#define HYPFS_VARSIZE_INIT(var, typ, nam, msz)    \
-    struct hypfs_entry_leaf __read_mostly var = { \
-        .e.type = (typ),                          \
-        .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
-        .e.name = (nam),                          \
-        .e.max_size = (msz),                      \
-        .e.funcs = &hypfs_leaf_ro_funcs,          \
+#define HYPFS_DIR_INIT(var, nam)                  \
+    HYPFS_DIR_INIT_FUNC(var, nam, &hypfs_dir_funcs)
+
+#define HYPFS_VARSIZE_INIT(var, typ, nam, msz, fn) \
+    struct hypfs_entry_leaf __read_mostly var = {  \
+        .e.type = (typ),                           \
+        .e.encoding = XEN_HYPFS_ENC_PLAIN,         \
+        .e.name = (nam),                           \
+        .e.max_size = (msz),                       \
+        .e.funcs = (fn),                           \
     }
 
 /* Content and size need to be set via hypfs_string_set_reference(). */
 #define HYPFS_STRING_INIT(var, nam)               \
-    HYPFS_VARSIZE_INIT(var, XEN_HYPFS_TYPE_STRING, nam, 0)
+    HYPFS_VARSIZE_INIT(var, XEN_HYPFS_TYPE_STRING, nam, 0, &hypfs_leaf_ro_funcs)
 
 /*
  * Set content and size of a XEN_HYPFS_TYPE_STRING node. The node will point
@@ -150,6 +153,8 @@ extern struct hypfs_entry_dir hypfs_root;
 
 int hypfs_add_dir(struct hypfs_entry_dir *parent,
                   struct hypfs_entry_dir *dir, bool nofault);
+void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
+                      struct hypfs_entry_dir *template);
 int hypfs_add_leaf(struct hypfs_entry_dir *parent,
                    struct hypfs_entry_leaf *leaf, bool nofault);
 const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry);
@@ -177,6 +182,10 @@ struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
 struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
                                         const char *name,
                                         unsigned int name_len);
+void *hypfs_alloc_dyndata(unsigned long size);
+#define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof(type)))
+void *hypfs_get_dyndata(void);
+void hypfs_free_dyndata(void);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



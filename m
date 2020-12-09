Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0F2D4667
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48432.85705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22j-0003O7-8d; Wed, 09 Dec 2020 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48432.85705; Wed, 09 Dec 2020 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22j-0003NM-2m; Wed, 09 Dec 2020 16:10:17 +0000
Received: by outflank-mailman (input) for mailman id 48432;
 Wed, 09 Dec 2020 16:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn22i-0002Oq-15
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:10:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06e11609-ef77-40a5-a43e-42fb9c9b29c6;
 Wed, 09 Dec 2020 16:10:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C14FBB274;
 Wed,  9 Dec 2020 16:09:59 +0000 (UTC)
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
X-Inumbo-ID: 06e11609-ef77-40a5-a43e-42fb9c9b29c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2JApg47DI5mpxRq4xxKt1WSm6vnOnCEs4DTuG9auFw=;
	b=TfMarEecuPKxBUsV6iBJWIxXE48w9LHvhkM8v+o35axGIIhKsn2UBEdzD++qmqyDooRLUi
	K4UN22skTxkVMW79KjkkeDTaLxqeg8gOOYlI+6yKYhn1p1u0Zet5MdMk8NveFWrBOQCKH1
	X32mG/vgmiWph33cXECEDg6UhbtDARs=
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
Subject: [PATCH v3 4/8] xen/hypfs: support dynamic hypfs nodes
Date: Wed,  9 Dec 2020 17:09:52 +0100
Message-Id: <20201209160956.32456-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209160956.32456-1-jgross@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
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

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 31 +++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h | 29 +++++++++++++++++++----------
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index f04934db10..8faf65cea0 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -72,6 +72,7 @@ enum hypfs_lock_state {
     hypfs_write_locked
 };
 static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
+static DEFINE_PER_CPU(struct hypfs_dyndata *, hypfs_dyndata);
 
 static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
 
@@ -158,6 +159,30 @@ static void node_exit_all(void)
         node_exit(*last);
 }
 
+void *hypfs_alloc_dyndata_size(unsigned long size)
+{
+    unsigned int cpu = smp_processor_id();
+
+    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
+    ASSERT(per_cpu(hypfs_dyndata, cpu) == NULL);
+
+    per_cpu(hypfs_dyndata, cpu) = xzalloc_bytes(size);
+
+    return per_cpu(hypfs_dyndata, cpu);
+}
+
+void *hypfs_get_dyndata(void)
+{
+    ASSERT(this_cpu(hypfs_dyndata));
+
+    return this_cpu(hypfs_dyndata);
+}
+
+void hypfs_free_dyndata(void)
+{
+    XFREE(this_cpu(hypfs_dyndata));
+}
+
 static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
 {
     int ret = -ENOENT;
@@ -219,6 +244,12 @@ int hypfs_add_dir(struct hypfs_entry_dir *parent,
     return ret;
 }
 
+void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
+                      struct hypfs_entry_dir *template)
+{
+    template->e.parent = &parent->e;
+}
+
 int hypfs_add_leaf(struct hypfs_entry_dir *parent,
                    struct hypfs_entry_leaf *leaf, bool nofault)
 {
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index a6dfdb7d8e..4c469cbeb4 100644
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
+void *hypfs_alloc_dyndata_size(unsigned long size);
+#define hypfs_alloc_dyndata(type) (type *)hypfs_alloc_dyndata_size(sizeof(type))
+void *hypfs_get_dyndata(void);
+void hypfs_free_dyndata(void);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



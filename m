Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACE298947
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12094.31775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZc-0005ZW-PB; Mon, 26 Oct 2020 09:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12094.31775; Mon, 26 Oct 2020 09:13:52 +0000
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
	id 1kWyZc-0005YM-Je; Mon, 26 Oct 2020 09:13:52 +0000
Received: by outflank-mailman (input) for mailman id 12094;
 Mon, 26 Oct 2020 09:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZa-0004f1-SN
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b3da22-e431-4730-8a0f-bb74a709d485;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BF8CB243;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZa-0004f1-SN
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:50 +0000
X-Inumbo-ID: f9b3da22-e431-4730-8a0f-bb74a709d485
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f9b3da22-e431-4730-8a0f-bb74a709d485;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzVfNJp5CakgtQPXKcxiHB74zrzQZ4Nkcj6JZDwDa6k=;
	b=NL/En86Zerx/XqAPLdxbToE9TgYiblPWaYJYlvTQW/RutFLZdUPGjUNGDbRYDww7CLqc7r
	X2yqGr+HsQeFQdmmqvJebYLtfoEo0/6ClP/pPX9+Irr9DTLuodyTR9hf7mFBCBOhSVbTNl
	ZZq/IZykawDZMb56HpOMdFrv1W4coS0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6BF8CB243;
	Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
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
Subject: [PATCH 08/12] xen/hypfs: support dynamic hypfs nodes
Date: Mon, 26 Oct 2020 10:13:12 +0100
Message-Id: <20201026091316.25680-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a getsize() function pointer to struct hypfs_funcs for being able
to have dynamically filled entries without the need to take the hypfs
lock each time the contents are being generated.

For directories add a findentry callback to the vector and modify
hypfs_get_entry_rel() to use it.

Add a HYPFS_VARDIR_INIT() macro for intializing such a directory
statically, taking a struct hypfs_funcs pointer as parameter additional
to those of HYPFS_DIR_INIT().

Modify HYPFS_VARSIZE_INIT() to take the function vector pointer as an
additional parameter as this will be needed for dynamical entries.

Move DIRENTRY_SIZE() macro to hypfs.h as it will be needed by the read
function of a directory with dynamically generated entries.

For being able to let the generic hypfs coding continue to work on
normal struct hypfs_entry entities even for dynamical nodes add some
infrastructure for allocating a working area for the current hypfs
request in order to store needed information for traversing the tree.
This area is anchored in a percpu pointer and can be retrieved by any
level of the dynamic entries. It will be freed automatically when
dropping the hypfs lock.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 124 +++++++++++++++++++++++++---------------
 xen/include/xen/hypfs.h |  39 +++++++++----
 2 files changed, 108 insertions(+), 55 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 97260bd4a3..4c226a06b4 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -19,28 +19,29 @@
 CHECK_hypfs_dirlistentry;
 #endif
 
-#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
-#define DIRENTRY_SIZE(name_len) \
-    (DIRENTRY_NAME_OFF +        \
-     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
-
 struct hypfs_funcs hypfs_dir_funcs = {
     .read = hypfs_read_dir,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_dir_findentry,
 };
 struct hypfs_funcs hypfs_leaf_ro_funcs = {
     .read = hypfs_read_leaf,
+    .getsize = hypfs_getsize,
 };
 struct hypfs_funcs hypfs_leaf_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_leaf,
+    .getsize = hypfs_getsize,
 };
 struct hypfs_funcs hypfs_bool_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_bool,
+    .getsize = hypfs_getsize,
 };
 struct hypfs_funcs hypfs_custom_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_custom,
+    .getsize = hypfs_getsize,
 };
 
 static DEFINE_RWLOCK(hypfs_lock);
@@ -50,6 +51,7 @@ enum hypfs_lock_state {
     hypfs_write_locked
 };
 static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
+static DEFINE_PER_CPU(void *, hypfs_dyndata);
 
 HYPFS_DIR_INIT(hypfs_root, "");
 
@@ -71,9 +73,12 @@ static void hypfs_write_lock(void)
 
 static void hypfs_unlock(void)
 {
-    enum hypfs_lock_state locked = this_cpu(hypfs_locked);
+    unsigned int cpu = smp_processor_id();
+    enum hypfs_lock_state locked = per_cpu(hypfs_locked, cpu);
+
+    XFREE(per_cpu(hypfs_dyndata, cpu));
 
-    this_cpu(hypfs_locked) = hypfs_unlocked;
+    per_cpu(hypfs_locked, cpu) = hypfs_unlocked;
 
     switch ( locked )
     {
@@ -88,6 +93,23 @@ static void hypfs_unlock(void)
     }
 }
 
+void *hypfs_alloc_dyndata(unsigned long size, unsigned long align)
+{
+    unsigned int cpu = smp_processor_id();
+
+    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
+    ASSERT(per_cpu(hypfs_dyndata, cpu) == NULL);
+
+    per_cpu(hypfs_dyndata, cpu) = _xzalloc(size, align);
+
+    return per_cpu(hypfs_dyndata, cpu);
+}
+
+void *hypfs_get_dyndata(void)
+{
+    return this_cpu(hypfs_dyndata);
+}
+
 static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
 {
     int ret = -ENOENT;
@@ -122,7 +144,7 @@ static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
     {
         unsigned int sz = strlen(new->name);
 
-        parent->e.size += DIRENTRY_SIZE(sz);
+        parent->e.size += HYPFS_DIRENTRY_SIZE(sz);
     }
 
     hypfs_unlock();
@@ -171,15 +193,34 @@ static int hypfs_get_path_user(char *buf,
     return 0;
 }
 
+struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
+                                        const char *name,
+                                        unsigned int name_len)
+{
+    struct hypfs_entry *entry;
+
+    list_for_each_entry ( entry, &dir->dirlist, list )
+    {
+        int cmp = strncmp(name, entry->name, name_len);
+
+        if ( cmp < 0 )
+            return ERR_PTR(-ENOENT);
+
+        if ( !cmp && strlen(entry->name) == name_len )
+            return entry;
+    }
+
+    return ERR_PTR(-ENOENT);
+}
+
 static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
                                                const char *path)
 {
     const char *end;
     struct hypfs_entry *entry;
     unsigned int name_len;
-    bool again = true;
 
-    while ( again )
+    for ( ;; )
     {
         if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
             return ERR_PTR(-ENOENT);
@@ -192,28 +233,12 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
             end = strchr(path, '\0');
         name_len = end - path;
 
-        again = false;
+        entry = dir->e.funcs->findentry(dir, path, name_len);
+        if ( IS_ERR(entry) || !*end )
+            return entry;
 
-        list_for_each_entry ( entry, &dir->dirlist, list )
-        {
-            int cmp = strncmp(path, entry->name, name_len);
-            struct hypfs_entry_dir *d = container_of(entry,
-                                                     struct hypfs_entry_dir, e);
-
-            if ( cmp < 0 )
-                return ERR_PTR(-ENOENT);
-            if ( !cmp && strlen(entry->name) == name_len )
-            {
-                if ( !*end )
-                    return entry;
-
-                again = true;
-                dir = d;
-                path = end + 1;
-
-                break;
-            }
-        }
+        path = end + 1;
+        dir = container_of(entry, struct hypfs_entry_dir, e);
     }
 
     return ERR_PTR(-ENOENT);
@@ -227,12 +252,17 @@ static struct hypfs_entry *hypfs_get_entry(const char *path)
     return hypfs_get_entry_rel(&hypfs_root, path + 1);
 }
 
+unsigned int hypfs_getsize(const struct hypfs_entry *entry)
+{
+    return entry->size;
+}
+
 int hypfs_read_dir(const struct hypfs_entry *entry,
                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_entry_dir *d;
     const struct hypfs_entry *e;
-    unsigned int size = entry->size;
+    unsigned int size = entry->funcs->getsize(entry);
 
     ASSERT(this_cpu(hypfs_locked) != hypfs_unlocked);
 
@@ -242,18 +272,18 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
     {
         struct xen_hypfs_dirlistentry direntry;
         unsigned int e_namelen = strlen(e->name);
-        unsigned int e_len = DIRENTRY_SIZE(e_namelen);
+        unsigned int e_len = HYPFS_DIRENTRY_SIZE(e_namelen);
 
         direntry.e.pad = 0;
         direntry.e.type = e->type;
         direntry.e.encoding = e->encoding;
-        direntry.e.content_len = e->size;
+        direntry.e.content_len = e->funcs->getsize(e);
         direntry.e.max_write_len = e->max_size;
         direntry.off_next = list_is_last(&e->list, &d->dirlist) ? 0 : e_len;
         if ( copy_to_guest(uaddr, &direntry, 1) )
             return -EFAULT;
 
-        if ( copy_to_guest_offset(uaddr, DIRENTRY_NAME_OFF,
+        if ( copy_to_guest_offset(uaddr, HYPFS_DIRENTRY_NAME_OFF,
                                   e->name, e_namelen + 1) )
             return -EFAULT;
 
@@ -275,22 +305,25 @@ int hypfs_read_leaf(const struct hypfs_entry *entry,
 
     l = container_of(entry, const struct hypfs_entry_leaf, e);
 
-    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT: 0;
+    return copy_to_guest(uaddr, l->u.content, entry->funcs->getsize(entry)) ?
+                                              -EFAULT : 0;
 }
 
 static int hypfs_read(const struct hypfs_entry *entry,
                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
 {
     struct xen_hypfs_direntry e;
+    unsigned int size;
     long ret = -EINVAL;
 
     if ( ulen < sizeof(e) )
         goto out;
 
+    size = entry->funcs->getsize(entry);
     e.pad = 0;
     e.type = entry->type;
     e.encoding = entry->encoding;
-    e.content_len = entry->size;
+    e.content_len = size;
     e.max_write_len = entry->max_size;
 
     ret = -EFAULT;
@@ -298,7 +331,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
         goto out;
 
     ret = -ENOBUFS;
-    if ( ulen < entry->size + sizeof(e) )
+    if ( ulen < size + sizeof(e) )
         goto out;
 
     guest_handle_add_offset(uaddr, sizeof(e));
@@ -314,14 +347,15 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
 {
     char *buf;
     int ret;
+    struct hypfs_entry *e = &leaf->e;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
 
-    if ( ulen > leaf->e.max_size )
+    if ( ulen > e->max_size )
         return -ENOSPC;
 
-    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
-         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
+    if ( e->type != XEN_HYPFS_TYPE_STRING &&
+         e->type != XEN_HYPFS_TYPE_BLOB && ulen != e->funcs->getsize(e) )
         return -EDOM;
 
     buf = xmalloc_array(char, ulen);
@@ -333,14 +367,14 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
         goto out;
 
     ret = -EINVAL;
-    if ( leaf->e.type == XEN_HYPFS_TYPE_STRING &&
-         leaf->e.encoding == XEN_HYPFS_ENC_PLAIN &&
+    if ( e->type == XEN_HYPFS_TYPE_STRING &&
+         e->encoding == XEN_HYPFS_ENC_PLAIN &&
          memchr(buf, 0, ulen) != (buf + ulen - 1) )
         goto out;
 
     ret = 0;
     memcpy(leaf->u.write_ptr, buf, ulen);
-    leaf->e.size = ulen;
+    e->size = ulen;
 
  out:
     xfree(buf);
@@ -354,7 +388,7 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
     ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL &&
-           leaf->e.size == sizeof(bool) &&
+           leaf->e.funcs->getsize(&leaf->e) == sizeof(bool) &&
            leaf->e.max_size == sizeof(bool) );
 
     if ( ulen != leaf->e.max_size )
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 77916ebb58..c8999b5381 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -2,11 +2,13 @@
 #define __XEN_HYPFS_H__
 
 #ifdef CONFIG_HYPFS
+#include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/string.h>
 #include <public/hypfs.h>
 
 struct hypfs_entry_leaf;
+struct hypfs_entry_dir;
 struct hypfs_entry;
 
 struct hypfs_funcs {
@@ -14,6 +16,9 @@ struct hypfs_funcs {
                 XEN_GUEST_HANDLE_PARAM(void) uaddr);
     int (*write)(struct hypfs_entry_leaf *leaf,
                  XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+    unsigned int (*getsize)(const struct hypfs_entry *entry);
+    struct hypfs_entry *(*findentry)(struct hypfs_entry_dir *dir,
+                                     const char *name, unsigned int name_len);
 };
 
 extern struct hypfs_funcs hypfs_dir_funcs;
@@ -45,7 +50,12 @@ struct hypfs_entry_dir {
     struct list_head dirlist;
 };
 
-#define HYPFS_DIR_INIT(var, nam)                  \
+#define HYPFS_DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
+#define HYPFS_DIRENTRY_SIZE(name_len) \
+    (HYPFS_DIRENTRY_NAME_OFF +        \
+     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
+
+#define HYPFS_VARDIR_INIT(var, nam, fn)           \
     struct hypfs_entry_dir __read_mostly var = {  \
         .e.type = XEN_HYPFS_TYPE_DIR,             \
         .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
@@ -53,22 +63,25 @@ struct hypfs_entry_dir {
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
+    HYPFS_VARDIR_INIT(var, nam, &hypfs_dir_funcs)
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
@@ -131,6 +144,12 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+unsigned int hypfs_getsize(const struct hypfs_entry *entry);
+struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
+                                        const char *name,
+                                        unsigned int name_len);
+void *hypfs_alloc_dyndata(unsigned long size, unsigned long align);
+void *hypfs_get_dyndata(void);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



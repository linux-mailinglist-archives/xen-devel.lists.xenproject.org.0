Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2992C9914
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41650.75057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vE-0005RV-IP; Tue, 01 Dec 2020 08:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41650.75057; Tue, 01 Dec 2020 08:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vE-0005Q1-B7; Tue, 01 Dec 2020 08:22:04 +0000
Received: by outflank-mailman (input) for mailman id 41650;
 Tue, 01 Dec 2020 08:22:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0vC-0004VK-64
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:22:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fe17956-cceb-44ac-9b50-da0c9bf4e05d;
 Tue, 01 Dec 2020 08:21:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CA09AF19;
 Tue,  1 Dec 2020 08:21:33 +0000 (UTC)
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
X-Inumbo-ID: 8fe17956-cceb-44ac-9b50-da0c9bf4e05d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P3UHikA7pHBmIcZYgCpCp4RulCN+1OvDj1DbtBRNCk=;
	b=GNqocWCji7UO4coxDFPLzqvgECSysm/zPrIqYeFIp17FIBp0Lmx77eaUclfLp9dIhxOLDo
	K/uRNZsOtQ38yUwi4g8WJfTzYWq7x95fDw2X4gmoK/hD68vYUsXFvKolmxWGdg+JJQ8hC+
	vHR6gfebNf+TnpCr1qn4NJbUqjeTniE=
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
Subject: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry() callbacks to hypfs_funcs
Date: Tue,  1 Dec 2020 09:21:22 +0100
Message-Id: <20201201082128.15239-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a getsize() function pointer to struct hypfs_funcs for being able
to have dynamically filled entries without the need to take the hypfs
lock each time the contents are being generated.

For directories add a findentry callback to the vector and modify
hypfs_get_entry_rel() to use it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add a dummy findentry function (Jan Beulich)
- add const to findentry dir parameter
- don't move DIRENTRY_SIZE() to hypfs.h (Jan Beulich)
- split dyndir support off into new patch

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 100 ++++++++++++++++++++++++++--------------
 xen/include/xen/hypfs.h |  25 +++++++++-
 2 files changed, 89 insertions(+), 36 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index fdfd0f764a..83c5cacdca 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -27,22 +27,32 @@ CHECK_hypfs_dirlistentry;
 const struct hypfs_funcs hypfs_dir_funcs = {
     .read = hypfs_read_dir,
     .write = hypfs_write_deny,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_dir_findentry,
 };
 const struct hypfs_funcs hypfs_leaf_ro_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_deny,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_leaf_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_leaf,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_bool_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_bool,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_custom_wr_funcs = {
     .read = hypfs_read_leaf,
     .write = hypfs_write_custom,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
 };
 
 static DEFINE_RWLOCK(hypfs_lock);
@@ -97,6 +107,8 @@ static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
 
     ASSERT(new->funcs->read);
     ASSERT(new->funcs->write);
+    ASSERT(new->funcs->getsize);
+    ASSERT(new->funcs->findentry);
 
     hypfs_write_lock();
 
@@ -176,15 +188,41 @@ static int hypfs_get_path_user(char *buf,
     return 0;
 }
 
+struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
+                                         const char *name,
+                                         unsigned int name_len)
+{
+    return ERR_PTR(-ENOENT);
+}
+
+struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
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
+    for ( ; ; )
     {
         if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
             return ERR_PTR(-ENOENT);
@@ -197,28 +235,12 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
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
@@ -232,12 +254,17 @@ static struct hypfs_entry *hypfs_get_entry(const char *path)
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
 
@@ -252,7 +279,7 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
         direntry.e.pad = 0;
         direntry.e.type = e->type;
         direntry.e.encoding = e->encoding;
-        direntry.e.content_len = e->size;
+        direntry.e.content_len = e->funcs->getsize(e);
         direntry.e.max_write_len = e->max_size;
         direntry.off_next = list_is_last(&e->list, &d->dirlist) ? 0 : e_len;
         if ( copy_to_guest(uaddr, &direntry, 1) )
@@ -275,18 +302,20 @@ int hypfs_read_leaf(const struct hypfs_entry *entry,
                     XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_entry_leaf *l;
+    unsigned int size = entry->funcs->getsize(entry);
 
     ASSERT(this_cpu(hypfs_locked) != hypfs_unlocked);
 
     l = container_of(entry, const struct hypfs_entry_leaf, e);
 
-    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT: 0;
+    return copy_to_guest(uaddr, l->u.content, size) ?  -EFAULT : 0;
 }
 
 static int hypfs_read(const struct hypfs_entry *entry,
                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
 {
     struct xen_hypfs_direntry e;
+    unsigned int size = entry->funcs->getsize(entry);
     long ret = -EINVAL;
 
     if ( ulen < sizeof(e) )
@@ -295,7 +324,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
     e.pad = 0;
     e.type = entry->type;
     e.encoding = entry->encoding;
-    e.content_len = entry->size;
+    e.content_len = size;
     e.max_write_len = entry->max_size;
 
     ret = -EFAULT;
@@ -303,7 +332,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
         goto out;
 
     ret = -ENOBUFS;
-    if ( ulen < entry->size + sizeof(e) )
+    if ( ulen < size + sizeof(e) )
         goto out;
 
     guest_handle_add_offset(uaddr, sizeof(e));
@@ -319,15 +348,16 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
 {
     char *buf;
     int ret;
+    struct hypfs_entry *e = &leaf->e;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
     ASSERT(leaf->e.max_size);
 
-    if ( ulen > leaf->e.max_size )
+    if ( ulen > e->max_size )
         return -ENOSPC;
 
-    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
-         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
+    if ( e->type != XEN_HYPFS_TYPE_STRING &&
+         e->type != XEN_HYPFS_TYPE_BLOB && ulen != e->funcs->getsize(e) )
         return -EDOM;
 
     buf = xmalloc_array(char, ulen);
@@ -339,14 +369,14 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
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
@@ -360,7 +390,7 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
     ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL &&
-           leaf->e.size == sizeof(bool) &&
+           leaf->e.funcs->getsize(&leaf->e) == sizeof(bool) &&
            leaf->e.max_size == sizeof(bool) );
 
     if ( ulen != leaf->e.max_size )
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 25fdf3ead7..53f50772b4 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -2,17 +2,21 @@
 #define __XEN_HYPFS_H__
 
 #ifdef CONFIG_HYPFS
+#include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/string.h>
 #include <public/hypfs.h>
 
 struct hypfs_entry_leaf;
+struct hypfs_entry_dir;
 struct hypfs_entry;
 
 /*
  * Per-node callbacks:
  *
- * The callbacks are always called with the hypfs lock held.
+ * The callbacks are always called with the hypfs lock held. In case multiple
+ * callbacks are called for a single operation the lock is held across all
+ * those callbacks.
  *
  * The read() callback is used to return the contents of a node (either
  * directory or leaf). It is NOT used to get directory entries during traversal
@@ -20,12 +24,24 @@ struct hypfs_entry;
  *
  * The write() callback is used to modify the contents of a node. Writing
  * directories is not supported (this means all nodes are added at boot time).
+ *
+ * getsize() is called in two cases:
+ * - when reading a node (directory or leaf) for filling in the size of the
+ *   node into the returned direntry
+ * - when reading a directory for each node in this directory
+ *
+ * findentry() is called for traversing a path from the root node to a node
+ * for all nodes on that path excluding the final node (so for looking up
+ * "/a/b/c" findentry() will be called for "/", "/a", and "/a/b").
  */
 struct hypfs_funcs {
     int (*read)(const struct hypfs_entry *entry,
                 XEN_GUEST_HANDLE_PARAM(void) uaddr);
     int (*write)(struct hypfs_entry_leaf *leaf,
                  XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+    unsigned int (*getsize)(const struct hypfs_entry *entry);
+    struct hypfs_entry *(*findentry)(const struct hypfs_entry_dir *dir,
+                                     const char *name, unsigned int name_len);
 };
 
 extern const struct hypfs_funcs hypfs_dir_funcs;
@@ -145,6 +161,13 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+unsigned int hypfs_getsize(const struct hypfs_entry *entry);
+struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
+                                         const char *name,
+                                         unsigned int name_len);
+struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
+                                        const char *name,
+                                        unsigned int name_len);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549C2C9915
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41659.75092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vL-0005gA-09; Tue, 01 Dec 2020 08:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41659.75092; Tue, 01 Dec 2020 08:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vK-0005cz-7v; Tue, 01 Dec 2020 08:22:10 +0000
Received: by outflank-mailman (input) for mailman id 41659;
 Tue, 01 Dec 2020 08:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0vH-0004Uj-Jh
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:22:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 544f183e-d5f3-4c30-9d2f-26ec576f0792;
 Tue, 01 Dec 2020 08:21:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70019AF26;
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
X-Inumbo-ID: 544f183e-d5f3-4c30-9d2f-26ec576f0792
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5TUB0753mqlMUzFRfIKqWdQ4pi4TEHdAafXYRsY3+ps=;
	b=A0YHXj4E2/lcDG8u30FMXxMKHWlPnkqX5fXhttVGTKHbTrOBq0ysiVvNfNaXhMEnxZYSWQ
	WIDIxYZnKNEGbvmh3Q/gTg/InCxWZ3nGq39Z4NnoNGX8nmZxUssvDqtA8JiFhyF0fFQ/9G
	4/WqEKfDD4eK6+TeEMMWkvr2lM9Lc/s=
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
Subject: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node callbacks
Date: Tue,  1 Dec 2020 09:21:23 +0100
Message-Id: <20201201082128.15239-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to better support resource allocation and locking for dynamic
hypfs nodes add enter() and exit() callbacks to struct hypfs_funcs.

The enter() callback is called when entering a node during hypfs user
actions (traversing, reading or writing it), while the exit() callback
is called when leaving a node (accessing another node at the same or a
higher directory level, or when returning to the user).

For avoiding recursion this requires a parent pointer in each node.
Let the enter() callback return the entry address which is stored as
the last accessed node in order to be able to use a template entry for
that purpose in case of dynamic entries.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/hypfs.c      | 79 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h |  5 +++
 2 files changed, 84 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 83c5cacdca..e5adc9defe 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -25,30 +25,40 @@ CHECK_hypfs_dirlistentry;
      ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
 
 const struct hypfs_funcs hypfs_dir_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
     .read = hypfs_read_dir,
     .write = hypfs_write_deny,
     .getsize = hypfs_getsize,
     .findentry = hypfs_dir_findentry,
 };
 const struct hypfs_funcs hypfs_leaf_ro_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
     .read = hypfs_read_leaf,
     .write = hypfs_write_deny,
     .getsize = hypfs_getsize,
     .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_leaf_wr_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
     .read = hypfs_read_leaf,
     .write = hypfs_write_leaf,
     .getsize = hypfs_getsize,
     .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_bool_wr_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
     .read = hypfs_read_leaf,
     .write = hypfs_write_bool,
     .getsize = hypfs_getsize,
     .findentry = hypfs_leaf_findentry,
 };
 const struct hypfs_funcs hypfs_custom_wr_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
     .read = hypfs_read_leaf,
     .write = hypfs_write_custom,
     .getsize = hypfs_getsize,
@@ -63,6 +73,8 @@ enum hypfs_lock_state {
 };
 static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
 
+static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
+
 HYPFS_DIR_INIT(hypfs_root, "");
 
 static void hypfs_read_lock(void)
@@ -100,11 +112,58 @@ static void hypfs_unlock(void)
     }
 }
 
+const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
+{
+    return entry;
+}
+
+void hypfs_node_exit(const struct hypfs_entry *entry)
+{
+}
+
+static int node_enter(const struct hypfs_entry *entry)
+{
+    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
+
+    entry = entry->funcs->enter(entry);
+    if ( IS_ERR(entry) )
+        return PTR_ERR(entry);
+
+    ASSERT(!*last || *last == entry->parent);
+
+    *last = entry;
+
+    return 0;
+}
+
+static void node_exit(const struct hypfs_entry *entry)
+{
+    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
+
+    if ( !*last )
+        return;
+
+    ASSERT(*last == entry);
+    *last = entry->parent;
+
+    entry->funcs->exit(entry);
+}
+
+static void node_exit_all(void)
+{
+    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
+
+    while ( *last )
+        node_exit(*last);
+}
+
 static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
 {
     int ret = -ENOENT;
     struct hypfs_entry *e;
 
+    ASSERT(new->funcs->enter);
+    ASSERT(new->funcs->exit);
     ASSERT(new->funcs->read);
     ASSERT(new->funcs->write);
     ASSERT(new->funcs->getsize);
@@ -140,6 +199,7 @@ static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
         unsigned int sz = strlen(new->name);
 
         parent->e.size += DIRENTRY_SIZE(sz);
+        new->parent = &parent->e;
     }
 
     hypfs_unlock();
@@ -221,6 +281,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
     const char *end;
     struct hypfs_entry *entry;
     unsigned int name_len;
+    int ret;
 
     for ( ; ; )
     {
@@ -235,6 +296,10 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
             end = strchr(path, '\0');
         name_len = end - path;
 
+        ret = node_enter(&dir->e);
+        if ( ret )
+            return ERR_PTR(ret);
+
         entry = dir->e.funcs->findentry(dir, path, name_len);
         if ( IS_ERR(entry) || !*end )
             return entry;
@@ -265,6 +330,7 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
     const struct hypfs_entry_dir *d;
     const struct hypfs_entry *e;
     unsigned int size = entry->funcs->getsize(entry);
+    int ret;
 
     ASSERT(this_cpu(hypfs_locked) != hypfs_unlocked);
 
@@ -276,12 +342,19 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
         unsigned int e_namelen = strlen(e->name);
         unsigned int e_len = DIRENTRY_SIZE(e_namelen);
 
+        ret = node_enter(e);
+        if ( ret )
+            return ret;
+
         direntry.e.pad = 0;
         direntry.e.type = e->type;
         direntry.e.encoding = e->encoding;
         direntry.e.content_len = e->funcs->getsize(e);
         direntry.e.max_write_len = e->max_size;
         direntry.off_next = list_is_last(&e->list, &d->dirlist) ? 0 : e_len;
+
+        node_exit(e);
+
         if ( copy_to_guest(uaddr, &direntry, 1) )
             return -EFAULT;
 
@@ -490,6 +563,10 @@ long do_hypfs_op(unsigned int cmd,
         goto out;
     }
 
+    ret = node_enter(entry);
+    if ( ret )
+        goto out;
+
     switch ( cmd )
     {
     case XEN_HYPFS_OP_read:
@@ -506,6 +583,8 @@ long do_hypfs_op(unsigned int cmd,
     }
 
  out:
+    node_exit_all();
+
     hypfs_unlock();
 
     return ret;
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 53f50772b4..8d96abd805 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -35,6 +35,8 @@ struct hypfs_entry;
  * "/a/b/c" findentry() will be called for "/", "/a", and "/a/b").
  */
 struct hypfs_funcs {
+    const struct hypfs_entry *(*enter)(const struct hypfs_entry *entry);
+    void (*exit)(const struct hypfs_entry *entry);
     int (*read)(const struct hypfs_entry *entry,
                 XEN_GUEST_HANDLE_PARAM(void) uaddr);
     int (*write)(struct hypfs_entry_leaf *leaf,
@@ -56,6 +58,7 @@ struct hypfs_entry {
     unsigned int size;
     unsigned int max_size;
     const char *name;
+    struct hypfs_entry *parent;
     struct list_head list;
     const struct hypfs_funcs *funcs;
 };
@@ -149,6 +152,8 @@ int hypfs_add_dir(struct hypfs_entry_dir *parent,
                   struct hypfs_entry_dir *dir, bool nofault);
 int hypfs_add_leaf(struct hypfs_entry_dir *parent,
                    struct hypfs_entry_leaf *leaf, bool nofault);
+const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry);
+void hypfs_node_exit(const struct hypfs_entry *entry);
 int hypfs_read_dir(const struct hypfs_entry *entry,
                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
 int hypfs_read_leaf(const struct hypfs_entry *entry,
-- 
2.26.2



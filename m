Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7815298944
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12088.31737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZT-0005Ef-4Z; Mon, 26 Oct 2020 09:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12088.31737; Mon, 26 Oct 2020 09:13:43 +0000
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
	id 1kWyZS-0005Do-Th; Mon, 26 Oct 2020 09:13:42 +0000
Received: by outflank-mailman (input) for mailman id 12088;
 Mon, 26 Oct 2020 09:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZQ-0004f1-Rm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2d1a173-a065-4271-967a-ad287a5065d5;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1D3EB244;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZQ-0004f1-Rm
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:40 +0000
X-Inumbo-ID: c2d1a173-a065-4271-967a-ad287a5065d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c2d1a173-a065-4271-967a-ad287a5065d5;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfzDywvYxNprz4jIH7nIZnqi8wD+M3kSqllQAfQb1kA=;
	b=PEGW9POG9sdRUTUTQE3XHqjCbqIUKV3+9Tmk2NH7J/akbaoZTKno/CnHxk+5DeQmQm+qNU
	rXKR5EVpKbB6ztfuZ+PH660DZ0P69kcIlZPwcm9PdXlnmIhQW6sXUDX+ga2ek6tvAEVuXd
	bfUqkxKWfJH8zLNC5Icsn8wlm9N3X70=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A1D3EB244;
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
Subject: [PATCH 09/12] xen/hypfs: add support for id-based dynamic directories
Date: Mon, 26 Oct 2020 10:13:13 +0100
Message-Id: <20201026091316.25680-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some helpers to hypfs.c to support dynamic directories with a
numerical id as name.

The dynamic directory is based on a template specified by the user
allowing to use specific access functions and having a predefined
set of entries in the directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 76 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h | 14 ++++++++
 2 files changed, 90 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 4c226a06b4..12be2f6d16 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -257,6 +257,82 @@ unsigned int hypfs_getsize(const struct hypfs_entry *entry)
     return entry->size;
 }
 
+int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
+{
+    struct xen_hypfs_dirlistentry direntry;
+    char name[12];
+    unsigned int e_namelen, e_len;
+
+    e_namelen = snprintf(name, sizeof(name), "%u", id);
+    e_len = HYPFS_DIRENTRY_SIZE(e_namelen);
+    direntry.e.pad = 0;
+    direntry.e.type = template->e.type;
+    direntry.e.encoding = template->e.encoding;
+    direntry.e.content_len = template->e.funcs->getsize(&template->e);
+    direntry.e.max_write_len = template->e.max_size;
+    direntry.off_next = is_last ? 0 : e_len;
+    if ( copy_to_guest(*uaddr, &direntry, 1) )
+        return -EFAULT;
+    if ( copy_to_guest_offset(*uaddr, HYPFS_DIRENTRY_NAME_OFF, name,
+                              e_namelen + 1) )
+        return -EFAULT;
+
+    guest_handle_add_offset(*uaddr, e_len);
+
+    return 0;
+}
+
+static struct hypfs_entry *hypfs_dyndir_findentry(struct hypfs_entry_dir *dir,
+                                                  const char *name,
+                                                  unsigned int name_len)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+    if ( !data )
+        return ERR_PTR(-ENOENT);
+
+    /* Use template with original findentry function. */
+    return data->template->e.funcs->findentry(data->template, name, name_len);
+}
+
+static int hypfs_read_dyndir(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+    if ( !data )
+        return -ENOENT;
+
+    /* Use template with original read function. */
+    return data->template->e.funcs->read(&data->template->e, uaddr);
+}
+
+struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir *template,
+                                              unsigned int id)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_alloc_dyndata(sizeof(*data), alignof(*data));
+    if ( !data )
+        return ERR_PTR(-ENOMEM);
+
+    data->template = template;
+    data->id = id;
+    snprintf(data->name, sizeof(data->name), "%u", id);
+    data->dir = *template;
+    data->dir.e.name = data->name;
+    data->dir.e.funcs = &data->funcs;
+    data->funcs = *template->e.funcs;
+    data->funcs.findentry = hypfs_dyndir_findentry;
+    data->funcs.read = hypfs_read_dyndir;
+
+    return &data->dir.e;
+}
+
 int hypfs_read_dir(const struct hypfs_entry *entry,
                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index c8999b5381..adfb522496 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -50,6 +50,15 @@ struct hypfs_entry_dir {
     struct list_head dirlist;
 };
 
+struct hypfs_dyndir_id {
+    struct hypfs_entry_dir dir;       /* Modified copy of template. */
+    struct hypfs_funcs funcs;         /* Dynamic functions. */
+    struct hypfs_entry_dir *template; /* Template used. */
+    char name[12];                    /* Name of hypfs entry. */
+
+    unsigned int id;                  /* Numerical id. */
+};
+
 #define HYPFS_DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
 #define HYPFS_DIRENTRY_SIZE(name_len) \
     (HYPFS_DIRENTRY_NAME_OFF +        \
@@ -150,6 +159,11 @@ struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
                                         unsigned int name_len);
 void *hypfs_alloc_dyndata(unsigned long size, unsigned long align);
 void *hypfs_get_dyndata(void);
+int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
+struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir *template,
+                                              unsigned int id);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



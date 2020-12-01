Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E182C9917
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41669.75105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vO-0005ps-W6; Tue, 01 Dec 2020 08:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41669.75105; Tue, 01 Dec 2020 08:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vO-0005oT-Mh; Tue, 01 Dec 2020 08:22:14 +0000
Received: by outflank-mailman (input) for mailman id 41669;
 Tue, 01 Dec 2020 08:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0vM-0004Uj-Jt
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:22:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3e75dc9-6b8c-4948-9e33-bfc041c331ed;
 Tue, 01 Dec 2020 08:21:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7BA2AC2F;
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
X-Inumbo-ID: c3e75dc9-6b8c-4948-9e33-bfc041c331ed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nEfxMc4Y111J56Pbtn4xCo86ZYNHh7NsCYZakRnxAw=;
	b=q7fVue6+a3LnDyFS4uwGeOnENuWlrCODSQKGhqEjyhoQOU0imZti8xKGiJxIgP4ZPH0XGq
	NcJcyyWri44MTb8Bd6uW73F0Exdla3Y1bf3Kz69CES6KlvO/AeUxcAaeshGW8aFjl48Syi
	NJNsGCjs8OelOTH3cwKbfq2LzCG5/UE=
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
Subject: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic directories
Date: Tue,  1 Dec 2020 09:21:25 +0100
Message-Id: <20201201082128.15239-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some helpers to hypfs.c to support dynamic directories with a
numerical id as name.

The dynamic directory is based on a template specified by the user
allowing to use specific access functions and having a predefined
set of entries in the directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use macro for length of entry name (Jan Beulich)
- const attributes (Jan Beulich)
- use template name as format string (Jan Beulich)
- add hypfs_dynid_entry_size() helper (Jan Beulich)
- expect dyndir data having been allocated by enter() callback
---
 xen/common/hypfs.c      | 75 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h | 17 ++++++++++
 2 files changed, 92 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 39448c5409..1819b26925 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -355,6 +355,81 @@ unsigned int hypfs_getsize(const struct hypfs_entry *entry)
     return entry->size;
 }
 
+int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
+{
+    struct xen_hypfs_dirlistentry direntry;
+    char name[HYPFS_DYNDIR_ID_NAMELEN];
+    unsigned int e_namelen, e_len;
+
+    e_namelen = snprintf(name, sizeof(name), template->e.name, id);
+    e_len = DIRENTRY_SIZE(e_namelen);
+    direntry.e.pad = 0;
+    direntry.e.type = template->e.type;
+    direntry.e.encoding = template->e.encoding;
+    direntry.e.content_len = template->e.funcs->getsize(&template->e);
+    direntry.e.max_write_len = template->e.max_size;
+    direntry.off_next = is_last ? 0 : e_len;
+    if ( copy_to_guest(*uaddr, &direntry, 1) )
+        return -EFAULT;
+    if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
+                              e_namelen + 1) )
+        return -EFAULT;
+
+    guest_handle_add_offset(*uaddr, e_len);
+
+    return 0;
+}
+
+static struct hypfs_entry *hypfs_dyndir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
+{
+    const struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+
+    /* Use template with original findentry function. */
+    return data->template->e.funcs->findentry(data->template, name, name_len);
+}
+
+static int hypfs_read_dyndir(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+
+    /* Use template with original read function. */
+    return data->template->e.funcs->read(&data->template->e, uaddr);
+}
+
+struct hypfs_entry *hypfs_gen_dyndir_entry_id(
+    const struct hypfs_entry_dir *template, unsigned int id)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+
+    data->template = template;
+    data->id = id;
+    snprintf(data->name, sizeof(data->name), template->e.name, id);
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
+unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
+                                    unsigned int id)
+{
+    return DIRENTRY_SIZE(snprintf(NULL, 0, template->name, id));
+}
+
 int hypfs_read_dir(const struct hypfs_entry *entry,
                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index be8d6c508a..1782c50b30 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -76,6 +76,16 @@ struct hypfs_entry_dir {
     struct list_head dirlist;
 };
 
+struct hypfs_dyndir_id {
+    struct hypfs_entry_dir dir;             /* Modified copy of template. */
+    struct hypfs_funcs funcs;               /* Dynamic functions. */
+    const struct hypfs_entry_dir *template; /* Template used. */
+#define HYPFS_DYNDIR_ID_NAMELEN 12
+    char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. */
+
+    unsigned int id;                        /* Numerical id. */
+};
+
 #define HYPFS_VARDIR_INIT(var, nam, fn)           \
     struct hypfs_entry_dir __read_mostly var = {  \
         .e.type = XEN_HYPFS_TYPE_DIR,             \
@@ -181,6 +191,13 @@ struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
 void *hypfs_alloc_dyndata(unsigned long size);
 void *hypfs_get_dyndata(void);
 void hypfs_free_dyndata(void);
+int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
+struct hypfs_entry *hypfs_gen_dyndir_entry_id(
+    const struct hypfs_entry_dir *template, unsigned int id);
+unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
+                                    unsigned int id);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FB2D4669
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48436.85731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22p-0003Yq-1n; Wed, 09 Dec 2020 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48436.85731; Wed, 09 Dec 2020 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22o-0003Xb-SU; Wed, 09 Dec 2020 16:10:22 +0000
Received: by outflank-mailman (input) for mailman id 48436;
 Wed, 09 Dec 2020 16:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn22n-0002Oq-19
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:10:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4a5b375-8b5e-4597-b1b4-71553962e5b6;
 Wed, 09 Dec 2020 16:10:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11FAAB279;
 Wed,  9 Dec 2020 16:10:00 +0000 (UTC)
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
X-Inumbo-ID: a4a5b375-8b5e-4597-b1b4-71553962e5b6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJK4b1ugQ0UokWHNyqHOknc4B9LzQZ5ESb/m8S9r3M4=;
	b=VCjABHYGpCX/zS1sAiAupiFalwBJK4b5d1LwOh9X67fqEVr3S7XWJL7APl86F/khjaNZPJ
	DdAycoJ5Pe/DUs6dE80Fpiket73S6x0TTg3y47N2F1OeA9fki+1AQwKGH3BU5DHkOuwpsb
	ffCin5jN3ioxWlfaoSWx0h9WdWCDQgY=
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
Subject: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic directories
Date: Wed,  9 Dec 2020 17:09:53 +0100
Message-Id: <20201209160956.32456-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209160956.32456-1-jgross@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
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

V3:
- add a specific enter() callback returning the template pointer
- add data field to struct hypfs_dyndir_id
- rename hypfs_gen_dyndir_entry_id() (Jan Beulich)
- add comments regarding generated names to be kept in sync (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 98 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h | 18 ++++++++
 2 files changed, 116 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 8faf65cea0..087c63b92f 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -356,6 +356,104 @@ unsigned int hypfs_getsize(const struct hypfs_entry *entry)
     return entry->size;
 }
 
+/*
+ * Fill the direntry for a dynamically generated directory. Especially the
+ * generated name needs to be kept in sync with hypfs_gen_dyndir_id_entry().
+ */
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
+static const struct hypfs_entry *hypfs_dyndir_enter(
+    const struct hypfs_entry *entry)
+{
+    const struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
+
+    /* Use template with original enter function. */
+    return data->template->e.funcs->enter(&data->template->e);
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
+/*
+ * Fill dyndata with a dynamically generated directory based on a template
+ * and a numerical id.
+ * Needs to be kept in sync with hypfs_read_dyndir_id_entry() regarding the
+ * name generated.
+ */
+struct hypfs_entry *hypfs_gen_dyndir_id_entry(
+    const struct hypfs_entry_dir *template, unsigned int id, void *data)
+{
+    struct hypfs_dyndir_id *dyndata;
+
+    dyndata = hypfs_get_dyndata();
+
+    dyndata->template = template;
+    dyndata->id = id;
+    dyndata->data = data;
+    snprintf(dyndata->name, sizeof(dyndata->name), template->e.name, id);
+    dyndata->dir = *template;
+    dyndata->dir.e.name = dyndata->name;
+    dyndata->dir.e.funcs = &dyndata->funcs;
+    dyndata->funcs = *template->e.funcs;
+    dyndata->funcs.enter = hypfs_dyndir_enter;
+    dyndata->funcs.findentry = hypfs_dyndir_findentry;
+    dyndata->funcs.read = hypfs_read_dyndir;
+
+    return &dyndata->dir.e;
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
index 4c469cbeb4..34073faff8 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -76,6 +76,17 @@ struct hypfs_entry_dir {
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
+    void *data;                             /* Data associated with id. */
+};
+
 #define HYPFS_DIR_INIT_FUNC(var, nam, fn)         \
     struct hypfs_entry_dir __read_mostly var = {  \
         .e.type = XEN_HYPFS_TYPE_DIR,             \
@@ -186,6 +197,13 @@ void *hypfs_alloc_dyndata_size(unsigned long size);
 #define hypfs_alloc_dyndata(type) (type *)hypfs_alloc_dyndata_size(sizeof(type))
 void *hypfs_get_dyndata(void);
 void hypfs_free_dyndata(void);
+int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
+                               unsigned int id, bool is_last,
+                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
+struct hypfs_entry *hypfs_gen_dyndir_id_entry(
+    const struct hypfs_entry_dir *template, unsigned int id, void *data);
+unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
+                                    unsigned int id);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



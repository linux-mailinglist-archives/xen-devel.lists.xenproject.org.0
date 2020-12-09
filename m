Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A42D4689
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48484.85767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28j-0004VA-Bx; Wed, 09 Dec 2020 16:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48484.85767; Wed, 09 Dec 2020 16:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28j-0004Ue-7k; Wed, 09 Dec 2020 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 48484;
 Wed, 09 Dec 2020 16:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn28h-0004SF-1r
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:16:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e50217e-569d-4108-be58-42ac93a182cc;
 Wed, 09 Dec 2020 16:16:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4591ADAA;
 Wed,  9 Dec 2020 16:16:20 +0000 (UTC)
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
X-Inumbo-ID: 7e50217e-569d-4108-be58-42ac93a182cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+/TxrF4qJUX0wGGTUMyByEWIjy0WZY4LBlGieHkPRc=;
	b=jCp82V2QdeP4AHedfgWNEX4ayd24waSekvuv7niZe9ARvaGxoizwmB79CEDgcSySxGJu4H
	U+ePcxt0UxSvKq2vKr1u3xy6b7L4QN61f12K0uVv7+tq3a2gnT56NXko65QyoE4WBNgdOg
	ugTHHXmSBDCbg1ppbWxjOP4ipVg14DQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: paul@xen.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 1/3] xen/hypfs: add support for bool leafs in dynamic directories
Date: Wed,  9 Dec 2020 17:16:16 +0100
Message-Id: <20201209161618.309-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209161618.309-1-jgross@suse.com>
References: <20201209161618.309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for reading fixed sized leafs and writing bool leafs in
dynamic directories with the backing variable being a member of the
structure anchored in struct hypfs_dyndir->data.

This adds the related leaf read and write functions and a helper
macro HYPFS_STRUCT_ELEM() for referencing the element.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 53 +++++++++++++++++++++++++++++++++++------
 xen/include/xen/hypfs.h |  7 ++++++
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 087c63b92f..caee48cc97 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -501,17 +501,26 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
     return 0;
 }
 
-int hypfs_read_leaf(const struct hypfs_entry *entry,
-                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+static int hypfs_read_leaf_off(const struct hypfs_entry *entry,
+                               XEN_GUEST_HANDLE_PARAM(void) uaddr,
+                               void *off)
 {
     const struct hypfs_entry_leaf *l;
     unsigned int size = entry->funcs->getsize(entry);
+    const void *ptr;
 
     ASSERT(this_cpu(hypfs_locked) != hypfs_unlocked);
 
     l = container_of(entry, const struct hypfs_entry_leaf, e);
+    ptr = off ? off + (unsigned long)l->u.content : l->u.content;
+
+    return copy_to_guest(uaddr, ptr, size) ? -EFAULT : 0;
+}
 
-    return copy_to_guest(uaddr, l->u.content, size) ?  -EFAULT : 0;
+int hypfs_read_leaf(const struct hypfs_entry *entry,
+                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    return hypfs_read_leaf_off(entry, uaddr, NULL);
 }
 
 static int hypfs_read(const struct hypfs_entry *entry,
@@ -587,11 +596,12 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
     return ret;
 }
 
-int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen)
+static int hypfs_write_bool_off(struct hypfs_entry_leaf *leaf,
+                                XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                unsigned int ulen, void *off)
 {
     bool buf;
+    bool *ptr;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
     ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL &&
@@ -604,11 +614,19 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
     if ( copy_from_guest(&buf, uaddr, ulen) )
         return -EFAULT;
 
-    *(bool *)leaf->u.write_ptr = buf;
+    ptr = off ? off + (unsigned long)leaf->u.write_ptr : leaf->u.write_ptr;
+    *ptr = buf;
 
     return 0;
 }
 
+int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen)
+{
+    return hypfs_write_bool_off(leaf, uaddr, ulen, NULL);
+}
+
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
                        XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
                        unsigned int ulen)
@@ -644,6 +662,27 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
     return ret;
 }
 
+int hypfs_dyndir_id_read_leaf(const struct hypfs_entry *entry,
+                              XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    struct hypfs_dyndir_id *dyndata;
+
+    dyndata = hypfs_get_dyndata();
+
+    return hypfs_read_leaf_off(entry, uaddr, dyndata->data);
+}
+
+int hypfs_dyndir_id_write_bool(struct hypfs_entry_leaf *leaf,
+                               XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                               unsigned int ulen)
+{
+    struct hypfs_dyndir_id *dyndata;
+
+    dyndata = hypfs_get_dyndata();
+
+    return hypfs_write_bool_off(leaf, uaddr, ulen, dyndata->data);
+}
+
 int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
                      unsigned int ulen)
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 34073faff8..670dc68b48 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -160,6 +160,8 @@ static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
     HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, \
                          &hypfs_bool_wr_funcs, 1)
 
+#define HYPFS_STRUCT_ELEM(type, elem)    (((type *)NULL)->elem)
+
 extern struct hypfs_entry_dir hypfs_root;
 
 int hypfs_add_dir(struct hypfs_entry_dir *parent,
@@ -204,6 +206,11 @@ struct hypfs_entry *hypfs_gen_dyndir_id_entry(
     const struct hypfs_entry_dir *template, unsigned int id, void *data);
 unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
                                     unsigned int id);
+int hypfs_dyndir_id_read_leaf(const struct hypfs_entry *entry,
+                              XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int hypfs_dyndir_id_write_bool(struct hypfs_entry_leaf *leaf,
+                               XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                               unsigned int ulen);
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
-- 
2.26.2



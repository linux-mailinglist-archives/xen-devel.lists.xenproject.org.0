Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8B2D4661
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48428.85658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22Z-00035M-Kr; Wed, 09 Dec 2020 16:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48428.85658; Wed, 09 Dec 2020 16:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22Z-00034g-Gd; Wed, 09 Dec 2020 16:10:07 +0000
Received: by outflank-mailman (input) for mailman id 48428;
 Wed, 09 Dec 2020 16:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn22Y-0002Oq-0f
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:10:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 882a4794-43af-449a-b516-ed041b9e8ffe;
 Wed, 09 Dec 2020 16:10:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47C3EAFEB;
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
X-Inumbo-ID: 882a4794-43af-449a-b516-ed041b9e8ffe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BW9eYydQo2F6aub4GEJBwW00UPy+ko8uE06ZsSs8E0c=;
	b=s+aVsUzKnQvk3WcsKTSlB//9Bhm8JWaN/FT2ryo4p4hQk2LVDSBp0Kxuu+YGIcvzXMOvxL
	qjvtiIT01twmizuwFx9GviG1TNnOCchq52L2zi6Y6Em/gjvsOhdXLHoN8rpjK/Q56mXh16
	suuDBdWc1pID0DjuUOj63IV2JWDxeVQ=
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
Subject: [PATCH v3 2/8] xen/hypfs: switch write function handles to const
Date: Wed,  9 Dec 2020 17:09:50 +0100
Message-Id: <20201209160956.32456-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209160956.32456-1-jgross@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node specific write functions take a void user address handle as
parameter. As a write won't change the user memory use a const_void
handle instead.

This requires a new macro for casting a guest handle to a const type.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 xen/common/hypfs.c             | 17 +++++++++++------
 xen/include/xen/guest_access.h |  5 +++++
 xen/include/xen/hypfs.h        | 14 +++++++++-----
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 2e8e90591e..6f822ae097 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -344,7 +344,8 @@ static int hypfs_read(const struct hypfs_entry *entry,
 }
 
 int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen)
 {
     char *buf;
     int ret;
@@ -384,7 +385,8 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
 }
 
 int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen)
 {
     bool buf;
 
@@ -405,7 +407,8 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
 }
 
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
-                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+                       XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                       unsigned int ulen)
 {
     struct param_hypfs *p;
     char *buf;
@@ -439,13 +442,15 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
 }
 
 int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen)
 {
     return -EACCES;
 }
 
 static int hypfs_write(struct hypfs_entry *entry,
-                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+                       XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                       unsigned long ulen)
 {
     struct hypfs_entry_leaf *l;
 
@@ -497,7 +502,7 @@ long do_hypfs_op(unsigned int cmd,
         break;
 
     case XEN_HYPFS_OP_write_contents:
-        ret = hypfs_write(entry, arg3, arg4);
+        ret = hypfs_write(entry, guest_handle_const_cast(arg3, void), arg4);
         break;
 
     default:
diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index f9b94cf1f4..5a50c3ccee 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -26,6 +26,11 @@
     type *_x = (hnd).p;                         \
     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
 })
+/* Same for casting to a const type. */
+#define guest_handle_const_cast(hnd, type) ({       \
+    const type *_x = (const type *)((hnd).p);       \
+    (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x };  \
+})
 
 /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
 #define guest_handle_to_param(hnd, type) ({                  \
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 53f50772b4..99fd4b036d 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -38,7 +38,7 @@ struct hypfs_funcs {
     int (*read)(const struct hypfs_entry *entry,
                 XEN_GUEST_HANDLE_PARAM(void) uaddr);
     int (*write)(struct hypfs_entry_leaf *leaf,
-                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+                 XEN_GUEST_HANDLE_PARAM(const_void) uaddr, unsigned int ulen);
     unsigned int (*getsize)(const struct hypfs_entry *entry);
     struct hypfs_entry *(*findentry)(const struct hypfs_entry_dir *dir,
                                      const char *name, unsigned int name_len);
@@ -154,13 +154,17 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
 int hypfs_read_leaf(const struct hypfs_entry *entry,
                     XEN_GUEST_HANDLE_PARAM(void) uaddr);
 int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen);
 int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen);
 int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                     unsigned int ulen);
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
-                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+                       XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                       unsigned int ulen);
 unsigned int hypfs_getsize(const struct hypfs_entry *entry);
 struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
                                          const char *name,
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1162C9912
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41645.75042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vA-0005Hm-2D; Tue, 01 Dec 2020 08:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41645.75042; Tue, 01 Dec 2020 08:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v9-0005Fn-QA; Tue, 01 Dec 2020 08:21:59 +0000
Received: by outflank-mailman (input) for mailman id 41645;
 Tue, 01 Dec 2020 08:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0v7-0004Uj-JN
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2ebf806-5cc1-4f39-8b25-a2bca9abd9d3;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5E62AF10;
 Tue,  1 Dec 2020 08:21:32 +0000 (UTC)
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
X-Inumbo-ID: f2ebf806-5cc1-4f39-8b25-a2bca9abd9d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8wgYZkUcmfVZFhet14HurBZ05V1wN1xeSm132mMJYo=;
	b=CP9Vx9M9inEdF2kGeks3UZVfFpSP8Y7VsG8c1gvih5SH9oigsXhd+CRbtMtozh+4eTh3fA
	C+y1UgnGOuIYp0DyctDWe4YfIFfiR1lJr4zA6q81m4iNO47eQTKvDUjVpAz/M1e40+EIBy
	XOukMaKP1VcaHdDN0TXpkMbnEEYVnM4=
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
Subject: [PATCH v2 10/17] xen/hypfs: pass real failure reason up from hypfs_get_entry()
Date: Tue,  1 Dec 2020 09:21:21 +0100
Message-Id: <20201201082128.15239-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of handling all errors from hypfs_get_entry() as ENOENT pass
up the real error value via ERR_PTR().

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/hypfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 7befd144ba..fdfd0f764a 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -187,7 +187,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
     while ( again )
     {
         if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
-            return NULL;
+            return ERR_PTR(-ENOENT);
 
         if ( !*path )
             return &dir->e;
@@ -206,7 +206,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
                                                      struct hypfs_entry_dir, e);
 
             if ( cmp < 0 )
-                return NULL;
+                return ERR_PTR(-ENOENT);
             if ( !cmp && strlen(entry->name) == name_len )
             {
                 if ( !*end )
@@ -221,13 +221,13 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
         }
     }
 
-    return NULL;
+    return ERR_PTR(-ENOENT);
 }
 
 static struct hypfs_entry *hypfs_get_entry(const char *path)
 {
     if ( path[0] != '/' )
-        return NULL;
+        return ERR_PTR(-EINVAL);
 
     return hypfs_get_entry_rel(&hypfs_root, path + 1);
 }
@@ -454,9 +454,9 @@ long do_hypfs_op(unsigned int cmd,
         goto out;
 
     entry = hypfs_get_entry(path);
-    if ( !entry )
+    if ( IS_ERR(entry) )
     {
-        ret = -ENOENT;
+        ret = PTR_ERR(entry);
         goto out;
     }
 
-- 
2.26.2



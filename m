Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379729893E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12083.31690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZI-0004uR-Pm; Mon, 26 Oct 2020 09:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12083.31690; Mon, 26 Oct 2020 09:13:32 +0000
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
	id 1kWyZI-0004tU-L9; Mon, 26 Oct 2020 09:13:32 +0000
Received: by outflank-mailman (input) for mailman id 12083;
 Mon, 26 Oct 2020 09:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZG-0004f1-RQ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b99fa3f3-aecd-408e-99f0-5f4902718482;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EA73B241;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZG-0004f1-RQ
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:30 +0000
X-Inumbo-ID: b99fa3f3-aecd-408e-99f0-5f4902718482
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b99fa3f3-aecd-408e-99f0-5f4902718482;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSq8aaykDP1qqXLMQtSSJphelHz62lSdHw2BdhisVQc=;
	b=u5w8r5XbLREuAI2PEahXh4vzIz3GETulgMztS2x23i1OOAkvALwTqoDwwSbJDENI3vb83/
	hBXe3YC6srkKz0vdI9BE74zZtZaZGtmXYBAHCbjy8vY1r1x9dX46rpHHiZpOb6XLHFJDc1
	PvBrHsDxHjQ71tzmGAvznsbtbzZamgQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2EA73B241;
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
Subject: [PATCH 07/12] xen/hypfs: pass real failure reason up from hypfs_get_entry()
Date: Mon, 26 Oct 2020 10:13:11 +0100
Message-Id: <20201026091316.25680-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of handling all errors from hypfs_get_entry() as ENOENT pass
up the real error value via ERR_PTR().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index e655e8cfc7..97260bd4a3 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -182,7 +182,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
     while ( again )
     {
         if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
-            return NULL;
+            return ERR_PTR(-ENOENT);
 
         if ( !*path )
             return &dir->e;
@@ -201,7 +201,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
                                                      struct hypfs_entry_dir, e);
 
             if ( cmp < 0 )
-                return NULL;
+                return ERR_PTR(-ENOENT);
             if ( !cmp && strlen(entry->name) == name_len )
             {
                 if ( !*end )
@@ -216,13 +216,13 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
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
@@ -446,9 +446,9 @@ long do_hypfs_op(unsigned int cmd,
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



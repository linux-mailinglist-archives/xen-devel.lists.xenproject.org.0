Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08777B2E4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583314.913480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIT-00032b-7y; Mon, 14 Aug 2023 07:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583314.913480; Mon, 14 Aug 2023 07:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIT-00030G-4K; Mon, 14 Aug 2023 07:47:29 +0000
Received: by outflank-mailman (input) for mailman id 583314;
 Mon, 14 Aug 2023 07:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIR-0002SK-Uo
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07436ff-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:47:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31F7E1FD5F;
 Mon, 14 Aug 2023 07:47:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5714138EE;
 Mon, 14 Aug 2023 07:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xRe8Ng7c2WTEQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:26 +0000
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
X-Inumbo-ID: d07436ff-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jynfyk/N8MF4X9UXMkTFs2AGYCP64owVs2VGCLcYIC8=;
	b=BBgyYmbsUP+physe2mR7grb9tcxGeJCgw8nFlo+WhbSIyih5CVOHsuyNZ5PXvH5BKHpE/U
	FZ4TUcIL+fRGr8h4Ryuj4+KYpGgK4kLk8evg2OjJZq9/gLOYfGoMpoUEGQmccGSImIhyGr
	20PMtyS0UlPomcMb7xPhOmGtiq1zZdA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 03/19] tools/xenstore: add hashtable_replace() function
Date: Mon, 14 Aug 2023 09:46:51 +0200
Message-Id: <20230814074707.27696-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an effective way to replace a hashtable entry add a new function
hashtable_replace().

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V3:
- fix commit message (Julien Grall)
- move unrelated change to previous patch (Julien Grall)
- make value parameter const
V4:
- remove "const" from value parameter again (Julien Grall)
---
 tools/xenstore/hashtable.c | 19 +++++++++++++++++++
 tools/xenstore/hashtable.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 88e14c4c57..0c26a09567 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -205,6 +205,25 @@ void *hashtable_search(const struct hashtable *h, const void *k)
     return e ? e->v : NULL;
 }
 
+int hashtable_replace(struct hashtable *h, const void *k, void *v)
+{
+    struct entry *e;
+
+    e = hashtable_search_entry(h, k);
+    if (!e)
+        return ENOENT;
+
+    if (h->flags & HASHTABLE_FREE_VALUE)
+    {
+        talloc_free(e->v);
+        talloc_steal(e, v);
+    }
+
+    e->v = v;
+
+    return 0;
+}
+
 void
 hashtable_remove(struct hashtable *h, const void *k)
 {
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index e208d439a2..336540413b 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -45,6 +45,22 @@ create_hashtable(const void *ctx, const char *name,
 int
 hashtable_add(struct hashtable *h, const void *k, void *v);
 
+/*****************************************************************************
+ * hashtable_replace
+
+ * @name        hashtable_nsert
+ * @param   h   the hashtable to insert into
+ * @param   k   the key - hashtable claims ownership and will free on removal
+ * @param   v   the value - does not claim ownership
+ * @return      zero for successful insertion
+ *
+ * This function does check for an entry being present before replacing it
+ * with a new value.
+ */
+
+int
+hashtable_replace(struct hashtable *h, const void *k, void *v);
+
 /*****************************************************************************
  * hashtable_search
    
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565E75F434
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568747.888646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLw-0004bH-US; Mon, 24 Jul 2023 11:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568747.888646; Mon, 24 Jul 2023 11:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLw-0004YU-Qh; Mon, 24 Jul 2023 11:03:48 +0000
Received: by outflank-mailman (input) for mailman id 568747;
 Mon, 24 Jul 2023 11:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtLv-0000KR-76
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:03:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2c02585-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:03:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7385B20694;
 Mon, 24 Jul 2023 11:03:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4295A13476;
 Mon, 24 Jul 2023 11:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QU7oDpJavmSyYQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:03:46 +0000
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
X-Inumbo-ID: c2c02585-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xB6oTYH0jaatpxlvCW+IH+bGX/Y8NZRC6aQFlKjAIU=;
	b=IVp6ZksGh83WYzXRuRC9WvkUdC8TvLXiGMtuhXl2luo1OFl4cnh8CbKidF+Mzb+GoJOANJ
	n1/iwQOOuJxAO6sKE+EX6k0E0gx7kZOy15Uoh9K2y7NIcTZnWxkcHqE6u39oxZqV3V9ImY
	mQbSBNcn48EwXpmMBK9sXUt78SndYs0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 10/25] tools/xenstore: add hashtable_replace() function
Date: Mon, 24 Jul 2023 13:02:32 +0200
Message-Id: <20230724110247.10520-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an effective way to replace a hashtable entry add a new function
hashtable_replace().

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- fix commit message (Julien Grall)
- move unrelated change to previous patch (Julien Grall)
- make value parameter const
---
 tools/xenstore/hashtable.c | 19 +++++++++++++++++++
 tools/xenstore/hashtable.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 0409725060..f85b5a71f1 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -205,6 +205,25 @@ void *hashtable_search(const struct hashtable *h, const void *k)
     return e ? e->v : NULL;
 }
 
+int hashtable_replace(struct hashtable *h, const void *k, const void *v)
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
+    e->v = (void *)v;
+
+    return 0;
+}
+
 void
 hashtable_remove(struct hashtable *h, const void *k)
 {
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 1da3af2648..125de0cfa2 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -51,6 +51,22 @@ create_hashtable(const void *ctx, const char *name,
 int
 hashtable_add(struct hashtable *h, const void *k, const void *v);
 
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
+hashtable_replace(struct hashtable *h, const void *k, const void *v);
+
 /*****************************************************************************
  * hashtable_search
    
-- 
2.35.3



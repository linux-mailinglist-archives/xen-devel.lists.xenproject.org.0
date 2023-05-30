Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30F7159BB
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540999.843253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vUi-0004HL-TM; Tue, 30 May 2023 09:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540999.843253; Tue, 30 May 2023 09:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vUi-0004DY-Pj; Tue, 30 May 2023 09:18:20 +0000
Received: by outflank-mailman (input) for mailman id 540999;
 Tue, 30 May 2023 09:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQy-0006QB-6Z
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:14:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fe6ce42-feca-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:14:26 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52AE11FD68;
 Tue, 30 May 2023 09:14:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 255AB1341B;
 Tue, 30 May 2023 09:14:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Wky5B3K+dWQgIwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:14:26 +0000
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
X-Inumbo-ID: 5fe6ce42-feca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nn+RzqKwoWELmwzFwHD2wqJWR2WvrgIjhm6QTn0HxkY=;
	b=XR7ELocM9rR1j1jqXlfZ/vmeXZBCtZKD9ux/KqGv0tgb1PX5OkqsxSO/nIk1+WEXmR8OJL
	R4oPf6R8j6kh5cZQU9AdXitfloUxNJan7syXnfzmmaB+yS0T40ywiYMBzwWBHTLMC2rNpM
	JWz2l1YSdXWbOr7ZYh5RWuNg/IMDmGI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 09/11] tools/xenstore: add hashtable_replace() function
Date: Tue, 30 May 2023 11:13:31 +0200
Message-Id: <20230530091333.7678-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an effective way to replace a hashtable entry add a new function
hashtable_replace().

While at it let hashtable_add() fail if an entry with the specified
key does already exist.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c | 52 ++++++++++++++++++++++++++++++--------
 tools/xenstore/hashtable.h | 16 ++++++++++++
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 9daddd9782..f358bec5ae 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -141,11 +141,32 @@ static int hashtable_expand(struct hashtable *h)
     return 0;
 }
 
+static struct entry *hashtable_search_entry(const struct hashtable *h,
+					    const void *k)
+{
+    struct entry *e;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h, k);
+    index = indexFor(h->tablelength,hashvalue);
+    e = h->table[index];
+    while (NULL != e)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e;
+        e = e->next;
+    }
+    return NULL;
+}
+
 int hashtable_add(struct hashtable *h, const void *k, void *v)
 {
-    /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
     struct entry *e;
+
+    if (hashtable_search_entry(h, k))
+        return EEXIST;
+
     if (++(h->entrycount) > h->loadlimit)
     {
         /* Ignore the return value. If expand fails, we should
@@ -176,17 +197,28 @@ int hashtable_add(struct hashtable *h, const void *k, void *v)
 void *hashtable_search(const struct hashtable *h, const void *k)
 {
     struct entry *e;
-    unsigned int hashvalue, index;
-    hashvalue = hash(h,k);
-    index = indexFor(h->tablelength,hashvalue);
-    e = h->table[index];
-    while (NULL != e)
+
+    e = hashtable_search_entry(h, k);
+    return e ? e->v : NULL;
+}
+
+int hashtable_replace(struct hashtable *h, const void *k, void *v)
+{
+    struct entry *e;
+
+    e = hashtable_search_entry(h, k);
+    if (!e)
+        return ENOENT;
+
+    if (h->flags & HASHTABLE_FREE_VALUE)
     {
-        /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
-        e = e->next;
+        talloc_free(e->v);
+        talloc_steal(e, v);
     }
-    return NULL;
+
+    e->v = v;
+
+    return 0;
 }
 
 void
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 792f6cda7b..214aea1b3d 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -51,6 +51,22 @@ create_hashtable(const void *ctx, const char *name,
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



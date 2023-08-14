Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170F77B2E6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583311.913470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIN-0002XO-Vj; Mon, 14 Aug 2023 07:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583311.913470; Mon, 14 Aug 2023 07:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIN-0002UJ-Rv; Mon, 14 Aug 2023 07:47:23 +0000
Received: by outflank-mailman (input) for mailman id 583311;
 Mon, 14 Aug 2023 07:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIM-0002SK-LY
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd134ec0-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:47:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82B5A21995;
 Mon, 14 Aug 2023 07:47:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D53F138EE;
 Mon, 14 Aug 2023 07:47:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PKx8EQnc2WSzQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:21 +0000
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
X-Inumbo-ID: cd134ec0-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQKqAGHpQVtxl80T0GmDl1V7RbEdq0qAK+T/rjrYAOw=;
	b=jGQ9jRTuoUMdJx1K3Nrkk9atNtABz6+43mSPmFBKdIhepZ7+gIVEANJfNdv4ay6Amwwp1E
	4ymuXfl6+uQCwLAoxRgbm5LFtGK32RN9i9yZwEJhNEVSZaRhfaDqNcY68HMbmVMn+CQazc
	lk0+X8aJvjVBIL54tHG2i3n4rvp8wKw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 02/19] tools/xenstore: let hashtable_add() fail in case of existing entry
Date: Mon, 14 Aug 2023 09:46:50 +0200
Message-Id: <20230814074707.27696-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Silently adding another entry with the same key to a hashtable is a
perfect receipt for later failure with hard to diagnose symptoms.

Let hashtable_add() fail in case another entry with the same key is
already existing.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- split off from next patch (Julien Grall)
- fix coding style (Julien Grall)
- use for () loop (Julien Grall)
---
 tools/xenstore/hashtable.c | 40 ++++++++++++++++++++++++++------------
 tools/xenstore/hashtable.h |  6 ------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 9daddd9782..88e14c4c57 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -141,11 +141,34 @@ static int hashtable_expand(struct hashtable *h)
     return 0;
 }
 
+static struct entry *hashtable_search_entry(const struct hashtable *h,
+                                            const void *k)
+{
+    struct entry *e;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h, k);
+    index = indexFor(h->tablelength, hashvalue);
+    e = h->table[index];
+
+    for (e = h->table[index]; e; e = e->next)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
+            return e;
+    }
+
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
@@ -176,17 +199,10 @@ int hashtable_add(struct hashtable *h, const void *k, void *v)
 void *hashtable_search(const struct hashtable *h, const void *k)
 {
     struct entry *e;
-    unsigned int hashvalue, index;
-    hashvalue = hash(h,k);
-    index = indexFor(h->tablelength,hashvalue);
-    e = h->table[index];
-    while (NULL != e)
-    {
-        /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
-        e = e->next;
-    }
-    return NULL;
+
+    e = hashtable_search_entry(h, k);
+
+    return e ? e->v : NULL;
 }
 
 void
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 792f6cda7b..e208d439a2 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -40,12 +40,6 @@ create_hashtable(const void *ctx, const char *name,
  *
  * This function will cause the table to expand if the insertion would take
  * the ratio of entries to table size over the maximum load factor.
- *
- * This function does not check for repeated insertions with a duplicate key.
- * The value returned when using a duplicate key is undefined -- when
- * the hashtable changes size, the order of retrieval of duplicate key
- * entries is reversed.
- * If in doubt, remove before insert.
  */
 
 int
-- 
2.35.3



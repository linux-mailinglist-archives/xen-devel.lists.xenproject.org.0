Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF50464B921
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460738.718740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57iY-0003TF-D3; Tue, 13 Dec 2022 16:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460738.718740; Tue, 13 Dec 2022 16:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57iY-0003PK-7W; Tue, 13 Dec 2022 16:01:18 +0000
Received: by outflank-mailman (input) for mailman id 460738;
 Tue, 13 Dec 2022 16:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57iX-0001ta-2t
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:01:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb2cfc3-7aff-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:01:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CCB881FDAB;
 Tue, 13 Dec 2022 16:01:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B29F138EE;
 Tue, 13 Dec 2022 16:01:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fUujJMuhmGOqKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:01:15 +0000
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
X-Inumbo-ID: 5fb2cfc3-7aff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UptZp8ROkSilFG4tYMMbyMYYtc6wOlksuu4FVRkdJc=;
	b=S3zy+L0C34e7+ma26sn5nOxhXTJO8ZBhTTchLaa7GCfFstMmofecEK6w6uo81hxD7NiLDM
	lBpEy5/OatcKh7znQwn4NWgELqX4t2qZ9xKwK/7kXw6+tNHM6J/Z8jpCsyzsGPkTxLkcq5
	KxVN/JbwlNgBXSwnDuKj6B1dYDQBpsU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 05/19] tools/xenstore: enhance hashtable implementation
Date: Tue, 13 Dec 2022 17:00:31 +0100
Message-Id: <20221213160045.28170-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today it is possible to set a flag when calling hashtable_destroy() in
order to specify whether the data associated with the hashtable entries
should be freed or not. The keys of the entries will always be freed.

Change that by replacing the flag of hashtable_destroy() by two flags
for create_hashtable() which will specify whether the data and/or the
key of each entry should be freed or not.

This will enable users to have the key e.g. as part of the data.

Add a new function hashtable_iterate() to call a user specified
function for each entry in the hashtable.

Add new primes to the primetable in order to support smaller sizes of
the hashtable. The primes are selected according to:

https://planetmath.org/goodhashtableprimes

Update the URL in the source as the old one wasn't correct any longer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- add const to hashtable_iterate() callback (Julien Grall)
---
 tools/xenstore/hashtable.c      | 66 +++++++++++++++++++++++----------
 tools/xenstore/hashtable.h      | 35 +++++++++++++++--
 tools/xenstore/xenstored_core.c |  7 ++--
 3 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 6ac336eff1..299549c51e 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -16,6 +16,7 @@ struct entry
 
 struct hashtable {
     unsigned int tablelength;
+    unsigned int flags;
     struct entry **table;
     unsigned int entrycount;
     unsigned int loadlimit;
@@ -25,12 +26,11 @@ struct hashtable {
 };
 
 /*
-Credit for primes table: Aaron Krowne
- http://br.endernet.org/~akrowne/
- http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
-*/
+ * Credit for primes table: Aaron Krowne
+ * https://planetmath.org/goodhashtableprimes
+ */
 static const unsigned int primes[] = {
-53, 97, 193, 389,
+11, 23, 53, 97, 193, 389,
 769, 1543, 3079, 6151,
 12289, 24593, 49157, 98317,
 196613, 393241, 786433, 1572869,
@@ -52,7 +52,8 @@ indexFor(unsigned int tablelength, unsigned int hashvalue) {
 struct hashtable *
 create_hashtable(unsigned int minsize,
                  unsigned int (*hashf) (void*),
-                 int (*eqf) (void*,void*))
+                 int (*eqf) (void*,void*),
+                 unsigned int flags)
 {
     struct hashtable *h;
     unsigned int pindex, size = primes[0];
@@ -73,6 +74,7 @@ create_hashtable(unsigned int minsize,
         goto err1;
 
     h->tablelength  = size;
+    h->flags        = flags;
     h->primeindex   = pindex;
     h->entrycount   = 0;
     h->hashfn       = hashf;
@@ -235,7 +237,8 @@ hashtable_remove(struct hashtable *h, void *k)
             *pE = e->next;
             h->entrycount--;
             v = e->v;
-            free(e->k);
+            if (h->flags & HASHTABLE_FREE_KEY)
+                free(e->k);
             free(e);
             return v;
         }
@@ -246,29 +249,52 @@ hashtable_remove(struct hashtable *h, void *k)
 }
 
 /*****************************************************************************/
-/* destroy */
-void
-hashtable_destroy(struct hashtable *h, int free_values)
+int
+hashtable_iterate(struct hashtable *h,
+                  int (*func)(const void *k, void *v, void *arg), void *arg)
 {
+    int ret;
     unsigned int i;
     struct entry *e, *f;
     struct entry **table = h->table;
-    if (free_values)
+
+    for (i = 0; i < h->tablelength; i++)
     {
-        for (i = 0; i < h->tablelength; i++)
+        e = table[i];
+        while (e)
         {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; free(f->k); free(f->v); free(f); }
+            f = e;
+            e = e->next;
+            ret = func(f->k, f->v, arg);
+            if (ret)
+                return ret;
         }
     }
-    else
+
+    return 0;
+}
+
+/*****************************************************************************/
+/* destroy */
+void
+hashtable_destroy(struct hashtable *h)
+{
+    unsigned int i;
+    struct entry *e, *f;
+    struct entry **table = h->table;
+
+    for (i = 0; i < h->tablelength; i++)
     {
-        for (i = 0; i < h->tablelength; i++)
+        e = table[i];
+        while (NULL != e)
         {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; free(f->k); free(f); }
+            f = e;
+            e = e->next;
+            if (h->flags & HASHTABLE_FREE_KEY)
+                free(f->k);
+            if (h->flags & HASHTABLE_FREE_VALUE)
+                free(f->v);
+            free(f);
         }
     }
     free(h->table);
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 62fef6081a..6d65431f96 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -12,13 +12,21 @@ struct hashtable;
  * @param   minsize         minimum initial size of hashtable
  * @param   hashfunction    function for hashing keys
  * @param   key_eq_fn       function for determining key equality
+ * @param   flags           flags HASHTABLE_*
  * @return                  newly created hashtable or NULL on failure
  */
 
+/* Let hashtable_destroy() free the entries' values. */
+#define HASHTABLE_FREE_VALUE (1U << 0)
+/* Let hashtable_remove() and hashtable_destroy() free the entries' keys. */
+#define HASHTABLE_FREE_KEY   (1U << 1)
+
 struct hashtable *
 create_hashtable(unsigned int minsize,
                  unsigned int (*hashfunction) (void*),
-                 int (*key_eq_fn) (void*,void*));
+                 int (*key_eq_fn) (void*,void*),
+                 unsigned int flags
+);
 
 /*****************************************************************************
  * hashtable_insert
@@ -76,16 +84,37 @@ hashtable_remove(struct hashtable *h, void *k);
 unsigned int
 hashtable_count(struct hashtable *h);
 
+/*****************************************************************************
+ * hashtable_iterate
+
+ * @name           hashtable_iterate
+ * @param   h      the hashtable
+ * @param   func   function to call for each entry
+ * @param   arg    user supplied parameter for func
+ * @return         0 if okay, non-zero return value of func (and iteration
+ *                 was aborted)
+ *
+ * Iterates over all entries in the hashtable and calls func with the
+ * key, value, and the user supplied parameter.
+ * func returning a non-zero value will abort the iteration. In case func is
+ * removing an entry other than itself from the hashtable, it must return a
+ * non-zero value in order to abort the iteration. Inserting entries is
+ * allowed, but it is undefined whether func will be called for those new
+ * entries during this iteration.
+ */
+int
+hashtable_iterate(struct hashtable *h,
+                  int (*func)(const void *k, void *v, void *arg), void *arg);
+
 /*****************************************************************************
  * hashtable_destroy
    
  * @name        hashtable_destroy
  * @param   h   the hashtable
- * @param       free_values     whether to call 'free' on the remaining values
  */
 
 void
-hashtable_destroy(struct hashtable *h, int free_values);
+hashtable_destroy(struct hashtable *h);
 
 #endif /* __HASHTABLE_CWC22_H__ */
 
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 8c2cca62b7..1650821922 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2512,7 +2512,9 @@ void check_store(void)
 		.enoent = check_store_enoent,
 	};
 
-	reachable = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+	/* Don't free values (they are all void *1) */
+	reachable = create_hashtable(16, hash_from_key_fn, keys_equal_fn,
+				     HASHTABLE_FREE_KEY);
 	if (!reachable) {
 		log("check_store: ENOMEM");
 		return;
@@ -2526,8 +2528,7 @@ void check_store(void)
 		clean_store(reachable);
 	log("Checking store complete.");
 
-	hashtable_destroy(reachable, 0 /* Don't free values (they are all
-					  (void *)1) */);
+	hashtable_destroy(reachable);
 }
 
 
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C271591D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540873.842982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7v-00037P-4a; Tue, 30 May 2023 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540873.842982; Tue, 30 May 2023 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7v-00032z-0v; Tue, 30 May 2023 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 540873;
 Tue, 30 May 2023 08:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v7t-00026J-OZ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:54:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f0b082e-fec7-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:54:44 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C10101F889;
 Tue, 30 May 2023 08:54:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9748E1341B;
 Tue, 30 May 2023 08:54:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 7bKQI9O5dWRcGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:54:43 +0000
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
X-Inumbo-ID: 9f0b082e-fec7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPoeTUcM9T4+NNSVnWYJP6NUt2CPkIcsiQEBOk5fFTE=;
	b=NswNjplESYHuW86lZ30UhtlPK3LGYRd+y9vt/onZ9rsOpu7+iTK908uDCmMltQoOxQ+HtN
	VjVCvbzycNhVl4trNzRWbkos1R6QjDlgB9u6N5ML9kw6esQbnNe6wJSKZUMmMqb+JjooJW
	WRzohHLqbLXEbLB/pVyLbS81BrRBBcM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 04/16] tools/xenstore: rename hashtable_insert() and let it return 0 on success
Date: Tue, 30 May 2023 10:54:06 +0200
Message-Id: <20230530085418.5417-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today hashtable_insert() returns 0 in case of an error. Change that to
let it return an errno value in the error case and 0 in case of success.
In order to avoid any missed return value checks or related future
backport errors, rename hashtable_insert() to hashtable_add().

Even if not used today, do the same switch for the return value of
hashtable_expand().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- rename to hashtable_add() (triggered by Julien Grall)
---
 tools/xenstore/hashtable.c             | 17 +++++++++++------
 tools/xenstore/hashtable.h             |  8 ++++----
 tools/xenstore/xenstored_core.c        |  6 +++---
 tools/xenstore/xenstored_domain.c      |  4 ++--
 tools/xenstore/xenstored_transaction.c |  4 ++--
 5 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 3d2d3a0e22..11f6bf8f15 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -105,14 +105,15 @@ static int hashtable_expand(struct hashtable *h)
     struct entry **pE;
     unsigned int newsize, i, index;
     /* Check we're not hitting max capacity */
-    if (h->primeindex == (PRIME_TABLE_LEN - 1)) return 0;
+    if (h->primeindex == (PRIME_TABLE_LEN - 1))
+        return ENOSPC;
     newsize = primes[++(h->primeindex)];
 
     newtable = talloc_realloc(h, h->table, struct entry *, newsize);
     if (!newtable)
     {
         h->primeindex--;
-        return 0;
+        return ENOMEM;
     }
 
     h->table = newtable;
@@ -136,10 +137,10 @@ static int hashtable_expand(struct hashtable *h)
 
     h->tablelength = newsize;
     h->loadlimit   = loadlimit(h->primeindex);
-    return -1;
+    return 0;
 }
 
-int hashtable_insert(struct hashtable *h, void *k, void *v)
+int hashtable_add(struct hashtable *h, void *k, void *v)
 {
     /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
@@ -153,7 +154,11 @@ int hashtable_insert(struct hashtable *h, void *k, void *v)
         hashtable_expand(h);
     }
     e = talloc_zero(h, struct entry);
-    if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
+    if (NULL == e)
+    {
+        --h->entrycount;
+       return ENOMEM;
+    }
     e->h = hash(h,k);
     index = indexFor(h->tablelength,e->h);
     e->k = k;
@@ -164,7 +169,7 @@ int hashtable_insert(struct hashtable *h, void *k, void *v)
         talloc_steal(e, v);
     e->next = h->table[index];
     h->table[index] = e;
-    return -1;
+    return 0;
 }
 
 void *hashtable_search(const struct hashtable *h, const void *k)
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 0e1a6f61c2..5a2cc4a4be 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -30,13 +30,13 @@ create_hashtable(const void *ctx, const char *name,
 );
 
 /*****************************************************************************
- * hashtable_insert
+ * hashtable_add
    
- * @name        hashtable_insert
+ * @name        hashtable_add
  * @param   h   the hashtable to insert into
  * @param   k   the key - hashtable claims ownership and will free on removal
  * @param   v   the value - does not claim ownership
- * @return      non-zero for successful insertion
+ * @return      zero for successful insertion
  *
  * This function will cause the table to expand if the insertion would take
  * the ratio of entries to table size over the maximum load factor.
@@ -49,7 +49,7 @@ create_hashtable(const void *ctx, const char *name,
  */
 
 int 
-hashtable_insert(struct hashtable *h, void *k, void *v);
+hashtable_add(struct hashtable *h, void *k, void *v);
 
 /*****************************************************************************
  * hashtable_search
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 418790d8d7..c467a704a1 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2404,8 +2404,8 @@ int remember_string(struct hashtable *hash, const char *str)
 	char *k = talloc_strdup(NULL, str);
 
 	if (!k)
-		return 0;
-	return hashtable_insert(hash, k, (void *)1);
+		return ENOMEM;
+	return hashtable_add(hash, k, (void *)1);
 }
 
 /**
@@ -2438,7 +2438,7 @@ static int check_store_step(const void *ctx, struct connection *conn,
 				: WALK_TREE_SKIP_CHILDREN;
 	}
 
-	if (!remember_string(data->reachable, node->name))
+	if (remember_string(data->reachable, node->name))
 		return WALK_TREE_ERROR_STOP;
 
 	domain_check_acc_add(node, data->domains);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index a1c91ef3f3..815f15cd1d 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -538,7 +538,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid)
 	domain->generation = generation;
 	domain->introduced = false;
 
-	if (!hashtable_insert(domhash, &domain->domid, domain)) {
+	if (hashtable_add(domhash, &domain->domid, domain)) {
 		talloc_free(domain);
 		errno = ENOMEM;
 		return NULL;
@@ -1795,7 +1795,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 */
 	dom->nodes = -d->acc[ACC_NODES].val;
 
-	if (!hashtable_insert(domains, &dom->domid, dom)) {
+	if (hashtable_add(domains, &dom->domid, dom)) {
 		talloc_free(dom);
 		return -1;
 	}
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index db06d0e7f1..334f1609f1 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -601,13 +601,13 @@ int check_transactions(struct hashtable *hash)
 		list_for_each_entry(trans, &conn->transaction_list, list) {
 			tname = talloc_asprintf(trans, "%"PRIu64,
 						trans->generation);
-			if (!tname || !remember_string(hash, tname))
+			if (!tname || remember_string(hash, tname))
 				goto nomem;
 
 			list_for_each_entry(i, &trans->accessed, list) {
 				if (!i->ta_node)
 					continue;
-				if (!remember_string(hash, i->trans_name))
+				if (remember_string(hash, i->trans_name))
 					goto nomem;
 			}
 
-- 
2.35.3



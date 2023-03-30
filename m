Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798296CFF17
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516502.800727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzS-0006qd-Qq; Thu, 30 Mar 2023 08:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516502.800727; Thu, 30 Mar 2023 08:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzS-0006mU-Mm; Thu, 30 Mar 2023 08:50:38 +0000
Received: by outflank-mailman (input) for mailman id 516502;
 Thu, 30 Mar 2023 08:50:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnzR-0005fr-BG
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0775447-ced7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:50:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8147621B0D;
 Thu, 30 Mar 2023 08:50:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56483138FF;
 Thu, 30 Mar 2023 08:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 78G6E1xNJWQbIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:36 +0000
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
X-Inumbo-ID: f0775447-ced7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mh22UmQC/9EYE48tEsEFwbVqpQAAehAkZgB8F1H4+sY=;
	b=EBcok8zLDq2vnVCOBh0/ulacFaGPeaJpsHEsURLa6cgq8a7CmCFJxU+OcVPLq1V5B1KA5X
	pVXbT7SwqDYmhxKWhmGhejdPV6jOy6vWeU3EqOr/VCxI0PFuQtDcaYjNM7JcXicUpmx9r0
	/YngaGolj72p420Bm5x6Ecoxuzbj4bk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 04/13] tools/xenstore: let hashtable_insert() return 0 on success
Date: Thu, 30 Mar 2023 10:50:02 +0200
Message-Id: <20230330085011.9170-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today hashtable_insert() returns 0 in case of an error. Change that to
let it return an errno value in the error case and 0 in case of success.

Even if not used today, do the same switch for the return value of
hashtable_expand().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c             | 15 ++++++++++-----
 tools/xenstore/hashtable.h             |  2 +-
 tools/xenstore/xenstored_core.c        |  4 ++--
 tools/xenstore/xenstored_domain.c      |  4 ++--
 tools/xenstore/xenstored_transaction.c |  4 ++--
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index ab1e687d0b..084d562b22 100644
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
@@ -136,7 +137,7 @@ static int hashtable_expand(struct hashtable *h)
 
     h->tablelength = newsize;
     h->loadlimit   = loadlimit(h->primeindex);
-    return -1;
+    return 0;
 }
 
 int hashtable_insert(struct hashtable *h, void *k, void *v)
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
index 0e1a6f61c2..ee4e25cbbf 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -36,7 +36,7 @@ create_hashtable(const void *ctx, const char *name,
  * @param   h   the hashtable to insert into
  * @param   k   the key - hashtable claims ownership and will free on removal
  * @param   v   the value - does not claim ownership
- * @return      non-zero for successful insertion
+ * @return      zero for successful insertion
  *
  * This function will cause the table to expand if the insertion would take
  * the ratio of entries to table size over the maximum load factor.
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 6ce7be3161..c5433e5b3f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2394,7 +2394,7 @@ int remember_string(struct hashtable *hash, const char *str)
 	char *k = talloc_strdup(NULL, str);
 
 	if (!k)
-		return 0;
+		return ENOMEM;
 	return hashtable_insert(hash, k, (void *)1);
 }
 
@@ -2428,7 +2428,7 @@ static int check_store_step(const void *ctx, struct connection *conn,
 				: WALK_TREE_SKIP_CHILDREN;
 	}
 
-	if (!remember_string(data->reachable, node->name))
+	if (remember_string(data->reachable, node->name))
 		return WALK_TREE_ERROR_STOP;
 
 	domain_check_acc_add(node, data->domains);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 6d40aefc63..be9175a461 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -540,7 +540,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid)
 	domain->generation = generation;
 	domain->introduced = false;
 
-	if (!hashtable_insert(domhash, &domain->domid, domain)) {
+	if (hashtable_insert(domhash, &domain->domid, domain)) {
 		talloc_free(domain);
 		errno = ENOMEM;
 		return NULL;
@@ -1792,7 +1792,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 */
 	dom->nodes = -d->acc[ACC_NODES].val;
 
-	if (!hashtable_insert(domains, &dom->domid, dom)) {
+	if (hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
 		return -1;
 	}
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index e8968d7a1d..c615c0de13 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -600,13 +600,13 @@ int check_transactions(struct hashtable *hash)
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



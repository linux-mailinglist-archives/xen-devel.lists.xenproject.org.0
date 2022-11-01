Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8823614EF2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435090.688199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optvB-00049a-HN; Tue, 01 Nov 2022 16:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435090.688199; Tue, 01 Nov 2022 16:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optvB-00044X-9i; Tue, 01 Nov 2022 16:15:25 +0000
Received: by outflank-mailman (input) for mailman id 435090;
 Tue, 01 Nov 2022 16:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optv9-0000i5-AG
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62dddeb9-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4904E3382E;
 Tue,  1 Nov 2022 16:15:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CF4A1346F;
 Tue,  1 Nov 2022 16:15:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 30vABRpGYWNCdwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:22 +0000
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
X-Inumbo-ID: 62dddeb9-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wkI1F2q0wuo3k02I3w30xmcUIYPftf6mWJLCe27OacU=;
	b=UTcOeQTSFT9SOojEBqDhJP0nJ6RXmzODIkVf9DxuMqnQYqzAy2gWNtsAMPc0ocFA7GFAv2
	1pxrKEuzJ6pKP6gjBHrYbetw/ISTcpdzr54LfJKeWsaz+ue4JAZRZcA52TgDMFsTpJHezh
	BgXJmzbhGPeEW8V4brzn7b4GSeC523I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 04/10] tools/xenstore: let hashtable_insert() return 0 on success
Date: Tue,  1 Nov 2022 17:14:51 +0100
Message-Id: <20221101161457.8470-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
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
index 43a8caab82..1bed5ad384 100644
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
@@ -153,14 +154,18 @@ int hashtable_insert(struct hashtable *h, void *k, void *v)
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
     e->v = v;
     e->next = h->table[index];
     h->table[index] = e;
-    return -1;
+    return 0;
 }
 
 void *hashtable_search(struct hashtable *h, void *k)
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 5575f6c1dd..99a8331bec 100644
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
index c4d9d275be..5d35925ed8 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2385,7 +2385,7 @@ int remember_string(struct hashtable *hash, const char *str)
 	char *k = talloc_strdup(NULL, str);
 
 	if (!k)
-		return 0;
+		return ENOMEM;
 	return hashtable_insert(hash, k, (void *)1);
 }
 
@@ -2419,7 +2419,7 @@ static int check_store_step(const void *ctx, struct connection *conn,
 				: WALK_TREE_SKIP_CHILDREN;
 	}
 
-	if (!remember_string(data->reachable, node->name))
+	if (remember_string(data->reachable, node->name))
 		return WALK_TREE_ERROR_STOP;
 
 	domain_check_acc_add(node, data->domains);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index b3c288bf40..f871bdf04a 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -542,7 +542,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid)
 	domain->generation = generation;
 	domain->introduced = false;
 
-	if (!hashtable_insert(domhash, &domain->domid, domain)) {
+	if (hashtable_insert(domhash, &domain->domid, domain)) {
 		talloc_free(domain);
 		errno = ENOMEM;
 		return NULL;
@@ -1786,7 +1786,7 @@ static int domain_check_acc_init_sub(void *k, void *v, void *arg)
 	 */
 	dom->nodes = -d->acc[ACC_NODES].val;
 
-	if (!hashtable_insert(domains, &dom->domid, dom)) {
+	if (hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
 		return -1;
 	}
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 13fabe030d..7b2e78f104 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -588,13 +588,13 @@ int check_transactions(struct hashtable *hash)
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



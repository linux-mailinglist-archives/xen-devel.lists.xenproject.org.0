Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3C614EF0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435084.688166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv6-000305-D4; Tue, 01 Nov 2022 16:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435084.688166; Tue, 01 Nov 2022 16:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv6-0002vU-5T; Tue, 01 Nov 2022 16:15:20 +0000
Received: by outflank-mailman (input) for mailman id 435084;
 Tue, 01 Nov 2022 16:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optv4-0000i5-0L
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f893797-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE73D1F90F;
 Tue,  1 Nov 2022 16:15:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EDF41346F;
 Tue,  1 Nov 2022 16:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PHilHRRGYWMtdwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:16 +0000
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
X-Inumbo-ID: 5f893797-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePljyH5jlUhgLAg8XDkia2Vo0lFqj2Qpdrf2FB4EPzU=;
	b=KGxM5llsacI35uOqsmNhcEZhS/uWRSdQhPmi6hi/EOUtXVNP6dTXi/+gv9A516MZo3uqat
	HDKcN7WyMEqmUvXEGFJyQPbC9oBIEvoRjKo+Cxix4Bd/ItrzMO7SsJqcqycf7FJx6TwsIS
	V4d+xVt278CTw05khGNw+C4W/BywrZg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 03/10] tools/xenstore: modify interface of create_hashtable()
Date: Tue,  1 Nov 2022 17:14:50 +0100
Message-Id: <20221101161457.8470-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minsize parameter of create_hashtable() doesn't have any real use
case for Xenstore, so drop it.

For better talloc_report_full() diagnostic output add a name parameter
to create_hashtable().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c        | 24 ++++++++----------------
 tools/xenstore/hashtable.h        |  4 ++--
 tools/xenstore/xenstored_core.c   |  2 +-
 tools/xenstore/xenstored_domain.c |  4 ++--
 4 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index d312004d70..43a8caab82 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -55,36 +55,28 @@ static unsigned int loadlimit(unsigned int pindex)
     return ((uint64_t)primes[pindex] * MAX_LOAD_PERCENT) / 100;
 }
 
-struct hashtable *create_hashtable(const void *ctx, unsigned int minsize,
-                                   unsigned int (*hashf) (void *),
-                                   int (*eqf) (void *,void *),
+struct hashtable *create_hashtable(const void *ctx, const char *name,
+                                   unsigned int (*hashf) (void*),
+                                   int (*eqf) (void*,void*),
                                    unsigned int flags)
 {
     struct hashtable *h;
-    unsigned int pindex, size = primes[0];
-
-    /* Check requested hashtable isn't too large */
-    if (minsize > (1u << 30)) return NULL;
-
-    /* Enforce size as prime */
-    for (pindex=0; pindex < PRIME_TABLE_LEN; pindex++) {
-        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
-    }
 
     h = talloc_zero(ctx, struct hashtable);
     if (NULL == h)
         goto err0;
-    h->table = talloc_zero_array(h, struct entry *, size);
+    talloc_set_name_const(h, name);
+    h->table = talloc_zero_array(h, struct entry *, primes[0]);
     if (NULL == h->table)
         goto err1;
 
-    h->tablelength  = size;
+    h->tablelength  = primes[0];
     h->flags        = flags;
-    h->primeindex   = pindex;
+    h->primeindex   = 0;
     h->entrycount   = 0;
     h->hashfn       = hashf;
     h->eqfn         = eqf;
-    h->loadlimit    = loadlimit(pindex);
+    h->loadlimit    = loadlimit(0);
     return h;
 
 err1:
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index f1caef0d4f..5575f6c1dd 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -10,7 +10,7 @@ struct hashtable;
    
  * @name                    create_hashtable
  * @param   ctx             talloc context to use for allocations
- * @param   minsize         minimum initial size of hashtable
+ * @param   name            talloc name of the hashtable
  * @param   hashfunction    function for hashing keys
  * @param   key_eq_fn       function for determining key equality
  * @param   flags           flags HASHTABLE_*
@@ -23,7 +23,7 @@ struct hashtable;
 #define HASHTABLE_FREE_KEY   (1U << 1)
 
 struct hashtable *
-create_hashtable(const void *ctx, unsigned int minsize,
+create_hashtable(const void *ctx, const char *name,
                  unsigned int (*hashfunction) (void*),
                  int (*key_eq_fn) (void*,void*),
                  unsigned int flags
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 714841d9ca..c4d9d275be 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2502,7 +2502,7 @@ void check_store(void)
 	struct check_store_data data;
 
 	/* Don't free values (they are all void *1) */
-	data.reachable = create_hashtable(NULL, 16, hash_from_key_fn,
+	data.reachable = create_hashtable(NULL, "checkstore", hash_from_key_fn,
 					  keys_equal_fn, HASHTABLE_FREE_KEY);
 	if (!data.reachable) {
 		log("check_store: ENOMEM");
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 1f746afd70..b3c288bf40 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1020,7 +1020,7 @@ void domain_init(int evtfd)
 	int rc;
 
 	/* Start with a random rather low domain count for the hashtable. */
-	domhash = create_hashtable(NULL, 8, domhash_fn, domeq_fn, 0);
+	domhash = create_hashtable(NULL, "domains", domhash_fn, domeq_fn, 0);
 	if (!domhash)
 		barf_perror("Failed to allocate domain hashtable");
 
@@ -1798,7 +1798,7 @@ struct hashtable *domain_check_acc_init(void)
 {
 	struct hashtable *domains;
 
-	domains = create_hashtable(NULL, 8, domhash_fn, domeq_fn,
+	domains = create_hashtable(NULL, "domain_check", domhash_fn, domeq_fn,
 				   HASHTABLE_FREE_VALUE);
 	if (!domains)
 		return NULL;
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF6614EEB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435076.688139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv0-0001u6-FT; Tue, 01 Nov 2022 16:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435076.688139; Tue, 01 Nov 2022 16:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv0-0001pC-9A; Tue, 01 Nov 2022 16:15:14 +0000
Received: by outflank-mailman (input) for mailman id 435076;
 Tue, 01 Nov 2022 16:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optuy-0000i5-AU
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c3528f9-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 202503382E;
 Tue,  1 Nov 2022 16:15:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E69B71346F;
 Tue,  1 Nov 2022 16:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QVjxNg5GYWMedwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:10 +0000
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
X-Inumbo-ID: 5c3528f9-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIb0/mYGQ+HwHEptI7zIsqWzXRU1CQBKgofF97fLAvs=;
	b=Mux+Oyeny1sk2ahF5isrQx7yM9meirOsLaQ2iXfYQm8Hn1AuqztnbpMJ8yiumFWQ9a70lW
	N1tKEZ/nKhEY9+oNc+JLe+Wm7x2xRa9yH4Zw8AGCvj7jQFA2ZRkGCY79FYlxIMS2upluMZ
	DsqP0sR1byMe9zu2wfI69MyLzeDBJwI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 02/10] tools/xenstore: do some cleanup of hashtable.c
Date: Tue,  1 Nov 2022 17:14:49 +0100
Message-Id: <20221101161457.8470-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do the following cleanups:
- hashtable_count() isn't used at all, so remove it
- replace prime_table_length and max_load_factor with macros
- make hash() static
- add a loadlimit() helper function
- remove the /***/ lines between functions
- do some style corrections

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c | 74 ++++++++++++++------------------------
 tools/xenstore/hashtable.h | 10 ------
 2 files changed, 27 insertions(+), 57 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 1c8656e016..d312004d70 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -40,22 +40,25 @@ static const unsigned int primes[] = {
 50331653, 100663319, 201326611, 402653189,
 805306457, 1610612741
 };
-const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);
-const unsigned int max_load_factor = 65; /* percentage */
 
-/*****************************************************************************/
-/* indexFor */
-static inline unsigned int
-indexFor(unsigned int tablelength, unsigned int hashvalue) {
+#define PRIME_TABLE_LEN   ARRAY_SIZE(primes)
+#define MAX_LOAD_PERCENT  65
+
+static inline unsigned int indexFor(unsigned int tablelength,
+                                    unsigned int hashvalue)
+{
     return (hashvalue % tablelength);
 }
 
-/*****************************************************************************/
-struct hashtable *
-create_hashtable(const void *ctx, unsigned int minsize,
-                 unsigned int (*hashf) (void*),
-                 int (*eqf) (void*,void*),
-                 unsigned int flags)
+static unsigned int loadlimit(unsigned int pindex)
+{
+    return ((uint64_t)primes[pindex] * MAX_LOAD_PERCENT) / 100;
+}
+
+struct hashtable *create_hashtable(const void *ctx, unsigned int minsize,
+                                   unsigned int (*hashf) (void *),
+                                   int (*eqf) (void *,void *),
+                                   unsigned int flags)
 {
     struct hashtable *h;
     unsigned int pindex, size = primes[0];
@@ -64,7 +67,7 @@ create_hashtable(const void *ctx, unsigned int minsize,
     if (minsize > (1u << 30)) return NULL;
 
     /* Enforce size as prime */
-    for (pindex=0; pindex < prime_table_length; pindex++) {
+    for (pindex=0; pindex < PRIME_TABLE_LEN; pindex++) {
         if (primes[pindex] > minsize) { size = primes[pindex]; break; }
     }
 
@@ -81,7 +84,7 @@ create_hashtable(const void *ctx, unsigned int minsize,
     h->entrycount   = 0;
     h->hashfn       = hashf;
     h->eqfn         = eqf;
-    h->loadlimit    = (unsigned int)(((uint64_t)size * max_load_factor) / 100);
+    h->loadlimit    = loadlimit(pindex);
     return h;
 
 err1:
@@ -90,9 +93,7 @@ err0:
    return NULL;
 }
 
-/*****************************************************************************/
-unsigned int
-hash(struct hashtable *h, void *k)
+static unsigned int hash(struct hashtable *h, void *k)
 {
     /* Aim to protect against poor hash functions by adding logic here
      * - logic taken from java 1.4 hashtable source */
@@ -104,9 +105,7 @@ hash(struct hashtable *h, void *k)
     return i;
 }
 
-/*****************************************************************************/
-static int
-hashtable_expand(struct hashtable *h)
+static int hashtable_expand(struct hashtable *h)
 {
     /* Double the size of the table to accomodate more entries */
     struct entry **newtable;
@@ -114,7 +113,7 @@ hashtable_expand(struct hashtable *h)
     struct entry **pE;
     unsigned int newsize, i, index;
     /* Check we're not hitting max capacity */
-    if (h->primeindex == (prime_table_length - 1)) return 0;
+    if (h->primeindex == (PRIME_TABLE_LEN - 1)) return 0;
     newsize = primes[++(h->primeindex)];
 
     newtable = talloc_realloc(h, h->table, struct entry *, newsize);
@@ -144,21 +143,11 @@ hashtable_expand(struct hashtable *h)
     }
 
     h->tablelength = newsize;
-    h->loadlimit   = (unsigned int)
-        (((uint64_t)newsize * max_load_factor) / 100);
+    h->loadlimit   = loadlimit(h->primeindex);
     return -1;
 }
 
-/*****************************************************************************/
-unsigned int
-hashtable_count(struct hashtable *h)
-{
-    return h->entrycount;
-}
-
-/*****************************************************************************/
-int
-hashtable_insert(struct hashtable *h, void *k, void *v)
+int hashtable_insert(struct hashtable *h, void *k, void *v)
 {
     /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
@@ -182,9 +171,7 @@ hashtable_insert(struct hashtable *h, void *k, void *v)
     return -1;
 }
 
-/*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_search(struct hashtable *h, void *k)
+void *hashtable_search(struct hashtable *h, void *k)
 {
     struct entry *e;
     unsigned int hashvalue, index;
@@ -200,9 +187,7 @@ hashtable_search(struct hashtable *h, void *k)
     return NULL;
 }
 
-/*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_remove(struct hashtable *h, void *k)
+void *hashtable_remove(struct hashtable *h, void *k)
 {
     /* TODO: consider compacting the table when the load factor drops enough,
      *       or provide a 'compact' method. */
@@ -235,10 +220,8 @@ hashtable_remove(struct hashtable *h, void *k)
     return NULL;
 }
 
-/*****************************************************************************/
-int
-hashtable_iterate(struct hashtable *h,
-                  int (*func)(void *k, void *v, void *arg), void *arg)
+int hashtable_iterate(struct hashtable *h,
+                      int (*func)(void *k, void *v, void *arg), void *arg)
 {
     int ret;
     unsigned int i;
@@ -261,10 +244,7 @@ hashtable_iterate(struct hashtable *h,
     return 0;
 }
 
-/*****************************************************************************/
-/* destroy */
-void
-hashtable_destroy(struct hashtable *h)
+void hashtable_destroy(struct hashtable *h)
 {
     unsigned int i;
     struct entry *e;
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 07fdc1a82b..f1caef0d4f 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -75,16 +75,6 @@ hashtable_search(struct hashtable *h, void *k);
 void * /* returns value */
 hashtable_remove(struct hashtable *h, void *k);
 
-/*****************************************************************************
- * hashtable_count
-   
- * @name        hashtable_count
- * @param   h   the hashtable
- * @return      the number of items stored in the hashtable
- */
-unsigned int
-hashtable_count(struct hashtable *h);
-
 /*****************************************************************************
  * hashtable_iterate
 
-- 
2.35.3



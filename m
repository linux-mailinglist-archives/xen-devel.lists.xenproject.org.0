Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4B71591B
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540871.842962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7k-0002AH-Dp; Tue, 30 May 2023 08:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540871.842962; Tue, 30 May 2023 08:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7k-00027L-Am; Tue, 30 May 2023 08:54:36 +0000
Received: by outflank-mailman (input) for mailman id 540871;
 Tue, 30 May 2023 08:54:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v7j-00026J-3w
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:54:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9854e8a4-fec7-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:54:32 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8289E1F889;
 Tue, 30 May 2023 08:54:32 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 502901341B;
 Tue, 30 May 2023 08:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id EAdEEsi5dWRHGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:54:32 +0000
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
X-Inumbo-ID: 9854e8a4-fec7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rmDgbWyQvHCkeJMLRkTXiOnv1Jhx5fDWkp0U5diuzo=;
	b=B28C07bKo9E41KCRfualFAQuI0wrsve02hIL/WxIpbA7ouCbA43guc6NrW6ooGeBQT4yPB
	YsvgdGPR7NDUeV8vS6edlt6GtxlC/psakHlXACEvIw0phw1z4EomFbRpO46ksm0Dp9IRLt
	HCo1aiuY++qWTWgVMItXpvklCn+ludU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 02/16] tools/xenstore: do some cleanup of hashtable.c
Date: Tue, 30 May 2023 10:54:04 +0200
Message-Id: <20230530085418.5417-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
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
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- more style corrections (Julien Grall)
---
 tools/xenstore/hashtable.c | 76 +++++++++++++++-----------------------
 tools/xenstore/hashtable.h | 10 -----
 2 files changed, 30 insertions(+), 56 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 3d4466b597..dc209158fa 100644
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
-                 unsigned int (*hashf) (const void *),
-                 int (*eqf) (const void *, const void *),
-                 unsigned int flags)
+static unsigned int loadlimit(unsigned int pindex)
+{
+    return ((uint64_t)primes[pindex] * MAX_LOAD_PERCENT) / 100;
+}
+
+struct hashtable *create_hashtable(const void *ctx, unsigned int minsize,
+                                   unsigned int (*hashf) (const void *),
+                                   int (*eqf) (const void *, const void *),
+                                   unsigned int flags)
 {
     struct hashtable *h;
     unsigned int pindex, size = primes[0];
@@ -64,8 +67,11 @@ create_hashtable(const void *ctx, unsigned int minsize,
     if (minsize > (1u << 30)) return NULL;
 
     /* Enforce size as prime */
-    for (pindex=0; pindex < prime_table_length; pindex++) {
-        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
+    for (pindex = 0; pindex < PRIME_TABLE_LEN; pindex++) {
+        if (primes[pindex] > minsize) {
+            size = primes[pindex];
+            break;
+        }
     }
 
     h = talloc_zero(ctx, struct hashtable);
@@ -81,7 +87,7 @@ create_hashtable(const void *ctx, unsigned int minsize,
     h->entrycount   = 0;
     h->hashfn       = hashf;
     h->eqfn         = eqf;
-    h->loadlimit    = (unsigned int)(((uint64_t)size * max_load_factor) / 100);
+    h->loadlimit    = loadlimit(pindex);
     return h;
 
 err1:
@@ -90,9 +96,7 @@ err0:
    return NULL;
 }
 
-/*****************************************************************************/
-unsigned int
-hash(const struct hashtable *h, const void *k)
+static unsigned int hash(const struct hashtable *h, const void *k)
 {
     /* Aim to protect against poor hash functions by adding logic here
      * - logic taken from java 1.4 hashtable source */
@@ -104,9 +108,7 @@ hash(const struct hashtable *h, const void *k)
     return i;
 }
 
-/*****************************************************************************/
-static int
-hashtable_expand(struct hashtable *h)
+static int hashtable_expand(struct hashtable *h)
 {
     /* Double the size of the table to accomodate more entries */
     struct entry **newtable;
@@ -114,7 +116,7 @@ hashtable_expand(struct hashtable *h)
     struct entry **pE;
     unsigned int newsize, i, index;
     /* Check we're not hitting max capacity */
-    if (h->primeindex == (prime_table_length - 1)) return 0;
+    if (h->primeindex == (PRIME_TABLE_LEN - 1)) return 0;
     newsize = primes[++(h->primeindex)];
 
     newtable = talloc_realloc(h, h->table, struct entry *, newsize);
@@ -144,21 +146,11 @@ hashtable_expand(struct hashtable *h)
     }
 
     h->tablelength = newsize;
-    h->loadlimit   = (unsigned int)
-        (((uint64_t)newsize * max_load_factor) / 100);
+    h->loadlimit   = loadlimit(h->primeindex);
     return -1;
 }
 
-/*****************************************************************************/
-unsigned int
-hashtable_count(const struct hashtable *h)
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
@@ -186,9 +178,7 @@ hashtable_insert(struct hashtable *h, void *k, void *v)
     return -1;
 }
 
-/*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_search(const struct hashtable *h, const void *k)
+void *hashtable_search(const struct hashtable *h, const void *k)
 {
     struct entry *e;
     unsigned int hashvalue, index;
@@ -204,7 +194,6 @@ hashtable_search(const struct hashtable *h, const void *k)
     return NULL;
 }
 
-/*****************************************************************************/
 void
 hashtable_remove(struct hashtable *h, const void *k)
 {
@@ -234,10 +223,8 @@ hashtable_remove(struct hashtable *h, const void *k)
     }
 }
 
-/*****************************************************************************/
-int
-hashtable_iterate(struct hashtable *h,
-                  int (*func)(const void *k, void *v, void *arg), void *arg)
+int hashtable_iterate(struct hashtable *h,
+                      int (*func)(const void *k, void *v, void *arg), void *arg)
 {
     int ret;
     unsigned int i;
@@ -260,10 +247,7 @@ hashtable_iterate(struct hashtable *h,
     return 0;
 }
 
-/*****************************************************************************/
-/* destroy */
-void
-hashtable_destroy(struct hashtable *h)
+void hashtable_destroy(struct hashtable *h)
 {
     talloc_free(h);
 }
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index cc0090f133..04310783b6 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -74,16 +74,6 @@ hashtable_search(const struct hashtable *h, const void *k);
 void
 hashtable_remove(struct hashtable *h, const void *k);
 
-/*****************************************************************************
- * hashtable_count
-   
- * @name        hashtable_count
- * @param   h   the hashtable
- * @return      the number of items stored in the hashtable
- */
-unsigned int
-hashtable_count(const struct hashtable *h);
-
 /*****************************************************************************
  * hashtable_iterate
 
-- 
2.35.3



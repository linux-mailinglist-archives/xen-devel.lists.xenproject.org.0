Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A3614E8A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434982.687974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQX-0004nW-0j; Tue, 01 Nov 2022 15:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434982.687974; Tue, 01 Nov 2022 15:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQW-0004iD-N0; Tue, 01 Nov 2022 15:43:44 +0000
Received: by outflank-mailman (input) for mailman id 434982;
 Tue, 01 Nov 2022 15:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optDa-0007Bd-59
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:30:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18bfe960-59fa-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:30:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F00081F90F;
 Tue,  1 Nov 2022 15:30:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4CA81346F;
 Tue,  1 Nov 2022 15:30:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFyNLow7YWNqYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:30:20 +0000
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
X-Inumbo-ID: 18bfe960-59fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic6QdQsT3IiF6Ltj3wF/G4ESqbAyko/szkpr1ypz+8c=;
	b=tRkxrFYV3oaB/2utzN949AwMp4KgL1SdgHyhRiBQW6W5TqBAHM4BNUS6x4vFwpgMq6oGYU
	BOwywZvi2T2Cyd3Id+NmSYyZI1eHlWz99UzigKQJ5T7bTGiilX1EVe1yVf7eCZRO4eV2Cu
	5eRpY9D3VSDjUASKrKfbzg5rCjAcUxg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 17/20] tools/xenstore: switch hashtable to use the talloc framework
Date: Tue,  1 Nov 2022 16:28:39 +0100
Message-Id: <20221101152842.4257-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using malloc() and friends, let the hashtable implementation
use the talloc framework.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c        | 86 ++++++++++++-------------------
 tools/xenstore/hashtable.h        |  3 +-
 tools/xenstore/xenstored_core.c   |  5 +-
 tools/xenstore/xenstored_domain.c |  2 +-
 4 files changed, 39 insertions(+), 57 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 7a1548c490..1c8656e016 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -6,6 +6,8 @@
 #include <string.h>
 #include <math.h>
 #include <stdint.h>
+#include <stdarg.h>
+#include "talloc.h"
 
 struct entry
 {
@@ -50,7 +52,7 @@ indexFor(unsigned int tablelength, unsigned int hashvalue) {
 
 /*****************************************************************************/
 struct hashtable *
-create_hashtable(unsigned int minsize,
+create_hashtable(const void *ctx, unsigned int minsize,
                  unsigned int (*hashf) (void*),
                  int (*eqf) (void*,void*),
                  unsigned int flags)
@@ -66,10 +68,10 @@ create_hashtable(unsigned int minsize,
         if (primes[pindex] > minsize) { size = primes[pindex]; break; }
     }
 
-    h = (struct hashtable *)calloc(1, sizeof(struct hashtable));
+    h = talloc_zero(ctx, struct hashtable);
     if (NULL == h)
         goto err0;
-    h->table = (struct entry **)calloc(size, sizeof(struct entry *));
+    h->table = talloc_zero_array(h, struct entry *, size);
     if (NULL == h->table)
         goto err1;
 
@@ -83,7 +85,7 @@ create_hashtable(unsigned int minsize,
     return h;
 
 err1:
-   free(h);
+   talloc_free(h);
 err0:
    return NULL;
 }
@@ -115,47 +117,32 @@ hashtable_expand(struct hashtable *h)
     if (h->primeindex == (prime_table_length - 1)) return 0;
     newsize = primes[++(h->primeindex)];
 
-    newtable = (struct entry **)calloc(newsize, sizeof(struct entry*));
-    if (NULL != newtable)
+    newtable = talloc_realloc(h, h->table, struct entry *, newsize);
+    if (!newtable)
     {
-        /* This algorithm is not 'stable'. ie. it reverses the list
-         * when it transfers entries between the tables */
-        for (i = 0; i < h->tablelength; i++) {
-            while (NULL != (e = h->table[i])) {
-                h->table[i] = e->next;
-                index = indexFor(newsize,e->h);
+        h->primeindex--;
+        return 0;
+    }
+
+    h->table = newtable;
+    memset(newtable + h->tablelength, 0,
+           (newsize - h->tablelength) * sizeof(*newtable));
+    for (i = 0; i < h->tablelength; i++) {
+        for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
+            index = indexFor(newsize,e->h);
+            if (index == i)
+            {
+                pE = &(e->next);
+            }
+            else
+            {
+                *pE = e->next;
                 e->next = newtable[index];
                 newtable[index] = e;
             }
         }
-        free(h->table);
-        h->table = newtable;
-    }
-    /* Plan B: realloc instead */
-    else 
-    {
-        newtable = (struct entry **)
-                   realloc(h->table, newsize * sizeof(struct entry *));
-        if (NULL == newtable) { (h->primeindex)--; return 0; }
-        h->table = newtable;
-        memset(newtable + h->tablelength, 0,
-               (newsize - h->tablelength) * sizeof(*newtable));
-        for (i = 0; i < h->tablelength; i++) {
-            for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
-                index = indexFor(newsize,e->h);
-                if (index == i)
-                {
-                    pE = &(e->next);
-                }
-                else
-                {
-                    *pE = e->next;
-                    e->next = newtable[index];
-                    newtable[index] = e;
-                }
-            }
-        }
     }
+
     h->tablelength = newsize;
     h->loadlimit   = (unsigned int)
         (((uint64_t)newsize * max_load_factor) / 100);
@@ -184,7 +171,7 @@ hashtable_insert(struct hashtable *h, void *k, void *v)
          * element may be ok. Next time we insert, we'll try expanding again.*/
         hashtable_expand(h);
     }
-    e = (struct entry *)calloc(1, sizeof(struct entry));
+    e = talloc_zero(h, struct entry);
     if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
     e->h = hash(h,k);
     index = indexFor(h->tablelength,e->h);
@@ -238,8 +225,8 @@ hashtable_remove(struct hashtable *h, void *k)
             h->entrycount--;
             v = e->v;
             if (h->flags & HASHTABLE_FREE_KEY)
-                free(e->k);
-            free(e);
+                talloc_free(e->k);
+            talloc_free(e);
             return v;
         }
         pE = &(e->next);
@@ -280,25 +267,20 @@ void
 hashtable_destroy(struct hashtable *h)
 {
     unsigned int i;
-    struct entry *e, *f;
+    struct entry *e;
     struct entry **table = h->table;
 
     for (i = 0; i < h->tablelength; i++)
     {
-        e = table[i];
-        while (NULL != e)
+        for (e = table[i]; e; e = e->next)
         {
-            f = e;
-            e = e->next;
             if (h->flags & HASHTABLE_FREE_KEY)
-                free(f->k);
+                talloc_free(e->k);
             if (h->flags & HASHTABLE_FREE_VALUE)
-                free(f->v);
-            free(f);
+                talloc_free(e->v);
         }
     }
-    free(h->table);
-    free(h);
+    talloc_free(h);
 }
 
 /*
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index b31eeaea26..07fdc1a82b 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -9,6 +9,7 @@ struct hashtable;
  * create_hashtable
    
  * @name                    create_hashtable
+ * @param   ctx             talloc context to use for allocations
  * @param   minsize         minimum initial size of hashtable
  * @param   hashfunction    function for hashing keys
  * @param   key_eq_fn       function for determining key equality
@@ -22,7 +23,7 @@ struct hashtable;
 #define HASHTABLE_FREE_KEY   (1U << 1)
 
 struct hashtable *
-create_hashtable(unsigned int minsize,
+create_hashtable(const void *ctx, unsigned int minsize,
                  unsigned int (*hashfunction) (void*),
                  int (*key_eq_fn) (void*,void*),
                  unsigned int flags
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 5013f8b909..9361ee7696 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2410,11 +2410,10 @@ static int keys_equal_fn(void *key1, void *key2)
 
 int remember_string(struct hashtable *hash, const char *str)
 {
-	char *k = malloc(strlen(str) + 1);
+	char *k = talloc_strdup(NULL, str);
 
 	if (!k)
 		return 0;
-	strcpy(k, str);
 	return hashtable_insert(hash, k, (void *)1);
 }
 
@@ -2509,7 +2508,7 @@ void check_store(void)
 	};
 
 	/* Don't free values (they are all void *1) */
-	reachable = create_hashtable(16, hash_from_key_fn, keys_equal_fn,
+	reachable = create_hashtable(NULL, 16, hash_from_key_fn, keys_equal_fn,
 				     HASHTABLE_FREE_KEY);
 	if (!reachable) {
 		log("check_store: ENOMEM");
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3d460a6fa8..0bf35cd353 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -936,7 +936,7 @@ void domain_init(int evtfd)
 	int rc;
 
 	/* Start with a random rather low domain count for the hashtable. */
-	domhash = create_hashtable(8, domhash_fn, domeq_fn, 0);
+	domhash = create_hashtable(NULL, 8, domhash_fn, domeq_fn, 0);
 	if (!domhash)
 		barf_perror("Failed to allocate domain hashtable");
 
-- 
2.35.3



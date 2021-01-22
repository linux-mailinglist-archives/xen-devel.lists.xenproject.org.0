Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB32FFEFA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72609.130813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfR-0003NA-2j; Fri, 22 Jan 2021 09:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72609.130813; Fri, 22 Jan 2021 09:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfQ-0003MN-Qv; Fri, 22 Jan 2021 09:23:44 +0000
Received: by outflank-mailman (input) for mailman id 72609;
 Fri, 22 Jan 2021 09:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2sfO-00039U-Mh
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:23:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 594f7922-4ac8-4967-bc77-89285bcc797d;
 Fri, 22 Jan 2021 09:23:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7050AB804;
 Fri, 22 Jan 2021 09:23:26 +0000 (UTC)
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
X-Inumbo-ID: 594f7922-4ac8-4967-bc77-89285bcc797d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611307406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw3JfTLt9lsKfJRPXabRbaapZoM5jDAcQulm7FKWQ/I=;
	b=tnRifQ7V6oFcoDuCG4S5Ij8kgIm0KJR1lsiZ0kzwnecCVqMmFFMfyoO/CQNdE4dfnKDNfT
	7Fl0NL7sTpo/STfNiBqBljTXUfQhqN5BbjY6C8CH35Ov1UnshgFoSj+fHjONCwUTRV1GaD
	dIuRnHDfzIBjD+xOx+l8Oukrl9wCIio=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 3/4] tools/xenstore: rework hashtable interfaces
Date: Fri, 22 Jan 2021 10:23:23 +0100
Message-Id: <20210122092324.7178-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122092324.7178-1-jgross@suse.com>
References: <20210122092324.7178-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the interfaces to the hashtable code in order to adapt it better
to Xenstore:

- don't use user-specified hash- and compare-functions
- modify the type of the key to be const char *
- instead of using calloc() and free() switch to the talloc interfaces
- drop the due to talloc usage no longer needed free_values parameter
  from hashtable_destroy()
- add a hashtable name parameter to create_hashtable() for the talloc
  context
- drop the minsize parameter from create_hashtable()
- merge hashtable_private.h into hashtable.c
- add a hashtable_traverse() function to iterate over all entries
- add a hashtable_replace() function to replace an existing entry
- change hashtable_remove() to free the entry and return an int
- modify all int return values to 0 for success
- introduce a define for "no value"
- remove unused macros
- fix a bug in hashtable_expand()

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c             | 234 ++++++++++++++++---------
 tools/xenstore/hashtable.h             | 137 +++++----------
 tools/xenstore/hashtable_private.h     |  85 ---------
 tools/xenstore/xenstored_core.c        |  49 ++----
 tools/xenstore/xenstored_transaction.c |   4 +-
 5 files changed, 211 insertions(+), 298 deletions(-)
 delete mode 100644 tools/xenstore/hashtable_private.h

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 394b1cf9d0..6438ec78bf 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -1,12 +1,28 @@
 /* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
 
 #include "hashtable.h"
-#include "hashtable_private.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <math.h>
 #include <stdint.h>
+#include "talloc.h"
+
+struct entry
+{
+    const char *k;
+    void *v;
+    unsigned int h;
+    struct entry *next;
+};
+
+struct hashtable {
+    unsigned int tablelength;
+    struct entry **table;
+    unsigned int entrycount;
+    unsigned int loadlimit;
+    unsigned int primeindex;
+};
 
 /*
 Credit for primes table: Aaron Krowne
@@ -25,51 +41,57 @@ static const unsigned int primes[] = {
 const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);
 const unsigned int max_load_factor = 65; /* percentage */
 
+/*****************************************************************************/
+/* indexFor */
+static inline unsigned int
+indexFor(unsigned int tablelength, unsigned int hashvalue) {
+    return (hashvalue % tablelength);
+}
+
+static unsigned int
+loadlimit(unsigned int pindex)
+{
+    return (unsigned int)(((uint64_t)primes[pindex] * max_load_factor) / 100);
+}
+
 /*****************************************************************************/
 struct hashtable *
-create_hashtable(unsigned int minsize,
-                 unsigned int (*hashf) (void*),
-                 int (*eqf) (void*,void*))
+create_hashtable(const char *name)
 {
     struct hashtable *h;
-    unsigned int pindex, size = primes[0];
 
-    /* Check requested hashtable isn't too large */
-    if (minsize > (1u << 30)) return NULL;
-
-    /* Enforce size as prime */
-    for (pindex=0; pindex < prime_table_length; pindex++) {
-        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
-    }
-
-    h = (struct hashtable *)calloc(1, sizeof(struct hashtable));
+    h = talloc_zero(NULL, struct hashtable);
+    talloc_set_name_const(h, name);
     if (NULL == h)
         goto err0;
-    h->table = (struct entry **)calloc(size, sizeof(struct entry *));
+    h->table = talloc_zero_array(h, struct entry *, primes[0]);
     if (NULL == h->table)
         goto err1;
 
-    h->tablelength  = size;
-    h->primeindex   = pindex;
+    h->tablelength  = primes[0];
+    h->primeindex   = 0;
     h->entrycount   = 0;
-    h->hashfn       = hashf;
-    h->eqfn         = eqf;
-    h->loadlimit    = (unsigned int)(((uint64_t)size * max_load_factor) / 100);
+    h->loadlimit    = loadlimit(0);
     return h;
 
 err1:
-   free(h);
+   talloc_free(h);
 err0:
    return NULL;
 }
 
 /*****************************************************************************/
-unsigned int
-hash(struct hashtable *h, void *k)
+static unsigned int
+hash(struct hashtable *h, const char *k)
 {
+    unsigned int i = 5381;
+    char c;
+
+    while ((c = *k++))
+        i = ((i << 5) + i) + c;
+
     /* Aim to protect against poor hash functions by adding logic here
      * - logic taken from java 1.4 hashtable source */
-    unsigned int i = h->hashfn(k);
     i += ~(i << 9);
     i ^=  ((i >> 14) | (i << 18)); /* >>> */
     i +=  (i << 4);
@@ -78,7 +100,7 @@ hash(struct hashtable *h, void *k)
 }
 
 /*****************************************************************************/
-static int
+static void
 hashtable_expand(struct hashtable *h)
 {
     /* Double the size of the table to accomodate more entries */
@@ -87,10 +109,10 @@ hashtable_expand(struct hashtable *h)
     struct entry **pE;
     unsigned int newsize, i, index;
     /* Check we're not hitting max capacity */
-    if (h->primeindex == (prime_table_length - 1)) return 0;
+    if (h->primeindex == (prime_table_length - 1)) return;
     newsize = primes[++(h->primeindex)];
 
-    newtable = (struct entry **)calloc(newsize, sizeof(struct entry*));
+    newtable = talloc_zero_array(h, struct entry *, newsize);
     if (NULL != newtable)
     {
         /* This algorithm is not 'stable'. ie. it reverses the list
@@ -103,17 +125,17 @@ hashtable_expand(struct hashtable *h)
                 newtable[index] = e;
             }
         }
-        free(h->table);
+        talloc_free(h->table);
         h->table = newtable;
     }
     /* Plan B: realloc instead */
     else 
     {
-        newtable = (struct entry **)
-                   realloc(h->table, newsize * sizeof(struct entry *));
-        if (NULL == newtable) { (h->primeindex)--; return 0; }
+        newtable = talloc_realloc(h, h->table, struct entry *, newsize);
+        if (NULL == newtable) { (h->primeindex)--; return; }
         h->table = newtable;
-        memset(newtable[h->tablelength], 0, newsize - h->tablelength);
+        memset(newtable + h->tablelength, 0,
+               (newsize - h->tablelength) * sizeof(*newtable));
         for (i = 0; i < h->tablelength; i++) {
             for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
                 index = indexFor(newsize,e->h);
@@ -131,9 +153,7 @@ hashtable_expand(struct hashtable *h)
         }
     }
     h->tablelength = newsize;
-    h->loadlimit   = (unsigned int)
-        (((uint64_t)newsize * max_load_factor) / 100);
-    return -1;
+    h->loadlimit   = loadlimit(h->primeindex);
 }
 
 /*****************************************************************************/
@@ -145,11 +165,71 @@ hashtable_count(struct hashtable *h)
 
 /*****************************************************************************/
 int
-hashtable_insert(struct hashtable *h, void *k, void *v)
+hashtable_traverse(struct hashtable *h,
+                   int (fn)(struct hashtable *, const char *, void *, void *),
+                   void *par)
+{
+    unsigned int i;
+    struct entry *e;
+    struct entry **table = h->table;
+    int ret;
+
+    for (i = 0; i < h->tablelength; i++)
+    {
+        e = table[i];
+        for (e = table[i]; e; e = e->next)
+        {
+            ret = fn(h, e->k, e->v, par);
+            if (ret)
+                return ret;
+        }
+    }
+    return 0;
+}
+
+/*****************************************************************************/
+static struct entry *
+find_entry(struct hashtable *h, const char *k)
+{
+    struct entry *e;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h,k);
+    index = indexFor(h->tablelength,hashvalue);
+    e = h->table[index];
+    while (NULL != e)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && !strcmp(k, e->k)) return e;
+        e = e->next;
+    }
+    return NULL;
+}
+
+/*****************************************************************************/
+static int
+insert_or_replace(struct hashtable *h, const char *k, void *v, int r)
 {
-    /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
     struct entry *e;
+
+    e = find_entry(h, k);
+    if (e)
+    {
+        if (!r)
+            return -1;
+        if (e->v != HASHTABLE_NO_VALUE && e->v != v)
+            talloc_free(e->v);
+        if (e->k != k)
+            talloc_free((void *)e->k);
+        e->k = k;
+        talloc_steal(e, k);
+        e->v = v;
+        if (v != HASHTABLE_NO_VALUE)
+            talloc_steal(e, v);
+        return 0;
+    }
+
     if (++(h->entrycount) > h->loadlimit)
     {
         /* Ignore the return value. If expand fails, we should
@@ -158,45 +238,53 @@ hashtable_insert(struct hashtable *h, void *k, void *v)
          * element may be ok. Next time we insert, we'll try expanding again.*/
         hashtable_expand(h);
     }
-    e = (struct entry *)calloc(1, sizeof(struct entry));
-    if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
+    e = talloc_zero(h, struct entry);
+    if (NULL == e) { --(h->entrycount); return -1; } /*oom*/
     e->h = hash(h,k);
     index = indexFor(h->tablelength,e->h);
     e->k = k;
+    talloc_steal(e, k);
     e->v = v;
+    if (v != HASHTABLE_NO_VALUE)
+        talloc_steal(e, v);
     e->next = h->table[index];
     h->table[index] = e;
-    return -1;
+    return 0;
+}
+
+/*****************************************************************************/
+int
+hashtable_insert(struct hashtable *h, const char *k, void *v)
+{
+    return insert_or_replace(h, k, v, 0);
+}
+
+/*****************************************************************************/
+int
+hashtable_replace(struct hashtable *h, const char *k, void *v)
+{
+    return insert_or_replace(h, k, v, 1);
 }
 
 /*****************************************************************************/
 void * /* returns value associated with key */
-hashtable_search(struct hashtable *h, void *k)
+hashtable_search(struct hashtable *h, const char *k)
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
+    e = find_entry(h, k);
+    return e ? e->v : NULL;
 }
 
 /*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_remove(struct hashtable *h, void *k)
+int
+hashtable_remove(struct hashtable *h, const char *k)
 {
     /* TODO: consider compacting the table when the load factor drops enough,
      *       or provide a 'compact' method. */
 
     struct entry *e;
     struct entry **pE;
-    void *v;
     unsigned int hashvalue, index;
 
     hashvalue = hash(h,k);
@@ -206,49 +294,25 @@ hashtable_remove(struct hashtable *h, void *k)
     while (NULL != e)
     {
         /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
+        if ((hashvalue == e->h) && !strcmp(k, e->k))
         {
             *pE = e->next;
             h->entrycount--;
-            v = e->v;
-            freekey(e->k);
-            free(e);
-            return v;
+            talloc_free(e);
+            return 0;
         }
         pE = &(e->next);
         e = e->next;
     }
-    return NULL;
+    return -1;
 }
 
 /*****************************************************************************/
 /* destroy */
 void
-hashtable_destroy(struct hashtable *h, int free_values)
+hashtable_destroy(struct hashtable *h)
 {
-    unsigned int i;
-    struct entry *e, *f;
-    struct entry **table = h->table;
-    if (free_values)
-    {
-        for (i = 0; i < h->tablelength; i++)
-        {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f->v); free(f); }
-        }
-    }
-    else
-    {
-        for (i = 0; i < h->tablelength; i++)
-        {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f); }
-        }
-    }
-    free(h->table);
-    free(h);
+    talloc_free(h);
 }
 
 /*
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index b90781abd4..c470a6d585 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -5,76 +5,18 @@
 
 struct hashtable;
 
-/* Example of use:
- *
- *      struct hashtable  *h;
- *      struct some_key   *k;
- *      struct some_value *v;
- *
- *      static unsigned int         hash_from_key_fn( void *k );
- *      static int                  keys_equal_fn ( void *key1, void *key2 );
- *
- *      h = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
- *      k = (struct some_key *)     malloc(sizeof(struct some_key));
- *      v = (struct some_value *)   malloc(sizeof(struct some_value));
- *
- *      (initialise k and v to suitable values)
- * 
- *      if (! hashtable_insert(h,k,v) )
- *      {     exit(-1);               }
- *
- *      if (NULL == (found = hashtable_search(h,k) ))
- *      {    printf("not found!");                  }
- *
- *      if (NULL == (found = hashtable_remove(h,k) ))
- *      {    printf("Not found\n");                 }
- *
- */
-
-/* Macros may be used to define type-safe(r) hashtable access functions, with
- * methods specialized to take known key and value types as parameters.
- * 
- * Example:
- *
- * Insert this at the start of your file:
- *
- * DEFINE_HASHTABLE_INSERT(insert_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_SEARCH(search_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_REMOVE(remove_some, struct some_key, struct some_value);
- *
- * This defines the functions 'insert_some', 'search_some' and 'remove_some'.
- * These operate just like hashtable_insert etc., with the same parameters,
- * but their function signatures have 'struct some_key *' rather than
- * 'void *', and hence can generate compile time errors if your program is
- * supplying incorrect data as a key (and similarly for value).
- *
- * Note that the hash and key equality functions passed to create_hashtable
- * still take 'void *' parameters instead of 'some key *'. This shouldn't be
- * a difficult issue as they're only defined and passed once, and the other
- * functions will ensure that only valid keys are supplied to them.
- *
- * The cost for this checking is increased code size and runtime overhead
- * - if performance is important, it may be worth switching back to the
- * unsafe methods once your program has been debugged with the safe methods.
- * This just requires switching to some simple alternative defines - eg:
- * #define insert_some hashtable_insert
- *
- */
+#define HASHTABLE_NO_VALUE (void *)1
 
 /*****************************************************************************
  * create_hashtable
    
  * @name                    create_hashtable
- * @param   minsize         minimum initial size of hashtable
- * @param   hashfunction    function for hashing keys
- * @param   key_eq_fn       function for determining key equality
+ * @param   name            talloc name of the hashtable
  * @return                  newly created hashtable or NULL on failure
  */
 
 struct hashtable *
-create_hashtable(unsigned int minsize,
-                 unsigned int (*hashfunction) (void*),
-                 int (*key_eq_fn) (void*,void*));
+create_hashtable(const char *name);
 
 /*****************************************************************************
  * hashtable_insert
@@ -82,27 +24,37 @@ create_hashtable(unsigned int minsize,
  * @name        hashtable_insert
  * @param   h   the hashtable to insert into
  * @param   k   the key - hashtable claims ownership and will free on removal
- * @param   v   the value - does not claim ownership
- * @return      non-zero for successful insertion
+ * @param   v   the value - hashtable claims ownership and will free on removal
+ * @return      zero for successful insertion
  *
  * This function will cause the table to expand if the insertion would take
  * the ratio of entries to table size over the maximum load factor.
  *
- * This function does not check for repeated insertions with a duplicate key.
- * The value returned when using a duplicate key is undefined -- when
- * the hashtable changes size, the order of retrieval of duplicate key
- * entries is reversed.
- * If in doubt, remove before insert.
+ * This function fails in case of trying to insert an entry with an already
+ * existing key.
  */
 
 int 
-hashtable_insert(struct hashtable *h, void *k, void *v);
+hashtable_insert(struct hashtable *h, const char *k, void *v);
 
-#define DEFINE_HASHTABLE_INSERT(fnname, keytype, valuetype) \
-int fnname (struct hashtable *h, keytype *k, valuetype *v) \
-{ \
-    return hashtable_insert(h,k,v); \
-}
+/*****************************************************************************
+ * hashtable_replace
+
+ * @name        hashtable_replace
+ * @param   h   the hashtable to insert into
+ * @param   k   the key - hashtable claims ownership and will free on removal
+ * @param   v   the value - hashtable claims ownership and will free on removal
+ * @return      zero for successful insertion
+ *
+ * This function will cause the table to expand if the insertion would take
+ * the ratio of entries to table size over the maximum load factor.
+ *
+ * In case an entry with the specified key is existing already it will be
+ * replaced.
+ */
+
+int
+hashtable_replace(struct hashtable *h, const char *k, void *v);
 
 /*****************************************************************************
  * hashtable_search
@@ -114,13 +66,7 @@ int fnname (struct hashtable *h, keytype *k, valuetype *v) \
  */
 
 void *
-hashtable_search(struct hashtable *h, void *k);
-
-#define DEFINE_HASHTABLE_SEARCH(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_search(h,k)); \
-}
+hashtable_search(struct hashtable *h, const char *k);
 
 /*****************************************************************************
  * hashtable_remove
@@ -128,18 +74,11 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
  * @name        hashtable_remove
  * @param   h   the hashtable to remove the item from
  * @param   k   the key to search for  - does not claim ownership
- * @return      the value associated with the key, or NULL if none found
+ * @return      zero for successful removal
  */
 
-void * /* returns value */
-hashtable_remove(struct hashtable *h, void *k);
-
-#define DEFINE_HASHTABLE_REMOVE(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_remove(h,k)); \
-}
-
+int
+hashtable_remove(struct hashtable *h, const char *k);
 
 /*****************************************************************************
  * hashtable_count
@@ -151,17 +90,29 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
 unsigned int
 hashtable_count(struct hashtable *h);
 
+/*****************************************************************************
+ * hashtable_traverse
+
+ * @name        hashtable_traverse
+ * @param   h   the hashtable
+ * @param   fn  function to call for each entry
+ * @param   par private parameter for fn
+ * @return      0 for success, fn return value else
+ */
+int
+hashtable_traverse(struct hashtable *h, 
+                   int (fn)(struct hashtable *, const char *, void *, void *),
+                   void *par);
 
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
 
diff --git a/tools/xenstore/hashtable_private.h b/tools/xenstore/hashtable_private.h
deleted file mode 100644
index 3e95f60057..0000000000
--- a/tools/xenstore/hashtable_private.h
+++ /dev/null
@@ -1,85 +0,0 @@
-/* Copyright (C) 2002, 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
-
-#ifndef __HASHTABLE_PRIVATE_CWC22_H__
-#define __HASHTABLE_PRIVATE_CWC22_H__
-
-#include "hashtable.h"
-
-/*****************************************************************************/
-struct entry
-{
-    void *k, *v;
-    unsigned int h;
-    struct entry *next;
-};
-
-struct hashtable {
-    unsigned int tablelength;
-    struct entry **table;
-    unsigned int entrycount;
-    unsigned int loadlimit;
-    unsigned int primeindex;
-    unsigned int (*hashfn) (void *k);
-    int (*eqfn) (void *k1, void *k2);
-};
-
-/*****************************************************************************/
-unsigned int
-hash(struct hashtable *h, void *k);
-
-/*****************************************************************************/
-/* indexFor */
-static inline unsigned int
-indexFor(unsigned int tablelength, unsigned int hashvalue) {
-    return (hashvalue % tablelength);
-};
-
-/* Only works if tablelength == 2^N */
-/*static inline unsigned int
-indexFor(unsigned int tablelength, unsigned int hashvalue)
-{
-    return (hashvalue & (tablelength - 1u));
-}
-*/
-
-/*****************************************************************************/
-#define freekey(X) free(X)
-/*define freekey(X) ; */
-
-
-/*****************************************************************************/
-
-#endif /* __HASHTABLE_PRIVATE_CWC22_H__*/
-
-/*
- * Copyright (c) 2002, Christopher Clark
- * All rights reserved.
- * 
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- * 
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- * 
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- * 
- * 
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a957055d87..0deaa1a45d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1793,25 +1793,6 @@ static void setup_structure(bool live_update)
 	check_store();
 }
 
-static unsigned int hash_from_key_fn(void *k)
-{
-	char *str = k;
-	unsigned int hash = 5381;
-	char c;
-
-	while ((c = *str++))
-		hash = ((hash << 5) + hash) + (unsigned int)c;
-
-	return hash;
-}
-
-
-static int keys_equal_fn(void *key1, void *key2)
-{
-	return 0 == strcmp((char *)key1, (char *)key2);
-}
-
-
 static char *child_name(const char *s1, const char *s2)
 {
 	if (strcmp(s1, "/")) {
@@ -1825,12 +1806,11 @@ static char *child_name(const char *s1, const char *s2)
 
 int remember_string(struct hashtable *hash, const char *str)
 {
-	char *k = malloc(strlen(str) + 1);
+	char *k = talloc_strdup(hash, str);
 
 	if (!k)
-		return 0;
-	strcpy(k, str);
-	return hashtable_insert(hash, k, (void *)1);
+		return -1;
+	return hashtable_insert(hash, k, HASHTABLE_NO_VALUE);
 }
 
 
@@ -1856,10 +1836,15 @@ static int check_store_(const char *name, struct hashtable *reachable)
 		size_t i = 0;
 
 		struct hashtable * children =
-			create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+			create_hashtable("children");
+
+		if (!children) {
+			log("check_store: ENOMEM");
+			return ENOMEM;
+		}
 
-		if (!remember_string(reachable, name)) {
-			hashtable_destroy(children, 0);
+		if (remember_string(reachable, name)) {
+			hashtable_destroy(children);
 			log("check_store: ENOMEM");
 			return ENOMEM;
 		}
@@ -1889,8 +1874,8 @@ static int check_store_(const char *name, struct hashtable *reachable)
 					}
 				}
 				else {
-					if (!remember_string(children,
-							     childname)) {
+					if (remember_string(children,
+							    childname)) {
 						log("check_store: ENOMEM");
 						talloc_free(childnode);
 						talloc_free(childname);
@@ -1918,8 +1903,7 @@ static int check_store_(const char *name, struct hashtable *reachable)
 			i += childlen + 1;
 		}
 
-		hashtable_destroy(children, 0 /* Don't free values (they are
-						 all (void *)1) */);
+		hashtable_destroy(children);
 		talloc_free(node);
 	} else if (errno != ENOMEM) {
 		/* Impossible, because no database should ever be without the
@@ -1983,7 +1967,7 @@ void check_store(void)
 {
 	char * root = talloc_strdup(NULL, "/");
 	struct hashtable * reachable =
-		create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+		create_hashtable("reachable");
  
 	if (!reachable) {
 		log("check_store: ENOMEM");
@@ -1996,8 +1980,7 @@ void check_store(void)
 		clean_store(reachable);
 	log("Checking store complete.");
 
-	hashtable_destroy(reachable, 0 /* Don't free values (they are all
-					  (void *)1) */);
+	hashtable_destroy(reachable);
 	talloc_free(root);
 }
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index cd07fb0f21..8b8b38cea7 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -607,7 +607,7 @@ int check_transactions(struct hashtable *hash)
 		list_for_each_entry(trans, &conn->transaction_list, list) {
 			tname = talloc_asprintf(trans, "%"PRIu64,
 						trans->generation);
-			if (!tname || !remember_string(hash, tname))
+			if (!tname || remember_string(hash, tname))
 				goto nomem;
 
 			list_for_each_entry(i, &trans->accessed, list) {
@@ -615,7 +615,7 @@ int check_transactions(struct hashtable *hash)
 					continue;
 				tnode = transaction_get_node_name(tname, trans,
 								  i->node);
-				if (!tnode || !remember_string(hash, tnode))
+				if (!tnode || remember_string(hash, tnode))
 					goto nomem;
 				talloc_free(tnode);
 			}
-- 
2.26.2



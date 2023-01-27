Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F867EDE4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485881.753315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTtA-00074t-KY; Fri, 27 Jan 2023 18:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485881.753315; Fri, 27 Jan 2023 18:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTtA-00073F-Hp; Fri, 27 Jan 2023 18:55:52 +0000
Received: by outflank-mailman (input) for mailman id 485881;
 Fri, 27 Jan 2023 18:55:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLTt9-000739-Ib
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:55:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLTt9-0005jI-BT; Fri, 27 Jan 2023 18:55:51 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLTt9-0008VI-3T; Fri, 27 Jan 2023 18:55:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=Pp20tM9NtELwv5dXWmU95bkMysXiBUg791NET6iHyfY=; b=t3i9qm
	UXJSYfDdLu6L3v9dK044e4R2+jjG1ARSiC8SAeKhhNr3YaRlOQesOqD6iQlZnOL6UBOAzhNRFVGct
	Xv5MhsSFvoy5p61UeyYLgCEqKLycM5o31Ooe80Sk8g86rJWkdN+fD0Ph2CvKhVn1FCZtRx+Yid46R
	Pn5e6udcrh0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstored: hashtable: Constify the parameters of hashfn/eqfn
Date: Fri, 27 Jan 2023 18:55:46 +0000
Message-Id: <20230127185546.65760-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The parameters of hashfn/eqfn should never be modified. So constify
them and propagate the const to the users.

Take the opportunity to solve some coding style issues around the
code modified.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/hashtable.c        | 16 ++++++++--------
 tools/xenstore/hashtable.h        | 10 +++++-----
 tools/xenstore/xenstored_core.c   |  8 ++++----
 tools/xenstore/xenstored_domain.c |  8 ++++----
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 30eb9f21d250..3d4466b59756 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -23,8 +23,8 @@ struct hashtable {
     unsigned int entrycount;
     unsigned int loadlimit;
     unsigned int primeindex;
-    unsigned int (*hashfn) (void *k);
-    int (*eqfn) (void *k1, void *k2);
+    unsigned int (*hashfn) (const void *k);
+    int (*eqfn) (const void *k1, const void *k2);
 };
 
 /*
@@ -53,8 +53,8 @@ indexFor(unsigned int tablelength, unsigned int hashvalue) {
 /*****************************************************************************/
 struct hashtable *
 create_hashtable(const void *ctx, unsigned int minsize,
-                 unsigned int (*hashf) (void*),
-                 int (*eqf) (void*,void*),
+                 unsigned int (*hashf) (const void *),
+                 int (*eqf) (const void *, const void *),
                  unsigned int flags)
 {
     struct hashtable *h;
@@ -92,7 +92,7 @@ err0:
 
 /*****************************************************************************/
 unsigned int
-hash(struct hashtable *h, void *k)
+hash(const struct hashtable *h, const void *k)
 {
     /* Aim to protect against poor hash functions by adding logic here
      * - logic taken from java 1.4 hashtable source */
@@ -151,7 +151,7 @@ hashtable_expand(struct hashtable *h)
 
 /*****************************************************************************/
 unsigned int
-hashtable_count(struct hashtable *h)
+hashtable_count(const struct hashtable *h)
 {
     return h->entrycount;
 }
@@ -188,7 +188,7 @@ hashtable_insert(struct hashtable *h, void *k, void *v)
 
 /*****************************************************************************/
 void * /* returns value associated with key */
-hashtable_search(struct hashtable *h, void *k)
+hashtable_search(const struct hashtable *h, const void *k)
 {
     struct entry *e;
     unsigned int hashvalue, index;
@@ -206,7 +206,7 @@ hashtable_search(struct hashtable *h, void *k)
 
 /*****************************************************************************/
 void
-hashtable_remove(struct hashtable *h, void *k)
+hashtable_remove(struct hashtable *h, const void *k)
 {
     /* TODO: consider compacting the table when the load factor drops enough,
      *       or provide a 'compact' method. */
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 4e2823134eb3..cc0090f13378 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -24,8 +24,8 @@ struct hashtable;
 
 struct hashtable *
 create_hashtable(const void *ctx, unsigned int minsize,
-                 unsigned int (*hashfunction) (void*),
-                 int (*key_eq_fn) (void*,void*),
+                 unsigned int (*hashfunction) (const void *),
+                 int (*key_eq_fn) (const void *, const void *),
                  unsigned int flags
 );
 
@@ -61,7 +61,7 @@ hashtable_insert(struct hashtable *h, void *k, void *v);
  */
 
 void *
-hashtable_search(struct hashtable *h, void *k);
+hashtable_search(const struct hashtable *h, const void *k);
 
 /*****************************************************************************
  * hashtable_remove
@@ -72,7 +72,7 @@ hashtable_search(struct hashtable *h, void *k);
  */
 
 void
-hashtable_remove(struct hashtable *h, void *k);
+hashtable_remove(struct hashtable *h, const void *k);
 
 /*****************************************************************************
  * hashtable_count
@@ -82,7 +82,7 @@ hashtable_remove(struct hashtable *h, void *k);
  * @return      the number of items stored in the hashtable
  */
 unsigned int
-hashtable_count(struct hashtable *h);
+hashtable_count(const struct hashtable *h);
 
 /*****************************************************************************
  * hashtable_iterate
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 4f00e0cdc0cf..7348f935bc26 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2386,9 +2386,9 @@ void setup_structure(bool live_update)
 	}
 }
 
-static unsigned int hash_from_key_fn(void *k)
+static unsigned int hash_from_key_fn(const void *k)
 {
-	char *str = k;
+	const char *str = k;
 	unsigned int hash = 5381;
 	char c;
 
@@ -2399,9 +2399,9 @@ static unsigned int hash_from_key_fn(void *k)
 }
 
 
-static int keys_equal_fn(void *key1, void *key2)
+static int keys_equal_fn(const void *key1, const void *key2)
 {
-	return 0 == strcmp((char *)key1, (char *)key2);
+	return 0 == strcmp(key1, key2);
 }
 
 int remember_string(struct hashtable *hash, const char *str)
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 9ef41ede03ae..d7fc2fafc729 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -916,14 +916,14 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
-static unsigned int domhash_fn(void *k)
+static unsigned int domhash_fn(const void *k)
 {
-	return *(unsigned int *)k;
+	return *(const unsigned int *)k;
 }
 
-static int domeq_fn(void *key1, void *key2)
+static int domeq_fn(const void *key1, const void *key2)
 {
-	return *(unsigned int *)key1 == *(unsigned int *)key2;
+	return *(const unsigned int *)key1 == *(const unsigned int *)key2;
 }
 
 void domain_init(int evtfd)
-- 
2.38.1



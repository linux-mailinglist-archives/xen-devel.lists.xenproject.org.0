Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D485A494D95
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 13:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259040.446732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9L-0007oc-8d; Thu, 20 Jan 2022 12:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259040.446732; Thu, 20 Jan 2022 12:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9L-0007hL-3H; Thu, 20 Jan 2022 12:02:43 +0000
Received: by outflank-mailman (input) for mailman id 259040;
 Thu, 20 Jan 2022 12:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAW9J-0007aq-So
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 12:02:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd6fc94d-79e8-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 13:02:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AC18210F4;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E6FD13B51;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qOi8EV9P6WF5UwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jan 2022 12:02:39 +0000
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
X-Inumbo-ID: dd6fc94d-79e8-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642680159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2+28yARsMBGoNNBZObngFgGHwW0iOq0F8K+hZixmwk=;
	b=o1CHZg1fBbqBSi6K3Vuu2Q6zcwr+Zs+zXgskdbZ/rD66srJMGZKXOdpj6gvlrUFiCooc17
	tq7xFKusJscxHCaJmOjRtTObRkEaroavgZ9N8nsmqqtv9wGfvSowm+6o15mgQirpsfKdBW
	VJSV2N4kLz6oZBVthuUtA818AwsfGY8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/3] tools/xenstore: merge hashtable_private.h into hashtable.c
Date: Thu, 20 Jan 2022 13:02:34 +0100
Message-Id: <20220120120236.13826-2-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120120236.13826-1-jgross@suse.com>
References: <20220120120236.13826-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hashtable_private.h is used in hashtable.c only.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c         | 31 +++++++++--
 tools/xenstore/hashtable_private.h | 85 ------------------------------
 2 files changed, 27 insertions(+), 89 deletions(-)
 delete mode 100644 tools/xenstore/hashtable_private.h

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 394b1cf9d0..39fb3ed338 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -1,13 +1,29 @@
 /* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
 
 #include "hashtable.h"
-#include "hashtable_private.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <math.h>
 #include <stdint.h>
 
+struct entry
+{
+    void *k, *v;
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
+    unsigned int (*hashfn) (void *k);
+    int (*eqfn) (void *k1, void *k2);
+};
+
 /*
 Credit for primes table: Aaron Krowne
  http://br.endernet.org/~akrowne/
@@ -25,6 +41,13 @@ static const unsigned int primes[] = {
 const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);
 const unsigned int max_load_factor = 65; /* percentage */
 
+/*****************************************************************************/
+/* indexFor */
+static inline unsigned int
+indexFor(unsigned int tablelength, unsigned int hashvalue) {
+    return (hashvalue % tablelength);
+}
+
 /*****************************************************************************/
 struct hashtable *
 create_hashtable(unsigned int minsize,
@@ -211,7 +234,7 @@ hashtable_remove(struct hashtable *h, void *k)
             *pE = e->next;
             h->entrycount--;
             v = e->v;
-            freekey(e->k);
+            free(e->k);
             free(e);
             return v;
         }
@@ -235,7 +258,7 @@ hashtable_destroy(struct hashtable *h, int free_values)
         {
             e = table[i];
             while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f->v); free(f); }
+            { f = e; e = e->next; free(f->k); free(f->v); free(f); }
         }
     }
     else
@@ -244,7 +267,7 @@ hashtable_destroy(struct hashtable *h, int free_values)
         {
             e = table[i];
             while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f); }
+            { f = e; e = e->next; free(f->k); free(f); }
         }
     }
     free(h->table);
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
-- 
2.31.1



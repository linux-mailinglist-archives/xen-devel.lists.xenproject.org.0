Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C766D99B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479190.742914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3q-0005Pg-QB; Tue, 17 Jan 2023 09:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479190.742914; Tue, 17 Jan 2023 09:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3q-0005MT-Gj; Tue, 17 Jan 2023 09:15:18 +0000
Received: by outflank-mailman (input) for mailman id 479190;
 Tue, 17 Jan 2023 09:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi1E-0007bs-5S
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:12:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140e5eab-9647-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:12:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1402138222;
 Tue, 17 Jan 2023 09:12:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC1FB1390C;
 Tue, 17 Jan 2023 09:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cIJtNIFmxmN3cAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:12:33 +0000
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
X-Inumbo-ID: 140e5eab-9647-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQqweqSwYnhQCXgkJ+GuoRH/j2JjRdq9d6DeU3NphTE=;
	b=pcb31h6yJWKzfEqmpCfESS8Z7el38BnEmqY9QrafiMwrSxiiVuPp1JFDx1K1yQO7bjbxqZ
	6adNigUvH2LXZiE+t8buwGaWDmfyFJtfD1dWIJzNc4Kyg62/fqMVoCc2Q+Pc1MakRNCyii
	AzFh3Ec4pz3TQLPLCpgomVEJXW8HVoQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 12/17] tools/xenstore: don't let hashtable_remove() return the removed value
Date: Tue, 17 Jan 2023 10:11:19 +0100
Message-Id: <20230117091124.22170-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Letting hashtable_remove() return the value of the removed element is
not used anywhere in Xenstore, and it conflicts with a hashtable
created specifying the HASHTABLE_FREE_VALUE flag.

So just drop returning the value.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tools/xenstore/hashtable.c | 10 +++++-----
 tools/xenstore/hashtable.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 299549c51e..6738719e47 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -214,7 +214,7 @@ hashtable_search(struct hashtable *h, void *k)
 }
 
 /*****************************************************************************/
-void * /* returns value associated with key */
+int
 hashtable_remove(struct hashtable *h, void *k)
 {
     /* TODO: consider compacting the table when the load factor drops enough,
@@ -222,7 +222,6 @@ hashtable_remove(struct hashtable *h, void *k)
 
     struct entry *e;
     struct entry **pE;
-    void *v;
     unsigned int hashvalue, index;
 
     hashvalue = hash(h,k);
@@ -236,16 +235,17 @@ hashtable_remove(struct hashtable *h, void *k)
         {
             *pE = e->next;
             h->entrycount--;
-            v = e->v;
             if (h->flags & HASHTABLE_FREE_KEY)
                 free(e->k);
+            if (h->flags & HASHTABLE_FREE_VALUE)
+                free(e->v);
             free(e);
-            return v;
+            return 1;
         }
         pE = &(e->next);
         e = e->next;
     }
-    return NULL;
+    return 0;
 }
 
 /*****************************************************************************/
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 6d65431f96..d6feb1b038 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -68,10 +68,10 @@ hashtable_search(struct hashtable *h, void *k);
  * @name        hashtable_remove
  * @param   h   the hashtable to remove the item from
  * @param   k   the key to search for  - does not claim ownership
- * @return      the value associated with the key, or NULL if none found
+ * @return      0 if element not found
  */
 
-void * /* returns value */
+int
 hashtable_remove(struct hashtable *h, void *k);
 
 /*****************************************************************************
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4275374CDF4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560995.877273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1t-00030h-87; Mon, 10 Jul 2023 07:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560995.877273; Mon, 10 Jul 2023 07:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1t-0002y5-3s; Mon, 10 Jul 2023 07:09:53 +0000
Received: by outflank-mailman (input) for mailman id 560995;
 Mon, 10 Jul 2023 07:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIkt1-0002bQ-0o
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b82f9d1-1eef-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:00:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 419821F747;
 Mon, 10 Jul 2023 07:00:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14BA41361C;
 Mon, 10 Jul 2023 07:00:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0DKOA5msq2QGYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:41 +0000
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
X-Inumbo-ID: 7b82f9d1-1eef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HISzN7bRVjI3VR79BWGkvbZ0+p8FLjRndAnfEz4SFQg=;
	b=OM+Tbvc9TedBnMetKo/FIcOn6GO0WQ85CUvpTwDI12eRgoiK9cjz54V1lSh3gQnWTZv0+p
	GmeokX41MdR/LxXWG4tAcXakn3a8PklZNoMDWjedjfxNpBpNgXFFY4kke01CpVt1UINvt2
	dx8fSc6C/1PWR2uVj2hfMTQfc6sselA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 09/18] tools/xenstore: let hashtable_add() fail in case of existing entry
Date: Mon, 10 Jul 2023 08:59:38 +0200
Message-Id: <20230710065947.4201-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Silently adding another entry with the same key to a hashtable is a
perfect receipt for later failure with hard to diagnose symptoms.

Let hashtable_add() fail in case another entry with the same key is
already existing.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split off from next patch (Julien Grall)
- fix coding style (Julien Grall)
- use for () loop (Julien Grall)
---
 tools/xenstore/hashtable.c | 39 ++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 9daddd9782..29c247f918 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -141,11 +141,33 @@ static int hashtable_expand(struct hashtable *h)
     return 0;
 }
 
+static struct entry *hashtable_search_entry(const struct hashtable *h,
+                                            const void *k)
+{
+    struct entry *e;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h, k);
+    index = indexFor(h->tablelength, hashvalue);
+    e = h->table[index];
+
+    for (e = h->table[index]; e; e = e->next)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
+            return e;
+    }
+
+    return NULL;
+}
 int hashtable_add(struct hashtable *h, const void *k, void *v)
 {
-    /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
     struct entry *e;
+
+    if (hashtable_search_entry(h, k))
+        return EEXIST;
+
     if (++(h->entrycount) > h->loadlimit)
     {
         /* Ignore the return value. If expand fails, we should
@@ -176,17 +198,10 @@ int hashtable_add(struct hashtable *h, const void *k, void *v)
 void *hashtable_search(const struct hashtable *h, const void *k)
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
+    e = hashtable_search_entry(h, k);
+
+    return e ? e->v : NULL;
 }
 
 void
-- 
2.35.3



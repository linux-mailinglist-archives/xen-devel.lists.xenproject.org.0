Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAF671848
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480364.744761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A4-0006pO-RO; Wed, 18 Jan 2023 09:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480364.744761; Wed, 18 Jan 2023 09:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A4-0006eA-GR; Wed, 18 Jan 2023 09:55:16 +0000
Received: by outflank-mailman (input) for mailman id 480364;
 Wed, 18 Jan 2023 09:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI56O-0001v4-24
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:51:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acc8bcbe-9715-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 10:51:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A2B9920D6A;
 Wed, 18 Jan 2023 09:51:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7587B139D2;
 Wed, 18 Jan 2023 09:51:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pZtYGx7Bx2PaQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:51:26 +0000
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
X-Inumbo-ID: acc8bcbe-9715-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4zRIhlp3wD8TB5xvSbPznnaw1mQSoEynNQAxtEv3zI=;
	b=lmzH1f6y07vvYLyy1pjGwj/56F7ZUrMw7O0DXdZCaLMLVUyBNRPk2nxwkCwKgdMRwehcDT
	e9kEyggT7/2A4o4OBi9MmOyt1zH9KrvX/socrcLJ9SRaGOaQb+vYSziABLB+9AfaCUcvQ7
	TiUGHH3OcKSsDei+AFF8IGUfBCg6g0g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 12/17] tools/xenstore: don't let hashtable_remove() return the removed value
Date: Wed, 18 Jan 2023 10:50:11 +0100
Message-Id: <20230118095016.13091-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Letting hashtable_remove() return the value of the removed element is
not used anywhere in Xenstore, and it conflicts with a hashtable
created specifying the HASHTABLE_FREE_VALUE flag.

So just drop returning the value.

This of course requires to free the value if the HASHTABLE_FREE_VALUE
was specified, as otherwise it would be a memory leak.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- make return type void (Julien Grall)
---
 tools/xenstore/hashtable.c | 9 ++++-----
 tools/xenstore/hashtable.h | 3 +--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 299549c51e..ddca1591a2 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -214,7 +214,7 @@ hashtable_search(struct hashtable *h, void *k)
 }
 
 /*****************************************************************************/
-void * /* returns value associated with key */
+void
 hashtable_remove(struct hashtable *h, void *k)
 {
     /* TODO: consider compacting the table when the load factor drops enough,
@@ -222,7 +222,6 @@ hashtable_remove(struct hashtable *h, void *k)
 
     struct entry *e;
     struct entry **pE;
-    void *v;
     unsigned int hashvalue, index;
 
     hashvalue = hash(h,k);
@@ -236,16 +235,16 @@ hashtable_remove(struct hashtable *h, void *k)
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
+            return;
         }
         pE = &(e->next);
         e = e->next;
     }
-    return NULL;
 }
 
 /*****************************************************************************/
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 6d65431f96..780ad3c8f7 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -68,10 +68,9 @@ hashtable_search(struct hashtable *h, void *k);
  * @name        hashtable_remove
  * @param   h   the hashtable to remove the item from
  * @param   k   the key to search for  - does not claim ownership
- * @return      the value associated with the key, or NULL if none found
  */
 
-void * /* returns value */
+void
 hashtable_remove(struct hashtable *h, void *k);
 
 /*****************************************************************************
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD974CDF0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560992.877246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1p-000224-Ed; Mon, 10 Jul 2023 07:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560992.877246; Mon, 10 Jul 2023 07:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1p-0001u6-8C; Mon, 10 Jul 2023 07:09:49 +0000
Received: by outflank-mailman (input) for mailman id 560992;
 Mon, 10 Jul 2023 07:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIkt6-0002bQ-M1
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7edcca85-1eef-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:00:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7A701F8BF;
 Mon, 10 Jul 2023 07:00:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8C6F1361C;
 Mon, 10 Jul 2023 07:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V8aIJ56sq2QSYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:46 +0000
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
X-Inumbo-ID: 7edcca85-1eef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yrCEroex0VDLTJaLozI/wdv3DQR1vU/0IqPsVNjH/o=;
	b=BOyRa5SL2Gwy3BOMkd+QiMZB2KdhnkXLwkqhM5TPBXNArSJku6OTyfSgSkX58p4TPbXb4i
	0E8APxRrO/gUIu5hmW46j/gWSkMjnZR2xhR32jck5pUuCHwoq9U4ko9KccVNmYDGuxJLE5
	S/RtZDstzWzSonwoiolhrmv9arB7B+s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 10/18] tools/xenstore: add hashtable_replace() function
Date: Mon, 10 Jul 2023 08:59:39 +0200
Message-Id: <20230710065947.4201-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an effective way to replace a hashtable entry add a new function
hashtable_replace().

While at it let hashtable_add() fail if an entry with the specified
key does already exist.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.c | 20 ++++++++++++++++++++
 tools/xenstore/hashtable.h | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 29c247f918..0c26a09567 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -160,6 +160,7 @@ static struct entry *hashtable_search_entry(const struct hashtable *h,
 
     return NULL;
 }
+
 int hashtable_add(struct hashtable *h, const void *k, void *v)
 {
     unsigned int index;
@@ -204,6 +205,25 @@ void *hashtable_search(const struct hashtable *h, const void *k)
     return e ? e->v : NULL;
 }
 
+int hashtable_replace(struct hashtable *h, const void *k, void *v)
+{
+    struct entry *e;
+
+    e = hashtable_search_entry(h, k);
+    if (!e)
+        return ENOENT;
+
+    if (h->flags & HASHTABLE_FREE_VALUE)
+    {
+        talloc_free(e->v);
+        talloc_steal(e, v);
+    }
+
+    e->v = v;
+
+    return 0;
+}
+
 void
 hashtable_remove(struct hashtable *h, const void *k)
 {
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 792f6cda7b..214aea1b3d 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -51,6 +51,22 @@ create_hashtable(const void *ctx, const char *name,
 int
 hashtable_add(struct hashtable *h, const void *k, void *v);
 
+/*****************************************************************************
+ * hashtable_replace
+
+ * @name        hashtable_nsert
+ * @param   h   the hashtable to insert into
+ * @param   k   the key - hashtable claims ownership and will free on removal
+ * @param   v   the value - does not claim ownership
+ * @return      zero for successful insertion
+ *
+ * This function does check for an entry being present before replacing it
+ * with a new value.
+ */
+
+int
+hashtable_replace(struct hashtable *h, const void *k, void *v);
+
 /*****************************************************************************
  * hashtable_search
    
-- 
2.35.3



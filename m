Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E618F671827
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480310.744648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55P-0001Xx-S0; Wed, 18 Jan 2023 09:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480310.744648; Wed, 18 Jan 2023 09:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55P-0001VJ-Of; Wed, 18 Jan 2023 09:50:27 +0000
Received: by outflank-mailman (input) for mailman id 480310;
 Wed, 18 Jan 2023 09:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI55O-0001BV-UU
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5389e1da-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:48:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1E1520C51;
 Wed, 18 Jan 2023 09:50:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A11F7139D2;
 Wed, 18 Jan 2023 09:50:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8B8CJuDAx2MrQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:50:24 +0000
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
X-Inumbo-ID: 5389e1da-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmJqgfwW3rgZ4aM9nfaFZhVOgg064OnswcLCYgVlRWM=;
	b=btpHFKt8tGY6pgUSEfVbx9hsSYlWovpVvBz+Fu/mzw0Tl1juUL3rCqfspkcoPh4lvSn9wa
	NklWmiLRUSO96+x0IGHwrKyYw7TS4ZPM+g69ihDVNlXqhVQ3rJyrcRCBHXG0LMccv+B+EA
	VGuushRO1XLowRrR1VyyPeTpRe3iqgc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 01/17] tools/xenstore: let talloc_free() preserve errno
Date: Wed, 18 Jan 2023 10:50:00 +0100
Message-Id: <20230118095016.13091-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today talloc_free() is not guaranteed to preserve errno, especially in
case a custom destructor is being used.

So preserve errno in talloc_free().

This allows to remove some errno saving outside of talloc.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- drop wrapper (Julien Grall)
---
 tools/xenstore/talloc.c         | 21 +++++++++++++--------
 tools/xenstore/xenstored_core.c |  2 --
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
index d7edcf3a93..23c3a23b19 100644
--- a/tools/xenstore/talloc.c
+++ b/tools/xenstore/talloc.c
@@ -541,38 +541,39 @@ static void talloc_free_children(void *ptr)
 */
 int talloc_free(void *ptr)
 {
+	int saved_errno = errno;
 	struct talloc_chunk *tc;
 
 	if (ptr == NULL) {
-		return -1;
+		goto err;
 	}
 
 	tc = talloc_chunk_from_ptr(ptr);
 
 	if (tc->null_refs) {
 		tc->null_refs--;
-		return -1;
+		goto err;
 	}
 
 	if (tc->refs) {
 		talloc_reference_destructor(tc->refs);
-		return -1;
+		goto err;
 	}
 
 	if (tc->flags & TALLOC_FLAG_LOOP) {
 		/* we have a free loop - stop looping */
-		return 0;
+		goto success;
 	}
 
 	if (tc->destructor) {
 		talloc_destructor_t d = tc->destructor;
 		if (d == (talloc_destructor_t)-1) {
-			return -1;
+			goto err;
 		}
 		tc->destructor = (talloc_destructor_t)-1;
 		if (d(ptr) == -1) {
 			tc->destructor = d;
-			return -1;
+			goto err;
 		}
 		tc->destructor = NULL;
 	}
@@ -594,10 +595,14 @@ int talloc_free(void *ptr)
 	tc->flags |= TALLOC_FLAG_FREE;
 
 	free(tc);
+ success:
+	errno = saved_errno;
 	return 0;
-}
-
 
+ err:
+	errno = saved_errno;
+	return -1;
+}
 
 /*
   A talloc version of realloc. The context argument is only used if
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 78a3edaa4e..1650821922 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -771,9 +771,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	return node;
 
  error:
-	err = errno;
 	talloc_free(node);
-	errno = err;
 	return NULL;
 }
 
-- 
2.35.3



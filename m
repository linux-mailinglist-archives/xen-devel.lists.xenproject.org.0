Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAFB64B91B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460722.718696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57iC-0001xs-VP; Tue, 13 Dec 2022 16:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460722.718696; Tue, 13 Dec 2022 16:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57iC-0001uN-SF; Tue, 13 Dec 2022 16:00:56 +0000
Received: by outflank-mailman (input) for mailman id 460722;
 Tue, 13 Dec 2022 16:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57iA-0001ta-Ri
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:00:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5254fc0c-7aff-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:00:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65DF21FDB7;
 Tue, 13 Dec 2022 16:00:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 376CC138EE;
 Tue, 13 Dec 2022 16:00:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vs9JDLWhmGNiKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:00:53 +0000
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
X-Inumbo-ID: 5254fc0c-7aff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkdcCX4m0Tzxnb/7Dfls6s6w+LujAbSreSJEwDPanj0=;
	b=IlK4JJwK4Ol4674YisO8TvDrZMlzBcZIAIcn0KpsnNdssMRVdyHAoQJuXox3ENeBFZqa+a
	3JxcslbFx6ZJKrIBmme5fI9LQokJChudSd2eOSMBxIk3s1CCFA+7un9oPb5NY95D5PNyMA
	O6CPxsSK9T9U3y4YqCeXci9JadPQvls=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 01/19] tools/xenstore: let talloc_free() preserve errno
Date: Tue, 13 Dec 2022 17:00:27 +0100
Message-Id: <20221213160045.28170-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today talloc_free() is not guaranteed to preserve errno, especially in
case a custom destructor is being used.

Change that by renaming talloc_free() to _talloc_free() in talloc.c and
adding a wrapper to talloc.c.

This allows to remove some errno saving outside of talloc.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index 476d5c6d51..5a174b9881 100644
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



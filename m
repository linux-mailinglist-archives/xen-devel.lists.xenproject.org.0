Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89732614E4A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434832.687486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCL-0008CX-4U; Tue, 01 Nov 2022 15:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434832.687486; Tue, 01 Nov 2022 15:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCK-00089k-Uw; Tue, 01 Nov 2022 15:29:04 +0000
Received: by outflank-mailman (input) for mailman id 434832;
 Tue, 01 Nov 2022 15:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optCK-0007Bd-0Q
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea41e590-59f9-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:29:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF674336C7;
 Tue,  1 Nov 2022 15:29:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1D391346F;
 Tue,  1 Nov 2022 15:29:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NKPuLT47YWOWYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:02 +0000
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
X-Inumbo-ID: ea41e590-59f9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WmsoGzujtIkC6YuYigP+4ElT2gZKOfCQSt1d9XlPlQ=;
	b=cfwPiTtHeymrVNMf5+4iT9g56NXixGH35F1GILJ1i/A5austDtqWq5FupnFdRKURsnfF3t
	BfengqzNG3xV8ujPQgjGRVHJOYHjpzHn/NzFk5RAIX36oOde+glQbL8vMPZ0sG3lsVktGE
	Ck+ub/XCeVK18+c+sK1oIWKS7fo8qtE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 03/20] tools/xenstore: let talloc_free() preserve errno
Date: Tue,  1 Nov 2022 16:28:25 +0100
Message-Id: <20221101152842.4257-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today talloc_free() is not guaranteed to preserve errno, especially in
case a custom destructor is being used.

Change that by renaming talloc_free() to _talloc_free() in talloc.c and
adding a wrapper to talloc.c.

This allows to remove some errno saving outside of talloc.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/talloc.c         | 25 ++++++++++++++++++-------
 tools/xenstore/xenstored_core.c |  2 --
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
index d7edcf3a93..5fbefdf091 100644
--- a/tools/xenstore/talloc.c
+++ b/tools/xenstore/talloc.c
@@ -103,6 +103,8 @@ struct talloc_chunk {
 	unsigned flags;
 };
 
+static int _talloc_free(void *ptr);
+
 /* 16 byte alignment seems to keep everyone happy */
 #define TC_HDR_SIZE ((sizeof(struct talloc_chunk)+15)&~15)
 #define TC_PTR_FROM_CHUNK(tc) ((void *)(TC_HDR_SIZE + (char*)tc))
@@ -245,7 +247,7 @@ static int talloc_reference_destructor(void *ptr)
 		tc1->destructor = NULL;
 	}
 	_TLIST_REMOVE(tc2->refs, handle);
-	talloc_free(handle);
+	_talloc_free(handle);
 	return 0;
 }
 
@@ -311,7 +313,7 @@ static int talloc_unreference(const void *context, const void *ptr)
 
 	talloc_set_destructor(h, NULL);
 	_TLIST_REMOVE(tc->refs, h);
-	talloc_free(h);
+	_talloc_free(h);
 	return 0;
 }
 
@@ -349,7 +351,7 @@ int talloc_unlink(const void *context, void *ptr)
 	tc_p = talloc_chunk_from_ptr(ptr);
 
 	if (tc_p->refs == NULL) {
-		return talloc_free(ptr);
+		return _talloc_free(ptr);
 	}
 
 	new_p = talloc_parent_chunk(tc_p->refs);
@@ -521,7 +523,7 @@ static void talloc_free_children(void *ptr)
 			struct talloc_chunk *p = talloc_parent_chunk(tc->child->refs);
 			if (p) new_parent = TC_PTR_FROM_CHUNK(p);
 		}
-		if (talloc_free(child) == -1) {
+		if (_talloc_free(child) == -1) {
 			if (new_parent == null_context) {
 				struct talloc_chunk *p = talloc_parent_chunk(ptr);
 				if (p) new_parent = TC_PTR_FROM_CHUNK(p);
@@ -539,7 +541,7 @@ static void talloc_free_children(void *ptr)
    will not be freed if the ref_count is > 1 or the destructor (if
    any) returns non-zero
 */
-int talloc_free(void *ptr)
+static int _talloc_free(void *ptr)
 {
 	struct talloc_chunk *tc;
 
@@ -597,7 +599,16 @@ int talloc_free(void *ptr)
 	return 0;
 }
 
+int talloc_free(void *ptr)
+{
+	int ret;
+	int saved_errno = errno;
 
+	ret = _talloc_free(ptr);
+	errno = saved_errno;
+
+	return ret;
+}
 
 /*
   A talloc version of realloc. The context argument is only used if
@@ -610,7 +621,7 @@ void *_talloc_realloc(const void *context, void *ptr, size_t size, const char *n
 
 	/* size zero is equivalent to free() */
 	if (size == 0) {
-		talloc_free(ptr);
+		_talloc_free(ptr);
 		return NULL;
 	}
 
@@ -1243,7 +1254,7 @@ void *talloc_realloc_fn(const void *context, void *ptr, size_t size)
 
 static void talloc_autofree(void)
 {
-	talloc_free(cleanup_context);
+	_talloc_free(cleanup_context);
 	cleanup_context = NULL;
 }
 
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



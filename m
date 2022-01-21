Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6D495F80
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 14:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259338.447544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAtiL-0001LG-Mc; Fri, 21 Jan 2022 13:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259338.447544; Fri, 21 Jan 2022 13:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAtiL-0001IT-JD; Fri, 21 Jan 2022 13:12:25 +0000
Received: by outflank-mailman (input) for mailman id 259338;
 Fri, 21 Jan 2022 13:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqVI=SF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAtiJ-0001IN-Nv
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 13:12:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d1aa2d-7abb-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 14:12:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6C77218E3;
 Fri, 21 Jan 2022 13:12:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCBCC13AF2;
 Fri, 21 Jan 2022 13:12:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KCBmLDWx6mFkQgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Jan 2022 13:12:21 +0000
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
X-Inumbo-ID: c4d1aa2d-7abb-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642770741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BzSmBDDnXJQaulLqTTFkutHNziQo0L1DEn7Ih04JGWE=;
	b=MGEHNQk8/l3erdXCiRjBUaa0N6R+iueG6cZcj3hKidpKE7eG6xJZpwlyfrJWrfqwsSEAVy
	tvEaKA0SV2ZQjJa6svBKFcZI9POZ6ZJJ/VD8+U5YhGoBIcG4ZXhnYv69sojZoDYJX91yYO
	NgBhIJQ8/QoY5mZpMVHeA/eeouYmh+I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: fix error handling of check_store()
Date: Fri, 21 Jan 2022 14:12:19 +0100
Message-Id: <20220121131219.14562-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_store() has an incomplete error handling: it doesn't check
whether "root" allocation succeeded, and it is leaking the memory of
"root" in case create_hashtable() fails.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index c386ae6129..91d3adccb1 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2050,14 +2050,18 @@ static void clean_store(struct hashtable *reachable)
 
 void check_store(void)
 {
-	char * root = talloc_strdup(NULL, "/");
-	struct hashtable * reachable =
-		create_hashtable(16, hash_from_key_fn, keys_equal_fn);
- 
-	if (!reachable) {
+	char *root = talloc_strdup(NULL, "/");
+	struct hashtable *reachable;
+
+	if (!root) {
 		log("check_store: ENOMEM");
 		return;
 	}
+	reachable = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+	if (!reachable) {
+		log("check_store: ENOMEM");
+		goto out_root;
+	}
 
 	log("Checking store ...");
 	if (!check_store_(root, reachable) &&
@@ -2067,6 +2071,7 @@ void check_store(void)
 
 	hashtable_destroy(reachable, 0 /* Don't free values (they are all
 					  (void *)1) */);
+ out_root:
 	talloc_free(root);
 }
 
-- 
2.31.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943982DB183
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54530.94856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJC-0006EF-6R; Tue, 15 Dec 2020 16:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54530.94856; Tue, 15 Dec 2020 16:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJC-0006DI-04; Tue, 15 Dec 2020 16:36:18 +0000
Received: by outflank-mailman (input) for mailman id 54530;
 Tue, 15 Dec 2020 16:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJA-00066M-HY
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2487bee8-80c9-4fc5-a19c-ec077f182862;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F68EAD60;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
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
X-Inumbo-ID: 2487bee8-80c9-4fc5-a19c-ec077f182862
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PuHi28Ilah+6+tULvxDPYy5ikYx4BHQrVKKI8OOPfk=;
	b=HVWTV8zu8kcDgmNvdRRp4axdAd+XJXPUrNLtCjKyGguVtlf0u8JKk2RDWduVaLetAjKvjn
	brq5T7y+XZoZLXQC84UlFpdYkeTRz44nFn52ABubZOH7dAHodvHx6h2OABNnz/OQesw4cV
	C2ZHbbC2ALfzS9mghwruUvKL7VNd+yw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v10 02/25] tools/xenstore: make set_tdb_key() non-static
Date: Tue, 15 Dec 2020 17:35:40 +0100
Message-Id: <20201215163603.21700-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_tdb_key() can be used by destroy_node(), too. So remove the static
attribute and move it to xenstored_core.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
V5:
- new patch

V6:
- add comment (Julien Grall)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 14 +++++++++++---
 tools/xenstore/xenstored_core.h        |  2 ++
 tools/xenstore/xenstored_transaction.c |  6 ------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 3082a36d3a..ab1c7835b8 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -352,6 +352,16 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
+void set_tdb_key(const char *name, TDB_DATA *key)
+{
+	/*
+	 * Dropping const is fine here, as the key will never be modified
+	 * by TDB.
+	 */
+	key->dptr = (char *)name;
+	key->dsize = strlen(name);
+}
+
 /*
  * If it fails, returns NULL and sets errno.
  * Temporary memory allocations will be done with ctx.
@@ -985,9 +995,7 @@ static int destroy_node(void *_node)
 	if (streq(node->name, "/"))
 		corrupt(NULL, "Destroying root node!");
 
-	key.dptr = (void *)node->name;
-	key.dsize = strlen(node->name);
-
+	set_tdb_key(node->name, &key);
 	tdb_delete(tdb_ctx, key);
 
 	domain_entry_dec(talloc_parent(node), node);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 4c6c3d6f20..fb59d862a2 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -220,6 +220,8 @@ extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
+void set_tdb_key(const char *name, TDB_DATA *key);
+
 #endif /* _XENSTORED_CORE_H */
 
 /*
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 2881f3b2e4..52355f4ed8 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -168,12 +168,6 @@ struct transaction
 extern int quota_max_transaction;
 uint64_t generation;
 
-static void set_tdb_key(const char *name, TDB_DATA *key)
-{
-	key->dptr = (char *)name;
-	key->dsize = strlen(name);
-}
-
 static struct accessed_node *find_accessed_node(struct transaction *trans,
 						const char *name)
 {
-- 
2.26.2



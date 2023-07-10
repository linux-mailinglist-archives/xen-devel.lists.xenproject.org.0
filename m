Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F074CDF2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560990.877240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1p-0001uX-06; Mon, 10 Jul 2023 07:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560990.877240; Mon, 10 Jul 2023 07:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1o-0001mx-Sd; Mon, 10 Jul 2023 07:09:48 +0000
Received: by outflank-mailman (input) for mailman id 560990;
 Mon, 10 Jul 2023 07:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIktY-0002xd-0g
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:01:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9d425b-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:01:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F40C31F747;
 Mon, 10 Jul 2023 07:01:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4F0D1361C;
 Mon, 10 Jul 2023 07:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nLWnLrqsq2RUYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:01:14 +0000
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
X-Inumbo-ID: 8f9d425b-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUlZCgcfMFoaDJtRix0rUMJGM+xPeYzeESQio/4zXx4=;
	b=nUjPnBcxWCITCjiO0/Vt9IoK260qimgK0ZXxcQDcR+merh0aRdbYG0PuwElBiEPUTE8hOT
	3JcTleEFF/eArrG90EXCBRFevUi9BUOQPA+iYtjtgejLJmDl2NX9JCZK08RH0jtS4K6Wgt
	TIh8ZN+MUodPy2hT1Gk4/eWdwwXUHMg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 15/18] tools/xenstore: rework struct xs_tdb_record_hdr
Date: Mon, 10 Jul 2023 08:59:44 +0200
Message-Id: <20230710065947.4201-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Struct xs_tdb_record_hdr is used for nodes stored in the data base.
When working on a node, struct node is being used, which is including
the same information as struct xs_tdb_record_hdr, but in a different
format. Rework struct xs_tdb_record_hdr in order to prepare including
it in struct node.

Do the following modifications:

- move its definition to xenstored_core.h, as the reason to put it into
  utils.h are no longer existing

- rename it to struct node_hdr, as the "tdb" in its name has only
  historical reasons

- replace the empty permission array at the end with a comment about
  the layout of data in the data base (concatenation of header,
  permissions, node contents, and children list)

- use narrower types for num_perms and datalen, as those are naturally
  limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as it is
  in theory basically unlimited)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/utils.h                 |  9 -------
 tools/xenstore/xenstored_core.c        | 35 +++++++++++++++-----------
 tools/xenstore/xenstored_core.h        | 20 ++++++++++++++-
 tools/xenstore/xenstored_transaction.c |  2 +-
 4 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 028ecb9d7a..405d662ea2 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -9,15 +9,6 @@
 
 #include "xenstore_lib.h"
 
-/* Header of the node record in tdb. */
-struct xs_tdb_record_hdr {
-	uint64_t generation;
-	uint32_t num_perms;
-	uint32_t datalen;
-	uint32_t childlen;
-	struct xs_permissions perms[0];
-};
-
 /* Is A == B ? */
 #define streq(a,b) (strcmp((a),(b)) == 0)
 
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index d5c9054fe9..d886d66dd6 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -555,9 +555,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
+struct node_hdr *db_fetch(const char *db_name, size_t *size)
 {
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 
 	hdr = hashtable_search(nodes, db_name);
 	if (!hdr) {
@@ -565,7 +565,7 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 		return NULL;
 	}
 
-	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
+	*size = sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
 		hdr->datalen + hdr->childlen;
 
 	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
@@ -573,10 +573,15 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 	return hdr;
 }
 
+static struct xs_permissions *perms_from_node_hdr(struct node_hdr *hdr)
+{
+	return (struct xs_permissions *)(hdr + 1);
+}
+
 static void get_acc_data(const char *name, struct node_account_data *acc)
 {
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 
 	if (acc->memory < 0) {
 		hdr = db_fetch(name, &size);
@@ -585,7 +590,7 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
 			acc->memory = 0;
 		} else {
 			acc->memory = size;
-			acc->domid = hdr->perms[0].id;
+			acc->domid = perms_from_node_hdr(hdr)->id;
 		}
 	}
 }
@@ -606,7 +611,7 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check)
 {
-	struct xs_tdb_record_hdr *hdr = data;
+	struct node_hdr *hdr = data;
 	struct node_account_data old_acc = {};
 	unsigned int old_domid, new_domid;
 	size_t name_len = strlen(db_name);
@@ -620,7 +625,7 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 
 	get_acc_data(db_name, &old_acc);
 	old_domid = get_acc_domid(conn, db_name, old_acc.domid);
-	new_domid = get_acc_domid(conn, db_name, hdr->perms[0].id);
+	new_domid = get_acc_domid(conn, db_name, perms_from_node_hdr(hdr)->id);
 
 	/*
 	 * Don't check for ENOENT, as we want to be able to switch orphaned
@@ -661,7 +666,7 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 
 	if (acc) {
 		/* Don't use new_domid, as it might be a transaction node. */
-		acc->domid = hdr->perms[0].id;
+		acc->domid = perms_from_node_hdr(hdr)->id;
 		acc->memory = size;
 	}
 
@@ -699,7 +704,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 	struct node *node;
 	const char *db_name;
 	int err;
@@ -733,7 +738,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
 	node->childlen = hdr->childlen;
-	node->acc.domid = hdr->perms[0].id;
+	node->acc.domid = perms_from_node_hdr(hdr)->id;
 	node->acc.memory = size;
 
 	/* Copy node data to new memory area, starting with permissions. */
@@ -743,7 +748,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		errno = ENOMEM;
 		goto error;
 	}
-	memcpy(node->perms.p, hdr->perms, size);
+	memcpy(node->perms.p, perms_from_node_hdr(hdr), size);
 
 	/* Permissions are struct xs_permissions. */
 	if (domain_adjust_node_perms(node))
@@ -787,7 +792,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	void *data;
 	size_t size;
 	void *p;
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 
 	if (domain_adjust_node_perms(node))
 		return errno;
@@ -814,9 +819,9 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	hdr->datalen = node->datalen;
 	hdr->childlen = node->childlen;
 
-	memcpy(hdr->perms, node->perms.p,
-	       node->perms.num * sizeof(*node->perms.p));
-	p = hdr->perms + node->perms.num;
+	p = perms_from_node_hdr(hdr);
+	memcpy(p, node->perms.p, node->perms.num * sizeof(*node->perms.p));
+	p += node->perms.num * sizeof(*node->perms.p);
 	memcpy(p, node->data, node->datalen);
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 3c0dd40dfb..968b6f843c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -168,6 +168,24 @@ struct connection
 };
 extern struct list_head connections;
 
+/*
+ * Header of the node record in the data base.
+ * In the data base the memory of the node is a single memory chunk with the
+ * following format:
+ * struct {
+ *     node_hdr hdr;
+ *     struct xs_permissions perms[hdr.num_perms];
+ *     char data[hdr.datalen];
+ *     char children[hdr.childlen];
+ * };
+ */
+struct node_hdr {
+	uint64_t generation;
+	uint16_t num_perms;
+	uint16_t datalen;
+	uint32_t childlen;
+};
+
 struct node_perms {
 	unsigned int num;
 	struct xs_permissions *p;
@@ -361,7 +379,7 @@ extern xengnttab_handle **xgt_handle;
 int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
-struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
+struct node_hdr *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index e3e05a1d84..77c14f4c24 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -357,7 +357,7 @@ static int finalize_transaction(struct connection *conn,
 {
 	struct accessed_node *i, *n;
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 	uint64_t gen;
 	int flag;
 
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A420074CDF6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561003.877283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl23-0004Gj-HJ; Mon, 10 Jul 2023 07:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561003.877283; Mon, 10 Jul 2023 07:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl23-0004DX-DF; Mon, 10 Jul 2023 07:10:03 +0000
Received: by outflank-mailman (input) for mailman id 561003;
 Mon, 10 Jul 2023 07:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIktU-0002bQ-03
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:01:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c40cad7-1eef-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:01:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62BBE21E99;
 Mon, 10 Jul 2023 07:01:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34C9B1361C;
 Mon, 10 Jul 2023 07:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VsZ+C7Wsq2RKYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:01:09 +0000
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
X-Inumbo-ID: 8c40cad7-1eef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEHQOByY3/G0AhnrW+dmrcu8r5Zv08ynjvJcMWugCDE=;
	b=TIxbIpTALW117ziwWgjeA6zE6IA9D9ZCSEKqeClrHlcJ04hNaghAsnsK43/WJy3P60OJUU
	OxidPEaPbG9/3KCcyGTQO2AjXfGAfVRDLh/OTbyMWUTBJ/bxePyItcFNKmplpl32YOy5nj
	hwB/GjIMi4w4PVuu0prQ2czj/Zov9VY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 14/18] tools/xenstore: move copying of node data out of db_fetch()
Date: Mon, 10 Jul 2023 08:59:43 +0200
Message-Id: <20230710065947.4201-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the node data is copied in db_fetch() on each data base read in
order to avoid accidental data base modifications when working on a
node.

read_node() is the only caller of db_fetch() which isn't freeing the
returned data area immediately after using it. The other callers don't
modify the returned data, so they don't need the data to be copied.

Move copying of the data into read_node(), resulting in a speedup of
the other callers due to no memory allocation and no copying being
needed anymore.

As db_fetch() can't return any error other than ENOENT now, error
handling for the callers can be simplified.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c        | 41 ++++++++++----------------
 tools/xenstore/xenstored_transaction.c |  3 --
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 11da470b20..d5c9054fe9 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -557,8 +557,7 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 
 struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 {
-	const struct xs_tdb_record_hdr *hdr;
-	struct xs_tdb_record_hdr *p;
+	struct xs_tdb_record_hdr *hdr;
 
 	hdr = hashtable_search(nodes, db_name);
 	if (!hdr) {
@@ -569,18 +568,9 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
 		hdr->datalen + hdr->childlen;
 
-	p = talloc_size(NULL, *size);
-	if (!p) {
-		errno = ENOMEM;
-		return NULL;
-	}
-
 	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
 
-	/* Return a copy, avoiding a potential modification in the DB. */
-	memcpy(p, hdr, *size);
-
-	return p;
+	return hdr;
 }
 
 static void get_acc_data(const char *name, struct node_account_data *acc)
@@ -597,7 +587,6 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
 			acc->memory = size;
 			acc->domid = hdr->perms[0].id;
 		}
-		talloc_free(hdr);
 	}
 }
 
@@ -731,30 +720,32 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	hdr = db_fetch(db_name, &size);
 
 	if (hdr == NULL) {
-		if (errno == ENOENT) {
-			node->generation = NO_GENERATION;
-			err = access_node(conn, node, NODE_ACCESS_READ, NULL);
-			errno = err ? : ENOENT;
-		} else {
-			log("DB error on read: %s", strerror(errno));
-			errno = EIO;
-		}
+		node->generation = NO_GENERATION;
+		err = access_node(conn, node, NODE_ACCESS_READ, NULL);
+		errno = err ? : ENOENT;
 		goto error;
 	}
 
 	node->parent = NULL;
-	talloc_steal(node, hdr);
 
 	/* Datalen, childlen, number of permissions */
 	node->generation = hdr->generation;
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
 	node->childlen = hdr->childlen;
+	node->acc.domid = hdr->perms[0].id;
+	node->acc.memory = size;
+
+	/* Copy node data to new memory area, starting with permissions. */
+	size -= sizeof(*hdr);
+	node->perms.p = talloc_size(node, size);
+	if (node->perms.p == NULL) {
+		errno = ENOMEM;
+		goto error;
+	}
+	memcpy(node->perms.p, hdr->perms, size);
 
 	/* Permissions are struct xs_permissions. */
-	node->perms.p = hdr->perms;
-	node->acc.domid = get_node_owner(node);
-	node->acc.memory = size;
 	if (domain_adjust_node_perms(node))
 		goto error;
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 5d7da82aad..e3e05a1d84 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -365,13 +365,10 @@ static int finalize_transaction(struct connection *conn,
 		if (i->check_gen) {
 			hdr = db_fetch(i->node, &size);
 			if (!hdr) {
-				if (errno != ENOENT)
-					return errno;
 				gen = NO_GENERATION;
 			} else {
 				gen = hdr->generation;
 			}
-			talloc_free(hdr);
 			if (i->generation != gen)
 				return EAGAIN;
 		}
-- 
2.35.3



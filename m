Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170F75F47E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568764.888735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQE-0001LU-Kv; Mon, 24 Jul 2023 11:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568764.888735; Mon, 24 Jul 2023 11:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQE-0001IZ-GS; Mon, 24 Jul 2023 11:08:14 +0000
Received: by outflank-mailman (input) for mailman id 568764;
 Mon, 24 Jul 2023 11:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtNH-0000KR-Mm
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:05:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52651f7-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:05:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 055401FDF0;
 Mon, 24 Jul 2023 11:05:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3F4813476;
 Mon, 24 Jul 2023 11:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aIaOLuZavmSrYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:05:10 +0000
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
X-Inumbo-ID: f52651f7-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1YD4gZAxPlT1/QwlSIA+d4ZRSzaspiY2J7SO8xP21Y=;
	b=OJiF5x/VaWqiMiyGMrMqra8+bueuk7mXfo6z/Nrd1MpPdnXaX32UM4ef/K2QYf5BKYTZvP
	JYSeDqgofbQCcF6hH0kcbsv5rWcSCvxl7nH0SVsMI6ObddeoSRsvxgDliGcqJAky9mDBrv
	+C3j1TrPBnDr86kjxXjvMsb01YzcEcY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 25/25] tools/xenstore: introduce get_node_const()
Date: Mon, 24 Jul 2023 13:02:47 +0200
Message-Id: <20230724110247.10520-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a variant of get_node() returning a const struct node pointer.

Note that all callers of this new variant don't supply a pointer where
to store the canonical node name, while all callers needing a non-const
node do supply this pointer. This results in an asymmetric
simplification of the two variants.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new approach (Julien Grall)
---
 tools/xenstore/xenstored_core.c | 35 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index fa07bc0c31..ed4e83d67d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1288,11 +1288,8 @@ static struct node *get_node(struct connection *conn, const void *ctx,
 			     const char *name, const char **canonical_name,
 			     unsigned int perm, bool allow_special)
 {
-	const char *tmp_name;
 	struct node *node;
 
-	if (!canonical_name)
-		canonical_name = &tmp_name;
 	*canonical_name = canonicalize(conn, ctx, name, allow_special);
 	if (!*canonical_name)
 		return NULL;
@@ -1303,12 +1300,28 @@ static struct node *get_node(struct connection *conn, const void *ctx,
 	       ? NULL : node;
 }
 
+static const struct node *get_node_const(struct connection *conn,
+					 const void *ctx, const char *name,
+					 unsigned int perm, bool allow_special)
+{
+	const char *tmp_name;
+	const struct node *node;
+
+	tmp_name = canonicalize(conn, ctx, name, allow_special);
+	if (!tmp_name)
+		return NULL;
+
+	node = read_node_const(conn, ctx, tmp_name);
+
+	return get_node_chk_perm(conn, ctx, node, tmp_name, perm) ? NULL : node;
+}
+
 static int send_directory(const void *ctx, struct connection *conn,
 			  struct buffered_data *in)
 {
-	struct node *node;
+	const struct node *node;
 
-	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, false);
+	node = get_node_const(conn, ctx, onearg(in), XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1322,14 +1335,14 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 {
 	unsigned int off, len, maxlen, genlen;
 	char *child, *data;
-	struct node *node;
+	const struct node *node;
 	char gen[24];
 
 	if (xenstore_count_strings(in->buffer, in->used) != 2)
 		return EINVAL;
 
 	/* First arg is node name. */
-	node = get_node(conn, ctx, in->buffer, NULL, XS_PERM_READ, false);
+	node = get_node_const(conn, ctx, in->buffer, XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1376,9 +1389,9 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 static int do_read(const void *ctx, struct connection *conn,
 		   struct buffered_data *in)
 {
-	struct node *node;
+	const struct node *node;
 
-	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, false);
+	node = get_node_const(conn, ctx, onearg(in), XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1786,12 +1799,12 @@ static int do_rm(const void *ctx, struct connection *conn,
 static int do_get_perms(const void *ctx, struct connection *conn,
 			struct buffered_data *in)
 {
-	struct node *node;
+	const struct node *node;
 	char *strings;
 	unsigned int len;
 	struct node_perms perms;
 
-	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, true);
+	node = get_node_const(conn, ctx, onearg(in), XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
-- 
2.35.3



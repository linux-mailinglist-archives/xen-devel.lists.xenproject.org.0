Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EE614E8E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434980.687970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQW-0004iQ-KP; Tue, 01 Nov 2022 15:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434980.687970; Tue, 01 Nov 2022 15:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQW-0004e2-9h; Tue, 01 Nov 2022 15:43:44 +0000
Received: by outflank-mailman (input) for mailman id 434980;
 Tue, 01 Nov 2022 15:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optCs-0007Bd-8J
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe3239c3-59f9-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:29:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67F39336C7;
 Tue,  1 Nov 2022 15:29:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C29A1346F;
 Tue,  1 Nov 2022 15:29:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6EFVDWA7YWPjYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:36 +0000
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
X-Inumbo-ID: fe3239c3-59f9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg8TSEeYBIF2KJ0g+f5733uhCW0POMvEIJ3tLX8Z4xA=;
	b=YudtRelzqL4HQQP/fQ7qugSrRsQJ8Dr+UwF3rEg/kAa1MwwJlMQuqjJMZ3ZlMV40lw537a
	fuWCg8yOwgyLFylEJtGSkzoYIN5ZZqf2NUU2TKBMEPIwvqRbtOGOm4qAN8xns9Tzcj/ObO
	OgoK8ng0tkNzMrufvn4MhN1DZrY41yU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 09/20] tools/xenstore: introduce dummy nodes for special watch paths
Date: Tue,  1 Nov 2022 16:28:31 +0100
Message-Id: <20221101152842.4257-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of special casing the permission handling and watch event
firing for the special watch paths "@introduceDomain" and
"@releaseDomain", use static dummy nodes added to the data base when
starting Xenstore.

This allows to simplify quite some code.

Note that this requires to rework the calls of fire_watches() for the
special events in order to avoid leaking memory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c |   3 -
 tools/xenstore/xenstored_core.c    |  67 +++++++-----
 tools/xenstore/xenstored_domain.c  | 162 ++++-------------------------
 tools/xenstore/xenstored_domain.h  |   6 --
 tools/xenstore/xenstored_watch.c   |  17 +--
 5 files changed, 63 insertions(+), 192 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index d1aaa00bf4..41e6992591 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -676,9 +676,6 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 	if (ret)
 		goto out;
 	ret = dump_state_connections(fp);
-	if (ret)
-		goto out;
-	ret = dump_state_special_nodes(fp);
 	if (ret)
 		goto out;
 	ret = dump_state_nodes(fp, ctx);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 1650821922..cadb339486 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -616,7 +616,8 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
 static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
 				  unsigned int domid)
 {
-	return (!conn || key->dptr[0] == '/') ? domid : conn->id;
+	return (!conn || key->dptr[0] == '/' || key->dptr[0] == '@')
+	       ? domid : conn->id;
 }
 
 int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
@@ -1780,14 +1781,6 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (perms.p[0].perms & XS_PERM_IGNORE)
 		return ENOENT;
 
-	/* First arg is node name. */
-	if (strstarts(in->buffer, "@")) {
-		if (set_perms_special(conn, in->buffer, &perms))
-			return errno;
-		send_ack(conn, XS_SET_PERMS);
-		return 0;
-	}
-
 	/* We must own node to do this (tools can do this too). */
 	node = get_node_canonicalized(conn, ctx, in->buffer, &name,
 				      XS_PERM_WRITE | XS_PERM_OWNER);
@@ -2388,7 +2381,9 @@ void setup_structure(bool live_update)
 		manual_node("/", "tool");
 		manual_node("/tool", "xenstored");
 		manual_node("/tool/xenstored", NULL);
-		domain_entry_fix(dom0_domid, 3, true);
+		manual_node("@releaseDomain", NULL);
+		manual_node("@introduceDomain", NULL);
+		domain_entry_fix(dom0_domid, 5, true);
 	}
 
 	check_store();
@@ -3170,6 +3165,23 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	return WALK_TREE_OK;
 }
 
+static int dump_state_special_node(FILE *fp, const void *ctx,
+				   struct dump_node_data *data,
+				   const char *name)
+{
+	struct node *node;
+	int ret;
+
+	node = read_node(NULL, ctx, name);
+	if (!node)
+		return dump_state_node_err(data, "Dump node read node error");
+
+	ret = dump_state_node(ctx, NULL, node, data);
+	talloc_free(node);
+
+	return ret;
+}
+
 const char *dump_state_nodes(FILE *fp, const void *ctx)
 {
 	struct dump_node_data data = {
@@ -3181,6 +3193,11 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
 	if (walk_node_tree(ctx, NULL, "/", &walkfuncs, &data))
 		return data.err;
 
+	if (dump_state_special_node(fp, ctx, &data, "@releaseDomain"))
+		return data.err;
+	if (dump_state_special_node(fp, ctx, &data, "@introduceDomain"))
+		return data.err;
+
 	return NULL;
 }
 
@@ -3354,25 +3371,21 @@ void read_state_node(const void *ctx, const void *state)
 		node->perms.p[i].id = sn->perms[i].domid;
 	}
 
-	if (strstarts(name, "@")) {
-		set_perms_special(&conn, name, &node->perms);
-		talloc_free(node);
-		return;
-	}
-
-	parentname = get_parent(node, name);
-	if (!parentname)
-		barf("allocation error restoring node");
-	parent = read_node(NULL, node, parentname);
-	if (!parent)
-		barf("read parent error restoring node");
+	if (!strstarts(name, "@")) {
+		parentname = get_parent(node, name);
+		if (!parentname)
+			barf("allocation error restoring node");
+		parent = read_node(NULL, node, parentname);
+		if (!parent)
+			barf("read parent error restoring node");
 
-	if (add_child(node, parent, name))
-		barf("allocation error restoring node");
+		if (add_child(node, parent, name))
+			barf("allocation error restoring node");
 
-	set_tdb_key(parentname, &key);
-	if (write_node_raw(NULL, &key, parent, true))
-		barf("write parent error restoring node");
+		set_tdb_key(parentname, &key);
+		if (write_node_raw(NULL, &key, parent, true))
+			barf("write parent error restoring node");
+	}
 
 	set_tdb_key(name, &key);
 	if (write_node_raw(NULL, &key, node, true))
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index f6797e53c5..5756010944 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -43,9 +43,6 @@ static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
 
-static struct node_perms dom_release_perms;
-static struct node_perms dom_introduce_perms;
-
 struct domain
 {
 	/* The id of this domain */
@@ -225,27 +222,6 @@ static void unmap_interface(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
-static void remove_domid_from_perm(struct node_perms *perms,
-				   struct domain *domain)
-{
-	unsigned int cur, new;
-
-	if (perms->p[0].id == domain->domid)
-		perms->p[0].id = priv_domid;
-
-	for (cur = new = 1; cur < perms->num; cur++) {
-		if (perms->p[cur].id == domain->domid)
-			continue;
-
-		if (new != cur)
-			perms->p[new] = perms->p[cur];
-
-		new++;
-	}
-
-	perms->num = new;
-}
-
 static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 				  struct node *node, void *arg)
 {
@@ -297,8 +273,24 @@ static void domain_tree_remove(struct domain *domain)
 			       "error when looking for orphaned nodes\n");
 	}
 
-	remove_domid_from_perm(&dom_release_perms, domain);
-	remove_domid_from_perm(&dom_introduce_perms, domain);
+	walk_node_tree(domain, NULL, "@releaseDomain", &walkfuncs, domain);
+	walk_node_tree(domain, NULL, "@introduceDomain", &walkfuncs, domain);
+}
+
+static void fire_special_watches(const char *name)
+{
+	void *ctx = talloc_new(NULL);
+	struct node *node;
+
+	if (!ctx)
+		return;
+
+	node = read_node(NULL, ctx, name);
+
+	if (node)
+		fire_watches(NULL, ctx, name, node, true, NULL);
+
+	talloc_free(ctx);
 }
 
 static int destroy_domain(void *_domain)
@@ -326,7 +318,7 @@ static int destroy_domain(void *_domain)
 			unmap_interface(domain->interface);
 	}
 
-	fire_watches(NULL, domain, "@releaseDomain", NULL, true, NULL);
+	fire_special_watches("@releaseDomain");
 
 	wrl_domain_destroy(domain);
 
@@ -390,7 +382,7 @@ void check_domains(void)
 		;
 
 	if (notify)
-		fire_watches(NULL, NULL, "@releaseDomain", NULL, true, NULL);
+		fire_special_watches("@releaseDomain");
 }
 
 /* We scan all domains rather than use the information given here. */
@@ -639,8 +631,7 @@ static struct domain *introduce_domain(const void *ctx,
 		}
 
 		if (!is_master_domain && !restore)
-			fire_watches(NULL, ctx, "@introduceDomain", NULL,
-				     true, NULL);
+			fire_special_watches("@introduceDomain");
 	} else {
 		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
 		if (domain->port)
@@ -843,59 +834,6 @@ const char *get_implicit_path(const struct connection *conn)
 	return conn->domain->path;
 }
 
-static int set_dom_perms_default(struct node_perms *perms)
-{
-	perms->num = 1;
-	perms->p = talloc_array(NULL, struct xs_permissions, perms->num);
-	if (!perms->p)
-		return -1;
-	perms->p->id = 0;
-	perms->p->perms = XS_PERM_NONE;
-
-	return 0;
-}
-
-static struct node_perms *get_perms_special(const char *name)
-{
-	if (!strcmp(name, "@releaseDomain"))
-		return &dom_release_perms;
-	if (!strcmp(name, "@introduceDomain"))
-		return &dom_introduce_perms;
-	return NULL;
-}
-
-int set_perms_special(struct connection *conn, const char *name,
-		      struct node_perms *perms)
-{
-	struct node_perms *p;
-
-	p = get_perms_special(name);
-	if (!p)
-		return EINVAL;
-
-	if ((perm_for_conn(conn, p) & (XS_PERM_WRITE | XS_PERM_OWNER)) !=
-	    (XS_PERM_WRITE | XS_PERM_OWNER))
-		return EACCES;
-
-	p->num = perms->num;
-	talloc_free(p->p);
-	p->p = perms->p;
-	talloc_steal(NULL, perms->p);
-
-	return 0;
-}
-
-bool check_perms_special(const char *name, struct connection *conn)
-{
-	struct node_perms *p;
-
-	p = get_perms_special(name);
-	if (!p)
-		return false;
-
-	return perm_for_conn(conn, p) & XS_PERM_READ;
-}
-
 void dom0_init(void)
 {
 	evtchn_port_t port;
@@ -965,10 +903,6 @@ void domain_init(int evtfd)
 	if (xce_handle == NULL)
 		barf_perror("Failed to open evtchn device");
 
-	if (set_dom_perms_default(&dom_release_perms) ||
-	    set_dom_perms_default(&dom_introduce_perms))
-		barf_perror("Failed to set special permissions");
-
 	if ((rc = xenevtchn_bind_virq(xce_handle, VIRQ_DOM_EXC)) == -1)
 		barf_perror("Failed to bind to domain exception virq port");
 	virq_port = rc;
@@ -1538,60 +1472,6 @@ const char *dump_state_connections(FILE *fp)
 	return ret;
 }
 
-static const char *dump_state_special_node(FILE *fp, const char *name,
-					   const struct node_perms *perms)
-{
-	struct xs_state_record_header head;
-	struct xs_state_node sn;
-	unsigned int pathlen;
-	const char *ret;
-
-	pathlen = strlen(name) + 1;
-
-	head.type = XS_STATE_TYPE_NODE;
-	head.length = sizeof(sn);
-
-	sn.conn_id = 0;
-	sn.ta_id = 0;
-	sn.ta_access = 0;
-	sn.perm_n = perms->num;
-	sn.path_len = pathlen;
-	sn.data_len = 0;
-	head.length += perms->num * sizeof(*sn.perms);
-	head.length += pathlen;
-	head.length = ROUNDUP(head.length, 3);
-	if (fwrite(&head, sizeof(head), 1, fp) != 1)
-		return "Dump special node error";
-	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
-		return "Dump special node error";
-
-	ret = dump_state_node_perms(fp, perms->p, perms->num);
-	if (ret)
-		return ret;
-
-	if (fwrite(name, pathlen, 1, fp) != 1)
-		return "Dump special node path error";
-
-	ret = dump_state_align(fp);
-
-	return ret;
-}
-
-const char *dump_state_special_nodes(FILE *fp)
-{
-	const char *ret;
-
-	ret = dump_state_special_node(fp, "@releaseDomain",
-				      &dom_release_perms);
-	if (ret)
-		return ret;
-
-	ret = dump_state_special_node(fp, "@introduceDomain",
-				      &dom_introduce_perms);
-
-	return ret;
-}
-
 void read_state_connection(const void *ctx, const void *state)
 {
 	const struct xs_state_connection *sc = state;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index b38c82991d..630641d620 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -99,11 +99,6 @@ void domain_outstanding_domid_dec(unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 
-/* Special node permission handling. */
-int set_perms_special(struct connection *conn, const char *name,
-		      struct node_perms *perms);
-bool check_perms_special(const char *name, struct connection *conn);
-
 /* Write rate limiting */
 
 #define WRL_FACTOR   1000 /* for fixed-point arithmetic */
@@ -132,7 +127,6 @@ void wrl_apply_debit_direct(struct connection *conn);
 void wrl_apply_debit_trans_commit(struct connection *conn);
 
 const char *dump_state_connections(FILE *fp);
-const char *dump_state_special_nodes(FILE *fp);
 
 void read_state_connection(const void *ctx, const void *state);
 
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 316c08b7f7..75748ac109 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -46,13 +46,6 @@ struct watch
 	char *node;
 };
 
-static bool check_special_event(const char *name)
-{
-	assert(name);
-
-	return strstarts(name, "@");
-}
-
 /* Is child a subnode of parent, or equal? */
 static bool is_child(const char *child, const char *parent)
 {
@@ -153,14 +146,8 @@ void fire_watches(struct connection *conn, const void *ctx, const char *name,
 
 	/* Create an event for each watch. */
 	list_for_each_entry(i, &connections, list) {
-		/* introduce/release domain watches */
-		if (check_special_event(name)) {
-			if (!check_perms_special(name, i))
-				continue;
-		} else {
-			if (!watch_permitted(i, ctx, name, node, perms))
-				continue;
-		}
+		if (!watch_permitted(i, ctx, name, node, perms))
+			continue;
 
 		list_for_each_entry(watch, &i->watches, list) {
 			if (exact) {
-- 
2.35.3



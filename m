Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8CB11F46
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057795.1425525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIL6-0007sZ-1e; Fri, 25 Jul 2025 13:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057795.1425525; Fri, 25 Jul 2025 13:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIL5-0007qA-R5; Fri, 25 Jul 2025 13:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1057795;
 Fri, 25 Jul 2025 13:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufIL4-0006ft-KN
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:19:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d258ee1-695a-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:19:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92CA21F79E;
 Fri, 25 Jul 2025 13:19:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68359134E8;
 Fri, 25 Jul 2025 13:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nfACGHmEg2jkPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:53 +0000
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
X-Inumbo-ID: 0d258ee1-695a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0L+m609nB8jubdx18B8IaRi3KvDezEsn/+/gJVTBJ6Y=;
	b=XSC+RNNXGZFg0IW2C1QTC4RvcBFXdsF77s/uBLacMB7VBHvK9W5dC7gRcCblkGuszmCvi+
	kvBY7BzJKITdFr0mr32Y7I4qLZRezW2vSDxwQts/hgNyTbw9HtJAI1BDSNP9eaFZN/LSHK
	3yOU2pJh5StcwA8GBxc0DVPQCQH4Edg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0L+m609nB8jubdx18B8IaRi3KvDezEsn/+/gJVTBJ6Y=;
	b=XSC+RNNXGZFg0IW2C1QTC4RvcBFXdsF77s/uBLacMB7VBHvK9W5dC7gRcCblkGuszmCvi+
	kvBY7BzJKITdFr0mr32Y7I4qLZRezW2vSDxwQts/hgNyTbw9HtJAI1BDSNP9eaFZN/LSHK
	3yOU2pJh5StcwA8GBxc0DVPQCQH4Edg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 4/7] tools/xenstored: add server feature support
Date: Fri, 25 Jul 2025 15:19:25 +0200
Message-ID: <20250725131928.19286-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add per domain server features, which are initialized by the supported
features at domain introduction, or by live update from the migration
stream. This requires to add the DOMAIN_DATA record to the migration
stream, but for now it will only contain the feature word.

Advertise the Xenstore features to guests by setting the appropriate
bits in the ring page.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- move setting interface->server_features to introduce_domain()
---
 tools/xenstored/domain.c | 60 +++++++++++++++++++++++++++++++++++++++-
 tools/xenstored/domain.h |  3 ++
 tools/xenstored/lu.c     | 14 ++++++++--
 tools/xenstored/lu.h     |  2 +-
 4 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e1d5e8d614..24ee99cbc6 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -32,6 +32,7 @@
 #include "transaction.h"
 #include "watch.h"
 #include "control.h"
+#include "lu.h"
 
 #include <xenevtchn.h>
 #include <xenmanage.h>
@@ -42,6 +43,8 @@
 #include <mini-os/xenbus.h>
 #endif
 
+#define XENSTORE_FEATURES	XENSTORE_SERVER_FEATURE_ERROR
+
 static xenmanage_handle *xm_handle;
 xengnttab_handle **xgt_handle;
 static evtchn_port_t virq_port;
@@ -115,6 +118,9 @@ struct domain
 	/* Event channel port */
 	evtchn_port_t port;
 
+	/* Server features supported for this domain. */
+	unsigned int features;
+
 	/* Domain path in store. */
 	char *path;
 
@@ -799,6 +805,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
 	domain->unique_id = unique_id;
 	domain->generation = generation;
 	domain->introduced = false;
+	domain->features = XENSTORE_FEATURES;
 
 	if (hashtable_add(domhash, &domain->domid, domain)) {
 		talloc_free(domain);
@@ -992,7 +999,8 @@ void ignore_connection(struct connection *conn, unsigned int err)
 {
 	trace("CONN %p ignored, reason %u\n", conn, err);
 
-	if (conn->domain && conn->domain->interface)
+	if (conn->domain && conn->domain->interface &&
+	    (conn->domain->features & XENSTORE_SERVER_FEATURE_ERROR))
 		conn->domain->interface->error = err;
 
 	conn->is_ignored = true;
@@ -1032,6 +1040,8 @@ static struct domain *introduce_domain(const void *ctx,
 			return NULL;
 		}
 		domain->interface = interface;
+		if (!restore)
+			interface->server_features = domain->features;
 
 		if (is_master_domain)
 			setup_structure(restore);
@@ -1849,6 +1859,54 @@ void read_state_connection(const void *ctx, const void *state)
 	}
 }
 
+static int dump_state_domain(const void *k, void *v, void *arg)
+{
+	struct domain *domain = v;
+	FILE *fp = arg;
+	struct xs_state_domain sd;
+	struct xs_state_record_header head;
+
+	head.type = XS_STATE_TYPE_DOMAIN;
+	head.length = sizeof(sd);
+	memset(&sd, 0, sizeof(sd));
+	sd.domain_id = domain->domid;
+
+	if (lu_status->version > 1)
+		sd.features = domain->features;
+
+	if (fwrite(&head, sizeof(head), 1, fp) != 1)
+		return 1;
+	if (fwrite(&sd, sizeof(sd), 1, fp) != 1)
+		return 1;
+	if (dump_state_align(fp))
+		return 1;
+
+	return 0;
+}
+
+const char *dump_state_domains(FILE *fp)
+{
+	const char *ret = NULL;
+
+	if (hashtable_iterate(domhash, dump_state_domain, fp))
+		ret = "Dump domain error";
+
+	return ret;
+}
+
+void read_state_domain(const void *ctx, const void *state, unsigned int version)
+{
+	const struct xs_state_domain *sd = state;
+	struct domain *domain;
+
+	domain = find_domain_struct(sd->domain_id);
+	if (!domain)
+		barf("referenced domain not found");
+
+	if (version > 1)
+		domain->features = sd->features;
+}
+
 struct domain_acc {
 	unsigned int domid;
 	int nodes;
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 844ac11510..8bfaca8f90 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -162,8 +162,11 @@ void wrl_apply_debit_direct(struct connection *conn);
 void wrl_apply_debit_trans_commit(struct connection *conn);
 
 const char *dump_state_connections(FILE *fp);
+const char *dump_state_domains(FILE *fp);
 
 void read_state_connection(const void *ctx, const void *state);
+void read_state_domain(const void *ctx, const void *state,
+		       unsigned int version);
 
 struct hashtable *domain_check_acc_init(void);
 void domain_check_acc_add(const struct node *node, struct hashtable *domains);
diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index 2c6adecb56..77e0d377c5 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -21,6 +21,8 @@
 #include "lu.h"
 #include "watch.h"
 
+struct live_update *lu_status;
+
 #ifndef NO_LIVE_UPDATE
 
 struct lu_dump_state {
@@ -30,8 +32,6 @@ struct lu_dump_state {
 	char *filename;
 };
 
-struct live_update *lu_status;
-
 static int lu_destroy(void *data)
 {
 	lu_status = NULL;
@@ -128,6 +128,7 @@ void lu_read_state(void)
 	struct xs_state_record_header *head;
 	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
 	struct xs_state_preamble *pre;
+	unsigned int version;
 
 	syslog(LOG_INFO, "live-update: read state\n");
 	lu_get_dump_state(&state);
@@ -135,8 +136,9 @@ void lu_read_state(void)
 		barf_perror("No state found after live-update");
 
 	pre = state.buf;
+	version = be32toh(pre->version);
 	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
-	    !pre->version || be32toh(pre->version) > XS_STATE_VERSION ||
+	    !version || version > XS_STATE_VERSION ||
 	    pre->flags != XS_STATE_FLAGS)
 		barf("Unknown record identifier");
 	for (head = state.buf + sizeof(*pre);
@@ -159,6 +161,9 @@ void lu_read_state(void)
 		case XS_STATE_TYPE_NODE:
 			read_state_node(ctx, head + 1);
 			break;
+		case XS_STATE_TYPE_DOMAIN:
+			read_state_domain(ctx, head + 1, version);
+			break;
 		default:
 			xprintf("live-update: unknown state record %08x\n",
 				head->type);
@@ -297,6 +302,9 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 	if (ret)
 		goto out;
 	ret = dump_state_nodes(fp, ctx);
+	if (ret)
+		goto out;
+	ret = dump_state_domains(fp);
 	if (ret)
 		goto out;
 
diff --git a/tools/xenstored/lu.h b/tools/xenstored/lu.h
index 512b8a6db2..aff7ab9011 100644
--- a/tools/xenstored/lu.h
+++ b/tools/xenstored/lu.h
@@ -5,7 +5,6 @@
  * Copyright (C) 2022 Juergen Gross, SUSE LLC
  */
 
-#ifndef NO_LIVE_UPDATE
 struct live_update {
 	/* For verification the correct connection is acting. */
 	struct connection *conn;
@@ -32,6 +31,7 @@ struct live_update {
 
 extern struct live_update *lu_status;
 
+#ifndef NO_LIVE_UPDATE
 struct connection *lu_get_connection(void);
 bool lu_is_pending(void);
 void lu_read_state(void);
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF3A2708A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881337.1291478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHJW-000725-0L; Tue, 04 Feb 2025 11:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881337.1291478; Tue, 04 Feb 2025 11:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHJV-0006zS-Tv; Tue, 04 Feb 2025 11:41:57 +0000
Received: by outflank-mailman (input) for mailman id 881337;
 Tue, 04 Feb 2025 11:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfHCj-0001ti-N5
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:34:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f588159-e2ec-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 12:34:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF35F210FB;
 Tue,  4 Feb 2025 11:34:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E4CC1393E;
 Tue,  4 Feb 2025 11:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eNQHIWD7oWfwLAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 11:34:56 +0000
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
X-Inumbo-ID: 0f588159-e2ec-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9StE4ANjAZ+GnOGy0AB+bm0HLjihy3Ml2ICsuKnPquw=;
	b=Ib0Jmkby5CiboRl+2bHQR0nuP/yxRAYuV9zLGOS3bAEztkOR55tr9YyPXzpmuYlMJg3faz
	0SWjWfj9PI0e0990DdNAMycejUEgtwUX3LoeoFYEo4Gw3cbT6Gy+LftjDAVXCMbBHwT98H
	5WYbwt/OYsAFRPcUmGKt3S65HAKSIz4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9StE4ANjAZ+GnOGy0AB+bm0HLjihy3Ml2ICsuKnPquw=;
	b=Ib0Jmkby5CiboRl+2bHQR0nuP/yxRAYuV9zLGOS3bAEztkOR55tr9YyPXzpmuYlMJg3faz
	0SWjWfj9PI0e0990DdNAMycejUEgtwUX3LoeoFYEo4Gw3cbT6Gy+LftjDAVXCMbBHwT98H
	5WYbwt/OYsAFRPcUmGKt3S65HAKSIz4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v8 8/9] tools/xenstored: use unique_id to identify new domain with same domid
Date: Tue,  4 Feb 2025 12:34:06 +0100
Message-ID: <20250204113407.16839-9-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the new unique_id of a domain in order to detect that a domain
has been replaced with another one reusing the doamin-id of the old
domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch
---
 tools/xenstored/domain.c         | 53 +++++++++++++++++++++++++++-----
 tools/xenstored/xenstore_state.h |  2 +-
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a6506a5bb2..63df24030e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -110,6 +110,7 @@ struct domain
 {
 	/* The id of this domain */
 	unsigned int domid;
+	uint64_t unique_id;
 
 	/* Event channel port */
 	evtchn_port_t port;
@@ -627,9 +628,17 @@ static int check_domain(const void *k, void *v, void *arg)
 	int dom_invalid;
 	struct domain *domain = v;
 	bool *notify = arg;
+	uint64_t unique_id;
 
 	dom_invalid = xenmanage_get_domain_info(xm_handle, domain->domid,
-						&state, NULL);
+						&state, &unique_id);
+	if (!dom_invalid) {
+		if (!domain->unique_id)
+			domain->unique_id = unique_id;
+		else if (domain->unique_id != unique_id)
+			dom_invalid = 1;
+	}
+
 	if (!domain->introduced) {
 		if (dom_invalid)
 			talloc_free(domain);
@@ -747,7 +756,8 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
 	return 0;
 }
 
-static struct domain *alloc_domain(const void *context, unsigned int domid)
+static struct domain *alloc_domain(const void *context, unsigned int domid,
+				   uint64_t unique_id)
 {
 	struct domain *domain;
 
@@ -758,6 +768,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid)
 	}
 
 	domain->domid = domid;
+	domain->unique_id = unique_id;
 	domain->generation = generation;
 	domain->introduced = false;
 
@@ -777,16 +788,27 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
 	struct domain *domain;
 
 	domain = find_domain_struct(domid);
-	return domain ? : alloc_domain(ctx, domid);
+	/* If domain not already known, use unique_id = 0 meaning "unknown". */
+	return domain ? : alloc_domain(ctx, domid, 0);
 }
 
 static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 {
 	struct domain *domain;
+	uint64_t unique_id = 0;
+	int dom_invalid = 0;
 
 	domain = find_domain_struct(domid);
-	if (!domain && !xenmanage_get_domain_info(xm_handle, domid, NULL, NULL))
-		domain = alloc_domain(NULL, domid);
+	if (!domain || !domain->unique_id)
+		dom_invalid = xenmanage_get_domain_info(xm_handle, domid,
+							NULL, &unique_id);
+
+	if (!dom_invalid) {
+		if (!domain)
+			domain = alloc_domain(NULL, domid, unique_id);
+		else if (unique_id)
+			domain->unique_id = unique_id;
+	}
 
 	return domain;
 }
@@ -1321,15 +1343,16 @@ int domain_alloc_permrefs(struct node_perms *perms)
 {
 	unsigned int i, domid;
 	struct domain *d;
+	uint64_t unique_id;
 
 	for (i = 0; i < perms->num; i++) {
 		domid = perms->p[i].id;
 		d = find_domain_struct(domid);
 		if (!d) {
 			if (xenmanage_get_domain_info(xm_handle, domid,
-						      NULL, NULL))
+						      NULL, &unique_id))
 				perms->p[i].perms |= XS_PERM_IGNORE;
-			else if (!alloc_domain(NULL, domid))
+			else if (!alloc_domain(NULL, domid, unique_id))
 				return ENOMEM;
 		}
 	}
@@ -1697,12 +1720,14 @@ const char *dump_state_connections(FILE *fp)
 	struct xs_state_record_header head;
 	struct connection *c;
 
+	BUILD_BUG_ON(sizeof(c->domain->unique_id) != sizeof(uint64_t));
+
 	list_for_each_entry(c, &connections, list) {
 		head.type = XS_STATE_TYPE_CONN;
 		head.length = sizeof(sc);
 
 		sc.conn_id = conn_id++;
-		sc.pad = 0;
+		sc.uniq_id_off = 0;
 		memset(&sc.spec, 0, sizeof(sc.spec));
 		if (c->domain) {
 			sc.conn_type = XS_STATE_CONN_TYPE_RING;
@@ -1720,6 +1745,10 @@ const char *dump_state_connections(FILE *fp)
 			return ret;
 		head.length += sc.data_in_len + sc.data_out_len;
 		head.length = ROUNDUP(head.length, 3);
+		if (c->domain) {
+			sc.uniq_id_off = head.length;
+			head.length += sizeof(uint64_t);
+		}
 		if (fwrite(&head, sizeof(head), 1, fp) != 1)
 			return "Dump connection state error";
 		if (fwrite(&sc, offsetof(struct xs_state_connection, data),
@@ -1731,6 +1760,9 @@ const char *dump_state_connections(FILE *fp)
 		ret = dump_state_align(fp);
 		if (ret)
 			return ret;
+		if (c->domain &&
+		    fwrite(&c->domain->unique_id, sizeof(uint64_t), 1, fp) != 1)
+			return "Dump connection state error";
 
 		ret = dump_state_watches(fp, c, sc.conn_id);
 		if (ret)
@@ -1748,6 +1780,7 @@ void read_state_connection(const void *ctx, const void *state)
 
 	if (sc->conn_type == XS_STATE_CONN_TYPE_SOCKET) {
 		conn = add_socket_connection(sc->spec.socket_fd);
+		domain = NULL;
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
 					  sc->spec.ring.evtchn, true);
@@ -1778,6 +1811,10 @@ void read_state_connection(const void *ctx, const void *state)
 	conn->conn_id = sc->conn_id;
 
 	read_state_buffered_data(ctx, conn, sc);
+
+	/* Validity of unique_id will be tested by check_domains() later. */
+	if (sc->uniq_id_off && domain)
+		domain->unique_id = *(uint64_t *)(state + sc->uniq_id_off);
 }
 
 struct domain_acc {
diff --git a/tools/xenstored/xenstore_state.h b/tools/xenstored/xenstore_state.h
index ae0d053c8f..4c785e3774 100644
--- a/tools/xenstored/xenstore_state.h
+++ b/tools/xenstored/xenstore_state.h
@@ -74,7 +74,7 @@ struct xs_state_connection {
     uint16_t conn_type;
 #define XS_STATE_CONN_TYPE_RING   0
 #define XS_STATE_CONN_TYPE_SOCKET 1
-    uint16_t pad;
+    uint16_t uniq_id_off;
     union {
         struct {
             uint16_t domid;  /* Domain-Id. */
-- 
2.43.0



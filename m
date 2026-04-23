Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP8cI7fT6WmmlAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A903444E5A1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291708.1570567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7M-00065g-Lh; Thu, 23 Apr 2026 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291708.1570567; Thu, 23 Apr 2026 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7M-000637-Hs; Thu, 23 Apr 2026 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1291708;
 Thu, 23 Apr 2026 08:08:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFp7K-00061r-NF
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:08:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFp7K-000vLh-3W
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:08:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d38e-e002-0a2a0a5209dd-0a2a4505da76-38
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:58 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d399-aaa8-0a2a45050019-c387df83d8fc-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:57 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F3E75BCFD;
 Thu, 23 Apr 2026 08:08:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EED32593A3;
 Thu, 23 Apr 2026 08:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 35k3OZbT6WkAXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 Apr 2026 08:08:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPBzawWX2g0dpZag7OUw1T+x+kMtwYFiewTeIGA7K/o=;
	b=bht6oFQjCvijEG82j7+TrxXWjGaD7mp+mdMIov/n+lxBL47Za6FGF+G2DeJv0kc4g1hXwU
	wIsx39JIy7PnXyx7dAOoAdc/R2Gs0H6lbb1yIgmnItARlIpJZX5NNHGyP2RDZSSe+JPPIf
	j+3ek9l4qkwpkJUpmuULoeQIIxxPaxs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Qkirx6S0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPBzawWX2g0dpZag7OUw1T+x+kMtwYFiewTeIGA7K/o=;
	b=Qkirx6S0tb+jXp7zMwAk9P/B47ZppVQUjk5pHDIFa9gOKi1rchok6xyGUPpYPhuDy78tbV
	EIUtUhdqBmCNSBKa9H5blHujl0jRkqUC/DJoc7CKeWBGTlmFUH4ydEY4IDyjnrqvkPbE3P
	D7hQrwWx+chtG36WrLnCufWz2C69nIo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/4] tools/xenstored: add support for "all domains" node permission
Date: Thu, 23 Apr 2026 10:08:38 +0200
Message-ID: <20260423080840.530547-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423080840.530547-1-jgross@suse.com>
References: <20260423080840.530547-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-c201ff/1776931737-E9BA4443-AAF74673/0/0
X-purgate-type: clean
X-purgate-size: 5892
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A903444E5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for using DOMID_ANY in node permissions to indicate that
all domains are allowed to access the node.

Add a new feature bit for indicating the support of DOMID_ANY.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl.cfg.5.pod.in        |  4 ++++
 tools/xenstored/core.c          | 19 ++++++++++++++-----
 tools/xenstored/domain.c        | 16 ++++++++++++++--
 tools/xenstored/domain.h        |  3 ++-
 xen/include/public/io/xs_wire.h |  2 ++
 5 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2f77016ecf..d34951edb9 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -746,6 +746,10 @@ Xenstore supports to set watches with a limited depth (depth 0 matches
 only the watched node, depth 1 matches the node and its direct children,
 etc.).
 
+=item B<0x00000008>
+
+Xenstore supports the B<all domains> node access permission.
+
 =back
 
 The features supported by the running Xenstore instance can be retrieved
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index f92fca6e9e..5a621f53ba 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -882,6 +882,16 @@ static int write_node(struct connection *conn, struct node *node,
 	return ret;
 }
 
+/* Check one node permission to match a connection. */
+static bool perm_allows_conn(const struct connection *conn,
+			     const struct xs_permissions *p)
+{
+	if (p->id == conn->id || (conn->target && p->id == conn->target->id))
+		return true;
+
+	return p->id == DOMID_ANY;
+}
+
 unsigned int perm_for_conn(struct connection *conn,
 			   const struct node_perms *perms)
 {
@@ -889,14 +899,13 @@ unsigned int perm_for_conn(struct connection *conn,
 	unsigned int mask = XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
 
 	/* Owners and tools get it all... */
-	if (!domain_is_unprivileged(conn) || perms->p[0].id == conn->id
-                || (conn->target && perms->p[0].id == conn->target->id))
+	if (!domain_is_unprivileged(conn) ||
+	    perm_allows_conn(conn, perms->p))
 		return (XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER) & mask;
 
 	for (i = 1; i < perms->num; i++)
 		if (!(perms->p[i].perms & XS_PERM_IGNORE) &&
-		    (perms->p[i].id == conn->id ||
-		     (conn->target && perms->p[i].id == conn->target->id)))
+		    perm_allows_conn(conn, perms->p + i))
 			return perms->p[i].perms & mask;
 
 	return perms->p[0].perms & mask;
@@ -1832,7 +1841,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (!xenstore_strings_to_perms(perms.p, perms.num, permstr))
 		return errno;
 
-	if (domain_alloc_permrefs(&perms))
+	if (domain_alloc_permrefs(conn, &perms))
 		return ENOMEM;
 	if (perms.p[0].perms & XS_PERM_IGNORE)
 		return ENOENT;
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 00875d6b5c..0bd2a1891a 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -44,7 +44,8 @@
 #endif
 
 #define XENSTORE_FEATURES	(XENSTORE_SERVER_FEATURE_ERROR |	\
-				 XENSTORE_SERVER_FEATURE_WATCHDEPTH)
+				 XENSTORE_SERVER_FEATURE_WATCHDEPTH |	\
+				 XENSTORE_SERVER_FEATURE_DOMID_ANY)
 
 static xenmanage_handle *xm_handle;
 xengnttab_handle **xgt_handle;
@@ -1754,8 +1755,12 @@ static bool chk_domain_generation(unsigned int domid, uint64_t gen)
  * Allocate all missing struct domain referenced by a permission set.
  * Any permission entries for not existing domains will be marked to be
  * ignored.
+ * An DOMID_ANY entry will be marked to be ignored, if the writing
+ * domain doesn't have the XENSTORE_SERVER_FEATURE_DOMID_ANY enabled. Note
+ * that Xen tools will never set DOMID_ANY for a guest owned node.
  */
-int domain_alloc_permrefs(struct node_perms *perms)
+int domain_alloc_permrefs(const struct connection *conn,
+			  struct node_perms *perms)
 {
 	unsigned int i, domid;
 	struct domain *d;
@@ -1763,6 +1768,12 @@ int domain_alloc_permrefs(struct node_perms *perms)
 
 	for (i = 0; i < perms->num; i++) {
 		domid = perms->p[i].id;
+		if (domid == DOMID_ANY) {
+			if (!(conn->domain->features &
+			      XENSTORE_SERVER_FEATURE_DOMID_ANY))
+				perms->p[i].perms |= XS_PERM_IGNORE;
+			continue;
+		}
 		d = find_domain_struct(domid);
 		if (!d) {
 			if (xenmanage_get_domain_info(xm_handle, domid, NULL,
@@ -1788,6 +1799,7 @@ int domain_adjust_node_perms(struct node *node)
 
 	for (i = 1; i < node->hdr.num_perms; i++) {
 		if ((perms[i].perms & XS_PERM_IGNORE) ||
+		    perms[i].id == DOMID_ANY ||
 		    chk_domain_generation(perms[i].id, node->hdr.generation))
 			continue;
 
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index b1cfb5cd82..7dad4849a0 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -116,7 +116,8 @@ const char *get_implicit_path(const struct connection *conn);
  */
 int domain_adjust_node_perms(struct node *node);
 
-int domain_alloc_permrefs(struct node_perms *perms);
+int domain_alloc_permrefs(const struct connection *conn,
+			  struct node_perms *perms);
 
 /* Quota manipulation */
 int domain_nbentry_inc(struct connection *conn, unsigned int domid);
diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 2e763bc877..d6533a8452 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -126,6 +126,8 @@ struct xenstore_domain_interface {
 #define XENSTORE_SERVER_FEATURE_ERROR        2
 /* The XS_WATCH command can be used with a <depth> parameter */
 #define XENSTORE_SERVER_FEATURE_WATCHDEPTH   4
+/* The capability to use DOMID_ANY for node permissions */
+#define XENSTORE_SERVER_FEATURE_DOMID_ANY    8
 
 /* Valid values for the connection field */
 #define XENSTORE_CONNECTED 0 /* the steady-state */
-- 
2.53.0



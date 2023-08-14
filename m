Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A377B31A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583376.913604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSS4-0002Wo-TL; Mon, 14 Aug 2023 07:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583376.913604; Mon, 14 Aug 2023 07:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSS4-0002Og-OF; Mon, 14 Aug 2023 07:57:24 +0000
Received: by outflank-mailman (input) for mailman id 583376;
 Mon, 14 Aug 2023 07:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSJG-0002SK-AM
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:48:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee7c408f-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:48:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9242B1FD61;
 Mon, 14 Aug 2023 07:48:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66FE2138EE;
 Mon, 14 Aug 2023 07:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mMGdF0Hc2WQfQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:48:17 +0000
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
X-Inumbo-ID: ee7c408f-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0Nt9UPkcon/NwHzO5qyumeiHS9xzg9BSL5xWIBNL+c=;
	b=JKeKCc7N2K6XhnvSICmIyAnQg3boLpwiHG0/Oft4mtfCh7Vvwjnf0otEgvTJ9LYA1XF86E
	LGAi7LW48iltY2V2N6UMn7yLDuYuyf0cai6n8zYCA29LigmmdLzH2fLRGesLv/gGtrJwGQ
	E8BxmqOQZ/FIDnV/4XEGTAlGqyxWbNo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 12/19] tools/xenstore: alloc new memory in domain_adjust_node_perms()
Date: Mon, 14 Aug 2023 09:47:00 +0200
Message-Id: <20230814074707.27696-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid modifying the node data in the data base in case a
domain is gone, let domain_adjust_node_perms() allocate new memory for
the permissions in case they need to be modified. As this should
happen only in very rare cases, it is fine to do this even when having
copied the node data already.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- add comments (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 10 +++++-----
 tools/xenstore/xenstored_domain.c | 24 ++++++++++++++++++++----
 tools/xenstore/xenstored_domain.h |  8 +++++++-
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ab4714263d..c8c8c4b8f4 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -752,6 +752,11 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		goto error;
 	}
 
+	/* Data is binary blob (usually ascii, no nul). */
+	node->data = node->perms + hdr->num_perms;
+	/* Children is strings, nul separated. */
+	node->children = node->data + node->hdr.datalen;
+
 	if (domain_adjust_node_perms(node))
 		goto error;
 
@@ -759,11 +764,6 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	if (node->acc.domid != get_node_owner(node))
 		node->acc.memory = 0;
 
-	/* Data is binary blob (usually ascii, no nul). */
-	node->data = node->perms + hdr->num_perms;
-	/* Children is strings, nul separated. */
-	node->children = node->data + node->hdr.datalen;
-
 	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
 		goto error;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index fdf1095acb..c00ea397cf 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1334,13 +1334,29 @@ int domain_alloc_permrefs(struct node_perms *perms)
 int domain_adjust_node_perms(struct node *node)
 {
 	unsigned int i;
+	struct xs_permissions *perms = node->perms;
+	bool copied = false;
 
 	for (i = 1; i < node->hdr.num_perms; i++) {
-		if (node->perms[i].perms & XS_PERM_IGNORE)
+		if ((perms[i].perms & XS_PERM_IGNORE) ||
+		    chk_domain_generation(perms[i].id, node->hdr.generation))
 			continue;
-		if (!chk_domain_generation(node->perms[i].id,
-					   node->hdr.generation))
-			node->perms[i].perms |= XS_PERM_IGNORE;
+
+		/*
+		 * Don't do a in-place modification, as the node might
+		 * reference data directly in the data base, which we don't
+		 * want to modify.
+		 */
+		if (!copied) {
+			perms = talloc_memdup(node, node->perms,
+					node->hdr.num_perms * sizeof(*perms));
+			if (!perms)
+				return ENOMEM;
+			node->perms = perms;
+			copied = true;
+		}
+
+		perms[i].perms |= XS_PERM_IGNORE;
 	}
 
 	return 0;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 4950b00aee..7625dca8cd 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -90,8 +90,14 @@ void ignore_connection(struct connection *conn, unsigned int err);
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
 
-/* Remove node permissions for no longer existing domains. */
+/*
+ * Remove node permissions for no longer existing domains.
+ * In case of a change of permissions the related array is reallocated in
+ * order to avoid a data base change when operating on a node directly
+ * referencing the data base contents.
+ */
 int domain_adjust_node_perms(struct node *node);
+
 int domain_alloc_permrefs(struct node_perms *perms);
 
 /* Quota manipulation */
-- 
2.35.3



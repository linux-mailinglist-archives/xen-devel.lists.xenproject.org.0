Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB775F481
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568768.888762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQG-0001wV-Ti; Mon, 24 Jul 2023 11:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568768.888762; Mon, 24 Jul 2023 11:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQG-0001kl-AV; Mon, 24 Jul 2023 11:08:16 +0000
Received: by outflank-mailman (input) for mailman id 568768;
 Mon, 24 Jul 2023 11:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtMp-0000KR-L9
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:04:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e470076b-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:04:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F14B222991;
 Mon, 24 Jul 2023 11:04:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2E7D13476;
 Mon, 24 Jul 2023 11:04:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YTwkLspavmRZYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:04:42 +0000
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
X-Inumbo-ID: e470076b-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1v6Xlk3y4teF71x4mrmlG0ix0/+qV1VkkWZlz39L56s=;
	b=I3nc6rnJV2WdpYF0W9m5iv5wAf/LEjQ4Ypzm/0pbSr65JNx1NBheQj3abiiUJPkhG0c8/Z
	+aiW+8lHOzVPdwllXOtMuKkEayaiZNanK6OVRK1DFiTUcIJuwAeoeeLJqz3AK3ZBLX9KUq
	3s5J4/B9jG4nk2cuWIlKS527C1DyFQA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 20/25] tools/xenstore: alloc new memory in domain_adjust_node_perms()
Date: Mon, 24 Jul 2023 13:02:42 +0200
Message-Id: <20230724110247.10520-21-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_core.c   | 10 +++++-----
 tools/xenstore/xenstored_domain.c | 19 +++++++++++++++----
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 404ecd0c62..ea3d20a372 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -751,6 +751,11 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		goto error;
 	}
 
+	/* Data is binary blob (usually ascii, no nul). */
+	node->data = node->perms + hdr->num_perms;
+	/* Children is strings, nul separated. */
+	node->children = node->data + node->hdr.datalen;
+
 	if (domain_adjust_node_perms(node))
 		goto error;
 
@@ -758,11 +763,6 @@ struct node *read_node(struct connection *conn, const void *ctx,
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
index fdf1095acb..cdef6efef4 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1334,13 +1334,24 @@ int domain_alloc_permrefs(struct node_perms *perms)
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
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96656D74F5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518237.804580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBt-0004DI-P5; Wed, 05 Apr 2023 07:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518237.804580; Wed, 05 Apr 2023 07:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBt-0004Ak-Lj; Wed, 05 Apr 2023 07:04:21 +0000
Received: by outflank-mailman (input) for mailman id 518237;
 Wed, 05 Apr 2023 07:04:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxBs-0002UC-Dn
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:04:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fee7ff-d380-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 09:04:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 943DD229D0;
 Wed,  5 Apr 2023 07:04:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6637513A31;
 Wed,  5 Apr 2023 07:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qRGQF3MdLWSuEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:04:19 +0000
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
X-Inumbo-ID: 15fee7ff-d380-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpWITZM/jycFaeqzkIbP5IXI6C0MvtvZCqGsXHa9q9E=;
	b=kTpVk4DwUfgPK7n3BwU0oPzleMoDtWJ447NcVfWzVjgXB+gyyHKQnZFa0k/Vr2vrOq9/LD
	HF4LHvHcGRpZHl9AJDKHA0UZmHI75Hu6Rn8600M4F1KRoyM3hM4yAivBTD1QMT3z8+BXXv
	8+7tdsP+1izd8Xl53RPN1wneBPWYAXY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 05/13] tools/xenstore: use accounting buffering for node accounting
Date: Wed,  5 Apr 2023 09:03:41 +0200
Message-Id: <20230405070349.25293-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the node accounting to the accounting information buffering in
order to avoid having to undo it in case of failure.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   | 21 ++-------------------
 tools/xenstore/xenstored_domain.h |  4 ++--
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 84335f5f3d..92a40ccf3f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1452,7 +1452,6 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
 static int destroy_node(struct connection *conn, struct node *node)
 {
 	destroy_node_rm(conn, node);
-	domain_nbentry_dec(conn, get_node_owner(node));
 
 	/*
 	 * It is not possible to easily revert the changes in a transaction.
@@ -1797,27 +1796,11 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	old_perms = node->perms;
 	domain_nbentry_dec(conn, get_node_owner(node));
 	node->perms = perms;
-	if (domain_nbentry_inc(conn, get_node_owner(node))) {
-		node->perms = old_perms;
-		/*
-		 * This should never fail because we had a reference on the
-		 * domain before and Xenstored is single-threaded.
-		 */
-		domain_nbentry_inc(conn, get_node_owner(node));
+	if (domain_nbentry_inc(conn, get_node_owner(node)))
 		return ENOMEM;
-	}
 
-	if (write_node(conn, node, false)) {
-		int saved_errno = errno;
-
-		domain_nbentry_dec(conn, get_node_owner(node));
-		node->perms = old_perms;
-		/* No failure possible as above. */
-		domain_nbentry_inc(conn, get_node_owner(node));
-
-		errno = saved_errno;
+	if (write_node(conn, node, false))
 		return errno;
-	}
 
 	fire_watches(conn, ctx, name, node, false, &old_perms);
 	send_ack(conn, XS_SET_PERMS);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 6355ad4f37..e669f57b80 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -25,9 +25,9 @@
  * a per transaction array.
  */
 enum accitem {
+	ACC_NODES,
 	ACC_REQ_N,		/* Number of elements per request. */
-	ACC_NODES = ACC_REQ_N,
-	ACC_TR_N,		/* Number of elements per transaction. */
+	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
 	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
 };
 
-- 
2.35.3



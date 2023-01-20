Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58706751F1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481572.746589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCo-0003Ob-7g; Fri, 20 Jan 2023 10:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481572.746589; Fri, 20 Jan 2023 10:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCo-0003Iu-3Q; Fri, 20 Jan 2023 10:01:06 +0000
Received: by outflank-mailman (input) for mailman id 481572;
 Fri, 20 Jan 2023 10:01:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIoCm-0001b3-3d
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:01:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5893aced-98a9-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 11:01:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0FDAB5F7E3;
 Fri, 20 Jan 2023 10:01:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DADED1390C;
 Fri, 20 Jan 2023 10:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9H9DNF1mymMuRQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 20 Jan 2023 10:01:01 +0000
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
X-Inumbo-ID: 5893aced-98a9-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674208862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grOzEcqHpEHR284xFwYs35DiTP4FIbGzOZunWUj9dwg=;
	b=c1TMdmiLxgiHgA9/+KIGmpHJdZbSkkF/SqNFIAQ82c+UROadqGhvG0MvMwAr63LFzUUpp5
	pm4ipDjM6EduHwIhCb6U0sXDzvhxVFjsVscMZd3nLO8lq9mW9huaSzLBBckJ3IjYNtFiJK
	j/BWFeB+hldf8pM3DhjqFwy+KTQS7gM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 05/13] tools/xenstore: use accounting buffering for node accounting
Date: Fri, 20 Jan 2023 11:00:20 +0100
Message-Id: <20230120100028.11142-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120100028.11142-1-jgross@suse.com>
References: <20230120100028.11142-1-jgross@suse.com>
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
index 2d10cacf35..250ecd1199 100644
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
index cd85bd0cad..5df6ae72f8 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -20,9 +20,9 @@
 #define _XENSTORED_DOMAIN_H
 
 enum accitem {
+	ACC_NODES,
 	ACC_REQ_N,       /* Number of elements per request and domain. */
-	ACC_NODES = ACC_REQ_N,
-	ACC_TR_N,        /* Number of elements per transaction and domain. */
+	ACC_TR_N = ACC_REQ_N, /* Number of elements per transaction and domain. */
 	ACC_N = ACC_TR_N /* Number of elements per domain. */
 };
 
-- 
2.35.3



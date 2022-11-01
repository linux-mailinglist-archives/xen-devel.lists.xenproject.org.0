Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CC614EC3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435040.688056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkw-0004f2-2F; Tue, 01 Nov 2022 16:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435040.688056; Tue, 01 Nov 2022 16:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkv-0004bC-Ub; Tue, 01 Nov 2022 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 435040;
 Tue, 01 Nov 2022 16:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optku-0003Iv-Co
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:04:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8823555-59fe-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:04:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F0B61F8CA;
 Tue,  1 Nov 2022 16:04:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 522971346F;
 Tue,  1 Nov 2022 16:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ivTHEp9DYWNLcgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:04:47 +0000
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
X-Inumbo-ID: e8823555-59fe-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FDt15mfZEArmZvoJOo527N0gTwrSVu9AiSo1IvcHbc=;
	b=OBcPfXbw3m0lmkiUREpm5sJR19ZG/eacbsBhCZcnY8iexXdGYYqawa9dUTtz+/8rbhWov1
	jF5bHeVmyybe+d6pQEHVYFf4zJlygeMK/dl22cEIpWFBOcRQqEsyd7BPs5zrKIYvlzwEI9
	UX7+V6eyWAg6OajcKpEZkAuh/SwNk8k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 04/12] tools/xenstore: use accounting buffering for node accounting
Date: Tue,  1 Nov 2022 17:04:14 +0100
Message-Id: <20221101160422.7212-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
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
index d437149622..7bf56b4d38 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1442,7 +1442,6 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
 static int destroy_node(struct connection *conn, struct node *node)
 {
 	destroy_node_rm(conn, node);
-	domain_nbentry_dec(conn, node->perms.p[0].id);
 
 	/*
 	 * It is not possible to easily revert the changes in a transaction.
@@ -1788,27 +1787,11 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	old_perms = node->perms;
 	domain_nbentry_dec(conn, node->perms.p[0].id);
 	node->perms = perms;
-	if (domain_nbentry_inc(conn, node->perms.p[0].id)) {
-		node->perms = old_perms;
-		/*
-		 * This should never fail because we had a reference on the
-		 * domain before and Xenstored is single-threaded.
-		 */
-		domain_nbentry_inc(conn, node->perms.p[0].id);
+	if (domain_nbentry_inc(conn, node->perms.p[0].id))
 		return ENOMEM;
-	}
 
-	if (write_node(conn, node, false)) {
-		int saved_errno = errno;
-
-		domain_nbentry_dec(conn, node->perms.p[0].id);
-		node->perms = old_perms;
-		/* No failure possible as above. */
-		domain_nbentry_inc(conn, node->perms.p[0].id);
-
-		errno = saved_errno;
+	if (write_node(conn, node, false))
 		return errno;
-	}
 
 	fire_watches(conn, ctx, name, node, false, &old_perms);
 	send_ack(conn, XS_SET_PERMS);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 9959b2f2e4..ead3893fc1 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -20,9 +20,9 @@
 #define _XENSTORED_DOMAIN_H
 
 enum {
+	ACC_NODES,
 	ACC_REQ_N,       /* Number of elements per request and domain. */
-	ACC_NODES = ACC_REQ_N,
-	ACC_TR_N,        /* Number of elements per transaction and domain. */
+	ACC_TR_N = ACC_REQ_N, /* Number of elements per transaction and domain. */
 	ACC_N = ACC_TR_N /* Number of elements per domain. */
 };
 
-- 
2.35.3



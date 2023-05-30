Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B171585C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540775.842752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uen-0004Kk-AI; Tue, 30 May 2023 08:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540775.842752; Tue, 30 May 2023 08:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uen-0004I4-7a; Tue, 30 May 2023 08:24:41 +0000
Received: by outflank-mailman (input) for mailman id 540775;
 Tue, 30 May 2023 08:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3uem-0003jy-2I
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:24:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a52283f-fec3-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:24:37 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E4B991F8B9;
 Tue, 30 May 2023 08:24:37 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A91A71342F;
 Tue, 30 May 2023 08:24:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Cw/8J8WydWQWEAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:24:37 +0000
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
X-Inumbo-ID: 6a52283f-fec3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685435077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlFoqnoU3I4JMyJapnFZtevlraEzWmolnTL1zQ4kqcs=;
	b=pAjU0NzvYb3hu5IjT4euugnFDqmO9DY7Mdg+wAd5qK+8Fh9plpFTbET8xJO/DU3qFQM+mH
	GNNq5G6XgMHgofsImvKPEZ1A1uUkV0QMRWjPjDB0aXYY4NDEzXKKeAxZGBJKrYbXPl6ewG
	ZSm2/fz3g8EejT7wt79SmoufknW3sT0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 02/14] tools/xenstore: manage per-transaction domain accounting data in an array
Date: Tue, 30 May 2023 10:24:12 +0200
Message-Id: <20230530082424.32126-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
References: <20230530082424.32126-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare keeping accounting data in an array instead of
using independent fields, switch the struct changed_domain accounting
data to that scheme, for now only using an array with one element.

In order to be able to extend this scheme add the needed indexing enum
to xenstored_domain.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- make "what" parameter of acc_add_changed_dom() an enum type, and
  assert() that it won't exceed the accounting array (Julien Grall)
---
 tools/xenstore/xenstored_domain.c | 19 +++++++++++--------
 tools/xenstore/xenstored_domain.h | 10 ++++++++++
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index dbbf97accc..609a9a13ab 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -99,8 +99,8 @@ struct changed_domain
 	/* Identifier of the changed domain. */
 	unsigned int domid;
 
-	/* Amount by which this domain's nbentry field has changed. */
-	int nbentry;
+	/* Accounting data. */
+	int acc[ACC_TR_N];
 };
 
 static struct hashtable *domhash;
@@ -550,7 +550,7 @@ int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
 	int cnt;
 
 	list_for_each_entry(cd, head, list) {
-		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
+		cnt = domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES], update);
 		if (!update) {
 			if (chk_quota && cnt >= quota_nb_entry_per_domain)
 				return ENOSPC;
@@ -595,19 +595,21 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 	return cd;
 }
 
-static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
-			       unsigned int domid)
+static int acc_add_changed_dom(const void *ctx, struct list_head *head,
+			       enum accitem what, int val, unsigned int domid)
 {
 	struct changed_domain *cd;
 
+	assert(what < ARRAY_SIZE(cd->acc));
+
 	cd = acc_get_changed_domain(ctx, head, domid);
 	if (!cd)
 		return 0;
 
 	errno = 0;
-	cd->nbentry += val;
+	cd->acc[what] += val;
 
-	return cd->nbentry;
+	return cd->acc[what];
 }
 
 static void domain_conn_reset(struct domain *domain)
@@ -1071,7 +1073,8 @@ static int domain_nbentry_add(struct connection *conn, unsigned int domid,
 
 	if (conn && conn->transaction) {
 		head = transaction_get_changed_domains(conn->transaction);
-		ret = acc_add_dom_nbentry(conn->transaction, head, add, domid);
+		ret = acc_add_changed_dom(conn->transaction, head, ACC_NODES,
+					  add, domid);
 		if (errno) {
 			fail_transaction(conn->transaction);
 			return -1;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 279cccb3ad..40803574f6 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -19,6 +19,16 @@
 #ifndef _XENSTORED_DOMAIN_H
 #define _XENSTORED_DOMAIN_H
 
+/*
+ * All accounting data is stored in a per-domain array.
+ * Depending on the account item there might be other scopes as well, like e.g.
+ * a per transaction array.
+ */
+enum accitem {
+	ACC_NODES,
+	ACC_TR_N,		/* Number of elements per transaction. */
+};
+
 void handle_event(void);
 
 void check_domains(void);
-- 
2.35.3



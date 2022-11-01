Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119A614EC1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435037.688023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkg-0003bA-3O; Tue, 01 Nov 2022 16:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435037.688023; Tue, 01 Nov 2022 16:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkf-0003Yl-W8; Tue, 01 Nov 2022 16:04:33 +0000
Received: by outflank-mailman (input) for mailman id 435037;
 Tue, 01 Nov 2022 16:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optkd-0003Iv-R5
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:04:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de8dce0d-59fe-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:04:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8C1822566;
 Tue,  1 Nov 2022 16:04:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99B781346F;
 Tue,  1 Nov 2022 16:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yt4pJI5DYWMlcgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:04:30 +0000
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
X-Inumbo-ID: de8dce0d-59fe-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClK+S4fe5XoEXGnmTytfGm/UdGaWd4a4uXnR/ciAATo=;
	b=WMGNJh12bIYiZ3wI7cv2gXwEYFjkKcD1gXNtYdWxfxaXL/kQI0nRODknx7zA9E/mJNMdWw
	AbYTfI8vpU9MlilXn7mveQ2OoEBHanYIDRq60xbbXbcQVTsV+HNrzd/AVWCfnPwYBicJr7
	oLOfTYleBpgd/t4E6+CAHPOFD71dXfk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 01/12] tools/xenstore: manage per-transaction domain accounting data in an array
Date: Tue,  1 Nov 2022 17:04:11 +0100
Message-Id: <20221101160422.7212-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare keeping accounting data in an array instead of
using independent fields, switch the struct changed_domain accounting
data to that scheme, for now only using an array with one element.

In order to be able to extend this scheme add the needed indexing enum
to xenstored_domain.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 17 +++++++++--------
 tools/xenstore/xenstored_domain.h |  5 +++++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 582b78b0ee..399fc920bb 100644
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
@@ -558,7 +558,7 @@ int acc_fix_domains(struct list_head *head, bool update)
 	int cnt;
 
 	list_for_each_entry(cd, head, list) {
-		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
+		cnt = domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES], update);
 		if (!update) {
 			if (cnt >= quota_nb_entry_per_domain)
 				return ENOSPC;
@@ -603,8 +603,8 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 	return cd;
 }
 
-static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
-			       unsigned int domid)
+static int acc_add_changed_dom(const void *ctx, struct list_head *head,
+			       unsigned int what, int val, unsigned int domid)
 {
 	struct changed_domain *cd;
 
@@ -613,9 +613,9 @@ static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
 		return 0;
 
 	errno = 0;
-	cd->nbentry += val;
+	cd->acc[what] += val;
 
-	return cd->nbentry;
+	return cd->acc[what];
 }
 
 static void domain_conn_reset(struct domain *domain)
@@ -1076,7 +1076,8 @@ static int domain_nbentry_add(struct connection *conn, unsigned int domid,
 
 	if (conn && conn->transaction) {
 		head = transaction_get_changed_domains(conn->transaction);
-		ret = acc_add_dom_nbentry(conn->transaction, head, add, domid);
+		ret = acc_add_changed_dom(conn->transaction, head, ACC_NODES,
+					  add, domid);
 		if (errno) {
 			fail_transaction(conn->transaction);
 			return -1;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index dc4660861e..124b9e1b1e 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -19,6 +19,11 @@
 #ifndef _XENSTORED_DOMAIN_H
 #define _XENSTORED_DOMAIN_H
 
+enum {
+	ACC_NODES,
+	ACC_TR_N	/* Number of elements per transaction and domain. */
+};
+
 void handle_event(void);
 
 void check_domains(void);
-- 
2.35.3



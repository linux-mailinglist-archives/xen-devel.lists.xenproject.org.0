Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4F375F477
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568754.888696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPg-0007jm-El; Mon, 24 Jul 2023 11:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568754.888696; Mon, 24 Jul 2023 11:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPg-0007g3-BX; Mon, 24 Jul 2023 11:07:40 +0000
Received: by outflank-mailman (input) for mailman id 568754;
 Mon, 24 Jul 2023 11:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtMN-0000KR-QI
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:04:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c20f8b-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:04:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0111522988;
 Mon, 24 Jul 2023 11:04:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3DDC13476;
 Mon, 24 Jul 2023 11:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L474Ka5avmT9YQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:04:14 +0000
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
X-Inumbo-ID: d3c20f8b-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=chevwYuBSR7V/TZ3mWJmpGZB7vbjU7lZFq1Lv4K/AXA=;
	b=YZYVabAiVdDjvCZJmBZB5BX/DuaLdGTjVphEZ2IKaqs7qdf4zaR092HvBx9z4v9LttF6vA
	qb417PToMB/XOz8b1R85JC8dhfnBBUVseldkoLyXnly+pygjRGdNErFnstIZoKdACjlFLS
	cHJiD8tT7v2UG4FOxDMpz8N5jRPWopg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 15/25] tools/xenstore: make data parameter of db_write() const
Date: Mon, 24 Jul 2023 13:02:37 +0200
Message-Id: <20230724110247.10520-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

db_write() doesn't change the data written to the data base, so the
data parameter can be const.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tools/xenstore/xenstored_core.c | 4 ++--
 tools/xenstore/xenstored_core.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a08962c3ea..9f88914149 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -611,11 +611,11 @@ static unsigned int get_acc_domid(struct connection *conn, const char *name,
 	return (!conn || name[0] == '/' || name[0] == '@') ? domid : conn->id;
 }
 
-int db_write(struct connection *conn, const char *db_name, void *data,
+int db_write(struct connection *conn, const char *db_name, const void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check)
 {
-	struct xs_tdb_record_hdr *hdr = data;
+	const struct xs_tdb_record_hdr *hdr = data;
 	struct node_account_data old_acc = {};
 	unsigned int old_domid, new_domid;
 	size_t name_len = strlen(db_name);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index e1aeb4aecd..1aa3cc0936 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -363,7 +363,7 @@ int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
 struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
-int db_write(struct connection *conn, const char *db_name, void *data,
+int db_write(struct connection *conn, const char *db_name, const void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
 void db_delete(struct connection *conn, const char *name,
-- 
2.35.3



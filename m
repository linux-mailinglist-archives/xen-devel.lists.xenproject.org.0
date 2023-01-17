Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16366D99D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479175.742872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3m-0004M6-0m; Tue, 17 Jan 2023 09:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479175.742872; Tue, 17 Jan 2023 09:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3l-0004FM-SK; Tue, 17 Jan 2023 09:15:13 +0000
Received: by outflank-mailman (input) for mailman id 479175;
 Tue, 17 Jan 2023 09:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi0z-0007bs-AY
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:12:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a0e5259-9647-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A47B3821E;
 Tue, 17 Jan 2023 09:12:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CFA91390C;
 Tue, 17 Jan 2023 09:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P+7HBXFmxmNRcAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:12:17 +0000
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
X-Inumbo-ID: 0a0e5259-9647-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhYKz+Oi7NXGdn9eIooP5S2YyA3D/bV21hS8CpK2wqk=;
	b=ALO1TvRobgMJ1AorCZaEgQY0wUZ9fDndL3T46npH/zyLE7xIWsfMfSAI7C1J9oSg1upGnO
	YsOAXkz+ouc5mFTkW2ljb14Pz04Hou6Cgikuyn2qUmS3rwB+HUo9u+GdH6PUvtXMEmVZzw
	JYHY0y7DYI/BPxaF6k8Mra5td28tIjI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 09/17] tools/xenstore: replace literal domid 0 with dom0_domid
Date: Tue, 17 Jan 2023 10:11:16 +0100
Message-Id: <20230117091124.22170-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some places left where dom0 is associated with domid 0.

Use dom0_domid instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c   | 5 +++--
 tools/xenstore/xenstored_domain.c | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 561fb121d3..3336e65c97 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2316,9 +2316,10 @@ static void accept_connection(int sock)
 		return;
 
 	conn = new_connection(&socket_funcs);
-	if (conn)
+	if (conn) {
 		conn->fd = fd;
-	else
+		conn->id = dom0_domid;
+	} else
 		close(fd);
 }
 #endif
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 07d91eb50c..b7777b2afd 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -326,7 +326,7 @@ static int destroy_domain(void *_domain)
 	if (domain->interface) {
 		/* Domain 0 was mapped by dom0_init, so it must be unmapped
 		   using munmap() and not the grant unmap call. */
-		if (domain->domid == 0)
+		if (domain->domid == dom0_domid)
 			unmap_xenbus(domain->interface);
 		else
 			unmap_interface(domain->interface);
@@ -410,7 +410,7 @@ void handle_event(void)
 
 static bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != 0 && domid != priv_domid;
+	return domid != dom0_domid && domid != priv_domid;
 }
 
 bool domain_is_unprivileged(struct connection *conn)
@@ -798,7 +798,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (!domid)
+	if (domid == dom0_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1004,7 +1004,7 @@ static int chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
 
-	if (!xc_handle && domid == 0)
+	if (!xc_handle && domid == dom0_domid)
 		return 1;
 
 	d = find_domain_struct(domid);
-- 
2.35.3



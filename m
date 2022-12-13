Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E064B939
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460787.718850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mQ-0008JM-2o; Tue, 13 Dec 2022 16:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460787.718850; Tue, 13 Dec 2022 16:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mP-0008Ci-TJ; Tue, 13 Dec 2022 16:05:17 +0000
Received: by outflank-mailman (input) for mailman id 460787;
 Tue, 13 Dec 2022 16:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jA-0001dt-J0
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:01:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76f95091-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:01:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF5AE1FDAE;
 Tue, 13 Dec 2022 16:01:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABEB9138EE;
 Tue, 13 Dec 2022 16:01:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ns2hKPKhmGMAKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:01:54 +0000
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
X-Inumbo-ID: 76f95091-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0PY04YTlNHfpxJX5B2TwZQKHcJ1RMK8FOhlgYczIF8=;
	b=FHuvMg/GdBCUTgScDY29glnNT7ai2GLFgXFlm3LLu6IJXwN10trVg0Ymh5UmLkQx9Cgqqe
	ENaqd4+HPcO9vgZEgBO1NtGHFizNQeAbAGv5VrX2pP8VfZLCULduZWYiQEX6SYmpZU4U71
	QhRQTD3vOrU4yLkC4DmjiCe3ZuNaTe0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 12/19] tools/xenstore: replace literal domid 0 with dom0_domid
Date: Tue, 13 Dec 2022 17:00:38 +0100
Message-Id: <20221213160045.28170-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
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
index 61569cecbb..6c9d22b8a2 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2311,9 +2311,10 @@ static void accept_connection(int sock)
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
index 1ae79b5b54..1e9d7545b7 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -324,7 +324,7 @@ static int destroy_domain(void *_domain)
 	if (domain->interface) {
 		/* Domain 0 was mapped by dom0_init, so it must be unmapped
 		   using munmap() and not the grant unmap call. */
-		if (domain->domid == 0)
+		if (domain->domid == dom0_domid)
 			unmap_xenbus(domain->interface);
 		else
 			unmap_interface(domain->interface);
@@ -408,7 +408,7 @@ void handle_event(void)
 
 static bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != 0 && domid != priv_domid;
+	return domid != dom0_domid && domid != priv_domid;
 }
 
 bool domain_is_unprivileged(struct connection *conn)
@@ -796,7 +796,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (!domid)
+	if (domid == dom0_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1002,7 +1002,7 @@ static int chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
 
-	if (!xc_handle && domid == 0)
+	if (!xc_handle && domid == dom0_domid)
 		return 1;
 
 	d = find_domain_struct(domid);
-- 
2.35.3



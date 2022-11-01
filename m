Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4F614E70
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434893.687686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optIC-00064p-4B; Tue, 01 Nov 2022 15:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434893.687686; Tue, 01 Nov 2022 15:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optIC-00061S-0G; Tue, 01 Nov 2022 15:35:08 +0000
Received: by outflank-mailman (input) for mailman id 434893;
 Tue, 01 Nov 2022 15:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optDJ-0007Bd-Od
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:30:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ece2237-59fa-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:30:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48C743385D;
 Tue,  1 Nov 2022 15:30:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A3B71346F;
 Tue,  1 Nov 2022 15:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xksRBXw7YWNGYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:30:04 +0000
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
X-Inumbo-ID: 0ece2237-59fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXW2q3TSE2sqfE+CLKAdRKeOGAyBZRR57o9SMNJeWXg=;
	b=pc2W4hcBKUl9aOOF72kOOB4n9AKlmfC1e8IkhndZQOTiqKbPKFuijJs0z9Y6+sW1T08mzB
	OKo2cL5KltYgbWsalH1cehr4oR+QcU0I/IYnvH/9LdCL4MNVlfMNOXndZ/HgL9uIsu9yWv
	SMShbQdmKerTHLJN4putmEXddYa3JQI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 14/20] tools/xenstore: replace literal domid 0 with dom0_domid
Date: Tue,  1 Nov 2022 16:28:36 +0100
Message-Id: <20221101152842.4257-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some places left where dom0 is associated with domid 0.

Use dom0_domid instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c   | 5 +++--
 tools/xenstore/xenstored_domain.c | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 5fd4f8e606..5013f8b909 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2302,9 +2302,10 @@ static void accept_connection(int sock)
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
index 529ffb522a..0f1c903ee6 100644
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
@@ -414,7 +414,7 @@ void handle_event(void)
 
 static bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != 0 && domid != priv_domid;
+	return domid != dom0_domid && domid != priv_domid;
 }
 
 bool domain_is_unprivileged(struct connection *conn)
@@ -806,7 +806,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (!domid)
+	if (domid == dom0_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1009,7 +1009,7 @@ static int chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
 
-	if (!xc_handle && domid == 0)
+	if (!xc_handle && domid == dom0_domid)
 		return 1;
 
 	d = find_domain_struct(domid);
-- 
2.35.3



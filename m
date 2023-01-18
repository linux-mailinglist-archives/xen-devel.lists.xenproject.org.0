Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB8E671845
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480363.744755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A4-0006ex-Bd; Wed, 18 Jan 2023 09:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480363.744755; Wed, 18 Jan 2023 09:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A3-0006Z4-TX; Wed, 18 Jan 2023 09:55:15 +0000
Received: by outflank-mailman (input) for mailman id 480363;
 Wed, 18 Jan 2023 09:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI567-0001BV-TY
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:51:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e60f847-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:49:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8D8A38943;
 Wed, 18 Jan 2023 09:51:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA50B139D2;
 Wed, 18 Jan 2023 09:51:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CGJnKA3Bx2O1QwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:51:09 +0000
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
X-Inumbo-ID: 6e60f847-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JygJ73dFwifI6ssavbJqcYd36Sd+BW/DYAxzWFIM7/E=;
	b=EWH3SMhILww2gpd7hcJIBv6pnJY5T6DNSm6IluXhNmNvXorOLLMoyhpVgslfea9FYh7kFl
	tkz8S6AnDa8gbXiqSJb8dvX4WFRx0d3YT8UmGkIxAzB0t5X+mccVv4wPDU86m3OWF1Mpkd
	amtqAPLq9mM3QUDZoWYlWoB2+LIEgxs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 09/17] tools/xenstore: replace literal domid 0 with dom0_domid
Date: Wed, 18 Jan 2023 10:50:08 +0100
Message-Id: <20230118095016.13091-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
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
index 4582ee39e1..9cfde76898 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2297,9 +2297,10 @@ static void accept_connection(int sock)
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
index 703ddeec4e..a703c0ef47 100644
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



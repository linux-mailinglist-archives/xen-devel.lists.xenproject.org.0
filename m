Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2B614E8B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434972.687916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQO-00035d-RB; Tue, 01 Nov 2022 15:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434972.687916; Tue, 01 Nov 2022 15:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQO-0002tJ-Ky; Tue, 01 Nov 2022 15:43:36 +0000
Received: by outflank-mailman (input) for mailman id 434972;
 Tue, 01 Nov 2022 15:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optDD-0007Bd-Ln
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b7c0860-59fa-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:29:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B0D111F8E3;
 Tue,  1 Nov 2022 15:29:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 828381346F;
 Tue,  1 Nov 2022 15:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7z17HnY7YWMYYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:58 +0000
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
X-Inumbo-ID: 0b7c0860-59fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0EnVO0aZYolAaiP6qGG7pTwSLxkIEF5XkBdvMekgyk=;
	b=hHzm9gqbBIbfmvXUshM5RoHjqnOu/zNp8CQR1IJ87mbtBAEmKfoIblzWK+VjbElb5T/OEu
	XdPBz/nP50myYPQJ2i/WT/tJCJX9CJhnZQJfrAFgJiHv3hVd1+VDlls8DXO+7G1RuWFXYK
	8y2zmaa//bnv7roGpGGHu5LFXRL/FXo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes in a transaction
Date: Tue,  1 Nov 2022 16:28:35 +0100
Message-Id: <20221101152842.4257-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The accounting for the number of nodes of a domain in an active
transaction is not working correctly, as it allows to create arbitrary
number of nodes. The transaction will finally fail due to exceeding
the number of nodes quota, but before closing the transaction an
unprivileged guest could cause Xenstore to use a lot of memory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index b737a77683..529ffb522a 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1125,9 +1125,8 @@ int domain_nbentry_fix(unsigned int domid, int num, bool update)
 
 int domain_nbentry(struct connection *conn)
 {
-	return (domain_is_unprivileged(conn))
-		? conn->domain->nbentry
-		: 0;
+	return domain_is_unprivileged(conn)
+	       ? domain_nbentry_add(conn, conn->id, 0, true) : 0;
 }
 
 static bool domain_chk_quota(struct domain *domain, int mem)
-- 
2.35.3



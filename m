Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2F96FAED6
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531396.827018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLY-0004IS-T5; Mon, 08 May 2023 11:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531396.827018; Mon, 08 May 2023 11:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLY-0004FV-O8; Mon, 08 May 2023 11:48:04 +0000
Received: by outflank-mailman (input) for mailman id 531396;
 Mon, 08 May 2023 11:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzLX-0004FA-FD
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:48:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe7edf1-ed96-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:48:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2EBB71FE44;
 Mon,  8 May 2023 11:48:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3D831346B;
 Mon,  8 May 2023 11:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gPc8NnHhWGTqNgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:48:01 +0000
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
X-Inumbo-ID: 2fe7edf1-ed96-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR2CaVJDZ2qBizxTmbgLfYMIkR5bcQwiTfYf2yndaVw=;
	b=pehhPTg8kefxiDW5MIBGt/y393LQvpAZR7F5d+4PVz12T+VQQKbZhkX/8Zf6pwY/ODnIWD
	dRDm7rhx+bTK8yU34cxJRGR9B2ZM/f0oEDOZrKQiGwdO9HZ5QCzb6f3nVENVjAfkPxyIdx
	8wqG/A7vfacW6kIo/sGGdPwxTrU4Gm0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 01/14] tools/xenstore: take transaction internal nodes into account for quota
Date: Mon,  8 May 2023 13:47:41 +0200
Message-Id: <20230508114754.31514-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508114754.31514-1-jgross@suse.com>
References: <20230508114754.31514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The accounting for the number of nodes of a domain in an active
transaction is not working correctly, as it is checking the node quota
only against the number of nodes outside the transaction.

This can result in the transaction finally failing, as node quota is
checked at the end of the transaction again.

On the other hand even in a transaction deleting many nodes, new nodes
might not be creatable, in case the node quota was already reached at
the start of the transaction.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V3:
- rewrite of commit message (Julien Grall)
---
 tools/xenstore/xenstored_domain.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index f62be2245c..dbbf97accc 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1116,9 +1116,8 @@ int domain_nbentry_fix(unsigned int domid, int num, bool update)
 
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



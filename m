Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B553A6D74F2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518229.804542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBY-0002YL-IQ; Wed, 05 Apr 2023 07:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518229.804542; Wed, 05 Apr 2023 07:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBY-0002Un-Ey; Wed, 05 Apr 2023 07:04:00 +0000
Received: by outflank-mailman (input) for mailman id 518229;
 Wed, 05 Apr 2023 07:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxBX-0002UC-4m
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:03:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a76ca9-d380-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 09:03:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35663229E9;
 Wed,  5 Apr 2023 07:03:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0655A13A31;
 Wed,  5 Apr 2023 07:03:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZzxgO1wdLWRUEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:03:56 +0000
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
X-Inumbo-ID: 08a76ca9-d380-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR2CaVJDZ2qBizxTmbgLfYMIkR5bcQwiTfYf2yndaVw=;
	b=PNm3qfd93Y9Gavr2aSfwatm6iAcArvUAkI79Ec4Tyz5JmZRSAEqnX+J++bZAENfZdrmhrV
	c0EkT/oJCwY1tWWec5KmRLnWNFn+p233Vqh67Dit3FLRkxAE9kWF+lGf+1CSX4WsBiX6gG
	WFxSSwcrukx/2dldNX1uTN9jlLZrpUY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 01/13] tools/xenstore: take transaction internal nodes into account for quota
Date: Wed,  5 Apr 2023 09:03:37 +0200
Message-Id: <20230405070349.25293-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
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



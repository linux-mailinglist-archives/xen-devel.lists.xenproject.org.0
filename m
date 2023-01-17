Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E266D971
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479157.742844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi18-0002lR-23; Tue, 17 Jan 2023 09:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479157.742844; Tue, 17 Jan 2023 09:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi17-0002iS-UY; Tue, 17 Jan 2023 09:12:29 +0000
Received: by outflank-mailman (input) for mailman id 479157;
 Tue, 17 Jan 2023 09:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi17-000725-CK
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:12:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b7f7da-9647-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:12:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 79FA7683D9;
 Tue, 17 Jan 2023 09:12:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 493381390C;
 Tue, 17 Jan 2023 09:12:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B+WyEHxmxmNvcAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:12:28 +0000
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
X-Inumbo-ID: 10b7f7da-9647-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxN+8k08vTt0nMXkeJr8ru9QvmOMBTZNPN5l16ahebE=;
	b=P/WKj3ov4+KtXochZB1lePMqmyq2VdvkXDHVrF7Ukb5Z8pdCVPkL5S78vRf479Q1V3/jPG
	nl2xTTR9/ookdhP4zN+OVj7VEYqdOlZWlAK2Dy6nz2vj+dHTdCQ85pP+cbWwd1whyOTDJE
	mYfSGxwCj6LxETmyoKoyBLaG7m9FiS0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 11/17] tools/xenstore: let chk_domain_generation() return a bool
Date: Tue, 17 Jan 2023 10:11:18 +0100
Message-Id: <20230117091124.22170-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of returning 0 or 1 let chk_domain_generation() return a
boolean value.

Simplify the only caller by removing the ret variable.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_domain.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 55a93eccdb..1723c9804a 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -985,20 +985,20 @@ void domain_deinit(void)
  * count (used for testing whether a node permission is older than a domain).
  *
  * Return values:
- *  0: domain has higher generation count (it is younger than a node with the
- *     given count), or domain isn't existing any longer
- *  1: domain is older than the node
+ *  false: domain has higher generation count (it is younger than a node with
+ *     the given count), or domain isn't existing any longer
+ *  true: domain is older than the node
  */
-static int chk_domain_generation(unsigned int domid, uint64_t gen)
+static bool chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
 
 	if (!xc_handle && domid == dom0_domid)
-		return 1;
+		return true;
 
 	d = find_domain_struct(domid);
 
-	return (d && d->generation <= gen) ? 1 : 0;
+	return d && d->generation <= gen;
 }
 
 /*
@@ -1033,14 +1033,12 @@ int domain_alloc_permrefs(struct node_perms *perms)
 int domain_adjust_node_perms(struct node *node)
 {
 	unsigned int i;
-	int ret;
 
 	for (i = 1; i < node->perms.num; i++) {
 		if (node->perms.p[i].perms & XS_PERM_IGNORE)
 			continue;
-		ret = chk_domain_generation(node->perms.p[i].id,
-					    node->generation);
-		if (!ret)
+		if (!chk_domain_generation(node->perms.p[i].id,
+					   node->generation))
 			node->perms.p[i].perms |= XS_PERM_IGNORE;
 	}
 
-- 
2.35.3



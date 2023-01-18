Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABA671841
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480367.744772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A5-00074d-IB; Wed, 18 Jan 2023 09:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480367.744772; Wed, 18 Jan 2023 09:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A5-0006oW-5l; Wed, 18 Jan 2023 09:55:17 +0000
Received: by outflank-mailman (input) for mailman id 480367;
 Wed, 18 Jan 2023 09:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI56J-0001BV-1g
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:51:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750c1099-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:49:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 129CB38943;
 Wed, 18 Jan 2023 09:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8982139D2;
 Wed, 18 Jan 2023 09:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MpKXMxjBx2PGQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:51:20 +0000
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
X-Inumbo-ID: 750c1099-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2z17Fy8IKw0wJOQh7mD0U1wwu980af840nk2P0cdMiQ=;
	b=Ogm0rr4+ZBh+pjO1bVJmCsaFnBqSuWQs7+Uecg3aCdeRbDOj65q3gvs0rU1mpRhJTi8yUq
	sOdFOEONydKLBYW4UPh2WCSgGKlcaihgIMtRjh3kFnxN+RaleDumdbTW/d4YkziP0iTKa5
	IEb3YRWlgRHxCRhNJb/E+7bCPQlB/Hs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 11/17] tools/xenstore: let chk_domain_generation() return a bool
Date: Wed, 18 Jan 2023 10:50:10 +0100
Message-Id: <20230118095016.13091-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
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
index 10880a32d9..391395060e 100644
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



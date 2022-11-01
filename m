Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B7614E4C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434830.687471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCG-0007rq-O8; Tue, 01 Nov 2022 15:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434830.687471; Tue, 01 Nov 2022 15:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCG-0007oc-Jn; Tue, 01 Nov 2022 15:29:00 +0000
Received: by outflank-mailman (input) for mailman id 434830;
 Tue, 01 Nov 2022 15:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optCE-0007Tl-Fg
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:28:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ee5cff-59f9-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:28:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6151F2256A;
 Tue,  1 Nov 2022 15:28:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 312DD1346F;
 Tue,  1 Nov 2022 15:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ycfICTk7YWOJYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:28:57 +0000
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
X-Inumbo-ID: e6ee5cff-59f9-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wnyre0lY6vh0o8N40Ag5noXJoA9j7rscMFp/jnaPIq8=;
	b=Zn1xF+Ym/ToL4Sea/vmyDRyR+YP9a0QGM/fOrIlRVDmhnWgjY67i9mtfxFj+fd6smJpMfC
	dB3+Hf2D27zHF24nuIjT/U7cH1kDHYB1SykNnHSFKuvibo1HnoNn504Bdgdo+L9ekqltmu
	8A0EqqpmOYtjJ6oRGv3Q+TCaPMIcrUU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 02/20] tools/xenstore: call remove_domid_from_perm() for special nodes
Date: Tue,  1 Nov 2022 16:28:24 +0100
Message-Id: <20221101152842.4257-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When destroying a domain, any stale permissions of the domain must be
removed from the special nodes "@...", too. This was not done in the
fix for XSA-322.

Fixes: 496306324d8d ("tools/xenstore: revoke access rights for removed domains")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_domain.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 84b7817cd5..aa86892fed 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -227,6 +227,27 @@ static void unmap_interface(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
+static void remove_domid_from_perm(struct node_perms *perms,
+				   struct domain *domain)
+{
+	unsigned int cur, new;
+
+	if (perms->p[0].id == domain->domid)
+		perms->p[0].id = priv_domid;
+
+	for (cur = new = 1; cur < perms->num; cur++) {
+		if (perms->p[cur].id == domain->domid)
+			continue;
+
+		if (new != cur)
+			perms->p[new] = perms->p[cur];
+
+		new++;
+	}
+
+	perms->num = new;
+}
+
 static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 				  struct node *node, void *arg)
 {
@@ -277,6 +298,9 @@ static void domain_tree_remove(struct domain *domain)
 			syslog(LOG_ERR,
 			       "error when looking for orphaned nodes\n");
 	}
+
+	remove_domid_from_perm(&dom_release_perms, domain);
+	remove_domid_from_perm(&dom_introduce_perms, domain);
 }
 
 static int destroy_domain(void *_domain)
-- 
2.35.3



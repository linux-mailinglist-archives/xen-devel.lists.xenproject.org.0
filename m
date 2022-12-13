Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602064B937
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460768.718801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mF-0006M9-Ln; Tue, 13 Dec 2022 16:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460768.718801; Tue, 13 Dec 2022 16:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mF-0006By-9d; Tue, 13 Dec 2022 16:05:07 +0000
Received: by outflank-mailman (input) for mailman id 460768;
 Tue, 13 Dec 2022 16:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jK-0001dt-Ud
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:02:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d9edf47-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:02:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1423A1FDAE;
 Tue, 13 Dec 2022 16:02:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7809138EE;
 Tue, 13 Dec 2022 16:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dERXM/2hmGMfKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:02:05 +0000
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
X-Inumbo-ID: 7d9edf47-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdgZ1VuZvqNGh5getUJSQZgnrcQ2jyvptjdFRbrPjw4=;
	b=GpEsvWQy3SoCa9waloGggwBG82cl58uECCxZ+kAUvCqZA7TFvgmltanbkVtAgW1tZibY2x
	CHojaVNLmxjkdNpOsbr54U+RpaffMZiBoi/GJLW1YmT3oWaqfXr4WE0UhkbWlZvcIUWVWS
	hckQM5B4apb/mxBF683Lu7Wz2vp1k9o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 14/19] tools/xenstore: let chk_domain_generation() return a bool
Date: Tue, 13 Dec 2022 17:00:40 +0100
Message-Id: <20221213160045.28170-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
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
index a3ecdb382f..65e94e3822 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -983,20 +983,20 @@ void domain_deinit(void)
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
@@ -1031,14 +1031,12 @@ int domain_alloc_permrefs(struct node_perms *perms)
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



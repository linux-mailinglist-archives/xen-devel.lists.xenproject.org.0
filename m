Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F22511886
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315103.533474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nji5M-0004fS-3m; Wed, 27 Apr 2022 13:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315103.533474; Wed, 27 Apr 2022 13:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nji5M-0004cZ-0j; Wed, 27 Apr 2022 13:52:04 +0000
Received: by outflank-mailman (input) for mailman id 315103;
 Wed, 27 Apr 2022 13:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nji5J-0004PU-VN
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:52:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3432b235-c631-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:51:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63019210E3;
 Wed, 27 Apr 2022 13:52:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 300EC13A39;
 Wed, 27 Apr 2022 13:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BqN+CoBKaWLCZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 13:52:00 +0000
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
X-Inumbo-ID: 3432b235-c631-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651067520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n+/KEendKGadoDH+AX3puD7Zz06wWWTVBGohmKBxpbM=;
	b=FFW+6EOrcj/T3o1d5ar/qckvvuB+pph4yEN9XrrQOx7J9E/0DuCaH+N9a2XVLPuTjFxWty
	qIx0xy/GOnmJz27xF6BmiL+YNVUw7jB2bt39ef3WUZscznJYONq6BJLjTGcOHE8we4+HHs
	vrwrcmkCtmWPtxhPn8mMuGkg4vPQEM8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Raphael Ning <raphning@gmail.com>
Subject: [PATCH] tools/xenstore: don't let special watches be children of /
Date: Wed, 27 Apr 2022 15:51:56 +0200
Message-Id: <20220427135156.4605-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When firing special watches (e.g. "@releaseDomain"), they will be
regarded to be valid children of the "/" node. So a domain having
registered a watch for "/" and having the privilege to receive
the special watches will receive those special watch events for the
registered "/" watch.

Fix that by calling the related fire_watches() with the "exact"
parameter set to true, causing a mismatch for the "/" node.

Reported-by: Raphael Ning <raphning@gmail.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index ae065fcbee..80ba1d627b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -231,7 +231,7 @@ static int destroy_domain(void *_domain)
 			unmap_interface(domain->interface);
 	}
 
-	fire_watches(NULL, domain, "@releaseDomain", NULL, false, NULL);
+	fire_watches(NULL, domain, "@releaseDomain", NULL, true, NULL);
 
 	wrl_domain_destroy(domain);
 
@@ -282,7 +282,7 @@ void check_domains(void)
 	}
 
 	if (notify)
-		fire_watches(NULL, NULL, "@releaseDomain", NULL, false, NULL);
+		fire_watches(NULL, NULL, "@releaseDomain", NULL, true, NULL);
 }
 
 /* We scan all domains rather than use the information given here. */
@@ -495,7 +495,7 @@ static struct domain *introduce_domain(const void *ctx,
 
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
-				     false, NULL);
+				     true, NULL);
 	} else {
 		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
 		if (domain->port)
-- 
2.34.1



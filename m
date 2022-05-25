Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F86533B07
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 12:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337117.561626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntogE-0005LF-Sx; Wed, 25 May 2022 10:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337117.561626; Wed, 25 May 2022 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntogE-0005Hm-Pu; Wed, 25 May 2022 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 337117;
 Wed, 25 May 2022 10:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ntogD-0005Hg-BA
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 10:55:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e477cb4-dc19-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 12:55:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C53631F94C;
 Wed, 25 May 2022 10:55:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9818F13ADF;
 Wed, 25 May 2022 10:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dO6sIzcLjmKefgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 25 May 2022 10:55:51 +0000
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
X-Inumbo-ID: 3e477cb4-dc19-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653476151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ckeYyo67212NXGIzF5GamiYsJLXQg8ru+tyMx+nMhEo=;
	b=A4QjohEWkQQhIsF2iQsc1aG/DEI8folCL/+4Zp8e9PT3WxN5QSaxLczTAY760earxK3elZ
	/g9MzYBC9Yy1w4wK9HmbvjJ5yZP+CaBElyEcBkgsIkViiPMp37DKlVF+Rsr94E1bJLTXkg
	C9jalbtm8BqF2vH4gq/uc2BR0IHb1yA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: fix event sending in introduce_domain()
Date: Wed, 25 May 2022 12:55:49 +0200
Message-Id: <20220525105549.30184-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fc2b57c9af46 ("xenstored: send an evtchn notification on
introduce_domain") introduced a potential NULL dereference in case of
Xenstore live update.

Fix that by adding an appropriate check.

Coverity-Id: 1504572
Fixes: fc2b57c9af46 ("xenstored: send an evtchn notification on introduce_domain")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index de88bf2a68..ead4c237d2 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -493,9 +493,11 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
-		/* Notify the domain that xenstore is available */
-		interface->connection = XENSTORE_CONNECTED;
-		xenevtchn_notify(xce_handle, domain->port);
+		if (!restore) {
+			/* Notify the domain that xenstore is available */
+			interface->connection = XENSTORE_CONNECTED;
+			xenevtchn_notify(xce_handle, domain->port);
+		}
 
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
-- 
2.35.3



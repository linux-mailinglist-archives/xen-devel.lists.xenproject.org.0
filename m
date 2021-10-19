Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91F433496
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213028.371120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnBh-0000fA-E9; Tue, 19 Oct 2021 11:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213028.371120; Tue, 19 Oct 2021 11:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnBh-0000dN-Ac; Tue, 19 Oct 2021 11:21:45 +0000
Received: by outflank-mailman (input) for mailman id 213028;
 Tue, 19 Oct 2021 11:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcnBg-0000dH-HC
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:21:44 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec1c0218-679b-49d5-b6c0-69dc2d4f7723;
 Tue, 19 Oct 2021 11:21:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9251621A5D;
 Tue, 19 Oct 2021 11:21:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F0AD13B64;
 Tue, 19 Oct 2021 11:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id obzHGUaqbmHvbAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 11:21:42 +0000
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
X-Inumbo-ID: ec1c0218-679b-49d5-b6c0-69dc2d4f7723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634642502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Bsjm34oU7y3pSkCQQqWxgmwlC+hZeXr6taiQjgu1WUA=;
	b=J8GtlNiEgia7Z5PVFRhYonYLv4mz4AuqppfaXY5AX71VWg5A77IlAQGqvTzQaRF9S7EOFZ
	AR+zGxCSp/rKKPTktAUujF4HZoRtpaB7cAVMR+1LzludHraZp7XWQdByiukHu6jkRRVy5/
	5ki32Y+OGNIBdeq1IfnXFk6n7LGFsNM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools: fix oom setting of xenstored
Date: Tue, 19 Oct 2021 13:21:40 +0200
Message-Id: <20211019112140.26988-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f282182af32939 ("tools/xenstore: set oom score for xenstore
daemon on Linux") introduced a regression when not setting the oom
value in the xencommons file. Fix that.

Fixes: f282182af32939 ("tools/xenstore: set oom score for xenstore daemon on Linux")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2: use ${var:-} (Jan Beulich)
---
 tools/hotplug/Linux/launch-xenstore.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 8438af9977..e854ca1eb8 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -60,8 +60,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 		echo "No xenstored found"
 		exit 1
 	}
-	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
-	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
+	XS_OOM_SCORE=-$((${XENSTORED_OOM_MEM_THRESHOLD:-50} * 10))
 
 	[ "$XENSTORED_MAX_OPEN_FDS" = "unlimited" ] || {
 		[ -z "${XENSTORED_MAX_OPEN_FDS//[0-9]}" ] &&
-- 
2.26.2



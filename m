Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D15432CDC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 06:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212639.370594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcgwK-0007A7-UT; Tue, 19 Oct 2021 04:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212639.370594; Tue, 19 Oct 2021 04:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcgwK-00077d-RT; Tue, 19 Oct 2021 04:41:28 +0000
Received: by outflank-mailman (input) for mailman id 212639;
 Tue, 19 Oct 2021 04:41:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcgwJ-00077X-Ei
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 04:41:27 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d124ab18-3096-11ec-82fd-12813bfff9fa;
 Tue, 19 Oct 2021 04:41:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 147241FD8A;
 Tue, 19 Oct 2021 04:41:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2EB313C5C;
 Tue, 19 Oct 2021 04:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lpIwNnRMbmHdMgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 04:41:24 +0000
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
X-Inumbo-ID: d124ab18-3096-11ec-82fd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634618485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Hs3bU4aT9bwXquQpTV6SvDWgRHlT2YNCRl1zv/sJFoI=;
	b=DXLVrh9obNjgFJIjuloW39HvozOu5UEXBuLxppYuO4v1b2Ekq9mPteIWLuZdTYjFTiIxgs
	BaV3sRYY7DTFyHM4IB0qcl+SKwPXySSfnuxHnkBqlxeGHH2t92DfGtXkSVlyRHCoB9/n3D
	u+NI9JuRR8rMq3EVIFP+kazupUcMyxU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools: fix oom setting of xenstored
Date: Tue, 19 Oct 2021 06:41:23 +0200
Message-Id: <20211019044123.29648-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f282182af32939 ("tools/xenstore: set oom score for xenstore
daemon on Linux") introduced a regression when not setting the oom
value in the xencommons file. Fix that.

Fixes: f282182af32939 ("tools/xenstore: set oom score for xenstore daemon on Linux")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/hotplug/Linux/launch-xenstore.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 8438af9977..2b99b98896 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -60,7 +60,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 		echo "No xenstored found"
 		exit 1
 	}
-	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
+	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] && XENSTORED_OOM_MEM_THRESHOLD=50
 	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
 
 	[ "$XENSTORED_MAX_OPEN_FDS" = "unlimited" ] || {
-- 
2.26.2



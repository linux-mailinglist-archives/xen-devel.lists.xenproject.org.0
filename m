Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AE508232
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308940.524882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o9-0007AF-T2; Wed, 20 Apr 2022 07:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308940.524882; Wed, 20 Apr 2022 07:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o9-00072n-NA; Wed, 20 Apr 2022 07:31:25 +0000
Received: by outflank-mailman (input) for mailman id 308940;
 Wed, 20 Apr 2022 07:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh4o8-0006Tb-BJ
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:31:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfdddeec-c07b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 09:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8615D2112B;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5694C13A30;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wED1E8m2X2IhXAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 07:31:21 +0000
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
X-Inumbo-ID: dfdddeec-c07b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650439881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ofN2RF9Ov3D5sC5yESVJrU8I3one2H23BuRvfynNlI=;
	b=CFYyAfwKtHfiGQPN8PiSdhC2b12FJrOUyq3casjWcZCNkvp7W9stmazsqnXa4o/RhhTyeb
	MP/iSlvFo1wX/n/wZnwJjJeIbS2HQjVU/qQzGB2Hhj/P/NIyaGKm9k2L964JCsnPGxZTA+
	GeWxLSGo7DqukzpY3u4yJFuYIlGl5tQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/4] tools/libs/guest: don't set errno to a negative value
Date: Wed, 20 Apr 2022 09:31:18 +0200
Message-Id: <20220420073119.16974-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420073119.16974-1-jgross@suse.com>
References: <20220420073119.16974-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting errno to a negative error value makes no sense.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index c17cf9f712..c4f4e7f3e2 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -855,7 +855,7 @@ int xc_dom_devicetree_file(struct xc_dom_image *dom, const char *filename)
         return -1;
     return 0;
 #else
-    errno = -EINVAL;
+    errno = EINVAL;
     return -1;
 #endif
 }
-- 
2.34.1



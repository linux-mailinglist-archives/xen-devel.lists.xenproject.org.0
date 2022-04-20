Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C216A508233
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308938.524861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o8-0006aZ-26; Wed, 20 Apr 2022 07:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308938.524861; Wed, 20 Apr 2022 07:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o7-0006Wx-SS; Wed, 20 Apr 2022 07:31:23 +0000
Received: by outflank-mailman (input) for mailman id 308938;
 Wed, 20 Apr 2022 07:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh4o6-0006Tb-HZ
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:31:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfbc2d0b-c07b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 09:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50E2A21118;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BDD913A30;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uP1yCcm2X2IhXAAAMHmgww
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
X-Inumbo-ID: dfbc2d0b-c07b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650439881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FxRXq43vu3ZI41xgmHwfTdmhBdkORLelAm0BLwTOuQ=;
	b=WtuoKBr+cHd3CbctZ9p3xKHGwbLgDxlIEb53eZqpcQxIugMjXgVFWC+Bfh5Sjrjisby+5K
	4vEqxztDDGBcOJtRcRRZ56I80JDP0SCWyBenIFgUHzXlHcDgxNZQUQCWdddvf6Q4AuxID1
	Id3GwYvJqVwnVA9Y3zDh9SZ4C1r6xlI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/4] tools/libs/ctrl: don't set errno to a negative value
Date: Wed, 20 Apr 2022 09:31:17 +0200
Message-Id: <20220420073119.16974-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420073119.16974-1-jgross@suse.com>
References: <20220420073119.16974-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The claimed reason for setting errno to -1 is wrong. On x86
xc_domain_pod_target() will set errno to a sane value in the error
case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/xc_domain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index ef62f66009..71608c00e9 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1293,9 +1293,7 @@ int xc_domain_get_pod_target(xc_interface *xch,
                              uint64_t *pod_cache_pages,
                              uint64_t *pod_entries)
 {
-    /* On x86 (above) xc_domain_pod_target will incorrectly return -1
-     * with errno==-1 on error. Do the same for least surprise. */
-    errno = -1;
+    errno = EOPNOTSUPP;
     return -1;
 }
 #endif
-- 
2.34.1



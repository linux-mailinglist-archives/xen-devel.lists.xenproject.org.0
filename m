Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6855E508230
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308941.524899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4oB-0007YE-9Z; Wed, 20 Apr 2022 07:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308941.524899; Wed, 20 Apr 2022 07:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4oB-0007Se-2w; Wed, 20 Apr 2022 07:31:27 +0000
Received: by outflank-mailman (input) for mailman id 308941;
 Wed, 20 Apr 2022 07:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh4o9-0006Tb-Bi
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:31:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dffdddbc-c07b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 09:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA2DA2129B;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C00F13A30;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Df0IMm2X2IhXAAAMHmgww
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
X-Inumbo-ID: dffdddbc-c07b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650439881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJP8UFG+Q9kAlZKRDuHPR38rUH2iyFSN6K0QfjZvvLU=;
	b=Ovt4EYJETbGH7VdDHAuTVyN/BTeMneYJiZxMS+aIokt9TIBLIMAXjnFd0Owa3s10y35Qae
	c9EGHttEJi/XCCazDcKM69R8xDJoQxcExc+g/3XzvsbTWCLCusURcU97q90mLlO1Ij6vcI
	aNnXVTV/gqcKSeZegnmti3RaaSlnSlY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/4] tools/libs/light: don't set errno to a negative value
Date: Wed, 20 Apr 2022 09:31:19 +0200
Message-Id: <20220420073119.16974-5-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420073119.16974-1-jgross@suse.com>
References: <20220420073119.16974-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting errno to a negative value makes no sense.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index 8d62dfd255..27f2bce718 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -288,7 +288,7 @@ int libxl__pci_topology_init(libxl__gc *gc,
         if (i == num_devs) {
             LOG(ERROR, "Too many devices");
             err = ERROR_FAIL;
-            errno = -ENOSPC;
+            errno = ENOSPC;
             goto out;
         }
 
-- 
2.34.1



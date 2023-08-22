Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26D783C91
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 11:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588327.919826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNQO-0000Ty-U5; Tue, 22 Aug 2023 09:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588327.919826; Tue, 22 Aug 2023 09:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNQO-0000R6-Qu; Tue, 22 Aug 2023 09:11:44 +0000
Received: by outflank-mailman (input) for mailman id 588327;
 Tue, 22 Aug 2023 09:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qkm5=EH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qYNQN-0000R0-V8
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 09:11:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e86ac024-40cb-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 11:11:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE0E122C00;
 Tue, 22 Aug 2023 09:11:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8EB4132B9;
 Tue, 22 Aug 2023 09:11:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pJfbK8x75GTrfgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Aug 2023 09:11:40 +0000
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
X-Inumbo-ID: e86ac024-40cb-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692695500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rgRK/+wO5bE0BEKzv9bthbQwjatmS8j+HdBI8x6U6ZM=;
	b=ldBC8Xui7pYT0R3+ZDSRwHnMWOPZaCvMEJFGV432hd/Ebc4h9Fb5G+0AAxF4hZ44nhUyV/
	LVPbuuMW68UqWaFRKfma4SDWDPkl4aM68Hxn1zBPFQJffjW2An5eV7jvL8YXllGWuDoXF7
	gRSsJd70t4TZfXmTPK0NFSyxMsKF9yE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] xenbus: fix error exit in xenbus_init()
Date: Tue, 22 Aug 2023 11:11:38 +0200
Message-Id: <20230822091138.4765-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case an error occurs in xenbus_init(), xen_store_domain_type should
be set to XS_UNKNOWN.

Fix one instance where this action is missing.

Fixes: 5b3353949e89 ("xen: add support for initializing xenstore later as HVM domain")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202304200845.w7m4kXZr-lkp@intel.com/
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 639bf628389b..3205e5d724c8 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -1025,7 +1025,7 @@ static int __init xenbus_init(void)
 			if (err < 0) {
 				pr_err("xenstore_late_init couldn't bind irq err=%d\n",
 				       err);
-				return err;
+				goto out_error;
 			}
 
 			xs_init_irq = err;
-- 
2.35.3



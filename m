Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29893411288
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190531.340335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSG9N-00052y-KD; Mon, 20 Sep 2021 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190531.340335; Mon, 20 Sep 2021 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSG9N-0004zz-HF; Mon, 20 Sep 2021 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 190531;
 Mon, 20 Sep 2021 10:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSG9M-0004zt-Cd
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:03:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b9a13ae-19fa-11ec-b869-12813bfff9fa;
 Mon, 20 Sep 2021 10:03:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A0AF72004C;
 Mon, 20 Sep 2021 10:03:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76661139F0;
 Mon, 20 Sep 2021 10:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QViJG4JcSGFrVgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 10:03:46 +0000
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
X-Inumbo-ID: 0b9a13ae-19fa-11ec-b869-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632132226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ivJziB2O5eFrbTydHKD9ChXEfjN0ENtyaE/rDNMKk0Q=;
	b=cZgMUi8gadqqqojok7RDjUHPHmU55H/Sv/j8a8W/FgBoU9GGROExHxlTI3pGQIV16Y8bAZ
	LMRAfIvGkJfhKjd8jFSogY2ylM0LvNLvjC9rWM7JgAJQp1ChOuN4H4PnIVsNncShIP782F
	3W9Ec46o2+0FgAgHYg1BRZkiNlZAuCE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/balloon: fix balloon kthread freezing
Date: Mon, 20 Sep 2021 12:03:45 +0200
Message-Id: <20210920100345.21939-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a
workqueue") switched the Xen balloon driver to use a kernel thread.
Unfortunately the patch omitted to call try_to_freeze() or to use
wait_event_freezable_timeout(), causing a system suspend to fail.

Fixes: 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a workqueue")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 2d2803883306..43ebfe36ac27 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -522,8 +522,8 @@ static int balloon_thread(void *unused)
 			timeout = 3600 * HZ;
 		credit = current_credit();
 
-		wait_event_interruptible_timeout(balloon_thread_wq,
-				 balloon_thread_cond(state, credit), timeout);
+		wait_event_freezable_timeout(balloon_thread_wq,
+			balloon_thread_cond(state, credit), timeout);
 
 		if (kthread_should_stop())
 			return 0;
-- 
2.26.2



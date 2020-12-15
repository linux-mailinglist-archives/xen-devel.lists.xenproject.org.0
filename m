Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD012DABA9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53069.92597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8EQ-00061o-RJ; Tue, 15 Dec 2020 11:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53069.92597; Tue, 15 Dec 2020 11:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8EQ-00061S-Nh; Tue, 15 Dec 2020 11:11:02 +0000
Received: by outflank-mailman (input) for mailman id 53069;
 Tue, 15 Dec 2020 11:11:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp8EP-00061N-IQ
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:11:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5c952a7-bc3c-47b9-91d1-7ee7f1708b2e;
 Tue, 15 Dec 2020 11:10:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF0FAAC7F;
 Tue, 15 Dec 2020 11:10:58 +0000 (UTC)
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
X-Inumbo-ID: e5c952a7-bc3c-47b9-91d1-7ee7f1708b2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608030658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Yx7SevcBUttZRGBUgn4zpJi1UCc9qXZWWCyxJCQZZZI=;
	b=NV7BwIrwiGRFQaAQ96DIiW1UlD6Hby+vHIu/rM2INcEJ1fag87Bf4iwtbi51xV/LVwhL4h
	8vQ2G9q4P3cv2r+JkeedQ6A/lETc6SGYmEbelS/G9TIUSq5fWDNBu0M8Hiqz3azUYnoYa2
	yLUH8ytqC/GKmzvACYDQwY9AVnV1Yxw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
Date: Tue, 15 Dec 2020 12:10:55 +0100
Message-Id: <20201215111055.3810-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case a process waits for any Xenstore action in the xenbus driver
it should be interruptible by signals.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't special case SIGKILL as libxenstore is handling -EINTR fine
---
 drivers/xen/xenbus/xenbus_xs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 3a06eb699f33..17c8f8a155fd 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -205,8 +205,15 @@ static bool test_reply(struct xb_req_data *req)
 
 static void *read_reply(struct xb_req_data *req)
 {
+	int ret;
+
 	do {
-		wait_event(req->wq, test_reply(req));
+		ret = wait_event_interruptible(req->wq, test_reply(req));
+
+		if (ret == -ERESTARTSYS && signal_pending(current)) {
+			req->msg.type = XS_ERROR;
+			return ERR_PTR(-EINTR);
+		}
 
 		if (!xenbus_ok())
 			/*
-- 
2.26.2



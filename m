Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C033E76D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 04:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98538.186983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMMUi-0006UM-Pm; Wed, 17 Mar 2021 03:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98538.186983; Wed, 17 Mar 2021 03:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMMUi-0006U0-Kp; Wed, 17 Mar 2021 03:05:12 +0000
Received: by outflank-mailman (input) for mailman id 98538;
 Wed, 17 Mar 2021 03:05:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dM0Y=IP=linux.alibaba.com=jiapeng.chong@srs-us1.protection.inumbo.net>)
 id 1lMMUh-0006Tv-78
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 03:05:11 +0000
Received: from out30-133.freemail.mail.aliyun.com (unknown [115.124.30.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e544caa-ce6e-4322-a560-740453efbcfc;
 Wed, 17 Mar 2021 03:05:09 +0000 (UTC)
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0USD1H6X_1615950300) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 17 Mar 2021 11:05:06 +0800
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
X-Inumbo-ID: 8e544caa-ce6e-4322-a560-740453efbcfc
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0USD1H6X_1615950300;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] xen/evtchn: replace if (cond) BUG() with BUG_ON()
Date: Wed, 17 Mar 2021 11:04:59 +0800
Message-Id: <1615950299-96787-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1

Fix the following coccicheck warnings:

./drivers/xen/evtchn.c:412:2-5: WARNING: Use BUG_ON instead of if
condition followed by BUG.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/xen/evtchn.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index c99415a..b1c59bc 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -408,8 +408,7 @@ static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
 err:
 	/* bind failed, should close the port now */
 	close.port = port;
-	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
-		BUG();
+	BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0);
 	del_evtchn(u, evtchn);
 	return rc;
 }
-- 
1.8.3.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36D30BC41
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 11:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80446.147230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6t84-0006h7-KY; Tue, 02 Feb 2021 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80446.147230; Tue, 02 Feb 2021 10:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6t84-0006gk-Gj; Tue, 02 Feb 2021 10:41:52 +0000
Received: by outflank-mailman (input) for mailman id 80446;
 Tue, 02 Feb 2021 10:18:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJTJ=HE=linux.alibaba.com=jiapeng.chong@srs-us1.protection.inumbo.net>)
 id 1l6sl6-0003Y6-Oi
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 10:18:08 +0000
Received: from out30-54.freemail.mail.aliyun.com (unknown [115.124.30.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26385483-e477-4f9f-8c2b-1f1de3014811;
 Tue, 02 Feb 2021 10:18:05 +0000 (UTC)
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UNfdAcH_1612261072) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Feb 2021 18:17:59 +0800
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
X-Inumbo-ID: 26385483-e477-4f9f-8c2b-1f1de3014811
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0UNfdAcH_1612261072;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	kafai@fb.com,
	songliubraving@fb.com,
	yhs@fb.com,
	kpsingh@kernel.org,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drivers: net: xen-netfront: Simplify the calculation of variables
Date: Tue,  2 Feb 2021 18:17:49 +0800
Message-Id: <1612261069-13315-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1

Fix the following coccicheck warnings:

./drivers/net/xen-netfront.c:1816:52-54: WARNING !A || A && B is
equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/xen-netfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index b01848e..5158841 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1813,7 +1813,7 @@ static int setup_netfront(struct xenbus_device *dev,
 	 *  a) feature-split-event-channels == 0
 	 *  b) feature-split-event-channels == 1 but failed to setup
 	 */
-	if (!feature_split_evtchn || (feature_split_evtchn && err))
+	if (!feature_split_evtchn || err)
 		err = setup_netfront_single(queue);
 
 	if (err)
-- 
1.8.3.1



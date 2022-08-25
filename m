Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE665A1681
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 18:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393512.632536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVy-0004pE-2l; Thu, 25 Aug 2022 16:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393512.632536; Thu, 25 Aug 2022 16:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVx-0004lb-Uu; Thu, 25 Aug 2022 16:15:29 +0000
Received: by outflank-mailman (input) for mailman id 393512;
 Thu, 25 Aug 2022 16:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iKVJ=Y5=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oRFVw-0004kL-Gm
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 16:15:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b03748-2491-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 18:15:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEE3361B75;
 Thu, 25 Aug 2022 16:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BC6C433C1;
 Thu, 25 Aug 2022 16:15:23 +0000 (UTC)
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
X-Inumbo-ID: 20b03748-2491-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661444124;
	bh=MyefAg5QMtTe9G45OGJvSLHtJDZ6Nxt+B/36e/BGodU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGocOxtCF6njlitkxhkDCLXDSTKPiSMqazH+G1pz6yicN6AahRiMXMtEEEItK9Qps
	 uvEEG/uCqhiG/RwFdvrNko811/8cLvyGfmpy1ojf+3AXVPH2hpliJyoO7iOxClLoBk
	 K6O74IL6AwOcRc0FvC+xt/E9jl47eJxh+RcCeLEIN8KpOoup7KuTLNbKlHQxgsQxb8
	 iF3PzTnEfbM+yyKWhqi8QHd258xLUYf0ewS8f7eOBhaEzcd8fSr2AGMBvk/zP3HBWO
	 JEJNoOAziB0la4PaewpTu4OZy6jMHBUl/q9GzmgZj9BbpKC8upnBJRDlyJHD/MOrLt
	 5nNKZoV2FGXrQ==
From: SeongJae Park <sj@kernel.org>
To: jgross@suse.com,
	roger.pau@citrix.com
Cc: marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] xen-blkfront: Advertise feature-persistent as user requested
Date: Thu, 25 Aug 2022 16:15:11 +0000
Message-Id: <20220825161511.94922-3-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825161511.94922-1-sj@kernel.org>
References: <20220825161511.94922-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter
when connect") made blkback to advertise its support of the persistent
grants feature only if the user sets the 'feature_persistent' parameter
of the driver and the frontend advertised its support of the feature.
However, following commit 402c43ea6b34 ("xen-blkfront: Apply
'feature_persistent' parameter when connect") made the blkfront to work
in the same way.  That is, blkfront also advertises its support of the
persistent grants feature only if the user sets the 'feature_persistent'
parameter of the driver and the backend advertised its support of the
feature.

Hence blkback and blkfront will never advertise their support of the
feature but wait until the other advertises the support, even though
users set the 'feature_persistent' parameters of the drivers.  As a
result, the persistent grants feature is disabled always regardless of
the 'feature_persistent' values[1].

The problem comes from the misuse of the semantic of the advertisement
of the feature.  The advertisement of the feature should means only
availability of the feature not the decision for using the feature.
However, current behavior is working in the wrong way.

This commit fixes the issue by making the blkfront advertises its
support of the feature as user requested via 'feature_persistent'
parameter regardless of the otherend's support of the feature.

[1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/

Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter when connect")
Cc: <stable@vger.kernel.org> # 5.10.x
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 drivers/block/xen-blkfront.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8e56e69fb4c4..dfae08115450 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -213,6 +213,9 @@ struct blkfront_info
 	unsigned int feature_fua:1;
 	unsigned int feature_discard:1;
 	unsigned int feature_secdiscard:1;
+	/* Connect-time cached feature_persistent parameter */
+	unsigned int feature_persistent_parm:1;
+	/* Persistent grants feature negotiation result */
 	unsigned int feature_persistent:1;
 	unsigned int bounce:1;
 	unsigned int discard_granularity;
@@ -1848,7 +1851,7 @@ static int talk_to_blkback(struct xenbus_device *dev,
 		goto abort_transaction;
 	}
 	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
-			info->feature_persistent);
+			info->feature_persistent_parm);
 	if (err)
 		dev_warn(&dev->dev,
 			 "writing persistent grants feature to xenbus");
@@ -2281,7 +2284,8 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
 		blkfront_setup_discard(info);
 
-	if (feature_persistent)
+	info->feature_persistent_parm = feature_persistent;
+	if (info->feature_persistent_parm)
 		info->feature_persistent =
 			!!xenbus_read_unsigned(info->xbdev->otherend,
 					       "feature-persistent", 0);
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE7F5A83DA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395942.635857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR31-00035E-8p; Wed, 31 Aug 2022 16:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395942.635857; Wed, 31 Aug 2022 16:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR31-00032m-3d; Wed, 31 Aug 2022 16:58:39 +0000
Received: by outflank-mailman (input) for mailman id 395942;
 Wed, 31 Aug 2022 16:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aVYg=ZD=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oTR2z-0002mU-Qt
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 16:58:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2781847d-294e-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 18:58:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C85DB8220A;
 Wed, 31 Aug 2022 16:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ED3C433D6;
 Wed, 31 Aug 2022 16:58:34 +0000 (UTC)
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
X-Inumbo-ID: 2781847d-294e-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661965114;
	bh=dAXL0+XNvWx5LNwHQHyifRYahh/pbyejlx7Mrbu9GZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Unrckl/0xd5p4L0eslkX+ocOVnSTxmyJWLFH/U+QruZmKX8gJdrduY6/CKskFoEWd
	 ISKZ9pHw2Q/FycQa5vEi4tVNKULPLkBLgmNwT1C2W/w8DAo8qh4Cy3auUpwCxehnB0
	 8LstTa/XU6ZZ0YxZbVsssX+To30Ks8YUt+o9BArCX6fGGv2Vvq65I2nUKzK116hIA+
	 MI27LA9tMdpy0d7c5dmH++0KKz2eefkDA0N57lPA4Vl5L5nGk1wsuhlV1WbZKvd3X3
	 fUptPXshdHkX8Fuoq+D9EglqVBVXgoAzpgDhaRHDEr+f2EjjxQZpAPWWYg3zQSbnjv
	 0/GI1hfVVorcQ==
From: SeongJae Park <sj@kernel.org>
To: jgross@suse.com,
	roger.pau@citrix.com
Cc: SeongJae Park <sj@kernel.org>,
	marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	ptyadav@amazon.de,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] xen-blkfront: Advertise feature-persistent as user requested
Date: Wed, 31 Aug 2022 16:58:23 +0000
Message-Id: <20220831165824.94815-3-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831165824.94815-1-sj@kernel.org>
References: <20220831165824.94815-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The advertisement of the persistent grants feature (writing
'feature-persistent' to xenbus) should mean not the decision for using
the feature but only the availability of the feature.  However, commit
74a852479c68 ("xen-blkfront: add a parameter for disabling of persistent
grants") made a field of blkfront, which was a place for saving only the
negotiation result, to be used for yet another purpose: caching of the
'feature_persistent' parameter value.  As a result, the advertisement,
which should follow only the parameter value, becomes inconsistent.

This commit fixes the misuse of the semantic by making blkfront saves
the parameter value in a separate place and advertises the support based
on only the saved value.

Fixes: 74a852479c68 ("xen-blkfront: add a parameter for disabling of persistent grants")
Cc: <stable@vger.kernel.org> # 5.10.x
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



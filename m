Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC055A83D6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395941.635845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR2z-0002ol-Ui; Wed, 31 Aug 2022 16:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395941.635845; Wed, 31 Aug 2022 16:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR2z-0002mZ-Rn; Wed, 31 Aug 2022 16:58:37 +0000
Received: by outflank-mailman (input) for mailman id 395941;
 Wed, 31 Aug 2022 16:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aVYg=ZD=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oTR2x-0002W4-O6
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 16:58:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2678888c-294e-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 18:58:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2713EB821AD;
 Wed, 31 Aug 2022 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B88C433C1;
 Wed, 31 Aug 2022 16:58:32 +0000 (UTC)
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
X-Inumbo-ID: 2678888c-294e-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661965112;
	bh=2M6XIQVeSqrPrYytDvGmk8JSZnX1cUCppYJ4t0zteug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+yj2nUL8cBvYHbhNGByKXHfolByjrFRe687uj1BUUB6mIbeXN2akLAiQRdvStbqP
	 NMb5qiC+ThAz7uY10jHDz33BEKstZU2iTWJpSn0pPMwG29otA0+v7b4oevDXX9xywt
	 daiS3FmM4D7SFz4ZS2QhL+z/hmZONNOucXCZH3i5gYjg1q8QBAYtaXJ65YwQKdQzb0
	 vUEOeCFozOnzBRrMkAQ5iuwNZdviUg+Q7J75Jt4uuZwxML8bP5XUh9fA3KShUEsq9Y
	 3L8j6pjOgw50j/r6rdnjpE4dC/uRqcRZVpRbxbOCphVbmdYWOEHGFNP8VkJoa9oNlQ
	 OeAJ+c6yTMvqA==
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
Subject: [PATCH v2 1/3] xen-blkback: Advertise feature-persistent as user requested
Date: Wed, 31 Aug 2022 16:58:22 +0000
Message-Id: <20220831165824.94815-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831165824.94815-1-sj@kernel.org>
References: <20220831165824.94815-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The advertisement of the persistent grants feature (writing
'feature-persistent' to xenbus) should mean not the decision for using
the feature but only the availability of the feature.  However, commit
aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent
grants") made a field of blkback, which was a place for saving only the
negotiation result, to be used for yet another purpose: caching of the
'feature_persistent' parameter value.  As a result, the advertisement,
which should follow only the parameter value, becomes inconsistent.

This commit fixes the misuse of the semantic by making blkback saves the
parameter value in a separate place and advertises the support based on
only the saved value.

Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
Cc: <stable@vger.kernel.org> # 5.10.x
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 drivers/block/xen-blkback/common.h | 3 +++
 drivers/block/xen-blkback/xenbus.c | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index bda5c815e441..a28473470e66 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -226,6 +226,9 @@ struct xen_vbd {
 	sector_t		size;
 	unsigned int		flush_support:1;
 	unsigned int		discard_secure:1;
+	/* Connect-time cached feature_persistent parameter value */
+	unsigned int		feature_gnt_persistent_parm:1;
+	/* Persistent grants feature negotiation result */
 	unsigned int		feature_gnt_persistent:1;
 	unsigned int		overflow_max_grants:1;
 };
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index ee7ad2fb432d..c0227dfa4688 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -907,7 +907,7 @@ static void connect(struct backend_info *be)
 	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
 
 	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
-			be->blkif->vbd.feature_gnt_persistent);
+			be->blkif->vbd.feature_gnt_persistent_parm);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
 				 dev->nodename);
@@ -1085,7 +1085,9 @@ static int connect_ring(struct backend_info *be)
 		return -ENOSYS;
 	}
 
-	blkif->vbd.feature_gnt_persistent = feature_persistent &&
+	blkif->vbd.feature_gnt_persistent_parm = feature_persistent;
+	blkif->vbd.feature_gnt_persistent =
+		blkif->vbd.feature_gnt_persistent_parm &&
 		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
 
 	blkif->vbd.overflow_max_grants = 0;
-- 
2.25.1



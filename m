Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F15A167F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 18:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393511.632524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVu-0004Xt-Oi; Thu, 25 Aug 2022 16:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393511.632524; Thu, 25 Aug 2022 16:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVu-0004Um-Lj; Thu, 25 Aug 2022 16:15:26 +0000
Received: by outflank-mailman (input) for mailman id 393511;
 Thu, 25 Aug 2022 16:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iKVJ=Y5=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oRFVs-0004FH-Sw
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 16:15:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f62252d-2491-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 18:15:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B73B82A24;
 Thu, 25 Aug 2022 16:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91680C433B5;
 Thu, 25 Aug 2022 16:15:21 +0000 (UTC)
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
X-Inumbo-ID: 1f62252d-2491-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661444122;
	bh=u9Ghl7TkYlx4h5gPcy/Fm5vU59cOedqmjOD4pBXghVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/SGhxfqDYpB5hPxz6UxiRs26o01eLebUwupK8kC+Wfe4eXrDPazt/PWA21wO9gtm
	 i99aqOcn854/pfR80H9iXYQd9TJlocti7VxnBsfc81u6Py04Dmh+lMaqGxsyehtr0x
	 GaqCcykcCTIukviFErXZOEgCZdt4W2eEyGpemvdajzA3mJ6SzOoTiXC34y9H+xJiWe
	 owqLy+vIw8Kw5hDA2FjYa98H8110kbsfwoTu2qAvzZ+xy4xgh4piRMrqq/PfNStXa7
	 BMSUKZTY9g4FezHMxcYcisXMN3XGWJZ2YxiNfuZ78qGaaqBL1YliAzueKZ6WgtBVpv
	 D1Qke13oXPM5w==
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
Subject: [PATCH 1/2] xen-blkback: Advertise feature-persistent as user requested
Date: Thu, 25 Aug 2022 16:15:10 +0000
Message-Id: <20220825161511.94922-2-sj@kernel.org>
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

This commit fixes the issue by making the blkback advertises its support
of the feature as user requested via 'feature_persistent' parameter
regardless of the otherend's support of the feature.

[1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/

Fixes: e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter when connect")
Cc: <stable@vger.kernel.org> # 5.10.x
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664F8755DC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 19:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690010.1075615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riIDl-0008FF-Dc; Thu, 07 Mar 2024 18:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690010.1075615; Thu, 07 Mar 2024 18:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riIDl-0008Da-B0; Thu, 07 Mar 2024 18:11:57 +0000
Received: by outflank-mailman (input) for mailman id 690010;
 Thu, 07 Mar 2024 18:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuHk=KN=pengutronix.de=ukl@srs-se1.protection.inumbo.net>)
 id 1riIDk-0008DU-MB
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 18:11:56 +0000
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [2a0a:edc0:2:b01:1d::104])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9ab83e-dcae-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 19:11:54 +0100 (CET)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1riIDe-0000sq-J2; Thu, 07 Mar 2024 19:11:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1riIDc-004zYn-MH; Thu, 07 Mar 2024 19:11:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1riIDc-001Swq-1x;
 Thu, 07 Mar 2024 19:11:48 +0100
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
X-Inumbo-ID: 2d9ab83e-dcae-11ee-a1ee-f123f15fe8a2
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	kernel@pengutronix.de
Subject: [PATCH] xen/grant-dma-iommu: Convert to platform remove callback returning void
Date: Thu,  7 Mar 2024 19:11:34 +0100
Message-ID: <20240307181135.191192-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=El0UTdrAQowm1iKos5TD66q4tVWDQzk42DU65xvUqJ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6gNX5w0OJDNnrwmDEvT8HL9x9bwCJYpiexfFN nbbgBrq9a6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeoDVwAKCRCPgPtYfRL+ TqxxB/4xv6IDLtYa45vRFzwQlweSvr6J3Zkgcd/JmLTEZ331puT9srnr9mpWMRh2bHJreLv1lSF ObP0c2b0rv5bL7TRj041HwMUzHTbVwC0nluAoKMzxu1/G/pzUb2chq2zwZwCfRdvJDhDVcYnDo8 qcUZ+Q1nQlkvbFXuG7CxTJXvZhxfGuaiWDPM6ZiJKImavbQ2hCG85zhQJF51HqU2T4u8ULmr9PU +Ff2DNanFDbPMSd/3NQiPSA6X0ciw7ju5SsbcblmiBDRliCRWASJo0TAsqGGVhKwbv2V7HwHEwU Qaan9LCVP2H8q8JE4zOZJr4WnGfdvtiwkjnGN3ptreG+LHwT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/xen/grant-dma-iommu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/grant-dma-iommu.c b/drivers/xen/grant-dma-iommu.c
index 6a9fe02c6bfc..2ee750a03c2f 100644
--- a/drivers/xen/grant-dma-iommu.c
+++ b/drivers/xen/grant-dma-iommu.c
@@ -51,14 +51,12 @@ static int grant_dma_iommu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int grant_dma_iommu_remove(struct platform_device *pdev)
+static void grant_dma_iommu_remove(struct platform_device *pdev)
 {
 	struct grant_dma_iommu_device *mmu = platform_get_drvdata(pdev);
 
 	platform_set_drvdata(pdev, NULL);
 	iommu_device_unregister(&mmu->iommu);
-
-	return 0;
 }
 
 static struct platform_driver grant_dma_iommu_driver = {
@@ -67,7 +65,7 @@ static struct platform_driver grant_dma_iommu_driver = {
 		.of_match_table = grant_dma_iommu_of_match,
 	},
 	.probe = grant_dma_iommu_probe,
-	.remove = grant_dma_iommu_remove,
+	.remove_new = grant_dma_iommu_remove,
 };
 
 static int __init grant_dma_iommu_init(void)

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0



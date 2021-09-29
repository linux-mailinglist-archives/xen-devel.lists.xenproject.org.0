Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD31341C10E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198864.352584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVLG-0007p6-Ud; Wed, 29 Sep 2021 08:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198864.352584; Wed, 29 Sep 2021 08:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVLG-0007n1-QY; Wed, 29 Sep 2021 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 198864;
 Wed, 29 Sep 2021 08:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEC3=OT=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mVVLF-0007mv-E7
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:53:29 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a47ce3c0-13fb-495d-b33e-59341eaab64d;
 Wed, 29 Sep 2021 08:53:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL4-0001ii-CE; Wed, 29 Sep 2021 10:53:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL1-0004fj-Sj; Wed, 29 Sep 2021 10:53:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL1-0000QL-Rd; Wed, 29 Sep 2021 10:53:15 +0200
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
X-Inumbo-ID: a47ce3c0-13fb-495d-b33e-59341eaab64d
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@lst.de>,
	linux-pci@vger.kernel.org,
	kernel@pengutronix.de,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 03/11] xen/pci: Drop some checks that are always true
Date: Wed, 29 Sep 2021 10:52:58 +0200
Message-Id: <20210929085306.2203850-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=7QOFRnoxyPrPqaGt2Yf8oJvx3xwgCvlMdm130sPrxr8=; m=Ixh7t2kv5MnS1JaJxFtVrqNhjBtz3xQyoCGo2anqbI0=; p=dOfuuSLv1l/M9DCuxyIBdCuX9kCH+yUzno229EZfUDs=; g=9e481f95a51887868b05f8a86c3e5a9f8aff47c6
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUKUwACgkQwfwUeK3K7AlyQAf9Gjp TCADTkJE36ON9dioloBuG0iVyAvFHq07aALxCH74D0NK9kgDK47u4JVyMBhswUfFEriH9thGirCW/ Sx6wuhA9gbPQtOzLKitgpb6Kq2+LIr7e28Ht5lwu9rQKdL7iybpKHPL0Ydr65XKY87CyOIIEfyUXm Byf0jInzlMfR1aCRec4WfMUdCEAsfUldp4k6pqUVfe/LemxULqopkQSf1oQawlTaPEKn/UEo/P/Qd 51uPnQ7NnWP80mPyCMNFDBq5HS/AyHyimwYuRfZWdSKDahmfequCzVKFmwqzGgzMVNUdqUsU7AooA 9gZhAzE3K9TTpQQYi+AgIZpi5f2MsiQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org

pcifront_common_process() has a check at the start that exits early if
pcidev or pdidev->driver are NULL. So simplify the following code by not
checking these two again.

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pci/xen-pcifront.c | 57 +++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 2156c632524d..f2d7f70a7a10 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -594,7 +594,6 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 	int devfn = pdev->sh_info->aer_op.devfn;
 	int domain = pdev->sh_info->aer_op.domain;
 	struct pci_dev *pcidev;
-	int flag = 0;
 
 	dev_dbg(&pdev->xdev->dev,
 		"pcifront AER process: cmd %x (bus:%x, devfn%x)",
@@ -609,40 +608,34 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 	}
 	pdrv = pcidev->driver;
 
-	if (pdrv) {
-		if (pdrv->err_handler && pdrv->err_handler->error_detected) {
-			pci_dbg(pcidev, "trying to call AER service\n");
-			if (pcidev) {
-				flag = 1;
-				switch (cmd) {
-				case XEN_PCI_OP_aer_detected:
-					result = pdrv->err_handler->
-						 error_detected(pcidev, state);
-					break;
-				case XEN_PCI_OP_aer_mmio:
-					result = pdrv->err_handler->
-						 mmio_enabled(pcidev);
-					break;
-				case XEN_PCI_OP_aer_slotreset:
-					result = pdrv->err_handler->
-						 slot_reset(pcidev);
-					break;
-				case XEN_PCI_OP_aer_resume:
-					pdrv->err_handler->resume(pcidev);
-					break;
-				default:
-					dev_err(&pdev->xdev->dev,
-						"bad request in aer recovery "
-						"operation!\n");
-
-				}
-			}
+	if (pdrv->err_handler && pdrv->err_handler->error_detected) {
+		pci_dbg(pcidev, "trying to call AER service\n");
+		switch (cmd) {
+		case XEN_PCI_OP_aer_detected:
+			result = pdrv->err_handler->
+				 error_detected(pcidev, state);
+			break;
+		case XEN_PCI_OP_aer_mmio:
+			result = pdrv->err_handler->
+				 mmio_enabled(pcidev);
+			break;
+		case XEN_PCI_OP_aer_slotreset:
+			result = pdrv->err_handler->
+				 slot_reset(pcidev);
+			break;
+		case XEN_PCI_OP_aer_resume:
+			pdrv->err_handler->resume(pcidev);
+			break;
+		default:
+			dev_err(&pdev->xdev->dev,
+				"bad request in aer recovery "
+				"operation!\n");
 		}
+
+		return result;
 	}
-	if (!flag)
-		result = PCI_ERS_RESULT_NONE;
 
-	return result;
+	return PCI_ERS_RESULT_NONE;
 }
 
 
-- 
2.30.2



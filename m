Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6D635D1D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 13:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447541.703887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp4d-0004Qx-CL; Wed, 23 Nov 2022 12:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447541.703887; Wed, 23 Nov 2022 12:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp4d-0004Oc-8v; Wed, 23 Nov 2022 12:41:55 +0000
Received: by outflank-mailman (input) for mailman id 447541;
 Wed, 23 Nov 2022 12:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZVx=3X=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1oxp4b-00049G-Kc
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 12:41:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34a3e6e4-6b2c-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 13:41:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4047B81F3E;
 Wed, 23 Nov 2022 12:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946FBC43470;
 Wed, 23 Nov 2022 12:41:49 +0000 (UTC)
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
X-Inumbo-ID: 34a3e6e4-6b2c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669207310;
	bh=qhyl/ggZQXJL45HqOXJfkODiufFbxtVKPvB+MTZPIaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mr9FOQpdXUzqr7Qs+c7L44VJUnf1ARIMvj7NHceZwtBD4umWqqlcVndpS3IY8RkaP
	 WOisUGqRu1dx6wU6nlgksIA6IVrfeqYtusEMlsP13ErvrfGexC9RA3z1HZdp2z6a7L
	 Xphuj7AqDjWlZnP4IFGi9XEIJDGMFQRaIAnqWKodUMQq5YEzew1q62Uq2BU4lCnSQV
	 9Z7vBtlw5UipZ4Keq3rjDVKqmYr3q+XEPabEMgnGy7FXmV62LH96/8yvSPeT0IKWJg
	 4I8ThBTOOTwtB85LWsJhO7boP3zHhGjnt+TlmU/EtI3Q/8n+D8++wyXgRix2cvajZP
	 fdzL2MAI6mh4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: ruanjinjie <ruanjinjie@huawei.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.0 21/44] xen/platform-pci: add missing free_irq() in error path
Date: Wed, 23 Nov 2022 07:40:30 -0500
Message-Id: <20221123124057.264822-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: ruanjinjie <ruanjinjie@huawei.com>

[ Upstream commit c53717e1e3f0d0f9129b2e0dbc6dcc5e0a8132e9 ]

free_irq() is missing in case of error in platform_pci_probe(), fix that.

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Link: https://lore.kernel.org/r/20221114112124.1965611-1-ruanjinjie@huawei.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/platform-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 18f0ed8b1f93..6ebd819338ec 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -144,7 +144,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 		if (ret) {
 			dev_warn(&pdev->dev, "Unable to set the evtchn callback "
 					 "err=%d\n", ret);
-			goto out;
+			goto irq_out;
 		}
 	}
 
@@ -152,13 +152,16 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	grant_frames = alloc_xen_mmio(PAGE_SIZE * max_nr_gframes);
 	ret = gnttab_setup_auto_xlat_frames(grant_frames);
 	if (ret)
-		goto out;
+		goto irq_out;
 	ret = gnttab_init();
 	if (ret)
 		goto grant_out;
 	return 0;
 grant_out:
 	gnttab_free_auto_xlat_frames();
+irq_out:
+	if (!xen_have_vector_callback)
+		free_irq(pdev->irq, pdev);
 out:
 	pci_release_region(pdev, 0);
 mem_out:
-- 
2.35.1



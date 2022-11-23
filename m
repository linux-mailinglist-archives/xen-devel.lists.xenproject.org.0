Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730A635D5F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 13:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447566.703974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp8N-0000bd-NY; Wed, 23 Nov 2022 12:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447566.703974; Wed, 23 Nov 2022 12:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp8N-0000Za-Kh; Wed, 23 Nov 2022 12:45:47 +0000
Received: by outflank-mailman (input) for mailman id 447566;
 Wed, 23 Nov 2022 12:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZVx=3X=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1oxp8M-0008L9-Pd
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 12:45:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf6c6782-6b2c-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 13:45:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F282F61C63;
 Wed, 23 Nov 2022 12:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEEFC43470;
 Wed, 23 Nov 2022 12:45:43 +0000 (UTC)
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
X-Inumbo-ID: bf6c6782-6b2c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669207544;
	bh=Syc8Sdgco/obOHgr5TpFdObKEaPxMDPmIGv/HB5/1Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FuGAmgu2w93dOO/5Rwq0l1Fs/lg+CsfwEAgsGbCkjZiUt2qz+QO01AR757NJ4gplj
	 JDnW7d1sg1yUXRqdfWgwlLjg7jO0EO5n0wQf5JmwJkmAnMerMC+5UFr1ZHSJvcTcbv
	 PTocfp9Uwu5ShTjMFFRmrFQYo7qHRRrEO18tzXri8OnQrGvE8mQH6zAlezJfqKTNJR
	 V6yctH67eZhcjCsu9zE2yO8wZ/W+Wh/EPEBmxusT3VRUqATm4jdGLz4VczJMDavtr0
	 z4lqJ11HLMzPNUZ+bEmXKRxtghWjRKWyCX0qXtnFuc6/gBxKp2L4m13WWpC9GXScoN
	 6mhGSfDgt6pzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: ruanjinjie <ruanjinjie@huawei.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.9 2/5] xen/platform-pci: add missing free_irq() in error path
Date: Wed, 23 Nov 2022 07:45:34 -0500
Message-Id: <20221123124540.266772-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124540.266772-1-sashal@kernel.org>
References: <20221123124540.266772-1-sashal@kernel.org>
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
index cf9666680c8c..20365b01c36b 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -149,7 +149,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 		if (ret) {
 			dev_warn(&pdev->dev, "Unable to set the evtchn callback "
 					 "err=%d\n", ret);
-			goto out;
+			goto irq_out;
 		}
 	}
 
@@ -157,7 +157,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	grant_frames = alloc_xen_mmio(PAGE_SIZE * max_nr_gframes);
 	ret = gnttab_setup_auto_xlat_frames(grant_frames);
 	if (ret)
-		goto out;
+		goto irq_out;
 	ret = gnttab_init();
 	if (ret)
 		goto grant_out;
@@ -165,6 +165,9 @@ static int platform_pci_probe(struct pci_dev *pdev,
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



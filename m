Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627568F237
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 16:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491890.761238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmYE-0008BX-8c; Wed, 08 Feb 2023 15:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491890.761238; Wed, 08 Feb 2023 15:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmYE-000887-5H; Wed, 08 Feb 2023 15:40:02 +0000
Received: by outflank-mailman (input) for mailman id 491890;
 Wed, 08 Feb 2023 15:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8uy=6E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pPmYC-00087y-KX
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 15:40:00 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d720f501-a7c6-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 16:39:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so2773480wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 07:39:57 -0800 (PST)
Received: from work-hp.. ([91.123.148.245]) by smtp.gmail.com with ESMTPSA id
 d8-20020adfe2c8000000b002bfe08c566fsm13958034wrj.106.2023.02.08.07.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 07:39:55 -0800 (PST)
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
X-Inumbo-ID: d720f501-a7c6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGWuGjSyAolvIuh2gpF30/sfRfWcmW0ukeqiTc1FZg4=;
        b=oJLgmWwOA/fWnsZRLlXi0D7IB41vvMVwDk7qIp/hPO/I0Cu28Q2i4d0DPXkgCMMGW7
         SdzZx2e3lqC+DVRz/VlUF+Pk6ZB+kB9aSgjpLPKWsIw6CQBDEbkGyHNWz4UyfDWYca53
         K34F4fo3Rdk5I9CATRq9b+kuSOPothxpM0z/dhRzc7xKpmGW2aUP7qLS5v26HcIzsXml
         uRi3XbYZNSXIYEpwwPGuh8OTovAuQ7No2yybmDgLJaO+R3upLfKBHWlDm2zvJPPCTQlz
         8uTHL68LY/yG++GRdkvszu7ZgdscE3xE0++V0ywwduDPIPSfpmd/Xpn8oL10Dt/+8xS3
         XurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGWuGjSyAolvIuh2gpF30/sfRfWcmW0ukeqiTc1FZg4=;
        b=777myMKhD4KEoB+UVlt4crIkZLK5efbJ7sNcs6K90URPJfJXakLSnf6VNcKAclHkyu
         DiyI3xB3wZosjglbf9OLi0hImFEswGtNk1wTPZ7iENeelOMrJK3nn3jvfbA1Wo6FCFik
         oxjlr2QVKzt/5h0Ejm4VgitVzZp483rc22GEK4aXZ5YFAEXG6weV3gYf5Wad6FMvr186
         8JnD5MpqL90KTBMfdA4PjKnBadBRcl/8Yl6vDhGTGZCqh4lfuP4FXE6rJ7TNBq5o4Tk4
         fUjV+EWktuGe2Ln1BgW5Il5NVgf7hl43fa8/AAK3h1tFXWiaDLOA6EfDApVeFxDq/z1a
         gPHg==
X-Gm-Message-State: AO0yUKVF43vqhyF2IMkhWnYj5HR+FqPovARZ9qAfvPUKfXZPE2pgDJEE
	M2cD7N7nQDmMGJSGCgc911w6OVu0vLU=
X-Google-Smtp-Source: AK7set/9TBqIZGKiBgGkbYehMHhv5R4xqumCMXaSzOW6dO7LsQm45M+8qsR9emWP/44RWI8GFW0KSA==
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id m19-20020a05600c161300b003dfb5ae5289mr6782149wmn.8.1675870796500;
        Wed, 08 Feb 2023 07:39:56 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] xen/grant-dma-iommu: Implement a dummy probe_device() callback
Date: Wed,  8 Feb 2023 17:36:49 +0200
Message-Id: <20230208153649.3604857-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Update stub IOMMU driver (which main purpose is to reuse generic
IOMMU device-tree bindings by Xen grant DMA-mapping layer on Arm)
according to the recent changes done in the following
commit 57365a04c921 ("iommu: Move bus setup to IOMMU device registration").

With probe_device() callback being called during IOMMU device registration,
the uninitialized callback just leads to the "kernel NULL pointer
dereference" issue during boot. Fix that by adding a dummy callback.

Looks like the release_device() callback is not mandatory to be
implemented as IOMMU framework makes sure that callback is initialized
before dereferencing.

Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/grant-dma-iommu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/grant-dma-iommu.c b/drivers/xen/grant-dma-iommu.c
index 16b8bc0c0b33..6a9fe02c6bfc 100644
--- a/drivers/xen/grant-dma-iommu.c
+++ b/drivers/xen/grant-dma-iommu.c
@@ -16,8 +16,15 @@ struct grant_dma_iommu_device {
 	struct iommu_device iommu;
 };
 
-/* Nothing is really needed here */
-static const struct iommu_ops grant_dma_iommu_ops;
+static struct iommu_device *grant_dma_iommu_probe_device(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+/* Nothing is really needed here except a dummy probe_device callback */
+static const struct iommu_ops grant_dma_iommu_ops = {
+	.probe_device = grant_dma_iommu_probe_device,
+};
 
 static const struct of_device_id grant_dma_iommu_of_match[] = {
 	{ .compatible = "xen,grant-dma" },
-- 
2.34.1



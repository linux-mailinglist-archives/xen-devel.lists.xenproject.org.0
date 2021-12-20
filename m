Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDA47B4F2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250002.430579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1D-0007jT-7Y; Mon, 20 Dec 2021 21:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250002.430579; Mon, 20 Dec 2021 21:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1C-0007Yr-Vx; Mon, 20 Dec 2021 21:16:26 +0000
Received: by outflank-mailman (input) for mailman id 250002;
 Mon, 20 Dec 2021 21:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ19-0005IB-CZ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:23 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 150591d1-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:22 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id k2so18068267lji.4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:22 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:21 -0800 (PST)
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
X-Inumbo-ID: 150591d1-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xEJ/as6c2Y3IKG5DtZXdMpOhtzqpglhGl1VKpLommlg=;
        b=bxGK8XoFncudNK8ijCfMDVnV8Ugd3evS/gun5assQK01IdDTTme9eoHJ9hn01SFBFu
         AglMLMZsDwZF494RmxroKyz+LkoZvL4H3hWk6eHKtXJFBFN9ljmb5FLihHMDLjvK9+zu
         MLZjTH4KUGfOiiCfUGP59Mi0Z9kvU3jr7wNbq1ltfjVhTSG2J2kMAXLzEhKoFLGl4HhI
         vuSS+Uvn9aM4f51YSyEZRq+t8bpIPxF+7NZlbqxtu/2gDgIeecz+9T3Gi3u7d9nz1dBY
         yuZvB7C/HuHIomIzdNWAru9+rn+N4KoZRdPJUKK53zPXIg1NkAm0zmAmEe9iNvSJfmdQ
         FjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xEJ/as6c2Y3IKG5DtZXdMpOhtzqpglhGl1VKpLommlg=;
        b=G99CQAMJF5CAmUSMQ0wbf47w+OgCmyC0EMGmPQVC9R3mDt6RkUVF78kTQwvb2hcgyr
         Xyh394pKbCoiacuFLRSo9gktKtili9B/XOvoHlpNGI7RXHPR6Gdau3MLGnW5g5BCDze3
         7LU2cZvQUHzWmf+QZJsJgwBMfdGTgDrz5vlhpBPQ88RRK6+OAsGzrN19/hfnji7jfK9g
         hkz0v43GFLI5VmHz2ijuhm1Ht3I8NSXrPFARGyatI70PgRdvIpoeeudUHFzWhYmCia0s
         nvPmJKwaVVeiWmVjR9ra88HYjxdaIH07byva8sWEIkulCUWzrLttC2Y8NadrQpUYIqfW
         dGTQ==
X-Gm-Message-State: AOAM533xVYwIaVwTYOLS4proYFpqX2t7Qod4jmwUphtQswtt07LRF08R
	2M1xR2rB/cRGseX3Emtdn6FMcE55qCE=
X-Google-Smtp-Source: ABdhPJyHVZaNSJHo2OIPrA0WgJpGUxpjHQvokrcmd6B6Dh+19rKeup/HjUJRLxpz11VTIqNQv4POKA==
X-Received: by 2002:a05:651c:1696:: with SMTP id bd22mr15878925ljb.57.1640034982132;
        Mon, 20 Dec 2021 13:16:22 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 10/10] iommu/arm: Remove code duplication in all IOMMU drivers
Date: Mon, 20 Dec 2021 23:15:57 +0200
Message-Id: <1640034957-19764-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

All IOMMU drivers on Arm perform almost the same generic actions in
hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
in order to get rid of code duplication.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
---
 xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 --------
 xen/drivers/passthrough/arm/smmu-v3.c    | 10 ----------
 xen/drivers/passthrough/arm/smmu.c       | 10 ----------
 4 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index ee653a9..fc45318 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -134,6 +134,13 @@ void arch_iommu_domain_destroy(struct domain *d)
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
+    /* Set to false options not supported on ARM. */
+    if ( iommu_hwdom_inclusive )
+        printk(XENLOG_WARNING "map-inclusive dom0-iommu option is not supported on ARM\n");
+    iommu_hwdom_inclusive = false;
+    if ( iommu_hwdom_reserved == 1 )
+        printk(XENLOG_WARNING "map-reserved dom0-iommu option is not supported on ARM\n");
+    iommu_hwdom_reserved = 0;
 }
 
 /*
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 1224ea4..64d8ddc 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1325,14 +1325,6 @@ static int ipmmu_iommu_domain_init(struct domain *d)
 
 static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
 {
-    /* Set to false options not supported on ARM. */
-    if ( iommu_hwdom_inclusive )
-        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is not supported on ARM\n");
-    iommu_hwdom_inclusive = false;
-    if ( iommu_hwdom_reserved == 1 )
-        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is not supported on ARM\n");
-    iommu_hwdom_reserved = 0;
-
     arch_iommu_hwdom_init(d);
 }
 
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index d115df7..ca8b5c7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3404,16 +3404,6 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 
 static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
 {
-	/* Set to false options not supported on ARM. */
-	if (iommu_hwdom_inclusive)
-		printk(XENLOG_WARNING
-		"map-inclusive dom0-iommu option is not supported on ARM\n");
-	iommu_hwdom_inclusive = false;
-	if (iommu_hwdom_reserved == 1)
-		printk(XENLOG_WARNING
-		"map-reserved dom0-iommu option is not supported on ARM\n");
-	iommu_hwdom_reserved = 0;
-
 	arch_iommu_hwdom_init(d);
 }
 
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c9dfc4c..ec18df7 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2851,16 +2851,6 @@ static int arm_smmu_iommu_domain_init(struct domain *d)
 
 static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
 {
-	/* Set to false options not supported on ARM. */
-	if ( iommu_hwdom_inclusive )
-		printk(XENLOG_WARNING
-		"map-inclusive dom0-iommu option is not supported on ARM\n");
-	iommu_hwdom_inclusive = false;
-	if ( iommu_hwdom_reserved == 1 )
-		printk(XENLOG_WARNING
-		"map-reserved dom0-iommu option is not supported on ARM\n");
-	iommu_hwdom_reserved = 0;
-
 	arch_iommu_hwdom_init(d);
 }
 
-- 
2.7.4



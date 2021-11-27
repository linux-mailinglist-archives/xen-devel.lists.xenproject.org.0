Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7944600BF
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234026.406266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rp-0006Ut-Dz; Sat, 27 Nov 2021 17:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234026.406266; Sat, 27 Nov 2021 17:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ro-0006FF-Mo; Sat, 27 Nov 2021 17:52:04 +0000
Received: by outflank-mailman (input) for mailman id 234026;
 Sat, 27 Nov 2021 17:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rk-0004Ih-Rn
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:52:00 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b877781f-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:52:00 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id i63so25447941lji.3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:52:00 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:59 -0800 (PST)
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
X-Inumbo-ID: b877781f-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FyIIWAAFmJxixgOyTM6dxQSE4aN0oIOcdU1AbmFPmek=;
        b=GHsGKs1gXcGqMfXG6bbH/OmtpfRJ6f2IBuERRrno5etnJdsPQLsI7Zs6gb00nQb9Wd
         XaMJpZi9bTfkDhrSfhB/PG+F8dXHayOi2JOp7GNHOamHCd/UofJg44rdM0MapglzdlnF
         UT+akpTYovZ/8ECMghVsw9rP0YIekBJjNETH0T0VpcfAKSWmHKVr6cCTMERyVtFXZhGN
         BIEqBwwWOYGzQqHHvIfEmzI1tQrdCkt+SguEBW0VVHonIvzTZW8vaYdniC8kmCvBTkKp
         Bn0asH/tij+CiphOUhMsuEeiPNTYrUJGLVpdw+2YlxHZM3msFn4M8Z2PX7viB001V+Kp
         xemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FyIIWAAFmJxixgOyTM6dxQSE4aN0oIOcdU1AbmFPmek=;
        b=mMHhlfhJq7wjk3wX+zB7ZaEftrlzZP2nZoLcN+8OJ4RvU4DzaQ9SyAD8le8duWLuQ7
         JnRmz3X0fHG5L9cqGdompJgUJaBhPSy7yJgoRoaLcR9R+GRGxlkwR2UdjO6TU0zs2Kmb
         T6oS0v5aQr6QJUKc4ukJko/KzUmJPQnD/5OoB3KW3jebg1asebW+DiPiKAtQ1vOMdpV8
         erpWa2aZ79MdDUN2r8/eWiAKfWNElILiTj5YPpNl4FmZ9IHOXMOE0WYOB+SjRnEWQ3R/
         Y8YBdnhoL2DbSsn0cH7PJJkEC2A4SHI4T/FBv6EnQcKK5yqeZtcd3pSv4bXAiptUzJjM
         7A7Q==
X-Gm-Message-State: AOAM530eNFzAlB2Zltmq9pS1UABtA2DPgKSrYf9QVUj9J0HTdmSwCRJW
	xCNG+tmnXzMVwQ3yGVxO4HZtGeg9fxQ=
X-Google-Smtp-Source: ABdhPJzjMZrfxBLx7Z7zAyGCtcqtbrTb3ahQJT7JKt23e9NahIdg8jbACgJGDRuhTOvxmSfSnkckbQ==
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr10661874lje.315.1638035519303;
        Sat, 27 Nov 2021 09:51:59 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 10/10] iommu/arm: Remove code duplication in all IOMMU drivers
Date: Sat, 27 Nov 2021 19:51:45 +0200
Message-Id: <1638035505-16931-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

All IOMMU drivers on Arm perform almost the same generic actions in
hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
in order to get rid of code duplication.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
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
index 32609f8..451fc21 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1336,14 +1336,6 @@ static int ipmmu_iommu_domain_init(struct domain *d)
 
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



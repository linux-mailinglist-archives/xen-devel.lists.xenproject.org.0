Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421349EB69
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 20:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261721.453404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsi-0002OX-Cu; Thu, 27 Jan 2022 19:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261721.453404; Thu, 27 Jan 2022 19:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsi-0002Lu-8e; Thu, 27 Jan 2022 19:56:32 +0000
Received: by outflank-mailman (input) for mailman id 261721;
 Thu, 27 Jan 2022 19:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nDAsf-0001qN-Tx
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 19:56:30 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 379aabe7-7fab-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 20:56:29 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id u6so7420582lfm.10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 11:56:29 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j18sm897631lja.26.2022.01.27.11.56.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 11:56:28 -0800 (PST)
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
X-Inumbo-ID: 379aabe7-7fab-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9x3Unk7KT3XMe8edi/04ny0Op6Yqm01LPkdhOdEqFH8=;
        b=nItGuj/k8uxRgN8VTCw9s0qR1Fbpu7B1F7RuxhrBsjHIryfVgsBTWu9hCspadqILtT
         3N+ijPeqKmSLiZqJVIMVOPU2Ut9cgG8fQZ9PG5ZW7bUkHtc6P86L1IJOKEPOMdxBzdbH
         R9VxIEFSdFnuhzEoYw8A49N1qOwYp7hYEj+vGwXMNEOW1S3qxfQ+gQj5GNVECYGhWYfb
         E7koa63MAAG3EOs5moEoV8afkX1IQTpReZQSyhuX8gWfPI2LnwrGXnikvceUUFRZnliI
         IL+F06aCyzk19Ko0PkvEEZZYL2xsAsGDf5eZf5W54hnhQZtHSxz+2c0Szr4GY0iS1f/5
         Eh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9x3Unk7KT3XMe8edi/04ny0Op6Yqm01LPkdhOdEqFH8=;
        b=WXre7v3PHXCGSh15G9QtjdZoKjoUAzXd93lherOmPZQWN2U3ixVkdyfYnxwefryKsE
         95c+ycePP+5xSx0waH8R+PpW2KnOkWySnOiq1h/DsPbdHwQdjYtT1lSjpDkv/OlFIJlJ
         ivuFE7jJupPreZVI4uU5h0yHnj9H/sNIqN3OdApNFY+p1FMw3xXNot7TMxGhpAgyUbjB
         BEZWcl1diShWmwwBIP2jOS4vC+SuNJUw2YDaYX9Q7flaxQBw5YlHrkWSsQCESfGt+Eym
         bYn/rV/qtDI4TGHv4H+pqhRsN404/DL8wdTWHj+aospZTSx6QpWc1tWgKi1cIAl838mt
         YYjQ==
X-Gm-Message-State: AOAM532dshYAbIVJeB6nn9U0DgNN0wiDDUJe63mB0jL044to9mcrCVXJ
	1vO8BCLjqmmeTHeVHBtb8fwFpDw1SKw=
X-Google-Smtp-Source: ABdhPJwvCtFrFAerya6ye4MW9mbvSwPBeHBGZp6QwFtTmX3fBdWqDyVFbVqQNr6c+go6DbE3Ik1ffA==
X-Received: by 2002:a19:4f4a:: with SMTP id a10mr3726025lfk.397.1643313388555;
        Thu, 27 Jan 2022 11:56:28 -0800 (PST)
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
Subject: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU drivers
Date: Thu, 27 Jan 2022 21:55:52 +0200
Message-Id: <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>

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

Changes V2 -> V3:
   - drop platform specific *_iommu_hwdom_init(), make .hwdom_init
     to directly point to the common arch_iommu_hwdom_init()
---
 xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 15 +--------------
 xen/drivers/passthrough/arm/smmu-v3.c    | 17 +----------------
 xen/drivers/passthrough/arm/smmu.c       | 17 +----------------
 4 files changed, 10 insertions(+), 46 deletions(-)

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
index c912120..d2572bc 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1329,19 +1329,6 @@ static int ipmmu_iommu_domain_init(struct domain *d)
     return 0;
 }
 
-static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
-{
-    /* Set to false options not supported on ARM. */
-    if ( iommu_hwdom_inclusive )
-        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is not supported on ARM\n");
-    iommu_hwdom_inclusive = false;
-    if ( iommu_hwdom_reserved == 1 )
-        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is not supported on ARM\n");
-    iommu_hwdom_reserved = 0;
-
-    arch_iommu_hwdom_init(d);
-}
-
 static void ipmmu_iommu_domain_teardown(struct domain *d)
 {
     struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -1369,7 +1356,7 @@ static void ipmmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops ipmmu_iommu_ops =
 {
     .init            = ipmmu_iommu_domain_init,
-    .hwdom_init      = ipmmu_iommu_hwdom_init,
+    .hwdom_init      = arch_iommu_hwdom_init,
     .teardown        = ipmmu_iommu_domain_teardown,
     .iotlb_flush     = ipmmu_iotlb_flush,
     .iotlb_flush_all = ipmmu_iotlb_flush_all,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index d115df7..71b022f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3402,21 +3402,6 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 
 }
 
-static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
-{
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
-	arch_iommu_hwdom_init(d);
-}
-
 static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 {
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -3427,7 +3412,7 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.init		= arm_smmu_iommu_xen_domain_init,
-	.hwdom_init		= arm_smmu_iommu_hwdom_init,
+	.hwdom_init		= arch_iommu_hwdom_init,
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
 	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c9dfc4c..b186c28 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2849,21 +2849,6 @@ static int arm_smmu_iommu_domain_init(struct domain *d)
 	return 0;
 }
 
-static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
-{
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
-	arch_iommu_hwdom_init(d);
-}
-
 static void arm_smmu_iommu_domain_teardown(struct domain *d)
 {
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2874,7 +2859,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
-    .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
-- 
2.7.4



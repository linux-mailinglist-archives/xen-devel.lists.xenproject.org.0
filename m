Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF26857CD4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682193.1061339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV9-0008QP-Vp; Fri, 16 Feb 2024 12:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682193.1061339; Fri, 16 Feb 2024 12:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV9-0008LA-Or; Fri, 16 Feb 2024 12:39:35 +0000
Received: by outflank-mailman (input) for mailman id 682193;
 Fri, 16 Feb 2024 12:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV8-0006oJ-4G
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:34 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb2ce04-ccc8-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 13:39:33 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3de25186fbso65365166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:32 -0800 (PST)
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
X-Inumbo-ID: 6fb2ce04-ccc8-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087173; x=1708691973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELu7fx1uXcKKvX0ev7mgwIEsa2oKN1zApZ0Pg4TKtMg=;
        b=F4lUmyvMz8kbw4SheeKxEHi3aPn2hPDs1dxqLCGmvTbk3ZlpAx7gnLjkfZLsYGzZip
         oTB7SIII9/LFQrjD2XnxzuP5ndlSfCouU5VGY30lD3QCSpwhVnQOAhNKIxY4IMSzp8MH
         gn2AZBHWmxrQRqp+vJLupOWdzHiQbN5g3lnaDVjmYeOxGqlH9BbK4Yl/rxyyouH+qiXM
         /xWZp50YOFZrm0d066BhP1nJIMPpSz+yseZnLFEOQRSKYveaHtzelJEP9QILgamhhA3i
         YlLNFO5IM0RAYB7vRP2oTsRBJ/CktKH7KvuV7GxCVsPPH9G9AyQGgQ+BqmrRMzB5LSV/
         YwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087173; x=1708691973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELu7fx1uXcKKvX0ev7mgwIEsa2oKN1zApZ0Pg4TKtMg=;
        b=ci6L/IjbJ7sslt/lekD6edSF9BNr7Yn0bODpxWMcxPFnUDCVX1zx9IbHLIDo48654R
         Tfn5ik2xKICNJRfXXvgLCQMiV9IH46Fts/mts0G0BWgyrus0B0ssYNV3BMnShjeAfCWt
         U9ugpP4ZLIKh7HtBhJGq/Z/+7YQ9Cvlxwh6JypvNNDgi2vd+YGzuY+Z7EYMQJfdqLPD7
         v+a7qMoZYyLaHc/kpQ/RKI95oC5cokTGibkHmxiSGTqPChvrjj7Z/Dy6UZP92uk24WTP
         04OSEkuy/jNnt1b+ctGVUYWVlhqfUH4nSgTNvbRRXAIamxWjLYHEG+YzOvkUk6W2AH5S
         Hwyw==
X-Gm-Message-State: AOJu0YwZ9UeC8gpbwo6FTIyyDgdOHqSZlLplXxdBDtdxWZspscMVNL7w
	Q6pAqX7LR5kSzaOL85SAYjtAnxHny17JikhQKBcuSd0UFpUxEV3RNirjmsG5
X-Google-Smtp-Source: AGHT+IEgSArJ2RWktN+cBbDdUCZOEWFMz/h00WcEFOPs7dnjimSk0EQ6RWUaUr/nb0pDUpMPvqyhwQ==
X-Received: by 2002:a17:906:451:b0:a3d:9962:f05f with SMTP id e17-20020a170906045100b00a3d9962f05fmr2952460eja.74.1708087172839;
        Fri, 16 Feb 2024 04:39:32 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct dev
Date: Fri, 16 Feb 2024 13:39:19 +0100
Message-ID: <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current patch is a follow-up to the patch titled:
    xen/asm-generic: introduce generic device.h
Also, a prerequisite for this patch is, without which a compilation
error will occur:
    xen/arm: switch Arm to use asm-generic/device.h

The 'struct dev_archdata' is exclusively used within 'struct device',
so it could be merged into 'struct device.'

After the merger, it is necessary to update the 'dev_archdata()'
macros and the comments above 'struct arm_smmu_xen_device' in
drivers/passthrough/arm/smmu.c.
Additionally, it is required to update instances of
"dev->archdata->iommu" to "dev->iommu".

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
  This patch can be merged with patches 4 and 5 of this patch series.
---
Changes in V9:
 - newly introduced patch.
---
 xen/drivers/passthrough/arm/smmu.c | 12 ++++++------
 xen/include/asm-generic/device.h   |  8 +-------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 32e2ff279b..4a272c8779 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -227,9 +227,9 @@ struct arm_smmu_xen_domain {
 };
 
 /*
- * Xen: Information about each device stored in dev->archdata.iommu
+ * Xen: Information about each device stored in dev->iommu
  *
- * Initially dev->archdata.iommu only stores the iommu_domain (runtime
+ * Initially dev->iommu only stores the iommu_domain (runtime
  * configuration of the SMMU) but, on Xen, we also have to store the
  * iommu_group (list of streamIDs associated to the device).
  *
@@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
 	struct iommu_group *group;
 };
 
-#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->archdata.iommu)
+#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)
 #define dev_iommu_domain(dev) (dev_archdata(dev)->domain)
 #define dev_iommu_group(dev) (dev_archdata(dev)->group)
 
@@ -2777,9 +2777,9 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 
 	xen_domain = dom_iommu(d)->arch.priv;
 
-	if (!dev->archdata.iommu) {
-		dev->archdata.iommu = xzalloc(struct arm_smmu_xen_device);
-		if (!dev->archdata.iommu)
+	if (!dev->iommu) {
+		dev->iommu = xzalloc(struct arm_smmu_xen_device);
+		if (!dev->iommu)
 			return -ENOMEM;
 	}
 
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index f91bb7f771..1acd1ba1d8 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -22,12 +22,6 @@ enum device_class
     DEVICE_UNKNOWN,
 };
 
-struct dev_archdata {
-#ifdef CONFIG_HAS_PASSTHROUGH
-    void *iommu;    /* IOMMU private data */
-#endif
-};
-
 /* struct device - The basic device structure */
 struct device
 {
@@ -35,8 +29,8 @@ struct device
 #ifdef CONFIG_HAS_DEVICE_TREE
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
 #endif
-    struct dev_archdata archdata;
 #ifdef CONFIG_HAS_PASSTHROUGH
+    void *iommu; /* IOMMU private data */;
     struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
 #endif
 };
-- 
2.43.0



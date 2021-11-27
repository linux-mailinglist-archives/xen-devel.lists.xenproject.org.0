Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E424600C0
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234018.406186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ri-0004ZF-0U; Sat, 27 Nov 2021 17:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234018.406186; Sat, 27 Nov 2021 17:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rh-0004Q0-Pc; Sat, 27 Nov 2021 17:51:57 +0000
Received: by outflank-mailman (input) for mailman id 234018;
 Sat, 27 Nov 2021 17:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rg-0004Ih-4g
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:56 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b59e8717-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:51:55 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id 13so25352922ljj.11
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:55 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:54 -0800 (PST)
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
X-Inumbo-ID: b59e8717-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2sni6jjnzs/e6QjzM6R6J5bFY8hTKuPs1W7f75Y8JUs=;
        b=mCcjVdwnRgSS7Q75SIo7lxOskyOJn+QRTDRwF/FGDT6TsW/FJRtrC07YzOD2GHL9wJ
         UggtZY0oIhRHGjT7W0lXc/UNrYKyIYnFPkPzi2VhkXUl5mEe+n2wtKXTNmlNs7Jm2iwL
         yDW8O22qJ2s/8rVZLdSNm0z66rTxSeRAuNWQ8i1KTHSHZYhoUhOum08grqo/APDQZdC4
         r62eidmbURqsHAngE12X9z3USGDQAkL6pXFZgzlt+Rhd8DKo5LCvs8zedYtrDfCL0R9F
         Sx+7SGASPG9gcfVrnvceLC6b+ITBIxRGxKrCpyUIV/LYG5yadSBTskBwjsAh+Ccmzv+c
         tqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2sni6jjnzs/e6QjzM6R6J5bFY8hTKuPs1W7f75Y8JUs=;
        b=t7j16QT2Dixdci+lpSliMmKCWW9/mMVlqFGGPmIzaQ1fN5EBO+V2o/bKHVfELS9OO+
         umxtL1gNGxg1UoLjA3NhTLthVJmPHwTF0W2vStS7xODl6qOINsh1AZG6fkZgLeTk9gFM
         rEpAUhCzA5nX2oH7v+pxb3tFvTapa+octNlUkfDaJ9mAhhPvkyXoThQ4AQc58u350ykb
         K4W+/4iRYzlwXThcwZCVRMpBGi/aCA4+4uakeD1FXwr17tV0b+mHYmMkR8Lq1chzXedu
         oDEKB18rZFJgw2wsGFcNr3DSD4DDiDFu6q93VL3aOog0rWiWY8GjE2tw0ixz4p1lKHUd
         S1Xg==
X-Gm-Message-State: AOAM531v4uB8e1RhXyAwMz3E/0pqH5chP/2V81FSjE0f5XauGEQmpoLv
	emMCb1I26CPb0j0EbskFySGuXdILeV0=
X-Google-Smtp-Source: ABdhPJzRiNGapBPhnc8R1Iww0h0ZwDxUfXxffFKNeHCf+WJH3G7H1oDNSqGnVZ2SKx6tCBLeqxqPtA==
X-Received: by 2002:a2e:5c86:: with SMTP id q128mr6917577ljb.245.1638035514811;
        Sat, 27 Nov 2021 09:51:54 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 04/10] iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
Date: Sat, 27 Nov 2021 19:51:39 +0200
Message-Id: <1638035505-16931-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a prereq work needed to add support for S4 series easily
in the future.

We don't need to pull the whole struct and all instances as Xen
driver doesn't support old Arm32 based Gen2 SoCs, so there is no
point in keeping all differences between Gen2 and Gen3 here.
All what we need is a minimal support to be able to operate with
Gen3 and new S4.

Add Gen3 specific info with only two fields (number_of_contexts and
num_utlbs) for now, the subsequent patches will add remaining bits.

No change in behavior.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 54 +++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 1b94af2..369be4c 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -71,9 +71,9 @@
  * R-Car Gen3 SoCs make use of up to 8 IPMMU contexts (sets of page table) and
  * these can be managed independently. Each context is mapped to one Xen domain.
  */
-#define IPMMU_CTX_MAX     8
+#define IPMMU_CTX_MAX     8U
 /* R-Car Gen3 SoCs make use of up to 48 micro-TLBs per IPMMU device. */
-#define IPMMU_UTLB_MAX    48
+#define IPMMU_UTLB_MAX    48U
 
 /* IPMMU context supports IPA size up to 40 bit. */
 #define IPMMU_MAX_P2M_IPA_BITS    40
@@ -106,17 +106,22 @@ struct ipmmu_vmsa_xen_device {
     struct ipmmu_vmsa_device *mmu;
 };
 
+struct ipmmu_features {
+    unsigned int number_of_contexts;
+    unsigned int num_utlbs;
+};
+
 /* Root/Cache IPMMU device's information */
 struct ipmmu_vmsa_device {
     struct device *dev;
     void __iomem *base;
     struct ipmmu_vmsa_device *root;
     struct list_head list;
-    unsigned int num_utlbs;
     unsigned int num_ctx;
     spinlock_t lock;    /* Protects ctx and domains[] */
     DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
+    const struct ipmmu_features *features;
 };
 
 /*
@@ -727,6 +732,11 @@ static int ipmmu_init_platform_device(struct device *dev,
     return 0;
 }
 
+static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
+    .number_of_contexts = 8,
+    .num_utlbs = 48,
+};
+
 static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 {
     unsigned int i;
@@ -798,6 +808,27 @@ static __init bool ipmmu_stage2_supported(void)
     return stage2_supported;
 }
 
+static const struct dt_device_match ipmmu_dt_match[] __initconst =
+{
+    {
+        .compatible = "renesas,ipmmu-r8a7795",
+        .data = &ipmmu_features_rcar_gen3,
+    },
+    {
+        .compatible = "renesas,ipmmu-r8a77965",
+        .data = &ipmmu_features_rcar_gen3,
+    },
+    {
+        .compatible = "renesas,ipmmu-r8a7796",
+        .data = &ipmmu_features_rcar_gen3,
+    },
+    {
+        .compatible = "renesas,ipmmu-r8a77961",
+        .data = &ipmmu_features_rcar_gen3,
+    },
+    { /* sentinel */ },
+};
+
 /*
  * This function relies on the fact that Root IPMMU device is being probed
  * the first. If not the case, it denies further Cache IPMMU device probes
@@ -806,6 +837,7 @@ static __init bool ipmmu_stage2_supported(void)
  */
 static int ipmmu_probe(struct dt_device_node *node)
 {
+    const struct dt_device_match *match;
     struct ipmmu_vmsa_device *mmu;
     uint64_t addr, size;
     int irq, ret;
@@ -817,9 +849,12 @@ static int ipmmu_probe(struct dt_device_node *node)
         return -ENOMEM;
     }
 
+    match = dt_match_node(ipmmu_dt_match, node);
+    ASSERT(match);
+    mmu->features = match->data;
+
     mmu->dev = &node->dev;
-    mmu->num_utlbs = IPMMU_UTLB_MAX;
-    mmu->num_ctx = IPMMU_CTX_MAX;
+    mmu->num_ctx = min(IPMMU_CTX_MAX, mmu->features->number_of_contexts);
     spin_lock_init(&mmu->lock);
     bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
 
@@ -1296,15 +1331,6 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .add_device      = ipmmu_add_device,
 };
 
-static const struct dt_device_match ipmmu_dt_match[] __initconst =
-{
-    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7795"),
-    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77965"),
-    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7796"),
-    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77961"),
-    { /* sentinel */ },
-};
-
 static __init int ipmmu_init(struct dt_device_node *node, const void *data)
 {
     int ret;
-- 
2.7.4



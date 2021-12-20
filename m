Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D031047B4EB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249996.430509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ16-0005rM-NF; Mon, 20 Dec 2021 21:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249996.430509; Mon, 20 Dec 2021 21:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ16-0005nM-IZ; Mon, 20 Dec 2021 21:16:20 +0000
Received: by outflank-mailman (input) for mailman id 249996;
 Mon, 20 Dec 2021 21:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ14-0005IG-RZ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:18 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 125b3604-61da-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 22:16:18 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id b22so24579781lfb.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:18 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:17 -0800 (PST)
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
X-Inumbo-ID: 125b3604-61da-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KJJAXoBnqeeexsUsPrxE65JqoMaWk11lTyVByXKTYSU=;
        b=gOLATyKm4zSuOWV9E6Se+183dJv3dZ4/1hi1dCnT5d0xz/p49ipsWk4V+62Um9IuBV
         rXA6KY/y9/6AbhC7qupKNiWW2cVU68mDGL7tetdBNNv1EtYpiFMhUVL2ihZ7sGQxh3M9
         cVb7anEJhQ2h3n6Z2f32MmLl6TWR+uugTRwLnidi1KpP4CFIO0Dn9ztq49JAzMtWx/nZ
         OI/iBvIwdtbUhiX81WTHj1fvg+TJi10f6qqRdn0KEmkhI9SHbfRvkevt71a8XedKaQkc
         IV1Kjwr0YxIQZvKezY9U/6U5tg4DhurweX+Yna+L9OBmffGONeFCvmXZoW6Ktzu8f5UH
         phqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KJJAXoBnqeeexsUsPrxE65JqoMaWk11lTyVByXKTYSU=;
        b=JeaTIAcOoi00fNUCrMfXj9FnPM0kHTd6CxIKb3c9VR7/brW90m1WLx0GWmF+IebHjQ
         6A6QYWcY+q9xkOpHF1HAE8jSAJ/WOpybjubcD9XYh6hnrOa9j6g/TFjAAjhne3OIR/fX
         ybIAbxsH5VZncI9SXpKV0xohWOh0qXxcmVhZ49oaIuMjMqqjZQgTV4CdAEclY9WjKUFW
         Yr6mkAPQjbhO9e/MQHM/ilxrhKnB1x/StnxfI/DBkFop52Fy/Ma5NKUoKyv2WC8N6k3E
         blWqh/5JtC+5Rd+/Gclyf1bf2H48wAxGR1ccqgI94SqDpwZzPv8Gv5T65AC5gJ12RsrT
         btwA==
X-Gm-Message-State: AOAM530Lfr0WFzL/C+WqWtc/c8mzry2i9tb+7vKIdqdMJzqawPgFdQXW
	lsGzCoC0lPd2/jGDEsROR4cEudD+bZE=
X-Google-Smtp-Source: ABdhPJzeapJ3eaEjC6WFLDArDArLz+er0iTpagcYpbad82rG1wadmR8bGLj+UfFhkSAmAEukK9hM2w==
X-Received: by 2002:a19:dc4b:: with SMTP id f11mr17029793lfj.585.1640034977686;
        Mon, 20 Dec 2021 13:16:17 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 04/10] iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
Date: Mon, 20 Dec 2021 23:15:51 +0200
Message-Id: <1640034957-19764-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>

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
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
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



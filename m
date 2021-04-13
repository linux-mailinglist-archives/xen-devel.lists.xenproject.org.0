Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22635E5C5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110066.210104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJf-0005qE-Md; Tue, 13 Apr 2021 17:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110066.210104; Tue, 13 Apr 2021 17:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJf-0005pY-II; Tue, 13 Apr 2021 17:59:11 +0000
Received: by outflank-mailman (input) for mailman id 110066;
 Tue, 13 Apr 2021 17:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWNJd-0005nM-S5
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:59:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f1b751f-e028-4178-953d-27769545bd62;
 Tue, 13 Apr 2021 17:59:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 384F6613BD;
 Tue, 13 Apr 2021 17:59:08 +0000 (UTC)
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
X-Inumbo-ID: 8f1b751f-e028-4178-953d-27769545bd62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618336748;
	bh=cF48fhXe8VDxHIjdbmagHQp6WnPcptB+p2Y6Sw661xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rKoiWQR4KiJiUxVmFVzQnW5R89ABy843GDUxFHrAhEYtBrwqfAhkBOjC9rUZ7WRI+
	 nW6iPDU6d6/sQGAYukHjX+e239n3e2HStkLQuRzm7q2/Db8N1Z3cF7MkKAPAlMJed0
	 FpVFbmf0wpe3ZUKsqbMi24qeC6X+sBnr7zXXydkEcdogq49ZRqrv/RtunaLTz96fCd
	 mc0CuwlqohYaiHW65D0lazUXffXp708VR75vShkOqZIVhREzgsebR27JY+LS2R6fPp
	 i7+vv3/UgemCjPqOzude/GpNK+JVYqJpQU8v7+UykouILTMwJ/zhaajyu2ZQ+lh7dM
	 KiurFg4KLhxZQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH RESEND v3 3/3] arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.
Date: Tue, 13 Apr 2021 10:59:05 -0700
Message-Id: <20210413175905.15123-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Now that all arm iommu drivers support generic bindings we can remove
the workaround from iommu_add_dt_device().

Note that if both legacy bindings and generic bindings are present in
device tree, the legacy bindings are the ones that are used.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c    | 42 ++++++++++++++++++++++++++-
 xen/drivers/passthrough/device_tree.c | 17 +----------
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index f949c110ad..b564851a56 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -254,6 +254,8 @@ struct iommu_group
 	atomic_t ref;
 };
 
+static struct arm_smmu_device *find_smmu(const struct device *dev);
+
 static struct iommu_group *iommu_group_alloc(void)
 {
 	struct iommu_group *group = xzalloc(struct iommu_group);
@@ -442,6 +444,8 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define SMR_VALID			(1U << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+#define SMR_ID_MASK			0x7fff
+#define SMR_MASK_MASK			0x7fff
 
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
 #define S2CR_CBNDX_SHIFT		0
@@ -872,6 +876,40 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
+static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct iommu_fwspec *fwspec;
+
+	fwspec = dev_iommu_fwspec_get(dev);
+	if (fwspec == NULL)
+		return -ENXIO;
+
+	smmu = find_smmu(fwspec->iommu_dev);
+	if (smmu == NULL)
+		return -ENXIO;
+
+	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+}
+
+static int arm_smmu_dt_xlate_generic(struct device *dev,
+				    const struct dt_phandle_args *spec)
+{
+	uint32_t mask, fwid = 0;
+
+	if (spec->args_count > 0)
+		fwid |= (SMR_ID_MASK & spec->args[0]) << SMR_ID_SHIFT;
+
+	if (spec->args_count > 1)
+		fwid |= (SMR_MASK_MASK & spec->args[1]) << SMR_MASK_SHIFT;
+	else if (!of_property_read_u32(spec->np, "stream-match-mask", &mask))
+		fwid |= (SMR_MASK_MASK & mask) << SMR_MASK_SHIFT;
+
+	return iommu_fwspec_add_ids(dev,
+				    &fwid,
+				    1);
+}
+
 static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
@@ -2836,6 +2874,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
@@ -2843,9 +2882,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .reassign_device = arm_smmu_reassign_dev,
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
+    .dt_xlate = arm_smmu_dt_xlate_generic,
 };
 
-static __init const struct arm_smmu_device *find_smmu(const struct device *dev)
+static struct arm_smmu_device *find_smmu(const struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	bool found = false;
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index a51ae3c9c3..ae07f272e1 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -162,22 +162,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-        {
-            /*
-             * Some Device Trees may expose both legacy SMMU and generic
-             * IOMMU bindings together. However, the SMMU driver is only
-             * supporting the former and will protect them during the
-             * initialization. So we need to skip them and not return
-             * error here.
-             *
-             * XXX: This can be dropped when the SMMU is able to deal
-             * with generic bindings.
-             */
-            if ( dt_device_is_protected(np) )
-                return 0;
-            else
-                return -EINVAL;
-        }
+            return -EINVAL;
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95083304CE0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75654.136286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XIJ-0003nf-Ln; Tue, 26 Jan 2021 22:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75654.136286; Tue, 26 Jan 2021 22:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XIJ-0003mt-Hf; Tue, 26 Jan 2021 22:58:43 +0000
Received: by outflank-mailman (input) for mailman id 75654;
 Tue, 26 Jan 2021 22:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4XII-0003iY-CK
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:58:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c140295-193d-4b56-94ee-33fb97677d53;
 Tue, 26 Jan 2021 22:58:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A79EA2067B;
 Tue, 26 Jan 2021 22:58:39 +0000 (UTC)
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
X-Inumbo-ID: 6c140295-193d-4b56-94ee-33fb97677d53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611701920;
	bh=f04Fi/lIYdD7+J+KA0VjXybZ+sqQj9Rzhr9Y9B6vpgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3Ot9nEGFAjMJlpm42N0j4RTmAr+SBBh4u8BgTeLBNp+RemkWHnBXo5YVrdckT0jH
	 mtF+/XaAScv7Pf/uUM99nkaw2BIqesKz8Yt2MID9NsuqwWfRI96NSoi+cZBLiGGJtf
	 a9ecgYTeXj+sVLWGfEcKOxG6Qv75dDOwwhgE8tFnmRV3JLCZ7BkWTPV98Rby3RnspI
	 3PEdUdSpPp0OmcCRVW6iCwtMpubs6sx7v3u/uOd+YijfqDMIeGWg3qbAMcOrrMzmns
	 b+hzPuEbVPuy+mQlonMPM8XF4Fnc2H7fBXmVYAG2F8V+dSVppgT5w86ItZrw+hTWOz
	 5wf1NjXS9Xrhw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 3/3] arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.
Date: Tue, 26 Jan 2021 14:58:36 -0800
Message-Id: <20210126225836.6017-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Now that all arm iommu drivers support generic bindings we can remove
the workaround from iommu_add_dt_device().

Note that if both legacy bindings and generic bindings are present in
device tree, the legacy bindings are the ones that are used.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- split patch
- make find_smmu return non-const so that we can use it in arm_smmu_dt_add_device_generic
- use dt_phandle_args
- update commit message
---
 xen/drivers/passthrough/arm/smmu.c    | 40 ++++++++++++++++++++++++++-
 xen/drivers/passthrough/device_tree.c | 17 +-----------
 2 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 9687762283..620ba5a4b5 100644
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
@@ -843,6 +845,40 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
@@ -2766,6 +2802,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
@@ -2773,9 +2810,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E663D3044
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159903.294083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFI-0001uY-Bd; Thu, 22 Jul 2021 23:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159903.294083; Thu, 22 Jul 2021 23:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFI-0001r3-6r; Thu, 22 Jul 2021 23:36:52 +0000
Received: by outflank-mailman (input) for mailman id 159903;
 Thu, 22 Jul 2021 23:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6iFG-0001Fh-Vh
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 23:36:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c6b96e-1b8f-4cf9-9dd9-a7ae0394e6bd;
 Thu, 22 Jul 2021 23:36:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6961660EB3;
 Thu, 22 Jul 2021 23:36:45 +0000 (UTC)
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
X-Inumbo-ID: 06c6b96e-1b8f-4cf9-9dd9-a7ae0394e6bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626997005;
	bh=QjllWcLvUx9mzoMKNB1Xu/UYm+2+6PHACe7S/EWzwgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYZljsNLjOauZxrDLmQYvWLyur51QAqM8oYNdlTO73wlExLH0Vp9+qb/VQHOkaBkl
	 wUo/8lwK+CLmc4P8RX97YLSArBn1jNt8oXZEaIq1PXG79LWUoSYKk7kr6yq3XFoBV+
	 fvvbIxmv/8OO9mN8oLUwPA92f7uTXCf9+OF759OMlYJIHqS2pVHfSMWwOb17Al6q0Y
	 gjPm1kjF4qFS3IytbA3KMewJmPBq5daXWXPfzM0cUd4Yg2xA62OhWWNVqRkm9V6gKV
	 nVDLi1uFvVzFAnbq5m/DOWsGhHWP8sJQ/yIJyroboPtDsf5IXM+nHpmthMgBkr9sHh
	 VCU6kG6xrUi2Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 4/4] arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.
Date: Thu, 22 Jul 2021 16:36:42 -0700
Message-Id: <20210722233642.22515-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

For the legacy path, arm_smmu_dt_add_device_legacy is called by
register_smmu_master scanning mmu-masters (a fwspec entry is also
created.) For the generic path, arm_smmu_dt_add_device_generic gets
called instead. Then, arm_smmu_dt_add_device_generic calls
arm_smmu_dt_add_device_legacy afterwards, shared with the legacy path.
This way most of the low level implementation is shared between the two
paths.

If both legacy bindings and generic bindings are present in device tree,
the legacy bindings are the ones that are used. That's because
mmu-masters is parsed by
xen/drivers/passthrough/arm/smmu.c:arm_smmu_device_dt_probe which is
called by arm_smmu_dt_init. It happens very early. iommus is parsed by
xen/drivers/passthrough/device_tree.c:iommu_add_dt_device which is
called by xen/arch/arm/domain_build.c:handle_device and happens
afterwards.

arm_smmu_dt_xlate_generic is a verbatim copy from Linux
(drivers/iommu/arm/arm-smmu/arm-smmu.c:arm_smmu_of_xlate, version
v5.10).

A workaround was introduced by cf4af9d6d6c (xen/arm: boot with device
trees with "mmu-masters" and "iommus") because the SMMU driver only
supported the legacy bindings. Remove it now.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v5:
- add Acked-by
---
 xen/drivers/passthrough/arm/smmu.c    | 40 ++++++++++++++++++++++++++-
 xen/drivers/passthrough/device_tree.c | 17 +-----------
 2 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 4aa3ecec57..c234ad9c7f 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -256,6 +256,8 @@ struct iommu_group
 	atomic_t ref;
 };
 
+static struct arm_smmu_device *find_smmu(const struct device *dev);
+
 static struct iommu_group *iommu_group_alloc(void)
 {
 	struct iommu_group *group = xzalloc(struct iommu_group);
@@ -444,6 +446,8 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define SMR_VALID			(1U << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+#define SMR_ID_MASK			0x7fff
+#define SMR_MASK_MASK			0x7fff
 
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
 #define S2CR_CBNDX_SHIFT		0
@@ -872,6 +876,38 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
+	return iommu_fwspec_add_ids(dev, &fwid, 1);
+}
+
 static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
@@ -2837,6 +2873,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
@@ -2844,9 +2881,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
index 32526ecabb..46ce726521 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -160,22 +160,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
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



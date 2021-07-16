Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6A3CBFEE
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jul 2021 02:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157777.290637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4XkI-0006Dm-LN; Fri, 16 Jul 2021 23:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157777.290637; Fri, 16 Jul 2021 23:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4XkI-0006AH-Gn; Fri, 16 Jul 2021 23:59:54 +0000
Received: by outflank-mailman (input) for mailman id 157777;
 Fri, 16 Jul 2021 23:59:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4XkH-0005UR-7C
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 23:59:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e332387f-e691-11eb-89d6-12813bfff9fa;
 Fri, 16 Jul 2021 23:59:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10693613EB;
 Fri, 16 Jul 2021 23:59:42 +0000 (UTC)
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
X-Inumbo-ID: e332387f-e691-11eb-89d6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626479982;
	bh=2MBU5ETcjLteRXEbHq+jcdNpdKh1pLz2CWkq2mFGPXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVMYXakvjDTTuMOKoVKtItVnqBVWkAfWzFfoPNdV4HAI8ZffcqoDSOG5lz+S0SXi/
	 lhWLVYiNXkBKlzMLxDD6gJ9TwKJLA+3LuSYmd77rdiUhYRQJFOoJpT8uAEAXzGrLXg
	 WfRFbLxgM0Fk2vvU4D99hFgGS5WyGDpk8MNgZ+0Lu+ow38y+FZZunXiyPtdg1C9SFy
	 wbzmpw0Kh9ZMzsqqIgbT86xwY1xusvsGR37piMp4Z257RL1AAyfE0ABJb/uYn9WtbE
	 h6Wqlw1mrRE8aBEdqqK02okLKeG7rxD/94DXytYyJCiI0cLgMT3SMvudsI8z0wt+p5
	 wqWzh9HI31BSQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 3/3] arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.
Date: Fri, 16 Jul 2021 16:59:39 -0700
Message-Id: <20210716235939.9585-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>

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
---
Changes in v4:
- improve indentation
- improve commit message
---
 xen/drivers/passthrough/arm/smmu.c    | 40 ++++++++++++++++++++++++++-
 xen/drivers/passthrough/device_tree.c | 17 +-----------
 2 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 252e8c1680..a065ba3f4e 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -255,6 +255,8 @@ struct iommu_group
 	atomic_t ref;
 };
 
+static struct arm_smmu_device *find_smmu(const struct device *dev);
+
 static struct iommu_group *iommu_group_alloc(void)
 {
 	struct iommu_group *group = xzalloc(struct iommu_group);
@@ -443,6 +445,8 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define SMR_VALID			(1U << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+#define SMR_ID_MASK			0x7fff
+#define SMR_MASK_MASK			0x7fff
 
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
 #define S2CR_CBNDX_SHIFT		0
@@ -871,6 +875,38 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
@@ -2835,6 +2871,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
@@ -2842,9 +2879,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
index 911f82a561..af6c2b2dfe 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -159,22 +159,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F443B267
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 14:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216420.376017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfLa4-0000vT-N5; Tue, 26 Oct 2021 12:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216420.376017; Tue, 26 Oct 2021 12:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfLa4-0000tf-Ip; Tue, 26 Oct 2021 12:29:28 +0000
Received: by outflank-mailman (input) for mailman id 216420;
 Tue, 26 Oct 2021 12:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCfe=PO=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mfLa2-0000tZ-Ti
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 12:29:26 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 98b9fba7-c59b-400c-ac58-dd57c1f87a97;
 Tue, 26 Oct 2021 12:29:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9144B1FB;
 Tue, 26 Oct 2021 05:29:24 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.23.13])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0981E3F73D;
 Tue, 26 Oct 2021 05:29:22 -0700 (PDT)
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
X-Inumbo-ID: 98b9fba7-c59b-400c-ac58-dd57c1f87a97
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	Ian Jackson <iwj@xenproject.org>
Subject: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
Date: Tue, 26 Oct 2021 14:29:03 +0200
Message-Id: <20211026122903.15042-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a device is added to SMMUv1/v2 from DT and PCI
at the same time, there is a concurrent access
to a smmu master list. This could lead to a
scenario where one is looking into a list that
is being modified at the same time. Add a lock
to prevent this issue.

Reuse the existing spinlock arm_smmu_devices_lock
as it is already protecting find_smmu_master.

ipmmu-smmu and smmuv3 are not impacted by this
issue as there is no access or modification of
a global resource during add_device.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
This patch aims for 4.16 release.
Benefits:
Remove a bug that could lead to a corruption of the
smmu master list, which would be very hard to debug.
Risks:
Overall the risk is low as we are touching init code
rather than a runtime one. In case of any issue, the
problem would be catched during system boot or guest
start.
---
 xen/drivers/passthrough/arm/smmu.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c9dfc4caa0..be62a66a28 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -820,21 +820,25 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 					 struct device *dev,
 					 struct iommu_fwspec *fwspec)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_master *master;
 	struct device_node *dev_node = dev_get_dev_node(dev);
 
+	spin_lock(&arm_smmu_devices_lock);
 	master = find_smmu_master(smmu, dev_node);
 	if (master) {
 		dev_err(dev,
 			"rejecting multiple registrations for master device %s\n",
 			dev_node->name);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out_unlock;
 	}
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
-	if (!master)
-		return -ENOMEM;
+	if (!master) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
 	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
@@ -846,11 +850,17 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
 				dev_node->name, smmu->num_mapping_groups);
-			return -ERANGE;
+			ret = -ERANGE;
+			goto out_unlock;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
 	}
-	return insert_smmu_master(smmu, master);
+
+	ret = insert_smmu_master(smmu, master);
+
+out_unlock:
+	spin_unlock(&arm_smmu_devices_lock);
+	return ret;
 }
 
 static int register_smmu_master(struct arm_smmu_device *smmu,
@@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device *dev)
 	} else {
 		struct arm_smmu_master *master;
 
+		spin_lock(&arm_smmu_devices_lock);
 		master = find_smmu_master(smmu, dev->of_node);
+		spin_unlock(&arm_smmu_devices_lock);
+
 		if (!master) {
 			return -ENODEV;
 		}
-- 
2.29.0



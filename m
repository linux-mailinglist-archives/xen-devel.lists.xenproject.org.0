Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11931D741
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 11:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86197.161586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJiD-0004t0-0m; Wed, 17 Feb 2021 10:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86197.161586; Wed, 17 Feb 2021 10:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJiC-0004sb-Tq; Wed, 17 Feb 2021 10:05:36 +0000
Received: by outflank-mailman (input) for mailman id 86197;
 Wed, 17 Feb 2021 10:05:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am+m=HT=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lCJiA-0004sW-OZ
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 10:05:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8e77610b-4e3b-4f2d-9232-281804662c2e;
 Wed, 17 Feb 2021 10:05:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2394B1042;
 Wed, 17 Feb 2021 02:05:32 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A783F73B;
 Wed, 17 Feb 2021 02:05:31 -0800 (PST)
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
X-Inumbo-ID: 8e77610b-4e3b-4f2d-9232-281804662c2e
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm : smmuv3: Fix to handle multiple StreamIds per device.
Date: Wed, 17 Feb 2021 10:05:14 +0000
Message-Id: <43de5b58df37d8b8de037cb23c47ab8454caf37c.1613492577.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

SMMUv3 driver does not handle multiple StreamId if the master device
supports more than one StreamID.

This bug was introduced when the driver was ported from Linux to XEN.
dt_device_set_protected(..) should be called from add_device(..) not
from the dt_xlate(..).

Move dt_device_set_protected(..) from dt_xlate(..) to add_device().

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
This patch is a candidate for 4.15 as without this patch it is not possible to
assign multiple StreamIds to the same device when device is protected behind
SMMUv3.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 29 ++++++++++-----------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 914cdc1cf4..53d150cdb6 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2207,24 +2207,6 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	return 0;
-
-err_free_master:
-	xfree(master);
-	dev_iommu_priv_set(dev, NULL);
-	return ret;
-}
-
-static int arm_smmu_dt_xlate(struct device *dev,
-				const struct dt_phandle_args *args)
-{
-	int ret;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-
-	ret = iommu_fwspec_add_ids(dev, args->args, 1);
-	if (ret)
-		return ret;
-
 	if (dt_device_is_protected(dev_to_dt(dev))) {
 		dev_err(dev, "Already added to SMMUv3\n");
 		return -EEXIST;
@@ -2237,6 +2219,17 @@ static int arm_smmu_dt_xlate(struct device *dev,
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
 	return 0;
+
+err_free_master:
+	xfree(master);
+	dev_iommu_priv_set(dev, NULL);
+	return ret;
+}
+
+static int arm_smmu_dt_xlate(struct device *dev,
+				const struct dt_phandle_args *args)
+{
+	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
 /* Probing and initialisation functions */
-- 
2.17.1



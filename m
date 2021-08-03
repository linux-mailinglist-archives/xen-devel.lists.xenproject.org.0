Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092613DE382
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 02:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163207.299036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiEB-0001Zz-35; Tue, 03 Aug 2021 00:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163207.299036; Tue, 03 Aug 2021 00:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiEA-0001Wk-Vt; Tue, 03 Aug 2021 00:24:14 +0000
Received: by outflank-mailman (input) for mailman id 163207;
 Tue, 03 Aug 2021 00:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mAiE8-0001CH-NU
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 00:24:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20207176-f3f1-11eb-9a7d-12813bfff9fa;
 Tue, 03 Aug 2021 00:24:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B59760EFD;
 Tue,  3 Aug 2021 00:24:11 +0000 (UTC)
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
X-Inumbo-ID: 20207176-f3f1-11eb-9a7d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627950251;
	bh=PDVGbqlEdV9Ni6L4dSAvkSyR5v0MfCHLBfpJr6Xi6wE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2ptlm2X8O1GUrholYR0NLEX5GRURTRo+o3AYkdqS0pN3tPzVxWNj3vMG5EIZVb4F
	 BQk0mvEwFaNkU4PAmYPjC18ukHXk4Pj86wG7N9xAEk+t3vhhNEVJerfWyaxfMKKDsd
	 geaOSBZvpDiUmIiflGzx2f1DOP6LJNdep/zDy5yjaZsn0jcsL57yzjDywC7yWW/S3p
	 6EdtPGCjVHqRYttM7ZKz8M5Pe+4kdKJvL2wK1ZDCWLZqElhlw/CFBj1cCSQ3WlcvvT
	 +oytpDcA9D09zzGh1q7utVQPYqcIdVeo82IaRt/VG3zCw74XegJRL0k7SDvQ7RQsJ9
	 frY+cfreZ53WA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v6 2/4] xen: do not return -EEXIST if iommu_add_dt_device is called twice
Date: Mon,  2 Aug 2021 17:24:07 -0700
Message-Id: <20210803002409.19406-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>

iommu_add_dt_device() returns -EEXIST if the device was already
registered. At the moment, this can only happen if the device was
already assigned to a domain (either dom0 at boot or via
XEN_DOMCTL_assign_device).

In a follow-up patch, we will convert the SMMU driver to use the FW
spec. When the legacy bindings are used, all the devices will be
registered at probe. Therefore, iommu_add_dt_device() will always
returns -EEXIST.

Currently, one caller (XEN_DOMCTL_assign_device) will check the return
and ignore -EEXIST. All the other will fail because it was technically a
programming error.

However, there is no harm to call iommu_add_dt_device() twice, so we can
simply return 0.

With that in place the caller doesn't need to check -EEXIST anymore, so
remove the check.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v6:
- improve in-code comment
- improve commit message
- remove stale in-code comment

Changes in v5:
- new patch
---
 xen/drivers/passthrough/device_tree.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..9249f21c01 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -140,8 +140,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( !ops )
         return -EINVAL;
 
+    /*
+     * The device may already have been registered. As there is no harm in
+     * it just return success early.
+     */
     if ( dev_iommu_fwspec_get(dev) )
-        return -EEXIST;
+        return 0;
 
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
@@ -249,12 +253,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             return -EINVAL;
 
         ret = iommu_add_dt_device(dev);
-        /*
-         * Ignore "-EEXIST" error code as it would mean that the device is
-         * already added to the IOMMU (positive result). Such happens after
-         * re-creating guest domain.
-         */
-        if ( ret < 0 && ret != -EEXIST )
+        if ( ret < 0 )
         {
             printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
                    dt_node_full_name(dev));
-- 
2.17.1



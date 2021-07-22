Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5263D3042
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 01:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159901.294063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFE-0001N9-0X; Thu, 22 Jul 2021 23:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159901.294063; Thu, 22 Jul 2021 23:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFD-0001H5-SB; Thu, 22 Jul 2021 23:36:47 +0000
Received: by outflank-mailman (input) for mailman id 159901;
 Thu, 22 Jul 2021 23:36:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6iFC-0001Fn-E2
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 23:36:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aca6a57b-eb45-11eb-915d-12813bfff9fa;
 Thu, 22 Jul 2021 23:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BE860EB6;
 Thu, 22 Jul 2021 23:36:44 +0000 (UTC)
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
X-Inumbo-ID: aca6a57b-eb45-11eb-915d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626997004;
	bh=ZwhD+RQJEWZ4Vg/B7gh7aqOpMG1wvIPubUsh0/bpBug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aA6eG87iyF3vJlkrAzMd+S+3lAzUzLFxW4AAU8u37PKD9jd9k1SAJ7RYFi/zhhoIG
	 rvlTAADZoczTuoS6quoB6Kz6gWJdBEX5+lZAigvbdE7UGptHe3xst2NC3hkZBchLjO
	 P5jo9dE+sxQKqpZiMVHwA8UC/nrYdyVqMZ1UbKP0zLa5BQ/cFzfMBkPl/Bltxzoacf
	 FHMan59kkNfEYrg2GMkp7qfaTJh2dZh/vYgcPq095TnT44GkPmS4tz7LgEr8mLEH5R
	 nVIpldqAL4VgKzC7QfBs+Dj7y7foQ9h6uSDwxOAY6wyYGOLiu2mBi5NVc6IpPlA+Hu
	 /cyFEA6Bq+1RQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device is called twice
Date: Thu, 22 Jul 2021 16:36:40 -0700
Message-Id: <20210722233642.22515-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>

If both legacy IOMMU bindings and generic bindings are present,
iommu_add_dt_device can be called twice. Do not return error in that
case, that way there is no need to check for -EEXIST at the call sites.
Remove the one existing -EEXIT check, now unneeded.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v5:
- new patch
---
 xen/drivers/passthrough/device_tree.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..32526ecabb 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( !ops )
         return -EINVAL;
 
+    /*
+     * Some Device Trees may expose both legacy SMMU and generic
+     * IOMMU bindings together. If both are present, the device
+     * can be already added.
+     */
     if ( dev_iommu_fwspec_get(dev) )
-        return -EEXIST;
+        return 0;
 
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
@@ -254,7 +259,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
          * already added to the IOMMU (positive result). Such happens after
          * re-creating guest domain.
          */
-        if ( ret < 0 && ret != -EEXIST )
+        if ( ret < 0 )
         {
             printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
                    dt_node_full_name(dev));
-- 
2.17.1



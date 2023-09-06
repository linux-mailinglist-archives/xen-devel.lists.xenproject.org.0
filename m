Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649F793336
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595999.929802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA6-0001Hp-3U; Wed, 06 Sep 2023 01:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595999.929802; Wed, 06 Sep 2023 01:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA5-0001Dh-Te; Wed, 06 Sep 2023 01:16:53 +0000
Received: by outflank-mailman (input) for mailman id 595999;
 Wed, 06 Sep 2023 01:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA3-0006tr-5n
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dd521f1-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:50 +0200 (CEST)
Received: from MN2PR19CA0023.namprd19.prod.outlook.com (2603:10b6:208:178::36)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 6 Sep
 2023 01:16:46 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::58) by MN2PR19CA0023.outlook.office365.com
 (2603:10b6:208:178::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:43 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:42 -0500
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
X-Inumbo-ID: 0dd521f1-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=labp9xYICQHkakEdDLSrjb9llPcSUyeYrLqGh3XOgUj24Fu8VStNtoCrMWUSd8in373Qggb9m9MnzsWbGHALkuo1VYMZrK0wgdyVhCDdVFKujdx1j8lKQa6333+/vqdATbFA3fB46Es3jtim5Bf6vPe+noZektzTz+1CyKl4OdKREj6ECjrpUFGaUqY5spP8moxAOtx0FL9hRUvLsZccIqEC0fv9f7yVDgtRpKU40u4VhOE0prLj+MMcGY/iKKMwGlCYnjTG2ydX9EXadevxiMAeTJ623b66TD+FLaoA4S1QsHiGvweyZGd14aqtxY62Iba6B7vIScZqxYXkv8VWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiT/RwOVy6mwEmWSqI/dWGYlfQVkf5SstjJbmGxz3sM=;
 b=Ow9jDr2XLZ3vRVhvHAAgOq0q13pOVMt8Sl8ZLGiy3rcJh0RwdT4bP8NQgB40t/9VJdr4DblLoLs3FtiFSDGys7IM2DOzX1UwWVYIAl+xn1bnUIgO99QffFldnE/8rOE1wSHPeCSuZNmQ4g9wFPEThMEelfJMTIbvpCpnjSjEtkcu3Q/iUto1L48KeBS/RLKtXNXK5ntYnNOnrqZEEoW/ws2UMGUvnw2v4LPiK2K+VH5KQr9W0W71R3K96ZCwR2rBGjRrFKVAX7UqZy6AcQyOPX+5yN6jB0df5ZcldcLK6XVpP56gXMu2HvrR/leLNmnNR/yRxz+PCDztYmryXUYQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiT/RwOVy6mwEmWSqI/dWGYlfQVkf5SstjJbmGxz3sM=;
 b=3Cjhf2owuTWkYxyH0N4ZHKbk1BEh3GCFYnmYX+aczJD1gxGOPh3wHghLYUZPdb3bMFk7sXsa1sbK9hrwa6GyYZWxlqMPlOjrC7MRVUME2X+j0APt8ukqrZZqVSdUlGNfvTQgPjphvnqo9fIWaHvSQHr4naVUWk7zklmlijVwv1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v12 11/20] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 5 Sep 2023 18:16:21 -0700
Message-ID: <20230906011631.30310-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: b2edb5c1-aebf-4288-36a3-08dbae76efcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3/TOB9lhW9kXRBUR6VdN6SE76ShL9TKb8yIAvY9517DHLbWSLjdyLxjNwyzlwrFCtywYdYUMzZz0pITl/jRk+P7SB3JeM1+SC8Kq8aRaetTqrdWBHWaKDGxtHIhhbt/PliPzVImMPDEGiNCbhAj85r2zsZLGZcg3u6mp3sAhO8ZHomXNu4W8FGyamzHg0VuDatvkGUpRodrztRPAc1CE2mvgjVxRH8j8M03+alFOADIjPqorlux//frxdlYB2Cbf1A75duTJaP5atsETjc8YswGgB7SL/MUNNdM/nm34I7ALIXNE/1By/kADYdawW1OGj1nJwtEQifBS4mYRsIOmH28F91WUBUsNTQqLb20DyOzBTi9U1nHIEY+OyPYYgpM9uxkCdldj24+o4b0JvKABWS6gOlw4IPawGs+KW1UcbVj62OTJLsIzA4aXtGcSyYjpp/8SUMYd7JElsMwRRsc/qXUub0nB3rNk1fBPFq+tzO1q+SNCju293snDMYGOBXQh0z4sIx34OGa5sGez2XXM0Zrt6vOUErdXvWTUTUsO0uam4SRKXA9cK7OvLnZwkCWI3bNpFALN9/WHIdEVTfTAdj2mRmqYo+1/VoG2HCOi3R72LoP6MB9Zx4buygL8CftCSgBQxOzBImgZlZZfOPZzlke5G6Y9qzkD/AdohudVxvdcIeHTm/YWSyLiqhXbzK8YMyR3uV0LPDu4pOxBTwio7RsikRMshurTbwSbe00WbGZXats8+seLHMXLJzmPWSvY0yfNHb7aYQ9ezUVloB8Rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(44832011)(8936002)(356005)(6666004)(81166007)(83380400001)(54906003)(2906002)(40480700001)(36756003)(47076005)(82740400003)(86362001)(40460700003)(26005)(478600001)(2616005)(36860700001)(426003)(70586007)(1076003)(41300700001)(4326008)(5660300002)(70206006)(6916009)(316002)(336012)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:45.5034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2edb5c1-aebf-4288-36a3-08dbae76efcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from v10:
    Add comment regarding return values of iommu_remove_dt_device().
    Add ASSERT to check if is_protected is removed or not.
Changes from v7:
    Add check if IOMMU is enabled.
    Fix indentation of fail.
---
---
 xen/drivers/passthrough/device_tree.c | 43 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               | 10 +++++++
 2 files changed, 53 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 687c61e7da..80f6efc606 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,6 +127,49 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !iommu_enabled )
+        return 1;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) )
+    {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * De-register the device from the IOMMU driver.
+     * The driver is responsible for removing is_protected flag.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+    {
+        ASSERT(!dt_device_is_protected(np));
+        iommu_fwspec_free(dev);
+    }
+
+ fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index a18b68e247..0e747b0bbc 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -235,6 +235,16 @@ int iommu_add_dt_device(struct dt_device_node *np);
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
+/*
+ * Helper to remove master device from the IOMMU.
+ *
+ * Return values:
+ *  0 : device is de-registered from IOMMU.
+ * <0 : error while removing the device from IOMMU.
+ * >0 : IOMMU is not enabled/present.
+ */
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 #endif /* HAS_DEVICE_TREE */
 
 struct page_info;
-- 
2.17.1



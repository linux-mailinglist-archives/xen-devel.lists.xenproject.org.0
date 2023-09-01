Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB478F7DE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594317.927639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRt-00068s-Mg; Fri, 01 Sep 2023 05:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594317.927639; Fri, 01 Sep 2023 05:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRt-00065t-J3; Fri, 01 Sep 2023 05:12:01 +0000
Received: by outflank-mailman (input) for mailman id 594317;
 Fri, 01 Sep 2023 05:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGZ-0000Nr-4x
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7155dada-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:18 +0200 (CEST)
Received: from MW4PR03CA0013.namprd03.prod.outlook.com (2603:10b6:303:8f::18)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:00:14 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::2) by MW4PR03CA0013.outlook.office365.com
 (2603:10b6:303:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:11 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:11 -0500
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
X-Inumbo-ID: 7155dada-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNO8iPyieYQEIv4Pb0LITNx5IHz7P6nm5Ez1dA+zn8SRTuRbGxYAGdyEh4ICZJGvF+w/tYsKr1eCp1I2qyL1HQ3pnjTxazYaxIHvNzXiOLrcJiZZYq58tAqFIoZuh9usv1C+ZwaHqa2g7xU1v6ikFvMBprsn8APMtDoN2h/V4SAYyQnmyaK3J31vQHuqiAjQ7Xw5ZB9HXhToI4M9C/CxuHrw3QFuymFQm+1AedNWcbr7/i+iplMUVaU89YYzA6t8GI4iTBteWLcRysrAUxdMEZf2orA58UvmHrqDSFX/Q1AIa6mp8elGjzexgipT/1JNfFiVs3TSeFw4lSsB5Q8Dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xshnPL3bDlSXz1SSqrZ2OojIbY+USaVA9VSd3/Ty7gY=;
 b=Gz3v70KIQfqQT43Am88qqO9mc8Nvl8+3g47znZtYLbQ5okhw3ybDNTAqtTlPpC/NPl+xWTIADyFH/mTwcTTcT8qQOH93btctB0D5fEP7ePWrf7aVFaONzQr762AmB0yeW+IsmTER6NRUJKdwcboslT5xJhHJOgOROsW80Si4QIGul63TWPLuNWqDGCHABl/eUU/pFlUEuw+yH7JV2Tq3iAD19gte1w9zCi8Djd4KR/6QZizVDwefLG+dtrLZGx6wWOHV3SYBxKslt5rjNaGt7a9/pTeKhTLN9hODXDmkt0+d1XWog60C693FkdyXVsQ8VNd/F8MllqwuEVSUsOIFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xshnPL3bDlSXz1SSqrZ2OojIbY+USaVA9VSd3/Ty7gY=;
 b=4AQy9kWpqTd07rF7thjwCaFi52OgeB8G2KLr9eMxLyhYQivjDIgJssvff50f9IzqhhOcZWwejp35WpBggtKZSthES5HPkey2hPajLegvk++RzSPxQ3MjHf48BdiPJRGZyIWcQD81gYb0jqnSd4iWKE2+vb6Z4jQ1aI4DHbGTtD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v11 11/20] xen/iommu: Introduce iommu_remove_dt_device()
Date: Thu, 31 Aug 2023 21:59:38 -0700
Message-ID: <20230901045947.32351-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: b50ebd9f-22f2-41de-2318-08dbaaa853d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v5cnateb2uNiAYBoNDWZyKBwTnTHdfPsjbJn3MYnsZfArk/CbLhxQIuEXQr1RJ9w+V+POdMwrXj53o8BTVaoVYmO1lIAQ1+LjJ699VzyrLkubZ7VhRB8dWJ8dG3UC5ODid1jVHgd+4TmlZ67otkEeeZR98arF7eTe3C+iYMitgTSbDE7iArb1yb0kOlH8SZlt+g9BGmeJ7HnKRkhVrH+9pOHMWeiamo3ftJxWouBsPqnni8X6F73sJk0DhJJUwac9c5hGT2q7mxNz8pLS0/t41KFF6brGIFOdSxWWwWicCGSPCsNb9NFSkjlqzMicgO/uOdZebDe7WFvi0RFdvGT7myfl3kXaX5rx3PovLfufKEtewhSh1sNdo7+r9JYpP3ULBKHAhWOQM1yJwYjxT3hHbMy50KQVD9Q6/dCTZ4JbA1GiEqKfb/vDBvJT3aNTUPjs1pCILxgiFMv4Yb5CXn9XAAnVS7UnpNlqqj8DYYoXiuDOU2H4rPFz6vLigJHTF4g/JeCZ3gBipPwTgR9bCIkPxE2CRvx9UfeDHRg6JW9L1u8oZ0yN6RwhhwHTwaz+ZmINcWdj581GRpjENaDHLq/f8pfJkDdIssAgWBmreg6HxagjUdtA9WfS+M4iOx9TuTNJSAxkXQNzRHXoL+2uM4zlCtB9OHL3Q5V7A+8C0fifQX819cKsrims8Ietf6qjlUd49xet/9OfbXocymoI62TzphPgV8iXv2NP+9Che6UjsGHz4WB3nsZw+hKti/ey6Nfd1CCmOAshUVz2ZN+fsmfZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(6666004)(2906002)(5660300002)(86362001)(316002)(6916009)(478600001)(2616005)(4326008)(47076005)(8676002)(36860700001)(44832011)(8936002)(26005)(40460700003)(1076003)(82740400003)(40480700001)(41300700001)(426003)(336012)(36756003)(356005)(83380400001)(81166007)(54906003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:13.8418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50ebd9f-22f2-41de-2318-08dbaaa853d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

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
index a18b68e247..84bd77395e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -235,6 +235,16 @@ int iommu_add_dt_device(struct dt_device_node *np);
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
+/*
+ * Helper to remove master device from the IOMMU.
+ *
+ * Return values:
+ *  0 : device is de-registerd from IOMMU.
+ * <0 : error while removing the device from IOMMU.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 #endif /* HAS_DEVICE_TREE */
 
 struct page_info;
-- 
2.17.1



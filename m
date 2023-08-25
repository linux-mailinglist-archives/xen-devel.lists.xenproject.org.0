Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB9788174
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590550.922905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmh-000051-Cu; Fri, 25 Aug 2023 08:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590550.922905; Fri, 25 Aug 2023 08:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmh-0008PU-8U; Fri, 25 Aug 2023 08:03:11 +0000
Received: by outflank-mailman (input) for mailman id 590550;
 Fri, 25 Aug 2023 08:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmf-0007GZ-Dn
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:09 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ff9b4f-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:07 +0200 (CEST)
Received: from MW4PR03CA0249.namprd03.prod.outlook.com (2603:10b6:303:b4::14)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:05 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::e5) by MW4PR03CA0249.outlook.office365.com
 (2603:10b6:303:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 01:03:04 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:03 -0500
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
X-Inumbo-ID: d2ff9b4f-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWNPiWb3YD70wFh53GavZgDDzG+nma8HVHJRYu1ByCAl4B1bBrMGMzepkBg7hjLCDf0irxjwq+/dkjmvwyLh8W9gI/EbpTpZ4KbGe+J4oWKITtnP2ixhK5IFKFNKlfgNB2W4W6yXmmxsrNoGugA972xqKVVk/JkkiJujjfu8Gh6VswvaRr9PoG518vQw9tHfe/p6qoB/ATg7sBBiBISt62P9LBAmLlTJhIsKOWzYAq7C6qO3wACEuJCH03qqFCeUBdK/EX7t2EmQlIn+OjN7xLABgmNr2Zrwn8RSZU1mXw91+GumTbWAbHmJ0x8CDKxQR9onxNWSZ1RD5QsMM/2QlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Boh4kb43qvVkEeoNHrUhygxa2MEH5SiaelWzI7PkkUo=;
 b=jh6ttUYC3O0vrtXPslebnTzN4GQBX808QJtWj4wKYnx0RXrp60baoQgzVBxuRAWx+l4n03XB3s/riQQeqZBYB01BZL6kkUicuIM3A0krXCH42zFol/dQhzcAjgY1dVDVUAWciDWrlKgzK0vxHJEf9rn+URLVo8TxODp2+rVPN5H7fHVnKfu31YbPVzDzA90rBRSSA+o/5S0fpngW5qKzq1qLhAR9aFfWHzC2UVSKwCdcpaAZs++43rDz+UvEpWGcEDVhf0gKHIsDtsMu8xpebto4cmOTOAlWlP6UK9n0K36C42iU8MmTrZ58H745g/2oNjruUCGylcJ6CfASiSb41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Boh4kb43qvVkEeoNHrUhygxa2MEH5SiaelWzI7PkkUo=;
 b=k4pef2kWh9k89xzpQrNYQ3RJjekrvQIdUCqflnCSPoBiGEO4o9hCpf/W0NFINUhE40I49yUJzyPLxZ0iCSFXEEsLpSILGT3coFGUxgTwrYr9fXtL/GiRC6brmiDB+nO8DrpZ6mx9NFkBLdd9NVoqu2wbrAYZTNJx2N6kkQzi0/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN][PATCH v10 11/20] xen/iommu: Introduce iommu_remove_dt_device()
Date: Fri, 25 Aug 2023 01:02:13 -0700
Message-ID: <20230825080222.14247-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de89e45-9635-45de-48b7-08dba541b620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gMuMeDQo3wgrhTbne2aKcCyLrCINgDWk+tKpnZoDVvh0DmY816BzoAif3FciHs73+pWBPr+MiVwUpyK1Uy4wldlCm/C8whdLzEbMHAo9HCGSBLAf/lfb+fphV4tRRcYPWGUUaSDyYrMrqoNnbNDUcHBvJZxtkVGQzGvbIQ+SEorVwLovKncigb/rSJRdjp2rETf6dHrRDu5l8lYaZ6ShGYvUKcMY2ehJuypFG+nbKcZ3eQjvpeyCvdLKbJs/qhoXcy42vTOG6WM5PzVUSAwW4qvzoQEjYR8KCMUMqNe4r2njtQA/Ti7PXWkQkxNkFp7xiOxLzjEtbfeIpRBxE9eI77xIBy9fsEyFBFEDXAJqmfqhOGL9tkppvN0ygHgFvE0tDyVtmTUVs3/lL8q5M//upU5hBEpb17ZZwgoQz1CJbBPc4MsVl8LMjaNqWPvCXRLUJsSax1svRPBBnwm3060hf9FfgMGSk2xY3wtxI5TnfCzfj+hbhdIilcryQ5eHjsUiJiTg212c4NfTl96GPhQB8t3VuMCggjbPUk6DDbXd5eGnKWpwy+T5Jq0O5OZVyb8Un987h5AUTytVIFyBJ3aayQK3iLJzSRFmTH48QOMdKmJUAYxsgxYhE3ys5KULjoCJ1QZU+EmCduK7ABiYl7xwicD2rzKLx3WSIZAwAqJLREzJNxihTcFdmNMoA2RKyggPSvsVsBCIDiPXWp+dss2Psg+mSrOIi2SWwK9cBsyYSq4Y/DcEFpceWlX9WuDWC9pYSMLj2kU4ZOI7wL7Jolhy4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(83380400001)(336012)(426003)(26005)(1076003)(2616005)(47076005)(36860700001)(41300700001)(70206006)(316002)(6916009)(54906003)(5660300002)(8936002)(44832011)(4326008)(40480700001)(8676002)(478600001)(6666004)(70586007)(86362001)(82740400003)(81166007)(356005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:04.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de89e45-9635-45de-48b7-08dba541b620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changes from v7:
    Add check if IOMMU is enabled.
    Fix indentation of fail.
---
---
 xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  1 +
 2 files changed, 45 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1202eac625..3fad65fb69 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
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
+    /*
+     * The driver which supports generic IOMMU DT bindings must have this
+     * callback implemented.
+     */
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     * The driver is responsible for removing is_protected flag.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+        iommu_fwspec_free(dev);
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
index 110693c59f..a8e9bc9a2d 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
 
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+int iommu_remove_dt_device(struct dt_device_node *np);
 
 #endif /* HAS_DEVICE_TREE */
 
-- 
2.17.1



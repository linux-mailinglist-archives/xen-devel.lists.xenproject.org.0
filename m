Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0278160F
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586701.918030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qG-0004EK-Dj; Sat, 19 Aug 2023 00:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586701.918030; Sat, 19 Aug 2023 00:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qF-00042u-SO; Sat, 19 Aug 2023 00:29:23 +0000
Received: by outflank-mailman (input) for mailman id 586701;
 Sat, 19 Aug 2023 00:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qC-0001hl-9Z
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e89::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e54e402-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:18 +0200 (CEST)
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:14 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::46) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:12 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:12 -0500
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
X-Inumbo-ID: 6e54e402-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTvbpbHURLYVZIk33+9FqE2p7mFK+Rxz9TJMNoDK27JlBfUXvSP+y9R1/fw1fnoyurIjKT6RQidlBiK05gCVhZGc8wYHyDMmO8bOUD8pVfl2Aj4HGuHq1q1qibcsvSQh0bKkjlzjVyaF+zENWtJ5GYz+TW03Sk+/pRl/nHliil2rzeL0O4Xacj9xuk0f3y1jDRxYe1GxagAc44PesrsZxWoskRG/+9/7B9qCn294w7afXZ8g7tDR1xdlXhVAdYDJWz720PoDEMFJmKLo9mgFrAfArCrIsLd5JpFepA0iBrhtxnozebFrLZF+fGtVZviekqzCeHJPNyk3ErWR9HEjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkgaOMunYhLJojaFUq7GpIVcWqHAH/4vWBaqoyKkco0=;
 b=Tu+hs8WhZ5iejImEZ1e8ZgfWEL0tvhKW8zdzLob0NtMqQwE66ev6078Ri9s7J+ZRp+TbQbUlR9Sk7cQ9trCkSu1oyu8rvHubVIid2f9+hK/4kyPzfM7Dlcq6RQOPKltupJ6cenoauuU1X/CvrjYwESRMcrp7uaJ7HF5k7eAo3aIkWDj2DPyr2+kskbALWz13PVfZ5OmaL6atjAZ5vGqfKuhuHAif9gvc+uGy/eALhIk+Tpnk6w1pNyuOuzPmC3m0nmHpkXMzpSjIkhJYpxA99Yc8T6egz1lrGlB3zOQQk2yIEQ+3FT/qm59y2jfQo2WsaDl0ysHLvh8EzecjPF2A0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkgaOMunYhLJojaFUq7GpIVcWqHAH/4vWBaqoyKkco0=;
 b=VlxCO9AJjPg27Bdeirua8lAXFlqjjT7unqzb536anLNfQeGMVqKTzca82eSWFCwXfLk3wEapmgvn9IPTxpr689P3gzM0edPLpkU9MMFSD4DTceJnaRZah3W83uS/uwKEF+7CP8MEuVXkoe6CNPI6XDGUTKhBeJlIkYBFrXTP5Os=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Paul Durrant <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN][PATCH v9 11/19] xen/iommu: Introduce iommu_remove_dt_device()
Date: Fri, 18 Aug 2023 17:28:42 -0700
Message-ID: <20230819002850.32349-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ead8b6f-1022-4549-0c7f-08dba04b508e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kl8XK4OunBYC3R4iMs+7z2Dx3BacsubH0vTI/JLeUAtp0+Z3BJ2iZCL2kM/aZPmYylG9UOm7sCzifnAKQiuvQI5H3kBWr/KLbtaS4q/rIyfWsrLCEWKz0RWg7iFvgWhAMK6ld1FfS1f40S8ObHCj4GucilxAxmlkOH340/dyDMtajHRFzlfMSpxg0Fh3W35ChHnG0VA4hNx8Bv9p0yXucpEU4wLPmFCKoFsssglJXZDcN7RRsNeU2nQxC6QRMBcFgupFsloE6B3L4j9WW3pzCorRspwJPO6XiJrHeVIKwkoP0e398VzN3u/npFRQCdUBAOoXAb65czjZ6DE1zFCBeqwef+Y7NSoc1v9hXx4A3eBm3S8oQaR97t/Apk160g/p8WrGuxezz50LW15F2Siph4Ov5kVxO3CeqSoAVFp07E5gmWG8ZuCn1MVgR/wbeyazl/0XGqwGtDNYd5ohCFPfRN7D2eRvHHtafkpb9T841GxAG1TuVlYgRZ07uL5Gtb+Bd0QzNytT+IMaja3OuzuFKs9hwFMCbDljL3H0Gtuw0F2MxFfmApJ0PxIr2vujUz6UuYcpAGU+X/nHyEI6Eklk1YnU3YbnKZHsHHqY8i+wJVXeDlm/JFH8CKzhdvVE65psX4pp53NR2qcXxNzCSHH9sUWHQo/wQP/k0k3dc54TPv9M44ygny4WQ5GAIuypBzJLAFhMFrxDd81f2vj37gj08+qxa9yWQkPG9RepUfv5CYaa9VhZ1R1RpIDhYTgqcWl3PGCZCxizTFHgot5YSRYrCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(40460700003)(36860700001)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(47076005)(81166007)(356005)(82740400003)(26005)(2616005)(316002)(2906002)(6916009)(54906003)(41300700001)(70206006)(70586007)(86362001)(5660300002)(44832011)(8676002)(8936002)(4326008)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:13.6128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ead8b6f-1022-4549-0c7f-08dba04b508e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551

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
index 096ef2dd68..4cb32dc0b3 100644
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



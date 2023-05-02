Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A06F4DAA
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528871.822637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ7-0000lI-Pa; Tue, 02 May 2023 23:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528871.822637; Tue, 02 May 2023 23:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ7-0000VP-B3; Tue, 02 May 2023 23:37:49 +0000
Received: by outflank-mailman (input) for mailman id 528871;
 Tue, 02 May 2023 23:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ4-0005Si-IQ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54ed58db-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:43 +0200 (CEST)
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:37 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::c6) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:36 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:35 -0500
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
X-Inumbo-ID: 54ed58db-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnzedPcLVf9AgNtKSrsWnxlj8wg/n0b35HQajSB8VeMk4/pP7cndeadLyZowOcl2cp8NM5Php0iB6EEijSr27Gcr6oW5YxBvmLqan8hePFHoBA5z8xdMPfKDTamtWJK6IpxtnoDCI9SeL+WK7LJTuFWhKNAIRL+NdnJ0FBQ/cQyBL8XbJIUfuBHGHgrlwky19/krsIwZ9Skv1eUOqyI1tdoS/SIGj21ZpfUacUZRD4ipLXElLbe4+FHqUPd47hstrCmvywKSfZHcubZ15rpdxhjTXVTD4X5T3SiSuexWs5l5ITZkTiXtg8e+NkVOv6HoD202Y8xKvgoADEnXjVu7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIRy40Pphy3puPxLyarufMzgZUdXxhJqsOpQVvIQDWY=;
 b=hUh4Ds6KIjy/4l/tB4nJ3FwOgDFMEgiZmqb4yxVATYO+IOx+kG3xHZS8zilSoIVmBglcIUo6LhW8N0KL+ZE66jVfkv6sI4Ei+3us6nzoco9EAKtcuK3sFkpvZwkdFRncjFHPfWEbAj9dH4fRhCiwmjM+HqHgsDkvQhOl2UFtFm5QxluZsBkNmu9QetIzLlQ77P0p3Tumwv613ZgUCs+gAubxx/yQiYTvYWcXJw3BiYiTM9kHFNkdGJYydGQcTMviMfyfSViCujx29GugZbQ2twaF4jbnYsBIWP84S2dICBi7p7hwqPwN0rt1AoDgDjLDJ1hxf6atjmg9BbgDWeV8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIRy40Pphy3puPxLyarufMzgZUdXxhJqsOpQVvIQDWY=;
 b=Q/vuMHZ8fOVxvR+uIcHcM5KH/SxWuak/R7bE8S7aLTxzJu0aA69UCBk4z+RcfrbI/eNljptrJ1S/C/+1SkX5AUO6FUgc6h5GxXXpkyB/cYLkV2Law6ezhiZ6LuNTcuQ/N0Eg9OBAgvy0i+4aQrIdO3C1mjAgdEmVTeHyi1cRViQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v6 11/19] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 2 May 2023 16:36:42 -0700
Message-ID: <20230502233650.20121-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bca90a4-d19f-4adf-e3c7-08db4b66364c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mzjbtg8HLssdAgmmIu3wUMMiNi91uy0HTN5DYlJM0B0ON8jJCxHlcp05X1gONEuw9Oc9aAAkv+VsvX5rXJB+IDtvfdptl0OPABfZkC8hOeVvmaLUJj/uHlvze+znXRGJvmukIUrLfu/0HUmPlImEE9I2g7+JnNZBX0bRZiw9zVDjP1BHgMaMysjnJlSNJE8R2rBETEiD2OthCc7X1SmBVh97APnSTMDBTM96YtBhuWENBFZru89Y31VeMxXbo9PjDO1ZQV5xAU3lNvgXjSDG+r1TclAGDFsRaEgg8Sfs4U3cfCRgubWjassDtP/MY5RbsqS+mTrXHFO7VyLsPZQMDO8xA4CdJ3xZRHayJGBxf1uGpb15h/Rm01w5QJ5v6S2+99dN2sy/n3JDj3er/Adl+xeZd6Kp+sUKAE+xMbUcOuLhvqn9LCegjapwsNzrpWiybDx0SuOkkNLfwWcwjGvdTSe9k0KJpLXmH30clwUls/CAwOMlIV5Gb380W9oMSk0+hysSA2uq7C0APc6XI5pyyej24WoLWviAjsjbITzBwqI8h4+mrZTsWiy/tWaaJPNKC6QEGLZ2SUNpBRvWZSYzluTAXGClYkmSpmyImqPDfHFsQZRGKL/AVXBDTEEryo/lAtTmPHUsjcxD4OGjKX1CSln//eDn2adIOoy9LmYcQPKQQ4U37/jgo3Av3tIChk5j4Z94PV5Nm8WrQ3GkreUCWXNSw6vt3wp/qXUzN2jeerY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(2616005)(83380400001)(478600001)(36860700001)(186003)(4326008)(54906003)(70586007)(70206006)(6916009)(47076005)(426003)(26005)(6666004)(336012)(1076003)(44832011)(316002)(40460700003)(8676002)(82740400003)(8936002)(5660300002)(356005)(41300700001)(2906002)(40480700001)(81166007)(82310400005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:37.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bca90a4-d19f-4adf-e3c7-08db4b66364c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 41 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index f3867ef1a6..46f9080c8f 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -125,6 +125,47 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
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
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 76add226ec..6ba8d73966 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -219,6 +219,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 /*
  * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
  *
-- 
2.17.1



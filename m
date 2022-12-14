Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6364CADF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 14:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462253.720426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RbA-0007tG-K5; Wed, 14 Dec 2022 13:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462253.720426; Wed, 14 Dec 2022 13:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RbA-0007qb-G9; Wed, 14 Dec 2022 13:15:00 +0000
Received: by outflank-mailman (input) for mailman id 462253;
 Wed, 14 Dec 2022 13:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNn6=4M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5RVL-0004OH-4V
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 13:08:59 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76fdbbb6-7bb0-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 14:08:57 +0100 (CET)
Received: from MW4PR03CA0080.namprd03.prod.outlook.com (2603:10b6:303:b6::25)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 13:08:53 +0000
Received: from CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::b2) by MW4PR03CA0080.outlook.office365.com
 (2603:10b6:303:b6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 13:08:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT095.mail.protection.outlook.com (10.13.174.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 13:08:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 07:08:52 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 14 Dec 2022 07:08:51 -0600
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
X-Inumbo-ID: 76fdbbb6-7bb0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUQdE8+lay1DP5VkJbj41WlkTYGl8l1w2mXV2LuUGsfDBlD32fd2m/qSXeImE6OpoReRjh5IOgRBtj1zaXBi/JnLsJgroiWeAIo5BBUZaMs98n/Bcm9UEPHA4MHyf6a3HpA/dVvUXXLvGsq8bO61NolPcViBbFNJd59jxPFyuMDQOIRuAK43C2co9mc/M0rYCMxsbnb7G+kb+idvD1IekDYJqzeMVhQ70X4A2JaZ8ZIK5HKVaWxrHBJvjE8myPUrhCQbyTDbdijuzrIBMzCqb4gkaRlgaGVLypDCu+IIRo3Q0xlvulThJjXVw9T4qGoaL/xDRT1G5xEEql724ENqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH+BOqeC0u8Gq46j2YibLK0oAlAp+LzB/ZPsy4RmlEs=;
 b=npjKoHSLWS+nOongGwHbHkZST/gPjkuRzJaxGYYzkdZlwglLuMlQN6jlFHQuTvNfzltKxdfV9uHyakm5235FCljroyBMMm6Wwe9bW3WXfI0W/RoivoSL6wRzVm8tFRvu+aJZhcO+322Ab7dlI3TVI33qTEt57lXGg3iYJknLQtve4SHKshnmCMnbM2Q1ho0YhS5MPCXek6FTZqkjbLQZ3hHqE6BvYyrEN2x2U8kSnPDzOPU9DShZ5d6FRiZESW2Khl6NmYexB7ekkgW3G6yWAscCaDqD3+SUqakaXk7hdPkYh2tRXEZMt1TnhU7lA/Si0jXZVSAQ7nSJbFB7B7YPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH+BOqeC0u8Gq46j2YibLK0oAlAp+LzB/ZPsy4RmlEs=;
 b=aGZRbIWAoVn5Q6QdHvHS/4o7HsGr/GbeYFWnNeyEN6S9W/Wuxq9xlLrMAy0VTtdkAmYtUZqfi+pJuV3hD123mNCfFNX2cGsQtN6fBzqeHkKijbw2u3el/Y52TDXhj9RxO7UTh8qGWLWMuD2gvuXkQQQNP9+WQB38QTbCzbH6mAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Allow to set grant table related limits for dom0less domUs
Date: Wed, 14 Dec 2022 14:08:33 +0100
Message-ID: <20221214130833.543-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT095:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 7daef9da-141e-4777-23ba-08daddd459ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQBJ13t6F48mn746QIghJ6CIlGZPYJ8OD1Rg5TxszrzPG5ylyYExHUQ2Jx+geJpgOAhXcRRc3eS6xSGWOCAi6un9/dPyUrLUyQpwk7FcdXMiK/1TAvlWwE6OEHyh0f2UanCKh+xK7HkTOXTE8EPGMo298WmDKEUNnH/T35JVLepxN/2RFtPQGkb/TZzpOX5/frc6EL5Z0aHdlLHvpacXB94PL6sGNZRlkUqjd3+/JFLly+CYTznxLMwjHyCKDyPsKq3jP4P8+o1lBqS2QTMossSu2EwYFeDynWft/HDtIRRlh302/Ifuz+UHN5z7bqpTBG39vFGtn3fYWNrYjx6w5LRBC/UtMzqow05T1XMnw1Ihj+lfzpNo3ByUJ8Kmp0dXZPEerlwYDpZdfPNaU0ku6ta3pd3ENggbe1I6m2WMjQlvTeAQIbjMrcuHTvn1a6op/EDR/sk/5zv6HuCDH5I9igROXKQpQTXvJ+PYs4xGS+7xT3UHhcWAdaBXplX5QfnK+vsuG/zfH4YBgUzZHiKdAcOVdOFi6yyL+UHcuaK3jWnmaMn9QrmmvMLwRfqW5eM6gVzFS1ZYTWk898or2u8jx2yapPw79bD4GHfciLlryc3fvsI1OJOWOWOPL3Se5GSJKiNSXBWmG0yBLst2Cm9fUInn3LpFAWQ/3VR9nLimImlAYu1q6KzNN05H/oSfg/50mEI1uMPMNyCgWqDNYUTO12wQwifruFcsZLBcm/wW8pvpmScsFKNA8P3u2meJlUDK3DBFFvOAy8vIUnBXt9XayQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(316002)(478600001)(6916009)(36756003)(54906003)(2906002)(356005)(81166007)(82310400005)(83380400001)(36860700001)(6666004)(47076005)(40480700001)(336012)(26005)(186003)(82740400003)(1076003)(2616005)(426003)(86362001)(8936002)(41300700001)(5660300002)(4326008)(70206006)(8676002)(70586007)(44832011)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 13:08:53.2804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7daef9da-141e-4777-23ba-08daddd459ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537

At the moment, for dom0less domUs, we do not have a way to specify
per domain grant table related limits (unlike when using xl), namely
max version, max number of grant frames, max number of maptrack frames.
This means that such domains always use the values specified by the Xen
command line parameters or their default values if unspecified.

In order to have more control over dom0less domUs, introduce the
following device-tree properties that can be set under domUs nodes:
 - max_grant_version to set the maximum grant table version the domain
   is allowed to use,
 - max_grant_frames to set the maximum number of grant frames the domain
   is allowed to have,
 - max_maptrack_frames to set the maximum number of grant maptrack frames
   the domain is allowed to have.

Update documentation accordingly.

Note that the sanity checks regarding the passed values are already
there in grant_table_init() resulting in panic in case of errors,
therefore no need to repeat them in create_domUs().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
 xen/arch/arm/domain_build.c           | 11 ++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 87eaa3e25491..3879340b5e0a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -223,6 +223,27 @@ with the following properties:
     the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
     per MB of guest RAM plus 512KB for guest extended regions.
 
+- max_grant_version
+
+    Optional. A 32-bit integer specifying the maximum grant table version
+    the domain is allowed to use (valid values are 1 or 2). If this property
+    is missing, the value specified by Xen command line parameter gnttab=max-ver
+    (or its default value if unspecified, i.e. 1) is used.
+
+- max_grant_frames
+
+    Optional. A 32-bit integer specifying the maximum number of grant frames
+    the domain is allowed to have. If this property is missing, the value
+    specified by Xen command line parameter gnttab_max_frames (or its default
+    value if unspecified, i.e. 64) is used.
+
+- max_maptrack_frames
+
+    Optional. A 32-bit integer specifying the maximum number of grant maptrack
+    frames the domain is allowed to have. If this property is missing, the
+    value specified by Xen command line parameter gnttab_max_maptrack_frames
+    (or its default value if unspecified, i.e. 1024) is used.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bef5e905a73c..29b2f3e1faa2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3871,7 +3871,7 @@ void __init create_domUs(void)
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
-        unsigned int flags = 0U;
+        unsigned int flags = 0U, val;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
@@ -3940,6 +3940,15 @@ void __init create_domUs(void)
             d_cfg.cpupool_id = pool_id;
         }
 
+        if ( dt_property_read_u32(node, "max_grant_version", &val) )
+            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
+            d_cfg.max_grant_frames = val;
+
+        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+            d_cfg.max_maptrack_frames = val;
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.25.1



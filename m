Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F1A78A3D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 10:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935212.1336654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztgR-000371-TM; Wed, 02 Apr 2025 08:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935212.1336654; Wed, 02 Apr 2025 08:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztgR-00034R-ND; Wed, 02 Apr 2025 08:42:51 +0000
Received: by outflank-mailman (input) for mailman id 935212;
 Wed, 02 Apr 2025 08:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tztgQ-00033V-3N
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 08:42:50 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2409::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c5cc82-0f9e-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 10:42:46 +0200 (CEST)
Received: from BYAPR07CA0079.namprd07.prod.outlook.com (2603:10b6:a03:12b::20)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Wed, 2 Apr 2025 08:42:42 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:12b:cafe::e3) by BYAPR07CA0079.outlook.office365.com
 (2603:10b6:a03:12b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 08:42:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.2 via Frontend Transport; Wed, 2 Apr 2025 08:42:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 03:42:40 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Apr 2025 03:42:39 -0500
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
X-Inumbo-ID: 72c5cc82-0f9e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMnn8nk28POYOKQmlAt9Tfpj1cDe4RYw+WuEsItd2fo1QOA1JHr4KJ/i/nlUKvNkMoHLnLADXtqyr8iT7X2cxV3daYweQNNyWIwo/kF2Y1aMRCvVxkksdCg+WYD55N3KpzPC3Shh8LIvgely+cVH7GapcwV2WqZNfvXBolu0gCl6s3ro1GKRYuM3MNLwiq/tFnaa9diI3JU2LayAq+t8BiJ4Wyhk1RMZLYNC3pCwyvD/zwxpEH2zpDmlPKSV/9fQg9xWURaQSpSh2dsrLNrO78J/4Z9/cTulqCun+c2WNtOmCxf5890eUVzamei4N2K7RQC6DJbkZI9S/7yQG64LxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt9owdaK4rx3uvVkne5yzswFleGRsEogC1xMHaEwPi0=;
 b=uy+IFskTmkSHfmWh8ZhH3d+z45YE2kMcb0hLIZgr0kIr/B7sE6l3FYJHExA7y4zLbfaYcbPIWKvYMbgMo5SeVPgMclUL0XxrYMH+gub+JOit6ZAoZ+4PhTpTEepHo2LoU7pa7h9AFlbLFi+awZ4/zDdm8B3G7yP6L7M+eAbCfpIl1I2DvooaRVICzp9blxYNAuZTtaHlX9tbLhDrATtjEpU00XojP7jIgmC0yErKTNcytOthjHzmcp16TpEX2gYCbrmLt0J6YbqJB4xk9pQtOm4G2cgK2PuGbxWu6rDeTKAsZorFwlHp/ZZQuvVDh439RLEnyRtWyXkrV7CZi66neA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt9owdaK4rx3uvVkne5yzswFleGRsEogC1xMHaEwPi0=;
 b=xZTdyLxiozEQwzgVzmfDpfvk9j0QjaGCbDZLA8eH2+vTnqzy3QpaWxVvNokZ/ekGmz4CEu3b7xHCylOZ1ou9MN7oolfmQyb7BJByWIxc2fEq2XFwreDN+t1swK7C0iGhMEkHMu3CJ5JuGxcbI1HCqwhgOY2IvkiVvS3vmr8fLA0=
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
Subject: [PATCH] xen/arm: Don't call process_shm_chosen() during ACPI boot
Date: Wed, 2 Apr 2025 10:42:32 +0200
Message-ID: <20250402084233.114604-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: d251b543-caa8-4c42-04b1-08dd71c25496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BsAibWzC8XWglHH5j+Am5tZ7uTwZAxvYEl6e9eV1bXM80ypXdajMrL/GlCmx?=
 =?us-ascii?Q?msE+IHniKIRzfP5EseN6whRIlVgyFJOjYCicJB/0l+0lcC9NtEIF4gr5YovV?=
 =?us-ascii?Q?7diTuBWZDWQhAU19nXhspGEwggXKHFUJJ5oejlBzBky5a5o3MN2kIVEeX0kN?=
 =?us-ascii?Q?dGqhsa5zeCCwr1HdVgIX22pOfGn3/+2UTlmTIYG1mi/4lCFs2pwoLFc/kUN/?=
 =?us-ascii?Q?J4IzPAAXeQE4xL0cE6jXyvYI2NbP+BewD5rDCyhigMGUWjDUHQfEVB5CqCff?=
 =?us-ascii?Q?TdxrPWnmk7kRUA9OB0yyWgfn09X6LfBKFYNwlgsNPLH4Oa9SfTqHSFQXWY4Q?=
 =?us-ascii?Q?Va1dzeKYjp+2jzh45iY6EQlmEd329qWkFAgOk6bLp9go1n4MXs9SjUcnHakE?=
 =?us-ascii?Q?ZK50kSv0n9RDJHPmt+0nbnoPaLp0aL3GmrOemw+SGgNl/9teoA7lmZBtua6l?=
 =?us-ascii?Q?VmMGya9zggB4DSDEWdnQ2GMn/qWCBC4HLHwruY3QNLxBbMR+NZLrQwGLi5Qz?=
 =?us-ascii?Q?BNo4e0BzHpTzYIxDUbP0qP5Zjxeq3U9kor+M8X8PXuvUCglXpNc4KP4xmwe1?=
 =?us-ascii?Q?0WU+wuI3HA3xszJYNPKUIAyIxZrmkKyzNepafMi5E6wSYCswyDDkYP86LUGU?=
 =?us-ascii?Q?3686c74zLx1yrOpP72CrDrg2zmodv1Z0s5iryya+ktzOAr48+Gttxi5f2wTe?=
 =?us-ascii?Q?fX5dCFAhOThrpIBe5euNcds5pctqPDea9XwmUzH3gYa44rm7lmk8y8BFXuF0?=
 =?us-ascii?Q?Hf3IHmmZXxum1CQd3oXXB8ykqE0CMsRMFLLENIh1KPjX+o82bpm7S510iAzy?=
 =?us-ascii?Q?z6/OSgyUbF+wYG6pPCWWTsqf1A740bw9XZc20osT917QlC5hjeU50NcA+iLJ?=
 =?us-ascii?Q?abtjVeBvEg8cpSnUYZkQKBYHppHQokmqdNKA43FRd8/zNAnIUtG7/3lvNaVx?=
 =?us-ascii?Q?5qbrMABRxcyUCjZeIGBJ/KPBfjPg6QyeZ6B5KSpSbtk3Pf3t3XIAhTOvjZ51?=
 =?us-ascii?Q?HTaZoziICDcVkxniz2T94iiTmafqezfKO1o77BoEk7n/ExhCF6ZEdtlGbUcc?=
 =?us-ascii?Q?9nn3Fq1D/31n6gbeWgENUekFNWRH8ncpiGUzwvyY9URDjWeOFKByKQ/wtusF?=
 =?us-ascii?Q?yUS7Cdw825DjHQvIZS1DZ0Cee0C1qR4duLZB+Pg+ukWl7TsF37yNh2/4lBCP?=
 =?us-ascii?Q?/kG067DhRP3VHXbJLlgm/Fuzv8XM8XlBCdmQfgWUjj5aYjOgEO3MH1Sx5V27?=
 =?us-ascii?Q?1S7fQkGMgoevponhzkEweE1sGVdLiDwOrnWxYuHpxCoZ1S6XfLIDp5jjcf78?=
 =?us-ascii?Q?gRMbF8lFbueOp+iFShJV1PDqL2k/+XKPdMoYJqcp+ZynaYblWs7qqNBhuymx?=
 =?us-ascii?Q?H1cmjya/MZyajvBHtiOA+QCYhOuW5ZtSUmyGoZJhDyzzi2gAar7ekggpkm3X?=
 =?us-ascii?Q?b6IQHk4MP++AvGE+C2srTdAfe4Vz9zlFodHjo7T0tM9PGJ3sL+RvEu3tbFeW?=
 =?us-ascii?Q?/vJE/zgCxGUR80Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 08:42:41.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d251b543-caa8-4c42-04b1-08dd71c25496
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010

Static shared memory requires device-tree boot. At the moment, booting
with ACPI enabled and CONFIG_STATIC_SHM=y results in a data abort when
dereferencing node in process_shm() because dt_host is always NULL.

Fixes: 09c0a8976acf ("xen/arm: enable statically shared memory on Dom0")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2b5b4331834f..85f423214a44 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2325,9 +2325,12 @@ int __init construct_hwdom(struct kernel_info *kinfo)
     else
         allocate_memory(d, kinfo);
 
-    rc = process_shm_chosen(d, kinfo);
-    if ( rc < 0 )
-        return rc;
+    if ( acpi_disabled )
+    {
+        rc = process_shm_chosen(d, kinfo);
+        if ( rc < 0 )
+            return rc;
+    }
 
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
     rc = gic_map_hwdom_extra_mappings(d);
-- 
2.25.1



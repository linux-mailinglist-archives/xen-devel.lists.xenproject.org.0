Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7395A78A88
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935280.1336703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztzf-00029D-MB; Wed, 02 Apr 2025 09:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935280.1336703; Wed, 02 Apr 2025 09:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztzf-00026u-J5; Wed, 02 Apr 2025 09:02:43 +0000
Received: by outflank-mailman (input) for mailman id 935280;
 Wed, 02 Apr 2025 09:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tztze-00026o-5a
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:02:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:240a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a146226-0fa1-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:02:40 +0200 (CEST)
Received: from BL1PR13CA0138.namprd13.prod.outlook.com (2603:10b6:208:2bb::23)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 09:02:34 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::db) by BL1PR13CA0138.outlook.office365.com
 (2603:10b6:208:2bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.21 via Frontend Transport; Wed,
 2 Apr 2025 09:02:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 09:02:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 04:02:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 04:02:32 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Apr 2025 04:02:31 -0500
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
X-Inumbo-ID: 3a146226-0fa1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unESOFCyjNMIeKkyB04DxrHZFQR3kFBCmI0DXsSWqo8oS22VOzeGrjMdNUJU10WqVcNwu28/tHSkd9GRL06AkzHZe3wmH92nZg51n6oTwXSNBRb4MCDNbE7nOuvobJOQN43Stu83QiJenqSfSv8eBcKy/lS4SZxMQE5woJ5eOGUsEgJxs7gJicGAcG5DZYIswMBJxSf2P3vJEyixi5+knHMkUsf/ST+BX94YdsGBPezXFZ9k3b/R+PFw6g2H1oRiH/PIfVGbn4oAPMdm8vQjcms5j81Vqu6D5SuH5fI62D2vpyS7YBqnKxEIElNuGlTGK/f8hRevXqrhC4XY+0wTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX+21THbZg5jhNxFuhk1wSJWXSVAeYR+tivHug6ydRI=;
 b=ZqZrcXRy2PToaP56Nst/VNM1mQS+0P+LC/9Os60Ea/s4lG0XrV49DzJmoBJk7fXU/KPpSxPi0oFQnLf9mSebOUH/214EIkPRPHP/UwTgSqRJAKklYBGJMZR/Yx6MNa/tbY5qznY69opsO2cvgeYeaUrkFVk0h66GtoBEZmjICjtR4QtwFc42LZNkxbQ7WddZ4RudqOyvc3O2TGSCgB2Jp53mZ2MinL8DMzcKwLcFdpYKC2V2eUDMnbWaa0kI92q+HIddf02xo6Z0gsHfJ1Wkn+BAUGBs9HdM4BMrgYvI8tuAYV0wO5gCPlQqzonfYakGPjeNIqgjl5J8Tiy1sh/KNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX+21THbZg5jhNxFuhk1wSJWXSVAeYR+tivHug6ydRI=;
 b=jSX1h1Y9zF2ny5P9H83kI3WM1OiCxOCBjlEBDbs9ooZrbQD2rkkxUuRG+03e8cO7nFWbq6akZc3SeQTwZC5DuKurAsjPRf3mLgfASfBJITjYShyknhLqJPVv5NQBMIT7VL4hoOyzoZuxRdJ67Yi3reo3aHmaNKG43YDOwQG8aOk=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/arm: mpu: Use new-style annotations
Date: Wed, 2 Apr 2025 11:02:29 +0200
Message-ID: <20250402090229.161177-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 72572f61-0b24-41c4-bece-08dd71c51b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GPh94eDxuYUUQBusF8F6zWU8+bEOD3d2rtgz4Re2CsJkK6x5OrP1hRkFK5WR?=
 =?us-ascii?Q?/396xLbXcIGgzXmRtPEscbotSNWDdUlLB10Hz32CuR8RJG8HC8SLzTEQD6sw?=
 =?us-ascii?Q?uJbHRAZGH2sMh8cJUcbR6Nj5/qURQG9fdhV91ZgFj23G7iAzNX7epj9/w28K?=
 =?us-ascii?Q?IsksM6fJrNisEPY4KYiKgIZcns1tk9TiE8oMsE3naP6VLXWJkl3JIlosZs1h?=
 =?us-ascii?Q?bLDZzOP9w8cNJO7Hw+8QcFpUJBi9RBoji1vRaoiITkj39jOjI/zS7ymjvRhA?=
 =?us-ascii?Q?vODb+HtJ2TE8uLxNBtLQf0K10dWVybhz8nbvcG4z0guHyYzizfHyGo67Z6se?=
 =?us-ascii?Q?Am46Xke6wo9SFnJOJq30pVQHoYUYrWo7NWtIFK+CgR1HfWAUGuNu3cyhtjeC?=
 =?us-ascii?Q?b9Fc8ue77zs0vAWW7dPr0cUuw4xexWjpo24Ew27+xHeytLzxv4tTqXsIefSb?=
 =?us-ascii?Q?yBnX+iyEbZhkG6UtA7UxlS5ZGnHf1K4z/pFwRlYtrVaOtqubg16Nxv6abEGV?=
 =?us-ascii?Q?QxggWxzVPM0X83y8oqYOrYCl6ssfyZf9f8/BOIYC4jdKmm9221EPcSrNbckG?=
 =?us-ascii?Q?bUdcYZm7Q0CQmTWvx/FVfC0yJliF1JiNLJMZ5MLd5xo7YmK+x1rGArhJcDBV?=
 =?us-ascii?Q?p2v10x+Z+gEXyt0BDR83rx6ObPCeOqhrIAe9bmkF1BSPZSKjZtDBSf0nFe6Z?=
 =?us-ascii?Q?/blvUef/Nqkl3iSUl/xIq0R7qUqMG1uJNy6ulbRWhE2WLqSEM1KG3iUHsj/q?=
 =?us-ascii?Q?txuU5/rOCPnJQ5MsMEQW/XDr6X0X6vExLoZUtOhONTAUWu5XUBpl5SpYPVOC?=
 =?us-ascii?Q?ShVMsqLOdNPetWse82w/x7QTP+UGx99iR7tpeaVFD5jgKx078bKUF401OYVk?=
 =?us-ascii?Q?Ap7I/IF2dzf2J2KY8pDInNKl1WcWFm+rnOkOpAk0kyWaddOJ/AIsJtbAEQWi?=
 =?us-ascii?Q?WSJh+XZSIb1f1+3rbN2W9+mHa8pmh/D9XP4PJgLOkOXVEmT34WJ7IUueOW70?=
 =?us-ascii?Q?zBnrZI7jvaLdQMWJkgglQqC4GyZtMYGBsrofidOkLSEn2RUZMjaWCB5RzMqK?=
 =?us-ascii?Q?vxFWHAWeb1ZSftVbPLxoSJfHIBuZa+bAm5vWTtTpy2Zd0qS9LUhwsoib6Rnf?=
 =?us-ascii?Q?sHtoMUH5lWRQc64AByupvEqfJWq/pBE1svE//1WSTjfjjxE2AwVeDNjxA0me?=
 =?us-ascii?Q?oBch+XFA7tA0A0z00Z02N6GA1O5CJC352bLSqqfJtN+TueYZOCGck9O6aM+D?=
 =?us-ascii?Q?YQV1JjRJ7BW7m8Lz4menUeIdD1zu0l40u5J7t9mJP//S+EgbXSCAw0PBkaQL?=
 =?us-ascii?Q?DxSHal7whLwcuHcS2Xrlp5tgxnPZpGJISywD4yRsWhcmSvX9pb6/SJtduYkn?=
 =?us-ascii?Q?e/soM5IwD4AEH1UCqAyUFZVpasyJ9FXGm3nqBrKauPzOBk02fUKnWiYn6MMG?=
 =?us-ascii?Q?YPsoiGfqjcT9RK8RHbbOYGaON19pKdJ90GFEMShyU27QSRGrhVZdSXIUiRhP?=
 =?us-ascii?Q?odJ4bCerYFTacf4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:02:33.5037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72572f61-0b24-41c4-bece-08dd71c51b33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242

When purging old-style annotations, MPU code was left unmodified. Fix
it.

Fixes: 221c66f4f2a4 ("Arm: purge ENTRY(), ENDPROC(), and ALIGN")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I found the issue when applying Luca series to be commited enabling MPU on
Arm64 build. This patch is a prerequisite for it.
---
 xen/arch/arm/arm64/mpu/head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 4d00de4869af..ed01993d8556 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -158,11 +158,11 @@ END(enable_boot_cpu_mm)
  * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
  * please the common code.
  */
-ENTRY(enable_secondary_cpu_mm)
+FUNC(enable_secondary_cpu_mm)
     PRINT("- SMP not enabled yet -\r\n")
 1:  wfe
     b 1b
-ENDPROC(enable_secondary_cpu_mm)
+END(enable_secondary_cpu_mm)
 
 /*
  * Local variables:
-- 
2.25.1



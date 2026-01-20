Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141EBD3C62E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208662.1520799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9L6-00019k-0g; Tue, 20 Jan 2026 10:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208662.1520799; Tue, 20 Jan 2026 10:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9L5-00018I-UJ; Tue, 20 Jan 2026 10:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1208662;
 Tue, 20 Jan 2026 10:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C9E/=7Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vi9L4-00018C-Cm
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:51:58 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08c0a3d2-f5ee-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 11:51:55 +0100 (CET)
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:51:52 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8a) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:51:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 10:51:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 04:51:50 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 20 Jan 2026 02:51:49 -0800
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
X-Inumbo-ID: 08c0a3d2-f5ee-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhDOY8RKrpfI0/StYlIxD+nqfcpebrraGC/KR4SFMvMM1x64iVh4npTsagt1BFbEabIcF47e2AoZ5RuiiG7pph0L/lOnZ3LxNHJkAm3e39f9m8j5g2hpQBSf/XnNYWtGI2JWi+rqAMJaX/HHrwoSqsmmaIqwppVvt6Z24lda0qjC0oR2NltjUTo3tjJghZym9hQ7/2PUblXb2WzQOsCighQG747rzefuf2HAC0cADm7GkfLHSRm57AkmLErCCSIBBN9vBHU1k0mtxWFLVqn031GNpcI42SWI+s3NZpU8/k/2fD9eDTwZcNrGi+lVzKMxuJ0EpD2RtuR0Z99X+YfEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBwMM5Pzd6aZtuOlJqfYpYVc/kyOKJSCCZMYqJzWWv8=;
 b=gM36QiMTmp7bSlgYCBOzDJqRZ5KbIRPEuXAqV5embkTqTOyWh2RsaL5wRVUp9FrYUZh8p+edJ3BaCbcsXRvBq7eQR/zLEYH7tuE4lobqf7tVfkjN6nJKwBMYSWX61Hx5f2YGofESiP15O3uV0XsQfxQ7w8s2+sotr826zYtWD7glryiTA64t8bhRycayDVGrBIzl7NBQN3kzOFNalju3OOIVHWa7WjfjDb8v1mKZz/I8eLDW7A4dBBfBAWuA0c2lpeGAgItfEJMi9WYKXa4e49kgnxx7HYkplU/MyrU4wKGFFXTWL4J+i+oS9gySw5AQb7+OCKiqJ4xbhS8/YgBXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBwMM5Pzd6aZtuOlJqfYpYVc/kyOKJSCCZMYqJzWWv8=;
 b=OYKd5csoATRZe76iIna/rwnXCvEmtirvQZ2YE6nzmFFwSvlaB1wCzFE5xMsFUxDQ+YYZ7agoSaGG1uWFHwaCbtIC3OmUY/K04ntYteA7qWeMM0DLs4F42SYcJeEsetJy8W+cE9mFdb8gHuVjoNuVqQfKQORpMO0nEDzs0cISN+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Enable GICv3 by default for AArch32 MPU
Date: Tue, 20 Jan 2026 11:51:41 +0100
Message-ID: <20260120105141.92578-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad51d06-3738-4e2b-4a61-08de5811eadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IrXiij1pTDM7h49PTrQuc5UnAxXnkND4FuqwIh6cTvrBaKxG20anZVQZxfdU?=
 =?us-ascii?Q?0Pg1RkcVmPou2l9xXkWdTEX0IyCfGBfjBGGLFnRoroKjx1SZURSeQStHRyo/?=
 =?us-ascii?Q?iajJLJY+uhA08EvvnxfwIHXRrvy6uaZz6Ntf78a9F4HX16LXJgbKii0+eJ/G?=
 =?us-ascii?Q?o/B7SWdaaVrIsS6eTJtkgWQDJvp5U8P1p+OGSSv+A4ceFY5JianH2V+B6APA?=
 =?us-ascii?Q?ayRjGq3ump2zfTqV20fBiMBKTqwJZ1IH1cC4Tp+/WYrKbiE4NLsw7Wn7awwV?=
 =?us-ascii?Q?Z9OIOXVlnuYDIta1ri286Ye2rGCCoGPMZ7mghIoLF+67qdq/I8Z/bK3/EEcR?=
 =?us-ascii?Q?xI1r/KgB0RDxV+gcCTp2FiPuVEXFZPRc3NfzNLZvcNqVKlxX+lx6q2dG90DJ?=
 =?us-ascii?Q?FzkVsm10uhe73ZatEEEEDx5gI046360LAuSoF5KIqK5iv6msvbp2X3Uxijyz?=
 =?us-ascii?Q?15DQ8lcVvMK5yda1hAGw3OK3gZN88P6Tgt8YCrPnLIf8EVeXiscYFb8Hp5Q3?=
 =?us-ascii?Q?5Wsew4HOxtQyLouX/gPbRRIOVitUrk2RqbO92nzM7xwlvqYVtD4T0yiOyGdY?=
 =?us-ascii?Q?HRrIz+gqywMvyIM5uYJF6rv9tCS+fuK65t/tYlefXOdVZlEp0B840Oa1os5H?=
 =?us-ascii?Q?7aFaKvAkRgLe0AwkkSYGSgpOEa6dpvmpa89kRO4+WKcJXri1SsG+o4BlsRJa?=
 =?us-ascii?Q?aHvqcCMdxaoQt7se03PHK7+AYwOzKq36Z617qOWZtcjJdggR1ajR9T82R7vC?=
 =?us-ascii?Q?pMgBMua824TRqcgHAUfz/6kx98OUVxlbiw42g0jrrR6WFzDV1k4ES3Lj1Dzd?=
 =?us-ascii?Q?S4D4UEjIJpXp4SDmWFCeQMaLoxcgCqvQ/lQXrRb007PU55Rg593ErKd0GnsI?=
 =?us-ascii?Q?aAcDAa01TvYQOtap3kuc7PnNUxrsmtXsxWGsMbYJGricVxEocP7O3IARXp+Z?=
 =?us-ascii?Q?KUMzn3S/uweQBnmpp/Fxo0GIQNAO8ZC/xl/oY4u10MFyLfe/bTYKWyEysg7j?=
 =?us-ascii?Q?+0eU5oxCP+Cf2iNIdiokAm9aF7DfYGUnR6vRslxj+iq25p+w/S/e3Go0FW6u?=
 =?us-ascii?Q?OxzyJLlZEUxWEGur/4Rypy3+j0+UWNOxEA4qI+G8Z+E2A4XOa8JHDRCFMKHu?=
 =?us-ascii?Q?M+G7dmGc/4TVtuRDozaVlB4cVLLIGwLpgsG1FIeCT4WhuA3v4RYcJROFZ+ZA?=
 =?us-ascii?Q?VoNiZpusUWcbd+3YEPccgCirGjR4eEX6SJREr1nLSsxY7tGeqbnUGX1Xt7id?=
 =?us-ascii?Q?NQ/gaPfk3vsev9SEENwF2LrWRgexm4VGIDgIEJQ5W7f20ocvsBxfu30ohaHF?=
 =?us-ascii?Q?a7HjH6KQ6evbl75kMifEUI9xQUmuJYRs2rLf1QmiHG694ELmgcwlR791IPqg?=
 =?us-ascii?Q?uduKl/JIaEMFczgOtNynehWH+DHh65x3dx8yk4RPvn2EqgphK2C5BSVbY3mt?=
 =?us-ascii?Q?TLVQ/vtHIqKLIMjrFXKZABIjRW4GacouE7JK6sjBLPl+2Hz5G8y7vAsGQTLb?=
 =?us-ascii?Q?VaxYuIyfX5CvJZd+os1q/Snrqgkp18mRgcgAAqJNpBau3o/94T3KmiqFONJZ?=
 =?us-ascii?Q?FY4jamZq2Qzuxv2x5lyu4QViE+D8mphVxsKZZPjs6fq7R5lvrjJxRflEkyu7?=
 =?us-ascii?Q?eulHNueDMnAGyUEnAWDwZBKlvJ7Je7pHKz72HqrF0q0cbuOUaNc0grKdf2wU?=
 =?us-ascii?Q?o77wZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:51:51.0364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad51d06-3738-4e2b-4a61-08de5811eadc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231

All the platforms where ARMv8R AArch32 is being tested use GICv3.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 0d81a4d8b437..442d353b4343 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -128,8 +128,7 @@ config GICV2
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
-	default n if ARM_32
-	default y if ARM_64
+	default y if ARM_64 || MPU
 	help
 
 	  Driver for the ARM Generic Interrupt Controller v3.
-- 
2.43.0



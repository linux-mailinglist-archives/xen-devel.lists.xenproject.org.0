Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D697BFE5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 19:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800389.1210331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyrc-0001Md-RS; Wed, 18 Sep 2024 17:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800389.1210331; Wed, 18 Sep 2024 17:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyrc-0001Kg-N7; Wed, 18 Sep 2024 17:53:16 +0000
Received: by outflank-mailman (input) for mailman id 800389;
 Wed, 18 Sep 2024 17:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Wy=QQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqyrb-0008Ab-0H
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 17:53:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2412::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e06deba1-75e6-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 19:53:14 +0200 (CEST)
Received: from SJ0PR13CA0099.namprd13.prod.outlook.com (2603:10b6:a03:2c5::14)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:53:04 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::bc) by SJ0PR13CA0099.outlook.office365.com
 (2603:10b6:a03:2c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 18 Sep 2024 17:53:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 17:53:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:53:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:53:02 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 18 Sep 2024 12:53:01 -0500
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
X-Inumbo-ID: e06deba1-75e6-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4MaueASzuMwXdU1MifHtTdhm6nvmv8mfxP4NEL99ABzzCCgknBOTg06ry7L8A4xM0B8Ge0DHmTEwo39LlIzPxVkwM+raZOo0rupkSDVIMFjLxo3NfjSR2x6uqhVCQXTO/fpyveQLJ9BXvIP7Z+SX967D+bbjD2Vk83vaC7hRB36xw4IupIhpe0SJQgZsmACD0X+qMXDILH/9W+e7ktZJ5KrmthfdI2bIQINpPKTnk185n4Y4bryN11QtznV+++5Af3t7EzO5uxnhosAHgqtHRx5nWU8uZwveM1E/5F5A/EiXEkfFfbFm6vapyqa/B4KmtLHfhgE5J0BoB0eayf5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUkJQVVsHgBZXjNhol8PNwGMPM65o0An2CcOed5wQIE=;
 b=gCXlcDJBgfT/6BeET1AInf+nyWwvm/Crzn/vFL4v17ybR2S65jfLNpRjDl8jrLFpmtqTG/cro4a/zcN1W7xfSim4g7IGo+eYPvjW4AJ9krmVEVSbbFOQlXe3tlXZMPD7j76pEcufnE0aGeNAQdU2CkWtySEMYPsRo4CJP1OvqlnG1CFeV0O7LLQSKEOo+N/z0GuRdU4exqRAGWhERxb5dLrshtVAzKvig4MvhMMvnJPJ9x9vGU1vT8XYOs1h6n8zytXwy9jIl4iOGNMDKJ1LvuSj11eCQXJ40ZSYG5oyXWQeHsOhQru+FUlcZ6rwsiXSNCKtjTrPNMbHEZCjslba8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUkJQVVsHgBZXjNhol8PNwGMPM65o0An2CcOed5wQIE=;
 b=R4csJwLflQ7Ua3S2XHIAZjenqibH7pDg5Ge4dqhkPsZtruy4ilizoX6xnqaEVAg5c7KJO7n1547JPNDTya8pGK0fcy2MKCfYaYT/F0M98ENt1gBV7RiT9uqT61/XKZDtz99Fb1DFdgkvsD+uehNOsxGYP4Pyz68aD2K8k2abfl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Wed, 18 Sep 2024 18:51:02 +0100
Message-ID: <20240918175102.223076-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: d9983e89-6efe-45c3-1737-08dcd80abea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+vwDf1+RV2vA+lyD7QmsTXsF2uDGYiS5fmB6MvbcPeLHPkGujCixq08oRH5p?=
 =?us-ascii?Q?kJ8IiKX57ClddHUt1dfoUm6Q7L1+ofuYTZE4Me6XKReOVJb7FcGUUb/Mv4dU?=
 =?us-ascii?Q?FuJztJOYa/cNf+C4WcF2MmMaLYaFA3HWR0P9YOmmrkoyKfCz4a42/s2xR2rZ?=
 =?us-ascii?Q?Kq7J+0Veig/QAdbP51R0MA2dDFYbnYGudGg08BYLmsmChh3vrOq1XR0Bfivh?=
 =?us-ascii?Q?Gr9tn8B/3LjEcq9qlTCl1z21HKigOWUN1Hnx55X3uH4Mwv9zfxErJ1QQ02Gy?=
 =?us-ascii?Q?9xgUh665ek/OtMOJ8Z9OE3gnQJYBEERKDO4mZdi22H/DnmS+KgA2QprYygkX?=
 =?us-ascii?Q?qpjIK598gHjDmvGpojX1M5PtEf9ZEPz98rqlmCuKdjAFqUoGZaZ4cNCxP6F/?=
 =?us-ascii?Q?zkiF/JZ4q+0qFC4Ctrl2datAJxxgNVjc9ZdmkvL2CRBMyLuS73fnuGl+/Yo5?=
 =?us-ascii?Q?rxyFglNiPTBaq3FrBexYMSs4lKigNbCFGpDTNoLYXL4N2TUcmuoMqa8IoeJ6?=
 =?us-ascii?Q?pEoxvKNRPOMVL2zLtLUp1F9hGRP8BOZTLWaEYNiuvJA9AqTLUT7vAIbynZWU?=
 =?us-ascii?Q?oezFpxg8REMh2AlRX/YwBGQcKEGy5JO7bZKboQWyZyjpKJ3ELoiuVnMa4DqD?=
 =?us-ascii?Q?AOe5tAIe3WjosG+0fPjMlUGvWd1jd0EkpaX3PBnjvrVYp5EMbDZxey8GerDn?=
 =?us-ascii?Q?tpK8FJItB38qgHiUUfWz6ks92oQyEA+ksZQWxLAaOneAx+PLN0FwUobX19GB?=
 =?us-ascii?Q?UI07u7O/xNpzio8/Fjyj+NV+YwcFo8cJ+TMSI5rMgDbxEB3sHmD5lMwjKp2v?=
 =?us-ascii?Q?+fe02fw6hojsZ+gCdkSpnAurewIP0xW+sGktX/Z+1k47tcaH6zM3HMP5q/nO?=
 =?us-ascii?Q?eIflhJ1nxNyw3S1dLWiwkc1bAu0ndHzlJ8/RUhkoq/uom85rToNRJDoJlzmJ?=
 =?us-ascii?Q?gStTZdbVXqAsE4Fa8i489yLtq/qVGenQhRA4qkZUhry4J1lhE1WIE97eBUTT?=
 =?us-ascii?Q?jBvD4lwqckecCYQRjZMtYKDgEkSGMsMr1iEfQt6kBmdN8Uz3yXcnaAMKIkF9?=
 =?us-ascii?Q?MUbtzXYsCN7Hslcy0D2fWrCBBiBCKlgWYSuj2oYeF5EWFt4Fn9xNwaO5rQf/?=
 =?us-ascii?Q?8S7gbXI/d+oVhCo/RygrW3sZ/U2flIywPrrmM7iFd+hpMIT38jkVjoUyOEkJ?=
 =?us-ascii?Q?QZmRtYZ5SSzUeevo5xshGac37if/9U23HN9IUzQl8WKXYjtaN3nk3e7S/cef?=
 =?us-ascii?Q?HXS/qcp/krMBXpOscna6bcMQwAf/XfH4XgiNykaApvm7c2TfhElyLIy3WW6y?=
 =?us-ascii?Q?5PSw1T2e97H1VZ86oRE9c0E35UgLRedjc3+CpyZglwJb/04E5Qu11rsdhO0K?=
 =?us-ascii?Q?tDMJzCacindNCESRyjmPZalWlbcbZ0eMAIevO17EiXJaNo18u+2T4Txzb+Re?=
 =?us-ascii?Q?wXazfwFe5MpV11o4rtnqcliDk1spNEAL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:53:03.7993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9983e89-6efe-45c3-1737-08dcd80abea3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. NR_CPUS is defined as 1 for MPU

2. Added a message in enable_secondary_cpu_mm()

 xen/arch/Kconfig              |  1 +
 xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 308ce129a8..8640b7ec8b 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -11,6 +11,7 @@ config NR_CPUS
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
 	default "4" if ARM && MPSOC
+	default "1" if ARM && MPU
 	default "128" if ARM
 	help
 	  Controls the build-time size of various arrays and bitmaps
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index ef55c8765c..3dfbbf8879 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -168,6 +168,16 @@ FUNC(enable_boot_cpu_mm)
     b   1b
 END(enable_boot_cpu_mm)
 
+/*
+ * Secondary cpu has not yet been supported on MPU systems. We will block the
+ * secondary cpu bringup at this stage.
+ */
+ENTRY(enable_secondary_cpu_mm)
+1:  PRINT("- SMP not enabled yet -\r\n")
+    wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.25.1



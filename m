Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34701A27B1E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881805.1292013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOXD-0006Qn-I2; Tue, 04 Feb 2025 19:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881805.1292013; Tue, 04 Feb 2025 19:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOXD-0006MP-Bw; Tue, 04 Feb 2025 19:24:35 +0000
Received: by outflank-mailman (input) for mailman id 881805;
 Tue, 04 Feb 2025 19:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOXC-0004nP-0F
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2414::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a849aadc-e32d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 20:24:31 +0100 (CET)
Received: from SJ0PR13CA0211.namprd13.prod.outlook.com (2603:10b6:a03:2c1::6)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 19:24:27 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::a8) by SJ0PR13CA0211.outlook.office365.com
 (2603:10b6:a03:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Tue,
 4 Feb 2025 19:24:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:26 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:25 -0600
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
X-Inumbo-ID: a849aadc-e32d-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBAkJp9p0A5slT0L1n3QtPxYoAeBnyhqEgynCltsgvHROuDbeaGD7cqcboKXChgx+iOiRDSZCjnuOFabTzekeR+yeO3j8UBQ4u52aeCsMeBoS/kTUfw/dtr8lQ6aacTw+Ongw3mrknVYHItsn63YgJNYbl+43tRs/5Mqi5eB8OlHpNNFf3TzEFWGqzId4oTzqKDCqUeyKdHlB/b1HZcOVBjHRu6JzW0zlKIh9y0Q58GN0fzvJzuVTrxKA/grURSr7PxyX4IlOzd+ZKx1rADOh+46GbBt7f1ZgdxFL8RQ0BpSRZhDVgMn4n67k2tGJBZGvR2pRVvoPOGsCevoK3667g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsKT5QiKx02FP+fMWtE8QG8luAAR91pZZ+lj1Or0wn0=;
 b=H6jb6+8sUJmGSl/niKxUV+BfEI657q9H0amRae853XWYqOhS0k3lcQde7av5yRBz+NrJt1io1/fonLWEG6IzJGGa4p7v7MyQiyXU4jozELIAAQggIdV9RczkoSJarJB+1t85FyxgItCPp4hzTci0Vx17RTjrOMBvAF64kN2F2+yIlxZS9nmPKPsmrQYAEoMdGGyljHfP69gnlUJ1YLIwSfY5nwmZkCB7P8B0yV2YzM3eeBfuv3qnOyaKE9UE9WH6UFCSx4XG9rsHcgro8n/N3KWYDsamF41C9om7zG+yGEMTYSSXSd5O9qfFv4dNcmfpC+F9vT/aoy4v46uZr57ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsKT5QiKx02FP+fMWtE8QG8luAAR91pZZ+lj1Or0wn0=;
 b=qejvhVaTzswHBA3sJhMsnE7pv2/etoBK8fozdnV6D0TsvefHw8uWseNHFJFCXpfNQicV0yZ4X+RpIAenb6fuXKVQ+1n1mCak+Any3rD4Hqs+u5gvVedBv6Su6G64kU2Yj3bjAep7a7M8MDPRrisR5He0T37BSKOiJlHjRk4JwJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm (arm32)
Date: Tue, 4 Feb 2025 19:23:57 +0000
Message-ID: <20250204192357.1862264-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 715e9d66-0ea9-4341-e2f4-08dd45518a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8FZnHPCmRBZOlba6LpL5XCzuv8Fk8UNfpg9Yxk7Mra4p0JzREMxsjFiGoefa?=
 =?us-ascii?Q?YYrmPOxzmsFz1yfvvPDQqj+Fv5M3VEz5Pnkl5pOar1dF3kUWqBH/NnZ+OkxM?=
 =?us-ascii?Q?JHHlWQvH4fX5emGPWMGw8TScptJL6bqQOz4tBgZRmfAKtrtSzOiEoqs8aVQJ?=
 =?us-ascii?Q?YcraR9ECB6w9Ykn4Vw2viA7Tl98hBdQ7y33gAVC9/DR7lMm0PxpiV7XvRyW6?=
 =?us-ascii?Q?s9HWR0O6RLnnmOt/tnW2VX7m/ppTRPLu2gOq/pHw+Np96IWGmF15p04nBYca?=
 =?us-ascii?Q?MCB30tjpMT4v2e9MGvGF0zfTLCx8XXtUa2rYDzZ1PWK2x64634elHbZ32VNK?=
 =?us-ascii?Q?VqcHjfBQlRTJHV4teKwMQ3HQ9TS3Xga8sD4FgUMkM4ndy1r+PHu4xC2uQvkE?=
 =?us-ascii?Q?bgbexsejt7DkYLXTVUj9J4ejwI8+xWctqnplxny8vBwD2qJS/TeDVI8cXR6j?=
 =?us-ascii?Q?Q4+OkRlQLEKOFPKBLW0c+bN6UA1IkIFf4/LlcCtilwPBLUy2UajBG1HCYVlt?=
 =?us-ascii?Q?t3WDHKC7baH2Da1S+qF8dA+w+n8n5sSXzKbvlqab39J+xkxYddEPgIZ8MCLg?=
 =?us-ascii?Q?0gc4vLq74zZU3o/JCNDVypEQbUFFGCF8Q9Ihde/+B1qsa6QB68nutDR3wpXv?=
 =?us-ascii?Q?zJ5Vwf75Vdt+f59QlJ5QBebCfKhLZoZ1+d2tv5fEh/79oJwb5GiW1ZynB28T?=
 =?us-ascii?Q?wawbyd0mpV8ws/Eor24+JV0d9u856iXZrfAF7Web7U4eCTUI/7BlH+Pa7yGk?=
 =?us-ascii?Q?0CPx5Q9UxY6l2ueRm9pVLkPZ4ZgU0vWTHQ4WvQ2AX5Sv0nPhQPQAbv3W6am2?=
 =?us-ascii?Q?nvUsDxoG+9NxOiWCPpSfaiiCzG1orJSue9croicQAO3TP8I+DlrbN4OVO/Z6?=
 =?us-ascii?Q?rb681jG8ZDZjw5mpIdR4cp5/eyGnURiRbLYJObhJdVW3iBr65MX/sLPjBcY6?=
 =?us-ascii?Q?Bok39FOmFZyHlENFEUMM8BKNDmScKT/pz7K0lXOf6N30d3TTpN5udimFXx3I?=
 =?us-ascii?Q?6FLTbkjBFm7tGDNHsX10M0GySJ5TzNxBRX/+j9yFud67t32w34Qq9NvLBMPf?=
 =?us-ascii?Q?3LuQ5DL7BPbzULNSQG7ET58Al/WIFjTLNzTlE9o5E4WAu9IFUzQNALJ4fTDu?=
 =?us-ascii?Q?QpJhUt25BG/jBHkOhs6p7Nkzy7E+CydaIc1gzZ1gAG609kdJO0YTe8EBeH5V?=
 =?us-ascii?Q?NOh+7nrxddO+ayzZtn7k75b3Blj+Q1+z2kSmRjwY5BJn8oOPZyXXuJLRvgIL?=
 =?us-ascii?Q?Km9TsJ5h1pVw9dbYU7oQ5iOUWKmt7M3iQWxuNt0r7QggMXZsBTf54BTCX9vx?=
 =?us-ascii?Q?BBujABX0Q+rbG8BblTba5mOCMEbkdnwcdg57HHOmXorbR+0fgjrhnul7agPB?=
 =?us-ascii?Q?bI6Lamcp9trRPc79Nr/zTplshvQlivumFqeEfyoEg83UIz/liWbwgL+fX9ea?=
 =?us-ascii?Q?lun5xXOH/XvCc+AuiKM6lLNP3YLfPjCwtdAtSLk04VgsVDjxxYElu7mAUxmp?=
 =?us-ascii?Q?OcygVZKFK3EPywk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:27.0271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715e9d66-0ea9-4341-e2f4-08dd45518a52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/mpu/head.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
index 4aad3c6b5d..49ab5fc9c0 100644
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -156,6 +156,16 @@ FUNC(enable_boot_cpu_mm)
     ret
 END(enable_boot_cpu_mm)
 
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+ENTRY(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965694BCFF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773967.1184497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xv-0001oI-CA; Thu, 08 Aug 2024 12:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773967.1184497; Thu, 08 Aug 2024 12:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xv-0001kJ-78; Thu, 08 Aug 2024 12:09:59 +0000
Received: by outflank-mailman (input) for mailman id 773967;
 Thu, 08 Aug 2024 12:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc1xu-0001Bl-3Z
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:09:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f312d35-557f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 14:09:55 +0200 (CEST)
Received: from BYAPR11CA0089.namprd11.prod.outlook.com (2603:10b6:a03:f4::30)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Thu, 8 Aug
 2024 12:09:52 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::6f) by BYAPR11CA0089.outlook.office365.com
 (2603:10b6:a03:f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Thu, 8 Aug 2024 12:09:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 8 Aug 2024 12:09:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:49 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 8 Aug 2024 07:09:48 -0500
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
X-Inumbo-ID: 1f312d35-557f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1KL6NZ9fVSt8GhNvSghW6Rv7MEJ6U6115eBdgd0QFs4r6K32r0LhliG2/lF2zVE/qlbgII0tvVj7CvtT9/273nTyuPpS85HD6uRrDdQ0ESmP5dMOw0scNfcsjhs8KBmRCvEsvr5pvpuHdagVpdQpszHrKF2pqfGsUzkP+PMZMo9q+zOoRSDZyvL6jq4xVNfkBK8kfA6jwW3M3TpfygrKMkzABkk9lzn/0u7KpeDzAxVDW9VL3dZHRAWS1p3b1xzXfIr7o420LIC53jXUPYduisUtqEZlUnG7aF9O5WKAIVLeCxmCwNzPGytOLUoppy4U7yvD8dGPwoDgOCe1xfbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHt71xPDWyVL/mL/ASV+Ga6PDc7Kh8iO9GgDEGgNhss=;
 b=aVeqsB+4XhSYIyy824UwXeeJ4hcagNPu48zsgzmH3gRabU5Sk+sbRL55ItB0AxQt7VKL4wWXflJBhy5tl+GUGE0Z6YS2D73Epn8J0eYTV4kZyzPHJODzJpQU2twVsVWdTT8RH8we8DuSsBPWspPKCdtGEQIni0mEoRhEoIPo3Jby4Mh8MpzghmrnBR2395vvloRtncU96yEFaqbKBXGbqMY9/uJWyHNQd9T5rHUPSwg7bi0Sb55WbniVDAyw5h1Engc/NzclyoNBKQWG+h8P2N3VFis/RmFcYc1gqP5ki3NnRCo5SO9CHEvLD/9PVpkSPQUQ1pEgGe3G4B8VRZxbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHt71xPDWyVL/mL/ASV+Ga6PDc7Kh8iO9GgDEGgNhss=;
 b=Vi+bGCENyadjN6beCPRe22RHprYzATs+7fD5mZlktJPB/Dl+2gPt+VAw6B/W8Q+oCDgMuPuh29G/IqHk/W8ulSRGEBxbvE2Padw3/B9AWoyZ0Y4JduB7sHLZxhy1oHPc8DUaCsCIMN2fpvKO+qWZ2jF6XDOmWDfbbNfoC1eWFN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 4/4] xen: arm: Enclose access to EL2 MMU specific registers under CONFIG_MMU
Date: Thu, 8 Aug 2024 13:09:36 +0100
Message-ID: <20240808120936.3299937-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d8ef76-460a-41db-5f86-08dcb7a301f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MI8MmMqeoVjtpEdvNxnlJ/tgHRZwZyB6P5hoFdvR2EAEBVSCZ22vCX7ovw3w?=
 =?us-ascii?Q?AVBOP0/47TSXx/97XXpFwJqjsOh/bv0sEqLSJ5N5n/zwUc0n4Uv3vM2Luyls?=
 =?us-ascii?Q?krctT2FCdt1zKry+s3tFKx8BjYjCEhxWFLwyA15OM56BojAuKYr97vOdwK7h?=
 =?us-ascii?Q?xVsECwtC+VafwCmeHbx/Z5r5ycHIz9wGz5Ngn4GCKnBuso6p+NhHUtrlQZFz?=
 =?us-ascii?Q?2eMPGX+nm0zXUjGhDWezP1cRz/fyNjrptl2amRuvNVeZ1ba2lhfDbqk0/jTf?=
 =?us-ascii?Q?hSLYzab0uakgZmIDiWSx/j0Gmcn6vkxX7aX20U5haJHCXevDAgbWUCRBqu7u?=
 =?us-ascii?Q?3IZOQt64u90jCxxYoUH7rvAdmNBkLGPifmWzwXWxf5EMk8RZG5ZBFE82xnIb?=
 =?us-ascii?Q?jVx/NdxOZ0p9uf3/CF3YocFxkjrDZ+yb5KJOvrH2cKq8c3Pbu14sHaNvNgOi?=
 =?us-ascii?Q?3YWgoC1+VHyxez6I2tOzX4rBKSbL/lD1LVSH6dBboWa6ETCOCQI6Ktev7LA+?=
 =?us-ascii?Q?PbOR2W07/8barXyHpKkEgdOOE0KYaFJOSLBOfhylIaL7QuzkiyqMqZw1xF3/?=
 =?us-ascii?Q?Uaz1DrfpE83RcRPZ+JjD6wWIVUGwo7G3GAQdcBKJuIXUzqH9Gz/J0EGHawi7?=
 =?us-ascii?Q?djm+CjToPUuESWN6Qj2K52K/AVR/4dHoOWqSxrFAzKXMo8y8dQDxxQp6gTwS?=
 =?us-ascii?Q?7Ey6XyUCiOGqfQ6g1RXWR5yExwPKhE6lT2X+zqRk2YjET9x4JYZelZh08p4S?=
 =?us-ascii?Q?PGJex6QhWxVJmPp2Sl1Sgm8eZs3F3lhzOragVikmLiV7BrVi6AaiuRJQFeLF?=
 =?us-ascii?Q?yQ01Cx+KQ21SjzdoUexTqURMAKsKESEbMNhBndPYqMkCR2zzY5vAh08hmTN7?=
 =?us-ascii?Q?6RAk8locP2PcIB6WCK3raEgeRQovDLyHxaNiG1bfEvjVsde8uzhE4qDXFI2M?=
 =?us-ascii?Q?b9VpgfJT4PpilbrTrPZ4GB9GDHG21Z9WE9XAr4JVFU0BNJD9On4C8t8suoq8?=
 =?us-ascii?Q?ucAlvb1t5z2RMkbICX7hDMnh29ZqL2ZaX/bdUz5uknxOyasmsuwjax25xoOh?=
 =?us-ascii?Q?AZAXOGPWE+8NAwutW9IbabrmQ7p1NZYAdohxYtJPDt3CRHY0AwntQJDpjE/i?=
 =?us-ascii?Q?ilLJxvoIIJhvlSbBsYUiupkwC98qun4Vfty6mCZ5nJP1zMdnTbd3l0Jdg/v9?=
 =?us-ascii?Q?0BaQAPnGFSj4RA2o6QIB1alszCO/SZpV5KQ1TXaJA3bWQqRLGajBwfGCDsDX?=
 =?us-ascii?Q?oQnu+hFed35HbMKT81DkTFn5pi2bMPMyWY6xMcodBWi4AevbxoSOkFu5/18R?=
 =?us-ascii?Q?YwWhZERGuDVP0fo64/mvCrv128iEsvtkLoNS/HTL5tK6/rogSdLZGDRO45cC?=
 =?us-ascii?Q?4o+b/5jkF4VWnbBZ9LFEWdZfJia1dYY40xrRBMmq8TiuX5y1JOcQ+bVXKPnP?=
 =?us-ascii?Q?y5V19O0/vpVhpLQSTnay6C5yEEMP8BrK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:09:51.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d8ef76-460a-41db-5f86-08dcb7a301f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305

All the EL2 MMU specific registers are enclosed within CONFIG_MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-
1. 'vttbr_el2' field is enclosed with ifdef.
2. No movement of code.

 xen/arch/arm/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index aac6c599f8..f51e1424cb 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -720,8 +720,10 @@ struct reg_ctxt {
     uint32_t ifsr32_el2;
 #endif
 
+#ifdef CONFIG_MMU
     /* Hypervisor-side state */
     uint64_t vttbr_el2;
+#endif
 };
 
 static const char *mode_string(register_t cpsr)
@@ -919,12 +921,16 @@ static void _show_registers(const struct cpu_user_regs *regs,
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
+#ifdef CONFIG_MMU
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+#endif
     printk("\n");
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
+#ifdef CONFIG_MMU
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
+#endif
     printk("\n");
     printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
-- 
2.25.1



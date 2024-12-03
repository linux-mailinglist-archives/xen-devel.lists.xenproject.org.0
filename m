Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095509E1580
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847300.1262438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAb-0000Qb-HI; Tue, 03 Dec 2024 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847300.1262438; Tue, 03 Dec 2024 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAb-0000FF-6S; Tue, 03 Dec 2024 08:22:09 +0000
Received: by outflank-mailman (input) for mailman id 847300;
 Tue, 03 Dec 2024 08:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO6Y-0006iL-Kv
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:17:58 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2409::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c32e9e-b14f-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:17:56 +0100 (CET)
Received: from SJ2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:a03:505::20)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:17:52 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::54) by SJ2PR07CA0011.outlook.office365.com
 (2603:10b6:a03:505::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:17:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Tue, 3 Dec 2024 08:17:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:15:14 -0600
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
X-Inumbo-ID: 18c32e9e-b14f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzRVv/8MQzO1pA2BcmN8CA7FPWGJDSWWIecgf1+X1DD2pNvTcDi+OTFpGLMBxps+XEBL3Q/JMHv8cXQpHD6Oap0KadkkOBOet0WqPrP8XWN2gyVkscLS/k+N3wSip8ouCiPzvIAOeLhl4oQEC8fXAiAP5ZXcrshQY/Hk9CRWX0/s0sWlLVTni0Js4MYBStw8wuK9Z7N6wc4gr8oLHSb7LVImITKzsemGlm4Yrv3jS1sslqvisyPzGXywTiHkxhWn9KOfIPA4UUVIhRYi3x2d+sVu5xwwtj2+m7cQqRZLeGwxsokKltI8rWlTm5A18+EZID3spKhDt7O9uAV4ZwEohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0U8rdCyjQTujNhBIGlymmnhb0TRmAlHR3r/R+Vaoss=;
 b=jmwnFeEddpbPpWfiLDgpU6bE7AztxkU/+ojDLAOMIsUPerQpkmPXIxd6UQ2kEmEKt7jctl8Ep+sE6Rq/VYQPjekGGkfeLvHAdAgdLVU+/K1oMq11jm/F3pEnyJjHaSQ+RU0OFopWgokeJaNz+1glgk+0urCciJG9Yh4t7t/oUuZCG0+Jq+LgMt3WeWFhAXSHV55YxgRVw2AU1MjNm/vfgFdGnWbRfL5wZORmYxkSBw8I35f4MsHgr+Ql6Lk04nzmBsBA6ZxVweHx+TxxVhc7MglnNc1O8O2Zt88eKF7oWWSHv9jfg/1muvO1M8Ekh7WZAoFwAutap5rDsE03jJT8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0U8rdCyjQTujNhBIGlymmnhb0TRmAlHR3r/R+Vaoss=;
 b=ZIgXMDZ4FB0Pcyb4SxP5CbqrljaQlbJTpE5QXFvl9gIBC8/XeaohLJI9lY6Vd2tOEJahK2MFBILdq3O0zJP3Uo56GucfwTDykOhuBfwHrUHgvo87l21127ujTzRNaaU1m/sI/DI17qHGa95jl12i1/XswRPgPoQKwHPxTSD51zU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1 04/11] xen/x86: get processor max speed from DMI table
Date: Tue, 3 Dec 2024 16:11:04 +0800
Message-ID: <20241203081111.463400-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fed296-43bd-4d34-737d-08dd1372fab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IYLPJvog9Bsgq+YJ+0VMgfT8z4rPNAt2pXUer7CCY3NiuwAXQt453ApjQFIW?=
 =?us-ascii?Q?/7ND6ClnRHPuI7IgcYwxsAhz00RvLEA94LOqfqvU8upYq0Pzq3qYHQN9KSzI?=
 =?us-ascii?Q?SIR3xg5IaI+XMRf/KMOfloLlxYe7iiVHdfpnl+SNWr1cLuAqNBmZ6KNAT77I?=
 =?us-ascii?Q?uO0Zx+Y5HH/tibTVWtcV9t5MlL70tyEMY6jDiRP0x1sYFiXr8u+fMlyRMDgQ?=
 =?us-ascii?Q?CVhRoy516RNaOTHdz4SkzOrsV4n5QVONlBVs3TFTh9LZ4fbEGXR4DHqi5s6B?=
 =?us-ascii?Q?oNj8HrnAW3dPWGn3ucunMJ6XuuZ36PciXIRQSZ4YCcTHrPVeCz6dVi8mwunU?=
 =?us-ascii?Q?Gix7SXi122CHMcBXLJMAx2Oe34RIK1wtrsIoQFhK9VQlpX7c2GbYEPe42LSg?=
 =?us-ascii?Q?yComDBM9lePXA0T6qs5UKxJoP0IYQBrR+gT6e7boM4/UaP6lOku2AV+V3Dx0?=
 =?us-ascii?Q?LR1X49sfNBdD3o6++h0EUkp/YCc9igGb42XhvLJo6xP9xGzdVSvEkeS30Gim?=
 =?us-ascii?Q?nDSFvLRPQX9/8e3dq5r+UhIZC8f+mFe8VxUcNwUxDZqqKMYAIUzOqalgu0fh?=
 =?us-ascii?Q?9/OfMiteu/dqsZqmN6paBy2opRSd6TpjiVjQSYE95Egq4ao3B1VDR4e2vrza?=
 =?us-ascii?Q?J3/L0Sa0x034gw1h/1NNYAq1rOaUh0kre7YbiSzh6QTA9B/N0g/DS7M0AR1d?=
 =?us-ascii?Q?AeBNyeKNU2vib/PNhIVhaFB04fvsVpZ09fHsajG3sg88q/dGcxTg0A32IeVQ?=
 =?us-ascii?Q?d2x1APVPpszRD+odZiLLYP2Ra5dZ52FDSmdrg5Bcs1MdouMAQg4Y2uYchsPU?=
 =?us-ascii?Q?8yG4U28mpXrIm70SUYkso/JZJCduyjmRGi7+7jX1fgJ+28oQfWYas/u+yTEt?=
 =?us-ascii?Q?WfXlBLywcCsPCD4HvaIPEjdOO/LaYLr4wuVKh24OYcDGqyb0FPkMRg+hxHbt?=
 =?us-ascii?Q?A0stXpPpXRZKMeoqPgF25NNqSHt97uVrW0eBQjVXwJqWS6TzzSLczBk/XT/p?=
 =?us-ascii?Q?V0zhliIZ7Dji+s4morFV0rVtwao1volj9BYF+cThNjMkHGwYKpID9tcXqLGd?=
 =?us-ascii?Q?snSwcIKfF5tQ+mkEjBzKag+3fbCSNwxMWF5LvY6PqRc1as4LpRS63nidZhvt?=
 =?us-ascii?Q?J35JNUNJeEmTLm6fzHY2gdbh/XQEXBJDslFu7OesNON+830hRpZu6fDmlXhC?=
 =?us-ascii?Q?5lc5XNfxSxlJ8oQrpAuqV6MGM2Zf9523k9PVZE/gx+BfWdVuEor3CZHLGb1M?=
 =?us-ascii?Q?xCAqZ9x3GgRK/9KURiD7oIPhCdo4FHEeAPrDnqVcs0DkUIQD9s2a0j/z8AHH?=
 =?us-ascii?Q?1MFbuLOGQroVpXTzZ2GYO/kI9FLI38lG4pMBTMAMsZuq3msXLe0wufbhEFDs?=
 =?us-ascii?Q?RKsdTHJ4d2KSZoccuZKaucljysVZAy/C4cYBoqPcNllKy7Lkp3bXL7yb25tt?=
 =?us-ascii?Q?ryfNU50JXCtl0SE47GIavaZWbEZ7/YNe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:17:50.8416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fed296-43bd-4d34-737d-08dd1372fab9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081

When _CPC table could not provide processor frequency range
values for OS governor, we need to read processor max frequency
as anchor point.

For AMD processors, we rely on parsing DMI table to get processor
max speed.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/dmi_scan.c            | 19 +++++++++++++++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 ++
 xen/include/xen/dmi.h              |  5 +++++
 3 files changed, 26 insertions(+)

diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 2fcc485295..ec9073c04b 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -10,6 +10,8 @@
 #include <xen/efi.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
+#include <xen/unaligned.h>
+#include <acpi/cpufreq/cpufreq.h>
 
 #define memcpy_fromio    memcpy
 #define alloc_bootmem(l) xmalloc_bytes(l)
@@ -680,6 +682,23 @@ static void __init cf_check dmi_decode(const struct dmi_header *dm)
 				dmi_string(dm, data[6])));
 			dmi_save_ident(dm, DMI_BOARD_VERSION, 6);
 			break;
+		case DMI_ENTRY_PROCESSOR:
+			dmi_max_speed_mhz = 0;
+			if ( dm->length >= DMI_ENTRY_PROCESSOR_MIN_LENGTH )
+			{
+				dmi_max_speed_mhz = (uint16_t)get_unaligned((const uint16_t *)
+						(dm + DMI_PROCESSOR_MAX_SPEED_OFFSET));
+				if ( !dmi_max_speed_mhz )
+					dmi_printk(("Warnning: read zero value for Processor Max Speed\n"));
+			}
+			/*
+			 * Real stupid fallback value, just in case there is no
+			 * actual value set.
+			 */
+			dmi_max_speed_mhz = dmi_max_speed_mhz ? : 1;
+
+			dmi_printk(("Processor Max Speed: %u\n", dmi_max_speed));
+			break;
 	}
 }
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 71e8ca91f0..acf133430b 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -271,4 +271,6 @@ int acpi_cpufreq_register(void);
 int amd_pstate_cmdline_parse(const char *s, const char *e);
 int amd_pstate_register_driver(void);
 
+extern uint16_t dmi_max_speed_mhz;
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/xen/dmi.h b/xen/include/xen/dmi.h
index ed6ffda315..158bb6228a 100644
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -1,6 +1,11 @@
 #ifndef __DMI_H__
 #define __DMI_H__
 
+/* Minimum struct length needed for the DMI processor entry we want */
+#define DMI_ENTRY_PROCESSOR_MIN_LENGTH  48
+/* Offset in the DMI processor entry for the max frequency */
+#define DMI_PROCESSOR_MAX_SPEED_OFFSET  0x14
+
 enum dmi_field {
 	DMI_NONE,
 	DMI_BIOS_VENDOR,
-- 
2.34.1



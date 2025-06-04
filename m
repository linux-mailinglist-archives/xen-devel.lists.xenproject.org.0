Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D052ACE74C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 01:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006050.1385316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsq-00041C-L1; Wed, 04 Jun 2025 23:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006050.1385316; Wed, 04 Jun 2025 23:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsq-0003vd-Gv; Wed, 04 Jun 2025 23:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1006050;
 Wed, 04 Jun 2025 23:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhEg=YT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uMxsp-0003tB-Gc
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 23:50:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2009::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1524d89-419e-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 01:50:56 +0200 (CEST)
Received: from MW4PR03CA0245.namprd03.prod.outlook.com (2603:10b6:303:b4::10)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 23:50:50 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::d7) by MW4PR03CA0245.outlook.office365.com
 (2603:10b6:303:b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Wed,
 4 Jun 2025 23:50:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 23:50:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:50:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:50:48 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 18:50:47 -0500
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
X-Inumbo-ID: c1524d89-419e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAoCnEJZUM9e2xf7zrJw/q1MdAfz6kDBgqTcWODvMdUd8nBjqKXGWS4NytbP79Bl6TkGmv24G4TJC1Lu37TS4NsaPf/We4Z2O3jo+mfyk6GpPdBPBjV0KCKJoYUL4FuES8W8Bo1ZTJLfxaHUzuX9TKC27cogsQDiDIzY1WIszIem2m4KT3zfl+6SmwBJ/yjKTbM52uIyYSAgoAPivDmpqKt7pUYzFpuvKZ76MUrBCJF26wF8QNT04rTH5FSa/duBBzvu4hO0ayfhFAmcYe57GGhp6hg0UQgssUQiL/tzgX/V6VRnC7SI3jXdN10UN7HMRj/rX71o5F7+sYHE9/jooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uElrQ4phKJmjjzZ+5AvSPmniHWoCmEZRcshcnxDA9VY=;
 b=kthV4ENMzMTTs6LLooQAS3t9d7eAw2CX8IkuzkcvYA5OUlT896reW2Fxb5XrDdhxfC6NCkKwts3Wt0XZF5ETzvAM1LJyWTwQC7gRBn/1s/5pDte48bTqXwzso2PTjJMNFpWHxjSRklZFFSkfM+DoQx2cflBxivUKxx60eWmugGbEfaFG1/6VdQD//86uihr6nJIQUE4RFCmf33Y1t1HQlNodKBtb8rjp49nvaqF5QrfPCckS85w9fmptJfhwSJSx5/DvDLuxsDxih0uj5OPIYwyTEM069RyZWNHDAbKVgmx/0XwuuPswZGwJTd8yqghT9GEsjLYKLcD92LSY2zvk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uElrQ4phKJmjjzZ+5AvSPmniHWoCmEZRcshcnxDA9VY=;
 b=VNvxQB5KHYFesiCRHKTrQJvct1MKBnJehzqhitbgO1N1Mag059d0HDPFuy+XPRBwNaUTOI+I6zf8qikURkuSXcq5pqG2CSe6nvLhX1xUn0RXmpCTsHBKfieAsNp83tmNHIljcCqekluqiipwRbIFty+7RSkJ0JKBPquQyZ/IZTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/3] xen/arm: add missing noreturn attributes
Date: Wed, 4 Jun 2025 16:49:56 -0700
Message-ID: <20250604235034.1595881-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250604235034.1595881-1-victorm.lira@amd.com>
References: <20250604235034.1595881-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: ff942b29-2088-4568-71af-08dda3c2a22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WThFaE0vT29tcjNpLy81dThxbFAxQU5saTZoVVZOUE53blF4VDN6all5ZEds?=
 =?utf-8?B?Rmd2cjRycit6ZE5tU0JQNzdWWjFPVDRyYit5UmMxOEpsdTMyTkQ3TEU5cGlB?=
 =?utf-8?B?VXBvdS9WUysrQXAyalduQnV3NzU5UTJxNHp3QWV5Mys0UkFVU1BDSVAzTjlq?=
 =?utf-8?B?WnZmVHZ2RGxjdUxkYXMzTHF4MFB4RmdQbXZTOUhQT2U4T1JGMjIvYXN4K1Rk?=
 =?utf-8?B?SFFhYVlqRS9tK2xDcEVrNnEweDdUZ0tpWDNmOVBzK0hJT09YT1YwaHNTZmFG?=
 =?utf-8?B?L1lrdHMrL2kvam95Ynh5eXBjS01OZ3FhV1ExSU1DUDFiV2ltbk5md1k4WVZz?=
 =?utf-8?B?UE5XVVphVlNla0dlNFk4QldJZEdnMGJDVFd3VzFiQkErL3hvL2drc2pXQnBW?=
 =?utf-8?B?WDNGQXNDUCtLZWRxY3k4RHV2Kzh6SWpwZTlMTTFhMmV4NzJIWEJXRTluN29Q?=
 =?utf-8?B?bkpYQ3VyWm9GNjZHNk9IRUZ3SmJYb0s2cXlhWWprYk40eTNoSmsySDh5UW10?=
 =?utf-8?B?a1lvVTdkcEtPUkZ5WTJmaVQ0dmdhSkRMQ2U1cUxvaGJBUzVFbHk3NHE2bWhL?=
 =?utf-8?B?SzkvT2JmaVBMVkNlR3JqSWhrRkllMi9ublExYnpLYjNuZ1dxT0tkR01hUG03?=
 =?utf-8?B?azVJUTVQN0lac3ZNK3VveXhKdGVDbWVPMlN0U2NuSHlQY1IvOElwOU1BdFJO?=
 =?utf-8?B?d3F1TGpCM1RsclF6TGgybzQrdHBNRnBkM0wrZlFmSW5yTG5kSGdRMGM2c1l6?=
 =?utf-8?B?QXFoQW1wVUk3a2k1SngrclZYc0d5QWtGUU5mM2h6Njg1eGZqQm43Rjg1ZVhW?=
 =?utf-8?B?MGJPZ1FJWFNMK3cyZ0p4KzFBMSs2cEIvdWpKc0FUZjNmTWNSaVYvT25xZWh1?=
 =?utf-8?B?ODF5OUsrTUJ2SlExSllDWDZ0S0cwTExNMk9ta09SbUJrYVdkSU5IMEU1S2xa?=
 =?utf-8?B?YUdFOHQ4WHoxU0d2K2VXZmtvZExTdGN1Q3h3NlR4endLNUFNVWRuelZsWENI?=
 =?utf-8?B?bzJ5U3BjU0pYSTNycksza05BWjE3UEg1R0dGRE0yTUtHTXpFaERYczZ2SFJp?=
 =?utf-8?B?NFFuWXdiRHlrM2RPTW1CRzlGaHlrVkJFNVJGSForbnpSNFA5QzNlQUNXMXNs?=
 =?utf-8?B?V0U4bk01Q2YxOGdtaW0vMzBTTXRJYWdKenNRQUEzUHU4cnNmVlAzRnJOd0Vj?=
 =?utf-8?B?OGZoOGkzekJmaWV6d0E3S2w1azBZSUpwR0hxTE9GS0N5cU52ZXVjeSt4MzZj?=
 =?utf-8?B?RHJ4a1RobVZuZ2dlTERERHBreTlzOC9jcVd6T1BlTVVhM2taelVFa0hmL0hv?=
 =?utf-8?B?M05SV0laeHU5R2I5dWZNb2dGaFIrU244bm5sM0JxckNqaFdic3kwUWdtNjhJ?=
 =?utf-8?B?WENBMUEveDRBRytSTWlUWldaM3dEVWRVTlVOYXl3UGcwcXVmOUY1YXova2VM?=
 =?utf-8?B?YVI3ZnVkK3NkR2tqMUdzaVcyclhuNVVNUERrYU1wV0ljRFMrbXpSL3hqd013?=
 =?utf-8?B?cUtTSGRBaHpMRlNyejY3cG9PdGFaTDhtODdBdzBTQjNPNkNhTm9ybHZVWUc5?=
 =?utf-8?B?bTNydCtGWVNLOG5oQjRFUHJMVS9lLys4L0VWaVhObEpHclZVamN0R1hTdE95?=
 =?utf-8?B?MG5wTi9QRXhYS0dWT1pUNUJhNCtXcXEyRDVmSUY3VURyMzVILytxWTZkQjdD?=
 =?utf-8?B?a2wzOWdwSDRxTnVwVWFzTUxRZzhMSlB5R0toMnR1QndVTXNmWkVKYUpNM1dW?=
 =?utf-8?B?TjMrQXpZWjdwMjl1TnBNNzRjY0t3dnhCSEFSVmhoTnViMi96Sjd2QklRZ09p?=
 =?utf-8?B?cFNUdWFQTUFMNUdSUXFOdUd4ZkMvSnBpZVpKb2pWVm83ckFsa1phUXlkc2dv?=
 =?utf-8?B?STVqS1ZGS3laQkpKeDRhcmcxem5kbXJxVitBWUFkT2d0OVhBaGtIeEZMVHZH?=
 =?utf-8?B?TVNtZXpDL25RUjBWV2NrVjVWL2lFeG5YRUJ1Tk9rVWhFMzB4dXdPdXhiZGYw?=
 =?utf-8?B?VnNaUks4QzRKNVNKTk4rdlRBYlNCWE5vRkFtWTZuNmlXbnExbytRWWx1ak1s?=
 =?utf-8?Q?2mi10j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:50:49.4922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff942b29-2088-4568-71af-08dda3c2a22d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The marked functions never return to their caller, but
lack the `noreturn' attribute, therefore causing a violation
of MISRA C Rule 2.1: "A project shall not contain unreachable code".

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---

 xen/arch/arm/efi/efi-boot.h            | 2 +-
 xen/arch/arm/include/asm/arm64/traps.h | 2 +-
 xen/arch/arm/include/asm/processor.h   | 2 +-
 xen/arch/arm/setup.c                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index d2a09ad3a1..ee80560e13 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -934,7 +934,7 @@ static void __init efi_arch_blexit(void)
         efi_bs->FreePool(memmap);
 }

-static void __init efi_arch_halt(void)
+static void noreturn __init efi_arch_halt(void)
 {
     stop_cpu();
 }
diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
index 3be2fa69ee..b7435c6e73 100644
--- a/xen/arch/arm/include/asm/arm64/traps.h
+++ b/xen/arch/arm/include/asm/arm64/traps.h
@@ -6,7 +6,7 @@ void inject_undef64_exception(struct cpu_user_regs *regs);
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr);

-void do_bad_mode(struct cpu_user_regs *regs, int reason);
+void noreturn do_bad_mode(struct cpu_user_regs *regs, int reason);

 #endif /* __ASM_ARM64_TRAPS__ */
 /*
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 9cbc4f9110..92c8bc1a31 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -571,7 +571,7 @@ extern register_t __cpu_logical_map[];
 #endif

 #ifndef __ASSEMBLY__
-void panic_PAR(uint64_t par);
+void noreturn panic_PAR(uint64_t par);

 /* Debugging functions are declared with external linkage to aid development. */
 void show_registers(const struct cpu_user_regs *regs);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 734e23da44..ed72317af3 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -63,7 +63,7 @@ bool __read_mostly acpi_disabled;

 domid_t __read_mostly max_init_domid;

-static __used void init_done(void)
+static __used void noreturn init_done(void)
 {
     int rc;

--
2.25.1


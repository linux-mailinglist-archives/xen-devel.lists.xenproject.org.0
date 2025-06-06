Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0EAD096D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 23:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008886.1388062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebB-0003hj-E4; Fri, 06 Jun 2025 21:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008886.1388062; Fri, 06 Jun 2025 21:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebB-0003aL-9z; Fri, 06 Jun 2025 21:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1008886;
 Fri, 06 Jun 2025 21:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyhR=YV=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uNebA-0003YS-9i
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 21:27:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d537d6e-431d-11f0-a303-13f23c93f187;
 Fri, 06 Jun 2025 23:27:32 +0200 (CEST)
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 6 Jun
 2025 21:27:26 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::67) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 6 Jun 2025 21:27:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:27:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 16:27:23 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Jun 2025 16:27:23 -0500
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
X-Inumbo-ID: 0d537d6e-431d-11f0-a303-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p27fMDvd4gVQqfJBOEYh68yVDFJlGUhI6KPsrTKUeM+mre4TjBzghDOgxGyRpp3E/kxpXJ6Eda30zjWadmp01sMOVnarW9QT1qVRGvau99znBXQUsHiH837mgQAdk6jx9qvOKfc2a3tCGG81/KiYIVRuzV/vyYcAFQLejF97Sh4xq07+1I7cZObb/Rzjp/FsC/numrUWZk8SA33f3h1fCTr88ImR4Z2s1a/XMD3G4HOeBVAX1XJz/OzYl5NUjMh8gbCvcKAcm17n8FiOfTxXE7ifnI7b4C15GfApn9Pv9tR7P4uiMLP+JEiljvTfHN+jtwBFKnPg/kAYFzL/DGWOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r93UQ2OGt46J18SmdFjIeojQ9Xy2SF7hXLY3jAZxNDo=;
 b=HPTdA9h3KZiycoPSvauL2NzAp7WnWjQFl19iMvkLOT8OAgWW5DUuTxOsa+SX7/HQG7Xrxtk1giDWpKbWXwmW7e1CZfrmXFFsN5f8VtSjuCEad7fG61QPkET+P6pWJxk7mG0raiHsThlNV+VPnyv7b0ygxp/ZVwbULPzqZLneIMMq12SItBXzfYlufzG5IvYSjkpV1F1FSp4+8qGNSZ+jPTUsTXw1/5jiiQATNYl4Arv3v0FaPhPb9ybveJKYKgXy5VrbhGRAoePlTF2io/pLU2deLthXah6MaQBLqD952OggkewxiI8C4mvZgVYe1mLvSJFs8NVml2z57W7ZQOt4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r93UQ2OGt46J18SmdFjIeojQ9Xy2SF7hXLY3jAZxNDo=;
 b=OVjifLiLyB29OAS1EyEI9Ov2E+5tWbcJLgl005pnUwzbhLv8FRxb5RrKzYiJDR0jIZaRdb+uQND5ajxA6M6JcCAdKDIsLnkysJtDJBRBRolicN95TQYX9gIWhvF2CmY4cx4sx8GxP12PTLOvAigxxRVlQEDaaqq2YfaOEiCYtJ0=
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
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/3] xen/arm: add missing noreturn attributes
Date: Fri, 6 Jun 2025 14:27:08 -0700
Message-ID: <20250606212712.1901838-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250606212712.1901838-1-victorm.lira@amd.com>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: a66f60a9-c84c-48e4-d256-08dda540eeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1lyVUhuZGxHbk1waFR6WW5RYlRIUkJxVXZSNUJ1Q01ETHhSYU1GblVKNXd1?=
 =?utf-8?B?Q1JhQ0FXRWxtVkFTaUhubnZwZUZmQzRGVStWSENIeEZXcUU1U1MwUGtRVmc4?=
 =?utf-8?B?cG9LcXBwM3FXUW9aVG81ZmJXQWpSdzJ6NHQ1RnZET3dHRnovM01rRlJrS3BK?=
 =?utf-8?B?OUV3R1A5MS9pQUFBWjdlN3k3a1FUZnpid2JsamlyYVEzSHBOYUQ3bHViaFRY?=
 =?utf-8?B?NkFOUkFRb3BrR0FiZmE5djcxeENZZ2FRWE5HMlNCeTdMKzBxTHZlVGhKcTI0?=
 =?utf-8?B?SEtUWStzUCtoRnpiK3Fya2hmV1ZDWWhoSE1mSkJKYktoeG9vVVFZUnZoNWw0?=
 =?utf-8?B?UWtxd25KMkF6b1R0MjkwYnFuaHRmMjF6aG8rK0tQRFluK09sZzhsWjJnZDFu?=
 =?utf-8?B?dzlPb3d4NEtLUlpZUUZPVGtBSmp3aEVaQlRUMGZPUmY5RDMrcHc0OU1wUkFi?=
 =?utf-8?B?SEEvQ0doQlllWFc1cUNIWGlGSGNxQ04yVHU4MWQyL0h1aGRCSWtJbktuY2E4?=
 =?utf-8?B?UVV5ZmtsdDZYNEhONFM0dytqRE9hb0p3cWtGQzNXVFdSMEZtWEF1am53QmFp?=
 =?utf-8?B?Kzc4NnhlZG5WVmpKazlRcE9kYzg2ZGFTOUdwWXBKcUpYYmQ0T25EeFE4YnRG?=
 =?utf-8?B?aFltZnp5S0poRnJUMllVTDhQMGUrdER2cGYzMGt5Zlg2NlBtemRWU1dLVnJM?=
 =?utf-8?B?QUpwbVBLUStuS3VVVk42ZnFSMkgrb3dvUFd2UDhSNDBpUDZkTFA1cFVCQksw?=
 =?utf-8?B?SkdBUm1pTjVPK3RLZU9LUGxXYXZrV0RNanZUc1UvTU50SFdLQ3lzNG44QllK?=
 =?utf-8?B?NDFtd1U0Um0ySCtqeEhraS84K3cwVjdtd1ZyQXdGTE90YS9HOHU2c0FUT0Uz?=
 =?utf-8?B?bklxN1BMcWdNSXo5dnlUQ2F0bEdpU3NIcnJ2Y2NEamdFZFpUV21qcTg1MG1J?=
 =?utf-8?B?KzBmaC82WHhuRExEMjJVa0tydTd3R1NaSldGY2NKY2RoYzlsT2ZROTM1aERR?=
 =?utf-8?B?SmpETXV4UFk1d3NVdWtLTjhLd3ZGVGlCdU1rYVpheE4zbFpRbEtEUDNZL1Rj?=
 =?utf-8?B?aWwxMVlsemVJSGI2Wjl2bFFya0ZSYVlVUlI0WGxDcEFYVWw5aUI0UXM5clEr?=
 =?utf-8?B?OWJKcXRPOGhNZUd3MUV5cGhKVTBkRWVTVVFqT3lUTm0xaytYZm4zNmc5TW1Z?=
 =?utf-8?B?MGxlQkZRQXJFUTJ0Ni9UdmZZZFJJaHRGNHBiZDRjVHJOMlVBY3FtaE9hNnFp?=
 =?utf-8?B?YXBoQ2lUeUt1TkgxTnpBQzN0M3ppem05V1ZkUldHbGlWbllRQ3BWUlgwejZF?=
 =?utf-8?B?RUhLbFFadWVHbnBxcE5uWWtFenRyL2xnci9kS3NmSzBrQ3N4VmpZb3BpSExU?=
 =?utf-8?B?MTVBMkoxZmZxTGNNOVdkdDJLZnVKaEd5NFI2MXJEdVVlOVlkVDBqdDZUOGpU?=
 =?utf-8?B?VWk5WmlCV25RRzlwQWJ4SVA5bGhCMSsyelRzMjNkTmFEZGRCRmg1WGZiR3Vs?=
 =?utf-8?B?Q3NmVXBJRE5qZi8xUjl2RFJGWE9NREN6Qmp2RG1BQmVrUDg0SEU5K3RTMXZ0?=
 =?utf-8?B?WC9hbWJmMlp4TnpXR3AyVXd0cFg0YnQ4eExUWjhMVW9LWElXQnZqcDZQbDhH?=
 =?utf-8?B?NVdhakJPakUwQ0FLUkIrcnU0NGhQeW1ZQmNLdGtYU2ZpazhuRVdsa2NrdVJq?=
 =?utf-8?B?cEQweHVoMng4bU9KbllrM2ZqMGhrVXZhY1ZzWkN5dVhjSVczbVp1YjYySWJy?=
 =?utf-8?B?ajVoVjJnZG1McjdEc0xtd3hwbFVTWjMvSGw0Wjl1ZElFOE1tR01PUVZRaUh3?=
 =?utf-8?B?VWUwdmdrVzcwVkIxb1l0YWdDTnhXZWZzOFJLVzY3bEVRNXFhMkVWM05KYkxC?=
 =?utf-8?B?enpvdHhpclY3SEMxdUhaT2ZOdDgxTm9KVVorYlBVMkloSjFYTHErK285T1Jm?=
 =?utf-8?B?SGdRU0NQMkVnSSt1R1NvNW9iR0d0UnZPVXQzMFh1SjQ1QU1KcDlSeVlyMkg3?=
 =?utf-8?B?SWgwaHlhcXdYQTNCZWo0dGNGdDNvZzVpWjl6dzI3SXBOcFJ2bEE5KzIrMUsx?=
 =?utf-8?Q?A4sUSD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:27:26.0596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66f60a9-c84c-48e4-d256-08dda540eeea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The marked functions never return to their caller, but lack the
`noreturn' attribute.

Functions that never return should be declared with a `noreturn'
attribute.

The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
currently accepted in Xen), and also Rule 2.1: "A project shall not
contain unreachable code". Depending on the compiler used and the
compiler optimization used, the lack of `noreturn' might lead to the
presence of unreachable code.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes in v2:
- improved commit message
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


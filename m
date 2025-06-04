Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068EDACE74B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 01:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006049.1385309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsq-0003vF-CV; Wed, 04 Jun 2025 23:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006049.1385309; Wed, 04 Jun 2025 23:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxsq-0003tM-9A; Wed, 04 Jun 2025 23:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1006049;
 Wed, 04 Jun 2025 23:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhEg=YT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uMxso-0003tB-SM
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 23:50:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c045309f-419e-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 01:50:53 +0200 (CEST)
Received: from MW4PR03CA0247.namprd03.prod.outlook.com (2603:10b6:303:b4::12)
 by SJ2PR12MB9087.namprd12.prod.outlook.com (2603:10b6:a03:562::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Wed, 4 Jun
 2025 23:50:48 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::2d) by MW4PR03CA0247.outlook.office365.com
 (2603:10b6:303:b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Wed,
 4 Jun 2025 23:50:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 23:50:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:50:46 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 18:50:46 -0500
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
X-Inumbo-ID: c045309f-419e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+Z56QVzWzuyWC2fIa3gYpM6veo0IEYsHLqTvrkhHP5VIjNLyL/SV7ycBzEPseHdX5iRHJm44bD+V7hx+Ko7uuwEfm2AttpE11JM+F9IkgbJ57nc/42po95UzKfpkGJ3bKxRUaYxmKl+dn1MmD6G/v3spjBsqd/zctB5ZR6kDi9xlZgiBocPuQ+tThQRhsKnny3eXpTQHTvVj4AmLwz/N7oMYbFlf2JCGVJuRUpKHwn9shpNY3a2pN+ycgQhOULvLIl5stYlz5j8eEZb6Hh2K63xgBbuz7g40PB0IEUhAL8Yep0+UF2E2b9eAfM7CnvckDVRvILxu8E0GX+cP2QJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48VLOy0/b6rx5ed5zZ7/OJCVbc1U+JkkkK8ji4aPVCA=;
 b=ZSK8gWcZXdPFSeXSIwo+jN87bOaYygS80xw2Hnqi6k+JE7pz9VMH+ABUrkhWAOdik8zf/pUebVdjRk0p+OxYLnmi6cp1AkTBnYlY1PzC+BGpXZ5EUp6IDMDOIjlrZihL3/LVWA4MaasYX+HFrcDnbT3oWpQAPOAizt61+ewxEC0mMrS2oDDZjwxFoSqi3ASTyw/7hCx2lten4MnT/hmBPoUh1Dhpt5Xboo+mWGinn4+lP6dg85aDe+lSnvFtHILPXxM2UZ2UvwbbyvkVZxG+8IL9wu8G5FLXYvYHB2Q+EUSOAOXuZaLS+gjiIvelDNr6hXURuHD9Zz9mjIzPhXLWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48VLOy0/b6rx5ed5zZ7/OJCVbc1U+JkkkK8ji4aPVCA=;
 b=3O9SkpQ58QtYP44+uVcbDXhFDMC0Pt9d13km+yZb24DGlsqVwFNW3HKojNJJm2qP7EdTX/sQJL40f3mQx6CJvUzLCVTkQpIKgN7CH5/xJV12CwYg9QZuDA0/fxrStLp6lBWoWjSR5bo9lwQq29HxYy+rEPCknVcV8VkfQ4aQiB8=
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
Subject: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
Date: Wed, 4 Jun 2025 16:49:55 -0700
Message-ID: <20250604235034.1595881-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|SJ2PR12MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 357c3a48-1fca-4808-0e06-08dda3c2a125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkdrcSt6OUtQRCtBVzNWenRzQ2V6Vy9jQjlJZmUyb1VTTmtYcE5FYjlUVzNS?=
 =?utf-8?B?NDlmOFR4RmNNRGI3M0tjaVhvRDJ1eW9MVTd5YXR1S0FzNXlXWTl3NWRRczUx?=
 =?utf-8?B?T0pXRnBIbkVoK1QvTjg5c0NIWkpvZFhVL09PaDVpbmJiRVV1cG51L0UxOHJM?=
 =?utf-8?B?ZjJrOE9oZjNPTlBWSXdxUjlsL2VXbmszZE8wRlZJZ2YwOWlyYmYzTXlmQmUr?=
 =?utf-8?B?QW9zd1NZRUZhZDUzTlRvQTd1ZE4zUUdPV25zMG1tMWg4dU5uWjdlSllEaWp5?=
 =?utf-8?B?eFJFVHYvaFA0NVlEL1F6NVZud1RRUHlEMkRJSXRxRk5rZXhrdy9HOEJDMGxh?=
 =?utf-8?B?bTViVW1iNmRIYW43eVBFek5aYUhKRFJEejJBUExQZ1ZRbTYrQkxVZWc3Wmw4?=
 =?utf-8?B?bW5aV09JdkVhb2J5d0dEUVd5eWgzVUJoQkNqZ3h2VmhHR3hQSGdnT1doTkpT?=
 =?utf-8?B?NzI0blduUzh5ZVl0SVFvd0liSTZiOEpBMzRHOU9BaEN3RDVuUWVHbG1sNWlL?=
 =?utf-8?B?UG1UTSt3bXl5NVhKYmdmRnZ3Sk1FMFBiRW55ZWZIRGdmVHJuOTY0TWhzeUhn?=
 =?utf-8?B?YktGSzBWdWxnSS9SOUtEU3M5aTFFdlhsMUxqdlBSRWRPT1QvOHFFTGtvaEE2?=
 =?utf-8?B?WnlscjI0S3VxWU1vNTVqUjEwL2FZa2YrTDhXdVk3OGlveUdGUE1UemFEcHVy?=
 =?utf-8?B?ZndiSDEvWjYzVHE0T1N4KzYyaVlGRVdwRHZCb1o2dDZMZ3djTk1CZ0R2MzZl?=
 =?utf-8?B?TEFXT3N1SG9mUERTOEpkRE90UERkOFB6bVllSVNLREtrVGN6aU4zcnM1YjJw?=
 =?utf-8?B?cHptNlJQR2R3OVNUMjBVRXMvNHV4UzhhN2tBcXV0S2toR1NEL1YrbXpPSnFy?=
 =?utf-8?B?NTkvSFdUendoOHExQVRFMlJIUE1IRkxUVUU1SmFVRlM2VjFMZGRIOW81ZENK?=
 =?utf-8?B?Q1lQKzlpSk5EZGVYK2FmalB0NGdNU3R2UTRhUGx0NHlURlgwNFRKcytST2VU?=
 =?utf-8?B?SVB2UklkTDQxRjBwZmIwOFpNdDg3NWlpRW9kVFhOSmFOTmdRWXdZa05NZThq?=
 =?utf-8?B?OS9XM09lY09oU3krU1FKZy9NSVdhN3p0OERpcUcwMzU0RWJuOXZqMWNqdXFp?=
 =?utf-8?B?MmF0NVJIcHEyQ2EvMGd0Y2Z3NXA0aHpIMWQwbGpsa1VidjJ0VXkya1BZT1JE?=
 =?utf-8?B?S3M4YmIrT1R5WlJoS1BuT0xZZXk3NUJQTEl1QlJLelVxUDJjL1daRGd1ajA5?=
 =?utf-8?B?bGc2M215V21La2FpaDljMnVKTEZrOW1DVzFrcFBFRmFaY1JGL1lsU0wyQ0xa?=
 =?utf-8?B?MnI1c1lSUWFpaDdQVTk5MVFyeTlJZVdScVUzZU5SNUlUMFlVUXk3WExueTBJ?=
 =?utf-8?B?MG90aHdXcXc2ZGVlVjNobGNPSERYMER4WkhqVVVPUGJSSVo4dEVnM3VqNmxo?=
 =?utf-8?B?cW9nS0U3TG5Pa3hGckZVNms3ZDR6TWtTVkEzcHpEUk81T1NnaGIzUXpOZjRG?=
 =?utf-8?B?dnBmV0k1dWpFT2dUNUR4TCtaVFdOZTVub0dDSFNIcFRqUnkrV2xJUkdHRnMr?=
 =?utf-8?B?UUFOWHVpdVdLVGIyTHRWd0t3TmJkaVRtQUNHN3VhTXcxTzBrVnFPcmQvcWQ5?=
 =?utf-8?B?bkUzQnlpZXJQd1MyWisycytkend2QmIva245VkptWUhDUGdLZUd3UGxPMitR?=
 =?utf-8?B?V2lacWJsOXpPbHRNcTYwOGNmZDBMTHFYNzF1UkROSFFjemsweU9iVzV2U2Jr?=
 =?utf-8?B?KzRic3N3Q0FRUFdodVZWWVBvejFYS2RDOFpxRHdtaXBMUisySVEreDF5VDRx?=
 =?utf-8?B?UmREUWNyTExjazBQcVdCd1MyRWxPMlQzVk03UnVYbjUrdExwM1lSRHNBdFVB?=
 =?utf-8?B?YVFUS2dzUTZIYVJCTENVa2dCaHNYdkRBOHN4OVplbkIyVnNuUEwrd1h6UUFa?=
 =?utf-8?B?N3pCOEp0M0ZrL25BM29jUC9jV0RTUDRaR253QjdpNEFnVE9pcFBmSEl6ZGxV?=
 =?utf-8?B?bGkyMUhCaW43bmVhZjZMOVFiUWxlOG5GNWREaGRvMEVjZUNPNE1YbDQ1ZTRq?=
 =?utf-8?Q?ZLBlE4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:50:47.7589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357c3a48-1fca-4808-0e06-08dda3c2a125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9087

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Function `reboot_machine' does not return, but lacks the `noreturn' attribute,
therefore causing a violation of MISRA C Rule 2.1: "A project shall not contain
unreachable code".

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

 xen/common/keyhandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0bb842ec00..b0a2051408 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -251,7 +251,7 @@ static void cf_check dump_hwdom_registers(unsigned char key)
     }
 }

-static void cf_check reboot_machine(unsigned char key, bool unused)
+static void noreturn cf_check reboot_machine(unsigned char key, bool unused)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
--
2.25.1


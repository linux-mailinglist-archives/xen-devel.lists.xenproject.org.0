Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778EA70833
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926788.1329639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx849-0005f8-Fa; Tue, 25 Mar 2025 17:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926788.1329639; Tue, 25 Mar 2025 17:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx849-0005dd-Be; Tue, 25 Mar 2025 17:27:53 +0000
Received: by outflank-mailman (input) for mailman id 926788;
 Tue, 25 Mar 2025 17:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xav3=WM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tx847-000578-W6
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:27:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2415::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79d18ccd-099e-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:27:51 +0100 (CET)
Received: from MN2PR18CA0017.namprd18.prod.outlook.com (2603:10b6:208:23c::22)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:27:45 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::7d) by MN2PR18CA0017.outlook.office365.com
 (2603:10b6:208:23c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 17:27:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 17:27:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:27:44 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 12:27:43 -0500
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
X-Inumbo-ID: 79d18ccd-099e-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRhU2CYPoPfGmsqQRbwGPcQGbFL5Po+P8n6WqmJuXoU826fUJXYRGC9H10cIjIGJIwxImkzA0cZ4lPzVcZwITUVaYPAUUxPEA0m2FAYDo66JAC8+rPUTUTW5lfuijVcOXTMBS5fTdwhfAV+YVtUBcgFRSx1V2sQXjSMh2FO2hOJGfSgC4sB76P6SjVKwLiBnhn1au8y2ZBTlHVaqM3j0AymcelP1jMeNTdIGrldfkY68U1ZI7GJQf/v8y4CFl2hvS/RDqCWjm/PpwiaprxYV6SBrteb69afxoAt1ZMDvR6DJDYQZmJMR7YRJNIOh61Sll+GWG7IrjSLqs0h0y87l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9DOB8WC9KWKSLTBEGC4wKPk/MvEmQT8Ry5fkhruHXQ=;
 b=ptwdiZk/vVAMpd+avE8R43Tm3LZoF/fZXWygN5vH+/EYjQGS7yBu2NQsTCuGEDHgzslgDv8h85I5Ks4IWxGaCXNsihGsrJGfciHWvSMosMZ+Dodh/BejIdxmJwQWtnf3agPgpjZrwsRUiqgu2nAbBh1fr1D5CS8ZtgfKNMPs1sEkP7S9H8tHwMgei/d8giTO4GI39w6v1wp1Eppf71dtIf+mEnCjP/XutSnSCdllGtHPb7FHjpSIJ2PbT3TYTyJxy/vRd5m8abBDmXivasOvrEeWdRxgIFJe8j15nSmMUpVbi4sM1gbVRLVVcVQEtzp0bFAqOMTsWsw45UbJRK7Rjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9DOB8WC9KWKSLTBEGC4wKPk/MvEmQT8Ry5fkhruHXQ=;
 b=gfzQfHaBv0WyK+CGim8uSy7AxOkQsUA4DULaYxFEiogFTFIG1md2VWNBYfUCm+Mk4xBp6/GbHHtmWO4LFElb06MZc0vxCAbNADrVpvWsaBPMO5eKuTBEtVSTxrIhw0Hwb/DGsVq9VPt5+gXW7CvKRdDTPGUmEpfaBFsfrcn4z+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v18 2/2] xen/arm: check read handler behavior
Date: Tue, 25 Mar 2025 13:27:26 -0400
Message-ID: <20250325172727.600716-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172727.600716-1-stewart.hildebrand@amd.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a056a46-cb60-489e-f8b1-08dd6bc25afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkRqTWIxM3dBNDZyeDltOUREOTZGZzVBaGI0NWlSekJ1RnloeUc1bWsxbktR?=
 =?utf-8?B?eWZEdlF3MzZZcG1FamRySXZlTGNYVDFhSzB1VDlma0RCK1pRQ2hZVEVNY2dp?=
 =?utf-8?B?STZVcWxDYUIvYU5lNzNJekRNVVgyMFpYN25CbWIxTlhDVzVqa2g0Y2tpNUxG?=
 =?utf-8?B?T2N5djFNTjkxM1A5VUpkd2ZlNk5FL1pYOG50MVhDeGxmYjl6NCtUU2FNdUN3?=
 =?utf-8?B?NHBJV0hkSGNFaitCVkZ5eEZjYk1tUGFCUDdDTW0rWXMwWlVIRkdIWUhYYkg0?=
 =?utf-8?B?L25VZ3l3M3FWdnMyc0dOKzMyYWlUejZwK2hmZ1FiLzhxMnV6d3JxQ1ArbFNs?=
 =?utf-8?B?SmVlR25ZckNueUMwa1paL0JJdVlKNjhXZVNnNGpSWHFVSUN0ZkFOWmttcTU3?=
 =?utf-8?B?TVF0ckxLcUN6K04raXJKVWdWKyt3RkpPSm1XTW9pMkpyU2FRSmNiUFBVVFBw?=
 =?utf-8?B?Q09YTDI4Mk50T1hqUUI0Y1NNbC9xTHcvYk9OdzdFNE5kL1R0Vm9VZUpZMDJa?=
 =?utf-8?B?M0o1VDh6bFBvUEQ3cDJHSXIrSzBNWXR4Q0podkFsM2RLV3pRWVFTNVBCQkNn?=
 =?utf-8?B?Z2lzTHh3UEVqL2tURWs0aldzNVJtSGFscEppTjJOSTEyOGM1WTFLWnk0S0hF?=
 =?utf-8?B?VmlZT1JFLzdVSCtMamZRTXY2OEV2NjMrS25CWjdOTHFUVmRsZzJLaGRmS29X?=
 =?utf-8?B?OXd6aXRBQmg2cjJjaWJCZUpHZDBHbHNvM3RiU0FMVEdPRWdXSmZub3NxNVNH?=
 =?utf-8?B?bURrYVBIUTFlNzU3TDFiRzJTUnVUdDV6QW1GQ21vdzQxREU1RDNReEFHZHlk?=
 =?utf-8?B?Y01iaUJ6ZHdYODRibm00N3J4RWw4aXlSQnUwMXlSSi9id1MvRXpvZXErOGtJ?=
 =?utf-8?B?cHhQTDlCMnZjaG9uYTZHRmNyUlBKOUVKeHQ3YTFQZDhOSTlMcmZ1TEI1YVhz?=
 =?utf-8?B?VGtoRDlkSm53QmRiWEhEYlRkY0llNVR4SlJvTGlrS1QwSHF4N0Zvc3dTeWd0?=
 =?utf-8?B?NDlyMldTVlVKY2F4MXZ0bm0zTnJ4Uk1jSkZybmhOWVoyUCtjNGhLa0F4a2pB?=
 =?utf-8?B?R3NQbisxcmlwb3lSTGw3Z0FsK2lYUWZYWXlCUUV5cTlWVkVnQUtxSitReVZM?=
 =?utf-8?B?YmpzZ0cyWlJVNGc4NG40S3JQUVpQaERIbDdMRTNjZjlPWHE2MDc4Mit2RDcr?=
 =?utf-8?B?MWMzdFhlTGtsSXQ4WHQwUGxHcVlhSTE2TFZFbUwxY3N6S0VwdFVNUVVld2RJ?=
 =?utf-8?B?eWFnUDdxdm9GK0hRMk1BZkdkeFhtdTd2RUJsYmRqV0g2S29iRS9SQWNaemdk?=
 =?utf-8?B?Ykw5MkVtRkF0aHFjUlhoMTAyK0FKeDE4L1Y2ZDRXNHNlU0tyNlZQbkZROUVW?=
 =?utf-8?B?UkVyL0NtUG96QzhFR1UvRW9VeW5BRmpUYTJ3Q0hyOHlXNnJuRUZ6M1hVeHFQ?=
 =?utf-8?B?M2VKNmNTMzlPVXhFYjNJT3BFdEJ3bTdkYmc5eSs3MXNtbzR0bUM2Ti8wbEpZ?=
 =?utf-8?B?eFlHVUVNbSt1SVRpVVRTRkxuKzhkbTZ0QzZvM2ZGVkkyRUl3ZWV1aUMyekUx?=
 =?utf-8?B?MjhTY3ZtTWpUcUt0R0xIN1B0ek9ncm52SGFNdTZmQVRieVZtVFB6RGNGelFZ?=
 =?utf-8?B?SHBuOThiZTRSVXVIWVp6YlRudGpPbjU4SnIrZEUvcTJ0ekVzVHBBc2gzT240?=
 =?utf-8?B?d0dZMjQ5TUpxdWt2cDcrZjdLamt2NDVDNGhFbzJZSVEvd3ZneFIwdmh5STVH?=
 =?utf-8?B?TWJ2aWFvQW1mZTU5T1VyWm1nU1dCMGdhK0E0aU14TXB0YWlaWUo0aHlEb2pU?=
 =?utf-8?B?SkFUY2FzeUtNL3FPdXZhdnhzdTlFRVY4U2hPczNRL0lEdmpRYmtDVGZTK0NX?=
 =?utf-8?B?WFl2VWVleGxtMitkYUd6WGU2S3RuelltclZ3L0d3dG9mODV4dFUrRlpjeXRD?=
 =?utf-8?B?Y3ZmT3RNUW41Y2tqdlIyR1luQ1hXMEFQZmxLWFRuOWRlZUZIY0doWm5KaVI1?=
 =?utf-8?Q?P1tbFEsp4JoSxV3JuVoZLuwXb7lCmA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:27:45.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a056a46-cb60-489e-f8b1-08dd6bc25afb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842

We expect mmio read handlers to leave the bits above the access size
zeroed. Add an ASSERT to check this aspect of read handler behavior.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v17->v18:
* no change

v16->v17:
* new patch

See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/

Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")

Also see xen/arch/arm/ioreq.c:handle_ioserv()
---
 xen/arch/arm/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 653428e16c1f..68b5dca70026 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
+    ASSERT((r & ~GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0)) == 0);
+
     r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
-- 
2.49.0



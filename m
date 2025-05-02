Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3BAA7D74
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 01:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975208.1362854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB08a-0007S6-Nf; Fri, 02 May 2025 23:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975208.1362854; Fri, 02 May 2025 23:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB08a-0007Ps-Kh; Fri, 02 May 2025 23:49:48 +0000
Received: by outflank-mailman (input) for mailman id 975208;
 Fri, 02 May 2025 23:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DVg=XS=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uB08Z-0007PO-Bl
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 23:49:47 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f88e5ac-27b0-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 01:49:44 +0200 (CEST)
Received: from BL1P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::7)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 23:49:39 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::7f) by BL1P222CA0002.outlook.office365.com
 (2603:10b6:208:2c7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 23:49:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 23:49:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:49:31 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 18:49:30 -0500
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
X-Inumbo-ID: 1f88e5ac-27b0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIFXPwLVjjPjMUmXDvEinPpOaKTt3ZYdngLgkEXQvuEjBa9kcNIZdgPfdKMdEKugjsc2hGp6cXy0SGU6DNaDgaNS3S86yvlOSfLmH1iEgBjoxgtMHPoB1828gz36z0686L50fpsfWmB2DIWZDTZyrpZEOL06elRkByeqEoWh3MaZWSv7XqgziQh+CkBDin5Uqv5a2D70G6aPuYQ1ew3GG+Y2aQpSw9U+GGpFcCZxTwSn24F76bKLZPHSmrw/XTkHkyfAGIggDNW3BPJIokBy6vt5Fmpr5Bkmu9g2o3539JpvZuMk0Nlis9kYP1Szk9LJqK9U68l+rB3XHEedYh+Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENRW1WL8vnVV2wSr9qF2d8OSvYyx5poSy7A3jhXfvcY=;
 b=OUL6nFwV/d+f0MmC3AC00MOzKqJP9ewKB0lBpgs/pc6MgjoYHNFYugepO+VwkOAzcUuPhrn0PSEfCYnubz0QXnr/49w92qEtZY0lvHh/LGtR1k+BNktDP5rVkmB7cJ7d5tm8229f0Jqq36AwRtIKRqVaAYz4FV0R8FnME9tTgfRjJAap5Eg46cK18hBQldFJU8yMhJ+hfa79jMNc8HaU6Dfu9nNIw1j//SiX85JBPusVao7qSje33Z/KIQe0YoKT4+AkwbnmVGHvg8DIe1lr1WxFs4kx27xXBhXGjNiAx38w0ISUGQE2F0TEln3rC9uUU8XBtT7tquRp4xmxePjf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENRW1WL8vnVV2wSr9qF2d8OSvYyx5poSy7A3jhXfvcY=;
 b=JLvnX7wVUJh01DS5+nr3CkmH/EnLllClNZ6j5FzvD+MAfTTfMIdQOi+8fZHPj4FKOb/6YBvUHEUwU7zTWbeZrSUdHPCSCxZmH5YxdPQZ2t67qa84aJXHYDgEwSfk3Usqp8eHTVrL8BRU5P5Y7su3MNomvItVnOT9XvK5dZBppWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/2] automation/eclair: tag Rule 19.1 as clean
Date: Fri, 2 May 2025 16:49:14 -0700
Message-ID: <20250502234917.3533514-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502234917.3533514-1-victorm.lira@amd.com>
References: <68d30d0b-1f85-4480-a2e1-0c9c5effb49b@amd.com>
 <20250502234917.3533514-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b56f8d-7b7a-4a57-2180-08dd89d400b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1Y3MldZeElwSWVzMGo1T3g2MytGK1lTNlMxQ0VoMUpQeWs2bmpXeE5QQkNn?=
 =?utf-8?B?SEszejhnRnRobHhWSUZHWkFqWjRwVndORWNCZjNLWGpUdCtCM1RNbm0vdzY5?=
 =?utf-8?B?Y0VDbGtvMTl5RkJERWhIcjFJTWRUODRaejh4aThhdXJUMnA0N1dqZFYrM0pE?=
 =?utf-8?B?RmR1OHBCd1JjUlUvMWJhcllYU1g2SXg5b2U4L212VStBb2RNYTVYamt5R2Z2?=
 =?utf-8?B?Vi8xUlZ3bXg1a3pKVm91QktuUEpMRmNwMU1lN2x6NkxUd0tqSDdhaXF6bith?=
 =?utf-8?B?aW5yNkppUzZaY3lMdkswVldhQUlxS0ppeHU4UHhlRTNJcFVkek1rbzlpYUVV?=
 =?utf-8?B?b0p1VFNnOC9FTGdHbk0xdGRFT1dLeFhGUVA3TlNNZ3AwRDVSUjVDK1RPc1dw?=
 =?utf-8?B?dG5ubzJOOWlSbjI3eWZSanBPNXZwelJtNjkrMkxvdjY0Y2pJOGMxQ2oyUVVJ?=
 =?utf-8?B?dHB1TmJFeUQ2QUVvQjVqUHZXa1BESmRMeWNSeVJhOXFOdWppTGQwN21BTDVR?=
 =?utf-8?B?U2NWOVFoL2ZhKzBQa0dqUVREWjZ3cE5oa2tDdGtVMGluQjgyZFR4Tlc1UXVq?=
 =?utf-8?B?M2lETmJKRVcxZmR2MWo3dlk4NGNUaEhxeUVCUUN4Z21HOVAwWXFpSThaQ0xY?=
 =?utf-8?B?QmY4cFhXYUZ6YVVMQ3JEdTVYYWRwalJGSWxRSlZ3Unhoa0dSbGxkcHhqZmpv?=
 =?utf-8?B?UTEvWUQ1cURMbmxaRXpiakZ6YWgrTTlLR005MmZhNm4xN0REdC9tQzNMV1Fl?=
 =?utf-8?B?OGV3TzA0YVMrdm1XUS9lU2pjR3lvMTF1V2I4cFN3VEwrazdlS3h6aUdTTmI1?=
 =?utf-8?B?RTZ5RkhzZ2NZNkxKT0VNYkZjOUxRM2ZzZmMrbnNiM1BxalQ0WFVLelZJRjJh?=
 =?utf-8?B?ZzRoQ3RpSUdBZXIrVmZzY2R6bVU0YWhtM1pWNnlKVzJyQXJZMFdWc2wyMzdr?=
 =?utf-8?B?LytGd3VPamJLdFplK2xWTGkreG9iZjdrOW9ZRGlHRkFQblJ1UFF5QU1kZzJQ?=
 =?utf-8?B?ME5McGNCeUVaNDNQZVFXSGNVWHpTUnFGQXZ0dm5nSmxpVGVyM1pkNzErSEx3?=
 =?utf-8?B?YTVlVlRvcW1kOG9PMXlJTXVBeUNvNTFCS1RvdFhSZkx5Z25RYkEyNEptTFFL?=
 =?utf-8?B?cnBhM0ZWN09qUXY4Vk9GVHJTNE1leGxyWW9lNm96OWh2UEdITWNIL3BTR1dG?=
 =?utf-8?B?U0k1TlJSREQ1TzNTcGpTMXcxUEpWUzF6V20xMGpZdGNtbGNkVDA5eGFpUHBX?=
 =?utf-8?B?cXhUU2lpancvY2pRZEZWdFZBZmo0NVVYWitxdjd6VU51L2hLci9JL2JxWVNB?=
 =?utf-8?B?MFFOeTVSQ0Q4VkMvMzQ2K09TMjM1MUZNNkpPT28za3RVamZiWmsrM3hZM1NV?=
 =?utf-8?B?NC83ZmxXNmo0TVFWd29veGtaMUNMM00yaU5sNGV6c2F2WXh6SkNkcU9MLytZ?=
 =?utf-8?B?WHlWRHNZL2E0QlFVNTdxYXpsd3Boa1VIdEFLVUlkc1hyMWlrQVhBaW1hNGd0?=
 =?utf-8?B?NURsTkV2S000QkZXSENySnlXbURGNWNlZkE2WnlUQ0pUdE1PSjJLQTFzRVlk?=
 =?utf-8?B?eWR5YVZ5OFFHTGxVM3c5bzR1S1FPTW8wS0hacDI4a3UyaEJUYks4QUxjaXlv?=
 =?utf-8?B?TGZyRmNtenNqZVgySFR1alE5UHQreHhBMkt2ajJMQng2MEpHV0pvQ0Z3L2RO?=
 =?utf-8?B?S2R4V3FETE1pZzVQTXV3M0YyckpUYjFMTlNVZVAyNFVaODZ6NVJhV2h5SVlR?=
 =?utf-8?B?VVN2YXFXK0FiZENRUkR3aVpFTmw0YjZVMWNzc0lSQTkwSmFsdnMzTnp4aXhN?=
 =?utf-8?B?emd2RHNlNkFxZWVpMFZSZXFtbUN1NWFwR29hZzBDY1lMYUMwNlNOTm16K2Nt?=
 =?utf-8?B?Um0wVVRjSkpOcjRjKzFjWHJsOUo0NUNZM1lEVDNsNWpGUkVDaW54RUd2TGxt?=
 =?utf-8?B?MURaWStHekxJNzA1QkkvZUtTOWhUOGFjOHdhZFFDTU8wcmhuZFBhd241WGZG?=
 =?utf-8?B?cWVFSFJseHBGTHo4S2ZFV2F6ZFMvM0JYdGZFVnNzQkZ3NGZuZnVBT0d3eXdT?=
 =?utf-8?Q?emCFRB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:49:39.3797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b56f8d-7b7a-4a57-2180-08dd89d400b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488

From: Federico Serafini <federico.serafini@bugseng.com>

Tag MISRA C Rule 19.1 as clean to avoid regressions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 1d078d8905..dab3c51faa 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -78,6 +78,7 @@ MC3A2.R17.5||
 MC3A2.R17.6||
 MC3A2.R18.6||
 MC3A2.R18.8||
+MC3A2.R19.1||
 MC3A2.R20.2||
 MC3A2.R20.3||
 MC3A2.R20.4||
--
2.25.1


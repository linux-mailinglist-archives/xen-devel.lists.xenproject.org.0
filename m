Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E47CA34E10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 19:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887951.1297374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tieIx-0006tM-24; Thu, 13 Feb 2025 18:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887951.1297374; Thu, 13 Feb 2025 18:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tieIw-0006rC-VX; Thu, 13 Feb 2025 18:51:18 +0000
Received: by outflank-mailman (input) for mailman id 887951;
 Thu, 13 Feb 2025 18:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRuD=VE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tieIv-0006r6-UO
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 18:51:18 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:240a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9d9565-ea3b-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 19:51:07 +0100 (CET)
Received: from DM6PR11CA0018.namprd11.prod.outlook.com (2603:10b6:5:190::31)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 18:51:00 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::e5) by DM6PR11CA0018.outlook.office365.com
 (2603:10b6:5:190::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Thu,
 13 Feb 2025 18:51:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 18:50:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Feb
 2025 12:50:59 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Feb 2025 12:50:58 -0600
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
X-Inumbo-ID: 7b9d9565-ea3b-11ef-88c1-8ba37f82fa57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egboLFpNsPK6IbL8mbtc/9JAhJsOmik7wQCLGLQWkw4k79A2gf+dk5Z3GGUUD+a8cVnkY0ccRv1ZOTDpm7D9xTu+3hsqggHfy65V3WtNbyM/c+AF5KVBTrXV1RcyPt+xjwFilFqv/Jhi4/ZD4vV59Oo0O7Q8lycPX8qho45v9JkOQlTbebpvaALAqDXXRVY2A7dvsOiwklE22k9ufp1VL5G3qsWOQNY0bwM2iwyOuvbwJkHe7aAImXOuuU4SBZ8Sa4CdA7sRGqkKWVOyI7nxVeLAP3U0zF4e+EPm0YFbYVvsvL5etzB2RDi3N1hxW+BXjbGznzQAqjsz7KFc5E4y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/uhVK9NgT8GwhuKpNpJ8pSi1VhbJT7goWnfz7eyFlY=;
 b=o5Tz+7eUJSLIkHtwdlRClT8dIPiLgQ6i+wh2q1vv9xQQeDNEluyNdWEWQhhOSKB0fGlDtim/q1MrzgpO/fftmzxWa7F6fsjTSlvjJap4go2mtLn2A5BX+SN7heQK5vLqWurgA0dxTyz8eT3OVZi4J8RRcL32XiciaEH+29PFKhLcPIfFgpbcrcVDIh244CUYdeB50ikJ9KZkKsEY7eyuPKJrweJLRvwODRB0+4M9ly9037uhP71f0WMDTh/4khS7+TVO9uWcasSDBXEApJA8mjd3OCfOGMZc1tvUGr2BZuCG/flqPnexctGQapbtugdBSW1b4lG03qRzX2WEbW9/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/uhVK9NgT8GwhuKpNpJ8pSi1VhbJT7goWnfz7eyFlY=;
 b=ZbBzLpIysT/BHjkefiXku60ck83e9B/4KFynW6AeTGT4Y6VDRLOA2YF1XRtpglq8mC0XibjLUvPbdkSZBPHAw5qWAvadC/FbI3eWPQewf5zYCdUaMXz362GDlDbDm4QMIBC11qmKU+lY1PJPq5P/iRSSZBPb31eR3MOzFnd2euM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
Date: Thu, 13 Feb 2025 13:50:54 -0500
Message-ID: <20250213185055.711703-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db3c4f2-17cb-4f76-0d14-08dd4c5f5ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBZN/qcjCx4aWfT6dua2jEl4LjtuDj11YJpYpY9DgMjDcWh16VxQtCNncKWk?=
 =?us-ascii?Q?MfKJ2BZxv3fVy7+lEXt6TZOGk8z4gqlMzcnZnEyYuMP0gJCRZDKWl7pqKpfU?=
 =?us-ascii?Q?G9/vcKsm0DXRMyiHe3gmAQkfxThJszYOB9ZBlaVWW+gPv+2YhQVqje+M1AvD?=
 =?us-ascii?Q?IQ6Q5HmZ8hhJerWWJAEQgSEhEb1gBQvXSfCxByMQmo78OUkgGStF8EmL5M4p?=
 =?us-ascii?Q?NYm/tBSXjcUBLsUReZVQ1pR9ACyZuvILBaXDklRQxwO0Wu96PV+zmzfXOAlm?=
 =?us-ascii?Q?qz/D52D7/ZpGyv0m0ZBGt0ir1iQGti0KhgEs90ry2U4SCoM3fUER+XCEGsh6?=
 =?us-ascii?Q?s3tT3Yye/+7V3cqd8NxmhjGnU42ClhSCwJFeCeY84jGgE5rVoxK3Z3h0GAds?=
 =?us-ascii?Q?oFQTKQfmVkl9pKazwXitDaCXUR114DOL/b0e9gBIEsZhZIzIjOXegsiHPp+N?=
 =?us-ascii?Q?UNqqoe7o4IXDE0pJiURNCRTmwFsVnB7KhJduiQ8J9ezhYvvN14c34gKfX3yF?=
 =?us-ascii?Q?+tlC55OT+G8/TgbDnVsKR8w6d9bZ1qau1ylFiLpYOJ8vNWnpNJaKEkLxSRaH?=
 =?us-ascii?Q?KZ50ZuYBlJc4zCMEFQDagNdxgHWA9D8xtLO2uXZZYEODKBv2oYmaI2GUTIWi?=
 =?us-ascii?Q?z76prpM/F/wKxjuDD3S5X3lRr0Joik+DnrwsB5eUtJ9k1OLtknJfJtl7uxwL?=
 =?us-ascii?Q?lwMBls3ZM8kU7HEXDx92Ziysfmg1Qi0qulIrjMtbSb1JJknKHDNPz7iFUdRk?=
 =?us-ascii?Q?e3mc8YYCovpQ9zbcISLrYNihOV967wyv18HS9/p/Tm0E9TW2Zrushlm1lyZP?=
 =?us-ascii?Q?mGaYn3Q+J3rwSeN42hINSvIeemq96b6USq3dOH1/3E8DTmVHWFh0SwII/kM3?=
 =?us-ascii?Q?Kid44OnTRvDawEX+TV5Bdl2g1cykbVOJge1KhnIYMi2dWBPpQOzq8tPvptsB?=
 =?us-ascii?Q?Ih0jOxTPacvAltReCrrE5xScIRXcB9dmYEFtWsBvZcqH4rMDIsyGY5xtUJGl?=
 =?us-ascii?Q?Qn7YQvUwRbs+GuHs61Q2MLCyv82ECEgRM2NHApwIYuDeMoJQBp04bfkYqCas?=
 =?us-ascii?Q?K3QP0GxQnq+SRKLdtOMuMYYpjB+2IHyBUSZVR74fpC15+kmQZRY9iFpvZCPp?=
 =?us-ascii?Q?zA+lnc+TdBXlW3/BfZkNxhsBZ5RfaIHEizdb/UbdqXVpxKhRx98PPyYlT1d1?=
 =?us-ascii?Q?dLCWbFQ4ZAEWb3JeYixaSOQHWQI9EqMA6ejCPOHWnVZe3UMErxT8yQnkmyCU?=
 =?us-ascii?Q?X89YOupKpx+mWDdNcayWUr53/uT8Ci/67bu5VuNq3XH+a2Uos/u78YFG7HZL?=
 =?us-ascii?Q?ZI6jq9a7PEaLNt6nwHyU1gqu3Q4Gc4/VrIa//WJkfL9q/TGE9PLZu0UA2c2a?=
 =?us-ascii?Q?wN34iUUAd7gy+kF/ZioTdVNQ+zdglUCToI8k7qlAVwGLzhZ2PptWYifRp3du?=
 =?us-ascii?Q?kTWoyAQh/gAIOcvxjp4TecrTu7QdZc/UjdH3kXMJLILtIAQZrNafFQtyzAdP?=
 =?us-ascii?Q?tpzX2lT654CCWdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:50:59.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db3c4f2-17cb-4f76-0d14-08dd4c5f5ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130

When building with CONFIG_HVM=n and -Og, we encounter:

prelink.o: in function `pit_set_gate':
xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'

Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
elimination.

Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/x86/emul-i8254.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3f0..7bc4b31b2894 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -191,7 +191,7 @@ static void pit_set_gate(PITState *pit, int channel, int val)
         case 3:
         case 4:
             /* Disable counting. */
-            if ( !channel )
+            if ( IS_ENABLED(CONFIG_HVM) && !channel )
                 destroy_periodic_time(&pit->pt0);
             pit->count_stop_time[channel] = get_guest_time(v);
             break;

base-commit: b5b2f9877a8777af6b78944407527e0a450389a2
-- 
2.48.1



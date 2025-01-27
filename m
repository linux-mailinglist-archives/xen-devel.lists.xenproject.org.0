Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623EA1D4B5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877645.1287793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMdA-0002XZ-C6; Mon, 27 Jan 2025 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877645.1287793; Mon, 27 Jan 2025 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMdA-0002Ui-6G; Mon, 27 Jan 2025 10:46:12 +0000
Received: by outflank-mailman (input) for mailman id 877645;
 Mon, 27 Jan 2025 10:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcMd8-0001ah-TU
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:46:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea9beccc-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:46:10 +0100 (CET)
Received: from SJ0PR03CA0251.namprd03.prod.outlook.com (2603:10b6:a03:3a0::16)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 10:46:04 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::92) by SJ0PR03CA0251.outlook.office365.com
 (2603:10b6:a03:3a0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 10:46:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 10:46:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 04:46:01 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 27 Jan 2025 04:46:00 -0600
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
X-Inumbo-ID: ea9beccc-dc9b-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED4aLuJWT/OrDx7T1wKZVT6NozYck4aZOw727gZ0me8beid5T9DHmuxJA+UuFDDRlMFJjvBbwf7y2ZnDCyR9EO5FnF2r4xq9/6JS7Okqyw61J3o26NmIeRbnNT1Zy9uDHy8lM80VoixDfJvnE2Warsq8j5RObaA6mAohasea3Tu+bXxSHsgoD4x+WC2tnTrQPuSp6e89sIUDm6m4e7vPztkVEylE/rklgEY5P1TsguY7CyBaiYaHzqI4jBnZFn9PqGtGJRRd53Wd+S2Wd8+dk5JHY7x+ljXhEy0gGtW/kT6Zc+h46sg4zvGRIpJryHK+JxSFEWm22zYdTUYitWz3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNR0ouBbqbHHAoSjXLlBdAQfyyv0rL4tNCyhR0MJ/FQ=;
 b=rRGL45nohGf+G9snm88Aqb/jroYLkCDCWiOld3fFWFxqHA8u3ByT/q/sNWXECgjhnP8n8Wo788sBsP1nqSG6xL+4pR1xr1eP5klU2FDFVHH5CDNI/3eLuc9kEUugIwBuhSgMh28UrFbTG6n977SaybO5k/84tmMn9G4r8Yo2SzOn3MIjElhrbcLgZMcxn7nAjvAsIJwIuArtlfoKuXQOOxWVmSRPoCHWmYJK4MUDTsSooLnWO6h9+7ox5/VI13UcmQoRqc2IDVOf6jptVrI503WqQ2ZkSjQkIrSG65CEaKHZ2NpZjrwkDybabr4MgXM7Nn47MAIC8O5sytl/vHYbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNR0ouBbqbHHAoSjXLlBdAQfyyv0rL4tNCyhR0MJ/FQ=;
 b=Isngv73SK9qKlKNWxbRH/BQh8PMWcvrKmjWV/1kvQ9K2zgWSmxSSiMfE4xoxK6d2jkj/NO30Dlu4BjzgVWsaY3a+ZVsUxAjnqJ4jwibZIAPmFbs35tQIZwIuiVWXw9uz45L3KOHsxWAvm+3gy+E3m2+mj3nhXgmiN8v+1/gNsQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
Date: Mon, 27 Jan 2025 11:45:55 +0100
Message-ID: <20250127104556.175641-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127104556.175641-1-michal.orzel@amd.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 684b561d-a384-4e91-332b-08dd3ebfcb2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c7Z5v0fA5X4ppiwAKUcViE2YL2YYadK3VihlFGZoQ+5DauctIFUA01xyvfKK?=
 =?us-ascii?Q?nmCGTYJBgIr8ZUWMRvlRA6ip9tLaNWScTt6OVL7dHfO/8gEnwr1rYS/Jqpfz?=
 =?us-ascii?Q?2L9SRZCghoTPkiDoCLJ3BViOI+5KsMQUY4t2KMF5nJP59Zvj0DS6o1kfM2eg?=
 =?us-ascii?Q?bUD0mAiAejfkU194hwQ7/9eFTvhoaBzkam+1wJCsCvs10sRhXQVOyqhx0qv1?=
 =?us-ascii?Q?aNWgNAYL3D+ZQd4huCNbkyR1jCjT9ljj21TiZCKRL+JubedqF8wbSNHg/Z7u?=
 =?us-ascii?Q?FcKnVAvRndLH0AFGWwawYFMF9vGPXn71wnFmGpgbGygzEtyNOGkHNDwHZ8cA?=
 =?us-ascii?Q?AxURmxd/ltCiprtUXoaeEq5DPjnM0Qoj/hBMLgH5YncVDwuxPfpKTT9Ab1gu?=
 =?us-ascii?Q?Qvy+8JWADbNB6KB7dB9JYk/xYCSyNHeXq95JSHT85DhWePbWQN3fXypMFoUM?=
 =?us-ascii?Q?9lIAiVaIGxSmaiS9sBHMK+s/n4Apf2O+ujQwMts6PrvbfETtl5sFx33rV5jo?=
 =?us-ascii?Q?DvrYznqn3wR3b9hXyIL+KSBMs4l3Z4wzaar5CHMVf1MZqZy7EK1nNYbGWwmG?=
 =?us-ascii?Q?8FlM558TWb430TTJaSs3ckddesDAIc2CmVJPtUIKuCecWb3LIH5DkeIi1zE2?=
 =?us-ascii?Q?WQNGf+YzMvP2zdvbvFUGj5G9tZgz1QylmVCQBJ4wNOmilljLAXtHnk9wxEwg?=
 =?us-ascii?Q?s0YRn/1okubxA5A409MFwSIKDFq1qVAJmwxrKSsH7ZZYK97AZMoknsVsj6Po?=
 =?us-ascii?Q?/OtPuOrU9Yg2kPQl7OduPI4bJpbNJPOtRXaZ+hR0oyLTSRU7CvbK2mNPE/j+?=
 =?us-ascii?Q?I5Ol8H11J8VD+CJpkgwUOC0EYKi+15USXZJjq2cWpMAXDgWCUhcMmz9iGw/Y?=
 =?us-ascii?Q?/6Dp+tfWSUnPrjLeNGN38H/mwUSO0e/r4fim//Jn/83Cf8qlHzTDQYccAbbz?=
 =?us-ascii?Q?U6HXnqJo4iLddPBkAAwycVTcOk9jFjtO9F0LuHOt9Z2BeSP/1QvJFb8fcYd3?=
 =?us-ascii?Q?Cz7T7Nh4ccpfOWQ4aegxh3Expw/TNMRMmIf/xZeqN940+C+s0ho83sZmGdO1?=
 =?us-ascii?Q?dcGllnkVVattdol3qhycNLBjtwFHSJG8KX0yZO2jcacCNCp+KMsEyWPzOp6K?=
 =?us-ascii?Q?TIH/jVJMcwxNMPFkdXoQ6oDw1K5yM5MIk8taYfoLdhjelxHZrrBxQeKT6wnD?=
 =?us-ascii?Q?BUtsDHmb+rGGFXdCncG4tk6SyzVCDQ5RmIpLJFrlrMtsPhZ382pUtUSyKO2e?=
 =?us-ascii?Q?bDFtPja/zWfVQvnKigiNuIIFBgzIeqO/GGWWX7m0FyRCOaTAbZOK0coQLUfv?=
 =?us-ascii?Q?xVkCezldK9qb94eT0VSpeoGK+l/CcgiX6lJYL6p1Cege8rDTr895ft7wlEBx?=
 =?us-ascii?Q?BSzUcMB6mbVS5V/rUTUNsVW24ZkiMHhkYtXSkUnQc+kRi74mNxQWziFHVVpx?=
 =?us-ascii?Q?T4wycRJgetVyWUsiuQmkNazAfcVY7PPhoDo6GzdgptL+hlFtIIWX9QTWPmvb?=
 =?us-ascii?Q?xLAqf6mwzUrMw3k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 10:46:02.3237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 684b561d-a384-4e91-332b-08dd3ebfcb2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
common/device-tree/bootfdt.c: In function 'build_assertions':
./include/xen/macros.h:47:31: error: static assertion failed: "!(alignof(struct membanks) != 8)"
   47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
      |                               ^~~~~~~~~~~~~~
common/device-tree/bootfdt.c:31:5: note: in expansion of macro 'BUILD_BUG_ON'
   31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);

When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
therefore the struct membanks alignment is 4B. Fix it.

Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory bank structures")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/bootfdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 47386d4fffea..511700ccc2ba 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)
      */
     BUILD_BUG_ON((offsetof(struct membanks, bank) !=
                  offsetof(struct meminfo, bank)));
-    /* Ensure "struct membanks" is 8-byte aligned */
-    BUILD_BUG_ON(alignof(struct membanks) != 8);
+    /* Ensure "struct membanks" is paddr aligned */
+    BUILD_BUG_ON(alignof(struct membanks) != sizeof(paddr_t));
 }
 
 static bool __init device_tree_node_is_available(const void *fdt, int node)
-- 
2.25.1



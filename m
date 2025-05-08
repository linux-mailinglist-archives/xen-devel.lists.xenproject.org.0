Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FCAAFB2D
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979385.1366030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bh-0006EL-4R; Thu, 08 May 2025 13:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979385.1366030; Thu, 08 May 2025 13:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bh-0006BD-0n; Thu, 08 May 2025 13:21:21 +0000
Received: by outflank-mailman (input) for mailman id 979385;
 Thu, 08 May 2025 13:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1Bf-0005gg-KU
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:19 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2407::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52862c0a-2c0f-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 15:21:18 +0200 (CEST)
Received: from BYAPR08CA0017.namprd08.prod.outlook.com (2603:10b6:a03:100::30)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 13:21:08 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::b9) by BYAPR08CA0017.outlook.office365.com
 (2603:10b6:a03:100::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Thu,
 8 May 2025 13:21:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:21:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:05 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:21:04 -0500
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
X-Inumbo-ID: 52862c0a-2c0f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogK46fMNF/5T7TVjIfBzK0mhJwOz3Mn+baTQbFJ4ZdHw24W9G5Xlc+mLAk2khCdKtPdnFaT4UTYPbY/mOYqmxstlyMq0rVsvY4TIJ3SH0+nMab2pjXxF4QusP94RmsYo0dmU2yRo7iUyjvzt7z9IwmOPAlgem+a6seShpNBaBbVEC0K7+o2OPXbw6Jd5ZvDn24qjaONq+HO//Pvp/9L3vQhwIXPfoOu4uRbzx83B4ovg7px70hH7dIWhVo/yOfJC/B8iqPPo2vs3e+Kq9e3+Gyu7Xvnd8sbtw+SHyM/lRD1IFcCyzEeFCMopAfAPfaYpdU2LIT3HUfhkkiYhCj+/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS22mzhff6xyNXazuoc1lhnF/LmLLmyfr0SuzpVE+S0=;
 b=Cyy5qzrzxBzLcoThoY+ypwvxcVgq0IkdUN1VKbjtRVp6jaLh8mxbYRy2N4Adf0N4uot9jecQJTAd04AQ7shav/tWcyCIRQHTb0JAG41iWiEYIvFCncJd0c6TIJ/abGns+5CmsfQ6jmF00ADhiw3WWZfvTJT7YAE4O8hjbJJgXh0FnAjToUaE0ojae2HTcZSBYtHkdEVeJhHdb9lYHa4PlbU7v1xoFYCNjKP/yFs4XUbx/E1tICxDrdLaLvnUlj8puGzOg/nbgB1XBIgl07TR2n2VVdyIo5Xwtuer4lwRvxS9xtS6IFX+CbgU+HhwdKexL0oY3Gw8wARGQRtrAJ0dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS22mzhff6xyNXazuoc1lhnF/LmLLmyfr0SuzpVE+S0=;
 b=ms0Xa7ZubwlHasDo/L4IEEtWvrHVSb4w85aSvWmqfgMR/aaeM6PoE4kMOPJXkan+CKlpt4uAfvJp4THaak5WUbrnKlnTcbh0vwUhVKs2ea++Uw5/yb8iM71ElX0VEVfEjYDz24sQ7+jkgsNErFyWNCQcRAFl+1pYlwx8P0ckheA=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 2/6] xen/arm: fix math in add_hwdom_free_regions
Date: Thu, 8 May 2025 09:20:31 -0400
Message-ID: <20250508132040.532898-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e7f5fa-fb8a-404f-d2a5-08dd8e33308d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E58DZ5mYoEqNu+dpugWcbN3B7AN53NiABV1qebW3UIn4GiF/kAUTDB08UwpA?=
 =?us-ascii?Q?q2yX1rc26D2R+YzXUzk0qO2xT50WQ6htlghQ6NG5Dwn/j3WrDk9u6teKoPYZ?=
 =?us-ascii?Q?nTSg7BsrF73YmmZPZmRv3XdRyW3Kk2THxExn7xoT8UdLJN4yqPTv8ok8mSd+?=
 =?us-ascii?Q?7/nevI8c4nfkKpfCOMttLzf/uXs2u3A7eoHsm3WNyKGqw3HKgL/2B/kHNRtf?=
 =?us-ascii?Q?Fk0r87F+gS7tgbtGz4md0GMHyaoSxgZMe4n6FtnFCejw13sl+9+ZOd+HOHaj?=
 =?us-ascii?Q?XCWGyKEWn4e2xLogLG6NXXszadKuk2dYTDCvBvIkp9cYytKTlbyFVbFBmQOA?=
 =?us-ascii?Q?Qm1Bhi76X6rJBiqYGfgUrtEbP6xgJzURdOOSzQAmzdnNs9XE5cBKyV8lzppK?=
 =?us-ascii?Q?tRnIeQfzgRu/qll2PgAnVh+yaAQuQvuKfCfUwrdkrewHiKxBEP4M0vn/UEak?=
 =?us-ascii?Q?l7wH5saBM/99FEQKlcyX0PzIS6eEgPLbxiSlB/7kbtTHH5ynXbPT5xFipzRn?=
 =?us-ascii?Q?6XBwNp2aR5XzzDOamYULjAqkGRg6bVeoWwVThOyYNVW8CL8bxQw/1VG7Jbq1?=
 =?us-ascii?Q?BjcjyneXwqYx4Idvno8h6z3Gr8bfSkMbhjLWgXm8J3y2IvSNprK1sdtv3mec?=
 =?us-ascii?Q?gdqYNSrbPCLfgQq4orhkJIu+Vg859axb6z29rvVb1QOxVrIq+j32Wb+clhVx?=
 =?us-ascii?Q?4TSYu1lmaJStMDMaxA/VV7Jo7bjohpolRRHko9gl46n9QjBq7W4PcN4lTVGS?=
 =?us-ascii?Q?WvPerrIkp4eoaSNz3S1IqZsXHAVpZc82vQs0z3X7Zi52t/9AUZDUe41qSGkG?=
 =?us-ascii?Q?5jwH47kpvn7DHOhDwpMkrsumwcV+Y+9vkuSzTSwhDug4jROnA2F/YM41EG/r?=
 =?us-ascii?Q?jLKPgT1uyzkpewTpJrt2NITo66PPxXo+qQERfuP/tQ2o54fSWxYR9xKpCy4Z?=
 =?us-ascii?Q?kddRhlPLOBv0DRtuITf/2f3dLPRkoCQhmM/DylLE3U/JixJM3PxZWDpYGvBh?=
 =?us-ascii?Q?TekMjGzRljkRJsEMtv6L8U5WJLf9xYSyCCyZ6BrDuB+a1r0UOUnkBjTcHLlU?=
 =?us-ascii?Q?iA9M1k8if4vcjhcZvvab2iq40ACzk0k10SY0TnsJURvybrinm7vfdgv3BzSh?=
 =?us-ascii?Q?d2QsH3AzyNUjo/QXphyubUupH9xPg49E3BFbFjf5cDfP674MMGDygl77ffU+?=
 =?us-ascii?Q?xOgLs+o4BfxgcnaF1WfmTy1tTkqODxYLzGrjufHA0ZSkdvrQnO2+OUGIyCdc?=
 =?us-ascii?Q?4bE/G5fOQmJ/hAIF5TWidnXtbiwsYQ8bRxtyFyi/fF27wIT2H76nanapdMx1?=
 =?us-ascii?Q?+8QuVj7NmF4UTD0na/AR7f3/C7MJ9D8+JG2b94+VRihbMzqI284y45T17BOQ?=
 =?us-ascii?Q?2Ac5KKYBRhEj+63UcClTVTK31wjBfPaIoSC3yMW77w0AUBqyOzxUmUd630UF?=
 =?us-ascii?Q?EAYezenpZzJxg2a8IqIZpAQiYhuTpBxX0+xIr5LJGz02Xc/P9NlK0eITo4rr?=
 =?us-ascii?Q?lCxxdoBEsCAF/E+WzzxJQVYx9gzwmzkIXPDz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:21:06.4143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e7f5fa-fb8a-404f-d2a5-08dd8e33308d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988

Erroneous logic was duplicated from add_ext_regions() into
add_hwdom_free_regions(). Frame numbers are converted to addresses, but
the end address (e) is rounded down to page size alignment. The logic to
calculate the size assumes e points to the last address, not page,
effectively leading to the region size being erroneously calculated to
be 2M smaller than the actual size of the region.

Fix by adding 1 to the frame number before converting back to address.

Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
v1->v2:
* add Michal's A-b
* rebase
---
 xen/common/device-tree/domain-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 762b63e2b00a..9556af43e019 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -109,7 +109,7 @@ static int __init add_hwdom_free_regions(unsigned long s_gfn,
     struct membanks *free_regions = data;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
     unsigned int i, j;
 
     if ( free_regions->nr_banks >= free_regions->max_banks )
-- 
2.49.0



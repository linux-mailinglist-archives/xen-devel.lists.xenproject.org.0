Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D7AA80D8
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 15:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975336.1362868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBCmN-0006lZ-AQ; Sat, 03 May 2025 13:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975336.1362868; Sat, 03 May 2025 13:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBCmN-0006jp-7Z; Sat, 03 May 2025 13:19:43 +0000
Received: by outflank-mailman (input) for mailman id 975336;
 Sat, 03 May 2025 13:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VVK0=XT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uBCmK-0006jQ-T6
 for xen-devel@lists.xenproject.org; Sat, 03 May 2025 13:19:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413cbe5e-2821-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 15:19:35 +0200 (CEST)
Received: from SA1PR05CA0020.namprd05.prod.outlook.com (2603:10b6:806:2d2::22)
 by PH0PR12MB5632.namprd12.prod.outlook.com (2603:10b6:510:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Sat, 3 May
 2025 13:19:31 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::8c) by SA1PR05CA0020.outlook.office365.com
 (2603:10b6:806:2d2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.14 via Frontend Transport; Sat,
 3 May 2025 13:19:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Sat, 3 May 2025 13:19:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 3 May
 2025 08:19:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 3 May
 2025 08:19:30 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Sat, 3 May 2025 08:19:29 -0500
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
X-Inumbo-ID: 413cbe5e-2821-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiERQ+EymohCNCMtfmRaaRpVE8FLKbghvFBZfvA5wZRUJ8gnODMworNqKSW9NJNegZWLq4Bzs+8tOrQ8Fx3WPtF+2/hRWx12VMOg3jjQBpXCqPLuWccpi0H9xu6nzNHUI3coDINDehvrtyPHhoLlFohMupyXEbDeJoMjFLhuMq/d+pLaRil+7hPohTGOeglBJszmk/+N/NWp1W1XAjcAw8XXz0TdyikmSMmhELE9DxBXSPLmx9rFZrwjCxCBCngxU4x0n/f0LzfWGRg+X30A8BP5NsbF9gJWik+BLkSCG+FUhUjnrK2CdTcp5jsSOqRluy1DnQEFqfgj99EoATM83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XThhfT990yCc2xQ1ru4NmFFbo4KjWfIRuJptyrW4mmc=;
 b=hpO0fQWOGgAUJaJJ5D7mbskayjEh4czOkyf2KZTquSqaNXOJpd3JWtzbSL+vbzAUJAa8eDS/L2jk0M3ALRe2gus2ccsMxPtPuJ/wtoO2mONAnys4xoceLfDhY29t/NJ+dXGl8B+cvUzbMUXwpl5ObYRbtqF7QL3rJxL7Bstmm61etixrFeoW+cE+gOeKvImhIRbGaQoY7WHBXvNgHfIS5hbX9uCxL2KaehuRgDbDvWQNkVMoEmD7bucQIGinvrX6umZtBwbmNKiIA3sBLxoWY7c08a8jZNQpeeeFSoh5bF0oepQan6X5UzMtuEr2mPcN01PLqrGywAcM/b3H3Tanvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XThhfT990yCc2xQ1ru4NmFFbo4KjWfIRuJptyrW4mmc=;
 b=tqHE6DGoedmGOqgCqTAbIF5iJy7nmIxncKXojcAywtwnLODzr5KeL6buCHSRtyC4vOirsgRl1Kk6YAJy+0M5g1svGYDOypwzQBQq8adlgzYvdmO0M/q7jzv91GtKuvIz5ibhuGK48/0blve7ABb/4BwWZpu8K3tuGd0LG427c60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
Date: Sat, 3 May 2025 09:19:35 -0400
Message-ID: <20250503131935.1885-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 22331140-6d84-46e3-995f-08dd8a452375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|30052699003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BwdAME9mYlk1D3vSntdUTciEPrrbMko6u/UG5zl2GvIHcYV8svLeDhJ3N/YV?=
 =?us-ascii?Q?/uEj6v9lS/fz525NFHkbSEqz/9qWNsJ27Wy6+zIDIGbvEHdxm7PrTWkAts4Z?=
 =?us-ascii?Q?4cgKKwbPLuC9wTjiDIC4kmCvuxihVvcc3u1yPkIvFqkkeAYn+gUpEvyru5fy?=
 =?us-ascii?Q?ZEpmOxDgyL6EajN32A1kmmFX4a44eex8qxGsnZ7aBwew0tDQJUOyR+uXPGdp?=
 =?us-ascii?Q?+n6BG+0T6st7+J2Is5ovO1mAZTo3NIc6MdxdnnQta+4pQt1I/0ByUNSLYdMI?=
 =?us-ascii?Q?LfNMOlGCH87GZGjTnzxJgQAj7L+k3Mwi85ZXezrz+7OhpJNCZWhjQWXeqCNm?=
 =?us-ascii?Q?OPx30wAk7+D8GYzpXKzvctuUSV67sPFp749fI90DszlIQTE8Qfm57J41uKiP?=
 =?us-ascii?Q?wsXMKkcDP9B4fQBiSMCgE+f9pQ7pYzF6UfyzLukoIzty6yy6O7vcuot7k7f6?=
 =?us-ascii?Q?AGDsiCoWJknIRekjr/XG/JIHwl33O41xN/a+jF1yfsIpLTR9B0Dy/BgFvnEn?=
 =?us-ascii?Q?RlInJN23AbMnhXzVCK6TklvauMZeC6F6Z4uEjGaBbkfcsJCNxjJMHW7bYJb2?=
 =?us-ascii?Q?bx8RgcjhbLKzNSHlprkUz2lQgN4tqUUaWgxqZYn57LZOkezXOHV+8hJabRUh?=
 =?us-ascii?Q?gahZFMJZLlwusGcPVFwFLoHEnP2Sr+6+kRA3I3euFGB8PZzhQp3OPN4P3BWm?=
 =?us-ascii?Q?yGLVuNg0AQBpBeCFYrm0m+gS74Xg8CnVk2DOBEa/zvKI/tEnHasuD2onEs/D?=
 =?us-ascii?Q?5pFjjQbtbhUIt7w2aBQq36EoAy9ej7M5OKNmboYZapq3OXRau8Cx2liMR0gM?=
 =?us-ascii?Q?1pNO9LdoHyOip0mt8uNGhMFG5AG2Q3iHN9+EhdTbV6ZpVmUAn8Y3hPvzjkpQ?=
 =?us-ascii?Q?+4mtQVMqqPIbuL+gJW2lZgkYvs6i7IpryYSHXo1Iflj4EsYxqjUzF5JHgDX/?=
 =?us-ascii?Q?ntyZp8zjx0LT/I8RA6P0mlxVyM34dUKJdJr6gihT0BEjtj0Qu9HQY+779UZZ?=
 =?us-ascii?Q?4RI3t0ltMrK9aNHbQ7ySItGRoxgBNpQPMHqX4pjPF0nl52upA1BMf4amX8Vz?=
 =?us-ascii?Q?AhYGB0RbV2oNao7NvY+YSZu8F3GNuJuHp/h1EZ6uNyBHj0ZzedaZ1Pw6RiTu?=
 =?us-ascii?Q?HjmtwSKLYpx1BXUp6pvFYBAHtwK2BokWz2t2R3sbM53UePtMbjuOzuOkHI6F?=
 =?us-ascii?Q?ly6eOqlZoQw3BTdclm1kdQAtznvqIteJF3FwMmnjD7l2U1EdRcsCeIdvxh6p?=
 =?us-ascii?Q?ZYSAFb6drMvXCvUGcWXaBF3Jy1SayGDhAMCppRlX9yg+fJRLQ0BZ15VEJJW/?=
 =?us-ascii?Q?oO3gARUyEx4zqmzyI18OPtpXrTZEDYlvB7fTK2uEpAdCOzFQjiPEMxDnW66w?=
 =?us-ascii?Q?jC1qMAYrNSNuAWBpQs2w6hRfkRHrIFBv5S6gcExbEc9Rf18Oh+u+XISO4V15?=
 =?us-ascii?Q?t8Ah6+wVnG5tat5vURbXPK4JC9PxKUzmsLFiuHC4thk+sXOiMeHfbDFiiqPv?=
 =?us-ascii?Q?29WYzIV4yWHquX/lS+iMXB7rh2GpkadcClZ0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(30052699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 13:19:30.8131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22331140-6d84-46e3-995f-08dd8a452375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632

Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
late init path.

Drop the use of xen_initial_domain() and just check for the event
channel instead.  This matches the PV case where there is no check for
initial domain.

Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
chance that high bits are set for the 32bit event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 6d32ffb01136..7604f70ee108 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -966,9 +966,15 @@ static int __init xenbus_init(void)
 	if (xen_pv_domain())
 		xen_store_domain_type = XS_PV;
 	if (xen_hvm_domain())
+	{
 		xen_store_domain_type = XS_HVM;
-	if (xen_hvm_domain() && xen_initial_domain())
-		xen_store_domain_type = XS_LOCAL;
+		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
+		if (err)
+			goto out_error;
+		xen_store_evtchn = (int)v;
+		if (!v)
+			xen_store_domain_type = XS_LOCAL;
+	}
 	if (xen_pv_domain() && !xen_start_info->store_evtchn)
 		xen_store_domain_type = XS_LOCAL;
 	if (xen_pv_domain() && xen_start_info->store_evtchn)
@@ -987,10 +993,6 @@ static int __init xenbus_init(void)
 		xen_store_interface = gfn_to_virt(xen_store_gfn);
 		break;
 	case XS_HVM:
-		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
-		if (err)
-			goto out_error;
-		xen_store_evtchn = (int)v;
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
-- 
2.34.1



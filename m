Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5497C82F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800600.1210562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfF-0004Zd-Vo; Thu, 19 Sep 2024 10:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800600.1210562; Thu, 19 Sep 2024 10:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfF-0004XA-Ro; Thu, 19 Sep 2024 10:45:33 +0000
Received: by outflank-mailman (input) for mailman id 800600;
 Thu, 19 Sep 2024 10:45:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9goU=QR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1srEfE-0003mj-ER
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:45:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a461542-7674-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 12:45:31 +0200 (CEST)
Received: from SN6PR16CA0066.namprd16.prod.outlook.com (2603:10b6:805:ca::43)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 10:45:25 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::f2) by SN6PR16CA0066.outlook.office365.com
 (2603:10b6:805:ca::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.28 via Frontend
 Transport; Thu, 19 Sep 2024 10:45:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 10:45:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:24 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 05:45:22 -0500
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
X-Inumbo-ID: 4a461542-7674-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyKAfJat7D7YOTM5FsNmWSPdM5e8Q1zZkdhg/MA1QTfkH5Xa+GNJKQhhhDOx5cpK2juISO1cR4s5hWwoTt8KaIVFAdfdoVpNckiHoDsHhqOtDtPhVg9suJqYWMzPK0URBRWrSsuTqxiuoq6thELBwYGzXUiWOVjysiJ6zT9PJYFFEfkvO1gGwcQbsrfR/n59+Iq9wgMFJR4rxW3GGaZJCWHydfi3C2T7yDterLAnpbPP0ttUyImzFsLZqDFYgaX3Rqly15sgCnCUZDrhS9bB4qDZRJH+EeRaZDsArZdHsQA832Z+n5lmP9uxM4gR//NwgvCb+gOFTMZ+ydK6srgbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu105dDIpB4eZMz42pqaBoX0Nyrbf+DW33CIprSzLCw=;
 b=WT9bp+3u1P9EbQuSHeZMFMSx5c4s3lPpiKprBfTevdMtXCUcGtYMsDkFAasSC3s3cMmpOMJIsHMXJWA+ViSVkHGg/pSPviSmulZODnT6ioqxPp98ZMz6RpkQuxKv/WZ8io8HqZM1/C7pAMmkRF3gLaYN3xL+vzIpOLe1aB5BaphhD39OoEGzneAVfQdXwYLzZjMSihaGBhQimJyJSAqOFgI9BMjAw6ayiY78TxFid/Inb3MNqC17sdNSz/L5+1UzL49+Pm11QiJ0zcOCGvRnFaCn9DVBqrwKoaqfva5ATPGpM+BnjInlAMMnWmE6V/bkG6UFxp3IVo5cALLo/Q9qmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu105dDIpB4eZMz42pqaBoX0Nyrbf+DW33CIprSzLCw=;
 b=GLuN+ZWCgSPs0v7BgiJlEEPz2nnJKUTNtgfMxQqEdGBkrCd+KYHCZcq7JNBeY5xQDBoDzLFvCZhruKaeq0GwAOgvayZxDCBCgZoHAvPkt03jvZFnmn1VCkDZeUb8lKKT0UFgWn1EURKWTY98laCNTnEur+JVmpx/svsVilhgggE=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH 3/4] dt-overlay: Remove ASSERT_UNREACHABLE from add_nodes()
Date: Thu, 19 Sep 2024 12:42:37 +0200
Message-ID: <20240919104238.232704-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.37.6
In-Reply-To: <20240919104238.232704-1-michal.orzel@amd.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV2PR12MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e76b153-6704-40b0-9347-08dcd8982b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lrcdtqYtoIxi7aZ9tV4ompS9lkZqcuMZStTO+i5x0Lccxv8D1pkvL8Yt9DK6?=
 =?us-ascii?Q?YYdXViTO9FitywnRlu7/znlPTsrVr55EvL7fSNegxvINMKj68xJRakQW1XF3?=
 =?us-ascii?Q?1DOltuV1WxaqN2ZqUaLYCynnVs26xZ1n79ON/Tof4xIoY1AstJ2+o+GUXz1T?=
 =?us-ascii?Q?5D6U/KMw5b0FDs1vixkysNywJ/+En8IlQY1oKI+pq2qaiJPMvu7ter1LLCqG?=
 =?us-ascii?Q?LRdlQ5KOhS0jZHSl6wnA7uJB6QjygJvWNzYR619EnohbxY2FNHXmO61neZKv?=
 =?us-ascii?Q?IRWW9OfjCSf2EmQgceBi/FIBiOADyPkWSKMMXmerX5hUrTeUPQ43a/1v+gt0?=
 =?us-ascii?Q?ZpFoAorLf2tP1KleIYRFcekUuqKwzurc0snXppErQd5Kce/9tO9yga9y1OPs?=
 =?us-ascii?Q?ClJOY0UTAyVoc7W+3Lw9RPn/M9IV3HBR7t6FNfB18OQMWSQJC/urebsBkJM7?=
 =?us-ascii?Q?6nAPMzxNlhBw60R6MKviCnM0fPYaCohoVKFehHAGXYcO1mgBzjm9FhIVzDxL?=
 =?us-ascii?Q?wNIqHnaAzPjGVPl3K4fOKn3/WEzHx8QGOflTP60jdH1VHPh6N+IVTr9CWV3y?=
 =?us-ascii?Q?BI+V+D378WraiJ4g1pu9GzpbWaHTs7yP1QQN68hRPZK3IO1/arGjm9EvH9FT?=
 =?us-ascii?Q?MjzZ6Kz4ObVZuhk2DQLiFbBor9qAT7dkugxKId0gl447G51+BmIdShIacnEv?=
 =?us-ascii?Q?FFWEUaaPhh3YGuLVS53hNZqVBTnwGSun2uM895FX2398BzUgWyfgbUMJdIcK?=
 =?us-ascii?Q?9iSM7JWlKDrwdyZky7lVtUsZcw6LWEVKLUpcftBQQeP1zs5KUrVHHlef7xIM?=
 =?us-ascii?Q?ockYGH9iaJkqBEkgi6QJJ/sLrMGUCX9IptnNW6kVSstz0xDoxqR4kwf5LWJF?=
 =?us-ascii?Q?5AnC4OcRqIzBEqSiq4MNWKpP9QbeLempveW9i4WDMQy3Wfhg9JCj0Yq/FndM?=
 =?us-ascii?Q?Z5FAR6k74y09iR9LMKTRsmjZFmpnc03026uMN/63uAU2MVoF+jovXL4E8tk4?=
 =?us-ascii?Q?SS4hSi/FNCVbhp2lnI5rzN+rWCBuED6qFl8i6+AOYFBtQxhbEVnT11WweZax?=
 =?us-ascii?Q?S4NDUm6ToMSsuLbhLnei5ODia9RabaIfofnIwHCBaElKX2vrkjTOikXGsEzK?=
 =?us-ascii?Q?ckJ9ZwUhOeKA/70xPthwCXdMbknVj2ASvRRNyOhBT0+y2vw7bALnDBPJzfCl?=
 =?us-ascii?Q?mWqH1BGXaukMOsubno9tgX6E75N4aYhMPQwAUNLrOGG5iKKFN2Dwbb9ngubN?=
 =?us-ascii?Q?lcctvc5Jh8JP+EDtQ147VWh8oYz4wxfE1aP1B7rZ3NQjJRI6s6Bh0fZ3x+5a?=
 =?us-ascii?Q?ah51X0iXowG7UZgMN0Uf92LKP8pq/prvsbnUflfXfq4MxaBMHRRRKtPaIpNa?=
 =?us-ascii?Q?X5YEYGHCXi6LlGzlitbrxP19pn3rQzWFz/UUpKWOyw04p/XkOUPTIUodRUd+?=
 =?us-ascii?Q?wi0cxgPCTbScqHAYUPw5FfOwpZ7ut3Tr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:45:24.9956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e76b153-6704-40b0-9347-08dcd8982b2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871

The assumption stated in the comment that the code will never get there
is incorrect. It's enough for the target-path to be incorrect (i.e. user
error), which will lead to an incorrect overall node path and we will end
up in this "unreachable" place causing a failure in debug builds.

Fixes: 0c0facdab6f5 ("xen/arm: Implement device tree node addition functionalities")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/dt-overlay.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 8606b14d1e8e..d18bd12bd38d 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -596,11 +596,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
         overlay_node = dt_find_node_by_path_from(tr->dt_host_new,
                                                  nodes_full_path[j]);
         if ( overlay_node == NULL )
-        {
-            /* Sanity check. But code will never come here. */
-            ASSERT_UNREACHABLE();
             return -EFAULT;
-        }
 
         /*
          * Find previous and next node to overlay_node in dt_host_new. We will
-- 
2.37.6



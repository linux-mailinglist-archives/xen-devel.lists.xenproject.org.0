Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA094632E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 20:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771313.1181921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZwzb-0004Ca-4M; Fri, 02 Aug 2024 18:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771313.1181921; Fri, 02 Aug 2024 18:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZwzb-0004AL-18; Fri, 02 Aug 2024 18:27:07 +0000
Received: by outflank-mailman (input) for mailman id 771313;
 Fri, 02 Aug 2024 18:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqIr=PB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sZwzZ-0004AF-Pu
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 18:27:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd4d46d-50fc-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 20:27:02 +0200 (CEST)
Received: from CYZPR17CA0003.namprd17.prod.outlook.com (2603:10b6:930:8c::23)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Fri, 2 Aug
 2024 18:26:59 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::8d) by CYZPR17CA0003.outlook.office365.com
 (2603:10b6:930:8c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 18:26:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 18:26:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 13:26:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 13:26:56 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 2 Aug 2024 13:26:55 -0500
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
X-Inumbo-ID: cfd4d46d-50fc-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ibbaw0Oq8s+BkhW1WL0hf8/QUKqtVsaXq1Hs93II3TTyUtqfU46BrByuyuTDLw4rwk3PVqYycbWpWdh6Bdd1+g6FS2EXdkazvt+bZTqswvG4NapYg7G1Ms2hYha5dnPCRdeAfxS88Il/XHxzNM8OTPLIczVpwfwV2oMllwMIp6Ae9n2T+LIaESrZ4xDwmiHBpYcqUyXkVjX/Iuj96y7Fq1W45xH2eAoK2geHSEV/DTakmh1o7BQerbuAwW6lJtxe9PK4Mh7pO8UzUlYaczMb/hAUmXwZOaG8UOXe9kjGwS26toDAcDXGIUswtZ36t/Ft5l5uV1lnte7hkd5vtEmZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv5fGZrFl8nTwtSrKv0t7Iw/ZltTaBD+iHRePMAY000=;
 b=ARB+aZWlbuj+Z4zafSn9nYzYEdFeoGBzQe0CshWdipq2grZKWYlHDQYaxhMPkibOfXu9OVxe1d2vqu4Rv7inAluCbq7m+Jn3WswvDKaR4Phc1jXqxJ66csEWg6x7SxDWZrrsVmDool4R6fL8C+nrg9iBvUS/3Bv2nhfxMdcWrwJozt+lbrBW7wY2tQ0uJjoQ+5Eo4eA2p1ZpCADMMeLdIXCaO6hCXlVB8V8kVDE6WqR8ajRJZUdvXN7BBKTsC5FVenGoyLOebEYU3HxDbmpsidKare8wqyq9gxLKMXZxhYjcEXFgW9EYXHDDrZC28sCtefHgY0HT4xplM3mjFvdsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv5fGZrFl8nTwtSrKv0t7Iw/ZltTaBD+iHRePMAY000=;
 b=SpJowFidjkecCZY/751liry+7qfD6H6cElY7yQCi26ofGUPSkeIVVL6VGGJQprsGPp5JHEBXa/IaMRMLTPxjPxeezwrTw15YQI0xV7mbYZiJ9dAtPuSZ9gWODs5urkWjVXquu0GbPXGBD36iZGdVPIwaTMHZWpCLoEJ5SOVk1go=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vITS: add #msi-cells property
Date: Fri, 2 Aug 2024 14:26:52 -0400
Message-ID: <20240802182654.8976-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: f92e9815-259b-4b87-caca-08dcb320b19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VcUCV32pqVobMYf50jGRLKC0JQ6UKMIvwcIIB0UQWhyv3QKzi/MoFMQZyIVF?=
 =?us-ascii?Q?OTnX8gv2Aus2s14jXnq7z3VtKB0BQd3oPs6dn0BGLlPk7qJcodZBZAhTj+oZ?=
 =?us-ascii?Q?TUib5N+ndyQi2n0VzjlAFKnldAwGLdolIXV7+pHrpc6rVIXbOkUy9Jy3PZVY?=
 =?us-ascii?Q?UT6L5L5Pp7UugIb5Dp41N1yFNULlIhDnJnOvl5DaXK1iDIXVY5KHtQf1vmcL?=
 =?us-ascii?Q?tYLpAsVIXbCCYxztD96y7B32VWcVQmkv7LYC84wvNZabFKi2RwO+wCb+3XM/?=
 =?us-ascii?Q?BLcOv6+hxDSPpQ6hajfQ3NVYQeVLONlWAsH43MOzmwmTIWEPDqm3x1W3ifQP?=
 =?us-ascii?Q?nDfXWBj6UtL3Yc1P5WnDamJEST/+WZNhzuW7QFfG0/lCs8phGmxAjZ9rZc9y?=
 =?us-ascii?Q?eJzf55ck4ZWkRJcmcSBBmLIDfrXSR65KUIXNRfGSTf/gWEKaQgZ4wt3DuHyy?=
 =?us-ascii?Q?hTKgW+wni807vbZT1OzylBe9QvhWlRxZ7XChKC/QDCGpGNN2qorJWXeCXgHE?=
 =?us-ascii?Q?EfJzxv3cX4pqd+0nNfynpHhzna1GT3tciqxh2enP5AhRQpw0ylE4NNO6dewN?=
 =?us-ascii?Q?oLWjcd8j+cC8AW0yut+lEY7dRwu73AOfaapNQI0hs497goJY6G+jhhY1kHl8?=
 =?us-ascii?Q?rQicT/WgDHQMTz7xYF45+cFP80DoXY2RV3NfZFqqhSvSYagkFkBWFyU+/pgH?=
 =?us-ascii?Q?zoUze5/XFVhq12IOv26pSClXspNj1AMseR4Fko04Y9WBIEvYinp/uhDN+PPp?=
 =?us-ascii?Q?Th42visdSmzy6VsGYcX6wJCHD41WYp5liaH3i9/PuqYAaFM+YthmCw1KFCzU?=
 =?us-ascii?Q?8JMa1oo07gfv2aNEru794HzsdqIcVZaFntQiOs29XK69TNNhKzzXTxO7TNY0?=
 =?us-ascii?Q?bwdb5QrKh2Q/T58AmXHlUS7zMnibpG7vH+r9KeLzLCOH0UyIePrLg5ZyrhY1?=
 =?us-ascii?Q?qaLdRNP2lRc7CSgCDJTvSMMg8x5lwMdAg6PNMVmiQzE6FscVGkzjWraycbsY?=
 =?us-ascii?Q?NkiupjKbAW+8cc46OL7sH94O74L6A2WP3nS+09s6mxuXqfzRauZvF9AfXeNT?=
 =?us-ascii?Q?QkoX39NBcA+no3J/O9Z/s8ApYwyHp7OUPb/eyP16psmsjViQ7nE/xdzpTsUH?=
 =?us-ascii?Q?0LZGahy8a6+h6zN6DoxQ+yEKuDxdow6RtyNYvRaEFNg4k65Festkfcbkvb9v?=
 =?us-ascii?Q?xqBaACq0I1+0iU1kAy4iSokvcZV/LylSsmSZZWpbfxj28k725IV8CPDBldaQ?=
 =?us-ascii?Q?1hKRiwJ4TBcJ43l6pznF40eqys8n/i1DgUOHZGiJk9T9WCsnmfqWjc/jbbQ3?=
 =?us-ascii?Q?YXLtYe0o5S5Su/Kr13k/kTRcCtu5PV7nmF0CeaOSvJ8W7KrSBl56NEWgHQSN?=
 =?us-ascii?Q?G4cyp1O2JBN8PILDBX4IKLdhyhvw+7ICWP5GG5BNwJrtNLu7IVsnVNE53ESD?=
 =?us-ascii?Q?bYq4xVi41ewAjfyvtFSUnELZ8bqVRq1G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 18:26:57.8751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f92e9815-259b-4b87-caca-08dcb320b19d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114

Non-PCI platform devices may use the ITS. Dom0 Linux drivers for such
devices are failing to register IRQs due to a missing #msi-cells
property. Add the missing #msi-cells property.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
See Linux dc4dae00d82f ("Docs: dt: add #msi-cells to GICv3 ITS binding")
---
 xen/arch/arm/gic-v3-its.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 8afcd9783bc8..55bed3fe87d0 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -951,6 +951,10 @@ int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
         if ( res )
             return res;
 
+        res = fdt_property_cell(fdt, "#msi-cells", 1);
+        if ( res )
+            return res;
+
         if ( its->phandle )
         {
             res = fdt_property_cell(fdt, "phandle", its->phandle);

base-commit: 984cb316cb27b53704c607e640a7dd2763b898ab
-- 
2.45.2



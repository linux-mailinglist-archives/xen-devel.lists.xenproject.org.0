Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A109AAF84E
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979268.1365945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCylo-00063m-PG; Thu, 08 May 2025 10:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979268.1365945; Thu, 08 May 2025 10:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCylo-00062H-M0; Thu, 08 May 2025 10:46:28 +0000
Received: by outflank-mailman (input) for mailman id 979268;
 Thu, 08 May 2025 10:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCyln-00061s-5y
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:46:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2417::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afeb5920-2bf9-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 12:46:26 +0200 (CEST)
Received: from BN9PR03CA0299.namprd03.prod.outlook.com (2603:10b6:408:f5::34)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 10:46:20 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::c6) by BN9PR03CA0299.outlook.office365.com
 (2603:10b6:408:f5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Thu,
 8 May 2025 10:46:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 10:46:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:46:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:46:18 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 05:46:17 -0500
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
X-Inumbo-ID: afeb5920-2bf9-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r86qIHyF+WcwebDZD7IK01fIMh4zZQ12C67Z5w9CFwo5BOa2kcIdsGAOOPSdh/cXHq9jQccS3dartLeycQbD3eG0rX/ECU+eYvnVAffXDoWlHQqI1v+RwhFaj6jQ71nG7I/ApKT9hqUnf6fWNKmhdLCakh1JJ1R+n2Ru0xjFK0vwyytRgk4J/FB2e+eTDUZ6jArLXrk6wSz9QwXI45d0y5QVp4jFqPuSknknmAapt9l/ld5sMWD7D9C2IvdL2Of/muGbbuV+TMaoPTLXuoxUaeDBsngUK9ec297yA+zeKveOmWRDVog3yeQ1rYBepBpglGjShBPw92u/29rSQVRIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYTYGm7TjGTCoufqxQwgoqyUeE4OFG8EYrCyN+3Hwuk=;
 b=BUFaZEXR1gSG1MUw/8YnfoBJFGN9usaanAjoIsXIyQ+xeIQ3fJNQoS/+EmWFwiQvpX4fdpWSSCrwKGVxrwU0a3rVBRUKCtCiHbYYZ2eCbrxg1w+PILwi4DgtkT46ev5TQTp/6Clgpkvy4n5npNDOpvFI+08TGRnBSiAi2r2cs5rD4/fTrFCr322BuIyFZKBCPPV48U7XC3J/A2e6RdRVOIYnJ8m7N41dzsrPooGP4Gk6eIcHg2EBVUAOp0k2PLK7WXgFanf0SGj8sFIDU0q9rCJMj61Khb5MLpEhIwmZ6d+0pEfQAw1elFd2bjSiF4gM1LmX7iYfyyXlcqP0S6hmeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYTYGm7TjGTCoufqxQwgoqyUeE4OFG8EYrCyN+3Hwuk=;
 b=WxunnU6jjUscLyQ4LAZpx5NGrTGNirAVMH2lhmAmsvOSFbhtIFw+w+EqFc2FOCcVxu5fA9kMKKKrUoFbUwTsPTvQPk0dwKesQAjWZXgdo4xVPbFnbguwIv4lcZ1QSmByVf075uku8kRq3Bc7DlfMRiyPV/ppSEuI4BJWc5iYHBg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v21 1/2] arm/vpci: mask off upper bits in vPCI read mmio handler
Date: Thu, 8 May 2025 06:46:06 -0400
Message-ID: <20250508104608.531079-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508104608.531079-1-stewart.hildebrand@amd.com>
References: <20250508104608.531079-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f24d0ea-9f16-49f0-b48f-08dd8e1d9120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zNQKmvEsdArCG2wNvUTAdiCOEZtxYMFnOGH5sDjI5ksTQ0IfgiqJn0oDg/m?=
 =?us-ascii?Q?1777oJQgC2fqDjjW8lQxAVOCciRK5AmYqHgUZAqIUgGWSXb8NSu+7VZLYIY9?=
 =?us-ascii?Q?dDmzHvXhqss02bQ3hAub0iQ9YHhfcWNabag5UwX1IV2V4731qlkRPHl44llv?=
 =?us-ascii?Q?FYvGBq0bVTrsRenEbGxNXroBfdtzoLTYpHGgytqFo35Y4ZxAb6tyQFrd+aN1?=
 =?us-ascii?Q?dyIiw4f38+WZKgNAVYr6sXyEyVJQs15fxiza4brzSQsMw+MJY5wQB697j/Qk?=
 =?us-ascii?Q?FEiVtj5cOE0QOas7Ehy+qhJiZ8QTbVi9WdWnhV7Eh7aPXTs5i+IafRYO8upp?=
 =?us-ascii?Q?cEkIi24takGbg21O+jqsTfwdA3EZDJaQxZIz4vNQfTzFH5Lcp6AGfjD+S6oU?=
 =?us-ascii?Q?CGeID49+9IPJHlMhvlnSvYmR7IZWCJpwigATx/rc1COAWqTdHH1/9cisMvYR?=
 =?us-ascii?Q?MTr0K3YyIuUf1XaGsb99JaqGTwI64vzYpl/0floQZRpvglAPsDALAbAd74B/?=
 =?us-ascii?Q?2qZWB/GS6vvMay19GBunv33R+lVX/Gis0EKG7s78uiuFJFYBrU6UYHFbTnBl?=
 =?us-ascii?Q?jRfRqgm+PJddbws3prw/UB8BkWrc+bjc8xf1ScyZjfGyUnUzrvy+lnyaHNdm?=
 =?us-ascii?Q?NQdk8jnSKV08UPh62o3e+5fY+4C1YBUbUUc9sYrRpbD0PVAyf0hhR3CO87X7?=
 =?us-ascii?Q?CWzgr39Ng5/hQH9WGGDkIWkox5NEBGI66YzazvKIp9RB3rPKzQ9wE3HpGIuU?=
 =?us-ascii?Q?wR5zDP9IAx8odmVm21tHDXLXky56TeZtgk72ceWRhmJGhlPIJ0Cq85KfKeAN?=
 =?us-ascii?Q?sLOjcSiw6PZ+sYDDzfXCtcd2LYbazVnVaj2+WNVW0zZQIyS0BH8ifq1twf/a?=
 =?us-ascii?Q?vU2yUr1EN2TPniuRJkMaYgMow/Xr0Yz5fCZcf3tT5eEh8/oeky4hf6AjB4IV?=
 =?us-ascii?Q?DUNeOJ2qZ/1A44dtnBZ8kLBxTxv/7HwzH8FyXwD0FKOSzFcZV/NWeINDUWyA?=
 =?us-ascii?Q?J+62WRcH5Jr0ZAh3CedKJ1wYEYrqmhEauNJfPX4A3Na6mz00TPBgOn9e9kb5?=
 =?us-ascii?Q?mddQGgLPUfoWWzD9umWi2IRtm2/D8iuhD1ZJKpQ5BmXfwE6biZy3Vuk1fSnL?=
 =?us-ascii?Q?3PpN4EXEvz4MTmRSbEMuxbnJAS2UGbpGuSGE/s+VT1y4CAe+T8Zq7IaWbDWO?=
 =?us-ascii?Q?3fuLVlinzHr+0qM6Ow9xVZvR+uz+S0M+1FHdX9o21lQgoIuivpvC73IaaDan?=
 =?us-ascii?Q?irSOYJOx+Tj8b7XeGx4XxyPXfhyiSL3yrgDiErLyf6C8/OU9APX9yAOTIWts?=
 =?us-ascii?Q?GBX2hobw7n4X+h9MFoy1dqMVPNFRCQqCc+PilzAzn3+w7ezIXe+/XAc5w7NO?=
 =?us-ascii?Q?Ag+NeHhcbHipnO6VUXQqKBoCFBoeHVts6nMnFuNJRY+iWJNV4en6BzJK5z6V?=
 =?us-ascii?Q?5csok+u3KcC5bTQspxjPOfAN6+Sl8pIkL0BZx+rKXr+hXJYIwon5bNu0sVDs?=
 =?us-ascii?Q?8BfeHCCZn6FuEQJw1QMRcgoZ8WWKAzMRhHrK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:46:19.6062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f24d0ea-9f16-49f0-b48f-08dd8e1d9120
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883

On Arm, we expect read handlers to have the bits above the access size
zeroed. vPCI read handlers may return all 1s. Mask off the bits above
the access size.

Fixes: 9a5e22b64266 ("xen/arm: check read handler behavior")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/vpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4a8..3a3ff5d0812c 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -37,7 +37,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
-        *r = data;
+        *r = data & invalid;
         return 1;
     }
 
-- 
2.49.0



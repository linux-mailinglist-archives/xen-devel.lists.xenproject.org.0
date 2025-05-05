Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87BAA8B2F
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 04:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975745.1363089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm1C-000190-2M; Mon, 05 May 2025 02:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975745.1363089; Mon, 05 May 2025 02:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm1B-00016z-V1; Mon, 05 May 2025 02:57:21 +0000
Received: by outflank-mailman (input) for mailman id 975745;
 Mon, 05 May 2025 02:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm1A-0000Iv-Ij
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2416::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8203204-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:57:19 +0200 (CEST)
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by PH8PR12MB7421.namprd12.prod.outlook.com (2603:10b6:510:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 5 May
 2025 02:57:13 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::81) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Mon,
 5 May 2025 02:57:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:57:10 -0500
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
X-Inumbo-ID: a8203204-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYgIS3azss+0gEM1xVH5N0Ehf+8Adu+jAXrtRgJqHxbCVBuKM3xt6bp7wuj2OE0UAx/x5QeoyahysXzGhdX3zsFhcQenfFZgls7QdtdlyVK3VUxfhL4GEfOsxY29x92zMonq8BSM5hL7akQXRX5ONH12sSCR+n7LekGH3tCWLK2tLYA/5RXWeeBKazm0TDZg11ObTp6b4ZemOVMcSfbYeMgGX+thHrdfM4x8tE5q6609prRFQEI+2DwOnb33vjszp1F8SJkqPfcQKntemmYjtla6kFliSODj/DVXASnOKmYDNuKujTUtXCoo/aFD6CupMBIO8JYy+xCh+65J/3ZzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdkdABA0C/3U8XeT6P3gQCCq4cQg5hAvm483R/ZDryY=;
 b=DerwQIfTnh3ziyZRa/QCrHSDozZZea+yLOLytP0dnpzpezhLzs0jhlTgF0ZDdReqzX/MzQSvP0fdhHI/kzQnSq3vgZ0b/EUuuCdq0B33cvxuhWJCvPTN51QZh+Gjm4Unpe5K4RPVHhBytJmbdz9MRHMzfgBP61QpgM4BMVp/zVwrH8CwFgynzMugCC8ysDcRK26wpTcidy5rH+k7OqthAfOc9bgktQTROIaVO+d6yYuQq/Rm6NZ1s/9HdfgQ0phn3jQ4/8tZaFbWpDwJaxFszAaBFElLg1OxmfN/8j0DdES2knjyvaERbaR2O78crXpapYzf6dT9EPXhvEad/rn1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdkdABA0C/3U8XeT6P3gQCCq4cQg5hAvm483R/ZDryY=;
 b=ImQJ9URZbB6QtYK1zi0WATbIdhv5v0SOZ5aG5Ecp1kycqFcFiWmoELhJM1Yd/32VE1pFTzoc0HDYNm6YVXXmMLN2EK0Z1vd0ZXtDAqJfOt4c1ghm+dyXTpGkr6Nj9vAZEtvJFPJtwEB71rxV0torpEJhdPj04YScp0ch1xLcEx0=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/6] xen/arm: fix math in add_hwdom_free_regions
Date: Sun, 4 May 2025 22:56:25 -0400
Message-ID: <20250505025631.207529-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|PH8PR12MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2e0294-2c9d-45fe-d834-08dd8b80891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SoGRKwPowUzS5syzi9Q3AL1KPWY3DInalukKzCZJTnl1OalXzqaTx8w+9tyc?=
 =?us-ascii?Q?JMHeg5ZRX2exByga9rbbGIreMWIL6Mr2SHO+IBZELM7+xOJZyquwBurS0XtE?=
 =?us-ascii?Q?2zmpKZrHOWlPAi/tXU/PSvy5vcj5kz+/D4xUT5Mb0uHlBjWoL5qn0dzbuHBQ?=
 =?us-ascii?Q?F6KOWJ25gDvHhNDQbTkTykZs/Vt89Zc8MAHWDPuh1JNHbE7tczxiA0+oNcRd?=
 =?us-ascii?Q?q0RZvANI5GxrrIetn1bg8tNnzh1+faRGVYKmEUTlcp8K3Dc+sh8Nt4pKtqrL?=
 =?us-ascii?Q?dCGI9qdUEL6P1Ch0Q6cruzIK4HppAIoGzYrdzMbkuNZKjClCEBqQqr+EW1DJ?=
 =?us-ascii?Q?5xK7VPXlDxfE6nlIgLW2uk2rnkZrY6H/X/OZL+K+uMBfZZXtb7WCOimGj/J1?=
 =?us-ascii?Q?che23/g4MYuC0s0Q/G+fIaKoCM9kZPw+vjIgPspI+FLHAX6GB83qAH4elQxo?=
 =?us-ascii?Q?ev5kXsOJ5BWHYYH848moU5777Y57u8KokixrImNJxcD6UDhseUoyKWedwRtw?=
 =?us-ascii?Q?Dc4nWj1ECLH6SBhNLNGFZcRZNdbsSJuf+sB3T3WiwZVLqoStrs0ndfjDxmzd?=
 =?us-ascii?Q?O5cXiQZ85mwkuLWvt447PuF/zMxVMX91c+XduUpUf42jvZMy5mVekroPDnpG?=
 =?us-ascii?Q?rEmq6DY3moCC2HnKXkV1IjFu+JTvSfyYJw2mUypQmJB+4pClaRMSAyOS3JMt?=
 =?us-ascii?Q?khYBWd8cuqvz2GBsgklTMKvS2viKQQTYGS6krRHlRVKuAXV3Ttrb376G9EUT?=
 =?us-ascii?Q?H9gwpMRkBW3fGjD0IrfqyrHkzqLemCgKRmw5YJUdaSQ7+OGOxkq57128R0qg?=
 =?us-ascii?Q?W554JEIqHrVeERWqdPkcrgxJaPiqTz+/vb3VGKXWYFSRdGZdavniI8mwdIz1?=
 =?us-ascii?Q?XTFEcx1mhj/h+UGDMADxuvoNbV4z3XvrMrhebkgSukCXHUo3K871JJRxF3da?=
 =?us-ascii?Q?iltLBOhZX/Tpq0eHfRUK3SaNqPrNXrXOaBH84Kq6Mff9R7ZvVLZxwO+5pLW4?=
 =?us-ascii?Q?yQAzLxZipFnCwEW4Q/NgWRJJ6t7Blpug7m4K4mCpyGYC+rQ4zhEZ9jJrI8mk?=
 =?us-ascii?Q?hwJzAf2dHOV1z08mcTm2VNn0/W+qx1cqtgltnPw93Gw7wJsJxj299B3P1dw7?=
 =?us-ascii?Q?+ESiFACULrWJWpDHbx7oEculCO+0h8XCL7WWEySSxve2Xn61TR66EbzLrYvw?=
 =?us-ascii?Q?6/4VYcdB8xO/USzeGLfJhMZsTVJFMeM+OQFW6lX66uujgyn4KJsKLGb+7+F8?=
 =?us-ascii?Q?VEB+0kt1MYLJlOUOuT3BTUpziAdnS4Fdniuzmh11Tph7ckdokgSm0tQpSoOk?=
 =?us-ascii?Q?AcTxzyt2hly3IC6BvJso2NRI/X6r5/5zgSHqwZwwDJQyvnuB3TjgJHxXFA23?=
 =?us-ascii?Q?UEDxT6D5hyx6bdxkgNFuaimQAc/eaRXaoT+/jBCsSXkY8850kSTy1gSkaVyP?=
 =?us-ascii?Q?9iqUxVbGrSx9A/D186uXb66Wdh0SYvDnkKx+36JiRLAO7m0MTPxkbUqu3CzE?=
 =?us-ascii?Q?9r7armVPXR69IwXwwXzIHC25ny40962cksIC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:12.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2e0294-2c9d-45fe-d834-08dd8b80891c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7421

Erroneous logic was duplicated from add_ext_regions() into
add_hwdom_free_regions(). Frame numbers are converted to addresses, but
the end address (e) is rounded down to page size alignment. The logic to
calculate the size assumes e points to the last address, not page,
effectively leading to the region size being erroneously calculated to
be 2M smaller than the actual size of the region.

Fix by adding 1 to the frame number before converting back to address.

Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2f655bcc2237..a0f3c074337d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -905,7 +905,7 @@ static int __init add_hwdom_free_regions(unsigned long s_gfn,
     struct membanks *free_regions = data;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
     unsigned int i, j;
 
     if ( free_regions->nr_banks >= free_regions->max_banks )
-- 
2.49.0



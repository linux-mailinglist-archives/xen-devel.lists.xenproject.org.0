Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7450CA03B11
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866189.1277476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5s6-0006IL-U3; Tue, 07 Jan 2025 09:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866189.1277476; Tue, 07 Jan 2025 09:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5s6-0006Gi-R9; Tue, 07 Jan 2025 09:27:34 +0000
Received: by outflank-mailman (input) for mailman id 866189;
 Tue, 07 Jan 2025 09:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVI7=T7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tV5s5-0006GX-N6
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:27:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d805e6d-ccd9-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:27:31 +0100 (CET)
Received: from SA1P222CA0147.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::11)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 09:27:25 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::be) by SA1P222CA0147.outlook.office365.com
 (2603:10b6:806:3c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 09:27:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 09:27:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:23 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 7 Jan 2025 03:27:22 -0600
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
X-Inumbo-ID: 9d805e6d-ccd9-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irVQEiLo3ipvs5wTS5IKSTDEHFKwwjUBigV6CyCj6mbH3DV+pPV2Cv3l+S/wF0toqJszOSj3MNocRNlqKff9217KSRgFCtKMv1q8Fml9/yxGVLlBf54h8KewPlqgt0D2Yq1HmMyOLRthjgbseCBUrNU1pGz6d08acuvjNTdYp2JbytGqybK0AY9f51OPFoQFBJpx2h9dmrKFnqIa04K8J6ktlC3JcsnmowXcb/sgeqmJXbDmyCtdsfRWKoXf5toSTCU/ZmTnSGWlA6g10vDc0juAXGkseHGkXgyj1trGfvZbWQKPa3Ai9NKuNit1KIzQtdvID/nfxRSBnfynNDWFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Diko53aLl2QpyDZolfGn/KpZfdptQBjhr/vtvQsxei8=;
 b=gBw1rHN8uAC6sVTSjLlc4G7csR81iJQzH2q+cd5B4gnhoot5oZP6DKPB95PPYEcmyV395ZFVfyXyDFSWt9mkdOTviEEq+Ud6S3wsP0NLF9HJQBBF1BJpczhb9RCj0pVICRWxZ1XMbzsJSDT9LEe65zQRNNz9aCm2hKuxmSQag68F5derEGpTFTApD9Rkr8O6ch+ONtImCazbr6hSnHww99IW/BP4TmSDN+6n0asBRtj6+Dnr5ElGhf8sFRqagGLDLAe+XORhhOOrwjA7ju8pIb0DMvfKHsfCAxvxL9eJ2q+0mVUKN59jpVxRcOnBlGtfvF5ySLhMDKZVEsdlTL5JzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Diko53aLl2QpyDZolfGn/KpZfdptQBjhr/vtvQsxei8=;
 b=t0MkwD8T3dfT/z23aGBVuiRn4v8BBIXAIOlCDEadRHG3IKC+KBXIRG3KvpethyD6pVyigTRnhDhX72srbYmOMV0binkJcE2YQMb3cwJa/tIKJAUwmFOxO/40wKnp4NQPiQ/tG2S3FMlc8d/0liTPR6nNBwiMokV4iuYfTwcSU6k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 1/3] xen/flask: Wire up XEN_DOMCTL_vuart_op
Date: Tue, 7 Jan 2025 10:27:17 +0100
Message-ID: <20250107092719.26401-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107092719.26401-1-michal.orzel@amd.com>
References: <20250107092719.26401-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4da6af-5ce5-4792-3d9a-08dd2efd7f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r9qaiclMevq6CIDruqau5iimUZab8oRSfwi1BkgMWkFDJOY55Pu00r2n98Io?=
 =?us-ascii?Q?1wc+tz+GXfaYqO/Fot8yJFFNkS4C4O52QfrN4M1QnH1g+F5dUYLXWBhjL5Wp?=
 =?us-ascii?Q?zTzkmlqWOQmRfQIXunQ2hS7ND8TkNnw6erKyMBksWGMS3tmuGjK34y/QZ1RN?=
 =?us-ascii?Q?TpyjHQ3XdBJTqnHumxY+tbxkwmGpPAwvi0mr6txjzP0B3+4rLhLUjemYGgWt?=
 =?us-ascii?Q?hi/vdKxRiN0uyd7qUFHorqUJ/QhA5aeG4QoWD93azx612NZl6RlUJINQLDr6?=
 =?us-ascii?Q?rqGE22bwtGkX1DzJxWgtfEM4meUKoV/8lG33YLESPNejULoyKPAFLkWdC/o8?=
 =?us-ascii?Q?p77WK6H/yGPyIF3vL6+92uOzU3Ebl1p8JsYCAebTZldFavIHWxOYzyKsoxyV?=
 =?us-ascii?Q?KqUEGUhdQszne4m+bDSuJueuXXcO9uPYwMQvnFJgPZkMsRHWy9MbUiQP0H1l?=
 =?us-ascii?Q?r5dh2RH//zvNgUrahMb8qYZQwNwYeQtoBrghj0ciYOVRV4aHH7Oenajmb526?=
 =?us-ascii?Q?rZqj8UPEpu6/QfLnIFa/Xxh3fNa1TVneZlpNs5rGTJXZ87PANbcZnHlbBawK?=
 =?us-ascii?Q?liSeWTdmE6mUPwVKXHI60VqnZ8jRUG/XMg1JcYQMkzUPTLjDT53bQiTXagln?=
 =?us-ascii?Q?lcpZvUiB0GXkMcdfl/kyZPOjshsxsZCtY2FFoPaN5xCmgRRhE4yBpy2LzI9F?=
 =?us-ascii?Q?FFBukzA8hvgE7FOWIHesG77uaOKu+sNSFbECwCs6uHky5YLLhGplHjMBhaxt?=
 =?us-ascii?Q?F+x/ntdId61Qh6YvIcLWWb1LCwVLV1bQegeX5bzGJDQFtzOyeL8tEAQp0EJD?=
 =?us-ascii?Q?alZJH9thz+B2Xyr8PNIVxC2kXpjiFBCXeljkBByyf60tlDs2G+nYYM7xdDlQ?=
 =?us-ascii?Q?D9VxZJyraDn7slMxDAIfYpiq6xHZnr71kIZwCLWcFfPwYQOrnGIx3lNccQDv?=
 =?us-ascii?Q?7Hj3nPJUWj3ytiBUNUfnaOVZBii7Wafs1etcx61ofoTvo9uz+7lhhDN6CEgg?=
 =?us-ascii?Q?hQHqLTYrwG8e9tCO8InAfIqeG/6X/cZr0DIGWs8mif88kNDHKWmJFIJB9PjC?=
 =?us-ascii?Q?uCKckXolKjY/ROreG7oG8c8WGFxySConMDVqlRtoHDxtNw+rs0VQURML/KOz?=
 =?us-ascii?Q?PISR2CPTRWLx1wPlxCl+ACVcxIqFQlWpYoVGyQ4p05FxzGQuYBc8I5TjJxR4?=
 =?us-ascii?Q?J3fY8qi7PxJspyOBUEZ7yOh8ps6vshapOIEni8fXLOMpynOE1P7lqRs7ddB9?=
 =?us-ascii?Q?+1AnqKQRylP7qxMCbzqWjVF0DNxqAPnjh/mYOSVwmAjSaQbaeP5ZrfCpGmEY?=
 =?us-ascii?Q?n9iIvz+D3oe6x1DQJhgeUzJPlj2t3To+6zj2zBcTABU8T+aLyjJ+KoWZrmVr?=
 =?us-ascii?Q?WkSp8EMOhoTCiy5vuhBxVILOQNIKXoMGAaaNB3c6VJr1lnCqkQ4vgyha1dz2?=
 =?us-ascii?Q?9UTH83sVKKYOH/l3AFcPLacHk6hCnPWaxXlMrBdv1w4f5GSeqUEeOx2A/Zq5?=
 =?us-ascii?Q?+dA8aSTjfFyX010=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 09:27:24.8809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4da6af-5ce5-4792-3d9a-08dd2efd7f0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365

Addition of FLASK permission for this hypercall was overlooked in the
original patch. Fix it. The only VUART operation is initialization that
can occur only during domain creation.

Fixes: 86039f2e8c20 ("xen/arm: vpl011: Add a new domctl API to initialize vpl011")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/flask/policy/modules/xen.if   | 2 +-
 xen/xsm/flask/hooks.c               | 3 +++
 xen/xsm/flask/policy/access_vectors | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 11c1562aa5da..ba9e91d30201 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -54,7 +54,7 @@ define(`create_domain_common', `
 	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
 			set_vnumainfo get_vnumainfo cacheflush
 			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy };
+			resource_map get_cpu_policy vuart_op };
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 2b4efde6896d..5118f86cf030 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -832,6 +832,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_soft_reset:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SOFT_RESET);
 
+    case XEN_DOMCTL_vuart_op:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VUART_OP);
+
     case XEN_DOMCTL_get_cpu_policy:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
 
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index a35e3d4c51e1..7cbdb7ea6408 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -251,6 +251,8 @@ class domain2
     resource_map
 # XEN_DOMCTL_get_cpu_policy
     get_cpu_policy
+# XEN_DOMCTL_vuart_op
+    vuart_op
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.25.1



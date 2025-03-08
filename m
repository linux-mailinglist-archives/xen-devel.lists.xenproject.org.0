Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AEA576AE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905463.1313283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhre-0001yl-9n; Sat, 08 Mar 2025 00:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905463.1313283; Sat, 08 Mar 2025 00:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhre-0001uD-2c; Sat, 08 Mar 2025 00:16:26 +0000
Received: by outflank-mailman (input) for mailman id 905463;
 Sat, 08 Mar 2025 00:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIyW=V3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqhrc-0001rU-I0
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:16:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9041b69d-fbb2-11ef-9898-31a8f345e629;
 Sat, 08 Mar 2025 01:16:22 +0100 (CET)
Received: from PH7PR10CA0021.namprd10.prod.outlook.com (2603:10b6:510:23d::20)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Sat, 8 Mar
 2025 00:16:18 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::59) by PH7PR10CA0021.outlook.office365.com
 (2603:10b6:510:23d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Sat,
 8 Mar 2025 00:16:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8558.0 via Frontend Transport; Sat, 8 Mar 2025 00:16:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:16:15 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 7 Mar 2025 18:16:15 -0600
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
X-Inumbo-ID: 9041b69d-fbb2-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQt612TIsesfj61qVT3feg4EtqBv3xS6ptkUtg2MyImjbFuMXM8Jt0Bzgewp8Uf4hzjjUMuGXtI2f8E8J5/NCD5f0exssQWDtV+d4yJ5EJaUGw4ztrupoEO2z/4By2Sm5rK2JKvs9yPSXuabpJ4v+wn8uHfkapwIK6+MYUma6ib/B7vv7JSs/1BOUJ8a+m2P/WnDDkvmCD9nWYCTElokmkWuoHQTwbQSdI5KVGsEJXGlAWf+NCITU8hUikyUsVjbsZXDSvHrnv+BvVH3swk8N0NxzNdDXXSNfeumeDZkQO5AJJCuRYYcLBkJKGoq4MEvBHsLJVje/+13nOyZrpau7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYdp2KXh51I7oF/KfEovWNzNxs0Oiy1xi9uDyok5KHo=;
 b=AJDDG0W8kwt12d+BUQGOxnw3cerA0AyW/+BNyJ4qIbhTINeCBNC8RJstn5JXFdrT2RBxWAqUr6KjJrnd6aIVVm2GBT8WIMSl+GtMtj0DgcHme3ZQ8VVBblf0SHpKFyH0szxpgOLs7uhFTqvp7ae/cz+pJZsagnypj3CTXRNJi2/9KEhlhZbxl9wPUY/Ua4IiAIi6t2QfZDECwVMNkVP+74tmxXgfpe7WB2mBtq1AMp4Vz/PmRDTiM4yQG6j7Hx5KlQj957akfM0GLkDn1bp3y/MBKwIKM+0Q/5/f5XDxTStQMNVmN107kXoRBijGr+L5n3U4FryjAXNk5Qt8ZXOM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYdp2KXh51I7oF/KfEovWNzNxs0Oiy1xi9uDyok5KHo=;
 b=YXPIK1U2vVLq88kcvz8nPZC+Ige/6SIQ3ZE86AMgSOX5mK1OjOr0F8L7STOXVqKDB3we7iZUPtZjMxRG4oL0T4IYV32TILckVs0IwsLlJ7EQoZjlmHgEnCBXZPgrSqInqHmSiGZqTKyH8CoCtQzACGC6F6mBoxhVmybZ7z8gSCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 2/2] tools/libxl: Skip missing PCI GSIs
Date: Fri, 7 Mar 2025 19:17:11 -0500
Message-ID: <20250308001711.18746-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250308001711.18746-1-jason.andryuk@amd.com>
References: <20250308001711.18746-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: da3c284c-9343-4e23-8fc8-08dd5dd6725d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GjOiJTr3JjPpxuNlovop37ktWU2vWuxpoppWMUA+OlaBMb19IN6F2fQQiq4V?=
 =?us-ascii?Q?XPFl3GLKApMJYQR21HliqZSnR78ecsaIV2+km8TV049saDuE44h1m0MCTV2H?=
 =?us-ascii?Q?yz6IUn5TjtN5zHeu2yTPwVhPku4Z94nAP3iCBL2kusBT7I27CzZ4DDzlPMLe?=
 =?us-ascii?Q?THmsij7yABHAbMFb7Nt28JSUE49Qi21sj/4utd1GxBqnM5jL0VoykJRb+b39?=
 =?us-ascii?Q?ARrR0kyDN50obLgs4gqzf5flIalfXw2vGcPW2gDDd84CoNER0Qtt8Q+mBIcA?=
 =?us-ascii?Q?7x6Tk1sbMhStsYlGfwJLCw1vxnYobnAGVqB7jDNvb6rcPg96ZnRlS1mZW0Sh?=
 =?us-ascii?Q?fexZjNEsqZ440N+p1FDwWruyBV0qmMoNYtpTEKMbzwNYJyyXgxaXDi+QIhuP?=
 =?us-ascii?Q?WonrflP/OvUy33aWHnuR3NXbkCEvRjZDkoRDUoRWZWE09KLLHMHOzVqRz3zL?=
 =?us-ascii?Q?x41Nmms2j0W3FKQ4GUHsCzHpKPfd0GzLlhHaj/n2h3XmYuKb0yJv+v0O48oJ?=
 =?us-ascii?Q?eiwgt+EY1Zd3TbqKj6pbWe0hBozGg3nedfUjrlheTGp7dPV/l4lijGP0ctf5?=
 =?us-ascii?Q?gW+40gUpcoY/basLbYpbE5epgP3KX0UGEbQWlrNzQgMgKgXGl3tzgdq3Dqol?=
 =?us-ascii?Q?I/fGW5DQcmz36TxhQgZJQ9DlyrOZtT+iYH/bfPIQlk8UM+andk/dUqW1KNqS?=
 =?us-ascii?Q?B5i6YaKGoSzP8SYycIE3cpLkKwsurFB9RL6orrylSdmFkT+l7XpS9bBeHZJR?=
 =?us-ascii?Q?9tFB8239yd/1Sssup0CZI9tLHoKwk0HWQubIVHz5zYTv8rcP0SljDg+cdyXB?=
 =?us-ascii?Q?AfOtyiRSC0ZbCJ2VuKKRsPCZtFqZB46ljzyJuMf2gNuHqi6fzwolkNpq6mXE?=
 =?us-ascii?Q?XxENm5YMm4F1sKXEVc5pVfhMF0o+9XYeytI6IUyDQ8UPmkUJ5AFpMa1UtGPM?=
 =?us-ascii?Q?xxuF8hKnWMMeRZGVjLYo8PR14u5MmKwIfisjPwhkyqVwd8J9CGFOHLxkTBLU?=
 =?us-ascii?Q?3/x7L4IOKo3go//Jc0rIMAkix7safhjHM8fD0oQ/kCnK4pDreCVDxmtxzEsY?=
 =?us-ascii?Q?BRCaOdnYFCBDTrkZESXfllTK9j8EAAIMtEfAeXLmVj0kRjd2FtC3weDw/BXF?=
 =?us-ascii?Q?pfrG47fG4vQUWSaY0DUoZysZ/rB/Vqi9OxAUWZtvtbAL9X3VfqXzR6r4+Vul?=
 =?us-ascii?Q?aS5nAekxYCQdTCVDB/GMjNH/yKO3rPgL1uA3u3eicNqIvkMFtIjl9b3lrQaO?=
 =?us-ascii?Q?9thIkkvtMcm/m3WO60BoZDwOrk2cGX3hrv8SiEVJZJCJH7KoaIEOdsFUdt5A?=
 =?us-ascii?Q?TnXO6rM7oX5cRK8Q8BYpCkRSxyGybVuKgp/0B2oXJbZYJHm6Lf7E+yEVCc5q?=
 =?us-ascii?Q?SqDFKGT/vOQhJ3yD/zA9NVfQ8xbbkpZCk0B1qZr6t46nBx9n+R7FjePV86Po?=
 =?us-ascii?Q?9zDrH1Cw3z23gfDebpq+akXPU0q4Bu9fwl/3PtSKiBHc6THbx/AC/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:16:17.8034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da3c284c-9343-4e23-8fc8-08dd5dd6725d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

A PCI device may not have a legacy IRQ.  In that case, we don't need to
do anything, so don't fail in libxl__arch_hvm_map_gsi() and
libxl__arch_hvm_unmap_gsi().

Requires an updated pciback to return -ENOENT.

Fixes: f97f885c7198 ("tools: Add new function to do PIRQ (un)map on PVH dom0")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use gsi < 0 - Jan
---
 tools/libs/light/libxl_x86.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077..0a7f64ad46 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -901,7 +901,10 @@ int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
     int pirq = -1, gsi, r;
 
     gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
-    if (gsi < 0) {
+    if (gsi < 0 && errno == ENOENT) {
+        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
+        return 0;
+    } else if (gsi < 0) {
         return ERROR_FAIL;
     }
 
@@ -925,7 +928,10 @@ int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
     int pirq = -1, gsi, r;
 
     gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
-    if (gsi < 0) {
+    if (gsi < 0 && errno == ENOENT) {
+        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
+        return 0;
+    } else if (gsi < 0) {
         return ERROR_FAIL;
     }
 
-- 
2.34.1



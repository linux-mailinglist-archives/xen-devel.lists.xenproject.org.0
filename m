Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94858A46C0F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 21:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897223.1305936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj7-0007cd-1m; Wed, 26 Feb 2025 20:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897223.1305936; Wed, 26 Feb 2025 20:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj6-0007b5-Up; Wed, 26 Feb 2025 20:09:52 +0000
Received: by outflank-mailman (input) for mailman id 897223;
 Wed, 26 Feb 2025 20:09:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drmc=VR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnNj4-0007Mt-WC
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 20:09:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a125ca62-f47d-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 21:09:49 +0100 (CET)
Received: from BL0PR02CA0044.namprd02.prod.outlook.com (2603:10b6:207:3d::21)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 20:09:46 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::c7) by BL0PR02CA0044.outlook.office365.com
 (2603:10b6:207:3d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 20:09:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.0 via Frontend Transport; Wed, 26 Feb 2025 20:09:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 14:09:44 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 26 Feb 2025 14:09:44 -0600
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
X-Inumbo-ID: a125ca62-f47d-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhTZhbicqKVlpAnCtG4zRW21VNGtdMc7u696q/oNmzQNg3Q1Y1CB3SPcW5/6tN0zsg15Tv79Gmp7zI+sUJZGGrqrsiGEGWiUTstLy6FAfkR5szCaXtvwTyH01z5sf5MAjwEZtyfAtezspAABVfs3uxtwbS91kDqLZ9Ixl+pzIgNwXSqylSYTbaNsSGHvhqiJx+xEthdCEPtDlbr3Hekfg12YZi1HK3AzBwlukn6biqKnhsNXAHRCCTUQjDis7Aj8kOol9wap1SVz1aHWJJwnxHJUKSWvzASFtxf4EFTvMJ0XduPGRdOO/1YNXlq7MHUlRKH9AsYoZOzp5Hqhe2pfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXif3xxHR0swgkqMsjQ8Zq4Y3dDR8D/QU5nuLdzLagc=;
 b=zHxot52XJCtGxDiKTI2AWwaC+zKaBXtEPnddzzN4Zib1b1W7d8YJor8F7mNBYKPEX7Jg0Hgb9p1ZOxn2Sx5XxwdeVx2ZTCou4HmHF/47H40sp0y8OJ8eI1EBX6fDCm9MmXNYfFpgeY7boxHpa9QhZHxvcA5hWT0Nc6Tjabr+rzJTZHMza+DP2uvxfdXAB8D06BzDY9AE1SOxNvwU1t+f0SRgEi80mWmi7oLAnC0xNBuKi8u8jHdK3JRG/mrb9gkKuq24QTFpN9QLgW3L+XFUc815kupnw/SrD68QjiD21EH5wdZfrm8FbH+42QbCBxk2tAWLJqdF2xvhEERgTmhIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXif3xxHR0swgkqMsjQ8Zq4Y3dDR8D/QU5nuLdzLagc=;
 b=wb7UkztnnlxEUlPq4CkFGiWoQ+LEF2kn6H8DZYtYx/rk49X2+YBDozSQEG32iU4SV//hdpmElEOOBkGQ7V6/LK3amvh6gkxtbCgtSHT/P77d6g/kLlmq/cXzmUErXU4lzSuDr+xQA+1My5LchC7Rta1M9dDWn8PBRNOcL6DNkGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] tools/libxl: Skip missing PCI GSIs
Date: Wed, 26 Feb 2025 15:10:22 -0500
Message-ID: <20250226201022.42447-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226201022.42447-1-jason.andryuk@amd.com>
References: <20250226201022.42447-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ea7044-fb46-4677-5088-08dd56a18399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y/mPFyzgqK1nny+7z0wLCaNfTEXvEtpbjITW4xBRvIPVdd8Qc0CzaMdD+xo9?=
 =?us-ascii?Q?D37zItGEx30Bd/eZSB9q9AxtZ+c0TOJX+4Iuf4mkiKJ8pxZU99lSnVaXYKV5?=
 =?us-ascii?Q?5lkIIHLtKlDETtu0Flpu6qbUJMbRBylXIgtHEA1k3EAPNC6Y5UIa1R1o4FMj?=
 =?us-ascii?Q?uMVcjGIC0cROclRhVb0Gk8v7LpRJrS9T4+LlIsCl7eLGwy7MBJaTHKTFpofF?=
 =?us-ascii?Q?0F1i3XBzhptKxSUUQR+Jda6ag8/U+l2Kgue2L8822NdVvlBtLm8zI1wogQ/l?=
 =?us-ascii?Q?fjNDJIDmjOps0V7Lj+HZbRFW/vhAhXFkwQlBb2AkNy7ZTPYPeErxjctDUKSQ?=
 =?us-ascii?Q?SQVjLwogwNMOtzbwKxlrHTGedgbosCjbSvDR8no0EuYemiAJS69Yr55g0vPd?=
 =?us-ascii?Q?71YRJcXdlqyF9Rdb1zZTr7boshd8ZRf2R2YM/BwY9GOWHN6X1NcT6IpxWgi0?=
 =?us-ascii?Q?JWioHnbc9gNnvjhblUlo5sBVKmDDhGonqO+LvRlv4U7M9eWlY/EBnkZIQ2aZ?=
 =?us-ascii?Q?CmCStujsTjpTBtwcfQmMS700npwRCHtlSbdvok/Hrry0ym3puv7T8rmGJUVA?=
 =?us-ascii?Q?iVmygvWyNVBkM6iNqczMmUgvYoGFgfeMf3T0SFJLp4OSFCIYcG/fHiVVaT5s?=
 =?us-ascii?Q?QXQyRCOvBUYnB9KqrDVuQo7wbi5ED1agLBt1JedkiXIc9pjupE/FMlB0W3/j?=
 =?us-ascii?Q?mBoSlWNRw2hNju0SVGIr0+Fd722h7xWG40Vbr2feWKmNSf84DoIEMwhwklra?=
 =?us-ascii?Q?EJMjlsnKzXrbcCwyVWZvaxrXXDsYPyCmb3c1ue0VT+wXn5u3TWF0VJBXPvHs?=
 =?us-ascii?Q?w2yg8svSfCZ0crdMPsQJq67IPNi0Sqzh2UU7kfUmyG+ZQmEvy49Gc0cAuapQ?=
 =?us-ascii?Q?ykfyLeA5N30aHa+u0ZfakECzILauYR01LXDBNWuXQXheOp4O/40AGQRZQnbq?=
 =?us-ascii?Q?oLbScAAHqiVasv7uL7skJ1ujn34U1XT3y0uQwg7/HaSEaqv+aZNzYltiXnFl?=
 =?us-ascii?Q?qamdaK3f83mXq060W6oIYN1PB/TxxeoN4NrI0ojzSMOq5tHXEJTpH8GySwy7?=
 =?us-ascii?Q?uAGxF9l4YVgJp8oypmqlkDS2W0jJJCUBZziVXJVBYmcehJPWD1BNbLKyyTsQ?=
 =?us-ascii?Q?CvdVt0Jcwp9vMxVPCrYhMJ5svS3MBZW8JvBJXieueEv06zjtdeWTlD0+WCeg?=
 =?us-ascii?Q?67aXU4X/Bzrl/BP4rMn9Jf/St1O0lryCM5ap1ZJrbwZ3vQgrjizf7/6NC0/P?=
 =?us-ascii?Q?9dKf08IWn4AUBXswcfQ6kOUP9KJDe89F7MJjurGtEHbWsyZLzbEACMKu1/uu?=
 =?us-ascii?Q?yKCJ8ip4c5zzT1hgk78oMxR+agbOR4DZ7hxrWg9+1piK0s8heF7D8XBTbaDp?=
 =?us-ascii?Q?yClusH8urwUh8zXQrGz7Kqv6+6Qi1AFy8VHmwpMr2HRAas89xk6TIY7vqe8I?=
 =?us-ascii?Q?WQNRF67xC94KB5qD0FUgwg8mqJLZL/aOCfgZhcMefjcPx9cm0GrB/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:09:45.3439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ea7044-fb46-4677-5088-08dd56a18399
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156

A PCI device may not have a legacy IRQ.  In that case, we don't need to
do anything, so don't fail in libxl__arch_hvm_map_gsi() and
libxl__arch_hvm_unmap_gsi().

Requires an updated pciback to return -ENOENT.

Fixes: f97f885c7198 ("tools: Add new function to do PIRQ (un)map on PVH dom0")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/light/libxl_x86.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077..63208362af 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -901,7 +901,10 @@ int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
     int pirq = -1, gsi, r;
 
     gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
-    if (gsi < 0) {
+    if (gsi == -1 && errno == ENOENT) {
+        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
+        return 0;
+    } else if (gsi < 0) {
         return ERROR_FAIL;
     }
 
@@ -925,7 +928,10 @@ int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
     int pirq = -1, gsi, r;
 
     gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
-    if (gsi < 0) {
+    if (gsi == -1 && errno == ENOENT) {
+        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
+        return 0;
+    } else if (gsi < 0) {
         return ERROR_FAIL;
     }
 
-- 
2.34.1



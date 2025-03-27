Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6CA74173
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930005.1332737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwT1-0002ov-Jr; Thu, 27 Mar 2025 23:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930005.1332737; Thu, 27 Mar 2025 23:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwT1-0002n5-HH; Thu, 27 Mar 2025 23:16:55 +0000
Received: by outflank-mailman (input) for mailman id 930005;
 Thu, 27 Mar 2025 23:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXwx=WO=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1txwT0-0002my-1x
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:16:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87b77515-0b61-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:16:37 +0100 (CET)
Received: from PH7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:510:33d::29)
 by SJ0PR12MB8089.namprd12.prod.outlook.com (2603:10b6:a03:4eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 23:16:32 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::67) by PH7PR02CA0010.outlook.office365.com
 (2603:10b6:510:33d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 23:16:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 23:16:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 18:16:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 18:16:29 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 18:16:28 -0500
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
X-Inumbo-ID: 87b77515-0b61-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVDm1LWKX9Tu0Ajh6hNFeawrYNYwGyX5Y+6Z8RQU7EOsrSJGB6dJ2cXKe1fE/nJDF6tqAViZgaLNwTckB9muV9S3yUllN14CDOD5YTilBfQYmo9S9fuUIxyCOZXbLRRehBzi4DXaubcMawzNYtHXOQMd0TV3Af5dTL7o9pEQ1XK5dNzBnMdqPjJb/yOMKY2X1INQans/J+HZjs7heI8s3aEbXGaPvpIzSzvL7G3SWqE1lWdUkhIeeF8YcTX2QIdHZLNwFzsqV1j0DLSGm2fPOwXsDSY+Rwgtb8Af2bg1v7UpxPTIMj0h+wRiwfFVV9BaDxthrJ77Vjy7wiub9cNsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTWYaoclpebpaZSb6u4errjdENiG0iSlcWFhm6M6ebI=;
 b=jHkDjPU1XOVaLS8tFaedHCr/Ju38dHXQNeS5FPZba2Qr14wqTG8k5MuqOAjfUaIppqAW3Ocdv6/xKA1QdgfNO2Ov4w2/I/LWr/0VHQUgwaElXCoEr+jKgXyza/1hOaRL/30ZHXh3hR1E7teJvL+kebOnwqyvhdVuSQoviTsETWyiTsmeTxWrd5u0vB8mUZtnM8/g8GIepUeKX0gvjDGbSgMj81GHb8D8dfcwO0CvkJ34FPdXt2MEyJXRQAw/t440xAabZqB4QwL0LdXvuVKZ3adWN/MMOfHl5kOUWAEAnFi1ZAB64DHkV5B23Miv4KcDAIp1v2kGgPU9AYgKGSnj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTWYaoclpebpaZSb6u4errjdENiG0iSlcWFhm6M6ebI=;
 b=O6iudFX9JhFXxAQmOLqLTXjTM8lXWrA+cAgRDutI5QQXljK1JqBEO9UnSK5MFamS+hRMyppcEBPC7NaQ30nGkPWfdshy3gh83S9HyYOWHGK87VhO4Av59H7q9nysXZO1ns2fWRUvPH7ncnLNfRILNtXGUq1Z3DuRPIMFUsMosXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v2] xen/arm/efi: merge neighboring banks
Date: Thu, 27 Mar 2025 16:16:27 -0700
Message-ID: <20250327231627.1111684-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SJ0PR12MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd293c9-b362-4338-8de6-08dd6d8568fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S55Gz8HLF4lO+ggSZwQi+WYR+YgRt31x7/QIDGlV9ER7bmPvCkz5U8HiCaKu?=
 =?us-ascii?Q?Oa8PAppetsbao/fTXHpbcaW1ic7FB6oGsa2365dDir8XbQreLn52JPFWSR3V?=
 =?us-ascii?Q?vDcV6TG6OwyOxdVJXPLP0AtCyehRXJJ9yC+jB7Io9yyuYkaYeFQjYVGNKXV6?=
 =?us-ascii?Q?dfIBoeh9LSidqHguDP9Y9ZHISoBvA/TUaCpv9Jr86Uen6Vz5CvGYv9wWfmc0?=
 =?us-ascii?Q?JM+JTHWmDVXEn2VCUWNbwqXwig+xa1xNa+sSaSOoihGbOEgLKT8q+ltaLn79?=
 =?us-ascii?Q?oDJye04Z68udxxHK0y1ocz4tWMvWr6sNvzc8Ex5j4fcjV7qQcR1NAde41+J+?=
 =?us-ascii?Q?VvpW0w4nW3oaJtzLHncy50HCJ8o+YIRDkIvceYPYQrM4XLJtvgwgsFq+WDSZ?=
 =?us-ascii?Q?aP0oj8s0Hvu5pd8yWGpemo4rf8AI6DLNOSmbuJD42dxlu0gBy3UloYZlb24s?=
 =?us-ascii?Q?PyQbuTXxmcO9Bc3BeWp+8uhZsuAsw4B7m7f246KKVRlRZO6CNh2j+vwt48tA?=
 =?us-ascii?Q?4QfQGWu6q01RGzrjPWCEXoENMgMyj3v9vBR+0vIuBFaRnEPxvn6K7XSKCXEn?=
 =?us-ascii?Q?er7BHsLiVGDqDZJ/vCCtJug+k458yP3FiO3pSeZbfX63I6T+lGT8fYE6GPsp?=
 =?us-ascii?Q?bx5Y/U7tL/z1fEsUG5KYY78ImmvnL9OWddX6OjMi6Qne/btxSAcW41PEpUGd?=
 =?us-ascii?Q?oayApx3A40KfmdUqAEmerse97pQbc2I0Ays01bxMddm2HjF9xYAS3vG+yYLm?=
 =?us-ascii?Q?v8btIPFWpdk14rhRZaGaR+C9FZ1x75i46PF3Q1BY04Z9YhubozdFhIBYpfnm?=
 =?us-ascii?Q?yEWjOwWBOUelPfKjzow4jI/5SPQc+ARCOdh5ZiSoGVCGiZ3t5s3r0fs3/18T?=
 =?us-ascii?Q?5oiv8LpPrPBxts90BHZxHDY1X5dzeAGBrYXpTfQ1JpYrpj1CBPPS+8SI6otD?=
 =?us-ascii?Q?gFejpxsM4QAUbFojRJujEGZpsH1BgbP/AfTSrSUZC03C9C668m0TQn1dqfRW?=
 =?us-ascii?Q?v2yZIemq+cZ320+CjLiJIOPdBkCte9t4muFMh11UJTgRgnGjFJmvZO6FDVe0?=
 =?us-ascii?Q?gPEtiu3JZsBrWEaZJJDfjIDou2RSv8igQ9pMoVw7BPFqMDEafgx21WxdNpSc?=
 =?us-ascii?Q?GC2u7V9PFwL4/gzjwbi3LBIBZuNag2pjSDXxzcO7L2+/iJ+sjfh7nxs/CTAk?=
 =?us-ascii?Q?YWJhQ2T/UXOetBHKGATziTqepgxF/Gpr9IyPFoiBnr2x/d0IQ3x7QVNrfQOo?=
 =?us-ascii?Q?xLhTiXmTt1SEx/OyCuNe/UGHpn/i/IGL/hpEOWNikdqCX6ptMlqjnu5/nbXD?=
 =?us-ascii?Q?HNfCedngCYwgPpG/WthcBKCyN6qYTxf5bVhL98OBBOJebfRpwbXJf0RPeWvn?=
 =?us-ascii?Q?GD8ssRHt9fKbUTaoZ8hMNYTlLx+lWmtTvDiU1+Vs/2NsAqn6vp69JclCXSgM?=
 =?us-ascii?Q?vN+lL+5nP0oE3UMUZZVHTQOb3X0SqOlw3Tl7bT66l0WWR/aE/Pk8pb1iquJw?=
 =?us-ascii?Q?SeBPVNczZ6gIRfg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 23:16:31.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd293c9-b362-4338-8de6-08dd6d8568fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8089

When booting from U-Boot bootefi, there can be a high number of
neighboring RAM banks. See for example:

(XEN) RAM: 0000000000000000 - 0000000000bfffff
(XEN) RAM: 0000000000c00000 - 0000000000c00fff
(XEN) RAM: 0000000000c01000 - 0000000000dfffff
(XEN) RAM: 0000000000e00000 - 000000000279dfff
(XEN) RAM: 000000000279e000 - 00000000029fffff
(XEN) RAM: 0000000002a00000 - 0000000008379fff
(XEN) RAM: 000000000837a000 - 00000000083fffff
(XEN) RAM: 0000000008400000 - 0000000008518fff
(XEN) RAM: 0000000008519000 - 00000000085fffff
(XEN) RAM: 0000000008600000 - 0000000008613fff
(XEN) RAM: 0000000008614000 - 00000000097fffff
(XEN) RAM: 0000000009800000 - 00000000098a7fff
(XEN) RAM: 00000000098a8000 - 0000000009dfffff
(XEN) RAM: 0000000009e00000 - 0000000009ea7fff
(XEN) RAM: 0000000009ea8000 - 000000001fffffff
(XEN) RAM: 0000000020000000 - 000000002007ffff
(XEN) RAM: 0000000020080000 - 0000000077b17fff
(XEN) RAM: 0000000077b19000 - 0000000077b2bfff
(XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
(XEN) RAM: 0000000077c8e000 - 0000000077c91fff
(XEN) RAM: 0000000077ca7000 - 0000000077caafff
(XEN) RAM: 0000000077cac000 - 0000000077caefff
(XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
(XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
(XEN) RAM: 0000000077cd8000 - 000000007bd07fff
(XEN) RAM: 000000007bd09000 - 000000007fd5ffff
(XEN) RAM: 000000007fd70000 - 000000007fefffff
(XEN) RAM: 0000000800000000 - 000000087fffffff

Xen does not currently support boot modules that span multiple banks: at
least one of the regions get freed twice. The first time from
setup_mm->populate_boot_allocator, then again from
discard_initial_modules->fw_unreserved_regions. With a high number of
banks, it can be difficult to arrange the boot modules in a way that
avoids spanning across multiple banks.

This small patch merges neighboring regions, to make dealing with them
more efficient, and to make it easier to load boot modules.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove unneeded check for duplicates
- unsigned int instead of int
- add parenthesis
---
 xen/arch/arm/efi/efi-boot.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a80a5a7ab3..8b8ef5dcfb 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -163,6 +163,16 @@ static bool __init meminfo_add_bank(struct membanks *mem,
     struct membank *bank;
     paddr_t start = desc->PhysicalStart;
     paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
+    unsigned int j;
+
+    for ( j = 0; j < mem->nr_banks; j++ )
+    {
+        if ( (mem->bank[j].start + mem->bank[j].size) == start )
+        {
+            mem->bank[j].size += size;
+            return true;
+        }
+    }
 
     if ( mem->nr_banks >= mem->max_banks )
         return false;
-- 
2.25.1



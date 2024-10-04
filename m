Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9139902DD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810341.1223035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKV-0006HF-0R; Fri, 04 Oct 2024 12:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810341.1223035; Fri, 04 Oct 2024 12:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKU-0006BH-SJ; Fri, 04 Oct 2024 12:22:42 +0000
Received: by outflank-mailman (input) for mailman id 810341;
 Fri, 04 Oct 2024 12:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKT-00068r-Eo
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 580d7bb2-824b-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 14:22:39 +0200 (CEST)
Received: from BYAPR02CA0059.namprd02.prod.outlook.com (2603:10b6:a03:54::36)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:22:32 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::c2) by BYAPR02CA0059.outlook.office365.com
 (2603:10b6:a03:54::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 12:22:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:30 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:29 -0500
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
X-Inumbo-ID: 580d7bb2-824b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVZDilnPaD0TTCjTngS3ozjRnMypmu98wOGs8mAv2SfHFhdkMoLLx61ogDxnj/UACLOw6A/SkePhYjciUbWAXoTTI3x6rzaoskgbSfeOYA4ly9HieaWDEQMat5yv7DmuHACaWSxjZCd8dNUXf4t0vz76/WdCj1IYjZ6CrzoYF6aGOVnj6zxWpNGNWlfPJz+w8GQVlo8SIjJc0yXvcw+gVnX+fCAT2j1ROkgL61dQ9Uyy6GCPSvadRGUV5uDvr5f5gIOg8hGCcIDtHJN1IyH64UAhvGJAuUVCfWCotlPAt44YBH/zse/hKb/sJmtaoMLwp5YakUGcJ7XdhQggVk59EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMyZSSKtyxLWnjqInD9m5eg0zHWpnF3h8hQyllg0PFs=;
 b=GzijKEmIRS2lmTWcqW69Q924y+/jz3gJ78IrQ3DMMzShMSBUyDsQhEx/BlyCBqDHrmJqYUGwx2dVVqQCgqwkYT6KBIgjygCTwKoNU7trQcMdWsPPOxDFPTQM3s3MHqpPO/iKlFpUMqP1XGHIJVZ1If7+rvWKk8X9jnkCBWTVAZJvJrc9PUGycNxkn5zw9aBkgUfoAI9uxIE8Q9cSj9qJqWxK1NBoieOY1dBz+tlDHbq5zVCEhn745PDhyat/INyT2rQ7awCX1Q2xkUrJpOTu7MiRNRRWtKf23JYkyPSz8Dsw2IfjqbJPDuXRTc72Mi58qwRFM00Kn2VOnWASGVePTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMyZSSKtyxLWnjqInD9m5eg0zHWpnF3h8hQyllg0PFs=;
 b=HRB7fJTWp2Egcia55u85OXOLNRnu9dW2oktL+//zQEb5acIJQyTT//faY8Z2TpZ0Dlynk4jXvs0Xt+yXEw8+gOShbCRNcSX4bif1EUQ/+NWwS/KF/6fK7PyJdnBaGO45Yu1OHrmCQjf+HTpy/jdH4SO8z6hFCkHfsYEC8zGvNgk=
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
Subject: [PATCH v2 1/6] dt-overlay: Fix NULL pointer dereference
Date: Fri, 4 Oct 2024 14:22:15 +0200
Message-ID: <20241004122220.234817-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd0f08c-f481-4fde-0d11-08dce46f382c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qco94T9poxxSlC2uze1PSbCG5rFu3a4g6Ak6S8hMdzIVLpp4XLx4VDo/rjlA?=
 =?us-ascii?Q?7qPJZWTvYMhKDXzlnDknMOml8xJsG658P7KvROymh7CtCzs6CdnvAid1f43A?=
 =?us-ascii?Q?rkyXsVKyE+azuvu8urQgM1V3kVm9kuc2KXAfRJf3yrCFNlhzqMGYKVGPuODG?=
 =?us-ascii?Q?3u0CG1iYX+zgKkWkzAwSVkMRs/yXOzgJYvUqAUkGGX04zk2E6+LzUDs8N/4w?=
 =?us-ascii?Q?NQnzQcbpZQ4W29TYC9XH10EiM0EXGA7x1AGpQE0W3gIs2hnCxpXDQVTvA6sh?=
 =?us-ascii?Q?RA9Hn1E84vhUP5TANlsCce4C7vsPUM9B79gXujdIuyfL/dkRqfuJNgE1yqUt?=
 =?us-ascii?Q?MWWwMvxCSVzwyQcGO/REqP32a9V1AUsLx/Acg8mgCb+ztC9YXaFjU+Cg5Z9K?=
 =?us-ascii?Q?xgzFOkEoM+Q7V0rmhKb4cD4fH7Zed97PvY74E8lsHW693ufDUmDt9ZNm5V4B?=
 =?us-ascii?Q?L+0nz1/NglLGfH3SR6UkCRKYiCXnanrQrx6wR/mHlbu6jqL/G+CTIvRtfxy7?=
 =?us-ascii?Q?x4ovfWiEIp6bmJimrcEJR+5RDWxCDnMxHHhPVn7jRelV1jT69MlVlN9O8oEX?=
 =?us-ascii?Q?+hKi4K9aWXAblzcqzm1EOfoVh8U0hVMPeR01jPEFqxko0c2eYeF3AmX1kL+q?=
 =?us-ascii?Q?qLIBXuRk4RFqHCSfemnif6+oz0vomfRbReUfJTaMk/8Nlo8lAg9BjPbMEOow?=
 =?us-ascii?Q?2S5g10ukuWdsc64z1ywMRXdK2k17mHPhjCPbNIu2xcXwGojOGQgKjGiVFKPB?=
 =?us-ascii?Q?+xDb7KEeGic1HlCspgaohBuVQco/+iE5kyF7RJWUDiBZuSNXW1qAvnklDZJ7?=
 =?us-ascii?Q?ns9o/CpJQNBaAQzfA/Wr1Q1/yLRVmEabDHZvAR1SB8/TzNvZw+tDCTZeR9zA?=
 =?us-ascii?Q?vpARfT1jgmnjaAPlfHKh3O6WGLdiVuaJ74vSrgwiKuB/C/gNnFyTOsDMOiUd?=
 =?us-ascii?Q?16FrhXzp3+KaP8+B0a2a9mxB8NK9QO/rmM9wnkVKbT1RGu7/sX8od5hXrlGK?=
 =?us-ascii?Q?QepmiNHCaQD+1HcXG6WgyUoysNgsxi5l0Dk7B8yoEMSYUYWG40smv7rSlP2q?=
 =?us-ascii?Q?SWBMF6Wf1M/LdiOgTvfRrXpSEEW5YJSJGI5mDZdVrN75fxvXXCku9zbIK0CL?=
 =?us-ascii?Q?muEsBUXzdZmEpqqguKEe1mN8c2Pu1NTKT8916AWDFKFAHe4p5Ga7MkB50SJj?=
 =?us-ascii?Q?V2JIAKXaQ4xPeh9p4cpCeBHlL70yZBb5o9v9j/TljoaZ98sor8VPg2hZeUYS?=
 =?us-ascii?Q?o8YWUlfMjD83vz1DDnToxiTL/EqO2N6tckowyIV7+bggzSAyjX9zW8jszqYx?=
 =?us-ascii?Q?lK9RjG1neQRePUsitZR1/itEmjL9YOAtBtzGdvagCnSVwqFjfLQbHpHhg+q0?=
 =?us-ascii?Q?7vybpvbBCaUS2+HUTZ+Fu2G6n4cw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:31.3275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd0f08c-f481-4fde-0d11-08dce46f382c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593

Attempt to attach an overlay (xl dt-overlay attach) to a domain without
first adding this overlay to Xen (xl dt-overlay add) results in an
overlay track entry being NULL in handle_attach_overlay_nodes(). This
leads to NULL pointer dereference and the following data abort crash:

(XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
(XEN) Data Abort Trap. Syndrome=0x5
(XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
(XEN) 0TH[0x000] = 0x46940f7f
(XEN) 1ST[0x000] = 0x0
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
(XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
(XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328

Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
 - Add Rb
---
 xen/common/dt-overlay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index d53b4706cd2f..8606b14d1e8e 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
  out:
     spin_unlock(&overlay_lock);
 
-    rangeset_destroy(entry->irq_ranges);
-    rangeset_destroy(entry->iomem_ranges);
+    if ( entry )
+    {
+        rangeset_destroy(entry->irq_ranges);
+        rangeset_destroy(entry->iomem_ranges);
+    }
 
     return rc;
 }
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047BEA5FF39
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913307.1319396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnIz-0000l6-T0; Thu, 13 Mar 2025 18:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913307.1319396; Thu, 13 Mar 2025 18:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnIz-0000jH-OO; Thu, 13 Mar 2025 18:29:17 +0000
Received: by outflank-mailman (input) for mailman id 913307;
 Thu, 13 Mar 2025 18:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDg6=WA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tsnIy-0008Kg-F7
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:29:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:240a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fda7c50-0039-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 19:29:14 +0100 (CET)
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 18:29:09 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::d6) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 18:29:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:29:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:07 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Mar 2025 13:29:06 -0500
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
X-Inumbo-ID: 0fda7c50-0039-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCFvWpulTSSjbV7mbtzh12sEK7VnF9TqIR5yrxZXM3Qnt5OUBsLbuN3mTdnlEFntuLW4nh0f7kU3XzJpfUwImfJlLPa5e28Qfpuyt/D9advW7+0wwkNjdgKiivxUq0g+mp7FJX516tQpzXKQux1FXod6W8iMmeNU1dOgKxZxAd8h+kx1qDuLNjDf+Qifu6Hphk6C/CYaeshq5YoALyxWNVhzU5Ewt4X/nO3GRDd0Yeis6IQGJ8vgbuwjfVuoyeftfm/rwuQYwG1vey9+3Oqt0ZqlZ7QRLkmWtInE0iKNeV9soIZNpVnTkYc/gYzGkvdWlXutTBFG18Qsbf9pPWO7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elh3r0PaEr5sJhWQvQbG1ywMmlz4cKftNHjTNQEPGrY=;
 b=U5/nkBseGoY5Yc7SirFea0gcdWsJ446lklfGShZpoIBZZxSCkZ1tBOSH13drSKhC/KKICn/QqRuLYDkW4FdyLNqszbJbMLdJLOoBjy69JlQ/xzoI+Oio8SOyWvDHD3lAzejbm6444T7Zcn181A4qpxfwl33GjjyzcVPRnXu/Zmv0Iucsw8EWyTVD9pwpEskLA4K8kXajcvgiFthMt9KHv/sffs1jFnt3UkJxFOAL9PqpTfSEhs4IpYkijvacO315qAFaxJClUibtoePY9MRglezxU8iPURKuAO49PgBzk7Fmf8eBsz15qWFgOgCcYLp/vhA4EZLD3Ythsc0xhNjueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elh3r0PaEr5sJhWQvQbG1ywMmlz4cKftNHjTNQEPGrY=;
 b=k1XDb8EDepB+Ia7/23U2piGsNJUHJBS1+cI24zlXLUpPEiFPf3LEZNDBgt1Tmht8vIG6sXvsN2vyGOQwh9hMl9pDg6znZkTAh6bHzwYNSFo9E+zvSJsKdjnCfscS76/rKEm3ZU56yvMt+KUfvit0f+DJBoNzxMJudPdtjeG+NaY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] xen/arm32: Initialize MM specific registers in enable_mmu
Date: Thu, 13 Mar 2025 18:28:47 +0000
Message-ID: <20250313182850.1527052-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: a435c073-413a-489d-e89e-08dd625cf1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?we/x794P0YQhA8B+jYNq25pBXZH/D7W9ng//JvL6nf8TKPtM1nbMnT1n2bOF?=
 =?us-ascii?Q?X9RQqn3dAWE2QhFB8guSYDBELICyoGaOLSaIksL4Nt9zIiBxQby5dEfHw1JE?=
 =?us-ascii?Q?Rep8YphxYWjQB24W96gKWUdxUsKC62TJmAWrrqMUq1zcF7M4R3R1pJLX5e/K?=
 =?us-ascii?Q?O39Ro15awqEDhP7FLcdHof9dwr15MaoBXXZlWIABnRTpKDPX3+dRb/+HwDBc?=
 =?us-ascii?Q?Vw5JB2RIAyIMOZL0tqkABEZd6M0ouDB8xyja0ZzxT+QstCjTQRgFdJkig9tE?=
 =?us-ascii?Q?HzChEmZDsEwJbAY3NTZ2L89yNZ0pzOGlvEceyo9a9mJUTuR6Rr5VCOY+F8/M?=
 =?us-ascii?Q?JzNcZ6Rv+e8OYQd6agOMjKBqbRB+sPv8r3/pkLbohx+zDodIASkHC3wn7a8v?=
 =?us-ascii?Q?7D8tPO93Wgbxlo1/cbJLKXPo7nplAovixzLDA7GoBdDiar2oN8QhjyQwfI6R?=
 =?us-ascii?Q?BHHPgx5qAACNdol5yUm+X12kHWSxTTXP2kIF89SuTCH9QNhkEjOWV7kMpno2?=
 =?us-ascii?Q?0BeFoP0VGYiGTYVv5bK/kYjXz2Wf2byNyOE3BDJbSZFEoQbrWtE/KkE30Ijd?=
 =?us-ascii?Q?SDQvmDQJn7j4xUjn1H0lBeiAs/tY4M5QyEGJRtMnadL/XpMqcxog1kT5NtJe?=
 =?us-ascii?Q?7clYa+OskbsAj0lUQQ28ja14r1bUjJ1zh+vJOO+09loZaZlbyJdjvKVJ5ooJ?=
 =?us-ascii?Q?0QMJ12IP0zfPl+w++UfxRSqncy0GieqirHyg9TT0xZ0KOwC5/3yP/HpnANkW?=
 =?us-ascii?Q?VATzczcTHWQg7cAgnDCQQhyo9pdkXbvlnUuvEvZgyBBb/QDAEw95kXFo1C7G?=
 =?us-ascii?Q?P+PCBd3mG2Iql3LL5CQf0+4fmFpjXp6+Q0d4geaBGumy7ACekYvLIJwcsPfz?=
 =?us-ascii?Q?Dz9td/WWV2UPq2erSGD+mJlwW5+tjyyYZIziMsKaGYkUUSSijMkeY+PpupXQ?=
 =?us-ascii?Q?Kz++Z2QmuZxRfykms0VyZ0yN31eG680y3jojVVCj+Jtv+en+mcvSfoSLwp84?=
 =?us-ascii?Q?KMCwiiUAvyug7KMQDc/HxMx0ugugfrUsPU5JP8XjqeTkm/LBoAZZRFKOfYjq?=
 =?us-ascii?Q?MXv5n0/Gto6y90qVfW4a5Zc5uwOUwWeTYk5jJY2ySsL8/0SxbOKZfaIJbvY1?=
 =?us-ascii?Q?z6aj/Df+IXVJznMlNRt+Ax48SpjAS3gr1yXzDEjiGNdHkerrzPkFazFQGGdv?=
 =?us-ascii?Q?RN0r4IDspkFVCW/ie54k2BmbwBhWzBqMym2e5+EK+bKUynacM0ornceiBg/N?=
 =?us-ascii?Q?RiAV7HDfLMnT/yTqbCStLTEXNVf01fJKsLw9V+0Izc6EEjwphjc9i8tVh/r4?=
 =?us-ascii?Q?OY/SxA1ex7h/RCQI+afC7s6B01X+r0U0YBJmdePtQuihpEl9Y6U7oylH/nHU?=
 =?us-ascii?Q?J+yX6iZAD9LAx4KJkUNblSVZpI4fWVHtfST8kYp/YLsfY4RaWa8hVBp0dE7X?=
 =?us-ascii?Q?d+wnf2A9NtsjdgEE2DcnGdqxIKA+luck3yim+Xf6j7Qfv0vGF/SSgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:29:08.6947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a435c073-413a-489d-e89e-08dd625cf1b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194

All the memory management specific registers are initialized in enable_mmu.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - HTCR and HMAIR{0,1} are not set together with the other memory management
registers in enable_mmu()

Similar changes are to be done in arm64 as well. I prefer to do that in a
separate patch so that all the arm32 changes are kept together in this series.

 xen/arch/arm/arm32/head.S     | 14 --------------
 xen/arch/arm/arm32/mmu/head.S | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 4ff5c220bc..50da179f81 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -218,20 +218,6 @@ cpu_init:
         add   pc, r1, r10                   /* Call paddr(init func) */
 
 cpu_init_done:
-        /* Set up memory attribute type tables */
-        mov_w r0, MAIR0VAL
-        mov_w r1, MAIR1VAL
-        mcr   CP32(r0, HMAIR0)
-        mcr   CP32(r1, HMAIR1)
-
-        /*
-         * Set up the HTCR:
-         * PT walks use Inner-Shareable accesses,
-         * PT walks are write-back, write-allocate in both cache levels,
-         * Full 32-bit address space goes through this table.
-         */
-        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
-        mcr   CP32(r0, HTCR)
 
         mov_w r0, HSCTLR_SET
         mcr   CP32(r0, HSCTLR)
diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index 1e2bbf0c82..8fa74bd556 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -279,6 +279,21 @@ ENDPROC(create_page_tables)
 enable_mmu:
         PRINT("- Turning on paging -\r\n")
 
+        /* Set up memory attribute type tables */
+        mov_w r0, MAIR0VAL
+        mov_w r1, MAIR1VAL
+        mcr   CP32(r0, HMAIR0)
+        mcr   CP32(r1, HMAIR1)
+
+        /*
+         * Set up the HTCR:
+         * PT walks use Inner-Shareable accesses,
+         * PT walks are write-back, write-allocate in both cache levels,
+         * Full 32-bit address space goes through this table.
+         */
+        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
+        mcr   CP32(r0, HTCR)
+
         /*
          * The state of the TLBs is unknown before turning on the MMU.
          * Flush them to avoid stale one.
-- 
2.25.1



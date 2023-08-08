Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3FA7739D9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 13:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579638.907707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZe-0005p0-JB; Tue, 08 Aug 2023 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579638.907707; Tue, 08 Aug 2023 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZe-0005n0-GY; Tue, 08 Aug 2023 11:08:26 +0000
Received: by outflank-mailman (input) for mailman id 579638;
 Tue, 08 Aug 2023 11:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psPu=DZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qTKZd-0005mu-8c
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 11:08:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e22fdd38-35db-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 13:08:20 +0200 (CEST)
Received: from CYXPR02CA0013.namprd02.prod.outlook.com (2603:10b6:930:cf::24)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 11:08:13 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::ee) by CYXPR02CA0013.outlook.office365.com
 (2603:10b6:930:cf::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 11:08:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Tue, 8 Aug 2023 11:08:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 06:08:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 04:08:11 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 8 Aug 2023 06:08:10 -0500
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
X-Inumbo-ID: e22fdd38-35db-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l46pOAumjyeX78+zlSS9q2c8A1hOLH0rCZ88GS2nidC0sr9Me5WGMYOvof9LCSpYMtj8nhzYr32hPfRNv8v9QLAzZoTBNpyEvRJ+cQEXPIxa60Ub5Ltp09JBwi3I0ohCzyKf4V+MF0mPQ10124axr3t7oyvys5T9PCFHG6ZTFNsTm8Q4ZNWVATU8Zxco2IM7fM1vReT/h4Qo9T8BZTJ/MdfH/FZ1eHqLS/cexJPorwr5sTbt5ZpurXdbm5qTkB2TQsz6SnTsTU4WSvBJuuz1mkjDQXjzo+I7KpJxRPaOBnbnMC9OIAyLVZQK5MfdeyTPqACcVOPyYoBMVbEC+iZjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi0xi37ivdqnavovEZwHm4E3+cicdkaCXIVkuc06OwA=;
 b=bxLquCMPOJEsu3UToGYj6I+smSMyevVetq9buA9Qd8dC0Rawv+/KzJujt/1/U1NddOMbFOv71qApArvnGChzb3UZpgzAicpRdcuhGsugce1JuRNtH84+0NMEJSHWcPlpJnviZRtKjuTXHISeDjJxLV59GdvpgnGsX+YeCeNMfnQUjq3zWLREK7SWaw2CXpYPqBXoClMBp21Xjs2ZTq+ejn0wzFLvQmhMeALzW+jfJTEYPXS1CjVho5k5OQkxSp7oV4/380VpkstGSBfg2lTCrttneboRw7tXadoAy12d/hws/xm9cyX0mh7gZyeOnLfyAwNq2cmuRqoEKsjGsEVTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi0xi37ivdqnavovEZwHm4E3+cicdkaCXIVkuc06OwA=;
 b=HNJk65u0/Ml03Jg7YVgXruAYeNiSdy5BQQcwyTfgTwZ13W3vsRClEQ2DWGpqbHCB5CYcMulfqqYJWmJ3P7vEQg81R05pnBOC52tf4J4IXaCakb52mCwgtSsFzoeauScx+sk3HfvrKwpzBAxOQcXSlsJxi6HuJGuHJKoHMhKMGS8=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: head: Introduce a helper to flush local TLBs
Date: Tue, 8 Aug 2023 13:07:39 +0200
Message-ID: <20230808110739.1296-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: f24e20f8-192f-417c-2192-08db97ffc18e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B0P1CZDQni3sh3uR2xhjue+eNo6UdVIkRFgQ6Zsm91UczCyfNdKpQ+hFml8r/sNo027WSXHu42Q7Krmu2tlhL9vdsRfNcUfVvCfLzoIMHJL5EJCCOnTlJJMOU5x3VR2VK31geNTCIEmkIK+Kf4pHMtvNpCrLXGBgBlDuuF0tbZWFpBiR2doofbrmirhr/MPkZz+F8VSQt2wA3+9bgsDKI+mjkNHsBsMfzNcf2ZfbXgQDB7lPNdiuRYvmVtxNveOZzsgEr4nDRmyDBJJgqSC/SicQ3A35nVMSwB1HDgivR2KnZLci1saLrHLY+Zqpy7f2N7ge/EnnbCnsY/hGJwNOq+cjEDjxKZ2iS6B3FizidoncFg8+IezIFvcUlftl3nTa+tjQ05wldiCF+d8cJQoI4UOJNg1nHT0gdMqiRjf/o4W4VxlHqKhkjfvOKTPQ859it2RASznbB87na7o8/aLYlLi6ANoOu4D3E1LukDJ3mxricY4Om86BSblifmOlYj5VfthNTaic/04kmAP99QWcoK+c8v8e+SBCH+BjjRP+Jskxbs4LMP0jrmGOAKlJAkaSvdagoGmAt/kF7KLCNr1ntC4xlV0YfuTJ967ZWob5m1SMG1HdLBOmz1NHG0qc8OFw34YbrWciO6BvE7y1J6TwG4RNEF8sfDoN5SUK5sfRfmb7xVtGniroTbszOOu8LP9iA6kua7rq2kd+El3ST9dGsp0AK4onmfpJQxI+EvrJV6zvVbAuhXMT1eQS2HjarHpMLbghQ4Mro84Ew54Pj9oTKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(186006)(82310400008)(1800799003)(46966006)(36840700001)(40470700004)(40480700001)(2616005)(40460700003)(6666004)(356005)(82740400003)(478600001)(86362001)(81166007)(26005)(36756003)(1076003)(41300700001)(5660300002)(8936002)(316002)(44832011)(8676002)(54906003)(2906002)(6916009)(4326008)(70586007)(70206006)(336012)(83380400001)(36860700001)(47076005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 11:08:12.1735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24e20f8-192f-417c-2192-08db97ffc18e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

Instead of repeating the same sequence of instructions to flush the TLBs
in various places, introduce a macro flush_xen_tlb_local and make use of
it. This is similar to what was done for arm32 by the commit:
dea9dddeceec8a1d68da24b14d5b2396effe555f

This is also making the flush sequence in enable_mmu more clear and
consistent.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/head.S | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 31cdb54d74e5..8bca9afa27b2 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -136,6 +136,18 @@
         add \xb, \xb, x20
 .endm
 
+/*
+ * Flush local TLBs
+ *
+ * See asm/arm64/flushtlb.h for the explanation of the sequence.
+ */
+.macro flush_xen_tlb_local
+        dsb   nshst
+        tlbi  alle2
+        dsb   nsh
+        isb
+.endm
+
         .section .text.header, "ax", %progbits
         /*.aarch64*/
 
@@ -721,8 +733,7 @@ enable_mmu:
          * The state of the TLBs is unknown before turning on the MMU.
          * Flush them to avoid stale one.
          */
-        tlbi  alle2                  /* Flush hypervisor TLBs */
-        dsb   nsh
+        flush_xen_tlb_local
 
         /* Write Xen's PT's paddr into TTBR0_EL2 */
         msr   TTBR0_EL2, x4
@@ -786,11 +797,7 @@ remove_identity_mapping:
         str   xzr, [x0, x1, lsl #3]
 
 identity_mapping_removed:
-        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
-        dsb   nshst
-        tlbi  alle2
-        dsb   nsh
-        isb
+        flush_xen_tlb_local
 
         ret
 ENDPROC(remove_identity_mapping)
@@ -872,14 +879,8 @@ ENTRY(switch_ttbr_id)
         msr    SCTLR_EL2, x1
         isb
 
-        /*
-         * 3) Flush the TLBs.
-         * See asm/arm64/flushtlb.h for the explanation of the sequence.
-         */
-        dsb   nshst
-        tlbi  alle2
-        dsb   nsh
-        isb
+        /* 3) Flush the TLBs */
+        flush_xen_tlb_local
 
         /* 4) Update the TTBR */
         msr   TTBR0_EL2, x0
-- 
2.25.1



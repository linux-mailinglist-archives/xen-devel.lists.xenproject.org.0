Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE1607ABF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427742.677140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0Q-0001qs-GS; Fri, 21 Oct 2022 15:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427742.677140; Fri, 21 Oct 2022 15:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0Q-0001nL-DI; Fri, 21 Oct 2022 15:32:18 +0000
Received: by outflank-mailman (input) for mailman id 427742;
 Fri, 21 Oct 2022 15:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0P-0000AU-1Z
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89796854-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:14 +0200 (CEST)
Received: from BN9PR03CA0408.namprd03.prod.outlook.com (2603:10b6:408:111::23)
 by DM4PR12MB5343.namprd12.prod.outlook.com (2603:10b6:5:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Fri, 21 Oct
 2022 15:32:11 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::8c) by BN9PR03CA0408.outlook.office365.com
 (2603:10b6:408:111::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:11 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:09 -0500
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
X-Inumbo-ID: 89796854-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyC52lAKrdJCWtQeH8ppbu9A/YSUSSGN48VtUYdt2T5F2MtHym4wyo9/RpjnhsHFc3C7uFp31ZSqjR9uqhXFrM2sMGJ6DLWJp+e+rXezlHsQOc82hjKqEEK7hTRuxRtMMyjSA8V8QjnE2zCGw/YeRB3TzUjONzQd6rakOTzpmklfTTG4Xjg+DadjlTRStmKHSP7NDT+i4Ci7NSbjUH5Pe4CGUa4/9bRmYRRyMXrO2ofswV/BxJnGj6b0mNsR/60swda3AjMTr0W7u6+p8hI9IrIHPKW2sUQ6MaJYK0iN+7R5FYfQnvd+OUMfRFimoIQWqZT5nzEHwTJMnFDn9dyLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPgkkVq3jzhGPzK3vFYET+rhULKJ5e0Fp+JMaHHlwXk=;
 b=ffbSuDT4lJ7MYatfzhwu0WEmw0l3QTQF8z2U5FGQgXNnx1dLoqGb/DC+S5TxAYVcbGeq3jEmpF9xG+Kp/DE5CqotERWS3J++LVV16f2Fj9Tym0Ece61761531EGWpoWS1uyPfLeLOnWxAgqAWTVSQ6U0NE3adiLAhcfXrCxkqjNoInkA6Kvt35PYJIQiohtG3b1U6KNlhMXqLpr+ZOauqSI6JqejO+/rjN5y6w+tu1Uz2CcPJK51uHaJpsHAmyszDwE508dkCYzK9ZhU/UH8oz9LzABs+zDn2OaJqFN6cx7RlIld5Gg+I2aHqSRZJFMEj/2pq4EC1CYoTGbm3v6gYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPgkkVq3jzhGPzK3vFYET+rhULKJ5e0Fp+JMaHHlwXk=;
 b=Ulyy+/odbrQ5n+fTBLLIhzw+GIso9i34NCn2++zW+oSLk8uxgY5J4Lsw61vZTJg+t0Ysa7kdlD1TlESt4d4I4+FXjBdNzAjUdHwnIdZFgkkpzJ3UeFIkajMMyXrDFLrt/dtNJYOjm4cvzrdm2zucZYliPb+kxoJCERMV4zUnu54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 05/12] Arm: GICv3: Emulate GICR_PENDBASER and GICR_PROPBASER on AArch32
Date: Fri, 21 Oct 2022 16:31:21 +0100
Message-ID: <20221021153128.44226-6-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT004:EE_|DM4PR12MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df10cb3-4e2d-421b-79bb-08dab3796c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l9GOfyapDhb4HMYPkXnT60+LCACh8lYXr2DoeXX57VFfW1/K18LQVYcyDu2Q/zBG3cG/azTDXpXcpcMxTgmDMQVLtgFTMi47Icndmev5W106/5N5u7+c6GwRuBSCbZkcmMACR17WuN8irt/QqKQJtdgDkP4zu02HjV86WSGPQFCL76RnFzIdyts58q3hxFu3IIzU/WF8pJPuoW/u3s6Tn8aJdH1bMp6ZdaOMvzj6jZEvQ2l1Oyw+ChCYlsfFvcjkMStIBehX30/XxwcIw7U3FRz25nu3lqMEG18Q2wgzgK8cxEw58bD4MnApS66iJt7zvTMUggr0cerpEJxNXso63TdrwcH+rDjqdPR+CzJmBQs24luNrddOMoQecNEFZ1S6IoAEClVpVMrJNRWSi17LMtwv26zu2qVjkNSRpfud6AkCEidjMTnQ+v7ohHTWfC0GQrbWIQ5pSVRud7OHOPymlT03v6s0CBomzl5oSf0G09P0B8bEHXlzi5F4Q/tVkd+bPlh/RRn35uaPaJIhd3KA6dsRlvvM2zA1WWn6o4PLA2uErOC4msSeYxNDzC3hrMLR/I8RQVLR11VWXghOhEodT9fhb944p2qcIfEihffAA1T7oUvWaO7bGxlSszez6Fy6f4xxb9kH/yS7C5oxNyeIkad/njt9Uvf81P7K8eHbwPeKEdrzL8lkEsCLt/Ba6+k18YpzQv+ddJLWiBdLtuZ/IqJoxg+8mEs0ZgiT6dnMi+oA77hL0/i5ruNzSHDAH3WzkRelGcmaREb1M9P92oVLArqW5+hVPLaWAe0g1mG3vmd5tnT8kE7vcKPbtQNu13FS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(2906002)(356005)(47076005)(186003)(83380400001)(26005)(2616005)(81166007)(82740400003)(5660300002)(426003)(1076003)(8936002)(82310400005)(8676002)(40460700003)(40480700001)(336012)(478600001)(70586007)(6666004)(4326008)(54906003)(70206006)(316002)(36756003)(6916009)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:11.7628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df10cb3-4e2d-421b-79bb-08dab3796c6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5343

'unsigned long long' is defined as 64 bit across both aarch32 and aarch64.
So, use 'ULL' for 64 bit word instead of UL which is 32 bits for aarch32.
GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 16 ++++++++--------
 xen/arch/arm/vgic-v3.c                 |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 728e28d5e5..48a1bc401e 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -134,15 +134,15 @@
 
 #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
 #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
-        (7UL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
+        (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
 #define GICR_PROPBASER_SHAREABILITY_SHIFT               10
 #define GICR_PROPBASER_SHAREABILITY_MASK                     \
-        (3UL << GICR_PROPBASER_SHAREABILITY_SHIFT)
+        (3ULL << GICR_PROPBASER_SHAREABILITY_SHIFT)
 #define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         7
 #define GICR_PROPBASER_INNER_CACHEABILITY_MASK               \
-        (7UL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
+        (7ULL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
 #define GICR_PROPBASER_RES0_MASK                             \
-        (GENMASK(63, 59) | GENMASK(55, 52) | GENMASK(6, 5))
+        (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
 
 #define GICR_PENDBASER_SHAREABILITY_SHIFT               10
 #define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT         7
@@ -152,11 +152,11 @@
 #define GICR_PENDBASER_INNER_CACHEABILITY_MASK               \
 	(7UL << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT)
 #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK               \
-        (7UL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
-#define GICR_PENDBASER_PTZ                              BIT(62, UL)
+        (7ULL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
+#define GICR_PENDBASER_PTZ                              BIT(62, ULL)
 #define GICR_PENDBASER_RES0_MASK                             \
-        (BIT(63, UL) | GENMASK(61, 59) | GENMASK(55, 52) |  \
-         GENMASK(15, 12) | GENMASK(6, 0))
+        (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |  \
+         GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))
 
 #define DEFAULT_PMR_VALUE            0xff
 
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index d86b41a39f..9f31360f56 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -254,14 +254,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_PENDBASER):
     {
         unsigned long flags;
+        uint64_t value;
 
         if ( !v->domain->arch.vgic.has_its )
             goto read_as_zero_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
         spin_lock_irqsave(&v->arch.vgic.lock, flags);
-        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
-        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
+        value = v->arch.vgic.rdist_pendbase;
+        value &= ~GICR_PENDBASER_PTZ;    /* WO, reads as 0 */
+        *r = vreg_reg64_extract(value, info);
         spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
         return 1;
     }
-- 
2.17.1



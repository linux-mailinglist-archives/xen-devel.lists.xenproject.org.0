Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE456139C6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433029.685896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUS-0001fT-CZ; Mon, 31 Oct 2022 15:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433029.685896; Mon, 31 Oct 2022 15:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUS-0001bx-7h; Mon, 31 Oct 2022 15:14:16 +0000
Received: by outflank-mailman (input) for mailman id 433029;
 Mon, 31 Oct 2022 15:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUR-0001KF-5W
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adb57d79-592e-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:14:13 +0100 (CET)
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 31 Oct
 2022 15:14:07 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::96) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:14:05 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:04 -0500
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
X-Inumbo-ID: adb57d79-592e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWYDt+Z0+ma2pcDsHZ8sruvDwsBN81x9WyPCYEHm/TT/hrWMbPzOgWkfma1mHh+TKMcJPRU+4RDLtMZ2ojiWYoSAB/Q5c2y2798NkncAVkJj9RDmM5DxyaVl7+sVlgIY81x2UFFp6TNZHGLnLi/u6hO87IpEsdsEczeggwBj+MojaAWL5M9nGFq9ADPQDZznNPz5PX+cGHNDqg/VewbcId046Brq8ED5KFweEfPACaO8TpdmxHkloLQmIoh4ceKkJWL30KPxV9TE155pO5zxCLSnxxuFppSeglvNdfAE8ukak56V5u+DKKyooxWtElHp00fbBgxmpQSqWJ2Lrj04mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2SYspWuKTsvpT2QlqYFUE+9DLCWCRfTo28SXIdKHbk=;
 b=CTpQiRNk0waZEB/63VlNoupnlzMlRYD2ktfz+K7F+JCvnJ0vMGZ23pyB657v74/Qi7oDx8rFB0Vqc5GrCz4W1u8xT+LPAGc+4QgLu/1F9OaLWTX3Os9oitjMsZ4v7G6+YVE2LwfbOFm//MGdeVq1MgdPmOJ2JJhXJUfMI8x9BUcAr4X/ITxdT9FnhRVF0e35FCPXYQz/g36V0PT+hmAVvBedhIW1UH9naa6W09Ktf5BRYVdIiRqaV/WQxTbs70FoiM6+JWx+n1h6BVCQW9hCZ9QDAh2yfrD1OW1xS9TFPgzGvgcjpQkGPa9uYNnjCNMjLigJbfQKOyLDA6QxyqxFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2SYspWuKTsvpT2QlqYFUE+9DLCWCRfTo28SXIdKHbk=;
 b=Gz3rQQEoxM4fbtT86aSjrALBdxSPz+Ps9bqGlPedLHYpAlYoOOEPbiJHeSC1pg+xg745RGEEHYnfpmPxbIuZqNpLWwCxEkUdy+dXeyI2kEd5bO4ex8/y2eXMY8OvjgSfpNWT1UJW0ZF5MxSM03Rwqhd5KcvANDrUnFUDV4Jexl0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 05/12] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host
Date: Mon, 31 Oct 2022 15:13:19 +0000
Message-ID: <20221031151326.22634-6-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT009:EE_|PH7PR12MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 307c3c1e-15e8-4f41-aba9-08dabb528e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TlK4wcFgSFOPXpOkrK2fIndMYOWSf1ZOelYbkcKkHcNePuXYuKO2U219YIBunza7jxV4y2Lr6lGaj93JJV/mx8tE/m7xckyJdkXg89ASK3JL1zR5h5fCapwfOpupOfSbhdwJqMDZBnl8EJdcGN9quRWKOuWNkDv9L7UqQaC4e1U1IuYneGjgTR2Hxj4WzRsvBu42MWeWe4WWR9WCqfsuWPvezrsy7mMa8vYg6QfBiz9bBjrx/1ChYap2bQGfWxRJK9tyQh8/Gp0O/lFVG5L+eZ+avrYAqkDYCKoKTtbEEGEXd8YMSesH1padbeJ6UolAjkeZ7uaujLIpciLaibEfyAAJb4wYq70PKL3b1AyOU/oe820voKeMBBl3V51S2puSn6j1p3BWq60DplHWeU+I/BIwZooU+tNyvyEMXyl4BnaR/RCQwl53NWqKV2wWZK60c2twSwT4A3wIa6IwCd7aQSvYOLwtJkuBMezFI2Q5rnH5WlRnmSXQf6iAUk3Erfs/HcycHTJ/I+I02hOtvfFluNqMMldIu9ueKZeIRgIFqA+ZkOj9ztxpYmjLMPCmAswjcwCGOL1vidsfg1hzCv69OKhBhQAovJCzmw+0VIHfJXg2jwjZZAuTQekWajvfOILJXJwBjBG+tjA8CYExVkjkUDBjrJSxPAs95anapA4sjENw8LTFKlz8qWT6bgr895QYwpNURmrXSy9ltJ2BJD70i1/yOcVhDSeaI1ecfoV++z/hiUPWdYbJ/KWIavrR1NnLWEKu5YpgJvmt9JifyXqtp+J7FAqOAa1n6fftCO/YDklWldqa/Klom0QOjmjrqajUt0ciq+oGbm8XZG5CQwkY7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(82310400005)(81166007)(356005)(26005)(40480700001)(41300700001)(40460700003)(4326008)(8936002)(478600001)(6916009)(36860700001)(5660300002)(966005)(8676002)(70206006)(6666004)(54906003)(70586007)(316002)(2616005)(186003)(36756003)(426003)(47076005)(83380400001)(336012)(1076003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:07.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307c3c1e-15e8-4f41-aba9-08dabb528e23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587

'unsigned long long' is defined as 64 bit across both aarch32 and aarch64.
So, use 'ULL' for 64 bit word instead of UL which is 32 bits for aarch32.
GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from -
v1 - 1. Extract the bug fix for incorrect bit clearing (GICR_PENDBASER_PTZ)
into a separate patch fix.
https://patchwork.kernel.org/project/xen-devel/patch/20221027185555.46125-1-ayankuma@amd.com/

 xen/arch/arm/include/asm/gic_v3_defs.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

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
 
-- 
2.17.1



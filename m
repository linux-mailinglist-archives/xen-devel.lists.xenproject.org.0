Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC163AD14
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449015.705655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVl-0005h8-Fo; Mon, 28 Nov 2022 15:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449015.705655; Mon, 28 Nov 2022 15:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVl-0005dX-BJ; Mon, 28 Nov 2022 15:57:37 +0000
Received: by outflank-mailman (input) for mailman id 449015;
 Mon, 28 Nov 2022 15:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVj-00040T-JA
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:35 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eba205a-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:57:34 +0100 (CET)
Received: from BN7PR06CA0061.namprd06.prod.outlook.com (2603:10b6:408:34::38)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 15:57:31 +0000
Received: from BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::8c) by BN7PR06CA0061.outlook.office365.com
 (2603:10b6:408:34::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT097.mail.protection.outlook.com (10.13.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.20 via Frontend Transport; Mon, 28 Nov 2022 15:57:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:29 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:27 -0600
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
X-Inumbo-ID: 5eba205a-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ5rZPyrnBy/sRZm1iWHr4foSonbs4ZHRq54MARnLXQyLdQ5AG1LZV2rYPs5Codmry1eC4N+5d68pqK4fSpXvi7/NimftBvPCVUCjoesCOLQ3QI3ubC2z39DMRAPg7jJ7pXiCAeXoO2SGRCmUMkx2soVBqrzrHPBHcWP3Dl/aTnHJVmte35q1CtDBsVfhSU39pjjJM0nYjt7jJeDCcJuAvuLGQPPtulX89ezaYqde4kqWAWaeQep7w412JOjtvOy413YfzkxBYPaHAHCm0he6wCiOc9v7pg95TIW3+Rin3geOrxDqcdVoVCIPQwZ1m9AhEtj/GxkxFp7yQX7uuJ4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTBusEydfO2ISdBhEpiWD6caKDOMEqvYCvIwqAcCI+g=;
 b=SG9QD/SY5+7MILfBHSbkcU57Nvmn5AS+8xNAAYxUvNJJgSpb1rhk01Ak0v/uC8u9ekgHExmcIiTV0l2GNs6FjdmgAW+NLo673ElFKdcxThET9apEZYatnpssnMm8oL32g3KFNrYaTrnz6OQqJfEuTl+EFKg1GbMJVCt+w7N0OZNEa4QQ1tg1HI4SJZvmrCzp4KzZ95tN3bpr8U6I43eaU98xHrJOSj5rTf1tboMRkr3oASxjQ7+oqZtd0LGFIhyEPni60RDkKZXX4lGjfrl39exRjKoGU3MCTAwGSadWVulhmMnB4Dg0eQ1bdIf/ToybgnlYbSrtRxlh4xLdgNovIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTBusEydfO2ISdBhEpiWD6caKDOMEqvYCvIwqAcCI+g=;
 b=w9PSs9iJW32Q/gcho7nIItWWjbpOen8vm+/JN3Fawh0Jnk6ZAVAaxrkHN6Dmoqyz38ssNFHEZPgOgI8A7dYSNSS29gMYIFIR9PTUP+S0T/4SarOfHKuXGXztBz03h1swyumPpaH1gh9JyjSiKXha6dDluLtFXCX2EqFTryVkPVU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 05/11] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host
Date: Mon, 28 Nov 2022 15:56:43 +0000
Message-ID: <20221128155649.31386-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT097:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e48ecc8-166d-4124-4378-08dad15940ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnJnLXPTFmcQVp9uXfKjMLyPxrW76McqcwJJWcsLDLajEafGG0JLdFSGMBpRhtqYVl1CfB8N5rQ9f++GnALgfh1mqtbItF3b5AR+late5pS8L41zT/Z/OdZNhJ91FN2+SOVRo/x3NO8Pj6OdVAPaZ82GlIKEZ/2aXoCwa+KwSFQLyoKFSq/L/pUM75syg2nVijhE2CybhAw9puiqaZ0AEKgrM58J9nPSadmf+JbSCNa0bbC6g4Jc8zuLsUqlIZVp40yM6c9kqiQzAoQPb89VzcXkSTYKZXWOFYVSHBJW030smbI/6IJlwyiaC3iyd0+nzywgYsy7hYFgrT7yYOSvM9L0hBsAtGEd7WYZmlEBK/k40AQWwoH8EZBw0eRWhnW+NWNuRnaL7WlgGeHNTzWAZCwF1sDV1hhATMcIttnAQJ8LsPuihLqBW81FeyKJ0ACIWjeEfOj4r7IaPO1ADbVkNvl8te4Sd5DfjLKJ9j1exW5ByzQd7jx98fFAjzYTh/3STN9AX8+An0qa7qqLGaB5wR8opw+n+L930rYObIbJxzSOlyhWs2bTqI84vyxduGRySRtT3mnkveBo5VXiNuXKrlE1jDWm02+JNBalMHq2vzIXh6B8dJjKVoVU7OpaQzk9ExA6uCQMNgY8J0PWyU8KInxPY1SqIl+UHgIn2s9QtAOPeqDfa2YenYo6i4ibHtazTATki2L45nzLZLZqUakNKilu6W/6iKpjTRCAI7yRidvrywk16zT3iOOLtWENDBB7ICb/5vGxBfrxuoen7K3hSA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(36756003)(40460700003)(103116003)(2906002)(82740400003)(36860700001)(40480700001)(82310400005)(5660300002)(8936002)(41300700001)(4326008)(83380400001)(47076005)(81166007)(356005)(966005)(6916009)(54906003)(478600001)(186003)(316002)(26005)(70206006)(6666004)(8676002)(426003)(70586007)(2616005)(336012)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:29.7528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e48ecc8-166d-4124-4378-08dad15940ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

'unsigned long long' is defined as 64 bit across both AArch32 and AArch64.
So, use 'ULL' for 64 bit word instead of UL which is 32 bits for AArch32.
GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from -
v1 - 1. Extract the bug fix for incorrect bit clearing (GICR_PENDBASER_PTZ)
into a separate patch fix.
https://patchwork.kernel.org/project/xen-devel/patch/20221027185555.46125-1-ayankuma@amd.com/

v2 - No changes.

v3 - No changes.

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



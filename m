Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E21625CCB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442572.696896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrO-0000Er-So; Fri, 11 Nov 2022 14:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442572.696896; Fri, 11 Nov 2022 14:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrO-0000Bg-O2; Fri, 11 Nov 2022 14:18:22 +0000
Received: by outflank-mailman (input) for mailman id 442572;
 Fri, 11 Nov 2022 14:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrM-00085I-Pj
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b08522b0-61cb-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:18:19 +0100 (CET)
Received: from BN9PR03CA0379.namprd03.prod.outlook.com (2603:10b6:408:f7::24)
 by PH7PR12MB6540.namprd12.prod.outlook.com (2603:10b6:510:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 14:18:14 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::bc) by BN9PR03CA0379.outlook.office365.com
 (2603:10b6:408:f7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:14 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 06:18:12 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:11 -0600
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
X-Inumbo-ID: b08522b0-61cb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6cheBqbLMxEYuEXVGvabVtAQVqbUE4tmBDb9Ui+8mXe72bYdF+VxDpmcMVPtWv9Hfn70BfU8F4DLoe/ylDgHCUrJTLBK+XzrY8Vq8AapAX+S68DDEb8ZxP0VNs4JP/iuCIkR9Wx+ykBFB83Uq11Dqv1v2rlTG0H9JhgbTDfkkr55Chdz7cPqlHNGarXP/VSFfKgfGL2NZygaCF4Vn9IZllK7VXhRMHI3UX2GQDWt9h+Dx0Atz7NQWPVOtOD0aCJHQfKHW6FUOtqufmx9lBuSaV9+Ud6Ric7zET5OsxZdrrMcdafYTsncSoi534yiJoGOj8lmpJWpZRyEmm26wU0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OPx6FJDxVrIqVmDw4a5rdKvuGJuCxKW/GJwYRzDB0Q=;
 b=mgQ/L+bt2iZqha1ttrcKZW4QXnBUgHjzBBBHVlfAfKqTyS88XfvGajHhm577syO3sfNlxE8bRAEVAxve1iLNVsbiuHAzfjdGZ4hc6pV35XaZ7/QTggoEeDh6wU0PoJxmWoxgvB+oxpQpih7beAlii4OSz6X94wzvg62/ohw8sAyGUJeOu+qu2eCTu/3e7PEa32kG2ES9QM3qWEPcmmChCmqubWw3gS5XYb87wNQvLlKP35+PieVsD9sgD/Yn/cAsxrcSbr+w+O9vBmy5uMwFn3zviWxV3l7T/gNcmq4xk9ThrnPeMRSTqI55NALZcSRiG+lcRohNpt0LvfN6gEr+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OPx6FJDxVrIqVmDw4a5rdKvuGJuCxKW/GJwYRzDB0Q=;
 b=smSyzRbkL3mpn+WU9nhNPpx93hfFSoKgVHxUf22L3uGKHYztvDDWEr4lmsHDDkqkIuiyzRY2ACQQbAl3bgN2b8mm98xZr7irXte1JqyPZNAh4+Skx1dan6R+pXSMeTmruItAuxdUXU0SVKldvCiu4drpeoGj1U5gRPXCShsg79M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v3 05/12] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host
Date: Fri, 11 Nov 2022 14:17:32 +0000
Message-ID: <20221111141739.2872-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|PH7PR12MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: aab0ecc1-79aa-4d9c-1e31-08dac3ef9223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+ZTliEPG2YElirV9Voc9p+RkKXR/sm8Riqk+UsdGNzTGSqk6C37IXyNL3e3028VG2+joh4DQZg0SfhNibS493NWdPXzREQzEwFOWa5dXAvUqZOAAdku/v79e4tJkZlPHMbep86e9LzK/oZ/A9t/E4v0V6OdM/lFm5fhpW8j49gI2VpcfaEWVk01IH7cjr0ug0FVf2qKbCTuLglcr87JtDZYo+CgZRx7ZZRHDGFnSVlkdvZgaD55SBT1ISCeZbJQIW95FrBhbohs1HYGZvQc6myGSTf0KRzc55wVYAEsQ9KTX+3pZzoW7/032X8qI52RtgD4eEUzJXLKLmzt7iop/cnkJxquAi8O2mk4GpRggNKreCU2Q5GLonX1YnihifvSijLjJyp9XG80G9Y1oGBXg/irwtchxBzuDQ4B2IPeizqNgR3U5vFyJPeZkkzhgS+iw4QLGOXWEIJYJVk+KvBNeRp0MA+9n/8S8GrNtASV9X03zebufOipyBRkN/YRlf0NLYSKDgFnvKeYR0TNScUVAkeZgj9YtWndHKihoMIk+20Gsey+d5lQyTkngpnDFtxTz9EAHybNKcx/6g3fI+kz2EOFO9VDrLC6959rnMtjBLzTYupMWM9g+Tmle+WXW0C9AcLLe8ydzJoqsSsHRSXcjJEWUS6Jzq7CXhIiN69b6qNh36IXOQCStMrsRJ5dFTvYV8f9HzZ9CRPKAX+nQ2tYPp11E7lGwrjefkFXqx4XnfqMXEDXhxAtT1U08Nv7pmC88KvSJypJ6S54nZF6zS+PyMZ7ZbOSGAerBVM97P71PJqSAT4QDoS6HpVnBpOsCprRw3kn6aY2HgmikOeekA9Xmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(356005)(2906002)(81166007)(186003)(86362001)(82310400005)(8936002)(83380400001)(82740400003)(336012)(426003)(103116003)(47076005)(478600001)(8676002)(70206006)(40460700003)(4326008)(70586007)(2616005)(54906003)(966005)(316002)(26005)(36860700001)(41300700001)(6666004)(6916009)(5660300002)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:14.2252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab0ecc1-79aa-4d9c-1e31-08dac3ef9223
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6540

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D32607ABD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427739.677118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0K-00019k-RF; Fri, 21 Oct 2022 15:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427739.677118; Fri, 21 Oct 2022 15:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0K-00018n-Kk; Fri, 21 Oct 2022 15:32:12 +0000
Received: by outflank-mailman (input) for mailman id 427739;
 Fri, 21 Oct 2022 15:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0J-0000nK-33
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860af235-5155-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 17:32:09 +0200 (CEST)
Received: from BN9PR03CA0672.namprd03.prod.outlook.com (2603:10b6:408:10e::17)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 15:32:05 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::45) by BN9PR03CA0672.outlook.office365.com
 (2603:10b6:408:10e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:04 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:03 -0500
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
X-Inumbo-ID: 860af235-5155-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5NlqKIp2AhLESUckS4yH+T0Ohi/XfCzEd5yvIohnxN/OV00rUc0xpXYcSdgEzuhlqGuUqwbtZiwyos2vdQN7vu9DCFjBl3rYCV71sNA6+/6ioq9AT9uuDf07vIJoFav8TOa9s03iaHG0PJY5d14XQs7+zYHskZo/RuUG6/8Nf9vnbMVpPCnzsF3uOg7h97+KE17TaWhaQzSwsIuoITv797nZaHPxMtmktS8K0N41ql3TwtM+xiPlyQDu7Qa8KFtE9xjHwTQH8ZxNiv6bFsB/vHltJqJMpME3LChm/5/+Nqq2Oy28QIIb1XumFCV94J6uyd8+zPGegKz0R5nYB6x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJMSyBlDQwvi9L8pMaAlcyuBO1JJuHAXtoeiZrBPh7s=;
 b=K3FEwDhy2a3PJp2oqwC6cJwgrnrn7WEtt8qOgWOtKQJZqHo0+gBdGxIXV1KpJWX4Q4I1CifVU6TPDoSUYZL6xl471fL/13Iehu2dlUsvc0P63kMU74cSgHu9mWPdLrYf3TPvR8hFC9a6TfGe71upyC+CR9YTnxP7jjSJpGRZPmTK14UZBDzSORv1/3hwb9l/y9D1wSZ6R0e0T+I+93+74RIRwpGKdfLZQXhg+eg4FP3bOFqi8PM6Uq/M5MbRaIzIqeexe1G1Sh6wA6mDxj3UODOMLw4LV2l2DDwt6JSoBqlQefUZZn26cZX/LXXc2BhJiZY+J48DNYTNCfibA+BwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJMSyBlDQwvi9L8pMaAlcyuBO1JJuHAXtoeiZrBPh7s=;
 b=3o0/SSfkbHhknX3IrVxL6bc0UGHdwMnsIQ/rlnsAiYczlhUuGswNln7Y0FmBNdS5SwpwTF7pXYxiJ2cS22GjHfcWlcQNof1EAb6NAzYuIXjG/9XkT1uYiKNR58F2VMLfEA27KAgsbnOT5HGIMw77gAXqWTsXTqRCrqcW+8G+xv8=
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
Subject: [RFC PATCH v1 03/12] Arm: GICv3: Enable vreg_reg64_* macros for AArch32
Date: Fri, 21 Oct 2022 16:31:19 +0100
Message-ID: <20221021153128.44226-4-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT045:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f385dee-6892-49c2-dbac-08dab379686e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pgVOpVJYvg1kjNgiGfm4vFwxKUi8YM199IJ5Y7gquURQM0k+AP1yLzh2rnQa6v1n7E1ckKgjTruXh1sY8RoX5995p4h7vRQ8mIRfWqmSriFeBfl/EPaWfukCLsOUCqcC1L1hMlFcfeW8qc4Zfefykv/yWTDBVHgxCMQHMeI++xPqTAbx4TStB2ewcykIk8E2x2qyl4EkD9mUT2VIPMtzr7BTolxq3K2rNbvNy1FFvw817MW4W/kV5cCNk4T0f/r/OZ+K7p2ETiuCpt/9m5S3i+C73uw8peQ448Iddn+4ZntKd+r5P2vXmRUkvSucVi0RdOlE9CbZD+5w6zm+0o+bvGFG+tlvYoGzj3D4Ud6QhfK4QnyGThGQbDtunDSLuw3fDopMkbLd4COrci3b53A+ydwKqJFfUrtyxrThjh7MEFfGE5gD0Z5qWaPjRQa6N2ME3vgIJwHVpBYVmLIlTEVEh+9RGH/WAj0Kk3at29oTuoRrO2uhxjYiF5VIug/9yo+Qn8dAYV9Pb8KjyIG409TrXseo+16lArBEmH4t7eQbtCvnGa8G2lfK9MGDs24djBXtwe1JK/bMwPUmxzOlgtsfDh3VR3nxrAK/I09qTQtUh+KasHXYyL7B0krTe7tC44CNHCvLrF2rfSnTBAbJodIYsK6DrhjQcEGLMZhe7aJNkUkQOOudVEnCHuym7e5PArtA1egMU7Vx9K+qOBThwZA7UZrSsSWI3rohIB/JfMzVg9WaOn6Ff+2VI5ZZjO5kygA5yHepD8icJvVBYK3D+hEH/2fuG3WRiCmAchu/FA1j4fE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(8676002)(8936002)(41300700001)(5660300002)(2906002)(4326008)(356005)(70206006)(6916009)(82740400003)(36860700001)(478600001)(26005)(6666004)(70586007)(316002)(186003)(36756003)(82310400005)(54906003)(40480700001)(40460700003)(2616005)(81166007)(1076003)(336012)(83380400001)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:05.0388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f385dee-6892-49c2-dbac-08dab379686e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281

In some situations (eg GICR_TYPER), the hypervior may need to emulate
64bit registers in aarch32 mode. In such situations, the hypervisor may
need to read/modify the lower or upper 32 bits of the 64 bit register.

In aarch32, 64 bit is represented by unsigned long long. Thus, we need
to change the prototype accordingly.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index f26a70d024..ac6e702c5c 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
  * Note that the alignment fault will always be taken in the guest
  * (see B3.12.7 DDI0406.b).
  */
-static inline register_t vreg_reg_extract(unsigned long reg,
+static inline register_t vreg_reg_extract(unsigned long long reg,
                                           unsigned int offset,
                                           enum dabt_size size)
 {
@@ -105,7 +105,7 @@ static inline register_t vreg_reg_extract(unsigned long reg,
     return reg;
 }
 
-static inline void vreg_reg_update(unsigned long *reg, register_t val,
+static inline void vreg_reg_update(unsigned long long *reg, register_t val,
                                    unsigned int offset,
                                    enum dabt_size size)
 {
@@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned long *reg, register_t val,
     *reg |= ((unsigned long)val & mask) << shift;
 }
 
-static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
+static inline void vreg_reg_setbits(unsigned long long *reg, register_t bits,
                                     unsigned int offset,
                                     enum dabt_size size)
 {
@@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
     *reg |= ((unsigned long)bits & mask) << shift;
 }
 
-static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
+static inline void vreg_reg_clearbits(unsigned long long *reg, register_t bits,
                                       unsigned int offset,
                                       enum dabt_size size)
 {
@@ -149,7 +149,7 @@ static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
                                          register_t val,                \
                                          const mmio_info_t *info)       \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
+    unsigned long long tmp = *reg;                                      \
                                                                         \
     vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
                     info->dabt.size);                                   \
@@ -161,7 +161,7 @@ static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
                                           register_t bits,              \
                                           const mmio_info_t *info)      \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
+    unsigned long long tmp = *reg;                                      \
                                                                         \
     vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
                      info->dabt.size);                                  \
@@ -173,7 +173,7 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
                                             register_t bits,            \
                                             const mmio_info_t *info)    \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
+    unsigned long long tmp = *reg;                                      \
                                                                         \
     vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
                        info->dabt.size);                                \
@@ -181,15 +181,8 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
     *reg = tmp;                                                         \
 }
 
-/*
- * 64 bits registers are only supported on platform with 64-bit long.
- * This is also allow us to optimize the 32 bit case by using
- * unsigned long rather than uint64_t
- */
-#if BITS_PER_LONG == 64
-VREG_REG_HELPERS(64, 0x7);
-#endif
 VREG_REG_HELPERS(32, 0x3);
+VREG_REG_HELPERS(64, 0x7);
 
 #undef VREG_REG_HELPERS
 
-- 
2.17.1



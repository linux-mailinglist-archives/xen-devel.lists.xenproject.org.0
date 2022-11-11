Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E43625CCF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442580.696940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUra-0001ze-Ia; Fri, 11 Nov 2022 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442580.696940; Fri, 11 Nov 2022 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUra-0001uJ-A1; Fri, 11 Nov 2022 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 442580;
 Fri, 11 Nov 2022 14:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrY-00085I-HM
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7559c7d-61cb-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:18:31 +0100 (CET)
Received: from DM6PR07CA0105.namprd07.prod.outlook.com (2603:10b6:5:330::8) by
 PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 14:18:26 +0000
Received: from DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::7) by DM6PR07CA0105.outlook.office365.com
 (2603:10b6:5:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT098.mail.protection.outlook.com (10.13.173.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:26 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 06:18:25 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:23 -0600
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
X-Inumbo-ID: b7559c7d-61cb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwjnwvzpgMxB8tmoZKj4AUdLg9rXsbqvvljkmZsMDwlvcQ1JLodgLZ0FZSF9d82kSFrlpRJXMxA4+dgJedBfDzbd+iE+s7EKC0BKABLDK85djIrOl7Vf87+Eob8fo+8Y7HD2pYOz2wmB7YcqOIKWiMOFVw/oHF6duBkIPbNI717M4wyW1/jEH9DC6H59PHgrIWAM+q/DkGvtT1/b5p9oeb3FJObOUgswpZqWjYkxdxJuKJyNUa++JJUlG+CJ3u0iYjx0zF7GOn5YdBs0a1s5XW9zHjXZHQdPfjojGVuRRhOaGGsNS1KGTaw5LuVvrqQRegNGPO665b1WNm9rRUJBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc5XsypOg79Sm/oGi7O9cX08XDJ7yyoeCUIF1WKA744=;
 b=KrYiGHy74/zYCuI46WM6wi5UQe5jZnk5p/4g3MI6/jzKFtmizcTQCrP8TsZHxeVGWRYY1mqf16gmdrSDOuKNw1XNPpI616cGlG1bOQwojsc+3X/+4ppdpbGKADOcggRMB8VAgzDZkxuwStxFvTSehx8Clu4Oe9lpc5R8Am3oYc9WuTGiIaoVaRQDPsaE8aotm/ZgyVyolDWgHQ8IAhcfai0uAYaA0NwnLcmQNqQ+AY7S+1mI7ZWBMwdyedtXNkIlas1n7NlFRppSkVA4SGD5DK2NrgxIHiz0E3LTVeCBKmsYCaWl8lwECskNiBrNpredPX+ncJi0iofOzItW7aqnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc5XsypOg79Sm/oGi7O9cX08XDJ7yyoeCUIF1WKA744=;
 b=fii/TbwheW5GyDJ+YE0+sHCXHSgrdolsBKSPoZz7BbjYT7kCDAe2GpNsSxHWo0b1531PCG65ri4Lot343Vmyy8ECZ3om0gaL0DumqKJ2pBWdzA2qhFoDc4oyoNPjFjxLq3GCDrL9ogVhk7CtUl5ncJbh3t4sXPJsTIjfVALGUjw=
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
Subject: [XEN v3 09/12] xen/Arm: GICv3: Define remaining GIC registers for AArch32
Date: Fri, 11 Nov 2022 14:17:36 +0000
Message-ID: <20221111141739.2872-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT098:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: edf990fd-4e92-4e8f-996c-08dac3ef992e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dE8bzmQ4mapU1jNtZNP2li30DMGzqwpSVleWnmxfaYFOp7CjjFohxEu0EgpVll7BrwcmQ0Kp+G9VlkPpHQiyYnKYndGo3IwlbXoef4o3bE1EaFE9CsG/05ctW2u1a4nYMt8lDcqre5l9nV7E1TdJYml7NYdU3hNZUKqgFiI/qYymM0ms41avTibJxRYiomn622W4DWTdTwZjUKMARMO+O6qa3tFV84YYG6RUd0foxOJjDpxURtSHhTIj6nxE+rlOpgGchx6GICg0wOMwClKK1ieEKOty0DFIdho23HJkiiUMdn05Rctq3IvyMYpIQu4zpMtsVJXU2Y6FaNy4IcmcqfX4fyjpRHb9CGYiJDcHq8fwxnMg44HkfnnumXJJeyfp7i44DKd0tfXohT7n7KAhuVmxf/bz9uJQFQQGhYlTH0DM1tWVzFB1xRbH8tkBl3vURLufmm5aiz1P7IxfZy+CEhjsTjQFUuzvq1fd7SkYilNstbZPXEyiW4J7dg9vHRwg5M/M+FixOpR3t1XanAecZLmgXCXfLppQ4x3FcI0QpBgw5jstQipS+EGKE58y/uuSNSDyg4RSFpucwTTv/OELPzA/huPDtC7a/fu6p6+Vhr0onyoGuO1cXvvZQ1r9Q6DzwP0xXVq93c15lPLrOvazP7ZSo9Q0t59CgR4n+bNijuEC9r7qqR85IQF66jUV03hAgaQfuKDFEhw3o2v4i1BpH2JiRvJsnaI7IuHgsdSgHjVFvgd1ghnWo64uTY0y3Zbhhl2R/bUB2C8GcXuFIr24exPpeGuVNt98hJo1jhnMUfStzhUXmYCWLm9K4afczc0F
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(186003)(316002)(82740400003)(336012)(426003)(4326008)(6916009)(36860700001)(8936002)(5660300002)(26005)(2906002)(1076003)(47076005)(6666004)(40460700003)(478600001)(41300700001)(356005)(54906003)(82310400005)(40480700001)(70586007)(8676002)(70206006)(2616005)(86362001)(36756003)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:26.0289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edf990fd-4e92-4e8f-996c-08dac3ef992e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975

Define missing assembly aliases for GIC registers on arm32, taking the ones
defined already for arm64 as a base. Aliases are defined according to the
GIC Architecture Specification ARM IHI 0069H.

Defined the following registers:-
1. Interrupt Controller Interrupt Priority Mask Register
2. Interrupt Controller System Register Enable register
3. Interrupt Controller Deactivate Interrupt Register
4. Interrupt Controller End Of Interrupt Register 1
5. Interrupt Controller Interrupt Acknowledge Register 1
6. Interrupt Controller Binary Point Register 1
7. Interrupt Controller Control Register
8. Interrupt Controller Interrupt Group 1 Enable register
9. Interrupt Controller Maintenance Interrupt State Register
10. Interrupt Controller End of Interrupt Status Register
11. Interrupt Controller Empty List Register Status Register
12. Interrupt Controller Virtual Machine Control Register

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Moved coproc regs definition to asm/cpregs.h

v2 - 1. Defined register alias.
2. Style issues.
3. Defined ELSR, MISR, EISR to make it consistent with AArch64.

 xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 5331ec3448..0fc606fe99 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -161,6 +161,7 @@
 #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
 
 /* CP15 CR4: */
+#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
 
 /* CP15 CR5: Fault Status Registers */
 #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
@@ -254,6 +255,8 @@
 
 /* CP15 CR12:  */
 #define ICC_SGI1R       p15,0,c12       /* Interrupt Controller SGI Group 1 */
+#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
+#define ICC_SRE_L1      p15,0,c12,c12,5 /* Interrupt Controller System Register Enable register */
 #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
 #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
@@ -279,6 +282,19 @@
 #define ICH_AP1R2       __AP1Rx(2)
 #define ICH_AP1R3       __AP1Rx(3)
 
+#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
+#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
+#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
+#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
+#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
+#define ICC_SRE         p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
+#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
+#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
+#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
+#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
+#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
+#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
 #define __LR0(x)                  ___CP32(p15, 4, c12, c12, x)
@@ -380,6 +396,15 @@
 #define HCR_EL2                 HCR
 #define HPFAR_EL2               HPFAR
 #define HSTR_EL2                HSTR
+#define ICC_BPR1_EL1            ICC_BPR1
+#define ICC_CTLR_EL1            ICC_CTLR
+#define ICC_DIR_EL1             ICC_DIR
+#define ICC_EOIR1_EL1           ICC_EOIR1
+#define ICC_IGRPEN1_EL1         ICC_IGRPEN1
+#define ICC_PMR_EL1             ICC_PMR
+#define ICC_SGI1R_EL1           ICC_SGI1R
+#define ICC_SRE_EL1             ICC_SRE_L1
+#define ICC_SRE_EL2             ICC_SRE
 #define ICH_AP0R0_EL2           ICH_AP0R0
 #define ICH_AP0R1_EL2           ICH_AP0R1
 #define ICH_AP0R2_EL2           ICH_AP0R2
@@ -388,6 +413,10 @@
 #define ICH_AP1R1_EL2           ICH_AP1R1
 #define ICH_AP1R2_EL2           ICH_AP1R2
 #define ICH_AP1R3_EL2           ICH_AP1R3
+#define ICH_EISR_EL2            ICH_EISR
+#define ICH_ELRSR_EL2           ICH_ELRSR
+#define ICH_HCR_EL2             ICH_HCR
+#define ICC_IAR1_EL1            ICC_IAR1
 #define ICH_LR0_EL2             ICH_LR0
 #define ICH_LR1_EL2             ICH_LR1
 #define ICH_LR2_EL2             ICH_LR2
@@ -420,6 +449,9 @@
 #define ICH_LRC13_EL2           ICH_LRC13
 #define ICH_LRC14_EL2           ICH_LRC14
 #define ICH_LRC15_EL2           ICH_LRC15
+#define ICH_MISR_EL2            ICH_MISR
+#define ICH_VMCR_EL2            ICH_VMCR
+#define ICH_VTR_EL2             ICH_VTR
 #define ID_AFR0_EL1             ID_AFR0
 #define ID_DFR0_EL1             ID_DFR0
 #define ID_DFR1_EL1             ID_DFR1
-- 
2.17.1



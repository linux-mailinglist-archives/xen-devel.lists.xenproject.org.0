Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851764296E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453629.711237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BYG-00073Y-F2; Mon, 05 Dec 2022 13:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453629.711237; Mon, 05 Dec 2022 13:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BYG-00071b-Ab; Mon, 05 Dec 2022 13:30:32 +0000
Received: by outflank-mailman (input) for mailman id 453629;
 Mon, 05 Dec 2022 13:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2BYE-0006k4-MB
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:30:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5c43d4-74a0-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:30:29 +0100 (CET)
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 13:30:26 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::4d) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 13:30:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 13:30:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:29:37 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:29:35 -0600
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
X-Inumbo-ID: fc5c43d4-74a0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6Mr0o0ZW6lOCuDIcfZYCDQhVMpRJx1t/fqOIsQJTynpzP4iXiMCXAXiNWk9SUGE+apIspDMknkVtBNLwCTfJYx+z9MKwYagVZVinJQVg3CbseEnNvAuOTgWbOPS5H64MxpYpx1kHotU3hq6mjKV5+LGY7Brl6L5fxYzyR/H7uOm53XgQ/fiuToZJXMHct22tk0CbBA/DAanQv1HN5PgVzM5yRBjA7mXGJGkipfdVx98ySZuRt9MH+jXhbPGgfuXhtCz317fESqoxl1kANroyV4E/Td/WtXefCcI9rwAdTaxuvDvglnZ3LMolQPhb9aojA7N5aYqkKNDHnLR6/I6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ycBL9vnbS90AEBJIm+fOecH7kLgLt9EJFNxYphA770=;
 b=PYyCBRTdd3sV+B11o5W3WtiXc56DxIv90FGFupO/BDmz0D5iAzmbw8ItR2576T4amGA61Wa1k7OnzEgmuke1wDTLYZNopERvDjG0X4+U7pW8zQS8p4quLpYIOvaJ14yOBJ4nRp0Lv6zO9ivB3B0BT9rzaSswQx/HAwUfMypKVEsMSogq+KMrYZkHmNk/vMkZ2HLtMcCiTj/tlPTWM12lU9VGlei9rUyc5f3HlnQQnTktRHovMbPv2k443nihbtG/U8Mho1rr/2PZ4Y/dpA37k4bXkThC9zohKrb8MjqYhSRn5GV0SKaWoo7IybtngfVaJwzTZEFK1donji5l7BTRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ycBL9vnbS90AEBJIm+fOecH7kLgLt9EJFNxYphA770=;
 b=ZmYoHEZAKc98I3QhHr7QGiETU/YC9lf1LMP/D54ERVY8XzeKOb+3c5ao816pACymeyassgIr3v5+Fxd7QIPQcNzyVyN7HgpzbfKF0a0pwaS//sv7HDQD5L9dnLXhhr3S0KERjdsSSG/DgdPirlOafj1We1BiS85286RYoYudo+A=
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
Subject: [XEN v5 09/11] xen/Arm: GICv3: Define remaining GIC registers for AArch32
Date: Mon, 5 Dec 2022 13:26:35 +0000
Message-ID: <20221205132637.26775-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a364457-2ba1-40c9-0abd-08dad6c4de73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSU8hTgdt2bB1MI8I6/fOgwtEKgLkAD9s6OVVQUvxto6H16YNnnQe21CoaWW0wQkuqlN+RXIWZMe+fBdLt/O/sGMAcU+Lq+h+9h1NOhvvEqD+UOY+TQwdlqA8p5Jgts8KlYdxDrO8OlkpGVBfTfzE3y3sKEG1e1HhP41GqeHQl9AizfSzzxihAfp94YDeRyPBFzreo7APPFEnGCNT8KPCCCxcTKq/IWMIo8cuaQxKTm0BW9zmBKFoC9qORycLdtIhGvVajcCU+Nhf00JbKaXTdnQ8xVZQ6Radrqyo4pW5jPJ9vQqPLXr4dpi4CgwsJv8YAKGdLWdQ0c6IV//VY38hzZiZGasKN/WnZSM29eOclCT4Z8LB/W+se8CPs4q+2PhBcMnzrrS4cJd8IIU65vVkGtYCMZmwz20OzihBT8+B2cji4E/Ax2ZrDwBTaZvWMoOcuJXHZXDB4ofjvLWZkkLqPzRE3NOM8Kwz8Ws0bry/N31ACPpx2IP9dHuISky6nRjZ5LhY07N/IMVgjf2VqdcEZvekzPqTmXL7Cf9df+eK6PIWPaeNRs+FFTOjQriJu76YG+HT07lXLOGgMsvu3FXytpin5BE7giF262uIj56FhVl1MxdFwwX9+ZqAYeuAUJQwQGEkdDxnlgx9ZslCuSB8gEWpuhDfWp1QPUEs3sU5IsLJKhhbaxEcxbnORnKNI5qKcxLECnqp1DuQfONQWlM/2AS3dU1JaBOrxHHvCs3h50=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(41300700001)(4326008)(2906002)(70586007)(8676002)(70206006)(316002)(54906003)(82310400005)(186003)(478600001)(1076003)(356005)(103116003)(40480700001)(36756003)(336012)(426003)(2616005)(86362001)(26005)(83380400001)(82740400003)(5660300002)(8936002)(81166007)(40460700003)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:30:25.9893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a364457-2ba1-40c9-0abd-08dad6c4de73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from :-
v1 - 1. Moved coproc regs definition to asm/cpregs.h

v2 - 1. Defined register alias.
2. Style issues.
3. Defined ELSR, MISR, EISR to make it consistent with AArch64.

v3 - 1. Rectified some of the register names.

v4 - 1. Placed ICC_DIR after VBAR.
2. Added Rb.

 xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 4476c9f11b..6b083de204 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -161,6 +161,7 @@
 #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
 
 /* CP15 CR4: */
+#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
 
 /* CP15 CR5: Fault Status Registers */
 #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
@@ -257,6 +258,7 @@
 #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
 #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
+#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
 /*
@@ -279,6 +281,20 @@
 #define ICH_AP1R2       __AP1Rx(2)
 #define ICH_AP1R3       __AP1Rx(3)
 
+#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
+#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
+#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
+#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
+#define ICC_SRE         p15,0,c12,c12,5  /* Interrupt Controller System Register Enable register */
+#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
+#define ICC_HSRE        p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
+#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
+#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
+#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
+#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
+#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
+#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define __LR0(x)        p15, 4, c12, c12, x
 #define __LR8(x)        p15, 4, c12, c13, x
@@ -379,6 +395,15 @@
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
+#define ICC_SRE_EL1             ICC_SRE
+#define ICC_SRE_EL2             ICC_HSRE
 #define ICH_AP0R0_EL2           ICH_AP0R0
 #define ICH_AP0R1_EL2           ICH_AP0R1
 #define ICH_AP0R2_EL2           ICH_AP0R2
@@ -387,6 +412,10 @@
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
@@ -419,6 +448,9 @@
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F663AD1C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449028.705682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgW2-0007Fv-LI; Mon, 28 Nov 2022 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449028.705682; Mon, 28 Nov 2022 15:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgW2-0007A3-FE; Mon, 28 Nov 2022 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 449028;
 Mon, 28 Nov 2022 15:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgW0-0004G7-SA
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:52 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e0ab10-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:57:51 +0100 (CET)
Received: from DM6PR21CA0017.namprd21.prod.outlook.com (2603:10b6:5:174::27)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Mon, 28 Nov
 2022 15:57:48 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::54) by DM6PR21CA0017.outlook.office365.com
 (2603:10b6:5:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.4 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 28 Nov 2022 15:57:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:46 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:44 -0600
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
X-Inumbo-ID: 68e0ab10-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W22UNKO+lEQXdJvV4GbP4053myOO2XZCejyw5f2Mb614NkAmikR3y9FLXMheL8FwLXd+Q0ZBY2adokDSCbdDm0UR0IQ6JTZkpyYXl8gyifnLjg6FRrt1/tKo8gmVVmsFtlL0OI/RfsSh/6dxyNM8pqQloUOQo3fPTcS4BIVfVZlscYy197WLBIwgZikI8esOQHylUtAfJmmeJp19PTPSRkgjwJAdV/kWgMLhWabuo5TYG5qarQ+OT/gXqYsgJVKNcwq+oANqcByPEJh8/E+kFgF2XgafDkK9UsefmAYqCAfv/anoWaN3dGmaVFOfl/RBLbm7zu3l5Fvos+Ej5uzS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXnNv0uq417LusaPBljoTxWq5WZtI/zUljXoSS1VcT4=;
 b=RvvBot81qoceXPJfEyG5KRnK4fFwGt42T10RYfT5C2dYKwLzghlecAo2c9tgCB5C8WRNuYHcRDFtEXLO4DPVpv+oEvnQlFchFLIS6smm4gm+gfAKWgjsUlLGnzdgJOWqtbktqS0I4CmN7b3CLzu/OOrsJXzWhSOBMW8t1icvqnEKYhbKyjP6AJ0T8XTpahIc1YnqTy5L5mOdtZrXqEYhjNbfNGUn+H6JxnmC4c3a2awepXkVTk1oRGNhmdtiPRJZhzqiQAhce8hB8P2CC+fcTi8SZZdDI6FPpCbtqFE2QqXvBPj+1WOBiCwAJxebLaSVwh5f4qMDBg9r9C2weeCo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXnNv0uq417LusaPBljoTxWq5WZtI/zUljXoSS1VcT4=;
 b=3A0G3pEd/FWUW1v4c4dL3bQnEuf3LfZff8plqVsqW1sqhY3/U/ismjYwnyt52/9jwD/h+XHmMkuNkPyrqHlMyovrpEsCzcFh7Fe+Jad921loOceJvmjAa68zK7ibGasEA7mOIXi6n2EoG7APAM6FAeVmeAAzEVku5A/2gLIGXf0=
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
Subject: [XEN v4 08/11] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
Date: Mon, 28 Nov 2022 15:56:46 +0000
Message-ID: <20221128155649.31386-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT047:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f2c3dc-42c3-4294-c6b6-08dad1594bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nvCOKBzCKPd6ZzslOWu4w156Zz/Pq34kLO5cZPyLe45p6aVZ1s3QjVmkq5+oc2PBDKi45d1JDIrmnQnAU7XKIQjA7oH7wh1NYkuFPtu1RcSG/gpu2CE4AIVetc+Hcg8LzdgVkewtQ1ee0AB45E2vWVeAAqa4CYcYpHrpj+FecbwXsNuVtve8jKOqeG0Qkl2YeJ7ERXXEBVFy/F96r+NQad98SKlZqv/YRgr9OZ293D3ADOAbU3RFvT3MTQB918v7blWalIPLDYo2P1gDROltHXdL02DeRcKun3NuNi1uABrGfWg3UfSCO4XSb76YszMz6eranQ8IBbLnnk2t5XKLP09JD3fvC7mWImdbb85YJZUePUSyILOuX9CfaJTJgpZBeX0IjdJJG7b5Xg7CHwt9IOVnKF7kaxKAp8NmgZtMSGwOP7OTXbnHNmoUya4DsZ3GwTIAXocEplMzYlGlso9mfjJ4JtEYEXXwQCcHPu5pmI7TYOVvkRk+YyQHnQZ7hnQUTi2TjsDRtHAPlGtZj7pLFL3qng++FKh/91gNZ173l2FJnq2h103IJlSvwtATTON5NRyuU50z7xKBJqxbPP7xvid+k6u4o3WffH8kfBTJi8xBjV1TkS6zmRQlvIfkGxy2OaC0e/VOkFMXIesijrFWzg1ruaWqpYeXwtlVMFVGEgqGQbXfWmOF/azhzTUX8TitDdw3Xl6vUNGdG3MBR0leXM07iIycqFauJwwWPx9My0k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(316002)(478600001)(186003)(336012)(36756003)(86362001)(4326008)(47076005)(426003)(8676002)(70206006)(83380400001)(70586007)(26005)(1076003)(2616005)(40460700003)(6916009)(54906003)(40480700001)(36860700001)(103116003)(41300700001)(8936002)(356005)(5660300002)(82740400003)(82310400005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:48.0463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f2c3dc-42c3-4294-c6b6-08dad1594bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323

Adapt save_aprn_regs()/restore_aprn_regs() for AArch32.

For which we have defined the following registers:-
1. Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
2. Interrupt Controller Hyp Active Priorities Group1 Registers 0-3

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Moved coproc register definition to asm/cpregs.h.

v2 - 1. Defined register alias.
2. Style issues.
3. Dropped R-b and Ack.

v3 - 1. Style issues.

 xen/arch/arm/include/asm/cpregs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index b85e811f51..53142fc2b2 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -261,6 +261,26 @@
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 0 Registers,
+ * n = 0 - 3
+ */
+#define __AP0Rx(x)      ___CP32(p15, 4, c12, c8, x)
+#define ICH_AP0R0       __AP0Rx(0)
+#define ICH_AP0R1       __AP0Rx(1)
+#define ICH_AP0R2       __AP0Rx(2)
+#define ICH_AP0R3       __AP0Rx(3)
+
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 1 Registers,
+ * n = 0 - 3
+ */
+#define __AP1Rx(x)      ___CP32(p15, 4, c12, c9, x)
+#define ICH_AP1R0       __AP1Rx(0)
+#define ICH_AP1R1       __AP1Rx(1)
+#define ICH_AP1R2       __AP1Rx(2)
+#define ICH_AP1R3       __AP1Rx(3)
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
 #define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
@@ -361,6 +381,14 @@
 #define HCR_EL2                 HCR
 #define HPFAR_EL2               HPFAR
 #define HSTR_EL2                HSTR
+#define ICH_AP0R0_EL2           ICH_AP0R0
+#define ICH_AP0R1_EL2           ICH_AP0R1
+#define ICH_AP0R2_EL2           ICH_AP0R2
+#define ICH_AP0R3_EL2           ICH_AP0R3
+#define ICH_AP1R0_EL2           ICH_AP1R0
+#define ICH_AP1R1_EL2           ICH_AP1R1
+#define ICH_AP1R2_EL2           ICH_AP1R2
+#define ICH_AP1R3_EL2           ICH_AP1R3
 #define ICH_LR0_EL2             ICH_LR0
 #define ICH_LR1_EL2             ICH_LR1
 #define ICH_LR2_EL2             ICH_LR2
-- 
2.17.1



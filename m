Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914D63AD13
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449011.705611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVX-0004Jb-4u; Mon, 28 Nov 2022 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449011.705611; Mon, 28 Nov 2022 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVX-0004Go-14; Mon, 28 Nov 2022 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 449011;
 Mon, 28 Nov 2022 15:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVU-0004G7-PP
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5548100e-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:57:18 +0100 (CET)
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:14 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::64) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 28 Nov 2022 15:57:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:12 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:11 -0600
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
X-Inumbo-ID: 5548100e-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6dVD3rMT0wqr3FDqJnw0VknGPV7rGjDHpAGHQBwQDHRvna5mzfZMWrs22Wtsestr+QqlwnzRlcG0wgpamYK+rgQR+mjkirlHzlot1oJ+T755QBFEgxYVUmjrZrPepF3+UAqteKvF31RlsxeyifwVQaKDh4CWLHrm3lKuhb1/pUPyFQIyFJ4MkqSV6eBy2HVgl4kFmDLxUHixBaqY93srH4tklQ/VMEbu2HHArhD6KT45Z1OdGELkWsP52gnzFOm91eMncL+KJYk0va/l/PzybgJjVZ0t4Dqjw+I6OinF8nsD2aT6qEEls97iDeySNApiz0fwohzL4I/l0mZyx3ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0n8FAPk7U+uUmU83VhWA4RfQh2mMZ9KZJGNylb/20U=;
 b=MVtgSFk+HMDwepQIivWUgxmAfxiYRsd9X0G6fpffvGA2fQXx70D+Zh+v+LlX6FPtoyaus0HvLgzOWdQ7q08s10SUiYd4aGy9nTkfa4e8rTIdq0+1etygcQDepPsIMAoLagycGjCUBwTEGNOGoF7YcSkSL69xW6Oh/0t8sSqAWnVECUN3PTBIPoEwcF3mJHjvhG4uj7eJFNLBRrYWVaUSg+5Bs7f50fxvRpXK5SFSKo0R6cKCpAfNif7uYTkBoExhLDhQisryWI0HQE/QJBVO/PxPUM0stwLQ1GGbVeq1uvmx1N3+LgZ4i3Bs8qDAgB10VDe4/8OpVcKHs3K9bxmZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0n8FAPk7U+uUmU83VhWA4RfQh2mMZ9KZJGNylb/20U=;
 b=yDshSf8Rt/4JIdJACNi3fci59D/GGoQ04lua2abcfMicleMNw2leerNFTbORlOLBNNFWZ+WRa9K0qp3ScxlJ3beJhxTlWfQCqkheSd2b8xNZNNHIsTtyCbBWy1OMMmNrFSv3c5dvwSowiMmSBd+o2Z4GCeyFAbLFzi57E8KWdu0=
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
Subject: [XEN v4 01/11] xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only
Date: Mon, 28 Nov 2022 15:56:39 +0000
Message-ID: <20221128155649.31386-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f81350-57a3-4e6c-998b-08dad1593741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsrFKWx5trY2zxNee7M8ArcQpyfamXnbfuyDNxa3enRHacXZIaHCZsAjNBTsVZnObJh1+KMApElxPLXoPJS72hCINu2B9crDoyE10zsAScTXbtu3OLBHhUwJv1jEDOwApXY6xTqZWXPaXbUMJhwlgPEwrIL1nIlKuiVYU+kSPcki7bPHflUb5/tXWmZj26DGqvDfG0+JsUDk04JlVQxFNCOEMCyNLyoKbry/u52H82r9w+NewgM/qilcC2ImXgpwTXUKPGfil35QKzLLxH51bogGJNhNUa0Q8sR5SxRKgzfinu+LDYEO0rIgM86HTyo42LcsX6FDC3AFV/HCL1DFchjFDgiFQdACLa2AlGW3yUjOd96Op3swEJdmdhJPQGcjfGLXqMw+LLkzepFKtQYxHmtPR9aq1wmv695ExSLJesBYdjke/Rb4eYc4Dq4r/K/fUrFCrBDMbel+QR4XTDjWmSmoUNS1T3TxLC+nu5AV0Q1Jg4ymAphI1Jf+K2dEHq9g3ZWoC1k+7VqJE+sfCPnJL7XvNEhDez67bKsR7S8iY83VKTFSm9wWlYry9AahqSnkHOP80qsMzwMNPwXjAAAYl+SEfqYkX2mMYhzZriM0GrX5JuVAvcSg+JYwJ6BM4wH6a6+sra93ICQqCUI0BaD6P/B9FL2k6SZnt94qH+YF2lNO1F8Vas/61j30BzKkiE4h1EI2tpBeP9I1YOgwgFnyMIVhjv+w0YOjyKHGdi7W6ws=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(426003)(47076005)(5660300002)(40480700001)(103116003)(54906003)(6916009)(26005)(82740400003)(316002)(2616005)(8936002)(336012)(40460700003)(41300700001)(1076003)(186003)(70586007)(36756003)(70206006)(4326008)(8676002)(82310400005)(81166007)(356005)(2906002)(36860700001)(86362001)(478600001)(83380400001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:13.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f81350-57a3-4e6c-998b-08dad1593741
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279

Sysreg emulation is 64-bit specific, so guard the calls to
vgic_v3_emulate_sysreg() as well as the function itself with
"#ifdef CONFIG_ARM_64".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <julien@xen.org>
---

Changes from -
v1 - 1. Updated the commit message.

v2 - 1. Updated the commit message (removed the reference to Arm ARM as it is
not required).

v3 - No changes. Added Rb and Ack.

 xen/arch/arm/vgic-v3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 015446be17..3f4509dcd3 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1519,6 +1519,7 @@ static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
     }
 }
 
+#ifdef CONFIG_ARM_64
 static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
 {
     struct hsr_sysreg sysreg = hsr.sysreg;
@@ -1539,6 +1540,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
         return false;
     }
 }
+#endif
 
 static bool vgic_v3_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr)
 {
@@ -1562,8 +1564,10 @@ static bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
 {
     switch (hsr.ec)
     {
+#ifdef CONFIG_ARM_64
     case HSR_EC_SYSREG:
         return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
     case HSR_EC_CP15_64:
         return vgic_v3_emulate_cp64(regs, hsr);
     default:
-- 
2.17.1



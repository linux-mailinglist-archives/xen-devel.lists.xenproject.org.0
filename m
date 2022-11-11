Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F63625CC9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442570.696884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrI-0008Bt-Hn; Fri, 11 Nov 2022 14:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442570.696884; Fri, 11 Nov 2022 14:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrI-0008A6-DX; Fri, 11 Nov 2022 14:18:16 +0000
Received: by outflank-mailman (input) for mailman id 442570;
 Fri, 11 Nov 2022 14:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrG-00085I-Kw
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:14 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac856a98-61cb-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:18:13 +0100 (CET)
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14; Fri, 11 Nov
 2022 14:18:09 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::15) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:08 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:06 -0600
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
X-Inumbo-ID: ac856a98-61cb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSivghVVgBOla/cD8KPmGcV4jcpghTzlsoC6EhzTl4Eoc12qeWDaE8JckyczhbCB78v07fSK0joMCnGKUvsFwSjopaWLiVNeuBRV7rUsdgN6e4C1rIMCh4BK/JtqNZz25mNVGReUOnpGBhxVz6Fw1hzBiyMHRMDwKC+iL6hFUPfoQ5JqmKE5l9DFRRD0sHeObI2ycdJoAzVFg//GwvT6d9sQGQx5AN4hq/xX5mZDLLGTawr+rPCDSiDTpLsq5JvO2aEOvBtyt2zZU2ehyUnyDydp+/YuY8OvSdaBcnL/v1KEMumoqe091UDbrGZ7UBYsewjaNSySOv2SC8gLI002WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BuV+HyjL7BNV9FxH0s8ANwm+9yeR0vLmx92BP5Ij4I=;
 b=Rd6pgOsmmhYro7CDAGmt1/m6Tu0Omz/N5GNljZ7FUxV6+SyB4mTTq2bmwpjXRZZ2V9uG+rKXES/KFz/7buRauMya5QSr1vopR6Sa7W7Qq7PprF/KU16ihKHDJ/xuUudb6ew0FAq3XVCycssfiSgAX72UXdT7lepNYWrvQtjSLTPE7rI6+0BIlp1stMdhI36JkvIJsZci0xOQ+I5F+JrwP6MhTmnGhqTq2LpDxcUELiA1lK4j+QCw+7h+2IithlODdhvKQ014DLeQw2mb0v7xdYZe7ZNtMos3re1QNojjpZJqu4Il0ERK4fGHEShxLAxnEWvbZs5ffePjr5LOhqbWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BuV+HyjL7BNV9FxH0s8ANwm+9yeR0vLmx92BP5Ij4I=;
 b=TZ1QPMQs3zflUa0jo+j5IfyGD0zohlulmbtVqgZK4OxQESQdBujEyXWNd32I0yPhbpQeSYvoyLL207RAMbbL+4EfoBeqL01lozvjWN1/j0/Q+b4/G9Y4fgiz8ChXdfk1TV6wZBS2oug4oUTUMx2zX1HKiMQdzH+y3G4M0H96Pag=
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
Subject: [XEN v3 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
Date: Fri, 11 Nov 2022 14:17:31 +0000
Message-ID: <20221111141739.2872-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|MN0PR12MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ba89d3-1d1e-40ee-1859-08dac3ef8ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AuyaT3j/1xFhz7vB7vs5DkIYHp33jBoXTvc6dQURFB+CCecrR+aYkHXJeY8QsBNesMTmf4mc8uyiiN1HzkR+4O2VP4FkBJZMb9PoOSU++d7j8j3L841mPJ+wciZVbbuHUEA7QlIpzOrX1w8X8sDZzTsWDgVJLmQeMM4J6K9ewn4rodPgzz0l4xs91pnUwpHw8prkS/HaQS6V/QBgcUiYP0mS+G0ai/XYKvFgJIjRRB208t8Q7HSxl425HqBw1srv284W/JnUV0mxGJc24qpSV45LuAgIVYgnbSVLEBh34WNss1zGbrFYlZN+IMqT5y2bgRg//pROYtKbgCFttvFO7k3bkPcDc66pe46B/SAcoU4tHvQ7e5ZO0IISPXwJKSjFk5Y0VbtpV7SJe47bgAJQIzw3xKl3Ah12rglamka/intr47zllQ/CUTbPuBNZJGowDxE+t+GAL1xyB2KErB7yVObZ5mt5ogo3VYxMOmLaH3fv5nUBThzRCDa0SFF8TO6sAJZpCPCzFJ6drSBMya6yLU+2LZPOhAUDuFVZI0YDvHhL9ZfeArOQsuB0Ko0Ai/CV7dZbBS5kd4Z2K8isKQHTv3dKQnRidmG9G1d3C2vlVAANqQ1iuz5EaVk4+aUrBTSH+pPW9axnVWTV7ex3DB/MoPgFIhlyZpbcOoozmKbSmriH1wDm8REjfvAoEzNO3sUMfxkpsPnkKl4/zS345WAruqweYDC2PEIfrKMWSKsnaqVeqLjbQG8+ZzIyFRHZwxXL5ByunpGPuG0TZ5mOnEPQFARYuEP1ffVWX97ef1dXr0+d4Xi+m/AcfYNp41Anoiey
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(103116003)(2906002)(4326008)(8936002)(82740400003)(40460700003)(36860700001)(86362001)(83380400001)(356005)(81166007)(70206006)(54906003)(316002)(6916009)(336012)(186003)(2616005)(1076003)(426003)(47076005)(478600001)(40480700001)(8676002)(82310400005)(70586007)(41300700001)(5660300002)(26005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:08.7528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ba89d3-1d1e-40ee-1859-08dac3ef8ee0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786

Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
Aff3 does not exist on AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
Aff3 does not exist on Armv7 (ie arm32).

Thus, access to aff3 have been contained within "#ifdef CONFIG_ARM_64".
Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have copied it to
'uint64_t vmpidr' to perform the shifts.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use 
MPIDR_AFFINITY_LEVEL macros to extract the affinity value.

v2 - 1. "MPIDR_AFFINITY_LEVEL(vmpidr, 3)" is contained within
"#ifdef CONFIG_ARM_64".
2. Updated commit message.

 xen/arch/arm/vgic-v3.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 3f4509dcd3..a7a935ff57 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -191,12 +191,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_TYPER):
     {
         uint64_t typer, aff;
+        uint64_t vmpidr = v->arch.vmpidr;
 
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
+#endif
+               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
         typer = aff;
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
-- 
2.17.1



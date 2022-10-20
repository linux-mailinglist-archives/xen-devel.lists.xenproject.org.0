Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F9605DF7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426479.675042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSzu-0000J1-LG; Thu, 20 Oct 2022 10:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426479.675042; Thu, 20 Oct 2022 10:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSzu-0000GA-Hz; Thu, 20 Oct 2022 10:41:58 +0000
Received: by outflank-mailman (input) for mailman id 426479;
 Thu, 20 Oct 2022 10:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yb7k=2V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olSzs-0000G2-UQ
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:41:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfdad687-5063-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:41:55 +0200 (CEST)
Received: from BN8PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:70::28)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 10:41:51 +0000
Received: from BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::61) by BN8PR04CA0015.outlook.office365.com
 (2603:10b6:408:70::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 10:41:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT085.mail.protection.outlook.com (10.13.176.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 10:41:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 05:41:50 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Thu, 20 Oct 2022 05:41:49 -0500
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
X-Inumbo-ID: cfdad687-5063-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UK6iGYbj0hqqjhaZtE0kNjrVH8GZNPfUZKmlE88fSFDrUOQW1pfTvoNjs6WYj0VDL+sdKk3d7LPQXrCWM+fl+Ud8u6UQEv5bcYpuCR8lQMHEjb/s0IGn6eM4BXiLaFvxioVysfWligGKqCC9ZmRFr1qWJz1+tNLztfa8C0edxo1NTe2wLOppEFKoKApULBoB8wAFC8SRVssyrvuu20kmsFZ9wvFEeMchGu9BMgxIuyGesc0f9DQxaCQAxultAL9vJef4b3OdZsKIEQWV73uZqpFK+z3cLwpTDepN+zMPFgimFGd4bIt+nxCi+umE2XUYKinHfspU8ugGrCH3/ozRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DijQhQr5b/k927xjMyy3lw0o6tSDAsYgZp7BGpv6mAQ=;
 b=iaPVe+iWwgDKJ+ihD+jcSKuTo7NdRck9/8fAeEYvyPumVY8QFNwtoE88B68m1FyBY+hDIawqRuO8GRyiK83s8eTU2aNavwMaTszsgSwUdOeLsJbZosBR2dN9VkfWq7pO8CLOfhN8nAPeQVGG0SPBsB8+Duli7LeVhim0gM++AA8h2nl4P0kIeHwE2wydsntS+zAiyBiZ+7zuuJxNuYwkOHboSjvqGFBDhANu+GNbhLmgacPaGQI8osdE9BmQAsW49kr7rHj1KfKDWfLEUcRWW7BSJG/PmVc+K7j/V++SZEDi+NAP2u0GPRyfXijXJ3jAU3B/a36lVGi32U/NNfJ33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DijQhQr5b/k927xjMyy3lw0o6tSDAsYgZp7BGpv6mAQ=;
 b=tTwarEuOacQYQ6b2j4VExDZRybwRq8XYjMYTf07NkIbWK9hcjVxVc0UoVnWTxN7LVUNEqkXK3BUFAUCyLeBFWciq0t+43OpsFcVy1Mkei0AxcBgN2utOL7rTRifji+1UoqkNdAlTrCxaqh/UdXdzUSWMD27XDLU3tdF7O09s0pI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Date: Thu, 20 Oct 2022 11:41:46 +0100
Message-ID: <20221020104146.29841-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT085:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 58743017-b965-4616-6a6e-08dab287b2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YUg5WHhGFJCDZqs1LpiEn6w/UzeFoYUOA6XIFQHkYULZ9fH4tPfFlz3zCRZh+DWXwwNjis4HHMNvnZ82UUzOLsxcJc/phY1fdSZfUffGljvups1OMULHvFd6Jnm8iAJDEaFsfQ9klhmMjInHydYAwdssyVVyaGbRgUzdr2HIj276U77+V7XvNgiIidWn2F071dHQO+oogh64DP+ZMY6fbOzFwunfzxavIRVwXH4TPS6PKvzPTefRtH3pvgqzY2nzPAGFfqp6ar3XDZZbo9b5D5Nvg83hTDVCLDjcXos4a9jvaGm8+9ELwoZa4xIoQVx5uSlsCRFsN3ys9r3G+Mb6KlJa2zGMuLqYTX84eLTuuCDQoyOkeMf5r2+GAbWFkskj3p6josVL0sYf95G35AwwgJOafSe9E+dHmovKzLsh47QGRDjKi7zzPzIE7AQkrAoLbKk+g0nqfWOkileZfn4QLVK4fMktasCJBcQWAtfkUh1lUu/YbxKKP8lYHeyMUO/NoR5nmFuKjk7hE4svaCzaBtkxCpqGzPEZJu4PeNPBtIZYm14BwMvlP/JK6qgp+INYY1e/50Nce0/c3+grvbPGEmoQvabt+a27hgYkXx49C3jAa9hblKZ5bwjFSUjvzg4YKUEfhXP8ns4Nrj2TpTP0M2xEKt8hQH0jkEgwEWjmuEmoRZ4fQtO+LcB66nBHbDCdsv58lT9LlPrFRj9yjUJreRTyepyfLnGkfExt6N6dGQygUsA7iVgFAOnWdk+AK2x6pESpDInIQq2JPwm6r4lA2yLUdHd98TrDVS/PEM0R6qQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(356005)(6666004)(47076005)(70206006)(5660300002)(8676002)(8936002)(41300700001)(70586007)(26005)(40480700001)(40460700003)(6916009)(336012)(426003)(82310400005)(54906003)(4326008)(1076003)(186003)(316002)(2906002)(2616005)(36756003)(36860700001)(478600001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:41:51.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58743017-b965-4616-6a6e-08dab287b2a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774

Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
IGROUPR) is relevant only when the guests run in secure/non-secure mode.
As Xen does not implement security extensions for guests, so the registers
are emulated as read as zero/write ignore.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Observed the issue while running Zephyr on R52.
Also, found that KVM has similar behaviour.

Changes from:-
v1 - Moved the definitions of GICD_IGRPMODR, GICD_IGRPMODRN to gic_v3
specific header.

 xen/arch/arm/include/asm/gic_v3_defs.h | 2 ++
 xen/arch/arm/vgic-v3.c                 | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 34ed5f857d..728e28d5e5 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -30,6 +30,8 @@
 #define GICD_CLRSPI_NSR              (0x048)
 #define GICD_SETSPI_SR               (0x050)
 #define GICD_CLRSPI_SR               (0x058)
+#define GICD_IGRPMODR                (0xD00)
+#define GICD_IGRPMODRN               (0xD7C)
 #define GICD_IROUTER                 (0x6000)
 #define GICD_IROUTER32               (0x6100)
 #define GICD_IROUTER1019             (0x7FD8)
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 7fb99a9ff2..0c23f6df9d 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -685,6 +685,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
     switch ( reg )
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
+    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
         /* We do not implement security extensions for guests, read zero */
         if ( dabt.size != DABT_WORD ) goto bad_width;
         goto read_as_zero;
@@ -781,6 +782,7 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
     switch ( reg )
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
+    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
         /* We do not implement security extensions for guests, write ignore */
         goto write_ignore_32;
 
@@ -1192,6 +1194,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
+    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1379,6 +1382,7 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
+    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
-- 
2.17.1



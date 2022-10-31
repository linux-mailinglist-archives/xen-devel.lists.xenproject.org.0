Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAE6139C0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433026.685875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUN-0000zQ-KS; Mon, 31 Oct 2022 15:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433026.685875; Mon, 31 Oct 2022 15:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUN-0000wN-F6; Mon, 31 Oct 2022 15:14:11 +0000
Received: by outflank-mailman (input) for mailman id 433026;
 Mon, 31 Oct 2022 15:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUL-0008Dn-CL
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a96bda4d-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:07 +0100 (CET)
Received: from BN9PR03CA0377.namprd03.prod.outlook.com (2603:10b6:408:f7::22)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 31 Oct
 2022 15:14:04 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::33) by BN9PR03CA0377.outlook.office365.com
 (2603:10b6:408:f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:14:03 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:02 -0500
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
X-Inumbo-ID: a96bda4d-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIlUhA9nPeUbK08Ns3YM7B4uXNSF8nxw7/7t1MpeUVU8EjQDUEVrPOPvLl3M3/2I8TOISZQaFA2ZtbPkeN9o09VUOPQXiTrlLuo2c+r1Vx3TKjOg0VMjuhPOJyxGc8mgEUvnbU4e6XnKi7/JlZ7dBnulzSFqx+kjFdh5owZOT7e1mxdnF4KNLYECyN2O//W4ImwT51jy2IZMMk0c5p8HGAzxm0SLvIa2/gZWYrhxUqdZVkjogZfGKcKVoDrQ5bQ9CWci9iNERHanZweLr10Fk1Jl1cpas9c6l7/GdDBdq0IAL17PFygz+05dBweJvoFYTp/1w7ahc6E9lPOf9MBg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uduyDw2PWmugpgiAKKjLksIGjdch+A8RUHeYeJYCGgw=;
 b=mlR0TTZniMcgoeP7M6KxhIj3qVj2jjW8Jn4dAQQbE8w7o7Hv0ilUTMdttMEF5AyQ7UUhEzP/OYHCCsX6V8IZaUnv6PkpOtAUYzqWX4acjBIuqK3/ouB3AEdzuNxOs8fAEnKWmbty+owbmLsZ1lJaItG6ixrCupUM18VBwPJRWovqcn/fHRmS2CYJpnW5c0uXqyllnbA1xQyuuvPgYXP+sl4/nHXlcZYHOirE8WR644zPJOkBHW56SSGwxg+7toCkpH8yjZKkfuA4qPW4UkhprUWowNtdukWM/C6vYZyNRCGGsIfnxRv2uykVgPmGEnit35+vdz9QVqelh+90braqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uduyDw2PWmugpgiAKKjLksIGjdch+A8RUHeYeJYCGgw=;
 b=TAyRydne170K1XnQr4xiLwr2b04XuzpxZ4XoGi5BwupoP1dBd+GmpZ11k/krJhxjV3IuYSDkufvAp9wiW47dJqpab60yVzmuC8oJArwe9EL8VIM/MWAU9SP8c4W+rdpVeZVGF8y27Z3JHyJq5/fAy4osuTb+Wg/OPGHxPeHuRp4=
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
Subject: [XEN v2 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
Date: Mon, 31 Oct 2022 15:13:18 +0000
Message-ID: <20221031151326.22634-5-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT037:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: e56154ff-efbd-46f4-d190-08dabb528c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zoKfpl6yxS7d8XCNz/5HNEqxpTVgr2uL4pDaEC7r313hUyIunG5TRnY/+ulSkZ8w4Q0DuiMo5A/9zAt8KDl8EhqvoOfVJ5gvCS+KStrg0IA+fmy3h+NB7u3EjqUSD+xkfBpN8mgyJeMy+7jVkfPd16OJ1502juJgXMUr6AExsY3erZQCRPMp7PRkkJDjODVTgz0aSqwMZJdpHI40rClKbKwkqIExYBmnmxjgMCSEz3W7Q/8Qusv5vcIoP7Mxnk+Y5C3ciGKlNus2R4s7PvuJqJsnLeOMYvMIcZmAz2DZbZgzXMJZ4g4dx9BqwVpxVgqmzYne40Mg2tmd8NXqUbhsZKPmEn9DpghkABo/fJfJI/csY3aphkPddGvT8Sd7JXcybq6XbuGgMv53D7b7avx92/8m+I2UTt3cgxzzQ6CDtu7CH50jLXl/obBN/ffobr1pa1BMl6RheNVrXUfhN03P+QijxmxtNaHowN5RIiWsYQDt0ryC2BV6PkSnbQy8bf2+Qjsrky271ZWo6t3M+mwXSjbM5JoqjRKbe/rjBD9UF5MBvqzSY9XHmHliWCHj/OMmyMLpX9Gb2wijWCox1EDzBf414Zjo3Od2qFS4+vPAPfMkn+RF+SgxtjT/gYZIrDeJMj2hJhMr7jxCAwqBzmuwizx/nzGicByxlpD4Tyx+stGYlkSwAPKqM9yuJjNOlrgJ812Xf398tAUwGBmY8mNUgt8N4c2+ZgcScKRjCIRGtVlTLIlwAInfCnLgLD+9Lwtx5+5WGdHSpOsZqbBOZTvJOjFhR9jqpvyIfJn2oM02lS3IRckZPyuikNnk+UQlC2Up
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(54906003)(356005)(478600001)(1076003)(82740400003)(2906002)(81166007)(186003)(6916009)(6666004)(36756003)(316002)(41300700001)(82310400005)(336012)(70586007)(4326008)(8676002)(70206006)(40460700003)(8936002)(26005)(36860700001)(5660300002)(2616005)(47076005)(83380400001)(426003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:04.1107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56154ff-efbd-46f4-d190-08dabb528c47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

v->arch.vmpidr is assigned to uint64_t variable. This is to enable left shifts
for Aarch32 so that one can extract affinity bits.
This is then assigned to 'typer' so that the affinity bits form the upper 32 bits.

Refer Arm IHI 0069H ID020922,
The upper 32 bits of GICR_TYPER represent the affinity
whereas the lower 32 bits represent the other bits (eg processor
number, etc).

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
1. v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use 
MPIDR_AFFINITY_LEVEL macros to extract the affinity value.

 xen/arch/arm/vgic-v3.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 3f4509dcd3..e5e6f2c573 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -191,13 +191,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_TYPER):
     {
         uint64_t typer, aff;
+        uint64_t vmpidr = v->arch.vmpidr;
 
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
         typer = aff;
+
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
 
-- 
2.17.1



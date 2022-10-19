Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6B604963
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 16:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425827.673887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olABk-0005Fh-Qj; Wed, 19 Oct 2022 14:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425827.673887; Wed, 19 Oct 2022 14:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olABk-0005DI-Nj; Wed, 19 Oct 2022 14:36:56 +0000
Received: by outflank-mailman (input) for mailman id 425827;
 Wed, 19 Oct 2022 14:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77I7=2U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olABj-0005DC-FH
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 14:36:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78742d88-4fbb-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 16:36:53 +0200 (CEST)
Received: from MW4PR04CA0269.namprd04.prod.outlook.com (2603:10b6:303:88::34)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 14:36:49 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::b9) by MW4PR04CA0269.outlook.office365.com
 (2603:10b6:303:88::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 14:36:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 14:36:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 09:36:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 07:36:34 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Wed, 19 Oct 2022 09:36:33 -0500
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
X-Inumbo-ID: 78742d88-4fbb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHeIn4N/MSSJIX0M0y/BnhXkHnDZSUmuehI5vuIESaa81n1dWPJb5CyX4UhqEaesTDSHwo305ZFCwOvszm7b2i4Ey7PVEpVDoQ7FWtyxO/CL7nMQf0znu8Sg1DUUNEPfAMvA3nWk7ZxXgqBrHPq//ek71dpfuKbzsi8lh06NutAhpv7Ic4bwEY5O+mUjmAkiz28rKBxyH/y0s+g/034RQXeZOthxhd+u/XjBwSBSkWO+/N+LGse4XMXfxZzJ1BnKlfKhqfJB/PxYxMUuvPjIfWN9uj0okqN1vKwVJ0DFBZjoAl+KgsJcw+LHmDC13ieXfcioOG05pRaZg8leABHk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MOdIhXTWf3IsGbVG4GdVVi8MySn/L+Duw9Q6uZ3MKU=;
 b=I4O83/O1kAAZzhD11XYLqYPf3U5subrTlyCyNVXFUwWW0zsTbieBQdSmLSV/fctjDr528pq/N2ShjdRi41UVHS64T5CSv4lIQvfeTUXBvdBXJ11+qKVfqveD3s5pvXUZRjKvmb9IJshlCqilDnvdVZ3/V+kY63nT6P/WwtTjYkuzNa2IhbeAJSPSJCw4XYGGaX0mN3oPVhHngTwkElqBj5Q7czPbNlgUVwtMsoMbMrHet29l2URwkm8mVY+JKRgSe2jpy+RlbYQlU9dWRRt8YVR92RU+Ah6YIsOMF0UPXbl773g5puOsR8goHi8aRxjnY7kcjkDFxw/Qe7SVKw8ggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MOdIhXTWf3IsGbVG4GdVVi8MySn/L+Duw9Q6uZ3MKU=;
 b=PJQ+UOl83eFNTYERO3Tl52yKP8AcNllsQgFfQgkgAooIZ1SqyoNqt7leLgk5QWSYbqzrkw95Xz3oec7HBG3e1Hi1tbDNIvH/mwlXhPvIh5raNSJS1AGZAq3XdewO3iYlPZcK6uWHRPGT36mxouJxGI8m+ufTuO+jq66q+hr50co=
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
Subject: [XEN v1] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Date: Wed, 19 Oct 2022 15:36:20 +0100
Message-ID: <20221019143620.45814-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5ccad1-2ada-4cd2-937d-08dab1df5acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	inE1BqBLxZWzR/hsfB+wb/L1k2rClrcy+YobPDdrS3Tcw58xppmn878BhqH3PxvP2pzAD29BA1em1nPhmBrlrAGJmhKBBuqxVMxl9NGlNPBo3zPt7DiEWwt9/4qkkrD6Kmjm0JEt8sTkMM6fta0S46ktMDkvYuidEjS3fgwIbFh++o+zbpF+GBGWCecQMOYAND9ziIxEmKKPcYun+DmdIAP3LDaq4GGVrTbqHOBwseH95M33adCyler7rV/lC2Z0knqqV+Lyx54a4Y9vuvkfAhz3C+3gB4QYBW7zrdrMBJ3KwxfD2zS/Bt1XQw1iUia7mZFVcjTR7YvUbvGIFU6tFGYA4Z5af2djndHJp7P4YFoISaJu45/JGsaMA6M0FEfF1yYEKqsYPaMZDeY05XP63Pask71HWvfYdcDL0GZQBPmd6z7bHBwSu0pjA27a3E50bd/TKl/PiXvp6Biz4XE1aAa+JyGWvyRak11hhczlS/iCBFAI+jR8gNzaYQzOEDGaqENMnxxyFgjJtTaIF9VyJbCjm2vbESsRxp+K6RkrpgiJxBho9vL1Kkhzbf0X9bpQwwyqxB70kGA+FMt6zCM2TMMPqmabcWnN6WsISC4q6Q3nOrgyx/gLwQvoYe513WYhC+0D+Otc1ttOfHYu7zKgfe1U0Ko56Fd59rjMrbu/EPKhLtc6cF0sT2c7CirOx9w72OtTAxybexWlZy303KgJPtL8jE+wbrSlqAnYRkIydovDScbuAHakEdoMUjRbJQ4GGBL89OgHYyMxXAzxoMD5964H4KkQRPBR80WUXs/bav0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(336012)(83380400001)(41300700001)(2906002)(1076003)(6916009)(2616005)(426003)(36860700001)(8936002)(478600001)(5660300002)(82740400003)(186003)(81166007)(36756003)(356005)(8676002)(82310400005)(70586007)(4326008)(70206006)(40460700003)(6666004)(54906003)(40480700001)(26005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:36:48.3873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5ccad1-2ada-4cd2-937d-08dab1df5acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311

Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
IGROUPR) is relevant only when the guests run in secure/non-secure mode.
As Xen does not implement security extensions for guests, so the registers
are emulated as read as zero/write ignore.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Observed the issue while running Zephyr on R52.
Also, found that KVM has similar behaviour.

 xen/arch/arm/include/asm/gic.h | 2 ++
 xen/arch/arm/vgic-v3.c         | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 76e3fa5dc4..998dd62651 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -48,6 +48,8 @@
 #define GICD_ICFGR1     (0xC04)
 #define GICD_ICFGR2     (0xC08)
 #define GICD_ICFGRN     (0xCFC)
+#define GICD_IGRPMODR   (0xD00)
+#define GICD_IGRPMODRN  (0xD7C)
 #define GICD_NSACR      (0xE00)
 #define GICD_NSACRN     (0xEFC)
 #define GICD_SGIR       (0xF00)
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



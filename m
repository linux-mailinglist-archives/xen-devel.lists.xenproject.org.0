Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C911660B56D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429336.680301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on28l-0004Ao-Rh; Mon, 24 Oct 2022 18:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429336.680301; Mon, 24 Oct 2022 18:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on28l-00048I-Ox; Mon, 24 Oct 2022 18:25:35 +0000
Received: by outflank-mailman (input) for mailman id 429336;
 Mon, 24 Oct 2022 18:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on28k-00048A-Gi
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:25:34 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e810d53-53c9-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 20:25:33 +0200 (CEST)
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by PH0PR12MB7078.namprd12.prod.outlook.com (2603:10b6:510:21d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 18:25:29 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::f5) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Mon, 24 Oct 2022 18:25:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 18:25:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 13:25:28 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 13:25:26 -0500
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
X-Inumbo-ID: 3e810d53-53c9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnEey0Fjx347cCS6a1ye5qSl/p+sKGt87jVhmjJk1Qnpcm+m4jlHaFBTzrzqtnh0O4BmZi+63zNFFDNU0G9Zopd/Qn6BOG9670EDIgxhmXBpLadJ5/Tg/R7OfD+cLZCfHUGvT5brbSND8SXR7t8z/8dGvZJ9bOokEsgcOQ1+MXyrmVU1KeNlhYtiqWGbAS98WO9LFCpEK5kyDj7fnkVOS9GvX6HrLPkOKcanPpaVPLVRmmHo2sRdoc/I/31Hpo502LwfM+RJnMl/TkJIl/BuLxsTDt7KCfnjPxf+QQf1imJOfBDTxTGSi1P0kCl9+Uq0uTBYppmpA6ck94YJBLbQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MocgCiMwjGKC6jmWCbUClFO/S1BbEXwKRDuBTLT5nY=;
 b=ae57cdxg7/KUY9t2yvhuRXgeMCwPfHh9AdTHcxS13gSmhUVUvugjfJ0s6gDgNSQjOwpVk7no0VOHbDP6nrZUvXUxQuzMiBUcT7NCQnzanpiCaKxfCDfyWWFCsZKgy9FrLlSdVaiuy9pv0CdkqTE2Dq9Xz8hGCBlmDJ45Qm10xx00h2vEqjydH3J2VtgsFmP9pEq7EknGDRia8tK7ng9ttQvNoIacjnUVTU6Kf00gbD4p7jSCPEaqwhUhmttayGx4ERYVF4Wtb26IWPYkGwZchUYWREisSo2V0KIGFoydlPFtqgg0kcfvdXIc+z/G0DnVg606q9afbKO/FHWP8ncqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MocgCiMwjGKC6jmWCbUClFO/S1BbEXwKRDuBTLT5nY=;
 b=pQ1x494/c5WIHjAZhCxUfVIIQLMtpmOvMN4PKSbaRET69I+pUmmCXScmD1KKHx4GdOWXdKJnBEmtl0TH9XAx8OeMPLwg/KNmGNppCIH2apA1WFEiuuol5u9c99NQ6ss0NZ5/gzg3VBJVq43ZzpBhOdJxJyuNe+zRVB4ddr75CXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <michalo@amd.com>,
	Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v3 01/13] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Date: Mon, 24 Oct 2022 19:25:18 +0100
Message-ID: <20221024182518.65002-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|PH0PR12MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2da696-f8e8-4e1a-5d68-08dab5ed20e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v8XQ8HA17MSaPNS3CXX+muZklSQuTNVzr9ug7J46vBVW/zYD+5hxpZRPYe8Sy3sMZJsjNnMivIDjJwiBIWPm8Gnm9DTfO8IIDZxoiPVGyEK+4WqwgOK2Gebl/Nw1U8otAo6oWDIQkrgG+BxL9OQVhLb5SnV3XYjfDeUROQ2IEJS7UNsdZV9BGry9N87VgcBuxariyD1E7VvuQQB5S9tvdi3pdo1KIszCn0WHBCFDM/cRXr9mTJmRwlbYYwzB9rUwo6kXEsG6Wgc8hJyui9EA+iROtX1mBwAnO37s80YoIlCDbpPs3k+FE3APf8bOkBDnjzf+Nig5TASWHTBOswFa+3PvR/yRwuEjjyLXflL+BOCpxcr0YzC0VXE8q340eeTSg0FOwWxo1v0n/HvrVp4NohP4mAuKZOQJe9dLUG83wctkyudDe+T30mcJyFAh+pv4YfXkD2j/R2exORsx16CqtoOyprx9jL9QouNvwOe57jUVtzyyN9wcFZ9Rzb7b96dNrCCVHjoX0cisvE93u013453B+r8GdWMqtpemgErPxHR1fEHkzXQdVOrW7WmxnfsSt7k0+bUTKLK8CxSZA54YGd009vEHCDML6RG4AMPULntBIwi1Zn3yMRQYcQ5R3eBfCWzfIBAPmEWPpyYd8bjTqWs96wQE4hgg8uWjTx0WXq/4jDFrYhKt3E7pCwIgBRBkaGPokzCBg/RCwL1ot3CnKe0Q5dEVs2QP2QPx53qvxaZxA7pe3Zv1Ax5VJmQIEAtcLOAv0CvS5ZqoLSA5CmENuOBqRn9lY6btyzt/UtXf38g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(36756003)(1076003)(478600001)(83380400001)(6666004)(47076005)(81166007)(356005)(316002)(82740400003)(426003)(40480700001)(336012)(2906002)(2616005)(6916009)(8676002)(41300700001)(54906003)(5660300002)(26005)(4326008)(186003)(40460700003)(82310400005)(8936002)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:25:29.0009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2da696-f8e8-4e1a-5d68-08dab5ed20e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7078

Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR is emulated
as RAZ / WI for the guests as "GICD_CTLR.ARE_S==0" is true.
Xen is currently supported to run in non-secure mode, so guests will run in
non-secure mode only.

Also, if Xen was supposed to run in secure mode with guests, the programming
of the interrupts (ie whether it belongs to secure/non secure and group 0/1)
will be done by Xen only. The guests will not be allowed to change this.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Observed the issue while running Zephyr on R52.
Also, found that KVM has similar behaviour.

Changes from:-
v1 - Moved the definitions of GICD_IGRPMODR, GICD_IGRPMODRN to gic_v3
specific header.

v2 - Updated the commit message.

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1C625CD0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442581.696945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrb-00028A-2Q; Fri, 11 Nov 2022 14:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442581.696945; Fri, 11 Nov 2022 14:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUra-0001zb-Ql; Fri, 11 Nov 2022 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 442581;
 Fri, 11 Nov 2022 14:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrZ-00085I-HQ
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8252356-61cb-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:18:32 +0100 (CET)
Received: from BN0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:408:141::12)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:18:29 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::49) by BN0PR07CA0001.outlook.office365.com
 (2603:10b6:408:141::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 06:18:28 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:26 -0600
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
X-Inumbo-ID: b8252356-61cb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3mAgt6KPzjmOdXw8z4wOzoKbz+pd/alfqtEyBLF/n4q2MCRbAzg6Zu44rKU7cX9WpyquVR41higJ2Qdz83qdOy9ZEIr8krpBF0XsuXqvRW1GT/iJDeIh6eJFHp7Bhh99vvRMZW3vtldU52P10fBHTHsK0Pgqeajg24pLC4Nu2XjY43RsvTlDh21UsBxrYsXAxpij9jhDhreeT2sc6GdPLEgAABLjvQY5qgHWOmr//v3i9orKuFS66OPvKFj0z1pjsbep/U8ntQWXqFX/pqSMPXWmjP4b/ZX0jC4IKhmch7KDxdxd3EVN4Du6Wy94V20QbZvfCgIPH3Ey3fTdmgLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x+Puzll95MEDtEeq/rqhbLsQp4Myk6gWMYulb4I/w8=;
 b=fxUK2fB5c29H4g3lFQjHvlHl1Qu5EveoTP7/RpeXZAnvprfXnw+Rf2CrmAcE/t0iIARnhG/O+r41mZhqQCKSD+73z2nFp+mrfDWNlebkFy5VLSG1Ja6T6PGE/wXwS07LvlbaV7SGi+z32+fZ9lK4zHws7YVJi2ktgli2jPupaht64A3mnSA2QklwXl9a2vC5snNCUqcZUgo0mLTZbtHOZ5YXnDu37P758CL3gvWq10ZOnEIY60s7IahqVcyYvyW5nWoh+Se5LEksOdGzMHxIsMjiMThOeqD5bvKNXRZTPvOYfhPskIC0MHpGWcOWTHnUsvlxomrieXX/4ZydY1Lw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x+Puzll95MEDtEeq/rqhbLsQp4Myk6gWMYulb4I/w8=;
 b=VjPNbTclx+wX2TMIcN9P94s4hT5whkHBxajjmmbaPpyF9vDMK2azMX5FjbrL5KNTIvK8rKHq9GTy61PdWfvCe9ZkDVM3zwzxTjBFu6sLe4k7kN0z4rLhxHptma2I4eNB6w+eReDGqaaozPkeKAdOxSf5qWc61SoQY0HnRBzZxFE=
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
Subject: [XEN v3 10/12] xen/Arm: GICv3: Use ULL instead of UL for 64bits
Date: Fri, 11 Nov 2022 14:17:37 +0000
Message-ID: <20221111141739.2872-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dcf15a-3ba7-48bb-81b4-08dac3ef9ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4hoZao0metB8SjaRvJB6RFnU7zMBWoaIJ9SVfa9CmnVircOaD+fXqUBPAQucp0DiBEzG/CC2R7sMIMGPXLVl2uKQqkRAm8MxNvJaRK/uW+6ZTJ/fWAj/AfwSOB32rN+Y9zBVX/kOx2/3tIz4J1DNHdwhMTXAH6mTUO7x3GIm1OL8ZGp9B9r992oEXe5D4WLGiAQfFu16DYe5iO+wtQmkURHIQdiT1LxXEnL4nOvhA9/wFukh7JJUTZy8wVeTEjI8pFaT0/cldemBJPnuI1A0DyyI8Rexyf5cj4WgUhpztjKJPA2TLnWPy3+mJd/cfhj7kV/NvOu3zQDzMBlA3nzA5yx/4lqF82G9CrgTt6tPpxevr20PfdGtdJuwXegMnixD77VuZkfzo2G+yEUm2P3hcBfrqpgX2BVkhZsuQv32Q80EZlTg+DlVPCpzdhxOyT9H91ysH4U4+M/RjL6DQQF+Ll0myMBjggrqw75QYASF8me/ll4CvC1NbaNXbGgjI4wOPP1JJZhizyKDGsziUyZ/15g5OcOxzzzGBTbvgR+HHLyqDd0GARwIqehUI7cbKkSi1BgwIBvQy7eHPb1JCCZ9bvTbDyC6SrpyY0qOcWw+Fa1Fmxv6iB8p9a6/gXs+QtKVRGqs/hAQXgm2Gkg6rrDBhSVJ/6oacnXeYmVJgC8YA1lfHF3fWnrcSBWEwtunqWik0UWoPzvmEtM7L9SAIpdm7jgRRhh/lwnbjue+zpB16ay/jbqo8qTs+k2m7a9LU6wCdXjTM2ZAYZERP1nBMU9GOhQ9/rH8fUbEVhmbeQ/Rf7WKE8hjvXXaAHGI3gHzotDC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(8676002)(36860700001)(4326008)(70206006)(36756003)(70586007)(26005)(81166007)(316002)(356005)(6916009)(103116003)(54906003)(40460700003)(186003)(5660300002)(426003)(47076005)(1076003)(40480700001)(2906002)(478600001)(336012)(86362001)(41300700001)(2616005)(8936002)(83380400001)(82310400005)(82740400003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:28.7899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dcf15a-3ba7-48bb-81b4-08dac3ef9ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

"unsigned long long" is defined as 64 bits on AArch64 and AArch32
Thus, one should this instead of "unsigned long" which is 32 bits
on AArch32.

Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changed from :-
v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in hex as
desired.
2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.

v2 - 1. Removed changes to ITS and LPI as they are not supported for AArch32.

 xen/arch/arm/gic-v3.c                  | 4 ++--
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 4722bb4daf..6457e7033c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 743ebb20fd..227533868f 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -195,7 +195,7 @@
 
 #define ICH_SGI_IRQMODE_SHIFT        40
 #define ICH_SGI_IRQMODE_MASK         0x1
-#define ICH_SGI_TARGET_OTHERS        1UL
+#define ICH_SGI_TARGET_OTHERS        1ULL
 #define ICH_SGI_TARGET_LIST          0
 #define ICH_SGI_IRQ_SHIFT            24
 #define ICH_SGI_IRQ_MASK             0xf
-- 
2.17.1



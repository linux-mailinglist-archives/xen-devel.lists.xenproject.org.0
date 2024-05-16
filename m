Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804608C745B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722993.1127492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxp-0006Ls-AX; Thu, 16 May 2024 10:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722993.1127492; Thu, 16 May 2024 10:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxp-0006Ia-6I; Thu, 16 May 2024 10:03:53 +0000
Received: by outflank-mailman (input) for mailman id 722993;
 Thu, 16 May 2024 10:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxn-0005T3-SB
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a9dba8-136b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:03:51 +0200 (CEST)
Received: from MW4PR03CA0155.namprd03.prod.outlook.com (2603:10b6:303:8d::10)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 10:03:45 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::cc) by MW4PR03CA0155.outlook.office365.com
 (2603:10b6:303:8d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Thu, 16 May 2024 10:03:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 10:03:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:40 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:39 -0500
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
X-Inumbo-ID: 97a9dba8-136b-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDu6A9qbnYr0zSFV7lGoYQdZBuadHzWR2oz6a1lXG+WioqD/hnVKYFcEYobpU/O9XPC21JtAUKsWl5sSKI9f29Z79HSMTgo4FYwm3MmhfVbSz2VvqgYkup10iL/Kdy9ByYIjSRwpcWLbIQ49Rd6bshUUIQPTATxDNfpWH23eBO/Oat1sXick66oWsM9JVYMVWG1pXRohTO0ctpSz4jmBwP3XusGQ7wJYBGO619U3in3ETN+Pow7rg3uuFiJR+vngeAEKWtlLYKgrFktezX/LUOUlKd+v0bgjNebASGSDmSLlDlCthZNMZZ3DvQxaUrSexZPz/5jChGX2QqXVSEZXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWIi7CD7ZXy7QHzhQvNqeQnVv2B/6KurT+iAYX495cs=;
 b=FA8DXEaMb8ttkGqE1+eT0uFILbEeo+rjq8k6OTUUD2amOPQwm0s4xmpRB7UyVHpdD8uTrQxBPc76biOg04OtrlpwtnPSGXoTSky4wthu92KIQCNJIbjuvV4bO4CsSxpLCNE8L5iybR99fyO3BaVqGt5eBYxoVqfl5oca+A3xcI82dwmyNhSLrWwSP2wWyUO0C/m03JuLgCAJZ7r/DiSNwb0c7xIeHGtCfehd/Pq0aqhePxbYTtyWTgw3dMgfBYCTytikdbjZ6Lt6f4S5xqF/js1PJRvD0+5OZrj1oCjhYGMGxNvia5u0kUIVd4rjPVWVYhp2UwAvWZN1VmWJDVRUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWIi7CD7ZXy7QHzhQvNqeQnVv2B/6KurT+iAYX495cs=;
 b=4g1YPQZsRLLJ8Zk163NgtuJD3JvPOvaTaMBSepjWtddhd96hhX00j7UVo8i/J7/H1lhDxnf2HCTrko4s4Bt32zBIOUhiQl6YHgLOjEw/7kotk+naJhwBD0o4sf0UIdVp3x2p6KQjdxRQhywf9cYdregRfbXYGml++UH6iQxXTZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 4/8] tools/arm: Introduce the "nr_spis" xl config entry
Date: Thu, 16 May 2024 18:03:26 +0800
Message-ID: <20240516100330.1433265-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: d2388b5e-93f9-4d4e-1eea-08dc758f78cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sanhQ7uQGc63rD9omLVewJWBeEfHtF+cHwOzttmWVDkgzTz3vIiUgsFmxeTs?=
 =?us-ascii?Q?oxo9MrCwoZzKpMzBc1XfpvmJxe4usytmojaqqPIq2t7ZnzgPY6+IJdhn1a3x?=
 =?us-ascii?Q?KwGU8ttFmcioqehcV8WhyI5SSpnxXdfntwvJjgYA+f82EKOySzJaBgfOyo79?=
 =?us-ascii?Q?0BcIyPXFgvNewyz9suPAQPfibeYBVp2TS55M1yY2OcRPGxLuqp54uo9RgLfN?=
 =?us-ascii?Q?NghM6ZI6FbA6fFni6B28tk19KFD17yylICx9g2PXOb3l0chblIKHgGc1ZOi4?=
 =?us-ascii?Q?SSCCuzs9adKnZx73nbiiBdNhuz3w6a2BoeqQFYMsj+y81nx39xXkzs3pWKwm?=
 =?us-ascii?Q?k8i2//ev+TGQQT3nqYvus9q0UDBiMU+NwUmaJ7tdka4g3RrN4qF+G1QZOshi?=
 =?us-ascii?Q?ajWmtui8KKS27jVLaSitYu3fsrUZQ539iNSGcWShVdX5a27DG6ztK/GnP/V5?=
 =?us-ascii?Q?aMtMVmUNGGtf7MC6Szqir7O25wlPn+qbQ1YYmXT+gHuh/3r07RQChKEw7C+J?=
 =?us-ascii?Q?SXnmNOCYbnvmXcb1pdI12/8w8rk/e4uUHUVUSKQwsCiFLhXYDRZpMFmqqwGi?=
 =?us-ascii?Q?xAuszootAydux5M3Tma2fKTk5rUOQZaf6A7Fs9CpEFL6eJ4FJRpxlT1HUfvU?=
 =?us-ascii?Q?xABsL883fO0P7gbA5Y406MTWK2PmnTZNk1tZFF4F2H6P1YoC+3ABH0i6fg70?=
 =?us-ascii?Q?Oi1ZkQMsRD+K6fY8lBpW1myIxscZekcvZRaLdzHdM7nuscJTIgRuvlJ2Ypt2?=
 =?us-ascii?Q?+cvqJmofifNc+zG3FtGIOBZmGxMaYsSm7yWFoeKkRptVuUSGH8gfwwINnloR?=
 =?us-ascii?Q?xIJ98aNwQtNTDRnjwxhHghXE+F8jgkW/F5K7zIgwOpebPTbA3j0STX0EYX99?=
 =?us-ascii?Q?olfXyMnzjPoxO9SMdDksum+sycIqB1/09EpvWg8MptDeiIizC/93DHC/hzbn?=
 =?us-ascii?Q?E9H06Bu0O3XZGLE3YgTVI9CHrKdzlD//Wo4iq0K4vx+USquSWYubMHvlqP4u?=
 =?us-ascii?Q?xH44BavYDbx0CY4w/7NuNU9l5KwQYUatcAgnY1WLa+9BucfBXN7FoFhQ9JIt?=
 =?us-ascii?Q?Yldk+Spx7ayz8tztKVW1Y4ZhQZnsOGVTctWQXYteBHSSa1yru2NlnB62hymJ?=
 =?us-ascii?Q?j3ZV6WLBKaR4dqhWbfWMzU9RvpYjadoLLvaWXW+SIKOffBXmFarN8nOALxsl?=
 =?us-ascii?Q?CVuVG9kuG6gJKf5TEtUiElF+BPnQOu6u4nykNPu2vW/RrBCVnTBvQCLkPMEG?=
 =?us-ascii?Q?JHyJQe68yszaFlyFbouBWDbDh1HOsAZj351yR7gFGlwcMlJVz5Et985GZFQ/?=
 =?us-ascii?Q?hU8yU60tYzezZXg74XJD5pnB9KWITWz/umcnZM98hw6x2zkbVTe/O7mwhhu7?=
 =?us-ascii?Q?JygtJoamCL+x4kdZPc/G07hjYp6r?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:44.5621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2388b5e-93f9-4d4e-1eea-08dc758f78cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798

Currently, the number of SPIs allocated to the domain is only
configurable for Dom0less DomUs. Xen domains are supposed to be
platform agnostics and therefore the numbers of SPIs for libxl
guests should not be based on the hardware.

Introduce a new xl config entry for Arm to provide a method for
user to decide the number of SPIs. This would help to avoid
bumping the `config->arch.nr_spis` in libxl everytime there is a
new platform with increased SPI numbers.

Update the doc and the golang bindings accordingly.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch to replace the original patch in v1:
  "[PATCH 05/15] tools/libs/light: Increase nr_spi to 160"
---
 docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_arm.c         |  4 ++--
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 6 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..6a2d86065e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,6 +3072,17 @@ raised.
 
 =back
 
+=over 4
+
+=item B<nr_spis="NR_SPIS">
+
+A 32-bit optional integer parameter specifying the number of SPIs (Shared
+Peripheral Interrupts) to allocate for the domain. If the `nr_spis` parameter
+is missing, the max number of SPIs calculated by the toolstack based on the
+devices allocated for the domain will be used.
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 78bdb08b15..757ccaf035 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1154,6 +1154,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
+x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1670,6 +1671,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
+xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index ccfe18019e..b7b4ba88af 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -597,6 +597,7 @@ ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
+NrSpis uint32
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1cb89fa584..a4029e3ac8 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -181,8 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
-    config->arch.nr_spis = nr_spis;
-    LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
+    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
+    LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
 
     switch (d_config->b_info.arch_arm.gic_version) {
     case LIBXL_GIC_VERSION_DEFAULT:
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 470122e768..3f143f405d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -722,6 +722,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
+                               ("nr_spis", uint32),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ab09d0288b..4aa99029b5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2933,6 +2933,9 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
+        b_info->arch_arm.nr_spis = l;
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.34.1



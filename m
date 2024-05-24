Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6768CEC5A
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729886.1135193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDe-0007Vb-GF; Fri, 24 May 2024 22:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729886.1135193; Fri, 24 May 2024 22:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDe-0007TX-A0; Fri, 24 May 2024 22:16:58 +0000
Received: by outflank-mailman (input) for mailman id 729886;
 Fri, 24 May 2024 22:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDc-0007Iy-Fr
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:16:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c72a6f-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:16:55 +0200 (CEST)
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Fri, 24 May
 2024 22:16:52 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::19) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26 via Frontend
 Transport; Fri, 24 May 2024 22:16:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:50 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:49 -0500
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
X-Inumbo-ID: 53c72a6f-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTzZuTGnG5+05W5Uf1a//3vm5/5e2izw06KDCV27HWIBe8C0mueHPbJEf61VdJYE2h/EQDbk5cHJmxBuWViFhsbLc1TRVxjqlhVQ3O+JscEXBzvsjcMHxBe8zUteq/eVg3zEVfn7yO8+h25hUX6mX9+Fl5aLT0yusC88UQbnbEvhDdWTtjwLB1O8Eepmr1btqpKQsv4N8Gtx2zMJpuwaoSUWdzDUd+ywW87OXCarIwUghPUBynQukRbNrRaNnyOorhxwyOAnJsy2ByQrBA08uIlWUAE/JOqwp7GALbmOcuBYrWEDPMyHEyI08WJInsb55N2qeN8AJpEYXawVaD2PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlizJg2iClGMdik+Fxv6BQH90USOSUhLLxid+7iVuz0=;
 b=Ej/sc3hrLkuTD/ZOdBItZcOTZgCvZkgb14atfgI2HWOGx2Hlr9dTAJBAQoHiimYxLdpzkKy7cHEMpFf6EkT7slTVllV/crg4av+54S19jgWryPTrzhb0rj4fo8i3C3mRIbTDPnHjIuim6NDdjhpg0wGTe+slmOLob0t920A5JL8eAT1JGzx36RcY2JbD2P7OUft3I6SrrtGN3UtAa7nhqg+XKIbNEGokDox64xcT7Z83lu55pMPnoW21yHPOHIN02vCdEkrIHVXRr66QbrQ7kMfJOWWtEllMMrozwjh1WTYC44C1QgbyN7Wjbd0EKhosghoQIbQe0NoYtpnzWpBtPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlizJg2iClGMdik+Fxv6BQH90USOSUhLLxid+7iVuz0=;
 b=2dQAv7rvWO8m5WNGBKOKSy9yTmkfMUtvBuJYnKqkD8u4hGBbRVxAkt9Ww7puLpDeAHHdXohRQfLe541nZPmSGoQqjkCk++kuG5b2ratM2PZY8VdygRyOqI6DOBq2MRCfHR7IP+hgcfyx4tiUVjpkFCo9/AHXbnK7RcF+XxX85UA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v6 3/7] tools/arm: Introduce the "nr_spis" xl config entry
Date: Fri, 24 May 2024 15:16:43 -0700
Message-ID: <20240524221647.2860711-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ca015d-c878-4a30-07cd-08dc7c3f3643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OMGWerVL3CvW7SrQ9+jFQR7rc6NW++MjeBSJIczUJ3cIrT1WuiLL/mLyUJj/?=
 =?us-ascii?Q?Wpu1awTo/LxQNe41fHOQxNhj8fbJmAhLTWtqv8CacRwVFJhFUM1cdlkLEhgI?=
 =?us-ascii?Q?B1hYz5Gl8/sfKAyv6/rcdSM01BhHLhklG6uh/1k7Aq+AVO8KQ9Ewkv4eLsel?=
 =?us-ascii?Q?M9Fu8df3AxaOlkFutEz5n7tGWgVv5uzZM+xWJ+yXSf3enZX/FwCZi7hztWge?=
 =?us-ascii?Q?+HibR6azoD0BviPVMw8j5/WZZPaBrMm8SeeF33AFsj5RrGWIadiGlt3HBAER?=
 =?us-ascii?Q?FYjbCoNZLdE8hz/JL77erBLq012qpjY3wNlgpGgoMo0s0y/FyAqF5igvUSan?=
 =?us-ascii?Q?1Y3JknGpqBUhxtAyQ8cLSj2W1qXVDIoHSHXAWYa7pjF7ADBuLfZ3HNgCu/xp?=
 =?us-ascii?Q?aevzch5SB+nuBaQh222JSdzARflDwd+QEfdq49wZhxV8TrJStP1WZ7NbMG+S?=
 =?us-ascii?Q?o/wVnjibjfSL9m7HEc82zo/bvxOX8v3WIaOhHpif6eidgJeDTHRhP00Akku8?=
 =?us-ascii?Q?dTZrqBMH1D3Sn86qmiQxKMFXExSAoSaoKOgsSExsRQ0Ih+CNNr35JzskaCNu?=
 =?us-ascii?Q?xG1GOLudtHQAgAKjE5NC9TmnNwjiPNos+xUbAMCR4kjvlo0oDgQjmi0G8wo/?=
 =?us-ascii?Q?evWBeSMbgj7tcZj0h/+av2cAWxtA3Gvf4XCEwi8VC72o7l2Zf/7obynimB+G?=
 =?us-ascii?Q?Rl4YDu1Khg7BVpHWFd5rfX6jSfM/niN6KCf0i79Ms5rqVBRk5YTSiPf8JS8K?=
 =?us-ascii?Q?9+Ub0pTympVGJ/qmB64UM91Knb/wMESmDpAf3MfORrGm+D0GRq1xwC7X8nvA?=
 =?us-ascii?Q?Kmqff43AfePIptfJe6IDawd0BdrKqPneZPaa5JIboHRDqda1C3bl0xIJHvCU?=
 =?us-ascii?Q?+yeX+MTd/0T+CMzXURCmmunvRQjsK1p5N65cOJ/G3FvIwG1AE5ai+8HP+SOm?=
 =?us-ascii?Q?SPwuCnf0SKcCmScrUefZrAlYesZZ4jAKbk6hMeikPlYf51OPD3ZG3W2bGIiS?=
 =?us-ascii?Q?B2cTd4F97ScwGiREx+inlG+zG2Ze0SfEcTt+JSTvMzOvCsa1EzZbVtNtx29L?=
 =?us-ascii?Q?4As2Itcs75kcrmf5gN1OApJNbrfCUWlK/BEZzwEffrtraJUNyWFpDLI6OLdO?=
 =?us-ascii?Q?NYY/NUTAiQ/PJhymBRyLTFmx83oA2gw1AMwTBJgU1eXB613qFTzjIg+FklPm?=
 =?us-ascii?Q?D/n2064WZZEdmKhq6Ax4AK3rh8C+YqlhwhLNiGUkb9PJEKgoI1CeIx4W1qdG?=
 =?us-ascii?Q?wRGLGLFHivsM1bAEz82uUTaGVZVhWeuUuo1fOzifnjqMggU9bwdOOAWTnpsW?=
 =?us-ascii?Q?jREUPY54aHGRnKxEQQTXKXYyqAfBv7voQxpGDACVD43w/t/EbSsmcl/aSgLF?=
 =?us-ascii?Q?6eXMS5A+wKukOrM0l8ltG2APEy1+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:51.3820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ca015d-c878-4a30-07cd-08dc7c3f3643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205

From: Henry Wang <xin.wang2@amd.com>

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
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 docs/man/xl.cfg.5.pod.in             | 16 ++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         |  4 ++--
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 7 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..ac3f88fd57 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,6 +3072,22 @@ raised.
 
 =back
 
+=over 4
+
+=item B<nr_spis="NR_SPIS">
+
+An optional integer parameter specifying the number of SPIs (Shared
+Peripheral Interrupts) to allocate for the domain. Max is 991 SPIs. If
+the value specified by the `nr_spis` parameter is smaller than the
+number of SPIs calculated by the toolstack based on the devices
+allocated for the domain, or the `nr_spis` parameter is not specified,
+the value calculated by the toolstack will be used for the domain.
+Otherwise, the value specified by the `nr_spis` parameter will be used.
+The number of SPIs should match the highest interrupt ID that will be
+assigned to the domain.
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b9cb5b33c7..fe5110474d 100644
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
index 5b293755d7..c9e45b306f 100644
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
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..a3d05c840b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -308,6 +308,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SVE_VL 1
 
+/*
+ * libxl_domain_build_info has the arch_arm.nr_spis field
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
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
index 79e9c656cc..4e65e6fda5 100644
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
index c504ab3711..e3a4800f6e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2935,6 +2935,9 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
+        b_info->arch_arm.nr_spis = l;
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.25.1



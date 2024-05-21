Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B78CA770
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726500.1130815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEV-0007Tr-OW; Tue, 21 May 2024 04:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726500.1130815; Tue, 21 May 2024 04:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEV-0007Rg-K3; Tue, 21 May 2024 04:36:15 +0000
Received: by outflank-mailman (input) for mailman id 726500;
 Tue, 21 May 2024 04:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HET-0006hu-G0
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a60a278c-172b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 06:36:11 +0200 (CEST)
Received: from SN6PR08CA0013.namprd08.prod.outlook.com (2603:10b6:805:66::26)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 04:36:09 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::2e) by SN6PR08CA0013.outlook.office365.com
 (2603:10b6:805:66::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 04:36:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:07 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:06 -0500
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
X-Inumbo-ID: a60a278c-172b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDQjP1EqJXQPNeWNjdHFD9UehBjTc+UWgjTa9vgYXI5ZQCbOtn+60VAWSKe9LxxenbyeBXZ4ztO0My6g1GkHh7Dy3xtltz9v2nc7bPcWmnwGw0jWR7Lz/ciW83WYrESMZ8Gkf8X3w3IYTVogJjQxqSXcj3amd3fQzuiLTPewRBidgiCLSy6mQ7Mp7wSNdsn2Mm0h6U8nYb5cgHtho3vp4nLhv6+EM1RjSgoojqHA6KqzdRLPVwTekZ5wFmh50mIM8BQ5itvWDKCbF7/Yo/qQX9fmATX/x6MOiKNi7MmeCVy7/unqfu9i2W9fijRGBmClMndmBhyDg/kUEoe++zKVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wmo94nWRzmCLwFNiswsI5NwrIKUvcZBhuU9kpPno8cI=;
 b=MuTKnAyNK2o8xX7o6SDp6A891mMXTG44akktQgjKKRmyd3MFHO2qAHd+KF5M7HlpJJUICPEwh/sGFqwNzy8sdju06CoRLISMvW/T2XxRn09voqtuGreKhAjyNiG6LkPP0G+DHfA6QB1M4jyfU6tMDZjEtcNNDul4lMJn8sKnI/Hd8xPuNHkd6a/NNo8pcTGBecuL2+Cdag9aSgKc2Y0fZVd1GkVAJkMfSelmaMQcFegEqwHLuOTh3QstkZP3pFHWDgh3FvIF8gJOZpf366ghIpqtm31QqqOWtWu4USk6g9cPAynizE+T/YQxUjh9kOVS7dCjm5lBIIlSmYr1gVulSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wmo94nWRzmCLwFNiswsI5NwrIKUvcZBhuU9kpPno8cI=;
 b=VtzGigXWO1TXy7+LJWzdx/zB5q8KIXX3ilObFOh7Y64la3MLf2C5wgA75ZDrQCjK/8/q0DmT4Nu1kq4uO32j5OOGUdWts4wm1t7eQmUhKF4giGY52vQedkOV4jIwzLu3ZA250d65e9dCwq5JYEv2TUhF+wZP+4gf11rfKAl3XxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH v3 4/8] tools/arm: Introduce the "nr_spis" xl config entry
Date: Tue, 21 May 2024 12:35:53 +0800
Message-ID: <20240521043557.1580753-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: b5279e61-7b56-48d6-445c-08dc794f88da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aeCy5ecntFfY3oyUBQxWx8biEGZ0cvsquN4WWY6TASVCBEwTeb33K4l/+GSO?=
 =?us-ascii?Q?hxZvWSd3Eqd9f9+tgXLrK/fKaYSKfWoYJSET52GuFHKq/FL1UsIAOEi2HFLY?=
 =?us-ascii?Q?QNCJsJ7V8HghPC0E11SEhYKA2kIWJ/vc3sv8vBcvlijeIiqG27C6HXsfGw+U?=
 =?us-ascii?Q?rzwoQwJ5yordmPMya18GB6QEpN9qapYeG6/GIyJANmEBCv2OkIov2h6lctlG?=
 =?us-ascii?Q?K96bcH5UlGVAk7gQZUoLRxT57XPwVMx9GwY1rATUWUgI5KhZ1FpR+qZCstXM?=
 =?us-ascii?Q?WhClPcfGIpsU3hjIaxX4YqDlVNbByrmj4OK730wqyKntdephWtfDYTHok5q6?=
 =?us-ascii?Q?Bu+Bp2eFzq05ibOYtS9G5urFJrowdhjBgxH9SWy3MUW3xz9Ik02be76RCjHH?=
 =?us-ascii?Q?5YOCfTvZnpbzihWWFI6oIFct28UQlD+r2qZq0ngj3va17cCFoENuTV0hNSQX?=
 =?us-ascii?Q?4e7vTw97xI8d2GGSgzZP7r3aaTmcdIs4Wd9XefPQMkEBUh8+Ao2/Tf4aEDN5?=
 =?us-ascii?Q?8SbiLz1DaYlfma0HifwOeUDQ8Q+OKEBhuKmt8FUEruyZrtiAT0wDOweYmvjs?=
 =?us-ascii?Q?J2qvNAYblK8/8aR6RmJE5d7HsUaA5xT5bC9zo00PS3GlD0ikGgWUw2/wBJey?=
 =?us-ascii?Q?xPXVo0gvV55SwenAAOEsQbqwaJu118E+w7DfVbQVfD/5oKeWHT3M0/r5kKoM?=
 =?us-ascii?Q?kl9bySgiFPL3OTPbcMChG4SOBcO8LR1cYcZ6XE+O4rTL/mWcAYR4sP1RycZk?=
 =?us-ascii?Q?70QKhF/HWfpDAzk0sZETUuF1Ge3XV+wtCAYF01MwGPJ2MdvsGCDWqQuloR1u?=
 =?us-ascii?Q?kLcggf3eg7KPmzcv/QBncENRN4KdQkE8+tZhGBucDE7ltt5pNjQ2T9biCVgt?=
 =?us-ascii?Q?b0n8Xrvy1fJsLcjvT4IcdPrrEdfV6HxLabI2JhEA58ZK7rfi2YcKaVrvGLfe?=
 =?us-ascii?Q?03rzuA2qC0wAk63vPcP16ZX7yxMRtnm0h+0XAm8HYxyWMriN8Qf32f6FnKxo?=
 =?us-ascii?Q?JJiVoAY3E+ZHg5fQWZYPqrqop98P76fzqo51i91xsME33XnI20QXZ/IaazhP?=
 =?us-ascii?Q?terScFBDMTvy7YiorjU5Q9XzdEMk5/++MIgy4HooFhnjs0F3pmEY2x+UOS+J?=
 =?us-ascii?Q?39NvyMFoCy0sq+uEvU0wAfry3sEPtTOEUgsHFKi31/cga5I9rJemX7wDZaAU?=
 =?us-ascii?Q?DAQy5h8lmdgZh/uGhMU0kz9DL0384zv1mDxli4xKGN0OF3FkvUkGXV/eFNho?=
 =?us-ascii?Q?kwFwVx0VPimtfaae5XLy4U1SJ/Id2jlTF22Y9DHTWLlCIoDkVQP3Ot0y+IOp?=
 =?us-ascii?Q?QMsf+Pyk8o7wBeRd5hYrBvfVGy/neT7N/074CK58wN7mU7DcgP171BOrSA4R?=
 =?us-ascii?Q?o7XbjG2lj6hiU81hKRsFbO3fp+gB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:08.4682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5279e61-7b56-48d6-445c-08dc794f88da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255

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
v3:
- Reword documentation to avoid ambiguity.
v2:
- New patch to replace the original patch in v1:
  "[PATCH 05/15] tools/libs/light: Increase nr_spi to 160"
---
 docs/man/xl.cfg.5.pod.in             | 14 ++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_arm.c         |  4 ++--
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 6 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..416d582844 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,6 +3072,20 @@ raised.
 
 =back
 
+=over 4
+
+=item B<nr_spis="NR_SPIS">
+
+An optional 32-bit integer parameter specifying the number of SPIs (Shared
+Peripheral Interrupts) to allocate for the domain. If the value specified by
+the `nr_spis` parameter is smaller than the number of SPIs calculated by the
+toolstack based on the devices allocated for the domain, or the `nr_spis`
+parameter is not specified, the value calculated by the toolstack will be used
+for the domain. Otherwise, the value specified by the `nr_spis` parameter will
+be used.
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
2.34.1



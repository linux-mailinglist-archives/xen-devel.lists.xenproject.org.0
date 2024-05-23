Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191EC8CCD29
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728096.1132893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34L-0002Hz-DZ; Thu, 23 May 2024 07:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728096.1132893; Thu, 23 May 2024 07:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34L-0002Fn-9E; Thu, 23 May 2024 07:40:57 +0000
Received: by outflank-mailman (input) for mailman id 728096;
 Thu, 23 May 2024 07:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34K-0001WY-60
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:40:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c93c26aa-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:40:54 +0200 (CEST)
Received: from CH0PR03CA0328.namprd03.prod.outlook.com (2603:10b6:610:118::14)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 07:40:51 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::c8) by CH0PR03CA0328.outlook.office365.com
 (2603:10b6:610:118::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Thu, 23 May 2024 07:40:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:50 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:48 -0500
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
X-Inumbo-ID: c93c26aa-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GASANB7wRfDiBw1ZYy5MobrfNCEfRYjgsrg/RI9Os1jl+FYX8BtBBlsH2i6cm0Zx5rhfpcNYvoon0qGoYlky02pMMaAG7C7BlMh8+c2uOkoZh+fogGwJxBT18uvpXXqhqLRL/p70C75TwqHAKykez7Zzefbun15eQntzJm98y8yoT64NwCb+Am8oBuTqczJTcXXWq6T9vqHcxU1d3r/YNySJprxtD/pSXPrvfehaE7LxaZcacR/KCFCPMjiwxQabclPXi0DsOlMOrsVvmdiQ4wXVzEjAK5LZzyFiwf5RqNkIUQQMcnIWmJ/NuDA7dwWDPhR5WEtrcYh0pQkYOCg45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLxhi2kA+DFIhfmJBOruoj4kiXc2RPsQrpkdr7sIoWE=;
 b=GVmSctfn71A0m1gonkGAMKOeFxZbt20ohEYTYxQCIPp1oP3L7lW8xv3S3Rm9dqRJrb6E8W/IImqt/oAlmrKTjJUShz7PAmfQcBPK2a4uz58cPPo1ifLksBODz1hmwbZ68L9l7VTGCoaYTekavu3/QGmy5cr4Ck4WxQN8Bj5R2GGDmqKh4TroRksRb3kVj78kRL+opHIleJ0Gl5uybTBZfud/tPYgkZytNeAI0BOKqM+84dSNp5h3Rh0HGEKplaRXnlJie6ZzOhKFDl5q+fv3waqRC2SAffuy9cYUPfxR9NaXIecEvL8rzQCI0sPsEbb7UOREOxv0euKyolsoSnMlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLxhi2kA+DFIhfmJBOruoj4kiXc2RPsQrpkdr7sIoWE=;
 b=aRguojq0DNlj0lcnHRcOhH6ezOWHKdVvcV/CDw4KPrD1YP5uaohbpDqT26/qwbSr5Jmn3St02CrnbPhrwAKjDTRO6fdGNk4DMET2i+xzmpr+Vei14dfgb4M0B+1ZVnWd2UCIQ2otTCapcJaaSRpKmRUcExijgJ0lLrwVB0oPymg=
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
 Gross" <jgross@suse.com>, Henry Wang <xin.wang2@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v4 3/9] tools/arm: Introduce the "nr_spis" xl config entry
Date: Thu, 23 May 2024 15:40:34 +0800
Message-ID: <20240523074040.1611264-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ef06980a-a40e-4bda-512a-08dc7afbab4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DQVn/2bkLGWMeex8Bl0oFAwDENUj5lUQVM7JhtUDpuqti28h65sxsB0XEmcW?=
 =?us-ascii?Q?vu9Ll/jnDvQt2y8gPiOSDM+kqrLse/yY9l4shPu3u0tavdDdN0ny0Fovzz3P?=
 =?us-ascii?Q?XO4vYyEFHd4COKWGtGJIY/vXuiFIlvdNwY+etuJYDnbshwKdKr/FwHz+d79E?=
 =?us-ascii?Q?k0XQstTzeJhaAtOANh72wnufn7Y55/SpfRPtOIZjj8El4mAreYGQRUR2/Vuf?=
 =?us-ascii?Q?N9ZMG/wcoNsXu9f9Wk6JQ72EG6dy3oExY0XYaDy/U7DEZu9n0ohqtSo2+fNo?=
 =?us-ascii?Q?St/QUCzYNbvTWwM/xThDEUpxi5+HTv8cX0a8EvVj0XaH3MrC3qmsXfhdDo8y?=
 =?us-ascii?Q?JE1q48EyV6jJYwFGqEcRomaccr1wLMWOW7rycs/ZuTc5Ee22l+GOerac/fUx?=
 =?us-ascii?Q?rq0gm1t6eEr1ESi0x2xWji5qBG+FOqlt+cBbmaX51/QKi0TtvoMdE31nBm3/?=
 =?us-ascii?Q?hmHZ5xcSC4jnE+z7HRiHpgQ1wc4Dy+J7DLh+/hKpuNYGJK/hBL4ew8LcNS2Y?=
 =?us-ascii?Q?J16lCobsWuMKWuhorTcL8hCQiAGiKG2xp90g4ArdCTPIuB36vLrDLF8FFB3b?=
 =?us-ascii?Q?BLAFjECIsS8qPv7RJw9STMKErZ3tjSQGZb5t9r4KweC4dd0GNBm2vn5qNK6z?=
 =?us-ascii?Q?rV+hzCMqvkgDepTCbjrLzVMShw8k37hSM34lMNV2CEEadENZfUIp7OHXGsZD?=
 =?us-ascii?Q?l/pbGiYaj9jPOi6RGX8O8MNgIaD9/mOJyHO6okRNPAnQqEdM2qTT8Bx6Uz6O?=
 =?us-ascii?Q?m8Y4f9/1zpTq9BpNAqb8FZ9EGUHzNRJkKzX/B4vneUSKUkHggvr99QXjIzjS?=
 =?us-ascii?Q?nrYoFBiBXdf/6cdl9uFLiI5mzqNzQhzeP9RR8v7DF99eOQFHOM8j94M1JFr/?=
 =?us-ascii?Q?VKHscBBu1HrkYTNc0unvXPzsI7QQWu2etFHUSx7A65q1AFt395qgd2Emgo+X?=
 =?us-ascii?Q?Ld9cGnRBeCt2HK5dFTfI5uv+PCygWP4OPLsYH/qf5515ANqP9FTmVZVAR7N0?=
 =?us-ascii?Q?UVgwlScJskf9F6cavBKbnGSznmxfN1OKEiq0lg4/BuAVnKQPu7yaIEC4ycxq?=
 =?us-ascii?Q?8mXrXtLm2Ctrgxu01DFziwjXHpQldO7b4y3pOjSd5rVEnFd/mu5wIfG/GdIV?=
 =?us-ascii?Q?w7ydpqv6YMonOKAiHtMQIW/OYz8fyJm3RU8DsswCWOYUGX7sXfa74orrLJlJ?=
 =?us-ascii?Q?FG7yn8CcHYj32AFNJY4W59+aXgH+NSPacbLBggyQCuf59WT7a5HSP1tFH34o?=
 =?us-ascii?Q?D8j+W52GJqVgG0gLPR8sG14DWplVOnvaJ9oXxzknj1EM+9d+gSfsp6SpmJnW?=
 =?us-ascii?Q?IpRVXokmg06Iq3R09mQ+Xx8DPHYKdCe5zm26dM2Tlpvtc6S7i7dMyuhuLyhs?=
 =?us-ascii?Q?DqcrNmBSJiGCwkGht0ZC078NUjjs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:50.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef06980a-a40e-4bda-512a-08dc7afbab4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882

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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
- Add Jason's Reviewed-by tag.
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



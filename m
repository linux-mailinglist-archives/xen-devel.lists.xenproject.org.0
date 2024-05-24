Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C558CDF6F
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728986.1134106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW5-0004Xg-Gn; Fri, 24 May 2024 02:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728986.1134106; Fri, 24 May 2024 02:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW5-0004Qj-90; Fri, 24 May 2024 02:18:45 +0000
Received: by outflank-mailman (input) for mailman id 728986;
 Fri, 24 May 2024 02:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW3-0004I4-I9
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef6d3d0c-1973-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:18:41 +0200 (CEST)
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 02:18:36 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::58) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Fri, 24 May 2024 02:18:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:31 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:30 -0500
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
X-Inumbo-ID: ef6d3d0c-1973-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ1cVyFSk45uNtO4JrLahA3+fbml3QYQGvxMfv7PlKKRMWX9MGtHcvRMPr7jnd4qchyQpGkg2y9vYpWBF/qwMZxYNptbD3dbsjtqpcTZdaDdEBN3tQXhyPKzSmEooGARLivQ+y4hKBJhbvA4oYp9AmUqaEtDVvhMUrakTgXDLArP3sji41u6X3l67JofKRzyot5QmWPXH5XjluWfeT88rzRcJ1Mcvm65yKoH1O5NPLoUd2NgZY1YkwraduWypRhPzAh7lSorZY39Wm/n20HYE2gmLvaGqBuWuvrbOArFtMy56FtxvQitrLekh20M1dddzPFz9VkoqCwCBkDVPFwH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mNtauRAgY1rxPk1todAfJ8ZkfStKgBmhTiRwKw4AV4=;
 b=BWZrqlIqrIxiKqV6e+GcVw2sR19dpRDtWWzNGbK/4h09inHRlIf0lWYL4z2/yt2qnvXbCNp+tW2pP/hdeEDq/EPVYBwQ3QXdaYtsS+0gJQA3/+9T7ZgxSzUk5grnJIwThfwA+wdTAyguTsjq9XYS24Kl9zhzhyCo+iooMmmmZy0OeH8u2yxW5IbZmYyn19+ijU6/gS+/9ZMBrFriKYDCm4SVxEDjvOL2ttkSbWimuqbcjc1jlk2mdoqrsZSBx7e4Ssxw9RQ1cB9UJelfa0RXxvnmeRwbXs66PTQGuXY6uH7PRz50eWgZGemfw9NkMOzr7Z08fTcjVPI8SRsvJWM7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mNtauRAgY1rxPk1todAfJ8ZkfStKgBmhTiRwKw4AV4=;
 b=WjLVyQOMxWRcT3Z7Uoh7cQgmq6ZMIfqxqguqpuJ+QivQuyx2+P/zI7B/Am596KkRSES/Vyt5f0WvWXc8mBIXdFNSe77iCAcxsOtejttJ0hsl3La/6anEcokRfYOfJNb/nXalpBR7hZN8OH4dKcZylYrVS6pmSyrfrnTFsae2wuw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v5 3/7] tools/arm: Introduce the "nr_spis" xl config entry
Date: Thu, 23 May 2024 19:18:10 -0700
Message-ID: <20240524021814.2666257-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0533cb20-300c-4f3c-9cf6-08dc7b97d173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xvzB2S8Mdd/V1lOkTCHoHsYjbP8BJ82IUoJz4SG44qqujlM/JeEmeg/o4hWK?=
 =?us-ascii?Q?jOUEOXhgOOOt98smd6i/4mfeYcM7TWc+D5dG3t65waDdDu3icSO/y3UfnSVy?=
 =?us-ascii?Q?1CVPp6Bo0ntXNfregaD8ZmjkvD1mY3bT5oi8ODXDQscq1UPST2AuOEjqanyI?=
 =?us-ascii?Q?SqhL8Q5fC7pKJSsZO4q04UEwOxB2Cmv/eS9BrQksOjKFzSM0hxBkyaisU2eE?=
 =?us-ascii?Q?4t2pIEuXT/YRXERnaWznhEsGh5C8I3kvFO2E/zBi8OGOlCfNQSOr8egoYnTf?=
 =?us-ascii?Q?DYuzGxz+u7l+HwkzOYDaQYoyIu5eTv7FS2ztk6EXGVXMc4LcnWC4MUrTMCpx?=
 =?us-ascii?Q?uDDjo4Fo0lmXiprdWzOCOy7qQQDDtDMNQjyiNp1inkvv1FIOVrydzgu7ZrcT?=
 =?us-ascii?Q?fR85vlT02Cfj6X/VKjDSOfgywu0Qk/+qltZhVGe7G+Nz7wAclhFBX7GN0o5z?=
 =?us-ascii?Q?Q9zAw2khbYv5iqzz/sFEITNPFIs78rgLctOxM1MW59Tw7DkkF3mWMu37jjI2?=
 =?us-ascii?Q?+9uaBoREG4xB8sND7RKhxgSwQAJOr6cu0Qqn/LLablqVNdi6QN57crfeA7fh?=
 =?us-ascii?Q?JsPLdNLS1K6yiym8GXSr/xEUVBoxkYgH9Ye8hdTXTWMNHuZEXTVFG4PwMjTQ?=
 =?us-ascii?Q?+nsP9Xo4cTM5BwsjyZFxbxNrCqZkrbNLHjDc5P7i1KpW+8r5ftcsyphDuPIb?=
 =?us-ascii?Q?w35C6OxktiV6Qd0CqG39INMB49QoAYgUW1DUqylXbYt+nrIBk80XyMzz2WPI?=
 =?us-ascii?Q?AdwhBmf6tUgLJeLr7MMu086V4CJJplYl4lPji7dojF+dQU9jjZsXGOnxPzOr?=
 =?us-ascii?Q?+K92pAezFiDT9l4JGpjnqJMmr94wwgBGlVpX0sDeMfkgAQWYoqM7CzTCKUva?=
 =?us-ascii?Q?6As87XSQVqnveykz2hItApdOCYZ00e54NvQoNe8B8A0NVmhHRpvd1go1EVWR?=
 =?us-ascii?Q?PYmBravb0PFbmAEQD8APkAhnWR5/Eb+Qv5YtMLJM69PcGhOsQ0yNUPesrD/E?=
 =?us-ascii?Q?hQusKKbHN4/0Vb2zGzDGS+Dxx/PDujFxifLrrbiJ7J4t8RueB7Er9Sh6L0RC?=
 =?us-ascii?Q?StGMhrHQDI4LyUqmuZCKk3Q0IIt5L2EFkFECSWt5XY3pp19W6QAIDyj8N1sK?=
 =?us-ascii?Q?bdOcvM58KN57KL2OWN6xqF+1WjV7nzpUgAB2v591BLCFRORrIC6q4zyIqLYe?=
 =?us-ascii?Q?Jib9lZ8VBrpWUMNFdNRiAnT9uhTYdSS03TvFVn/IquK726zV+t+CgYIfgKLS?=
 =?us-ascii?Q?iJC3qkE4tifNkJUS0ZmQDGP9Rd0QVbdELO2uUOkEZo3/O82oFBV+ZlR/VqF7?=
 =?us-ascii?Q?6Bp/D6tUY63IcCIxo0oO/GjEpKmm0Oxsn9kNWYLPr7iYl3Y+Cu2RnMJeWQEx?=
 =?us-ascii?Q?D4+l13/EOahBPH0nDw/+lLeMnWYH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:36.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0533cb20-300c-4f3c-9cf6-08dc7b97d173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341

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
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_arm.c         |  4 ++--
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 7 files changed, 32 insertions(+), 2 deletions(-)

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
index 62cb07dea6..3b5c18b48b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -636,6 +636,13 @@
  */
 #define LIBXL_HAVE_XEN_9PFS 1
 
+/*
+ * LIBXL_HAVE_NR_SPIS indicates the presence of the nr_spis field in
+ * libxl_domain_build_info that specifies the number of SPIs interrupts
+ * for the guest.
+ */
+#define LIBXL_HAVE_NR_SPIS 1
+
 /*
  * libxl memory management
  *
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



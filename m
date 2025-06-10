Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E728FAD4724
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011227.1389605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tR-000642-Mr; Wed, 11 Jun 2025 00:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011227.1389605; Wed, 11 Jun 2025 00:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tR-00060q-Jk; Wed, 11 Jun 2025 00:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1011227;
 Wed, 11 Jun 2025 00:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP8tP-0005ZD-Lo
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:00:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2417::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 157a6155-4657-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 02:00:29 +0200 (CEST)
Received: from PH3PEPF000040AB.namprd05.prod.outlook.com (2603:10b6:518:1::4d)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 00:00:23 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2a01:111:f403:c902::15) by PH3PEPF000040AB.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 00:00:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 00:00:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:22 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 19:00:21 -0500
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
X-Inumbo-ID: 157a6155-4657-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzXkmbVAl45AEJBMkdvFzbiFERSXIQid7KmoW7WEahhwrfBu9O6NEmcUdmrC4aCNLSosqJz0EYqgTuSEgkZOqJa3kI5r6daYwir+UExsFctKiHm+3UvGoB69t8hFtzrNuJzKA9klvFbSvnVJG2BzfUY7uara5um5duk1mgAoB1D7lDttbr4MLU+NEu4Tz6qSIFI3WWWiWVIsy3Xtbu1d5sehBCV7EgEZyJqqB7NPrUNe0QrOkX/B1HhsAGv2KyP3ypdsfecCDBHkBESXWQHVEvKYMrT3ylqx32r3BUyWDkHGXJOxopUEX1Noz7GSz28CHfdlGwrn9YYEC6RMoC0Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdLqkA4EvLX02tBUyJKyjGQgzohmrtGsAZgJTfe1LLw=;
 b=DZtloHoxG9sT1lfDWr7nw3GyMME/vxm9f17Kk/CpmyHcKHwOel3zR3RbLhAwpiJcRKyv2qmUXlVOmiXO+MUZrR8+52M7SYmbQPMeHY1/hoMicEjxNL2ScEFxKqzIDtZRWtZWBk7SZ/hh/TRbPztt0Uwf9cIUM8J4uUYXq4kXF9wwE4IjGbB3y02ldyecAHDKMFJmk6v8Aj0B4wibhukkpxyejqpXrwVKoWNNGE2kXXfdH86sZuSiIef0IscLt9+JNmjLi5In+SD3dPNZSRXiGzs/I920bPsIcKK9b4IzAoGVb3AXZCqc2cehy2vc+onZytqd3mGWYu0uDWU4tiB5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdLqkA4EvLX02tBUyJKyjGQgzohmrtGsAZgJTfe1LLw=;
 b=q+fPyQes+m3+HQBY4T698VsdJp26wr1oxnsvvFB+qYElukenyRjz+bC0pnCvqznTv6D8YZ0zCyg4XbnWIeYbbpMJfSebqrFQQY6W6MBT1N1ZEkJRxbUlvstMT0AjVf4xldLd0exjyzdqwarvINLQ8KD6lRZXM8NJAQ3+0Flbpvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
Date: Tue, 10 Jun 2025 18:57:36 -0400
Message-ID: <20250610225737.469690-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610225737.469690-1-jason.andryuk@amd.com>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: b829edcd-9a12-44f3-621c-08dda87af660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7d/lOFBrlRJ7S/hjSF48bWBwuLmsIQ+c03Wgri238ZvUMguOchGFnllEpWqY?=
 =?us-ascii?Q?YfiastXJDukhrq9Y4viXDyPn0fPeVXzlJOdS/LxgiXSvs1ZVbhWaVNLOhsWg?=
 =?us-ascii?Q?xfQJAir+e3493/CGGlHoj8IagtoY7PailaTaodPsq1xXkSAGZ9AKihJveCOu?=
 =?us-ascii?Q?U3JyKZuvRBjCyAF9D8eitRyHJC98Y7D9pg63s7QdUGOOGTNPpl3b3JwSHLoC?=
 =?us-ascii?Q?GZzXH+S9FMcMLbNTHSlTRFIloH/pz9q1PHNNRr0YPMSoFiX5GXPMeOQ32hiE?=
 =?us-ascii?Q?8RpHsPUVyUJHR7Ur5YIUzlhKc7MK/TlVlC8c/9jXLwUH4bUmrA9UkulbOYp9?=
 =?us-ascii?Q?ERCLS+2jK+c0lQdkzdfXjCGjqV2GrOcWfsYVOerJAsDLdiK2r2inbKFr4zkc?=
 =?us-ascii?Q?t+L6Zmb2fmGFkTF7HvhihYJyHq5GFGM3+7/WLeixOPYT6qs1pey9c7Gn2zmC?=
 =?us-ascii?Q?Iz4A1wch6B8BFAUxXEnzzFDcs6zvYmQ5eWOoK90IJkRmLNcPFeH5Nfb3F+/M?=
 =?us-ascii?Q?9i1cQcMWzfKUUXGsq3H/nSxj4HtkN17IhLpD4uP9Y7NOAez8zwAzLq7VIr8K?=
 =?us-ascii?Q?5RN3X0bK5l93x1YQ+3AHQCyC8u1bggMEo8QAJ+bUItuWiQTndVgJGKgq1Ubk?=
 =?us-ascii?Q?mQ6IRaTXMEdsFqq0tl7TskWBprD3vt4uceskpsdGcuKLMr0bOCTEKGUv4/9e?=
 =?us-ascii?Q?uE/VuPs6qwimMcu3DRqunxlTeDkd44qimxEx2T+oeNWA+PfkrRzoeC0SnBbh?=
 =?us-ascii?Q?jiJOxySsa0eqKfO54X9/mzqG7/WN+X2nwo/42kCxPg00MDD+5a3AsrF4Q7Kr?=
 =?us-ascii?Q?hPNzOeVgVyKwACGP79D7MyTmFyNGk9mYliowKSB9QMBtC+lmqawrxx82m91F?=
 =?us-ascii?Q?Zrn2DLLYJlGuYTgFOKXmvsKL6pGGbrXxW8sLPYzmE7Y9RrnqPph0z4C0yw5Z?=
 =?us-ascii?Q?Dxq4HlhMHQ/+UelxUbem7WXOCPQ3TMMpXuvTAY6Lio1mMwjn7Y22nXRLsdXa?=
 =?us-ascii?Q?NpkYcZVGYu3s2C+NwSuXGx9OnSIOTle+EJ8jj/vNLBAluZNcTTIEKTZxQczU?=
 =?us-ascii?Q?fBpgkJyBmw4VPHzT9tjwsE4QWwuvvkKm0pRAmD2GnVru2ix+T0C9en8tTQKP?=
 =?us-ascii?Q?PzU+GDk7Fj1HqQoxBte0kWWvcFI9a/oEF8QNnZLzNvutkpkAQ5Wrpz9k8Xyr?=
 =?us-ascii?Q?UQVWd7FDMv/LRMEQvCv3UKs3+WizZBxZ4L+PBsP+NK9rSSqVHQNvMQM9UqTW?=
 =?us-ascii?Q?Xsy7TA2jXJoFJalq4beD4mwjO5B98ruQplkTqlh6+E7oWyRs6sCHKDy7PWj/?=
 =?us-ascii?Q?YeasOyaL7PzD6quJKY7I8BSvCjls9rTwbdoZFz5MEdvJgAyrQBjIH+qgEb6h?=
 =?us-ascii?Q?V0lYJKmtq35RLaDRpbJtBhNzbYNAYhO8aF7Tf2aCDq6hrTMFCQO5S/FIzMfg?=
 =?us-ascii?Q?8SxHctPxkbmX5lE9R7MOMp1TVbeAqzeJW+X/n7S5JvZkquWf+hWMQBTJLzqV?=
 =?us-ascii?Q?XxGRBgmGcdYhxyXwdjJ3cXAnhs4rR8ZlUUw2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:00:22.8192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b829edcd-9a12-44f3-621c-08dda87af660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249

To add more flexibility in system configuration add the new
DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.

Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
will enable running device model emulators (QEMU) from the assigne
domain for multiple target domains.

Stubdoms assign target allowing the stubdom to serve as the device
model for a single domain.  This new flag allows the single domain to
provide emulators for multiple guests.

The specific scenario is a disaggregated system with the hardware domain
providing device models for muitple guest domains.

The OCaml code needs the flag added in as well.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/ocaml/libs/xc/xenctrl.ml          |  1 +
 tools/ocaml/libs/xc/xenctrl.mli         |  1 +
 xen/arch/arm/domain.c                   |  3 ++-
 xen/common/device-tree/dom0less-build.c |  3 +++
 xen/common/domain.c                     |  3 ++-
 xen/include/public/bootfdt.h            | 12 ++++++++++--
 xen/include/public/domctl.h             |  4 +++-
 xen/include/xen/sched.h                 |  9 +++++++++
 xen/include/xsm/dummy.h                 |  2 ++
 9 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a923..ef0c5dca2a 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_DEVICE_MODEL
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae..c0156fa5c6 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_DEVICE_MODEL
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddc..12fda0762f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
-                                   XEN_DOMCTL_CDF_xs_domain );
+                                   XEN_DOMCTL_CDF_xs_domain |
+                                   XEN_DOMCTL_CDF_device_model);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 3d503c6973..993ff32f5e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -884,6 +884,9 @@ void __init create_domUs(void)
                 d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
                 d_cfg.max_evtchn_port = -1;
             }
+
+            if ( val & DOMAIN_CAPS_DEVICE_MODEL )
+                d_cfg.flags |= XEN_DOMCTL_CDF_device_model;
         }
 
         if ( dt_find_property(node, "xen,static-mem", NULL) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 153cd75340..ab2c8f864d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_device_model) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
index 86c46b42a9..c6b5afc76a 100644
--- a/xen/include/public/bootfdt.h
+++ b/xen/include/public/bootfdt.h
@@ -25,7 +25,15 @@
 #define DOMAIN_CAPS_HARDWARE (1U << 1)
 /* Xenstore domain. */
 #define DOMAIN_CAPS_XENSTORE (1U << 2)
-#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
-                              DOMAIN_CAPS_XENSTORE)
+/*
+ * Device model capability allows the use of the dm_op hypercalls to provide
+ * the device model emulation (run QEMU) for other domains.  This is a
+ * subset of the Control capability which can be granted to the
+ * Hardware domain for running QEMU.
+ */
+#define DOMAIN_CAPS_DEVICE_MODEL (1U << 3)
+
+#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
+                              DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL )
 
 #endif /* __XEN_PUBLIC_BOOTFDT_H__ */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..2280489be2 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Allow domain to provide device model for multiple other domains */
+#define XEN_DOMCTL_CDF_device_model   (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
 
     uint32_t flags;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..9863603d93 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1148,6 +1148,15 @@ static always_inline bool is_control_domain(const struct domain *d)
     return evaluate_nospec(d->is_privileged);
 }
 
+/* This check is for functionality specific to a device model domain */
+static always_inline bool is_dm_domain(const struct domain *d)
+{
+    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
+        return false;
+
+    return evaluate_nospec(d->options & XEN_DOMCTL_CDF_device_model);
+}
+
 #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
 
 static always_inline bool is_pv_domain(const struct domain *d)
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index d8df3f66c4..477fadaefd 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -91,6 +91,8 @@ static always_inline int xsm_default_action(
             return 0;
         fallthrough;
     case XSM_DM_PRIV:
+        if ( is_dm_domain(src) )
+            return 0;
         if ( target && evaluate_nospec(src->target == target) )
             return 0;
         fallthrough;
-- 
2.49.0



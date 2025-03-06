Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A82A55942
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904068.1312018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK0-0001mM-GR; Thu, 06 Mar 2025 22:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904068.1312018; Thu, 06 Mar 2025 22:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK0-0001kE-8E; Thu, 06 Mar 2025 22:04:04 +0000
Received: by outflank-mailman (input) for mailman id 904068;
 Thu, 06 Mar 2025 22:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJy-0000St-Oo
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2413::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e81662a5-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:00 +0100 (CET)
Received: from CH2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:610:4f::13)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:03:55 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::72) by CH2PR18CA0003.outlook.office365.com
 (2603:10b6:610:4f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:03:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:53 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:52 -0600
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
X-Inumbo-ID: e81662a5-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg2a+Tpdr9MS1pzpHLmBtkOQA/ya2iDl12TPmzvEEmZCTZjiD3xsW2HAVeOP4eFkpWC718Rh5cX9FAFZXNTxj2JuyM4qYbIYxg0u/z4fmIccnBvAIzhqA0GyK5lhlHcoy8FULQCVxN3J+dyzvhfsycqBMy+4pdoxEnveOvYkb8zdiIDqxjFfs+wMsTG/hsc94v/MRSb5z3ihiAcmfmQ2tVGFXB0c/y/SRJTcjvcfzxJ4NZl5AQ6PzP6XTPWF2zzRu/xyrKN7wVuu2ZGBgCBDs91hgkOETWdaN96Xe3prZFRlahMrewNpEAXEAd1Rq5mV9DXAdi8Dnww6a889nr4eXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsrTljo/Xl74FfKJIV3xkZWBNdEYe7y2ZdvEGquW2p8=;
 b=GlMywsA8Ncw1po0RLO4DJrl9hPz17yB7Mln8lSNT5HNnoKQe3cKk85ZcQpH/CnUzmOinRq7XAnH2ZvFdFHyd/xYmjfJPlQO8fnFz2qeAyi+GQPIavjgHjBk+cLLAq46A9gpM/SJydvEg5yydKRquEs9KShEShykzyKU9EkO9i2I5+q2mSNlBGXOF7d78RxsHcfvY0kHUoVsrBhE4LvcR4l0HiLgcLdT2c1hOYR+fwXfPjIfF6zOfuqthIxkWPyHXydCzRD47FZBIxckEjxNKpDbuJgNjviZQxkoHXF9TXQHpJbVOCzDxvDx5cHwyhNBRkTjlbfPR5hweH9xEY/4b9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsrTljo/Xl74FfKJIV3xkZWBNdEYe7y2ZdvEGquW2p8=;
 b=fnS6g7+clfMVEP0JSbqJFBF/C8hAzg178oqVBdMOHk3oxcbHcdwX3glgRDGUVUyw8hnXWPQSiuXtu/I5hCLeut9LK1GxLBTmC3SdDVW1pMkD8HGFUrDQ9thep2ujEEch+2u6nfLL3HhvALoHYNRuch4M2kxmIbXTp/Rsgi+rzyQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH 05/23] xen/arm: Add capabilities to dom0less
Date: Thu, 6 Mar 2025 17:03:25 -0500
Message-ID: <20250306220343.203047-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a514310-25fe-4496-949d-08dd5cfac943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUqfmBXhOwfgJr7RUC78hfWjo3iXR+seiVStT/ou3UcJWN5ckUDmwsg4b0LB?=
 =?us-ascii?Q?LK5GTWz0hOyB/y7RsJIGKIahW4wl3EUtIkdGCeucwGhbnIrajTHClTPaR1t8?=
 =?us-ascii?Q?5R4boBWr/OUYJ50KrqA/INoZJ4Xtl6Ckm01nZUm3x5gK0LPUtAfWDGfuvLgc?=
 =?us-ascii?Q?3QtQqy7c6oPiSrPhAPPHjfzPeRLS0z3yShYUUYCQpTAyqbRSIF62/H+Db5fl?=
 =?us-ascii?Q?7ryavJNNux3YOQrrlnja8x9DzJ/JLqMAWgHOK0gumPsmdMq98R9EIaEj2VRa?=
 =?us-ascii?Q?HVuEK6Sv5z97cM2agomjfn/5AV2jAGJpbvTG5/QTNludnjKsgNwHhFsxiS2O?=
 =?us-ascii?Q?o7w/oUu9c5EX2PIprvnOpWanpUFZ9XcBo4ixChsGAJYHly9X8dUdGyiXZuTW?=
 =?us-ascii?Q?TSKTBC7uI8aDnltndQtg+VszkoCJo8PckIrImxFjdMd0e9DJk30piBamJL4T?=
 =?us-ascii?Q?hsPZS9TaouVYyYVe/7ISspXO0x3++2Nb+Nh21EbQq6Ail8NKx795pCxoxuyv?=
 =?us-ascii?Q?WE2S382hCx4udC/XPkWfGabKQAMTafnupkFy8pY6OUYMir9pAojSRp0qS5p9?=
 =?us-ascii?Q?+e4sAl/bsjmtpdooqh7T7LJR6/KDU9Rt2bBV7w8f165lRr+oe6xh7UizUjew?=
 =?us-ascii?Q?XVqJLlg6OZGu82zFHI9o/lHTI/xGQRB5AsG67RFHFipDHMv/Kt2GIdZdDpjU?=
 =?us-ascii?Q?T4kFmliM/EvBpsM6MkKSHmcDcSnbEhOEHVEmHAXKGimrlQeLgu/06Tbwu3hL?=
 =?us-ascii?Q?De615WAZNgqBTzyPB1gHbdkKHn/FRogfLMqRi86k6bzvOcl859Z63iNHwHwi?=
 =?us-ascii?Q?1ERBbxSvlIi2ajUKfjdQsKnWCOW5MQcJT55Px/RCmAT2SBb1I2PckwLUu/oo?=
 =?us-ascii?Q?X6PdKTpCvHXNOPj404QoEd6in0goWkOdXgNsNptW4Cl7Ks324k+kGuklQMxk?=
 =?us-ascii?Q?Q+W3Rhx/u0S3KFoFI/3JBuAiC0Rt2OOaAg4MUhEdc2Fb/4wGuNczJ8tFY4x0?=
 =?us-ascii?Q?d+c0i/m7xj0v3E0a4VZO/oB5Ka49MzqDNZPDd6dpGtFwtls7Eu5JQ+3a5lOZ?=
 =?us-ascii?Q?yLjrgoSc5U5S67gf75v290bJIDyTZ6xbGaYbVoWc8g4vsbhywWpd0wlUN1M/?=
 =?us-ascii?Q?cMqxWZX4Ivba47Gm0wsRF4LmHAeBsLgBB1WDCCERed/NwdTfSzqJtH+JDscq?=
 =?us-ascii?Q?bMaJZs/qQB94Z+fYIbpa/Q6565ohwc3WfjV/xatCYX7XNkmi8K8/kc1SLcjv?=
 =?us-ascii?Q?QiVw9fliUTMw0Uigrch9QQ+uV7/tSZ9q1hXNqLe/Q2oh1cDk3mZY2PV7XnDo?=
 =?us-ascii?Q?gzZAYvZrPVASkRCCk29KwMMZWjYaEYg9KRBXmRnjA6MdiHgQ2chNwGu2kKuX?=
 =?us-ascii?Q?lXKfSGuM1XEwbMlf768n8yWt0opzyvAF4za/eR/GWf5WlcBHsSvKB/Z4bpTF?=
 =?us-ascii?Q?iQikMnboTsIM/rAvUyOqn+LZV+fkKvEgOrfHGsbZTttXbG9kM4uvlXoQyX9i?=
 =?us-ascii?Q?82jZjhOTcdGTQkY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:54.4082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a514310-25fe-4496-949d-08dd5cfac943
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

Add capabilities property to dom0less to allow building a
disaggregated system.

Introduce bootfdt.h to contain these constants.

When using the hardware or xenstore capabilities, adjust the grant and
event channel limits similar to dom0.

Also for the hardware domain, set directmap and iommu.  This brings its
configuration in line with a dom0.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
There is overlap with hyperlaunch.  The numeric values are the same.
Hyperlaunch doesn't expose the values in a public header as done here.
Is this to be expected for dom0less?  It seems most of dom0less isn't in
a header, but just in docs.

Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
domain-level capabilities.

Only a single xenstore and hardware domain make sense.  A check to limit
to only a single hardware domain is in place - building two breaks.  But
nothing prevents the dom0less configuration from only having multiple
xenstore domains.  Each xenstore domain would have slightly more
permissions, but only the last one would be used.
---
 docs/misc/arm/device-tree/booting.txt | 11 ++++++++++
 xen/arch/arm/dom0less-build.c         | 29 +++++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |  3 ++-
 xen/include/public/bootfdt.h          | 27 +++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 xen/include/public/bootfdt.h

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index ac781c9cc8..490c792ddf 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -167,6 +167,17 @@ with the following properties:
     Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
     only to Arm64 guests.
 
+- capabilities
+    Optional.  A bit field of domain capabilities for a disaggregated
+    system.  A traditional dom0 has all all of these capabilities, and a
+    domU has none of them.
+
+    0x1 DOMAIN_CAPS_CONTROL  - A privileged, control domain
+    0x2 DOMAIN_CAPS_HARDWARE - The hardware domain - there can be only 1
+    0x4 DOMAIN_CAPS_XENSTORE - The xenstore domain - there can be only 1
+
+    The default is no capabilities.
+
 - vpl011
 
     An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 5a7871939b..068bf99294 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -12,6 +12,7 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/bootfdt.h>
 #include <public/io/xs_wire.h>
 
 #include <asm/arm64/sve.h>
@@ -994,6 +995,34 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
+        if ( dt_property_read_u32(node, "capabilities", &val) )
+        {
+            if ( val & ~DOMAIN_CAPS_MASK )
+                panic("Invalid capabilities (%"PRIx32")\n", val);
+
+            if ( val & DOMAIN_CAPS_CONTROL )
+                flags |= CDF_privileged;
+
+            if ( val & DOMAIN_CAPS_HARDWARE )
+            {
+                if ( hardware_domain )
+                    panic("Only 1 hardware domain can be specified! (%pd)\n",
+                           hardware_domain);
+
+                d_cfg.max_grant_frames = gnttab_dom0_frames();
+                d_cfg.max_evtchn_port = -1;
+                flags |= CDF_hardware;
+                flags |= CDF_directmap;
+                iommu = true;
+            }
+
+            if ( val & DOMAIN_CAPS_XENSTORE )
+            {
+                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
+                d_cfg.max_evtchn_port = -1;
+            }
+        }
+
         if ( dt_find_property(node, "xen,static-mem", NULL) )
         {
             if ( llc_coloring_enabled )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f866..dc4b4e84c1 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -608,7 +608,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
+                                   XEN_DOMCTL_CDF_xs_domain );
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
new file mode 100644
index 0000000000..4e87aca8ac
--- /dev/null
+++ b/xen/include/public/bootfdt.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Xen Device Tree boot information
+ *
+ * Information for configuring Xen domains created at boot time.
+ */
+
+#ifndef __XEN_PUBLIC_BOOTFDT_H__
+#define __XEN_PUBLIC_BOOTFDT_H__
+
+/* Domain Capabilities specified in the "capabilities" property.  Use of
+ * this property allows splitting up the monolithic dom0 into separate,
+ * less privileged components.  A regular domU has no capabilities
+ * (which is the default if nothing is specified).  A traditional dom0
+ * has all three capabilities.*/
+
+/* Control/Privileged domain capable of affecting other domains. */
+#define DOMAIN_CAPS_CONTROL  (1 << 0)
+/* Hardware domain controlling physical hardware.  Typically providing
+ * backends to other domains.  */
+#define DOMAIN_CAPS_HARDWARE (1 << 1)
+/* Xenstore domain. */
+#define DOMAIN_CAPS_XENSTORE (1 << 2)
+#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
+                              DOMAIN_CAPS_XENSTORE)
+
+#endif /* __XEN_PUBLIC_BOOTFDT_H__ */
-- 
2.48.1



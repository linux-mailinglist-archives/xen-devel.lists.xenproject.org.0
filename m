Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBCA77040
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933004.1335098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv6-0006DH-A6; Mon, 31 Mar 2025 21:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933004.1335098; Mon, 31 Mar 2025 21:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv6-00069i-52; Mon, 31 Mar 2025 21:43:48 +0000
Received: by outflank-mailman (input) for mailman id 933004;
 Mon, 31 Mar 2025 21:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMv4-0004aC-9s
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3790d7bf-0e79-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 23:43:45 +0200 (CEST)
Received: from BN8PR15CA0009.namprd15.prod.outlook.com (2603:10b6:408:c0::22)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Mon, 31 Mar
 2025 21:43:39 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::2f) by BN8PR15CA0009.outlook.office365.com
 (2603:10b6:408:c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Mon,
 31 Mar 2025 21:43:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:37 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:36 -0500
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
X-Inumbo-ID: 3790d7bf-0e79-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEZW/IDiMen7Y7SuxTPCZ36jQxkhNKDNkqBd9GYuEDf/DfAea0cc7LdgYq1GpSMC1JFxL5l2mptk8VIBFGGejD4riRxpQCf0PZABx4rOJqR0eOk8KJ0sACMKuF/fdiCIcndyUwzuapf//1fB5xwoMGsGYAmoDJgHwgAKD7hylC0TvHjw7aL2UR4GpmUWov/nm2iUxBfy6p7letl0WjmhdroCjlGoBuskeTGaaF/Ly0Yha+dN1Xfmzm11yl1XUQqIbornqQ9KvhWFGLqxL+8t2HQqtqRwMK4P95wlDCBKEYZ+Wfyd0SUjISddh3WH/Lh5/UUnmCQBMCeDJuEh7jTSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fijYQspdfZFoThhaS1WIWMVtQUseoBzQfmLgz8dnLRI=;
 b=cee9CuueYi5vPoGosF6edylesJ7hSCxKllABUfGyyGNUMmukcWF114Zi+/SbbbdE9IDlpYTHBShuKRgTFTBe992S8nDFDDZdG5I3bmFwjZ9QD5OtxoWHdJPA28wzpnXChA9f3C7ET44pPQBGyHl+3h2Ig2WFggkXR3r3hXBwXq4zp21EopoX2cmmXZey2QggHTZzUQ2LwsGiqJfLv+TYO9W/6AWICMi5YXxwzGjqIzKbX1e+3bGUh1CWLvJVXbRw2EyBXh4GqiM9elTaq1K9SEfnRvVrOvela2PwWyB4ghMsbRQiC7t7vwXy1arqoTdTS6Df5pcMmd+o6NXUok7Ryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fijYQspdfZFoThhaS1WIWMVtQUseoBzQfmLgz8dnLRI=;
 b=churWQHjrUNOXAa5EJBikr8I4X2Y0nace2HidOaldfdbgKn/rjRm5+x2+t0QYF3Aa+JkYRxVH7oKHhIajvUZqiHu/DG6i9fw3cQG5PPWUFWdpcdyMmflZ+1rG91i8Iyqxo58PnEujIC+nQhvH8FGYcYE8bHhLr1+YlfZai/UcR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 6/6] xen/arm: Add capabilities to dom0less
Date: Mon, 31 Mar 2025 17:43:21 -0400
Message-ID: <20250331214321.205331-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b1f1d1-62f0-4204-0c6a-08dd709d188c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GrGLMk88tUv/ReFrs+v1f/KCTu7Nx2M/+bYZRhvrWrVGVmjV1i14i5tB1Kkd?=
 =?us-ascii?Q?mdODfD67oieEKodUQX5O10u7LDXRHLdVtjBWYYMfe0n6r6b34/OGTke8kRLE?=
 =?us-ascii?Q?0S8eppQLxdRm97xjyMm8NFp+p78uWpDsVhIP1D11CPgo152Xc8NqPX/HAlim?=
 =?us-ascii?Q?W68x9EDzZdwEV0tsr+BPDn/EW1eNsS0S2XB0duWWN7TUKMh/0CpbgMMx/InM?=
 =?us-ascii?Q?mbWJ+tWEwrKeKfC2CzxwCoxPJsP4WQV3aYob6apt8vo6hzfaokeigIgCwTFB?=
 =?us-ascii?Q?Ni1Z8KRloItHbO3RSQ1i4rIVLsYWukEsePnRn+bFFh/tKYd3vVHJ8qu2pbw1?=
 =?us-ascii?Q?P4A+UCWFIrqFLvph+74dNtHX5WkATr5W5YU3jKV9P33yxAelFO6lRhAFat+/?=
 =?us-ascii?Q?ANMAn8g8gmmOEPzdUec3LWaVQuJhxZeZZ+dXDh6rgtNMay/j5NOvfGb0COm9?=
 =?us-ascii?Q?fzRqcsjefU5eRhAUcbrH/24EOrBkfLl9hZEqgkWOhzmxMujpl+fHWQJJ+oLj?=
 =?us-ascii?Q?9ZFnMCg0Blo0chDedOGYVGAkFOjw+b7k+qMMDTzJISIeeXEPzrTbpjW+Sx84?=
 =?us-ascii?Q?HX07vP8+BABsJiWR208EzR2dTDRsiQQVDm11O6zKlKLS7f408JWaJRTBMLFZ?=
 =?us-ascii?Q?Q2zCyQKdtyqFAKfcCbZl06XPwB/KrJExt2k374zJ0imZK3aS59HacE/8V208?=
 =?us-ascii?Q?mqH+4gNRgQaKHoeb7yhrh6iyFXbzQrt1fv7NqhRj/3X3NGSnj+Z6O7rBanXU?=
 =?us-ascii?Q?yknrn26OSjm7i9FmeIno0ArU9Cs7CxG8dKje0T0e38NwlE6IEBaswzCLvAnW?=
 =?us-ascii?Q?TfDULY0amwO/RoV4PTO4L6dWw+JuYwF9MxWgnneic3/VW3gBS2nlmGDOlU/M?=
 =?us-ascii?Q?XEdAo/pzQTNdGP0PmEViCch08atA15F56fHrBIDX2hORQkystq5lk8qjDobt?=
 =?us-ascii?Q?ZSHE8glaFQGZGzWmqfR/SRHcAVYiSaAeVhPliPnenImmztmihuBmiaD0puBZ?=
 =?us-ascii?Q?EFXe4iFnqNMtSsDJnVqGZOuZJet0Ok0jqaQLpr7f1rtTvn3ITsLKnia4/Kxp?=
 =?us-ascii?Q?uf/K8rXxy53E9uUpenJnDjZWUQtTa4rODjJuEWF3QA+LDN/WKUiD/jXS9m9C?=
 =?us-ascii?Q?7iI/jxjMxkmCFuWeP2avVwUFqZ5EM9rle9Mae64wLimN7sIOPAnXWr62Fm6e?=
 =?us-ascii?Q?Xb8SaN1YqFrTXXIi8t8XjkN15mxQ1sevrVeCSGDVjqDyVZnYuHuuDeX3EJ3A?=
 =?us-ascii?Q?L0zeCor0aqEf5Bys1QWo4HT6iIPyUuA96/gg1G1qOoVoS7+fwPVKBBwCR30B?=
 =?us-ascii?Q?Qmp96V/qHvuyAIWllSAQQQbgdvTVLO0T/7avzBx9YVi6Y9j55/KNKOQsScaP?=
 =?us-ascii?Q?GJQdkwChBAJ4nM60kdbkqeC/nYeeHozgs59XiH2xS5SAER/bhYGyeQzqLz6F?=
 =?us-ascii?Q?SNeADNToHgqeDn3EB9EAROw0jvV3c2KQ2lxaOMQPGdHJiG735oKZyR3Ff2dP?=
 =?us-ascii?Q?WK2l2Cnq55o3N3w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:37.9236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b1f1d1-62f0-4204-0c6a-08dd709d188c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B

Add capabilities property to dom0less to allow building a
disaggregated system.  Only a single hardware domain and single xenstore
domain can be specified.  Multiple control domains are possible.

Introduce bootfdt.h to contain these constants.

When using the hardware or xenstore capabilities, adjust the grant and
event channel limits similar to dom0.

For a hardware domain, require an IOMMU and disallow specifying a vpl011
console or nr_spis.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Fix comment style
Make DOMAIN_CAPS_* unsigned
Remove forced directmap & iommu
Require iommu with use of hardware domain
Limit to a single xenstore domain

There is overlap with hyperlaunch.  The numeric values are the same.
Hyperlaunch doesn't expose the values in a public header as done here.
Is this to be expected for dom0less?  It seems most of dom0less isn't in
a header, but just in docs.

Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
domain-level capabilities.

Only a single xenstore and hardware domain make sense.  Hardware domain
receiving all hardware can only have a single domain.

For Xenstore, the logic latches the single xs_domid and uses that for
all domains.  Also, only a single domain can register for VIRQ_DOM_EXC.
---
 docs/misc/arm/device-tree/booting.txt | 11 ++++++++
 xen/arch/arm/dom0less-build.c         | 39 +++++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |  3 ++-
 xen/include/public/bootfdt.h          | 31 +++++++++++++++++++++
 4 files changed, 83 insertions(+), 1 deletion(-)
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
index fc515c9852..1cb6c170a7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -12,6 +12,7 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/bootfdt.h>
 #include <public/io/xs_wire.h>
 
 #include <asm/arm64/sve.h>
@@ -906,6 +907,8 @@ static int __init construct_domU(struct domain *d,
            d->max_vcpus, mem);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
+    if ( kinfo.vpl011 && is_hardware_domain(d) )
+        panic("hardware domain cannot specify vpl011\n");
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
     if ( rc == -EILSEQ ||
@@ -1020,6 +1023,40 @@ void __init create_domUs(void)
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
+                if ( !iommu_enabled )
+                    panic("iommu required for dom0less hardware domain\n");
+
+                d_cfg.max_grant_frames = gnttab_dom0_frames();
+                d_cfg.max_evtchn_port = -1;
+                flags |= CDF_hardware;
+                iommu = true;
+            }
+
+            if ( val & DOMAIN_CAPS_XENSTORE )
+            {
+                if ( xs_domid != DOMID_INVALID )
+                    panic("Only 1 xenstore domain can be specified! (%u)\n",
+                          xs_domid);
+
+                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
+                d_cfg.max_evtchn_port = -1;
+            }
+        }
+
         if ( dt_find_property(node, "xen,static-mem", NULL) )
         {
             if ( llc_coloring_enabled )
@@ -1082,6 +1119,8 @@ void __init create_domUs(void)
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
                                          vpl011_virq - 32 + 1);
         }
+        else if ( flags & CDF_hardware )
+            panic("nr_spis cannot be specified for hardware domain\n");
 
         /* Get the optional property domain-cpupool */
         cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
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
index 0000000000..86c46b42a9
--- /dev/null
+++ b/xen/include/public/bootfdt.h
@@ -0,0 +1,31 @@
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
+/*
+ * Domain Capabilities specified in the "capabilities" property.  Use of
+ * this property allows splitting up the monolithic dom0 into separate,
+ * less privileged components.  A regular domU has no capabilities
+ * (which is the default if nothing is specified).  A traditional dom0
+ * has all three capabilities.
+ */
+
+/* Control/Privileged domain capable of affecting other domains. */
+#define DOMAIN_CAPS_CONTROL  (1U << 0)
+/*
+ * Hardware domain controlling physical hardware.  Typically providing
+ * backends to other domains.
+ */
+#define DOMAIN_CAPS_HARDWARE (1U << 1)
+/* Xenstore domain. */
+#define DOMAIN_CAPS_XENSTORE (1U << 2)
+#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
+                              DOMAIN_CAPS_XENSTORE)
+
+#endif /* __XEN_PUBLIC_BOOTFDT_H__ */
-- 
2.49.0



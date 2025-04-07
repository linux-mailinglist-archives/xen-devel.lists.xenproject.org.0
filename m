Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82841A7EDE5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941142.1340686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sWd-0006zL-A8; Mon, 07 Apr 2025 19:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941142.1340686; Mon, 07 Apr 2025 19:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sWd-0006xt-7J; Mon, 07 Apr 2025 19:52:55 +0000
Received: by outflank-mailman (input) for mailman id 941142;
 Mon, 07 Apr 2025 19:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sLG-0007y6-2u
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:41:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40908d6a-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:41:08 +0200 (CEST)
Received: from DS7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::14) by
 BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.42; Mon, 7 Apr 2025 19:41:01 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::6e) by DS7P220CA0007.outlook.office365.com
 (2603:10b6:8:1ca::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 19:41:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:41:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:41:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:41:00 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:59 -0500
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
X-Inumbo-ID: 40908d6a-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJIJH6HjofMzOvLAW7v8QTTwgLppWS+U06Hp48kX26HnZ+ybYa79YXmE8PzyjLFdPiyY6R/zND3te0W2sBg7EJXDX8vHzt896/Ll272Ctc7GJd+ETtn1xUff54fTVLprQkwbUdOnxbNEHLw8GFu6qSES069ZGb0gvu5un9tDOF6PiWg0+0TMn+IXJiqEfn1/giiA/3gIjOpDOZ469S2yDkwcPj70UdaWmuLbbTMWoZiWiiq2LZPPuvt7YnVdwU0r27rKCLZWU+hXbdB+czdx5mi6Ouxq7eiaMfp7UgB+6dqdqnUZ1F3a3MgYzbnD1qgAoip+TOW3hTFVRujcBjaboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NulqxlxTYJ2SYADeoU/nx0wxgrIotXpcN081uSysYhc=;
 b=i6BX1dJGs0bfyMlkj7y/9WcXRalLJcC64pNX7vL9WfebWenG6NkcOqtMgwRfT1Bi4LihtkxLDnHYmZRfUe00Lx/2L3A9zgHpYa6aeROkfvl8ic65F3MUMG7hQ7J0LugHuHlb3PKD0nmr1uPOMVJsp5egFHSb4zXNXw5vUpFGJwwHgD7XkbC4posVs4ml1tfMO3nF4Td7lHnet8q1vNYgKHWox9DUvI+qqZn3hzN4zv/Xn5m+KB7mDpHHZoT25yFK/y5+hB/L/ikd4wRRbO9annZm2AT9G9c9VDmjxG7EQ9OJdJA/3euI6B5U53RGJtsxIjnKiLgC9x5F2OReLJToeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NulqxlxTYJ2SYADeoU/nx0wxgrIotXpcN081uSysYhc=;
 b=SjrfdG+ehtYsEKPj93QtMSe+Ke4hyqLDNp1U2Lb+CYHFu3sPQ3eiezd+tOrUaTQuDE9Lc4Xr/luusDo5ifVIN/V09tFpGh0Uvb/L7SIxMzCnQbubwORtpb9bFN7tYvmZuT4I5xZCIePfEFjKL9qeDU4ioVN9J2YgXgEhNO9sjtM=
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
Subject: [PATCH v4 7/7] xen/arm: Add capabilities to dom0less
Date: Mon, 7 Apr 2025 15:40:38 -0400
Message-ID: <20250407194038.83860-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: f018133b-ff14-494f-d505-08dd760c2075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sZqIdXwziHVQcoIk/Ic1+EGkdkbOaw+wODIATDSJct2I0CzBeOQFl4vUKvWk?=
 =?us-ascii?Q?aArOjD6mtMJYg94VNnO4+FMC7MxTvWD0h9qL4VKf4NUuIIKl+JVeer4Bvw6T?=
 =?us-ascii?Q?Ubg4gC62aZE4jYWS3INPQVr6f6jjmRay1bC5O6Ua8WbwaH8qIaxMljWfYSfE?=
 =?us-ascii?Q?qR0celO4/EVJ/pdwCe6QxSjqWHLOqcQhSyM4vjFglcaR4oZYlfJUNahLJBv0?=
 =?us-ascii?Q?/gMWAtFxnYG8Ap6AV3sfHUB4ou4sn2MhWFWWgiGmOzYr9PFy16Ch5nFuSJ17?=
 =?us-ascii?Q?reHM2k6x6EPuEjIoJFSLcX1+agURPpESVT0Y4gvs/BioGjJo07yIIc98ck/U?=
 =?us-ascii?Q?BAOoydyJJjQfCFNWL5AORzmVjgtLiCSgs4JxK/mITXZ7TrEFbmGWo4Rf88ik?=
 =?us-ascii?Q?fDvwv0qhoC1PiHSj1VYTGM9q8YJjdQO9PoSo9PUV0c+zjEvHmI/SQxXS0adY?=
 =?us-ascii?Q?bCgLr/WTU288Xb4ByEA19maWKeS3Zh0aqjwgN4KX+bjgT998Trp50sQdMFM6?=
 =?us-ascii?Q?S6ggJhUE2n/gGnA4SVz5lIZWg2bhv/uk7lde7yqq8CQg6NPL5iMowuwWTo8u?=
 =?us-ascii?Q?U15u/RrV8McVZ9aSQt0NkCFcKXGM8k0BX7J9GnZiFf2n1JBdZl61ZBWYTQJl?=
 =?us-ascii?Q?h0pRz/VUV6bS9GU1SrqsXnLJ0JZSZchlx/bzuNw/OTF5LmZhVhGCrqPg5pzS?=
 =?us-ascii?Q?u53UoWL7hhGcY09lWJqdKOczo6Rt0jKXz+ka7Fh2sB4BenvKpiXREyHgbf+t?=
 =?us-ascii?Q?ERiFfgbmnAm2fV155AecVNL/ajf7o3mqEUEAQzRGHcyfcAlzvX5SUyfJoL8+?=
 =?us-ascii?Q?4XTnGvnwngVPoiXIsVyUccqvFIfoi+ToEodLzD7r5yhxc5GdD14OWrmP6Hpf?=
 =?us-ascii?Q?oLHBju3wjxZc55yvO/fvvn7ISaef9Ru67bwrC+/zU6uJF3ry90oyOjpxyyCW?=
 =?us-ascii?Q?FG13oc26g4hbZc05fxYlcUNph03UPKYOY6ms3PTFabvYRhpxL1zZh3/NxkCZ?=
 =?us-ascii?Q?OdWwT104BA39xEqj75d4X/QyoJZTE4CAcXMVRI47HtM/eROQ85dRVKWWFse6?=
 =?us-ascii?Q?RffCtblcpv/xDQoYVuOzcXGD5D0HYlAlqYsjwTEJQIgpDwgd60GdKu+aOL7x?=
 =?us-ascii?Q?oJtZnNomhxvVkl/2oCtOrlvzOMAsZ6yZVc/mh8h146TklW1k2eGDgsejIoq/?=
 =?us-ascii?Q?2xu8+pnQiCGhk46sBTzDLuAk1Aui+v5C9PXEzgcHCA4CuAWM7VmAK3AlXL8Q?=
 =?us-ascii?Q?IO8pbXeP8iOGcTQKRUt4WwR8P5FtZZEPhb7VN2aMcTcnkhSP3xhccBwkUvWF?=
 =?us-ascii?Q?ZfHu28OMe7sB3rK2FThb/M+5YpPmDVgxjV7ksFTND1ecsew5oCC7j4NKTCdG?=
 =?us-ascii?Q?pvOvb62CsLxd6Nk2NTlHe3DtI4D8TCv8qF9wb/RLR33j44PDmvJvLd9EMp1Q?=
 =?us-ascii?Q?mfAcm1sEYRfPt43j3Dy9Hv9B71TqwT+FQlTQ1PN6Nyqj+DS1JuRE0ZFfNCHo?=
 =?us-ascii?Q?Osppgqm+fdytyKI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:41:01.1819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f018133b-ff14-494f-d505-08dd760c2075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481

Add a capabilities property to dom0less to allow building a
disaggregated system.  Only a single hardware domain and single xenstore
domain can be specified.  Multiple control domains are possible.

Introduce bootfdt.h to contain these constants.

When using the hardware or xenstore capabilities, adjust the grant and
event channel limits similar to dom0.

For a hardware domain, disallow specifying "vpl011", "nr_spis",
"multiboot,device-tree" and "passthrough" nodes.  Also, require an IOMMU
when not direct-mapped,

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4:
Add Stefano R-b

v3:
Specify 32bit integer in booting.txt & s/all all/all/
Panic on !direct-map && !iommu
Panic "multiboot,device-tree" or "passthrough" with hardware domain
Include asm/grant_table.h for CONFIG_GRANT_TABLE=n

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
 docs/misc/arm/device-tree/booting.txt | 11 ++++++
 xen/arch/arm/dom0less-build.c         | 57 +++++++++++++++++++++++++--
 xen/arch/arm/domain.c                 |  3 +-
 xen/include/public/bootfdt.h          | 31 +++++++++++++++
 4 files changed, 98 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index ac781c9cc8..59fa96a82e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -167,6 +167,17 @@ with the following properties:
     Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
     only to Arm64 guests.
 
+- capabilities
+    Optional.  A 32-bit integer representing a bit field of domain capabilities
+    for a disaggregated system.  A traditional dom0 has all of these
+    capabilities, and a domU has none of them.
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
index 50d2d3e4e4..a356fc94fc 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -12,11 +12,13 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/bootfdt.h>
 #include <public/io/xs_wire.h>
 
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/grant_table.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
@@ -928,6 +930,8 @@ static int __init construct_domU(struct domain *d,
            d->max_vcpus, mem);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
+    if ( kinfo.vpl011 && is_hardware_domain(d) )
+        panic("hardware domain cannot specify vpl011\n");
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
     if ( rc == -EILSEQ ||
@@ -1043,6 +1047,37 @@ void __init create_domUs(void)
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
@@ -1064,12 +1099,26 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
-             !strcmp(dom0less_iommu, "enabled") )
-            iommu = true;
+        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
+        {
+            if ( flags & CDF_hardware )
+                panic("Don't specify passthrough for hardware domain\n");
+
+            if ( !strcmp(dom0less_iommu, "enabled") )
+                iommu = true;
+        }
+
+        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
+             !iommu_enabled )
+            panic("non-direct mapped hardware domain requires iommu\n");
 
         if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        {
+            if ( flags & CDF_hardware )
+                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
+
             has_dtb = true;
+        }
 
         if ( iommu_enabled && (iommu || has_dtb) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
@@ -1106,6 +1155,8 @@ void __init create_domUs(void)
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



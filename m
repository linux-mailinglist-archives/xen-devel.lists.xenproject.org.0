Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57AA90DCF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956563.1349995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK7-0003T3-9r; Wed, 16 Apr 2025 21:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956563.1349995; Wed, 16 Apr 2025 21:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK7-0003Ob-0n; Wed, 16 Apr 2025 21:29:35 +0000
Received: by outflank-mailman (input) for mailman id 956563;
 Wed, 16 Apr 2025 21:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AK5-0001ht-IJ
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:33 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2406::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1bd295a-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:31 +0200 (CEST)
Received: from CH2PR05CA0012.namprd05.prod.outlook.com (2603:10b6:610::25) by
 DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Wed, 16 Apr 2025 21:29:28 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::e8) by CH2PR05CA0012.outlook.office365.com
 (2603:10b6:610::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.10 via Frontend Transport; Wed,
 16 Apr 2025 21:29:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 21:29:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:23 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:23 -0500
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
X-Inumbo-ID: e1bd295a-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7iuRiEVa3tmrzgNjMsEMoMBcsjWESCz19rWXneH+v9tboejp7PH0jI1Sp1qm70BoP1MX6r/mhnKs7eAEBznV8D+S2IRGKeOjDIt5W4snNKm4gsiqLJjABkKYL5rz3uJiXUl8NhcrdZ10HtpK4Wpe9vZn2Cm3jJFMn0j7FEKoNsq72BG2zrEs9k2Cw+Gebegi+GvSb+VD1xrIDIh+lMODnfXtnlSUCl7zzwA789QevrZFJxNf4wKE1tRVIds5UyNMhboMfzDoua1cbKSSD/p3s/rPhRq0ZbFkGPYGsuPnu5OStcoTkm6EVrDRnhxVyvnvFPxBBPSI9p4ywVpj2fz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09rwyClN5j/y7PazveIKBFlQyjWEK4qhJSYEP0CrVFo=;
 b=NvqwYDIkNDGYTNRvgLyL+z7GAtfK2A/ToGCLt0dQxy2v9YACp5waH3ehuX/tlvZ0I6qDdm/isQ35gapOvfayyFgng6xnuMlygalkcuaGOlGcGi119BxCQgNnZtIC19SDIKGTbm26bZtWVBKh676u0I4pxWaK4Ghby6OobETuwa+Fo1j6mzSke+Uu2jKFaYoUMO2UV1QcbwEF+FwJguBxqLDJSIBqt4P8P+BUq9SWaoGoIHnRq00woUNnaELanyoWwg98BFsX2r6kYOfloGCy6k5GJ3pZ6FIOqXp/Or8Scc7l2wKAwXuZn1c/fvNxMOsN9RGE5mG43W1qJYFXZhLt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09rwyClN5j/y7PazveIKBFlQyjWEK4qhJSYEP0CrVFo=;
 b=omG09VR3kpwgAs8eynCLG92ZIFhcVA00bBd+j05dzIwtFgQaLM3X7Ekj1kEgJEJq6ud1wczw9p4wZDkzP2mDLAIZPlfOkaq/qMEGF4255KycwjLmCL6RN8mr0o/B964HIRNzplzIoAq8P39bMuLNiSMHwh0XhkdG5MM+5qcbOKI=
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
Subject: [PATCH v5 7/7] xen/arm: Add capabilities to dom0less
Date: Wed, 16 Apr 2025 17:29:11 -0400
Message-ID: <20250416212911.410946-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 471d9b9c-bba0-4136-8b09-08dd7d2dc444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+gWi0IRbnOkdJXrXAsf7ikDIiHo5IgEzaJF0ZUzeEMJ8SZXJJfiyuZ59vcCs?=
 =?us-ascii?Q?C70d0dour4aSwUdnTUqVDTIoM2u/n1hFz80kZq0kUU9nBukgmcBvHfAeNFOS?=
 =?us-ascii?Q?xLfcuSMzt3tcyBdBxDKcG0LBFAWMvkUKnmIcnh9Af+ejnXN84asJFlcaomL6?=
 =?us-ascii?Q?MAqtUOWgBP75VMJN1Ll1ETVZvKE5Z24+X4rInm9IzhO82XNNes9wDNYquutE?=
 =?us-ascii?Q?s1LgK1s+TWHcjbeatoBUsQpDT+5jLYX7QMWvmQzIKwi47CcwG55yoMbv+obc?=
 =?us-ascii?Q?fpLH1xMWsBnjXOwKUHi2q5KyrCI+C56M9ykYBPBMAFdI2Fm657z/x6TKkK8R?=
 =?us-ascii?Q?5FEKaiFGy87aNJj33/f7LfCwRxL6KmdrTw96WPWi+/IZ3Wwt+CX2T5BmX+Kn?=
 =?us-ascii?Q?4ytIFZRMwNR22htna0tHHOh7M+czssp/y52MOKJZ1dlJ8aAc+pBc44MNoSmV?=
 =?us-ascii?Q?C6dr3K1XvL+FSxDyLEPs2J7W701azAotSA7XLsuUPHgVmw19fXfsRqe9izUn?=
 =?us-ascii?Q?ZX7FCIRdlRdNx0GgN4YJrcRk8TeCAaWAJ6W0e10JzY+3dH3jfMc3rqJue1/f?=
 =?us-ascii?Q?GoPzZ/qLK/QqOD4idKXvQove5bKYJ/ZG2Zs2C9XuZPTzy8snXjou6Vxp2O8O?=
 =?us-ascii?Q?koh16UCNerRL+GvpoOeEsH0NGjwQcCKN3EQ2wFHuJ009XzT9JUqIeoE8SXTy?=
 =?us-ascii?Q?PrtMt3D4IFis7Rlf/JwUNzdKBFp4VM+lI4ZAmRR2LrFvsbH2haSNDP2X/TDf?=
 =?us-ascii?Q?oOPFa6rtDkB+VspSlyFFXfxSzRoOJwjmR9EsVQ3mjaW9ldFlRgrFQnBAmxr6?=
 =?us-ascii?Q?i9XIRHKV8O0tvR3z4qCyIDSRPM/h5Qn+63Sp2pPU/BMtUUExjYARIMnUOV+I?=
 =?us-ascii?Q?KYYX4yldnLmzs5O/qfC75YEfGTIzbUcvCaq42deSSOYLcs8ZCFzN8F05Uq8v?=
 =?us-ascii?Q?PbPOor59bgL2t7hwFx9Yq3XADYpGgJwANxXGjQtXLdRJYQFjMfhrKIpTEItq?=
 =?us-ascii?Q?Aj6He98ta7IqPntFWaphSgJP9mHergy9Tyy9tJ1aQ03a0kNyxNmcJX8OOFfD?=
 =?us-ascii?Q?YD2cIIAh8fB1hg+7CFNFKVc4ZggPxFrh9RjIrvJ7wpta8xvErjocZsPhI4pG?=
 =?us-ascii?Q?mBvYtE8IX9gDKsJOylI6ajp3HOJNcyLz/A5XWYt4ALo46151cyrP2aYRV84T?=
 =?us-ascii?Q?CqpBVjNAd5gIdh5VnoB5ew2mUYCoKfsPh/brP9RlHKBH958Iw7JHzhz6gi3i?=
 =?us-ascii?Q?2Jd1LRA7orDXhKk4MexZWkzzNPQqp3ia5fiavZvAEo3tAp1cMU+IkCuJP1P6?=
 =?us-ascii?Q?M5i6tCETdmyfjASiVslaTbKqrx/KueD4XKUPVc9XVWp8gnepPI1/FhcPzpDg?=
 =?us-ascii?Q?3o/n39ox0jfqgRU+lXfDmwNSKg5jxBmEIuW9XAdYEtfeisLGgV5ODksHt3nH?=
 =?us-ascii?Q?82ZjloJDieuADGfUA70UHz45+r7UH2f72OZMVFg2QcmKvfD368OqrORgzVLL?=
 =?us-ascii?Q?/RCzWgfZsnj9O+hrKcjS4HEH6XSsR4yudiaw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:27.5680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 471d9b9c-bba0-4136-8b09-08dd7d2dc444
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202

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
v5:
No change

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E075A7B1AA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937434.1338421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SSh-0007EG-76; Thu, 03 Apr 2025 21:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937434.1338421; Thu, 03 Apr 2025 21:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SSh-00079q-3A; Thu, 03 Apr 2025 21:50:59 +0000
Received: by outflank-mailman (input) for mailman id 937434;
 Thu, 03 Apr 2025 21:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOT-0000LE-Mr
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2412::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a98d05f-10d5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:46:32 +0200 (CEST)
Received: from DM5PR07CA0075.namprd07.prod.outlook.com (2603:10b6:4:ad::40) by
 IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Thu, 3 Apr
 2025 21:46:21 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::69) by DM5PR07CA0075.outlook.office365.com
 (2603:10b6:4:ad::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 21:46:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:18 -0500
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
X-Inumbo-ID: 1a98d05f-10d5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2rzr3MzCowT5gS7ivsGdya3RaJdq4w8G3ugRDHmGEvWlXGPR4keo6G5Nm0fAY6IgV0wj0fazL4hk74HNW6/9ZQK+/ejYPp85Ccm97MhRPXtiZkjnAJs+gEQKxA1a6O5XTfJf5Te71DzzI+DcwnoAhUIhTfZ7n8Ndu6Usy/6pebnM+QN2GjRAypyVuH/w7bxdcmHX3WzhKmg77vT3Zh9oSNCvhDKhISS3MWpJ4fOjPsYqx8DcwNtwHN3SXoOFDg9jnPTCgn73alC2yfs5eEDQqGVeMGF7wU3xuc6wrTSDRWK/8lUL21ErLysO7k8V0JmIhcCcyGqbqG/7IpJi+vWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn4FfE3RLkkDSEVkvFxm3VJYc8IGJk1EDPqEcHwIjaY=;
 b=dc5kq1ywfu31fqleXUh9liaNL2dPG0qsotQOiY2cXu/CNe/5SCUBRO50VoDONEm1PIITkn21oixf1obgLqMFMY7lSSy7l1ZUOp3CKUrCrqRujYXAcsI/mGjFIpL6xAYCAOaGSsT90M0F2Li4ZYNhtafpHZUwjHfWh5FEf2IhZkMuskrmqb5Y4YVP523K+WCDbEZSJBfcKs6IoKfAgbEYPdrDaO/IstK4qXLpcHVbn2X4JDnd1qlD4soanCSIhdvOOQfuh69lBkH+iGfCh+h/5KgYqxdhH8ho2YOpZCYeqJxRR4MV2ju53BdDfHismCcdS1Yf8BUyzKRCV0TnIAeQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn4FfE3RLkkDSEVkvFxm3VJYc8IGJk1EDPqEcHwIjaY=;
 b=YEt5rlTEieTkKnE3xH0LCatZ2pqp14naurQLJNyg+uTV2JGmTTW9CAiNnLYFmLXHOj2i8hDxQ6AKR1HirRETnYq69YjDTYd2924heloGijsEsl6qJSWNbT5UHAT9SMXuxHL1/OKgGy0QqAwW10FEvu2ZzgE1owKRof5Dgscga2M=
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
Subject: [PATCH v3 7/7] xen/arm: Add capabilities to dom0less
Date: Thu, 3 Apr 2025 17:46:08 -0400
Message-ID: <20250403214608.152954-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6ad267-6b04-4910-15e2-08dd72f8f92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mUEKsXmx7JIoCU2Mz2kv1VReG2LXvDmRiTTp0QUnBhs2hbjTezTVouEPtwEu?=
 =?us-ascii?Q?iNOieRm2DM1greiNN7WGL5hzpCXM9/hzzV8IW9NVoFpebSJimtG7wWdrQh6E?=
 =?us-ascii?Q?tPHSL3bfRHXz+XeI6fMqMXU3k4utjWzNuAhWML3VpJnCrt390gQB8aXEmp9i?=
 =?us-ascii?Q?Id9201N+YHT2xSzly710uaZ5p+sNQBKwES2DUmasU9YunYdMLLXjt+tA1puC?=
 =?us-ascii?Q?dRoNXH9ioPN8UO7wiIg7mQ30jeS72Ukz3hb7tWkLt63xqW/RxDbseznlItHn?=
 =?us-ascii?Q?jC++DcDnUZ7YSQ1r2wYBFwwI2RKCw91hbFp967kxjZxJJ3YpnYpouIVQ8PQW?=
 =?us-ascii?Q?P+PhfhRw2nwcJrb8gF5s6JDEIAzM/+nHKROQcD8LdD/FtA5n49rRnJ1CN6J1?=
 =?us-ascii?Q?avsUYglKFrnUiWfXJkU9iMtWhF+Sqb4EcSM1QygG9MPi4LLnQ6nbxkfjksiq?=
 =?us-ascii?Q?e9bMiyz0Z7CJHiKfnzw6nDXbYN03nYCTV4cwfPXAOqrK7Vo7X8QudMibyz/y?=
 =?us-ascii?Q?09nzM5dOVAcJA5RLKNT6VLZ/lzzHC++lbnFk+lK+MDEkP/h0jik3INSSk16b?=
 =?us-ascii?Q?XFm/toeGeex5MStrFVuvxFSFBNDSN31QalRYEoc6zUjq0hpBUCUeBqsh6VBw?=
 =?us-ascii?Q?eA7n9O5UDZ2uXHYkzSMbvb17Fp4tw49pAaJr7WOe00H+R7xvQm1jQTGhAFLO?=
 =?us-ascii?Q?Jbw1A/gEAmkn7huH3R1rtxmx3sFkt78Em8w43MUKV0XVDQJKl/MdtvurXBQx?=
 =?us-ascii?Q?1DqlqVZWXqz9ibiG9SA20EDYeYhg/2/PNuzFJLQdtCKrM3trzgkf1gl0sLm1?=
 =?us-ascii?Q?RxzuNAiEm+xaLXHqjl6RPjTcZeQk+WygPl/c+AB9fi2jA94JSXE2EZspfjcT?=
 =?us-ascii?Q?wmxjr5QigEUTiFCMMUkpgW38VOyra98gRQaT/Axg9+Vg71ou2C2fpwap8WKV?=
 =?us-ascii?Q?EkoZWwnkJzCde4sLZILoFXemxAU5I/EZXacu3kgJUHFAtr85oMVqz0hHDTWq?=
 =?us-ascii?Q?omsCflJq+A/dQRF1PVg4AK8NydcZQXAAInNjnWP1qPrdNmslzHJIe3zj9K6q?=
 =?us-ascii?Q?uv4UdDZXXjCjPI57ctV+ZxJa2agN8RxOvWp5QhQUuGNnDDTAEJs6RY8jmh6a?=
 =?us-ascii?Q?1Ynq5A8K25ujcQJQs5eQPBHzDdi/XgRUWJgIb2ksvqu8ebSF2YWO1vd74ieq?=
 =?us-ascii?Q?4w69rdzxuR3YJrd7n7AHxHqgA5z9MnAsjRZMV+3ZHwjaVqib0rqr2hLSkTdK?=
 =?us-ascii?Q?T5QwxuSvLuVldT9LmAwlY8hCai4MFPAPGj9JbHSyWxn0xtGWZoumYzUkEXV+?=
 =?us-ascii?Q?P10srFuCy4s6Rkq5yIevu2uGkQ0M0YOibyE8vj2X5jH/mVInktZQ9keP8fx3?=
 =?us-ascii?Q?WANk2LGy1PUf3xjA/LK5t2alj34PRqphmZICVdlSVzmPSGsNe0b2xvv0ZNEB?=
 =?us-ascii?Q?yC24CRJ4HGlYL5spgU/oXcBVN44fu8psa22LBAeTttMKybdhamIROXa4mQYr?=
 =?us-ascii?Q?wmOexukBZi4g6MQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:21.2944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6ad267-6b04-4910-15e2-08dd72f8f92c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506

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
---
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
index a72961dfb4..7363943835 100644
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
 
@@ -926,6 +928,8 @@ static int __init construct_domU(struct domain *d,
            d->max_vcpus, mem);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
+    if ( kinfo.vpl011 && is_hardware_domain(d) )
+        panic("hardware domain cannot specify vpl011\n");
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
     if ( rc == -EILSEQ ||
@@ -1041,6 +1045,37 @@ void __init create_domUs(void)
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
@@ -1062,12 +1097,26 @@ void __init create_domUs(void)
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
@@ -1104,6 +1153,8 @@ void __init create_domUs(void)
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



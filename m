Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3DA7B1A0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937343.1338380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOH-0001JK-JF; Thu, 03 Apr 2025 21:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937343.1338380; Thu, 03 Apr 2025 21:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOH-0001Gw-E8; Thu, 03 Apr 2025 21:46:25 +0000
Received: by outflank-mailman (input) for mailman id 937343;
 Thu, 03 Apr 2025 21:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOF-0000LE-HL
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2417::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14737550-10d5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:46:21 +0200 (CEST)
Received: from BN9PR03CA0974.namprd03.prod.outlook.com (2603:10b6:408:109::19)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:46:15 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::f3) by BN9PR03CA0974.outlook.office365.com
 (2603:10b6:408:109::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 3 Apr 2025 21:46:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:13 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:13 -0500
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
X-Inumbo-ID: 14737550-10d5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRf2VebMF5S1bHZBdMQunS8hhCiYkMAg3Q3HHbBuZefPpAbgwZzEh12hLaq3DqY8cUl0u93tTtzJAWM6PlPQEZpHOabJ2PMAzUSUGXsQFwd8x7oqWg/NJex1onLc1zZYchGKfHpiOBpSG0kEsYaFTCE1vNrp4ZUxAGrm18deNWY3mwwjQAxfMfznCtdcqGNiEHzI6U/xXnqGypdjP023rPHdVLM4UFLUTkCl8JKnswcLyfYBxiF7iYvATN84D4xevjRh4JtKvRsO/E6e+YcqufaN1NwtgHiUeXowqT0JAJCzccSjtWQjhv0MzabqNN2uAq4mEWVSQVtl6ZOUI5Pvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVPsqWJnhdLF5+hV3lvpBxyMDiOJWv0qpQ+/oTy6wHE=;
 b=nD8PK1l+GqlEC40Oilr86lVqCoQrNFRxOberUeDGAo2ORuX04htUZUVmr3lAlb6HSU3QnTFDa8kYeE03hjdXwtryoQ1QV/0xw+qNEPnr+xIgHK3o5uaBHtiOSzJZA3oPlM3murkXGDpiC2HhfoKxkiuPITAgyVsQPPB/L8u5gfpYyA0bBxPjvFXWqbW7iRB9ynXRP7vy0KsFuJ0jgA70R+5W1P+Z65M14H60dlt5obeATuJGwZmDH91FpTxPF71J6Fri04d5doXhdOwhcfPD6YWjBcb6zFzvh0U92asn6vop27enTkOelnIxcjRAbSkD1t+n+7Dw/h3jkUy36W4KzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVPsqWJnhdLF5+hV3lvpBxyMDiOJWv0qpQ+/oTy6wHE=;
 b=prZDrcmdOUtIS67VAhVDhz9wgEriC2arxJnhQzpgACbWdhjY8zUg7U6ZzU6Fx3jkYIZUndaLrhun+hK1zGAxB6IeCmWwgiu6YPeVArCwFv+LRtwP+MpgcXv20GfaYc9TqW5cKJtwQOiFMB/8DfesIGXn3NWa2TcAFe0nDXgPhc0=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/7] xen/arm: dom0less delay xenstore initialization
Date: Thu, 3 Apr 2025 17:46:04 -0400
Message-ID: <20250403214608.152954-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: abf76064-2bf0-4408-088a-08dd72f8f52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?20doH1yBm+i64k+YI78my7UtMG0QjhfHpkamU0LVuwdyw+IHy1JItNuoFygm?=
 =?us-ascii?Q?ZKjDAhOI3yZpxHqh/50zWFsXINXOEWiLJIwvgsmd1pJeRhWuZlr95PRf4nP4?=
 =?us-ascii?Q?Uz5JKQht/Zw6yRtusrbHFUCy67QdII595LItQ8L8hJ2EqtFpE3wGO4ryuCca?=
 =?us-ascii?Q?uM/ZM2IsTKitdfHViHKY7zCM1rrL3Je3d2eo42tXBnYctMZZFnHMSqFwlhYO?=
 =?us-ascii?Q?JFUZOdHN2Hk/scMj+OMhA4CYN+YOatHgkdzdtMjJQCa0R9ch2l5lb3Mj/VYk?=
 =?us-ascii?Q?/ZOU5e5B5VvzOjaOuMLPTs6qzat4FrFp96eO2IyZ2vjiyl8433IWCN2ejEqT?=
 =?us-ascii?Q?S18vecQ8a8Yv0EK1HZCeGUsUPzQ4yWIKbsUycfBCWV6HEBC5sYckVmuLvBFf?=
 =?us-ascii?Q?QPVmsjsDySb2DNIBrhC+N7s4QCaMSCyOa1HifNqYRgKuLP3alfwPA6NwSDmu?=
 =?us-ascii?Q?rKojrDxbimuymcN1BGRoR4YnW3nEbGNkLjaBBdZCVxR/FWaGawWKFnKsMwMa?=
 =?us-ascii?Q?actP8R2eGF7ZL7ABIpJY2aqAqfb4GMhIY2erfk6d2/fWBiBlAtl2skQ2K1UL?=
 =?us-ascii?Q?tE7zGMRpMkgEZvu88z29uO5KxlQ64Tjn08YUiumH2eWnfaufmrghu7R7JZ1W?=
 =?us-ascii?Q?K0WDu8KXWNk9vJbcFCpf9Xy3n027aam7qQaGdLQvQxuwop8Cz+jRdTsobqBn?=
 =?us-ascii?Q?NtZJsw76lq9WH/RL9ItuQYU02m4LnT2S1ZnYJi/E8xpCRfNSSOtEWYaqedHU?=
 =?us-ascii?Q?rDQl9n+WuhejKYF6CZYGZRv8ThpyxXoI41yqBwNp1zmfZTBcBQPazUzo+tll?=
 =?us-ascii?Q?BDfp1oVQyiTfl64WiUgkjZGFSqBXVnKavOPXlRr99c6KGb1MH3LV8I4OuX29?=
 =?us-ascii?Q?M7VmfzTAsEvJ9AfBRvitctvgWYUp2IW93mMRwn+toYq4x5OBB2K0DI/SEhb9?=
 =?us-ascii?Q?NAHlWq6ACbQoYg4nRRmksMkHoHLrX2Gha0O8heDCzA5whWiXu2ggpHoEypDn?=
 =?us-ascii?Q?nvtdP5e4lh+G3023qtf5EPxriXh5J9+qTu/IKxY1vnbej969t10VQwbLnGfC?=
 =?us-ascii?Q?tsbu/JWaKW87+HQbPsCt3eiwPDkAE305GNcRSfr9znVgCAI76JSkF8B0S7z0?=
 =?us-ascii?Q?RXRpFIbbsGHq6devSD5ecwaHICnIGrV6VtaGgKwwVHlmUEI/VCq2cgcLxIft?=
 =?us-ascii?Q?8ZlXVfA6zlK9DKd9w1ynenFscyL7SLmXT31M1MWQe0M93V86OWa+jGewboYM?=
 =?us-ascii?Q?/AoU96iGNYJNJhBihHrWnuS2e6ks5goWBVPxvZ7rA03QwWL955IcD88ZK6Ml?=
 =?us-ascii?Q?I0JqYRPpqm7MwarPw4gMviYpPwyHKE3knIfep5VZ2Wua0AOVC/x/vMga8cY/?=
 =?us-ascii?Q?YntPDdQ2SNgH9oo/E1nzuSZiy+nA2f9QABGyG8KVlfFloXnnPcaCSkCxqMey?=
 =?us-ascii?Q?+bnSkJpPJRixWgPKWKBVifYnjjqjvxrVjL2+nFge6zS3xwHN1h/eBcJrXkrA?=
 =?us-ascii?Q?6N41WKD0bWa9J/8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:14.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf76064-2bf0-4408-088a-08dd72f8f52e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

To allocate the xenstore event channel and initialize the grant table
entry, the xenstore domid is neeed.  A dom0 is created before the domUs,
so it is normally available through hardware_domain.  With capabilities
and dom0less, the xenstore domain may not be created first.

Keep the population of the page and HVM_PARAM_STORE_PFN in the normal
domain construction, but delay event channel creation and grant seeding
to after all domUs are created.  HVM_PARAM_STORE_PFN now serves as
indication to setup xenstore since the device tree is no longer
immediately available.  0 means no xenstore.  ~0ULL means legacy so only
the event channel needs setup, and any other value means to seed the
page.

dom0 needs to set xs_domid when it is serving as the xenstore domain.

The domain running xenstored needs to be the handler for VIRQ_DOM_EXC,
so set that as well - it otherwise defaults to hardware domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Use uint64_t to check for xenstore pfn read from HVM_PARAM
Rebase after mem paging changes

v2:
Re-order ahead of seeding.
Fix created type in commit message
Change set_xs_domid to set_xs_domain
Set xenstore domain as VIRQ_DOM_EXC handler
---
 xen/arch/arm/dom0less-build.c             | 67 +++++++++++++++++------
 xen/arch/arm/domain_build.c               |  2 +
 xen/arch/arm/include/asm/dom0less-build.h |  2 +
 3 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7bc6a6c4d7..bb8cc3be43 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,6 +20,15 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
+static domid_t __initdata xs_domid = DOMID_INVALID;
+static bool __initdata need_xenstore;
+
+void __init set_xs_domain(struct domain *d)
+{
+    xs_domid = d->domain_id;
+    set_global_virq_handler(d, VIRQ_DOM_EXC);
+}
+
 bool __init is_dom0less_mode(void)
 {
     struct bootmodules *mods = &bootinfo.modules;
@@ -679,7 +688,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     int rc;
 
     alloc.dom = d->domain_id;
-    alloc.remote_dom = hardware_domain->domain_id;
+    alloc.remote_dom = xs_domid;
     rc = evtchn_alloc_unbound(&alloc, 0);
     if ( rc )
     {
@@ -745,16 +754,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
     struct domain *d = kinfo->d;
     int rc = 0;
 
-    if ( kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
-    {
-        ASSERT(hardware_domain);
-        rc = alloc_xenstore_evtchn(d);
-        if ( rc < 0 )
-            return rc;
+    if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
+                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
         d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
-    }
-
-    if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
+    else if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
     {
         rc = alloc_xenstore_page(d);
         if ( rc < 0 )
@@ -764,6 +767,30 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
     return rc;
 }
 
+static void __init initialize_domU_xenstore(void)
+{
+    struct domain *d;
+
+    if ( xs_domid == DOMID_INVALID )
+        return;
+
+    for_each_domain( d )
+    {
+        uint64_t gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
+        int rc;
+
+        if ( gfn == 0 )
+            continue;
+
+        if ( is_xenstore_domain(d) )
+            continue;
+
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+    }
+}
+
 static void __init domain_vcpu_affinity(struct domain *d,
                                         const struct dt_device_node *node)
 {
@@ -899,17 +926,13 @@ static int __init construct_domU(struct domain *d,
          rc == -ENODATA ||
          (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
     {
-        if ( hardware_domain )
-            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
-        else
-            panic("At the moment, Xenstore support requires dom0 to be present\n");
+        need_xenstore = true;
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
     }
     else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
     {
-        if ( hardware_domain )
-            kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
-        else
-            panic("At the moment, Xenstore support requires dom0 to be present\n");
+        need_xenstore = true;
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
     }
     else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
         kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
@@ -1156,7 +1179,15 @@ void __init create_domUs(void)
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+
+        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
+            set_xs_domain(d);
     }
+
+    if ( need_xenstore && xs_domid == DOMID_INVALID )
+        panic("xenstore requested, but xenstore domain not present\n");
+
+    initialize_domU_xenstore();
 }
 
 /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0a329f9f5e..270a6b97e4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2408,6 +2408,8 @@ void __init create_dom0(void)
     rc = construct_dom0(dom0);
     if ( rc )
         panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
+
+    set_xs_domain(dom0);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
index 5864944bda..b0e41a1954 100644
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -9,6 +9,7 @@
 
 void create_domUs(void);
 bool is_dom0less_mode(void);
+void set_xs_domain(struct domain *d);
 
 #else /* !CONFIG_DOM0LESS_BOOT */
 
@@ -17,6 +18,7 @@ static inline bool is_dom0less_mode(void)
 {
     return false;
 }
+static inline void set_xs_domain(struct domain *d) {}
 
 #endif /* CONFIG_DOM0LESS_BOOT */
 
-- 
2.49.0



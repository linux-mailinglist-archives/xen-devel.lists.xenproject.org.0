Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14478A7ED9B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941049.1340647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL8-0000Nj-0Y; Mon, 07 Apr 2025 19:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941049.1340647; Mon, 07 Apr 2025 19:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL7-0000LH-SP; Mon, 07 Apr 2025 19:41:01 +0000
Received: by outflank-mailman (input) for mailman id 941049;
 Mon, 07 Apr 2025 19:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL6-0007y6-95
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:41:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2406::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0f586b-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:40:58 +0200 (CEST)
Received: from SJ0PR03CA0128.namprd03.prod.outlook.com (2603:10b6:a03:33c::13)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 19:40:54 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::f4) by SJ0PR03CA0128.outlook.office365.com
 (2603:10b6:a03:33c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.32 via Frontend Transport; Mon,
 7 Apr 2025 19:40:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:53 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:52 -0500
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
X-Inumbo-ID: 3a0f586b-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTodGeRMmGQP7mY737UME6q3SqZS36jk9vy59VTOVHVrpx79BG2HjXE9nR5fmKxxOzFPJwNJN9xLR9wioe+ZqQcNDgh6pF+ytzxeBGJB3P3Ph0sLABH2d8tIUZ3+Q6PADe4d8VSfdM6LEh+JkJRUbC5nbn+79spaU8YWJHfCoaRX7wFFfLzdudwsH1nzR+kMZEVtAjFbOUf7jNFMPpUrmhJ/ta4JyNvvFFiOW2xuwbRRE35knlz1ox4l7SZtqwk7mZg+0Gv600F5E5REJlZUe1d4FudY1k4G2U6ZE/Y/bhSCiikeV1T3FOirLijlyT5X2pEnoV69uEUkEXdSl6si2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ZLYmJYoMz9PsaZc5hdgslXTqA0/x8ooP5Dp/sEeWc=;
 b=iqHlBiwfcLk7AfmwpjY1RCFIOjDAEuYJMC1AzwvpT63blBSBjohz3P0AG6ijkbNBZFDk3nRhgv/pZ442HkpCq22q1NQH7adZc1FCnbqG9vERB9YkGiWJIqbZSkxRT8R9/IwdWhnTlqtHTxVbR8Edj7oadcXi6YoneD3saADvMjPx7QaYaqW9oynUOGOtvGp6VYY9Osttd8pI5phaVjH4sIbvVMt/C29MHm1SeMKY5xCmlxA3mU14ZW/LVXI+Jjj1HABLgBcY4NLasE/+YF2z+D/oau9rNKFheygDNalthsBAuW7WqEh7pRH0eTNkvcJWwrzlpJ7o++Dz+yIJthEPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ZLYmJYoMz9PsaZc5hdgslXTqA0/x8ooP5Dp/sEeWc=;
 b=hCN/tMjOVtbmB/Tb+IIDyYoZKLYoyLrFStZfFan2HThK0un9Vo+IF2nsXkD5+WdgffiKKxfVgphJCanHjllmnoIlzuG4/3qBdrKJIRjcDwLwH24IdMJHIDZ4lUZ1VRne3SyO8SjU9MHDrlZFm6P50nJphC4/1FdYxgXgKt0KjaM=
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
Subject: [PATCH v4 3/7] xen/arm: dom0less delay xenstore initialization
Date: Mon, 7 Apr 2025 15:40:34 -0400
Message-ID: <20250407194038.83860-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e5c6ce-72b3-44c6-6c48-08dd760c1c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AAgXYbp0GzNM/8kLFVIQTpF3UiH1JTIdPER/ygUxam+sp4J2ljHxrcV5nryy?=
 =?us-ascii?Q?Q2ZmN1841eBo61vDSIcZnw63zWax4TWI+ko0BelXShaWoiI/pNA/qSLHH0sI?=
 =?us-ascii?Q?qT0e9/023scokpLk1a1bfclrcAWFAUGoI+16T/DP49Xr8tNY8EODFFrkC8Zu?=
 =?us-ascii?Q?YKhYAvRH1hs2vjOt9ypd6B5ZCCYSyXh4r5MhQ+B6VT/1l145/g5yA7hyOxjQ?=
 =?us-ascii?Q?HskP9FSqOMz+EdmYin+TNjdEcpU8z1T6KOBfzY+LpCLikF0RXkAtlAjrpXJM?=
 =?us-ascii?Q?jy/VYYYjvY5Mq7nUZjqETOrRamGN0bWV8V3Jb+I6XlcyXiQM6E/FWBxX+i0Q?=
 =?us-ascii?Q?QMXLvWj8R/D+52lhsgwIY3M0gZYLgYcwq3pBoDiYdTomGEwFgYRGHubRyZ82?=
 =?us-ascii?Q?ia7E0hFet4VSW636GpHbFrqU7B7kVkHUtxs+IXkGJzMEHzLiLlh8O5Uvc1B1?=
 =?us-ascii?Q?rpDp6muMaEJOzOrXNKGP8JJqcUpPecp7r6WfV/McLSWvYZgpZg1p9UxbZi25?=
 =?us-ascii?Q?Br6Ek5LMAzDUdS/o1kDcangi+1BvnafgckSbVaWd9QylOD4wZ1PZHZ+KionL?=
 =?us-ascii?Q?XoxmcIngg9a5hgNnvT3MZeRYWfIto9fFQ/WgRX3XAA/3Xk3skPB49JJuvHv9?=
 =?us-ascii?Q?NHCRV5qWIE1KZaV+FpYpIOq9l19RgkibRe3YD7AHjOMFffiEkB2B2KjVORkK?=
 =?us-ascii?Q?YunnY4J2x6Fn/KQXu/M3WjeJKTAagRPBi2EGbrqRNMIdIKZgyMBbM0M060W4?=
 =?us-ascii?Q?y2tBIICqvtVrn4fytZXOdkDYMVZBLx0oM2GcNNIsXmUlsl71kEsgkGVdvubU?=
 =?us-ascii?Q?FEGEvrudTFjS/4BXfLOOnT1xP3zEYEme3Jg4f3qKspEa1lOQ+dJRT+fH1E4u?=
 =?us-ascii?Q?LR+2+ShQ5pk1C4Vz0nVI1U6k3OSnzPiC7ffb+AwnHqw0CkVMwEgu3CZdoz52?=
 =?us-ascii?Q?E6RNaK/tZbiKdxX1tx4y1xmJCEPhdLlzCBfjo5mj5JZBvlo3BGEe8JwgShni?=
 =?us-ascii?Q?9FUjjRb9IbF2GFh3t9vGCixDbC4DH2jHIK3ScUUj0rqetEuyPQkko2H8dVdZ?=
 =?us-ascii?Q?MXa+62j+Xjy58VPyDdlmdZpdEYYoxQjYVF1tyVesKWIIPps6mJuqzF2GN9LY?=
 =?us-ascii?Q?bGNoGBZK8Os213hin2IcPmeCs75OhLT020jNOMK6APgjWMlIHsFCawQW7enV?=
 =?us-ascii?Q?s05ZGVssBOIaRGqTlXnS2W8C5mXzGTsEHLqg/2VhtQn+3RFvoVeTHBiZe5wD?=
 =?us-ascii?Q?T2w/TgHN9QUxwXKja0YlZqB2pYlkxqCkIybz1LKnao/Mm5BbObLLVda56hbx?=
 =?us-ascii?Q?NJD86cnAMHXRUPgQH9zADHemumsE7NPP0VZsBS+X52UOTVIR2c4JsAz6HFwh?=
 =?us-ascii?Q?TvJHo94Q7UWy07tq6yp++ysxyxexNHAb4A8VtWbkkj9DFDlU7yOzkbF+F+Dx?=
 =?us-ascii?Q?OMg3Xxof3VarXDgVQA4gyANGUPKLCohkZdPHexj3JvJDS8UFWtja1/VyTncc?=
 =?us-ascii?Q?iVmYGTOAOgZZbnw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:53.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e5c6ce-72b3-44c6-6c48-08dd760c1c1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4:
Add Stefano R-b

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E56A7703D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932999.1335069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv1-0005L1-8i; Mon, 31 Mar 2025 21:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932999.1335069; Mon, 31 Mar 2025 21:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv1-0005Hv-4d; Mon, 31 Mar 2025 21:43:43 +0000
Received: by outflank-mailman (input) for mailman id 932999;
 Mon, 31 Mar 2025 21:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMuz-0004Vr-3d
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2415::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3444c228-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:43:39 +0200 (CEST)
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by PH0PR12MB8051.namprd12.prod.outlook.com (2603:10b6:510:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:43:33 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::bc) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 21:43:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:31 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:30 -0500
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
X-Inumbo-ID: 3444c228-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hqo1KS5nxhXXEPUvAE8o6FqElcZMM72DHlRXlYJlaQHRhfMjCpiUSOk2tO1QCZD+ZgONr6kDYysL9WDStrhhbHQu5tR9SZMgbnP1GrKbCdC7OYz54qTs/EDShVae7G9dwcaNR5UuouNCBg8+/tezNjb5cRpm/86aqeAJ3RPmQMngFOnrvX1BvBC2Vjne3/zXG2dSkKtEw2fBfA8dcfNhT3Tax0sGfJ4tJW1o4qzZlLrmSmd/I+1wVNu5sWucVBPYGtEM0IG24Tf9s/WMSEgK9UEgo75KqXKyy9Za2OPpwfclxqkRF55eNTCjHg8w52H6DQTeFSo6zSMj3kTmO5frJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obPuKkWxG0z+mEVF9qf+2e+HKAoV+mglU8Qp/Nk6GDI=;
 b=P4f7Ty00OWA/alaYaSpIYmqZZqVV/ZB8xdl8O4+7lWQymYKwFmdV/jrveO57IOSqqz2ohUI6S+IFIBLjZ9NeVVNeotoLE+Mz/EJ0VqFvKfcxQ8WJHYP93hnxASfL2jau5Dcobmf37IlKBNpy9sRH+iT99yPftM727ygE7OHgeBogI7VuzSabDLJ+pSU1FPbbSqSD0Cfjc4S8sIgEvZKtzheOxyQwqHG8LeHRycCZVDAj6NcCmqJ+jnhteoMusOyhawXdcKmh5ibYJTguBaGgsFul2RR7glaMYeftJRX37nu8ZZZBHmKxZDa0TKi/gnEEShnqxwPAqwNTRzyqHAX5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obPuKkWxG0z+mEVF9qf+2e+HKAoV+mglU8Qp/Nk6GDI=;
 b=hLt1WjO2+VpqZTbzzffcgxtzhjGxeJ3ZZ/3c0JA1kIlTKhhCmW/WHuY2yGm8nDyiw6GwjiNuvzJPEjtzgE8MrDMVnGpbr+TXtlfEWW6/c+ob6L3mwWwXUtyZb6i7MHjv87rGr5CKVtiw0UwM/lofRf5L/8oTu1iSTyx051YiR+o=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/6] xen/arm: dom0less delay xenstore initialization
Date: Mon, 31 Mar 2025 17:43:18 -0400
Message-ID: <20250331214321.205331-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|PH0PR12MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f280073-b276-4295-8b26-08dd709d1508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KHQdASEBlfybq4TDO0Ghhrx1EijTSmnkl3QjnEVkEhxXepQqvU5GGv3NLn69?=
 =?us-ascii?Q?fwp6mLgM62KIDdw5tV7uP3k8LhfuggBnlkPEAVH7aIZtov4eTFuio1atFe3l?=
 =?us-ascii?Q?BPZIznNpH8jpwv2SBqXPTkoHrUDmARGdzVVHCXg+QKhBkSwG3tdbRDO5LKXx?=
 =?us-ascii?Q?t+Sm0xn3SYBZSjdWSsKk5A3EdQNe3jVrFEgCuNDPf5VJnD4WinUJN5kh2g0A?=
 =?us-ascii?Q?0CZV4Aj5bO4f7HMsc2hunrraiBsUdaWUgErep/t33v3OxmzdOuj+xmmjiOOG?=
 =?us-ascii?Q?YhZ4pEX8LC3T8GXJvfa1q0mRdgxAw0TCwl52lq82IMxnhav1FcFX4CelSsdp?=
 =?us-ascii?Q?DTqzLkro4y2GfQKqV//FiCjyLBIldEbS0X/azbE06f/cy9cMXi7cIuvuU452?=
 =?us-ascii?Q?QuAzqV3Z1mXVBsDWZ2EobWyy15GfYWckoYHPm6X/5J7QXztb734wFJF/S9Bz?=
 =?us-ascii?Q?2ex1A5pxQYYSlvHstZyYtQq0C6Nmw7mb0QXXiKbO1xutHbjmermsDbPR5dsX?=
 =?us-ascii?Q?/QORwyf+dufAAKzJw6OLhHLiP8bdiKa3B4yHPeLifn2PAVgB/cGuz2nvEbKt?=
 =?us-ascii?Q?M1PpUuQms5uccsVcrKu1oWFLw11T00EVQZKT6Pgc2i5NY71uMeaQkLqEQDxe?=
 =?us-ascii?Q?lRfDbFJC0aM9kzgPDM6xC7RV0uEZdVM7nB/NYMSfIYuPWBFNxn7BJlYS8zhp?=
 =?us-ascii?Q?sFCDG0MTJz6vG0VV3uD99UfHL4eLjB5ouBOZPsjzKM5ZQK8TK3wSryI8wpuc?=
 =?us-ascii?Q?nPxS3W1/lVKKSZ13xZSQj6iJrfZs+If5sEg1SRJA3LtUM+77kPaBQdc614ob?=
 =?us-ascii?Q?154pAyZO/7aU6sqhfuvFVgD/iycOxga3rhK7wjobqo6vDVgzN0O2O50NwnuB?=
 =?us-ascii?Q?BM4MUJTVFIuWwDLm27+zq71Vj18+1DP3Iaek03jng1UozUlWv6z8oXZRacbZ?=
 =?us-ascii?Q?vxuc0mCGrZsCvYSw9emDmu0idBqdOS+aO30KGNWYfEQoY9/XkWOJ1nW+Gq2B?=
 =?us-ascii?Q?C8+dKreM80MU4xKCJC3z4ZKjBdg0mKu7bncREyiaYB8Nf2pjd9RZloITIvwx?=
 =?us-ascii?Q?mKpY6qWaSoE345AUDEFjl9Sq97rmrV7pCNpE8YG1MTpt4j+r58uk5k+aNiAI?=
 =?us-ascii?Q?jCjV49MIbDTKef0XffZWIKtQKU9vy/SUGJIiwaNZh3hm0qGosJ58YG4tETpG?=
 =?us-ascii?Q?sQNNwxyFWWCyYI9oJs06uOHGUW/IyxVqDswqQ+3eouSkg2P1Zs7DIbrciarP?=
 =?us-ascii?Q?UmzMtyims9uNxdQhxb1X4tl/CpFO7KO1/OIKZUh88aAJNH5jb6Fh3a/67Dob?=
 =?us-ascii?Q?K1ZFtnzqc+U2fkFyr1s/yuIoQg1IUBPUCT3x1sKqFOq+AcILZUcx5KDVx7Aa?=
 =?us-ascii?Q?GqUpaRh3Kk4sQ3WIR8oH3kFa4UBh6JsHXV9I6yB7cHQUy7zClItDRB5S6pYL?=
 =?us-ascii?Q?A/fb/LikTK7lt84g0e3fQVNgI/vHPjLqw5JhdesZ5xeKb6DHwzFJQgNbyp6H?=
 =?us-ascii?Q?5T283vbTjxLv9j4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:32.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f280073-b276-4295-8b26-08dd709d1508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8051

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
v2:
Re-order ahead of seeding.
Fix created type in commit message
Change set_xs_domid to set_xs_domain
Set xenstore domain as VIRQ_DOM_EXC handler

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c             | 67 +++++++++++++++++------
 xen/arch/arm/domain_build.c               |  2 +
 xen/arch/arm/include/asm/dom0less-build.h |  2 +
 3 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index e25d7bd468..a46f292c1f 100644
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
@@ -694,7 +703,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     int rc;
 
     alloc.dom = d->domain_id;
-    alloc.remote_dom = hardware_domain->domain_id;
+    alloc.remote_dom = xs_domid;
     rc = evtchn_alloc_unbound(&alloc, 0);
     if ( rc )
     {
@@ -760,16 +769,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
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
@@ -841,6 +844,30 @@ static void __init domain_vcpu_affinity(struct domain *d,
     }
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
+        unsigned long gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
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
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -881,17 +908,13 @@ static int __init construct_domU(struct domain *d,
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
@@ -1138,7 +1161,15 @@ void __init create_domUs(void)
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
index b3a396c2fc..d99ca7b43f 100644
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



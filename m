Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BFA5594D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904077.1312067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK8-0003Ok-8D; Thu, 06 Mar 2025 22:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904077.1312067; Thu, 06 Mar 2025 22:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK7-0003KF-Vu; Thu, 06 Mar 2025 22:04:11 +0000
Received: by outflank-mailman (input) for mailman id 904077;
 Thu, 06 Mar 2025 22:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK5-0000St-SH
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6ee5e5-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:08 +0100 (CET)
Received: from BN9PR03CA0068.namprd03.prod.outlook.com (2603:10b6:408:fc::13)
 by MW4PR12MB7467.namprd12.prod.outlook.com (2603:10b6:303:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 22:04:01 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::79) by BN9PR03CA0068.outlook.office365.com
 (2603:10b6:408:fc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:59 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:59 -0600
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
X-Inumbo-ID: ec6ee5e5-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acN1sRDCmHjMGSoyfHaDXvzhOaCbbHidpjbHBl19IJo62S5+/R3sU9mSkpeaZN/vVANoggMCMK0lGIkuKjylxJ0NbUIIyDsQYDgOlp8cUcpEsvFO7dMjagppjLNLTQIfoxrRsjzytLQ3gZfkhOji4e39p1c2dS1J/b2uFANsCjl8E2A9Ys8KJ3TIiLcCMVxvVdzUtX71s4qcknrbtxCgiYhcrMhiPjxzifmzPIW6YUcPNScjjV6wEO9WUN54wl4TfYl7rYITL685SywEcMh2iQqeKYTq0+Ozlwg1YN+lX7LkqxnOa4zn7Ow1BMKLSs5QPbHnwWS2vfXYpfRGChNISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIC7xasjbalk/ExMtgL5X2h1ecLmO7GR38I48vi/PIw=;
 b=lbs9N7JC3Vg8gNlIecqSyNj6f+38gNyqckKK8CC3Qv7i3dB722yEvvK7AsWZMGgkZHPYS0BCq7QFMwMzNOnaX7JNYgx1YUfJafoGQXW4bxIYJuxNJcs3GbTVCoLRNnhz3eetHIdz8Xj7YjJAHXs6f51F/QG5ENmT4PlGq98QoNhcC1bxIlBbwM2tJDC8hYqTxOdpReUUaRZrNYBv0Euh+EYX5pNlY9AsS1wp5ICwSnyBvvcqmCBI2eeg2TFtKXfS9NvWZ6c5yntD0o0G5dtxoByuRCr7AtuAH0FqDJEF0RXMUMVd2qzxtKwC5mQk1LbIIJWyeo2cu+M/NdqF3mifVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIC7xasjbalk/ExMtgL5X2h1ecLmO7GR38I48vi/PIw=;
 b=DsozZWtPWYpJyRqYZZ+jC5HU2Pe2xBXhYAdBMjxpEjY2DkWRUGlSvL/ZAqP5bjEXipvmFyx5e8EDVY5zC0vVZi8JhK/n6KnWp5ffmai0MAZTi2gKpmHmFiEPtsiXwO7GXstj1gmcIR4BgCiOoWR7U2MzlXufCwmUluYYjghFI0w=
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
Subject: [PATCH 10/23] xen/arm: dom0less delay xenstore initialization
Date: Thu, 6 Mar 2025 17:03:30 -0500
Message-ID: <20250306220343.203047-11-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|MW4PR12MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc91e06-025e-412c-5924-08dd5cfacd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxWcu6lOjk22Bu8pnjwAHqSuyNkuQHIx3VzNR03jn8benuveqsm+zl+fhrGP?=
 =?us-ascii?Q?LolP8JTnzpcwExoJZj/5SZAQRAmkyJZEmVNlPSAb+4iWK6BL8q7kzC2hJ5ob?=
 =?us-ascii?Q?ZdTB36FT+MBtu1PFGVQN6YCFPMy8j/UCszJ14hYjrndWiNlMbvTBxyI7SVUa?=
 =?us-ascii?Q?B3TzXsqSResLHJYRiK5x2PuA8Gwm9brTHPtQLZopEOzAYjwGCqO2jsjBP45O?=
 =?us-ascii?Q?TCcFoM61oxh8Pr6id1pyoz8YgyRiKytZMYUvkVLmo44F0zWzJul8Qnu3b8k7?=
 =?us-ascii?Q?Xb03ELvdJpuAczF0l9z3Y05yXw8O+N/QCLAbriG5OAFd9SjXcTRRovXe7fQe?=
 =?us-ascii?Q?tfviKEpdccmngifcmAsFsB9GZ4jB31eFd8GeWzWw8IR5V5jl5CKGOqITq03h?=
 =?us-ascii?Q?VEhgd3ApPlzZrhAlH9xq/5rcshOlXAzr4S+LaWTGpXdA+AvB6GOCBfcEpGqD?=
 =?us-ascii?Q?cpAQPozFLjFS9enayz9YnPST4m0pZRS45xO4Ff95n8aB7gOKsnQWPGG+G5nF?=
 =?us-ascii?Q?eiY7jlQheS1DLJYWXk6/woAU3oLgB8pEPE5BfQyMBURahpbVwU012bUhrckm?=
 =?us-ascii?Q?RzC1QPTJaYPD/BvhAhJpImQKJd5wTE8o5sReAGnaWXTHiT/BWf5vZmMvAqwK?=
 =?us-ascii?Q?3GZ5RDAFcMiLBnLRzd6gs5bqlfgXZ1xagJdT/rZB2ngjZ+psSxWRhBBhUfss?=
 =?us-ascii?Q?7QLtrZcpmwAWz8Zm1l+ojo8NThXCsZePw1QGyh59f3nKvw7Fs75MypICYdLf?=
 =?us-ascii?Q?L1Jg0iQXNf0b72rq+bWPcY/OF6L7+qIiazhuhoSV2r8RsMeDIQcGdNdSR+1m?=
 =?us-ascii?Q?RVCRv+2cnCIcVe1F8FpuMJif+ngvgK3pjLJcG4c4iudydmnpHsaFgGQ2UsEk?=
 =?us-ascii?Q?mU6JJaYFiCf+uUpdAWWz05mnEBaVV/XoV4kLB2lJSXBy0teTlWaQrx52ziWo?=
 =?us-ascii?Q?UX8gQc+HuqVwPpARiBCZrqPzpb6VTc1Rw587gApnPLTmC8WJDgQl0Uc821TT?=
 =?us-ascii?Q?sxd5colMw8axD4aH4oRhwB/lHG8kAYSiixEeMSBb4hR7bDu5UY3/zQF27Asn?=
 =?us-ascii?Q?fhP8MWpDigS4DDwcTXauvri0yc5xnVm9oPAEMZoRIwaoibs8D8/npS3hQoJI?=
 =?us-ascii?Q?wSW+HUrjWNmF7hvMxkHwimYol4ThDFCSYbtSSHqLpdcIp8S6yA+mHXy9AE0Q?=
 =?us-ascii?Q?4uTiXG3vAaI2GnOunsk1BzcGCff+S0K0B926O+QnfldoPD811v18t0XQZXiV?=
 =?us-ascii?Q?RuMCuYF+pyilqctV1mohxXK3YetZoJanw97dXj7wcbqPripPVR4oUpRigHoa?=
 =?us-ascii?Q?wp9eH/1giVtBVl6y4GpR3ANb+BklaQjCQWJ6BX52lq150KjHcXkTfNWBvJFH?=
 =?us-ascii?Q?A6tRvrcuPFWWgIM+6ZULKPe6aXVUZmoAeb5lgIWOuEZOgDFR2d05uQ9Aait9?=
 =?us-ascii?Q?S2yyWykPzUUPOdckneC1dwp46k6kvi+u3Fw1If9DsXSeAKVMgD6geOn/hHjE?=
 =?us-ascii?Q?JR0HsE1W1Wp/u6s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:01.1790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc91e06-025e-412c-5924-08dd5cfacd4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7467

To allocate the xenstore event channel and initialize the grant table
entry, the xenstore domid is neeed.  A dom0 is craeted before the domUs,
so it is normally available through hardware_domain.  With capabilities
and dom0less, the xenstore domain may not be created first.

Keep the population of the page and HVM_PARAM_STORE_PFN in the normal
domain construction, but delay event channel and seeding to after all
domUs are created.  HVM_PARAM_STORE_PFN now serves as indication to
setup xenstore since the device tree is no longer immediately available.
0 means no xenstore.  ~0ULL means legacy so only the event channel needs
setup, and any other value means to seed the page.

dom0 needs to set xs_domid when it is serving as the xenstore domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c             | 71 +++++++++++++++--------
 xen/arch/arm/domain_build.c               |  1 +
 xen/arch/arm/include/asm/dom0less-build.h |  2 +
 3 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f1d5bbb097..3b8153b05e 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,12 @@
 #include <asm/static-shmem.h>
 
 static domid_t __initdata xs_domid = DOMID_INVALID;
+static bool __initdata need_xenstore;
+
+void __init set_xs_domid(domid_t domid)
+{
+    xs_domid = domid;
+}
 
 bool __init is_dom0less_mode(void)
 {
@@ -697,7 +703,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     int rc;
 
     alloc.dom = d->domain_id;
-    alloc.remote_dom = hardware_domain->domain_id;
+    alloc.remote_dom = xs_domid;
     rc = evtchn_alloc_unbound(&alloc, 0);
     if ( rc )
     {
@@ -755,10 +761,6 @@ static int __init alloc_xenstore_page(struct domain *d)
     interface->connection = XENSTORE_RECONNECT;
     unmap_domain_page(interface);
 
-    if ( xs_domid != DOMID_INVALID )
-        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
-                          gfn_x(gfn), GTF_permit_access);
-
     return 0;
 }
 
@@ -767,16 +769,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
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
@@ -848,6 +844,34 @@ static void __init domain_vcpu_affinity(struct domain *d,
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
+
+        if ( gfn != ~0ULL )
+            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
+                              gfn, GTF_permit_access);
+    }
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -888,17 +912,13 @@ static int __init construct_domU(struct domain *d,
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
@@ -1181,8 +1201,13 @@ void __init create_domUs(void)
                   dt_node_name(node), rc);
 
         if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
-            xs_domid = d->domain_id;
+            set_xs_domid(d->domain_id);
     }
+
+    if ( need_xenstore && xs_domid == DOMID_INVALID )
+        panic("xenstore requested, but xenstore domain not present\n");
+
+    initialize_domU_xenstore();
 }
 
 /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 00bc484642..ba6bbb95c1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2373,6 +2373,7 @@ void __init create_dom0(void)
     unsigned int flags = CDF_privileged | CDF_hardware;
     int rc;
 
+    set_xs_domid(0);
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
     /*
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
index 5864944bda..df879f93c8 100644
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -9,6 +9,7 @@
 
 void create_domUs(void);
 bool is_dom0less_mode(void);
+void set_xs_domid(domid_t);
 
 #else /* !CONFIG_DOM0LESS_BOOT */
 
@@ -17,6 +18,7 @@ static inline bool is_dom0less_mode(void)
 {
     return false;
 }
+static inline void set_xs_domid(domid_t) {}
 
 #endif /* CONFIG_DOM0LESS_BOOT */
 
-- 
2.48.1



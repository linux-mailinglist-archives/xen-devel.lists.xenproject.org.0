Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70157A90DD4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956556.1349923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AJy-0001kb-P3; Wed, 16 Apr 2025 21:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956556.1349923; Wed, 16 Apr 2025 21:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AJy-0001i4-MP; Wed, 16 Apr 2025 21:29:26 +0000
Received: by outflank-mailman (input) for mailman id 956556;
 Wed, 16 Apr 2025 21:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AJx-0001ht-4j
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2009::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb2bd7e-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:23 +0200 (CEST)
Received: from BN0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:408:e6::29)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 21:29:19 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::97) by BN0PR03CA0024.outlook.office365.com
 (2603:10b6:408:e6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 21:29:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Wed, 16 Apr 2025 21:29:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:18 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:17 -0500
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
X-Inumbo-ID: dcb2bd7e-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tE0MaZPRvHIFFL6fJLJtsSyCM+Zgp9Hoo0bESGpBeIFd4K0LGFsLHmJdDmb1n8sLv9fLYu778rAdZ8KO14sMPGVLXF7Ndpr2dEMq3bjD2qZmQzgB5VLCQatQE/rIRmbgy/MVjYPv5yHw+NQrd94E4dS0cDcj0B8HxHotwpKt6oAKjMVybxkOXgcATdm77UKvEUKZcwu/AipF9AfjSajAcBbPFASm4Y6zQlkHqDHhI8NmjeU708RGpOsB+6zq/wxzuFV33WoOhuNaMn5xPLNIrZb9fWvb6IGbA77w2+K/JCaifZC4R6wHX0qT2aIqt3pkJO9jN5QEiW+tkAgHmrh9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb+EANq+WOOIYm4SaGYyUfxwcKnfbKSADWxYlc7gxso=;
 b=oVZl1+NPp9ixM2UOtVcGeM0NScZ6WP5WX/Nln9H5ilz2V7bcFiNVcrpKEQMkgkkImJha3RjOuVVJbvsKVu7GdpWThm6c606cJd4A1rlYqAJACCCRC906tuhTC+77UwONrqe1ws7KUJAU69Zw7s7ofXTMJVzYwDoWREPzhyBDP0QTpU/J1/pH8t7X43vNNHAj/W1/u0TlcMGsqxPHzmcJ1gZBDUSpTsjs3/XjhldGNT5hj8qrqylvF228XL0kU8Ui+ivV/zaHHn5W4o3KH8sTI8/8MC45REEyjYthJHrsGHvuK0GqFie4oug51pdsmGH2CWC7Zc6InscJuY9116+iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb+EANq+WOOIYm4SaGYyUfxwcKnfbKSADWxYlc7gxso=;
 b=HDdxJSGgTXPscneT5xkjqPqJICE82plnIT3luhYhIlNMnOZAuPvvWeWaOv3A7FYJWrHCYRUdw0fAwQ4ymd+ZoiWPDKXO2vFRq7DXX/z697PTkZ/fLCngKQbCKyclydFz/Nawrpqypz8rI4AL2QaZSfhPVUzYt8gptxZ43GKJRPA=
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
Subject: [PATCH v5 3/7] xen/arm: dom0less delay xenstore initialization
Date: Wed, 16 Apr 2025 17:29:07 -0400
Message-ID: <20250416212911.410946-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 51534c0c-7999-4151-4ea1-08dd7d2dbef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRGOR0EOn6+1cI5CpU4MXh1Ub83rDVYNS4EhLZiCxpdp9XetKPJ/nnDzp8VC?=
 =?us-ascii?Q?dBpB3H4tYlrKk1k5H9gY3ULCAdoUY6+uw9ZQcuZ8oBtcPHGaPwFVSDQUeXXX?=
 =?us-ascii?Q?hixwil+0OGrRmhwe5ait9rSN982o+QZ10nP7mReuPWynU3M+yV3JLHVnfmCk?=
 =?us-ascii?Q?IhTZRjqeyhXn5vQnBD2sUgkSBQxU5Tff/SAb0fS99rmaSnUOokdpBCfd7t2z?=
 =?us-ascii?Q?K7vpwBSn3nNIOYNFV5I7zWJaYyWKwCnQWFCBA0TNYX9oZaYs6i6u0BjgemD3?=
 =?us-ascii?Q?KA0YLP7AH8nv5is4Pr7u5VrTHO/PMGpIfRb11sReKaiJvtP5Zbf4BHU2OkPR?=
 =?us-ascii?Q?3gzm37UL8whKlFFwsn+bqqywPdkfPioTQ/dB5sks57yK+q7uT9rUXrA0aILq?=
 =?us-ascii?Q?I0uNUOtuTh8z7NJezhRJANIbuIxyaRPOmNSx5BwTwZTRsRneYByt+LjItwHU?=
 =?us-ascii?Q?EaqX5iunCM1ZvDUYGiNiaEvMY8uuiqRp2nmcUWjTJoHEJaMG92Mkr4GwQVf1?=
 =?us-ascii?Q?dV3cqfRFP84ZaS8z0wV60rp8UZA5QiT2XmIa1Obuss3fwTzky/aS6WR1ZVu9?=
 =?us-ascii?Q?VZf8bIqsEeLkenoZ4kVoU7jTwi/TeGwRzJHZQA6jgAWIlHXGrmduEjLau9Hi?=
 =?us-ascii?Q?GNEmN8mTqcpop/lsdffM8cpWOt/j4q1DdpATpfu7Nlkk5W2UPloqj7RHqatS?=
 =?us-ascii?Q?gkA3lCnJCZcYEea5CIuCsIComL5P0cl0tqwT9dHZlaPuLLWsz+3lXAauIBe9?=
 =?us-ascii?Q?PO5FG81tvSW9nBB5uzJfXZXBfO5bEJR08XFf+bsEt0/7nbPTkfdFNUYpkfJw?=
 =?us-ascii?Q?N7aHKLPi5qEckFY7IQWU1djgr7PYVJ9Pc7qWSHDb7pw63SbLMsMPyb7HNPzf?=
 =?us-ascii?Q?5DB9v2KNZa3BxUfgmHeX12SHo6XNb5mwRfBBtzk6YOnAEcZw2E68tc9j51Mi?=
 =?us-ascii?Q?he04h83VnNyY5z55f1J+BDfJ2c9qeWGDaE5K3L8+jaCIERhPg9HnBYoyd9VM?=
 =?us-ascii?Q?c8rL0mmF4LYJHurNA8/Q/vsd2CzV5MJcFJMdxNpoMNxtE9WGSGOsYW/Es4sr?=
 =?us-ascii?Q?MnHCFVRFVE4QSC2uOefza/LChEFBjDdM0zaAHXWFWn+7IfqkpYjtkKvuQt32?=
 =?us-ascii?Q?8dIseXjnBO11YkMlsnq9y/ZLMhmOMjLRvh7NE7gKbq0wv9pCHUwQZDoGxjow?=
 =?us-ascii?Q?nKDzTKO8wsnOjgIvMIslE5Mznq0wZDNEM9mvFV83KFdhzXdC9K1vrjEhePwS?=
 =?us-ascii?Q?ptZx/+PC1amL9aJF5UM/uqK5wk2itJFT5HaKQZfg/GTeclYAalCJbgSiVaeY?=
 =?us-ascii?Q?ikQes//LVn7mxZkfpr4Orgq+xxO2GEI9EL0nxkNUtIq8VE/NQmKHuJFTPImP?=
 =?us-ascii?Q?9iTCr8XBodUBVno1qeYFtSiXDWesGVUfwBD6FGnGXfY1MByCZ8r9HSkvIMw5?=
 =?us-ascii?Q?eQonl6Z4TzCJHtxYlIKBaIm7h40wx9mJ3XH+Mjg9lpYF9Cd5ni6Ff0+NSVvU?=
 =?us-ascii?Q?PPQHCiY4TO8YUBZg4Ifm0wNUyt+kUDmjqXjY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:18.6786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51534c0c-7999-4151-4ea1-08dd7d2dbef5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510

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
v5:
No change

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



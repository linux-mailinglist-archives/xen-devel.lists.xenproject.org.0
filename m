Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C766A55946
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904071.1312037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK3-0002Nz-95; Thu, 06 Mar 2025 22:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904071.1312037; Thu, 06 Mar 2025 22:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK3-0002JW-20; Thu, 06 Mar 2025 22:04:07 +0000
Received: by outflank-mailman (input) for mailman id 904071;
 Thu, 06 Mar 2025 22:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK1-0000St-5a
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9ae5527-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:03 +0100 (CET)
Received: from BL0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:207:3d::35)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 22:03:58 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::6d) by BL0PR02CA0058.outlook.office365.com
 (2603:10b6:207:3d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:57 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:56 -0600
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
X-Inumbo-ID: e9ae5527-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8mJbBtB/kEvU0i+jc7cpuxBZCQXCzkRi9nidOpzC8ITlkDQxY6L+lDifJiqZT9iElAs1k5TZS4JF3G+stl6FisIU2UuxeHKAItmn7PipJDwpI5V6RhdN28DyRptWpCnavwXwO3I9E0UqOTDQj3zUea9GkNpyRPWHGhAArT9QJ5HadkHKzQOUbrrUxL36hEE2TI8fNXNIHx6ngvXonlVN9cTMEwcKxkvU3q87V+H9cyv4vn1cHlXLIpS6MJ7ffbc+xKNNcVypY6YLz9OcTV9LuJZkKocl/fJVJn/2vbakX7Am2WDn4OkQXAD5Of4xP+j9DITxMEJ3xbcA50xGZDGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzAMmJ2y9UG57sCUdrV921xp8rnXUBaxfjOw07lBiGM=;
 b=hzzeeWnzimISjViHPGNxb0yDy1/+jtY9vg4YFe6IbMtPSS86wXPaqrc3t2Ih/CgxdReyJlJeQtnLp4c4Ayc4NpjiokO7WAxXfTOq7VNPAtbTdxXjSv4SWFjX9aH98dbpwe4BPQKQdzodbfWMPeUmF2QZOUPB82wH8eXzZhjOZGqDE1mV1SLMWk/780CMmKpx3MI/chAnF8yX+jXmwatRbYuSK2o4g4Wmo8MT4g/PaoBHaV5vCqJGvCK4bY/IuhvUPuu+yZKGt8OREupLOc4C0hp2TWBXnKCytsui6jA4ANHnOkpkD1eSZdlG9uonAayz6N3a2b9evXez2lr9g1cDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzAMmJ2y9UG57sCUdrV921xp8rnXUBaxfjOw07lBiGM=;
 b=2hyNAqzks8yOAroztKAmQ3EbAI8na2FFNjZnjO9ZAwEFjb79XiMkHcifM2mXoNQzDAYt3oRNjWbjxTeF8VK5K38mefTK2uYD9YZ6j1ZpJCrQBrKbbkPTL80/PdOiCYG5SajktqSJZP7s/fNoLMwFSZnrkvczS7VmVwSwqK1y6qc=
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
Subject: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
Date: Thu, 6 Mar 2025 17:03:28 -0500
Message-ID: <20250306220343.203047-9-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cc459c-f904-45c1-3a88-08dd5cfacb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I8bgLuB3Ry5t4YNdDYLd1wi4V0aSa+rx6wvCtJtA9Lu4+SJ/oNRG2Sk+vgJu?=
 =?us-ascii?Q?pRuGbZm/VnfXa+pd+C8llTSIqp6SZyKkXLVG+ZfyPAp0yZUHCYat1itdgSss?=
 =?us-ascii?Q?u87G93BHnsr2ryleXlf2d5ip8teGHYPBv8324Y7KHYa/D7Dfxi30II+7dd/7?=
 =?us-ascii?Q?xGCL00wLouvtOnszm2+U96CUlq4rx1xed1fGwjafX3kq1xMBz0JqmdD1ttt4?=
 =?us-ascii?Q?yo38OOzycI0+Fz/ylJn6mpmYupi5Bf6GufbVYLV+ZVISz3eNfGIefcm8D87h?=
 =?us-ascii?Q?vB56x0ruAA9G4yLfB+OJ8DukGPwh5d0YIpA6doXN6GQL/enUrDEvxoWk0dem?=
 =?us-ascii?Q?pmXd5w/+VqAQh8w0bV+rW7piTULaWbXZCUIyZ97AMjSAfIAnp3CycQqTA0py?=
 =?us-ascii?Q?4Tu+bW98Lq7aUapNbmc1CsyG2cN3bc9rqsoEn95O0QGknabQJnmeOp5zOmsW?=
 =?us-ascii?Q?2FkwVLOOUNssaXDSS6bSOCUg1RXYQSMKRrGELORcLI1gB9LyafTXR8XitsZz?=
 =?us-ascii?Q?oLmHw26C/zWa8iUjh5y61KUBEmZyNuakqv7xgwwSsBnJGRTNbVPMdXdllOnw?=
 =?us-ascii?Q?kM7tVqw8pvmpPW7VBC1PaGJH7ccFNKnSlQqrsZ0IMuK4BIpe9Kf/CFKAbGmV?=
 =?us-ascii?Q?CjQaoBK7asXlEPJQCDNCSbHOIBCR+ApnTtUaYhvR5Hiqxz5+j53sg57YYnNC?=
 =?us-ascii?Q?3BbGkSjGvjvOV6k5N0mzX3gLAzghUO8GuhV8XIzzzmnPtlUC5+pZ2YvV910F?=
 =?us-ascii?Q?w7JlUof/BztWYTbspc8ytQfTsLmeSDPQnLq99jwglfhP3yJx3pLB0QyIeuhe?=
 =?us-ascii?Q?IwgiL5zdQnCL//U1qGHurhsjy60fw7kIAAEW5NSgQ36uIuUvQ1kwBF0xsJwt?=
 =?us-ascii?Q?BK7NBhXyHkTV+9vsD4v0qzjrH2S8QckzxhLh6M+JfTPJpoYY5KfmngLkaFik?=
 =?us-ascii?Q?Ex+cuPY1T3bQd4PRrPEIVqLYKdKA5aa2DcD+ImZMzop46QAwMYbSMboC1tSn?=
 =?us-ascii?Q?z9gH4qwFUluK91hS9l/l0EAVE2Cx8XFE9xmUac7ZPVfpssfRVOfUYyA/09dm?=
 =?us-ascii?Q?kFfJIA20iO16QldCSul4NSbiK8oiSJ4Li0An0Qq2SDkazgG1gCB3z3wL+abI?=
 =?us-ascii?Q?q3sd75+YVDWDi6Hm6hcSyDr3dashqSX4FkmmQNk3gHO1sS/3UnttKtv7zbAW?=
 =?us-ascii?Q?A1C4wW5uVSkv0qn9iOC3LqFCj92DzFn5QL1ygOewjhiNQ6mfg6DP0IuBJh1r?=
 =?us-ascii?Q?jkAPOAz1kLYVtpwABh8JLPgkUecEJlDMHw+4in6AekEQ4TqjW3DhtzUDVBRe?=
 =?us-ascii?Q?FLxo7fxs1oliTDEphO3iihEVa4klCgloxSB17q0sY4z3wiC32vlVz+W8sRTu?=
 =?us-ascii?Q?DPmjpT5mwoFoi6hQ9lRaT/d38Kxax9ZV68NLQtKRkkWm0lYvKzsv577tUXS3?=
 =?us-ascii?Q?SJU8QECZpOqlixJf8E1WjLHqHk9ad6jqRO2hffEPoDEYTTBp7SID/82GBm1Z?=
 =?us-ascii?Q?KeJUpRaH/uBZ6pc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:58.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cc459c-f904-45c1-3a88-08dd5cfacb7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

With a split hardware and control domain, the control domain may still
want and xenstore access.  Currently this relies on init-dom0less to
seed the grants.  This is problematic since we don't want hardware
domain to be able to map the control domain's resources.  Instead have
the hypervisor see the grant table entry.  The grant is then accessible
as normal.

This is also useful with a xenstore stubdom to setup the xenbus page
much earlier.

This works with C xenstored.  OCaml xenstored does not use grants and
would fail to foreign map the page.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c |  9 +++++++++
 xen/common/grant_table.c      | 10 ++++++++++
 xen/include/xen/grant_table.h |  8 ++++++++
 3 files changed, 27 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 068bf99294..f1d5bbb097 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -21,6 +21,8 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
+static domid_t __initdata xs_domid = DOMID_INVALID;
+
 bool __init is_dom0less_mode(void)
 {
     struct bootmodules *mods = &bootinfo.modules;
@@ -753,6 +755,10 @@ static int __init alloc_xenstore_page(struct domain *d)
     interface->connection = XENSTORE_RECONNECT;
     unmap_domain_page(interface);
 
+    if ( xs_domid != DOMID_INVALID )
+        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
+                          gfn_x(gfn), GTF_permit_access);
+
     return 0;
 }
 
@@ -1173,6 +1179,9 @@ void __init create_domUs(void)
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+
+        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
+            xs_domid = d->domain_id;
     }
 }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8c..ba93cdcbca 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4346,6 +4346,16 @@ static void gnttab_usage_print(struct domain *rd)
         printk("no active grant table entries\n");
 }
 
+void gnttab_seed_entry(struct domain *d, int idx, domid_t be_domid,
+                       uint64_t frame, unsigned int flags)
+{
+    struct grant_table *gt = d->grant_table;
+
+    shared_entry_v1(gt, idx).flags = flags;
+    shared_entry_v1(gt, idx).domid = be_domid;
+    shared_entry_v1(gt, idx).frame = frame;
+}
+
 static void cf_check gnttab_usage_print_all(unsigned char key)
 {
     struct domain *d;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb6..63150fa497 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -45,6 +45,10 @@ void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
 
+/* Seed a gnttab entry for Hyperlaunch/dom0less. */
+void gnttab_seed_entry(struct domain *d, int idx, domid_t be_domid,
+                       uint64_t frame, unsigned int flags);
+
 /*
  * Check if domain has active grants and log first 10 of them.
  */
@@ -85,6 +89,10 @@ static inline void grant_table_destroy(struct domain *d) {}
 
 static inline void grant_table_init_vcpu(struct vcpu *v) {}
 
+static inline void gnttab_seed_entry(struct domain *d, int idx,
+                                     domid_t be_domid, uint64_t frame,
+                                     unsigned int flags) {}
+
 static inline void grant_table_warn_active_grants(struct domain *d) {}
 
 static inline int gnttab_release_mappings(struct domain *d) { return 0; }
-- 
2.48.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A32A90DD0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956559.1349955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK2-0002Q4-K2; Wed, 16 Apr 2025 21:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956559.1349955; Wed, 16 Apr 2025 21:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK2-0002OU-Ew; Wed, 16 Apr 2025 21:29:30 +0000
Received: by outflank-mailman (input) for mailman id 956559;
 Wed, 16 Apr 2025 21:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AK0-0001ht-3f
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea5cd68-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:26 +0200 (CEST)
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 16 Apr
 2025 21:29:20 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::f4) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Wed,
 16 Apr 2025 21:29:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Wed, 16 Apr 2025 21:29:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:18 -0500
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
X-Inumbo-ID: dea5cd68-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjMj6+9yduWFLfVPPxkrysQM5lCtK9EAw5Twr+o7Opd21BpfnsPJztP+bDRH7GhzysVPw0I/DVaf8++TPPtydG0tq5A47w4ngHmwVGLq/+pnqGxG4E4RZ8iCFiUCROiuMGzruTgXsOTvJZz+U0Ma8/6YAO6LU7Z920JvuEXPZzovBj5lnlla0jz4HJ2UuL+huYRv6AsbdUpkap4f+a1oc+atPYod0zICYWSuHvkeRcxqSeos4jpM2gFJWW3cEmUg6gWPug12W4NF/qsruJ5o9sf3wCr/AzurjlpPHZ0374NTQ33Mc5i4Pyf0MU3ZY4Y2c3S5fAheAlUCzUC22QQQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiL4AJODaDRCE3AdKeSCgiRT3UDtdESaezafVTvalCU=;
 b=k5ZnV4WrsGYvZmIgixeMqnNJILdLmZBsf6wvQ+ZZAGNIKoEuQy9QOK6KbzsiHCCd6Coukw8DAohQuzv0SxuMKym4/RW/J6nQfkiK31T7gqi5bjAqd6SYMQNGliFVi1uewYiqubRJFsDnJKbMv1dIKDnROMTNIs3Nij3Trl8IlKsvxns9kd+imO7TIaEg5WukjBkkIBbpqTY9sPBt2APqjM2Rohb/ft8rY2teLynt28jeiEs27834d99T5uTWRdaeX672Wjmjx/PXoccqlTWYnnwNXfEdSTFk1EKFb/2R6kBN8oRbYfwqglyCufp6RVsruMag1lxgSPKVjghJZtk3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiL4AJODaDRCE3AdKeSCgiRT3UDtdESaezafVTvalCU=;
 b=wJy9Jtp+XmDeGYZMt3n0cQpvdk1o4QaIOPpKw7uCi9MQRAXM4/nUxWBjepz8kpm4k2KCeFPivebj3TSGciR6F6ATZw9wDT0+B4jtf/D9BUo0AA2zVNbap77ut7R8fmyjhndwrUUVOMrt8V0zTqMWSbvcExhZ8X8DmZZhvcP3ko0=
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
Subject: [PATCH v5 4/7] xen/arm: dom0less seed xenstore grant table entry
Date: Wed, 16 Apr 2025 17:29:08 -0400
Message-ID: <20250416212911.410946-5-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 501d2378-0209-4d90-892d-08dd7d2dbfda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rKAuwave4g7iHqiEIStK3hBZZFjD4A3UP7ASoAgCiJbtGWfK0HNTGDu5hesU?=
 =?us-ascii?Q?0cTPInke/MwYaey0PQmPrU9BAXCkTRq/JzWJAvt+TbyAWrU6+1AQAzI5t0Vv?=
 =?us-ascii?Q?CiQ0JId+hrdFGFbwde43/kA+g1ojw/dg7DAo/uEU0vqhxIb6im/YY2DMFHvs?=
 =?us-ascii?Q?8ZvP8OWAEzNhnKqwjVF1CHlFFR87t3vS5tbacqD3F1dC3Vu0c1swcHc8Qnai?=
 =?us-ascii?Q?CUmcfM4LatFYmjbb+pykXLLeXKBrtGdA5SrK2wvTSBgtNkXGrPIRKYxKrfd9?=
 =?us-ascii?Q?/yDbDwoDIIUFBfk3jhM88BBdQOIn0SbktdpKqcMT1DbmInc8fRlYuBsoVXDX?=
 =?us-ascii?Q?RwnrdgDIGB6/HvIdswHHRZY5cdYiopiEpKiusePCLB810IIRZKbbw+54V7gj?=
 =?us-ascii?Q?pBHJS1FzPvBe4AUF8IBb7Dyh8/RV6c2lyrLCA0Cln7l+LgJNXTdk2Xs2S9L+?=
 =?us-ascii?Q?9Rd9OaRDUcvVmiIVXagqCHVw+9+VC0vTJcsarEsLw167BCmmDu+lziBtapLn?=
 =?us-ascii?Q?seDMgBcvXptInHpVlaaNtdN6pCfIk49GMS47XRRTdCGrsT+bYeaP5Ov6/QA6?=
 =?us-ascii?Q?QuK0TzLqBngdIeMN9z/e6c0v5+cdWuRv+YGHAdBErrBBrJFv77IwkB0MogWH?=
 =?us-ascii?Q?Zp2ECARDv91VgOXJ4dt5qQuBKW1fxrxDcVFx2itbKJOS+JyLhvLQLD6Uiq0A?=
 =?us-ascii?Q?psuY3DosICzvZJQ0WoYinoJyug+hLyLqoxt6lLkrEQ0SNwEWG7tdg9jXy+Bf?=
 =?us-ascii?Q?uksyawOIUdh3wSHW7ny1RTJiAeALTm9EizJHw95+Jfp4PSsX0MKWS4yr3l0k?=
 =?us-ascii?Q?SiA6RBySXNku97ZyPLqHed7+YvDsfIbDel8xoFGp++gsjBD+8mWcFbfuaA7o?=
 =?us-ascii?Q?mQYFgG4Tj6fS4PfwWBqDFPUKph7qd0YrXX34GvfkTwTY2Yt3pVgbXq72MWki?=
 =?us-ascii?Q?NBY3Sd7PXY2EQ3m/EhJ7lCEf7MwheCskb8vksCesrtqq+HEXXvnNUjz1IxyY?=
 =?us-ascii?Q?sXqpD0iZIagHx/BZ5LfS2g2EFyjxDBZTtHgQo8Cemis4zMlTfgQLzMQrcz3r?=
 =?us-ascii?Q?DTm72fYU/eQfRSViIcikFNrEbw9MrBz79DnlfBgK0yxvr0d54oVdCn8Ygxk9?=
 =?us-ascii?Q?ZCZdJW+kUBr1DWKDNjAL2jb0zSLXMTHNyzIjQcEXpfADBCL/MEaTJg8/tL7B?=
 =?us-ascii?Q?X3iQkhTnKgt7EC6gdG4KsFM06whTWDGftmufznaC3qqS/yuB5P/lX4UOv+X7?=
 =?us-ascii?Q?ATGklscBql819VlxsDS/fzdLWBx7siiglM1tWi9D7BWoIQCsUt9ZKBWiJ7Ks?=
 =?us-ascii?Q?AbqaFO8pl3reGSkXtjAaxlUsQRj9/Z802NjjuDK8WEzV90uHkICi1mbxTws7?=
 =?us-ascii?Q?/lFXl71p3JrLJiRKXovDbzs7ogdBCdHHq5jr1dui78OkANFJvLNG2lyyoQOC?=
 =?us-ascii?Q?5XplzaNXZmHxoEa/dn7VPg1FaakfQ1Tw7J1hZnrZI+tIE2zGoqXVcS96jpFA?=
 =?us-ascii?Q?pqKKiXxfQCVmHtZWlk6O6JycBsbC1GRXIbxD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:20.1807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501d2378-0209-4d90-892d-08dd7d2dbfda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642

xenstored maps other domains' xenstore pages.  Currently this relies on
init-dom0less or xl to seed the grants from Dom0.  With split
hardware/control/xenstore domains, this is problematic since we don't
want the hardware domain to be able to map other domains' resources
without their permission.  Instead have the hypervisor seed the grant
table entry for every dom0less domain.  The grant is then accessible as
normal.

C xenstored uses grants, so it can map the xenstore pages from a
non-dom0 xenstore domain.  OCaml xenstored uses foreign mappings, so it
can only run from a privileged domain (dom0).

Add a define to indicate the late alloc xsentore PFN, to better indicate
what is being checked.  Use UINT64_MAX instead of ~0ULL as the HVM_PARAM
field is a uint64_t.  UINT64_MAX is not defined, so add it.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5:
Add R-b: Stefano

v4:
ASSERT gfn against UINT32_MAX and use < to avoid INVALID_GFN on 32bit
builds
Stefano gave R-b, but holding off addition because of changes
Use IS_ENABLED(CONFIG_GRANT_TABLE) instead of wrapper
Add XENSTORE_PFN_LATE_ALLOC
Add UINT64_MAX

v3:
Expand commit message about C vs. OCaml xenstored.
Remove __init and flags from gnttab_seed_entry()
Change frame to uint32_t
ASSERT gfn fits in a uint32_t
Rebase on mem paging changes

v2:
Tweak commit message
Mark gnttab_seed_entry() __init and put inside CONFIG_DOM0LESS_BOOT
Add ASSERT(!d->creation_finished) and ASSERT(gt->gt_version == 1);
const struct domain & struct grant_table
---
 xen/arch/arm/dom0less-build.c | 10 +++++++++-
 xen/common/grant_table.c      | 14 ++++++++++++++
 xen/include/xen/grant_table.h |  4 ++++
 xen/include/xen/types.h       |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bb8cc3be43..188ef40b52 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,6 +20,8 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
+#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
+
 static domid_t __initdata xs_domid = DOMID_INVALID;
 static bool __initdata need_xenstore;
 
@@ -756,7 +758,7 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
 
     if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
                                  == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
-        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
     else if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
     {
         rc = alloc_xenstore_page(d);
@@ -788,6 +790,12 @@ static void __init initialize_domU_xenstore(void)
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+
+        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
+        {
+            ASSERT(gfn < UINT32_MAX);
+            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+        }
     }
 }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8c..e75ff98aff 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4346,6 +4346,20 @@ static void gnttab_usage_print(struct domain *rd)
         printk("no active grant table entries\n");
 }
 
+#ifdef CONFIG_DOM0LESS_BOOT
+void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
+                              domid_t be_domid, uint32_t frame)
+{
+    const struct grant_table *gt = d->grant_table;
+
+    ASSERT(!d->creation_finished);
+    ASSERT(gt->gt_version == 1);
+    shared_entry_v1(gt, idx).flags = GTF_permit_access;
+    shared_entry_v1(gt, idx).domid = be_domid;
+    shared_entry_v1(gt, idx).frame = frame;
+}
+#endif
+
 static void cf_check gnttab_usage_print_all(unsigned char key)
 {
     struct domain *d;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb6..297d7669e9 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -33,6 +33,10 @@
 
 struct grant_table;
 
+/* Seed a gnttab entry for Hyperlaunch/dom0less. */
+void gnttab_seed_entry(const struct domain *d, unsigned int idx,
+                       domid_t be_domid, uint32_t frame);
+
 #ifdef CONFIG_GRANT_TABLE
 
 extern unsigned int opt_gnttab_max_version;
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index e8d419b954..73ddccbbd5 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -44,6 +44,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
 #define UINT8_MAX       (255)
 #define UINT16_MAX      (65535)
 #define UINT32_MAX      (4294967295U)
+#define UINT64_MAX      (18446744073709551615ULL)
 
 #define INT_MAX         ((int)(~0U>>1))
 #define INT_MIN         (-INT_MAX - 1)
-- 
2.49.0



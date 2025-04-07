Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC356A7ED99
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941050.1340657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL9-0000fj-G6; Mon, 07 Apr 2025 19:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941050.1340657; Mon, 07 Apr 2025 19:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL9-0000d1-An; Mon, 07 Apr 2025 19:41:03 +0000
Received: by outflank-mailman (input) for mailman id 941050;
 Mon, 07 Apr 2025 19:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL7-0007y6-9Z
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:41:01 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2408::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b390045-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:41:00 +0200 (CEST)
Received: from SJ0PR03CA0147.namprd03.prod.outlook.com (2603:10b6:a03:33c::32)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 19:40:55 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::da) by SJ0PR03CA0147.outlook.office365.com
 (2603:10b6:a03:33c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.32 via Frontend Transport; Mon,
 7 Apr 2025 19:40:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:54 -0500
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
X-Inumbo-ID: 3b390045-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi3Z4/yV4G3RwHClcFIt5sqQiPIT4GrrxZ4rLcWjNVR3zUAfC4ca7he8hKkz4jpx0UMbyuUqTnQUcGLOClauVz4foeRmnBj8NWtxmspqIPYDqj8BhTODLAGvhFRJt65ErkmaCVpoYmFaWZgML/kEqtadMglRB0rNJ8CcKneW16QCukhuPn8HoMnIlRT/d0Z5xAMIa1uAfLLHAjXiBTUKyJcNwke1H1nhq9hDLopKE3DiUUBDD3y88orLDBZJ/MekSAzt2dM7Lw7VylFF5mlHLem3J0Os4On5gJmqW3gB0oahe1TICwpVKfm/dYfyIeMtaFctd0yzOY+RDUBZEE2UDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dburjj6Z0N+LRlXCAmlxzKLMTtkldtP4IFgNueyQtmk=;
 b=rmiJyjJSlbMxJiPIE+lZQzYlrZU4z5/MGTIFFD1GrN0MJxnB3tKB+TNbIOUMna3Gc3MOQelt0Q4/Hl032ER1ZUduwFihVFA7Dt/eaJubFdPgzxgDFaa34rv+2VFtFjwKqRFMlkgNOufiWdkRnwhw+DRinkZ9774ltgcm469/EOQqIWZojc2numC/QXoWl+3JxC4Hd6oxqV6B54GF0in4RqdoVlvTt+qS0pZJSj/yV052mbNd2WuDAdrLtQ+6QgRNjx4yHQurrbsJ8HuEMUtI+/Fr8DDVLDcKQZyPS3L63Q6jxXtfLcmB1YjKRwkTd+1AHg5yKryvLzKVoJJmaXPYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dburjj6Z0N+LRlXCAmlxzKLMTtkldtP4IFgNueyQtmk=;
 b=0Q/Cp63m8tjussYSyT19bwjQ8NEXW37YU37OGMJWCyEAPUOumeZxN9PKnybXOuZaMGfXnge7CD6pA1HjCzuz2IaqlbehmqG6x7Pw86RtXz4+LnEyMrQWlyk51xzAg7HfveN/wr1gOcoSBv3+QWcaayoX8+HDHNwrL+n5UBnL2uU=
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
Subject: [PATCH v4 4/7] xen/arm: dom0less seed xenstore grant table entry
Date: Mon, 7 Apr 2025 15:40:35 -0400
Message-ID: <20250407194038.83860-5-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|BY5PR12MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: afc0b648-2e50-45fc-c55d-08dd760c1cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7hqgJwlnQP+sXRcxLQYZNnAKwkox7BDPPLGOT2m24ZL8AvVwLxT1Gsr0qZ+I?=
 =?us-ascii?Q?fIanj0YUpBpkRi6CTKy1XZyu2oscqOwc8MVaXNfT2cvR4dwV5N2I3tUbVc3A?=
 =?us-ascii?Q?VjrFMAfPSwFg1WzzORddtN3xtHgC8Poiz+a12T7wWps+bUiDm56csLL0YLNL?=
 =?us-ascii?Q?3eEAljH2wBIxua5G/uY628HOlPtX2reAV1y2s08BFxoJoLbM8I2zQiJIA9Lu?=
 =?us-ascii?Q?52+M7oIjmhQdGc/f2g+WfqsxXOMgttaEDg6z8YFp/emN2jXpbbXot/EJYPEh?=
 =?us-ascii?Q?iakn28Lq/oDQ1v25fk0RzjROi2fVljclxMwjsUkzBZAaFV9zJXtoCpzIsnHD?=
 =?us-ascii?Q?BnZzVFum0n662a3nREsBjJeAxhIxkwTffXOz0LJCrLETfiuC32pJATWlpa8O?=
 =?us-ascii?Q?RLuENKtgMZ7r8H/iNYgOCuNeUFHKwTAkdEV2T6LumV6KABbvM/3ipzg/YxUc?=
 =?us-ascii?Q?ogpY77g83R1Wfp7d4IoEcix0wQEZPP+Pv88sYq8lWckD+SP2CDkGCWrfdt8l?=
 =?us-ascii?Q?VnG1OVItI3kUQ5RH6Zrazy7ZLQDn2N5gPlKtWxUcyyFUAs2SyEV4rwCvkJxg?=
 =?us-ascii?Q?0D5VptfDkQWEM2ZU7MaUhI8dTwwINFkzSgBGwjyHZkcsljGBwIATa+X6OBiR?=
 =?us-ascii?Q?PgmHABAA8eO6QG+WRfwb4KwXhOyMY1a4b0NoOBz9GlC19qVnNYGO6tUAVTeC?=
 =?us-ascii?Q?BWe36SWHescXTfXChoSdkzwnloCNkoKh4HfTs7iSl87WVawp81xfcUsyZNgs?=
 =?us-ascii?Q?NJIpDcVMRhfU3vH9T8aTAuGnv7ns8Jn3MJ/EuEkY+z8f7VtzDBSUpFfk9nZ+?=
 =?us-ascii?Q?VNymTh+wqavNuX8/A0scKRVh2zIov8iOvrvPAaNuDhTckwlLCXvFozn6GRi0?=
 =?us-ascii?Q?I67t/GLhvYYRExm0CBYdl5nsJGCkgeYcGzxbIXC5NuCcLlaLRPpaBxh6ETi9?=
 =?us-ascii?Q?4f+lPzAbVo2tDn902LUANop1LCBHts9CorJMvCG6kCMZllIt6DddMjNxZ3rq?=
 =?us-ascii?Q?rVJg/pRFjDI0Ti2M7Qv3hFmNM4ZenKnr10lxnhcvs9GbhQdQORoWFoGDHGKx?=
 =?us-ascii?Q?Rb0M5Xb4EV8BpwSgy/tUcSBvcm8uIBw49toAn4tUHsFSr/bVYcVEeBOgXfFt?=
 =?us-ascii?Q?uBRkY77JuVlGzaDFBzveN7nepc/NY94L661txnYky5fXw3EvV7etixo2xYWH?=
 =?us-ascii?Q?qWZaCL+uploG5d0ei8iYRuK2oW2hiAWmHhPO8kEnYm2FjOv9h7+dhuhNd8Xt?=
 =?us-ascii?Q?hLuLULpkIjJd7wAcMFuZ0odCBDLB9H1LFDLjvwFJjzbwPcPXtqOUgijN5I7c?=
 =?us-ascii?Q?eeOuFcz0SXAk5KncBKp5YjdgBJf17G67T0qJWGQ62eHM29j7xjWvDMx/Vjp9?=
 =?us-ascii?Q?prK2wv4p9rE9RSwnF/icUhwWFMCSun0o0tD0U1vU1tl6EuRv+F6cLDrODqzc?=
 =?us-ascii?Q?Ph3cy+7L+DmVyD4UBYakskusNPWiT8b1KbTtf6vp88V6LVZcKuGuzu1GGw9U?=
 =?us-ascii?Q?5tmif1HZD+vL3bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:55.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc0b648-2e50-45fc-c55d-08dd760c1cf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178

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
---
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



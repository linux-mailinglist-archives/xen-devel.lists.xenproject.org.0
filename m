Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E2A7B19E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937344.1338387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOH-0001P1-W0; Thu, 03 Apr 2025 21:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937344.1338387; Thu, 03 Apr 2025 21:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOH-0001JN-Oe; Thu, 03 Apr 2025 21:46:25 +0000
Received: by outflank-mailman (input) for mailman id 937344;
 Thu, 03 Apr 2025 21:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOF-0000LK-TR
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147d7775-10d5-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:46:23 +0200 (CEST)
Received: from DM5PR07CA0083.namprd07.prod.outlook.com (2603:10b6:4:ad::48) by
 MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 21:46:17 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::9a) by DM5PR07CA0083.outlook.office365.com
 (2603:10b6:4:ad::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 21:46:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:15 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:14 -0500
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
X-Inumbo-ID: 147d7775-10d5-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi3TKmb2ZVV0gFmmBE++K8J38yYMqI/4A1nNKq/CtknxNOjWVzvyuCDKE21mj3qpqOmqoh8zfK7S+XKmCuXkHkjZo5BtZOdam51cnJjl/OdjS9/SMmViKF9MHOCor5u8xsJSUWu3vqGI+QfL4/ELTD0L25Lf0jA22aRa2i1ahaP/40DlCr8xkllRZ4C6zelSvuOeRMlXl8xZXM2xoKTUXlB/FsHCL35Z0jlsapoNSW6mIrZF6o0cSpr9jR9QzbU/guPI8nros7lGhIRnND5nlcXOHx9GeZX+FxiLPtKLpUF3+pnaKIdwkAEVmlra+UEWOSuRSSSF6BzjXtPMVAbJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDZ6ycYxk9xxKPtvyYcRGvn928vyhygmCRK5DaBoq88=;
 b=D19CGhBMBslc4yAWUZrFnxa2rzFAROdj3mULwjdvSNR5YgmMMEN93rGOLVzG6Iavm6tesrExZgeOAUJ1mHW+4Pn9qrbMv3q3pml0Nw5DD0pEYTiyJIrDKggrUNM5TWxsU2OTD34TKliXkyawMJbcX1UZIj/BCCewZ16h4tMIHC7ew/2NTAYpznb7np/XLQuDKfpeejGaxiUH21EwlMhHoSDRXLsba7YDLvf8tPqswX1xwaJEbQgUCLg6S31Md6iyALVTWY7q3bh1IKZJ73T6nQsXBs9Vcj00dcYjMO6bRM3K1nrCdzelQfWG8+ezUivmWN8ex+MT4epKUmwBOZQSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDZ6ycYxk9xxKPtvyYcRGvn928vyhygmCRK5DaBoq88=;
 b=TIS/TqpXqQiarBZ9GnCYzPUMmytz0FW5r8e9uN6aRuI8toZY3Wp7sXpmtSs39PznYemS2Wj+LQc/sj1213W0JPVEmG1q/CZr0wNK3QUCFKmNLdFW0OEQfr5ClbyiQH1V7HnZvugcScOpyASsw9LmyIT2BDUBn7eEn/G5wQwWnCg=
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
Subject: [PATCH v3 4/7] xen/arm: dom0less seed xenstore grant table entry
Date: Thu, 3 Apr 2025 17:46:05 -0400
Message-ID: <20250403214608.152954-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f45ce8e-6443-4fbb-6f18-08dd72f8f67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+QVFhIc8y6KHLo9MkDExt5onxisWyr5FiSgy9P1rB7fmD6lHNeFMNjKKVnxc?=
 =?us-ascii?Q?eUY0OhmG/slu3Niz1stgCmufBmUALHDli8vT6W/JH4nUguhwoLPvTn3Z0inX?=
 =?us-ascii?Q?RJtLLVqjAAUDX1DDTFFnGlo9IlFPvFkTW9mzhyD08Z2QtufjdE8SdTyKxIzs?=
 =?us-ascii?Q?369Le7lBTtSY39iJX+2XOkU8eQcs3VhA+P+Xv+ycw/p6tPcS2B3eLkCwEo+b?=
 =?us-ascii?Q?+47u6Xil3PQCG4S7sKQXLcDyTkIyOjk3dk3uExiYvkkikXiRRoSzFwczuQNE?=
 =?us-ascii?Q?kaeIXiy5Kn5FscTz+wYl6BvNpmLsdbSP9//A+ny5LktxeiP83J1tc2nMSxD4?=
 =?us-ascii?Q?A9FXvEikleu5Kr60BG13btgUXDahwMG0ZihvvQaHuKz6DxXlhKwTEA9w5V+Z?=
 =?us-ascii?Q?cmwePP0lcHtp7uBuqLNVwUEldZCP/o5TTAAw/lGNp2CxXvaKEP8y7smBwLHv?=
 =?us-ascii?Q?topAs9W8WE2qu5V1eienBIrVQJWeduHdsYYIThRBPAqecDvUh4ER76OVwFeY?=
 =?us-ascii?Q?pKZY9Y85831ZLtPPEnuKozVGB5bFKQzPqVdINaBRWzsRDiCXMlrQU4lGvbKx?=
 =?us-ascii?Q?pu/40Snfx6K1FlwQx0DAdaom06dQyj6u0hoiZvVROMzDV/Ne98IDHasZXDjl?=
 =?us-ascii?Q?xGHBos40TOgaGU3XtEEXgVQsorXYvuqBJqknldxbRVMTS1jAqnHtXYy4fsVW?=
 =?us-ascii?Q?/zL77lJ3Lu4CCimY8f0IVDC6dSDfAPjiWCWgmAThFuGahegLyPYAgU4YrSvb?=
 =?us-ascii?Q?c93O8i8NlTb5zFE2MliCdAuNOxbLxlVBlqU/0EMHm/xQjXKKu2BpKYvAdA5P?=
 =?us-ascii?Q?d2lbgn4fDX/i1RG0NZfbnHwNSLSOOvDt7uHeMDSkpzVau8GrdHJzAt4hKQ30?=
 =?us-ascii?Q?+KFNRaSu/dFQ6mENeryojYbigi0eehjXlCyyz6S9YmudRdTTXaiWeiqnytG3?=
 =?us-ascii?Q?hdAfj1QI1LDJjAIE11D4tyyt6XY0mcD5UXHYa2Kk+/4/qs5nbLN4ZDHQkpB/?=
 =?us-ascii?Q?Z1XNgn008hD4x6qR9ES3rcXU7iZ+0qO7hYMb4romjaqFabwVr5sGLiX2y6MG?=
 =?us-ascii?Q?mT2dLiFnIWyvyr5dcy1N1hSfZkuqd5h+2HSyd6xOX+QH2YQxJAKWUncSjTkI?=
 =?us-ascii?Q?q0pIoKf7nj6JJcbIcvVHZnqC2bwJYunNkYxTKCvPlNL02KC9zYESxV6Upqoq?=
 =?us-ascii?Q?lMsijYZxe29FgTATbI0e0z3EdR41e74QoHDHktSpq0/Mr9ca1zlfJU+TMQJC?=
 =?us-ascii?Q?GWEePRv/Auwz7ZBNi1/QfZr90R6z85Wp2ZqVmOOKLoFv/8V3s6hL+85GPxkY?=
 =?us-ascii?Q?WkE69ZEa+SQIits4uqJKxy4wmLU53Cj/4L1WIBeEfepIDCJh5fYCUdcu+irM?=
 =?us-ascii?Q?r/xPBuQhQBOZLglMqa96mt6J0OcX2LXuZKxAFaOBa9YG8d+U8oayqylN3pTr?=
 =?us-ascii?Q?GJjwNeANLRmRJKu8O22MgM9kGmTOu+1TdWZ/npeDGcwa2OaJ2VoTbokgYo+S?=
 =?us-ascii?Q?Omk3GaHwbEnJzI4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:16.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f45ce8e-6443-4fbb-6f18-08dd72f8f67d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317

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

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
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
 xen/arch/arm/dom0less-build.c |  6 ++++++
 xen/common/grant_table.c      | 14 ++++++++++++++
 xen/include/xen/grant_table.h |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bb8cc3be43..284190d54f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -788,6 +788,12 @@ static void __init initialize_domU_xenstore(void)
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+
+        if ( gfn != ~0ULL )
+        {
+            ASSERT(gfn <= UINT_MAX);
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
index 50edfecfb6..936a52ff10 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -45,6 +45,10 @@ void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
 
+/* Seed a gnttab entry for Hyperlaunch/dom0less. */
+void gnttab_seed_entry(const struct domain *d, unsigned int idx,
+                       domid_t be_domid, uint32_t frame);
+
 /*
  * Check if domain has active grants and log first 10 of them.
  */
@@ -85,6 +89,9 @@ static inline void grant_table_destroy(struct domain *d) {}
 
 static inline void grant_table_init_vcpu(struct vcpu *v) {}
 
+static inline void gnttab_seed_entry(struct domain *d, int idx,
+                                     domid_t be_domid, uint32_t frame) {}
+
 static inline void grant_table_warn_active_grants(struct domain *d) {}
 
 static inline int gnttab_release_mappings(struct domain *d) { return 0; }
-- 
2.49.0



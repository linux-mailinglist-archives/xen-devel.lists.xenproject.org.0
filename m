Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B49A7703E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933001.1335079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv2-0005Zm-Js; Mon, 31 Mar 2025 21:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933001.1335079; Mon, 31 Mar 2025 21:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv2-0005Xl-Dz; Mon, 31 Mar 2025 21:43:44 +0000
Received: by outflank-mailman (input) for mailman id 933001;
 Mon, 31 Mar 2025 21:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMv0-0004Vr-6T
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:240a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34dfc078-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:43:40 +0200 (CEST)
Received: from MW4PR04CA0207.namprd04.prod.outlook.com (2603:10b6:303:86::32)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 21:43:35 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::6f) by MW4PR04CA0207.outlook.office365.com
 (2603:10b6:303:86::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.50 via Frontend Transport; Mon,
 31 Mar 2025 21:43:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:33 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:32 -0500
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
X-Inumbo-ID: 34dfc078-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3gESWeJBZkRXprX9wo8pdSKhjAorlN1HNXGboptiCeNihwvX9bkJA4DDPVeJK7X76eUfAmjgyLlpXtA2ZuKVZ2juLgJG1FJHp1wZmSIAB+3tAocSrazG9w13a+9oH8Gppnduvs6ebOif3ebxCUsSPdG1g3qv4NVN/M3o7wlEdhxLG6usoVCA9EUv91MB+QliwUXcyg/qyjEZr1hFkY0rRk06OjHF6yn6iltKXosaTQNVf4g9F2c/GT9gjBS2bTQ3UEY/8bQx8CHtSOO0VRrdcylF9SgWKM9g6GHquTz3a3OZrtYZn+VUSCPgwi9J7uneQ2PCtr7ZvmP/AohZJWVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQhJHw7567ypHQ6EQlLWOtnRHhS4n0cVpMQbZjCkjSA=;
 b=aB7p/9nf/XnIkVxVO63kWJJ8bZ4UdIt8/0AkHFyIgaUvFrqjP6Ok29j9D8E33ZTVTqR6QnbGPnGeVlXlCXwiG8McyEpET+gUSoyNmBrDXuS7Ulg5Mye0PD8HDW8Pq8uIoRnDABRjeSdmoeMWnEXp9Sp4bm3lDC1ApNay6jnz1QEmgjRmXkbh0KrSgXjNz5R5MQ6EnWV+qUI4Pummjvvw19Xo0+U+z25GvwCWgk7cY+EfX23/xV9kxSPUIzExTn61hkZUYcu2gGHe74Z2rtlP0sljOcXcCa2MqvgBlMYxhqaL10Cl78SiMaoNFrw7owkuRfCVFCGdesqlFpn3C2eLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQhJHw7567ypHQ6EQlLWOtnRHhS4n0cVpMQbZjCkjSA=;
 b=oj48K7/ieUMjXESgau6tFU3fl3X9ZIC95uEF3TFZsxKf9taJw4tI47Zm1HxY7+PlQCOLa74OKxJ4J+Xf6a5mWqDeq3YR1iktfW1SbJsrpiR5DUTDYSDsGwu3LFR3RT9JAWOujPMioIR8e9VFa42R9o3PXzsQMjnsj5Pb5scXzkA=
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
Subject: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table entry
Date: Mon, 31 Mar 2025 17:43:19 -0400
Message-ID: <20250331214321.205331-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc3ddeb-cc61-4cb9-3ae1-08dd709d1670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j3BLBTyuwp6uFeTJhOIc7dONKeSM5EQ562Nc9zDnPcK1fZwugBWCYLUfG9HA?=
 =?us-ascii?Q?YonQ4B7+VQIa7KujkGV8d7XCgwb397dVcd2lphMDW4FVXdJhFy0FhUHM0XNe?=
 =?us-ascii?Q?9HZYbmXycBhm9vhibIDxmRfDdErmJGHpUm6ieOOoZbHQT7ewGqsoATsxbVMp?=
 =?us-ascii?Q?WXw5tEnR6NEefNpbysNCNVHVk3Z+ZS7l8TT+4Pt5iQIL0ZQ2QkSoAwCntPxQ?=
 =?us-ascii?Q?O5V5YumHPbQXFj7iJ/72fipXdCflMd5W3apt3RkzVxdfO1YK4oCT3BYvsda/?=
 =?us-ascii?Q?YGNWVJSPPmXhzCL8ur6EFJ8a3Yy9eMrA/v9E1eC2u8Z0iGN1uwrkGmmWdQ2G?=
 =?us-ascii?Q?T1XVZ1T9Y0Kqsxj3CJDS7dvNXmIGZ0orjVkdW2PnKNalM5x93fUI/+3cXsCA?=
 =?us-ascii?Q?9ICiW7hjsXLxBMPDmIzcbeXLwA7Jlo6QsP4W9z6iT08G/bewyJUypMoaUbeu?=
 =?us-ascii?Q?Zi4fI0R80vgeSni164sgqZrYoqQuk3n2uFN3wjSi9TvIHapGV0Nbpzw7Xqzm?=
 =?us-ascii?Q?+q3wnhA78mCKRraSo3GZyDZlG3MQXYqoz+2KXyOvT2SVsi3gbEEXAqF/yQ8N?=
 =?us-ascii?Q?wEM4mQtMG0dqP/1ztZEdL6MbR7UQI6QqDaqyL0ZC/6DdgowO3ov+VbtVgJg6?=
 =?us-ascii?Q?VGNmP2wFljTLDOt3tNuBRkWBXIGbPNuOOmgRUo9KnUREerVceKGxd8AFqMCF?=
 =?us-ascii?Q?0u/57jaWZR10Gona4MY3DuP857IEHXQUqfx+R6XfUE1yLT0Frs79Ho6sAk1J?=
 =?us-ascii?Q?50OkXdcfGsemCeaLu7sN7mXwfFFU+IH4IObQaamUrT7ak86TuF/6ipNNuhu3?=
 =?us-ascii?Q?c0O2S2n/riw232ViYIs4OlV7CmS/DM19RvS4Q5SdQq5GotvDOJE88G9yJKDb?=
 =?us-ascii?Q?j4e7DjmP7ygEzJL59Eu2CPnb4LqKQpFolpqfPXBAH7Te89iApYTf6smLo9Cl?=
 =?us-ascii?Q?hloWIc9vW8MfAob3UychjzGnptmNsTVgr2brmmBFMFz1eVT3Vd4zeVCt4Hw+?=
 =?us-ascii?Q?biEP+QYgy92fm+nIWk8jL01y2/M841dco/y2w8uGHPodVFPc+73nZqWHt9Bu?=
 =?us-ascii?Q?ZuFqHAVFHjlbhhQL/n4JzEQfzboSm3Cx6FREgTYLJMS0UMIM+M0WH7h6qui7?=
 =?us-ascii?Q?3c9JkH/2WOGmy8Rhm3bEOlMgRjB2Dae8bbc6SEeEixmB0Q8eEI+D0JXlu3OT?=
 =?us-ascii?Q?8Gxh5kqbdmMZFqJAOYt3mwAakGnSQFMs1dluLVFGzVMyjwycRRNqhUPyUETt?=
 =?us-ascii?Q?+Iiu5GgWI9cYERUjNL3gGFyHxNXlxvv3SyN/A8aqey5jIGZq1jxCVKrnDhAJ?=
 =?us-ascii?Q?RlHTtOOhq7bjG6tqY1B3kjd6LpcrQZLxyM+rb2Cz9343tlJUqp7oYBa6ZDU+?=
 =?us-ascii?Q?P/F+v1IKWeMp7ei1pmJb/e6S03vwzRcc1suyHvjvOGDgFxqqcpBwMlgai/wf?=
 =?us-ascii?Q?YQDo3ipS6eKT+D4uV1KUcpkVx2KIjEGshHYgxeanA2yewu1sLuHOtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:34.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc3ddeb-cc61-4cb9-3ae1-08dd709d1670
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645

xenstored maps other domains' xenstore pages.  Currently this relies on
init-dom0less or xl to seed the grants from Dom0.  With split
hardware/control/xenstore domains, this is problematic since we don't
want the hardware domain to be able to map other domains' resources
without their permission.  Instead have the hypervisor seed the grant
table entry for every dom0less domain.  The grant is then accessible as
normal.

This works with C xenstored.  OCaml xenstored does not use grants and
would fail to foreign map the page.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Tweak commit message
Mark gnttab_seed_entry() __init and put inside CONFIG_DOM0LESS_BOOT
Add ASSERT(!d->creation_finished) and ASSERT(gt->gt_version == 1);
const struct domain & struct grant_table
---
 xen/arch/arm/dom0less-build.c |  4 ++++
 xen/common/grant_table.c      | 15 +++++++++++++++
 xen/include/xen/grant_table.h |  9 +++++++++
 3 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a46f292c1f..fc515c9852 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+
+        if ( gfn != ~0ULL )
+            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
+                              gfn, GTF_permit_access);
     }
 }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8c..2fb3679447 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4346,6 +4346,21 @@ static void gnttab_usage_print(struct domain *rd)
         printk("no active grant table entries\n");
 }
 
+#ifdef CONFIG_DOM0LESS_BOOT
+void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
+                              domid_t be_domid, uint64_t frame,
+                              unsigned int flags)
+{
+    const struct grant_table *gt = d->grant_table;
+
+    ASSERT(!d->creation_finished);
+    ASSERT(gt->gt_version == 1);
+    shared_entry_v1(gt, idx).flags = flags;
+    shared_entry_v1(gt, idx).domid = be_domid;
+    shared_entry_v1(gt, idx).frame = frame;
+}
+#endif
+
 static void cf_check gnttab_usage_print_all(unsigned char key)
 {
     struct domain *d;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb6..a17f1787da 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -45,6 +45,11 @@ void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
 
+/* Seed a gnttab entry for Hyperlaunch/dom0less. */
+void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
+                              domid_t be_domid, uint64_t frame,
+                              unsigned int flags);
+
 /*
  * Check if domain has active grants and log first 10 of them.
  */
@@ -85,6 +90,10 @@ static inline void grant_table_destroy(struct domain *d) {}
 
 static inline void grant_table_init_vcpu(struct vcpu *v) {}
 
+static inline void gnttab_seed_entry(struct domain *d, int idx,
+                                     domid_t be_domid, uint64_t frame,
+                                     unsigned int flags) {}
+
 static inline void grant_table_warn_active_grants(struct domain *d) {}
 
 static inline int gnttab_release_mappings(struct domain *d) { return 0; }
-- 
2.49.0



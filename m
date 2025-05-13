Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C668AAB5D77
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 21:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983526.1369815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvif-0004LD-QR; Tue, 13 May 2025 19:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983526.1369815; Tue, 13 May 2025 19:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvif-0004I3-MY; Tue, 13 May 2025 19:55:17 +0000
Received: by outflank-mailman (input) for mailman id 983526;
 Tue, 13 May 2025 19:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEvid-0004HX-Mu
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 19:55:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2414::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c19ab16-3034-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 21:55:09 +0200 (CEST)
Received: from PH8PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:2cd::15)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 19:55:03 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::92) by PH8PR07CA0018.outlook.office365.com
 (2603:10b6:510:2cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Tue,
 13 May 2025 19:55:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 19:55:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 14:55:02 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 14:55:01 -0500
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
X-Inumbo-ID: 2c19ab16-3034-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFEeT8afkKAomjAYG3V3V2NvrxHCroYvJeYj3AslNkRF+BGD00xXloMLi+e3jFmrYBtGt071AfnovKYDw9PJnAvJh5ngdmOBZLf2lqy5PCRWSePxfdNmf8Xgfixmgny0bQbC6wF2KYFShAKI1UtAt8eraWgG6DEo2JOa48hlLbf7tbKwpLBn0H5XOzJk5M+FoImtPKsBvSuES3GkqOr9oxQAJ1YSN8ptFSbgiYQkGimGAdcOgE71VQA6L97miNOLqZmiom21IRKJT1ro4i20hYEr/C70xqefCNADu5W7GzuU6WwkeHPx3VR50+0pqFAQbeDBiNFIY2TF1a/QoiYUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0ewlAJEI0hIyeEIlh2itiScntWQay2krF1ORaplPvc=;
 b=qBao+hnhPQvZ9Hu/0egHwpr8EOxNqck8zvPV4OjmNof/rNov+dA2QjViqJls3r3HGdQqGl55fu+ueFvxl/OXkpkXWDeu8LQoeAiRTLzVH7bWv354ZF+e0x3EOPfd9b/SbgzYsFnND9F9s4+Wi1zDZ4pZXUsJ8AEFOA6PkPEnBBSbGM39z3M1lK4DtdCwaBgb+pJmFUz7P6UlgbnMYz87nIMichJGaxCyQQDEw4fXSwSWIRrmd/1TvmD5YRVLJ2bWHTalhulJ+yfE2LMqlYjFoJZfS/nX0is8C1zMHUi+66KNFTVLfk7UMw0pzvwtTreQp1rdT5nvbSMPGRLIdwzIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0ewlAJEI0hIyeEIlh2itiScntWQay2krF1ORaplPvc=;
 b=rMWJZlJn9jaz9pP8daOjIMowjOFpSwpKVQMBOst+zbyxL4nVzqqfSu44U6TjAjtbWiCs/qHsJB4hiVjs3PU5MjKplkQltnDngmSu/l+a2ZJAhamhP9/2DjJm4m+706u8S5pUUQPo6fAbztWrXNGaBSO06wwf/ZdkjJw91LzElTw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU extended regions
Date: Tue, 13 May 2025 15:54:49 -0400
Message-ID: <20250513195452.699600-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513195452.699600-1-stewart.hildebrand@amd.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dabeee6-a1e5-4df3-bf97-08dd92580d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FERx/En4WeVbzooEZngMr7JIbqU2Fe3kOTcItSiCCyr4JvfGnSbdCbsA8nNV?=
 =?us-ascii?Q?AgrAm5fGZ1rkZgXrE+BSrhjWgwjoNifxtQ6DGy6oHzNonOnPORU1Xoya1VfS?=
 =?us-ascii?Q?tbIjJyA5uHiFdzleAmNg6WrmBq14kiNb+qMzWBTKgtcRlkFfSQZVbkaNYUJO?=
 =?us-ascii?Q?u4XjW8UBuVAlqosna/LJAPS5zkMxLIoojRfohHvJuI9TXXFq2dsBGwyqlqIr?=
 =?us-ascii?Q?NMEmUXgCjBTt+VYXDcVl6SU3qsNUT3qQucmeGjGTS0wTptIkdpNN8PG4B7I3?=
 =?us-ascii?Q?d57CD80EUJzxeALUWtBjARfn28/fb4tmEUtv+xm2h+DL71b8FQsjdO4P46Zy?=
 =?us-ascii?Q?hLtXB1KyS72c4PBOXFsBjpVuDBlos4ZgyUzDwGqu6++KnSCgWbng0vVfVxCn?=
 =?us-ascii?Q?sbD86ZkZaA/IrqwHD/Yzbw4MSMyWshVSpcQk8/wrffFQBAFDkdyUOL+L/IFL?=
 =?us-ascii?Q?Lw3n9hrzLoL2LwJc49HB35Q3TNiCm1aeGoeB+ize2cmqRGSTUrvONuhIlAvk?=
 =?us-ascii?Q?v91dSft0j4u1vKaywH55yvwiavCllpREk76Y00ivoLjXRD1WiNwNKdmK/tS8?=
 =?us-ascii?Q?m63Dj6TGlhDCPACN/ActWCZN6CiHqhyiJXS+0asiRjAt8yWPNynWbBR3SCKv?=
 =?us-ascii?Q?YsNlXRl+p/RTLoHTUtVJAJ/oa30Nkpixq5PAWGNxI8Jw/y7aFxS02C4xDN9x?=
 =?us-ascii?Q?7nMqsXosx6q3U+vUfh9nmu0N8KIZnIK6R+vJGtCm7V5LikUztvbddKLhsiyR?=
 =?us-ascii?Q?/5MQCOkoyTTTcBJQ/uRQRVyisHMA5/jD6Gm22Rv5jwBJUVfx0PHfUVANex0P?=
 =?us-ascii?Q?h/2W3bn4Lx2OvdX5dnzsgBmdcP3XSx3VQ/TiT5W49FZ9a3CrIDqpH7fXwyH3?=
 =?us-ascii?Q?QxOJRnEexqQZGgVLeWv1Z2N2o9UK/OQavkTx0dy6CrGdk9SSeVbIuvGPsVyg?=
 =?us-ascii?Q?573mDfWd3WYpSJ6maKR/Ygh8NFLakX1Ek0z+OaGT5ngATS7sDTW4kDAAFvMV?=
 =?us-ascii?Q?ADeFVXphJqSNwUlJw44xPxK8q1PxAnXAwm5v9Xc5iZLsLszXry3lAzxFUoxn?=
 =?us-ascii?Q?85KaknH1E2xmBX2FWTCReqBfvqnSlN4mb4ZK4xrf3o7YCwNXMBgrrxcxbBPs?=
 =?us-ascii?Q?MXRqbvFJWXJe8KrHZDY9YYP5wstOdOaIYG15pTmq8m8i4L6votBAnW2emMWx?=
 =?us-ascii?Q?MnKyS02IQDikkDob+hfwlGGXoykPk/yBjEqlRgHIydgs+T3Drkj5p73zFjmM?=
 =?us-ascii?Q?DaJ3oYgLc/MDR0YV5lOhzzl+34IdPXRqDFzC/9eQ3/b0CmqpTKCTEFoaw8U7?=
 =?us-ascii?Q?XfsFoB+CM7CHW/L7D58r3AmPv9/CXbV4qD7Z8AfbJ04RvAhso2cINN/lAouE?=
 =?us-ascii?Q?c1b2kZao5ohgM1PdiCAKPfJIhhWoEoJPVZ0my/1TMose2t1O6qvgYuLFA1/d?=
 =?us-ascii?Q?EMj64s4ye3rCNKnaVINV/7EDJ6XiZmygqql57iAxgsLWSIiVtIo+w/t7v7tn?=
 =?us-ascii?Q?Hkn6uS6WqXe6tLOkQ2/3R8dw+hWS/0+t6AH+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 19:55:03.6690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dabeee6-a1e5-4df3-bf97-08dd92580d7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

Similarly to fba1b0974dd8, when a device is passed through to a
direct-map dom0less domU, the xen,reg ranges may overlap with the
extended regions. Remove xen,reg from direct-map domU extended regions.

Introduce rangeset_count_ranges().

Take the opportunity to update the comment ahead of find_memory_holes().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* new patch
---
 xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
 xen/common/rangeset.c       | 14 +++++++++
 xen/include/xen/rangeset.h  |  2 ++
 3 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae9f..3cdf5839bc98 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 }
 
 /*
- * Find the holes in the Host DT which can be exposed to Dom0 as extended
- * regions for the special memory mappings. In order to calculate regions
- * we exclude every addressable memory region described by "reg" and "ranges"
- * properties from the maximum possible addressable physical memory range:
+ * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
+ * domU as extended regions for the special memory mappings. In order to
+ * calculate regions we exclude every addressable memory region described by
+ * "reg" and "ranges" properties from the maximum possible addressable physical
+ * memory range:
  * - MMIO
  * - Host RAM
  * - PCI aperture
  * - Static shared memory regions, which are described by special property
  *   "xen,shared-mem"
+ * - xen,reg mappings
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct membanks *ext_regions)
@@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
         }
     }
 
+    if ( kinfo->xen_reg_assigned )
+    {
+        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
+        if ( res )
+            goto out;
+    }
+
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
@@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     return res;
 }
 
+static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
+                                      void *data)
+{
+    struct membanks *membank = data;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
+
+    if ( membank->nr_banks >= membank->max_banks )
+        return 0;
+
+    membank->bank[membank->nr_banks].start = s;
+    membank->bank[membank->nr_banks].size = e - s + 1;
+    membank->nr_banks++;
+
+    return 0;
+}
+
 static int __init find_host_extended_regions(const struct kernel_info *kinfo,
                                              struct membanks *ext_regions)
 {
     int res;
     struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
+    struct membanks *xen_reg = membanks_xzalloc(
+        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
 
     /*
      * Exclude the following regions:
@@ -1006,6 +1034,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
      * 2) Remove reserved memory
      * 3) Grant table assigned to domain
      * 4) Remove static shared memory (when the feature is enabled)
+     * 5) Remove xen,reg
      */
     const struct membanks *mem_banks[] = {
         kernel_info_get_mem_const(kinfo),
@@ -1014,12 +1043,27 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 #ifdef CONFIG_STATIC_SHM
         bootinfo_get_shmem(),
 #endif
+        xen_reg,
     };
 
     dt_dprintk("Find unallocated memory for extended regions\n");
 
     if ( !gnttab )
-        return -ENOMEM;
+    {
+        res = -ENOMEM;
+        goto out;
+    }
+
+    if ( !xen_reg )
+    {
+        res = -ENOMEM;
+        goto out;
+    }
+
+    if ( kinfo->xen_reg_assigned )
+        rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
+                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                               rangeset_to_membank, xen_reg);
 
     gnttab->nr_banks = 1;
     gnttab->bank[0].start = kinfo->gnttab_start;
@@ -1027,6 +1071,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
                                   ext_regions, add_ext_regions);
+
+ out:
+    xfree(xen_reg);
     xfree(gnttab);
 
     return res;
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index b9e8912fb1c3..77b37ad9b196 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,6 +433,20 @@ bool rangeset_is_empty(
     return ((r == NULL) || list_empty(&r->range_list));
 }
 
+int rangeset_count_ranges(const struct rangeset *r)
+{
+    int nr = 0;
+    struct list_head *list;
+
+    if ( r == NULL )
+        return 0;
+
+    list_for_each( list, &r->range_list )
+        nr++;
+
+    return nr;
+}
+
 struct rangeset *rangeset_new(
     struct domain *d, const char *name, unsigned int flags)
 {
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf6f..96cc0b5d7930 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,6 +56,8 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
 
+int __must_check rangeset_count_ranges(const struct rangeset *r);
+
 /* Add/claim/remove/query/purge a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
-- 
2.49.0



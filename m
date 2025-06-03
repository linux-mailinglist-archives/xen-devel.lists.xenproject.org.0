Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39609ACC3E3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004149.1383818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUq-0002xO-T6; Tue, 03 Jun 2025 10:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004149.1383818; Tue, 03 Jun 2025 10:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUq-0002uB-Oa; Tue, 03 Jun 2025 10:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1004149;
 Tue, 03 Jun 2025 10:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMOUo-0002Ov-EO
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:03:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2412::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af60d8c-4062-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:03:49 +0200 (CEST)
Received: from MW4PR03CA0194.namprd03.prod.outlook.com (2603:10b6:303:b8::19)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 10:03:44 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::5d) by MW4PR03CA0194.outlook.office365.com
 (2603:10b6:303:b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 3 Jun 2025 10:03:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 10:03:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Jun 2025 05:03:39 -0500
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
X-Inumbo-ID: 0af60d8c-4062-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdYyGzjOpL/GOq+U9oY28gHlzxgvbgbrZOfnjnO034K+enlcBrTXPKPzA+h+MykFJ4SY9oZN+2dE+Mp4sOBPRVN86DnesnLQ7RLDmB8FssHsFlNZZGOVLVSnYgv63G8bGF+VzCFTfGr0jYgbq9ylxre2TSs7GnBb1PC6TEtz9hVTE9K4GhAtwGIuoqjQMcq7rxud1l3AdocxLl/024RqES+LE7gLiwM+nX4LVygw1yLer0KdRP9g7p+olAzPk3DFlirQMbhVLEj+LJmju/xPq0o4bbInw1c/y9gNDQQwRwewTB0m1QtjzhKNrJ+WeoIa8rEehNHpJoXHNgWPqvFqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV5QO82penY1TDFtT13aO09+0kxr4wh/OT9jYuqWgqY=;
 b=wWF2WBeGkDlNU/uQ8uJoQYA+/W3cSnRmLKaZGvR0/5pYxSF3p6NrabV8sb6LRzsWzsrGNuFUyvrh7NFrzHktYPT2NFOV74yE9zUJqSRUnDQ+zD+puYChxrKUjWJ2Xx04G9TsotgJtFaHitLMSt1VQPulWtE/tEbvhZwwtfE1TKhLMSQkQnTsGeu+QSW3VYR15XEhhYiv/KZKDoSAaG0ZsIK1LP60HWXI/g8vWd+gMf1N5MIheWGECnsOdjKXD2qT3WeTCYR+FcCzBRahp+qLWNZL96IyUaBAOqHEO+mdi3HTkk+YRMnDCcgrkbVDoRle7SHKxmUIH0BWjhp6QZskag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV5QO82penY1TDFtT13aO09+0kxr4wh/OT9jYuqWgqY=;
 b=FZXclpzkTLH5XVG9qkK1Kuwr9dGQa3oPhgdt06g7kTEUNl+RjojYxPXpmmtILNSxBJ+RbyFtfiEZMf8iUQ3LjW6B+K9Sa65xe64PC7Nbqz3bpIz+EOs0PpifwnHwPbI9HCBH3mr37L1kqpA2F+Wma3+IQhC74/tbuvsJHWs+55Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/4] device-tree: Move domain_fdt_begin_node() to common
Date: Tue, 3 Jun 2025 12:03:27 +0200
Message-ID: <20250603100329.149851-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603100329.149851-1-michal.orzel@amd.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 819e561f-e283-46ef-c6cf-08dda285ec5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SqsKbrmhiWWrbsXEo6wEQcPiT0eKs7Kv1IpEHQZrxyChI5U6JtIC8WwxLBqX?=
 =?us-ascii?Q?AXsbUMz9+Tal+0b+P6uFCYS+5i84d7K7q2ceQzw1bZpJ1LceClel0MpnEQia?=
 =?us-ascii?Q?yGdoKvqoEZx7YcLVOY6NHwqg3uM6A1sLtMKub784eH0VgC1E0QB71nsmagIH?=
 =?us-ascii?Q?MBSIFq5OfkU1jbXMgCbSlK6z6R7joPmyNB8gXPR5fVdrOODUItjWQF+uL/TF?=
 =?us-ascii?Q?nIejSywooTyRGqEduadEM3l+U5tv3tHkA5xfzEdBdqCdPA00GfGfcKhoHZpg?=
 =?us-ascii?Q?zI2Bi4IqXWFHc6thxBrYg4iCm+G+1iJ3mZN+JXMKexeG5v6es/thMERRjRml?=
 =?us-ascii?Q?JclCIMeIfRMkduNGOxPKjNoETg0yrvFUUuxMhoUMzUi1KUURJpOrsI7e0yTI?=
 =?us-ascii?Q?qC53kEHxmac8t+jn3MJNQev79Cvf5zQ8RsvWWigk14YAvlPUgVc/ryzs7PvQ?=
 =?us-ascii?Q?EvSMWO45zktLbaAA4nlQro1xz1YAfZwISF4nVgPt7D0rWMgBdID1UqgRKM3l?=
 =?us-ascii?Q?EJck501MndCA/126WaYPaAkBc68rilvvf/bFF8tSnGUrKzZ2UHF3pTaIhJWq?=
 =?us-ascii?Q?5ommJX4RXiPLhM9bNxwKnP0yF7HDuVeLdjwkMkfiGLDQIjwaFxTeN2A50rwP?=
 =?us-ascii?Q?w/ej5VSJa65PCLdxL4YqTOiLGLwFq+jdgbsF0kIxDOdCVFZ4vw+1f+sEX7OZ?=
 =?us-ascii?Q?4O8qluT0jhNRtuGRmb5na1WTJv17QOGYdti8maOBj0fOXE5nh6bBffPJkVXw?=
 =?us-ascii?Q?zx6cIyxMBkp9MtOHdoKLbIfxfP52r7OFC390ceCjlquBFu3uv1lYtN58dWBW?=
 =?us-ascii?Q?Tb89+DTuxqwOIeazt6Vpe1qBRGVkzGMZCBM2JnFUTu0Pp7yDz5Z5gAGvLsZ8?=
 =?us-ascii?Q?Af9JLwjoSl5ix1yE7jIphF+jyWh5pz+Vg6L8NLlAkLup+KuaA/bnDjSQFhgt?=
 =?us-ascii?Q?cgvGOlAlg2tky/o/o+Dwa0Er6hArrj8oO927mZ6/pt7KgM9JW5ydNxv/mAc+?=
 =?us-ascii?Q?3NCFIdnlCtX9eGK/evODILf7wMqjL0h0NZsD59lCP2FszzigOo9L3QroDrdK?=
 =?us-ascii?Q?LpeCTx4BgB1VQxrrbt14O7oiWxh7idsOH3rSyXrWttzTLN02Aq/Oy7Mut0hP?=
 =?us-ascii?Q?bqjG67dNb/5WkgHKOrvDBY55XKPO7AoUkV3CR7Cbj7yRnhZpzQpNWi5FPL1x?=
 =?us-ascii?Q?19eKln2N1paaWfxjR4houa7nRtBsdVJUl8JhPZoc5wVyU0YKBYd6NqHjfG37?=
 =?us-ascii?Q?zO7lj+MCwlMTExYmDDxp2VLsh4Hk/Sgr6ygS3Wg6JO7jUy6EohAAPKbLTRuz?=
 =?us-ascii?Q?7R2uGvChtp9TFiFs162FzTbUAYsYau53DxHtogo0PizPG12/2lrofcb/BnqX?=
 =?us-ascii?Q?0/+CSYaINrFffaS7fVAwNVBIBrWqz9MuWqIgMKU5w2eLuALRhobm5EHDwY7f?=
 =?us-ascii?Q?J0OJJuwlEgAzQVoUSjOHPguz1etzdVIxmolZJL2b15OhFevjPO0X5p5gAQMw?=
 =?us-ascii?Q?mw3ijCe4bdoQ2unn3h+du92mHSh2fzE1o6vm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:03:43.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 819e561f-e283-46ef-c6cf-08dda285ec5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962

This is just a wrapper around fdt_begin_node(). Move it to common and
remove asm/domain_build.h inclusion from static-shmem.c.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c             | 32 -------------------------
 xen/arch/arm/include/asm/domain_build.h |  1 -
 xen/arch/arm/static-shmem.c             |  1 -
 xen/common/device-tree/bootfdt.c        | 32 +++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  1 +
 5 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae9f..068af31a62db 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -649,38 +649,6 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
-/*
- * Wrapper to convert physical address from paddr_t to uint64_t and
- * invoke fdt_begin_node(). This is required as the physical address
- * provided as part of node name should not contain any leading
- * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
- * unit (which contains the physical address) with name to generate a
- * node name.
- */
-int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
-{
-    /*
-     * The size of the buffer to hold the longest possible string (i.e.
-     * interrupt-controller@ + a 64-bit number + \0).
-     */
-    char buf[38];
-    int ret;
-
-    /* ePAPR 3.4 */
-    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
-
-    if ( ret >= sizeof(buf) )
-    {
-        printk(XENLOG_ERR
-               "Insufficient buffer. Minimum size required is %d\n",
-               (ret + 1));
-
-        return -FDT_ERR_TRUNCATED;
-    }
-
-    return fdt_begin_node(fdt, buf);
-}
-
 int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
                             int sizecells, const struct membanks *mem)
 {
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 9655e9d453fb..c6fec3168cdb 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,7 +5,6 @@
 #include <xen/sched.h>
 
 typedef __be32 gic_interrupt_t[3];
-int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_psci_node(void *fdt);
 void evtchn_allocate(struct domain *d);
 
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 32ec6d4bc69f..21fd2c3cd4fd 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -6,7 +6,6 @@
 #include <xen/rangeset.h>
 #include <xen/sched.h>
 
-#include <asm/domain_build.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 529c91e603ab..aa44f5a67c34 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -659,6 +659,38 @@ const __init char *boot_fdt_cmdline(const void *fdt)
     return prop->data;
 }
 
+/*
+ * Wrapper to convert physical address from paddr_t to uint64_t and
+ * invoke fdt_begin_node(). This is required as the physical address
+ * provided as part of node name should not contain any leading
+ * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
+ * unit (which contains the physical address) with name to generate a
+ * node name.
+ */
+int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
+{
+    /*
+     * The size of the buffer to hold the longest possible string (i.e.
+     * interrupt-controller@ + a 64-bit number + \0).
+     */
+    char buf[38];
+    int ret;
+
+    /* ePAPR 3.4 */
+    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
+
+    if ( ret >= sizeof(buf) )
+    {
+        printk(XENLOG_ERR
+               "Insufficient buffer. Minimum size required is %d\n",
+               (ret + 1));
+
+        return -FDT_ERR_TRUNCATED;
+    }
+
+    return fdt_begin_node(fdt, buf);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 847f01955982..64db48f4fe4e 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -191,6 +191,7 @@ void populate_boot_allocator(void);
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
 
 const char *boot_fdt_cmdline(const void *fdt);
+int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 
 static inline struct membanks *bootinfo_get_reserved_mem(void)
 {
-- 
2.25.1



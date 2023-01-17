Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E366E521
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479662.743657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1J-00019R-UM; Tue, 17 Jan 2023 17:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479662.743657; Tue, 17 Jan 2023 17:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1J-00017Y-RT; Tue, 17 Jan 2023 17:45:13 +0000
Received: by outflank-mailman (input) for mailman id 479662;
 Tue, 17 Jan 2023 17:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1I-0000oY-VJ
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af689fb7-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:10 +0100 (CET)
Received: from DS7PR05CA0058.namprd05.prod.outlook.com (2603:10b6:8:2f::11) by
 SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 17:45:07 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::c7) by DS7PR05CA0058.outlook.office365.com
 (2603:10b6:8:2f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:45:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 09:45:06 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:05 -0600
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
X-Inumbo-ID: af689fb7-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msR6cRL4h1bFfKdgntKcrszuQh863yvkpmzGhZUrDe1RXynjyh67qZB3T58+8RrLh9nqNhAKh6aOdz0BEMz78Aq7lurdI/X+2kvPx9C9R5r1jwCiJwV+8qH4h4iMsZ2cGrdIbx1QH7zUopQdje5Rla4R7c3LxCd/20+YvJeP6oLjP5dP4FGBGhAKKnNEEQ8wN+fG0LB6J7bzF6xaiVvY0K1KiXjMDH+2iCkeHejCCLGX0yZSQA+FbhoQf/XAEiIMRFtv38eDGlbNmIApY0Uq/YJMvW0apLbwQpqtKfI4KjBcJA8T2HKC3X2JHF8GSDXY01vu7LzXTLXmpVUlZ4MQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzvsf6MwjhjMY17ND2Wzg5NfLYRh8AamJF6PJtvANM0=;
 b=nyLgSXATDdFGK/oyc7tTMtfzPHixFAlMAZM6PjA2mV5i32ZujwX+gnyxXAzr/Ww5QNC5I9KBR7X4oFNZDkozoaS5kivrzykqu2RsoXO1EJCA/Z30noxP9qMJjxqXpZFfGD8zpzE0jenYaiYzM69a0U0JyHWEAUUpABXhxGfb2d6ZGcgVVFv5SVYTyhG7v+wcsUF/pnTOg+KLgY7F6yq4eoewF2kLce9PbzqNPC3Ldl9lwvAZPJWPXncepyv0bZPhdMLZsdEomDuEkoQrGOQ61MZ/tkg6qkSun810T8dbNraqQuQ5+bUNAde8OtlZD/v3zT58iGokmzK3KQojsBihMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzvsf6MwjhjMY17ND2Wzg5NfLYRh8AamJF6PJtvANM0=;
 b=2lCzsY9xnBEGw1WjAsBcM5l7fX/qh+egPN9vN9N2qahAlCmMDC257nrdL2YxrTaX8vKFTRLiGHEsxFylbwLSNXpgpMxJuyuzVt89Pz8lK+KLcBorRpFD528+knKa0BQy4pYWbpbJ5d6wijnO+r+JiDOFgsyzqCwZV1+4xtDYkeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 02/11] xen/arm: Use the correct format specifier
Date: Tue, 17 Jan 2023 17:43:49 +0000
Message-ID: <20230117174358.15344-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: caf5fa31-0dad-4921-9d95-08daf8b29277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	83tzEEaKGpH2lT3YXC7K1VuXRUPey+l2KjDutukA8VUAT03mS+dOpaZy/7DF7wU7VF5A9/ohujfc1kaXKZC+He0XpqF4uR3OtAUCMcUfG/FIe0nRCWYKmug+kdPZiJ/wRlOocQ71soMlZe9yxWpUKF+Eh1zgkvmPgpfL4oR0CwFYL/ESFNr4z70K2ctAs13baB8F+J6Gh0255glhhzbDKnx+BLNSuQasrQCpqbEVfVmYJwp9QeYbpm0FAWE4z2YDtcuGSsKSoBJm7Obc062ZAm5aUv+ypwGr1pNfn6ICBQXQ5q/9DRR2KR7LoQ++EQ/2nTzO5HyYgxS+n6XahINrCoCrV09dtEZChSBFAKLhSRbAjqCmMtNU0Txrr0hFh32Xqdpv5sl1Rg/0LbE1gmuD/j4wI9+AwkZ8H8uFXbYWiCTqmOXkR/nCYHxUcKGu1nJY4B5EmZZtYWraP6bvNAgR5nHVHlyTkecBrhPSjtzeTQlhseIpTPUz5dR+OgPHAs3aHaqPaDuXaAi7ikkHtRwQ6ce2cTEQQKQvUUTs5efYoAdn1Bm5leExgOxm+JwWl6EtaHMg2L6IQLAxRV4qmc1ALRCBD7jE5hPM2SkxXbWior9AFr9Qglp3P9MaNcxlYQXXNxaeaXwnIQDFXGw/GJkAStxD23iMNaCLi8oAqtf5kyv4Fsn/7GQWIOdBpgoO/4yWqRfxu8RtGxVZqTAULNoku8bTVx4ArYb4xaE9G7fOH+g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(36756003)(40460700003)(41300700001)(36860700001)(8936002)(103116003)(26005)(186003)(82740400003)(478600001)(336012)(83380400001)(2616005)(1076003)(47076005)(82310400005)(6666004)(54906003)(426003)(316002)(356005)(4326008)(86362001)(8676002)(70206006)(6916009)(81166007)(70586007)(40480700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:07.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf5fa31-0dad-4921-9d95-08daf8b29277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711

1. One should use 'PRIpaddr' to display 'paddr_t' variables.
2. One should use 'PRIx64' to display 'u64' in hex format. The current
use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
address.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - 1. Moved the patch earlier.
2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
into this patch.

 xen/arch/arm/domain_build.c | 10 +++++-----
 xen/arch/arm/gic-v2.c       |  6 +++---
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 829cea8de8..33a5945a2d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1315,7 +1315,7 @@ static int __init make_memory_node(const struct domain *d,
     dt_dprintk("Create memory node\n");
 
     /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
+    snprintf(buf, sizeof(buf), "memory@%"PRIpaddr, mem->bank[i].start);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
@@ -1383,7 +1383,7 @@ static int __init make_shm_memory_node(const struct domain *d,
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
+        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIpaddr, mem->bank[i].start);
         res = fdt_begin_node(fdt, buf);
         if ( res )
             return res;
@@ -2719,7 +2719,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
     char buf[38];
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
              vgic_dist_base(&d->arch.vgic));
     res = fdt_begin_node(fdt, buf);
     if ( res )
@@ -2775,7 +2775,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     char buf[38];
     unsigned int i, len = 0;
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
              vgic_dist_base(&d->arch.vgic));
 
     res = fdt_begin_node(fdt, buf);
@@ -2861,7 +2861,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
     char buf[27];
 
-    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIpaddr, d->arch.vpl011.base_addr);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 61802839cb..5d4d298b86 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1049,7 +1049,7 @@ static void __init gicv2_dt_init(void)
     if ( csize < SZ_8K )
     {
         printk(XENLOG_WARNING "GICv2: WARNING: "
-               "The GICC size is too small: %#"PRIx64" expected %#x\n",
+               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
                csize, SZ_8K);
         if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
         {
@@ -1280,11 +1280,11 @@ static int __init gicv2_init(void)
         gicv2.map_cbase += aliased_offset;
 
         printk(XENLOG_WARNING
-               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
+               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
                cbase + aliased_offset);
     } else if ( csize == SZ_128K )
         printk(XENLOG_WARNING
-               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
+               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
                csize);
 
     gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992d..fab54618ab 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -249,7 +249,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
         pte = mapping[offsets[level]];
 
-        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
                level_strs[level], offsets[level], pte.bits);
 
         if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-- 
2.17.1



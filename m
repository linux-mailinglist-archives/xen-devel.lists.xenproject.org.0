Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBD9517EA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 11:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777024.1187222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXG-0003r7-EH; Wed, 14 Aug 2024 09:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777024.1187222; Wed, 14 Aug 2024 09:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXG-0003oe-BH; Wed, 14 Aug 2024 09:43:18 +0000
Received: by outflank-mailman (input) for mailman id 777024;
 Wed, 14 Aug 2024 09:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seAXF-0003ca-Fw
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 09:43:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a171d51f-5a21-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 11:43:16 +0200 (CEST)
Received: from SN7PR04CA0097.namprd04.prod.outlook.com (2603:10b6:806:122::12)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24; Wed, 14 Aug
 2024 09:43:12 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::f0) by SN7PR04CA0097.outlook.office365.com
 (2603:10b6:806:122::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24 via Frontend
 Transport; Wed, 14 Aug 2024 09:43:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 09:43:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:10 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 14 Aug 2024 04:43:09 -0500
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
X-Inumbo-ID: a171d51f-5a21-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0qpplCp1mi4XpRKzFq6WeIk9QJSrmHnTXHtWiq1moQhl5gxT16O2MNT05DCqc1x2muXbKmai86BevbC/av2YzARGezSDgDNU0Se5HGygUNumbpbMs4R5LiMMHmusHV3UjVCNPNGOXfJoa0yFnY2HMPwk23LBULrLWxW83d0gfPVdBn0Xm1KMFvKAv9Pb7pGJs+Y04M7EM9k9ku41XfAfLrrg9Ht60iK71+KBP2lEGXzLu2SjGfRQ27WDyxwirWOfZ5JIB2SatkZtYuyrsV+CbB6MNLWKZQzPYGuSa5fwvQymuzQ490Mm+vT15bUfQoWqKjuM7QmYSPiSIFrJ4R4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orGz9J979LxEriGwI1+0fdMAD1Fr4iF2kav9HAlL6Qs=;
 b=tUPKdumYV4OpEnMeq++83RZhlmJmO2cgHr5Xkhdq1aYI9g2K9r1rTbIliSMwf130oSXYAzzUgIuIIpKYV9inpX2kAiLkTVSRuMjj8zxCaJcPWg5JBm6Vg7tHDouM7hkBKFJnzMbE5kLPiSGtOc4tgm63OvqU3U+ImJIWf4Xke7DYNoC8k9P9o6sryz5whvFlenQD9shRZTxE0LcfoH7xrt7QNSHYbbB16YNL71rp6/SaUGTr8lCDwOD28w8PrfheXbP3pZRn0eBlo8f44E8nFH/pROS/OS3okzVSITWmE045w+zSjozpw34vvHoFoXx7pZTOaKiJcvtVo3fYRwwumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orGz9J979LxEriGwI1+0fdMAD1Fr4iF2kav9HAlL6Qs=;
 b=aRUoEUY695z0czFU50zs1OT8u3NeMqek/m+vgRwKGw2OAIRcdsDw9hvgtJm5MIDa2DzJuNX7AKFL3WfnGke1fUGn2XohD6x/WNIV1Ci6I6eAWD3U7vIomld4L/w1FhDoXtD9zEsXgHH8vYoWI7cH4wDM+zjG0vR0gPvlwZ1UpUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: Drop {boot_}phys_offset usage
Date: Wed, 14 Aug 2024 11:43:02 +0200
Message-ID: <20240814094303.23611-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814094303.23611-1-michal.orzel@amd.com>
References: <20240814094303.23611-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c49482-f50c-4d68-7074-08dcbc4582ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fE4ENF/VFDH3P8YrIJDMdYn6IZpYyw51jY5jmQjt8lU6ScQ5melR8Vdx7IQT?=
 =?us-ascii?Q?ymx5R1r1rXqUAu6PGBoPgICdO2RYMYkL4QNPh8glZw5g/JFBrEOvzHcxbK9a?=
 =?us-ascii?Q?sJd2yIrYtj3G2fk7a4Sy2MYqoGYZumpmkI0/xhamvhPx4UwPZiJZo+oTpx+7?=
 =?us-ascii?Q?aIgMjmmZGxzY5nEfYEM3tsDicvyX3p/c98YiAfIOAwfMjtO/lkqd6N/JyApA?=
 =?us-ascii?Q?MUo2OLVkT/fT2nWur9a77Z+i9XZ/cNRgM7zUIQRCTTxYa14/NTcDINb5dLRa?=
 =?us-ascii?Q?J6ay1ETbBB3vuJcbAC50odTU7BPnI6U5a58kP2eseJrIgCCpEl7ffY8lXWM+?=
 =?us-ascii?Q?c+2Z1gI5GzW1xR+G4cq+t06et8hcyS9IGqbRzP3R5LhgEf0t/LwEDEq9GMcz?=
 =?us-ascii?Q?MB1PV9j8+rLfQ5Ohcj0qaYDyaHGL1NehPIqseGVo1A3rI+39PHePDUVcF/ph?=
 =?us-ascii?Q?unpxxfzzZQluCFlo5mQUk53Ux+0gJtt2pL9wOj5UhEVnTQVmyGeh34HfiRDQ?=
 =?us-ascii?Q?xyGZXFy+4AcvznQTSnTzrS+ZfVrHCmgGFNNl37lpSA4TfPmTzgByE0hAxWZC?=
 =?us-ascii?Q?BDP2qZ6YFu9qDudKoG76SiiTUva1wqRkbxfMAnRTZouQXy4HQuiGy8XYcvr5?=
 =?us-ascii?Q?rJwx1w8gtGG0IcrPhxe6ZDDE2KdSsvLEL6IvxU4E9bOZ8s8I824Yp221jnYG?=
 =?us-ascii?Q?Re6gCTAUFaMqNyiRQr3mWxBry4YNp67F5ZaYEKty+jPY9g6/wNlzrnGjxeeZ?=
 =?us-ascii?Q?acsML01pISeJtczXDNV9QNlBlZWF2UAqNRFHxJnBWHrw0g27brTdgBUUqjdf?=
 =?us-ascii?Q?Vl/ciloo72FBenc7pLeuSgCDXhX+kRkHEDdiVd1EApxKRV5h4GR8wdmAEYwK?=
 =?us-ascii?Q?EN+1+hsvJfmblia2V7YvWvXAx+M/LpKb3R6K1bEj2BxFZj3LhMMMFFYMv9XQ?=
 =?us-ascii?Q?6hyj/texoZIrpECf40FCTK3An5i0kzWePAS29O1eS9WkXppr2WBxXZf71jpL?=
 =?us-ascii?Q?P+Txv6LCMkBtz2DWuwE5oOmOMJxlMDMWOaLFTSuoqrSmlWKrXVy8MNWrdVAv?=
 =?us-ascii?Q?L9rnSft4EwU2cEY3rSFm/JUsZxOHPfA863/5A54qN7s3S3liGvnYJEpW9qMx?=
 =?us-ascii?Q?Udt3liV4QJqWngzutcFmZOxTjvdPF/ermZ4Jgf1573k86ia2DHTVQ6wLW7dh?=
 =?us-ascii?Q?yNo/w9KWQI9FK0AJEqb95b9Rclz6MtlzY4yUUdF1++q3vQBdCYYj9aBtySZS?=
 =?us-ascii?Q?US0CaeSMWT/67jVrgyGj3yRcoct3dChkMVkIPiitB/bvACoF1lK/jGfGO84f?=
 =?us-ascii?Q?kmeGXQ0DOjMpiDDYnm/Wsp9ivicmUVp+BlByw686WOABp1sLsc0zS0dSa3ec?=
 =?us-ascii?Q?p9JGYJ8jaoFrkcuPgENdjSmu3Lg/0AqNFgo3wUjJebz2EjzM2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 09:43:11.4128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c49482-f50c-4d68-7074-08dcbc4582ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848

boot_phys_offset stores the physical offset (PA-VA), is calculated in
the startup head.S code and passed to start_xen() as a first argument.
There is no point in using it given that we can ask MMU to translate
a VA for us using e.g. virt_to_{mfn,maddr}. Drop usage of these
variables from the C world.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
It should also simplify the LLC coloring last patch:
https://lore.kernel.org/xen-devel/20240502165533.319988-14-carlo.nonato@minervasys.tech/
---
 xen/arch/arm/include/asm/mm.h |  2 +-
 xen/arch/arm/mmu/setup.c      | 16 ++++++----------
 xen/arch/arm/setup.c          |  2 +-
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f6ba611f01f7..5abd4b0d1c73 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -199,7 +199,7 @@ extern unsigned long frametable_base_pdx;
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(void);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 57042ed57b4a..9664e85ee6c0 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -17,6 +17,8 @@
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef mfn_to_virt
 #define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
 /* Main runtime page tables */
 
@@ -52,8 +54,6 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
  */
 static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
 
-static paddr_t phys_offset;
-
 /* Limits of the Xen heap */
 mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
 mfn_t directmap_mfn_end __read_mostly;
@@ -138,9 +138,7 @@ static void __init __maybe_unused build_assertions(void)
 
 lpae_t __init pte_of_xenaddr(vaddr_t va)
 {
-    paddr_t ma = va + phys_offset;
-
-    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
+    return mfn_to_xen_entry(virt_to_mfn(va), MT_NORMAL);
 }
 
 void * __init early_fdt_map(paddr_t fdt_paddr)
@@ -228,14 +226,12 @@ static void xen_pt_enforce_wnx(void)
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
  */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+void __init setup_pagetables(void)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
     int i;
 
-    phys_offset = boot_phys_offset;
-
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -290,9 +286,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
 #ifdef CONFIG_ARM_64
-    ttbr = (uintptr_t) xen_pgtable + phys_offset;
+    ttbr = virt_to_maddr(xen_pgtable);
 #else
-    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
+    ttbr = virt_to_maddr(cpu0_pgtable);
 #endif
 
     switch_ttbr(ttbr);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cb2c0a16b824..cfe19e15b0be 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -304,7 +304,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
+    setup_pagetables();
 
     smp_clear_cpu_maps();
 
-- 
2.25.1



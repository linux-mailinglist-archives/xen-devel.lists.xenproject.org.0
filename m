Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA864E1D3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463751.722036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyc-0007Bh-Ok; Thu, 15 Dec 2022 19:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463751.722036; Thu, 15 Dec 2022 19:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyc-00078s-Jb; Thu, 15 Dec 2022 19:33:06 +0000
Received: by outflank-mailman (input) for mailman id 463751;
 Thu, 15 Dec 2022 19:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tya-0006TA-B1
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49f0abdf-7caf-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:33:03 +0100 (CET)
Received: from DM5PR07CA0111.namprd07.prod.outlook.com (2603:10b6:4:ae::40) by
 SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Thu, 15 Dec 2022 19:33:00 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::ab) by DM5PR07CA0111.outlook.office365.com
 (2603:10b6:4:ae::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.9 via Frontend Transport; Thu, 15 Dec 2022 19:33:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:32:59 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:32:58 -0600
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
X-Inumbo-ID: 49f0abdf-7caf-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8cMj1zz7OisxFhuPTmOm/1+DxK6mXC2Jg8h8XeqstiKiOUUuy/UbnxwTQesfEUbs31AP0FuPHRwxdI9preq15JBh1/wjNtXHnE0RSVYWj8NAfDk9L3K7cHvoDzgdsYpxK4oWI2APK/OoH6BqChfEM5oosUR/eYAzYkPGwP/mdCYm502Syp45t4Y0Wu7M3xH22L52s58ZJwdysF0oZete2BWrorvKCzYXUInVe+Pytui7tMLbgol9Xl9qdruBQDpDTrYgsa3M91ndyIrx/safCGt1bfY9SHl/cqGBOk/42WQ+LQAdbDyjn3EBkPBZQ+H2TTh5J/k69jHbxT6WLFjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9kys79lyCmih9CHzEt5PZyku/GqRCHvt0SFfV6NNkY=;
 b=aKx43f6OivfE50jtorpyR9cZbEScWFQy6veA11tE18Ldr6tDFjVVYjGAbCT/ewNnYuj6+lG4xGjQ5PGXO3Jkv5Q+XzTQZ8qF8OMQj6oewc6wEzZn05tkC1Y2OCy9mKtWRGlbUk0D0/E8tanwkqcb/wEeh0OiGtoC/0EYaWac+fAL8tH2U4yNNik9l8hLnfYa+lEcaiN377a9kW5fzesLYEqmYsZ5nLkeODlES9axfgs9hNsC5q+8XvZ1BlDOsdHmNxebYTzFdHZaP+SsGTxRVUh5U3K1Rb4eWip+lT7gF7UbFB8NVdp0WDZhmqEXb3lUFFaTm0dhi4v0z4PE7CKm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9kys79lyCmih9CHzEt5PZyku/GqRCHvt0SFfV6NNkY=;
 b=h5SQxK/NhHFzUcYIgQhKOC7kSnsHjfdMgSxbr21ipeNPXqPRHSFpoLjK8K08DgR/UmOdYy1EsxeLmzpmIUwygLsZa1Un4J0NYGrgEsFm27yZQ5TYDbm2vWgN4GR8lCG0DnwOvSIr835kwF3u2d25gtKin5A4HF7v2TZhNQdxHSk=
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
Subject: [XEN v1 3/9] xen/arm: Always use 'u64' instead of 'paddr_t' for address and size in DT
Date: Thu, 15 Dec 2022 19:32:39 +0000
Message-ID: <20221215193245.48314-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec4004c-3db7-466a-8af6-08daded32d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uHxLCLMBpxmE3Lmi/Mp2gcDc3qV89S31kjMujfC9gZfGb28PamSI4JBN3tRPgeA3IS9LHrFEEHkR61Ey2e3qEZSWUlrYqOMjwnj7+9MmNuNQBOVUvtU0CIT0UXfd9mzaBRPPuBRusdNUFLm07TYqeo61Ggg4OQBhC8rwkG+0kZaIyyIf1HB6/3VGu8WTEz2iB3S4fwBZ3l2WMmBXC/0/ljrjYGdENclJyvi6NRnYSSPUhN6GsX5DCwR2Qub9VkZ2sWETzxIrAe7k82UY8Dkw2ZSqE0HkskjQOLv0iqM8X27hX28uR5FBX1kfmobNEpPdNMoMwngS/zrPouAkWQSUGuTCflHoalJ5AgQYHoj2EFfWSe/d9neWrIuTO/KCD6dkL6XqN9+tIabEM4K2bD/TusCwl/46yEwlhsZjhQvXTG0YEBQtdkGDZe1XaPJ3eXfLyk+w9xT0MbWsmWt2SQG8HgEPMSMyDLjuWi2YMa6xrbJZSdSH+j/fzgtL1eaKSYKb+u5tzwnKVI5/9LTcXKiBsUytK9VNev7beEl4AovWTPj2v8U8NScfXNTKrVmdm2lcvPpNzNdpH+H+kxk/j8+S0BrKCQE9GQ3yniOfY+dozpPS0xzb968NN0YYUDNIpY0CQgEcAPkyU9J/A8AkUxagU5vdnhwutc73wo6f5zzGyWvuUKaYeKQUSg2DFbNacLAZpGgSI0tGCwwdfzfUYcjKqb7x6kQ94x6joL7OSEs6YMg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(86362001)(316002)(54906003)(6916009)(8936002)(36860700001)(8676002)(70206006)(82310400005)(41300700001)(36756003)(4326008)(70586007)(6666004)(186003)(47076005)(40460700003)(103116003)(1076003)(2616005)(478600001)(426003)(336012)(83380400001)(2906002)(40480700001)(26005)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:00.1810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec4004c-3db7-466a-8af6-08daded32d1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893

device_tree_get_reg(), dt_next_cell() uses u64 for address and size.
Thus, the caller needs to be fixed to pass u64 values and then invoke
translate_dt_address_size() to do the translation between u64 and paddr_t.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/bootfdt.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..835bb5feb9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -14,6 +14,7 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
+#include <asm/platform.h>
 #include <asm/setup.h>
 
 static bool __init device_tree_node_matches(const void *fdt, int node,
@@ -68,7 +69,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     unsigned int i, banks;
     const __be32 *cell;
     u32 reg_cells = address_cells + size_cells;
-    paddr_t start, size;
+    u64 start, size;
     struct meminfo *mem = data;
 
     if ( address_cells < 1 || size_cells < 1 )
@@ -219,7 +220,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
     const struct fdt_property *prop;
     const __be32 *cell;
     bootmodule_kind kind;
-    paddr_t start, size;
+    u64 start, size;
     int len;
     /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
     char path[92];
@@ -379,7 +380,8 @@ static int __init process_shm_node(const void *fdt, int node,
 {
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
-    paddr_t paddr, gaddr, size;
+    paddr_t paddr = 0, gaddr = 0, size = 0;
+    u64 dt_paddr, dt_gaddr, dt_size;
     struct meminfo *mem = &bootinfo.reserved_mem;
     unsigned int i;
     int len;
@@ -443,10 +445,14 @@ static int __init process_shm_node(const void *fdt, int node,
     }
 
     cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
-    size = dt_next_cell(size_cells, &cell);
+    device_tree_get_reg(&cell, address_cells, address_cells, &dt_paddr,
+                        &dt_gaddr);
+    translate_dt_address_size(&dt_paddr, &dt_gaddr, &paddr, &gaddr);
 
-    if ( !size )
+    dt_size = dt_next_cell(size_cells, &cell);
+    translate_dt_address_size(NULL, &dt_size, NULL, &size);
+
+    if ( !dt_size )
     {
         printk("fdt: the size for static shared memory region can not be zero\n");
         return -EINVAL;
@@ -593,12 +599,12 @@ static void __init early_print_info(void)
     nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
     for ( i = 0; i < nr_rsvd; i++ )
     {
-        paddr_t s, e;
+        u64 s, e;
         if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
             continue;
         /* fdt_get_mem_rsv returns length */
         e += s;
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
+        printk(" RESVD[%u]: %"PRIx64" - %"PRIx64"\n", i, s, e);
     }
     for ( j = 0; j < mem_resv->nr_banks; j++, i++ )
     {
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75F708407
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536397.834681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeo0-0000XM-F6; Thu, 18 May 2023 14:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536397.834681; Thu, 18 May 2023 14:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeo0-0000UA-9v; Thu, 18 May 2023 14:40:36 +0000
Received: by outflank-mailman (input) for mailman id 536397;
 Thu, 18 May 2023 14:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzeny-00074K-Pc
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:40:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e88::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f121d681-f589-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:40:32 +0200 (CEST)
Received: from BN0PR04CA0159.namprd04.prod.outlook.com (2603:10b6:408:eb::14)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 14:40:28 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::82) by BN0PR04CA0159.outlook.office365.com
 (2603:10b6:408:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20 via Frontend
 Transport; Thu, 18 May 2023 14:40:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:40:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:40:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 07:40:26 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:40:25 -0500
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
X-Inumbo-ID: f121d681-f589-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxZxdQ0XkawVC9kho2WT2FtHwa6ZCNWyuezW2z/Uj+mESMKX9QPd4i3PbEZHDlWc/bOVthBsoiAfmGw+0ecW4LgNCxsOWSmHARpjOeGVkR6LXAtJfF3HyWd2178iTm3t/HsgKJWz7m43ZAKzkZX2lcwlF1dpN0uqiSy9xjKHbWlhdHXnZjdWPTouy7VA6s8QCrKO7+13aVOHwhHFmpC7oVjP90X8z+ftRaBYJOyCJ9rJYwMP6OzS1Uf7XKoSr0oyyDUaqOLkWK0eiI8tKGj5Zlx4nDv6MNFTnFwQqhiPKxzz3i7pMTPXt8dWSxeVgMhDyRvLyMEHxO9sI0p5UyWSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tqVoZ2YFpUeNO52o/M+YkHJkClJ6m4riHukSRNfevU=;
 b=bvdvvcSU8MBiXFsivFtD8WxEBDOLU3FpX54Czf5jS1add0Me4UAwKEatyDma8Xb36EhGIdfNIXqbdoC8gg0hkqt8zUi+WNgMzV9MG0LKtUd+3yOOdcvUrXOcvEIY13rJj/wVQaXxxWJu/eq6OpH4ppdCGZ3Ea/MwpZbvQLzhJ1ajrXFn0hhwoy9+6Cuu9AchxYEt26Tav/EaeJJUtDMJqLBXfScH8VT+kOlKkfLcoFjVKtCekHjIWMKmQWZafDdU6uQgKFMniu958fkja+gkVk5NNOdPMGjanygmDrac0ICFvEn12tV21Kt50tI8GDt/JHa28Sz5r6odJoLVrhTP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tqVoZ2YFpUeNO52o/M+YkHJkClJ6m4riHukSRNfevU=;
 b=HEPucOwMUXr1jCdrcHk3ZzgO7y00ebptZ1GsVhqsdyFmiQ8JjRZQhpoDNyYe1vWUV++vIHhT0thUv5CpZx2dHgGpceToHUtz1ud14VpA8Ov0vJrFUt1hgO0VA5kgQ94JFxrW9zytJusomjm0oSsYt+1ZWX/DRWoQtrYpsk9aXCY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 02/11] xen/arm: Typecast the DT values into paddr_t
Date: Thu, 18 May 2023 15:39:11 +0100
Message-ID: <20230518143920.43186-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: d5892642-ee00-4618-7d35-08db57add2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4JhO5bt6yWYYWGK41MCPgBxZQ1VZn44Z6/QsFTVshMTRmFamw7T/ocMf5b5JpxFUzWxNGm+c8LaBvlmPCX/inwyy0gYmTVz0rjFg3nsa+4CDGh6y4xNDqGvjrXZjR9HR7xDWnSuizJeWZn1TDaceWRJAMubXpGvd4/XH6ZCuG5pLZwQsfqoUjZbDBOka/9XO2N3Z65TI1o0D1ZFuEbOx5ck/+BxedMnEKTKvjsqlYS9uU1hHp6snM+b9j6sBXu7E8qw5GN+MFYdGx4gfy0x9W58QoJpRfFXrNnvI3WzzQdfXBVHn8X5StIbz4EwgkasQNwcjqDbwt7z/NGUS21wZeNNkC5HPgolEtcCCjxqyl9wT9+9mKz8Rkv7+fyIPnhh/lhMZ0VZM4Zl0v1qG4Q8F9tYHE1u4d3Q7NahHnthIjqkgwoyfUiHFcmOZ/wq0C/Isug8cLUlWvXmQQ30NTX//6hW1gdiF66ff/cpxBDj+lfqlraHFjXaGM0YtEK9mfq2qglNsQtGfmAc7umu0y/Z3d5vxghVo3/JaMC8LWnRmHM8A0WypKLgugz2li13hNkTrfzKqA+etya6Ppv3v6cdtjMWZFtmJQ0hu68ZHHXRQpjyNEYHLhZtU4Hq6t4VlmxnYs06b1DuhPxuH9b1XJPz/GbSKTqpbv0MB6aniXrlEUF6jt0ZP6HoAnYomN2DE3thnXsLEuYEhX9wyP/lKHdzvSvh8eqMVAQ4wp45vXnGfMfAfD5Ex+bt4GiVOniZZ4lJ71qgBruFAVf6NMO/t1OqbdGeGNtsPLiuSc8bpHuF6GKFGp+TIUCwy9ZT4R4aAbNMZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(316002)(70206006)(70586007)(478600001)(4326008)(54906003)(6916009)(36756003)(103116003)(83380400001)(47076005)(1076003)(426003)(36860700001)(186003)(26005)(2616005)(86362001)(30864003)(2906002)(5660300002)(8936002)(8676002)(82310400005)(336012)(6666004)(40480700001)(7416002)(356005)(81166007)(41300700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:40:27.8591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5892642-ee00-4618-7d35-08db57add2b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
currently accept or return 64-bit values.

In future when we support 32-bit physical address, these DT functions are
expected to accept/return 32-bit or 64-bit values (depending on the width of
physical address). Also, we wish to detect if any truncation has occurred
(i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).

device_tree_get_reg() should now be able to return paddr_t. This is invoked by
various callers to get DT address and size.

For fdt_get_mem_rsv(), we have introduced a wrapper named
fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
has been imported from external source.

For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
dt_read_paddr() to read physical addresses. We chose not to modify the original
function as it is used in places where it needs to specifically read 64-bit
values from dt (For e.g. dt_property_read_u64()).

Xen prints warning when it detects truncation in cases where it is not able to
return error.

Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
by the code changes.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from

v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
"[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
this approach achieves the same purpose.

2. No need to check for truncation while converting values from u64 to paddr_t.

v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
3. Logged error messages in case truncation is detected.

v3 - 1. Renamed libfdt_xen.h to libfdt-xen.h.
2. Replaced u32/u64 with uint32_t/uint64_t
3. Use "(paddr_t)val != val" to check for truncation.
4. Removed the alias "#define PADDR_SHIFT PADDR_BITS". 

v4 - 1. Added a WARN() when truncation is detected.
2. Always check the return value of fdt_get_mem_rsv().

v5 - 1. Removed the initialization of variables in fdt_get_mem_rsv_paddr().
The warning has been fixed by checking "if (ret < 0)", similar to how it was
being done for fdt_get_mem_rsv().

2. Removed printing "Error:" before WARN().
3. Added the note about implicit casting before dt_read_number()
4. Sanity fixes.

v6 - 1. Added R-b.

 xen/arch/arm/bootfdt.c              | 46 +++++++++++++++++++-----
 xen/arch/arm/domain_build.c         |  2 +-
 xen/arch/arm/include/asm/setup.h    |  4 +--
 xen/arch/arm/setup.c                | 14 ++++----
 xen/arch/arm/smpboot.c              |  2 +-
 xen/include/xen/device_tree.h       | 27 ++++++++++++++
 xen/include/xen/libfdt/libfdt-xen.h | 55 +++++++++++++++++++++++++++++
 7 files changed, 130 insertions(+), 20 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e2f6c7324b..b6f92a174f 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,7 +11,7 @@
 #include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/lib.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
@@ -52,11 +52,37 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
     return false;
 }
 
-void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                                u32 size_cells, u64 *start, u64 *size)
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
 {
-    *start = dt_next_cell(address_cells, cell);
-    *size = dt_next_cell(size_cells, cell);
+    uint64_t dt_start, dt_size;
+
+    /*
+     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( dt_start != (paddr_t)dt_start )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Physical size greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    *start = dt_start;
+    *size = dt_size;
 }
 
 static int __init device_tree_get_meminfo(const void *fdt, int node,
@@ -329,7 +355,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-start property has invalid length %d\n", len);
         return -EINVAL;
     }
-    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
     if ( !prop )
@@ -342,7 +368,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-end property has invalid length %d\n", len);
         return -EINVAL;
     }
-    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     if ( start >= end )
     {
@@ -593,9 +619,11 @@ static void __init early_print_info(void)
     for ( i = 0; i < nr_rsvd; i++ )
     {
         paddr_t s, e;
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
             continue;
-        /* fdt_get_mem_rsv returns length */
+
+        /* fdt_get_mem_rsv_paddr returns length */
         e += s;
         printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
     }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e0ac5db60d..7bcd6a83f7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -949,7 +949,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
         device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
+        psize = dt_read_paddr(cells, size_cells);
         if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
         {
             printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 38e2ce255f..47ce565d87 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -159,8 +159,8 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
-void device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                         u32 size_cells, u64 *start, u64 *size);
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
 
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6f9f4d8c8a..74b40e527f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -29,7 +29,7 @@
 #include <xen/virtual_region.h>
 #include <xen/vmap.h>
 #include <xen/trace.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
 #include <xen/warning.h>
 #include <asm/alternative.h>
@@ -222,11 +222,11 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     {
         paddr_t r_s, r_e;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
-        r_e += r_s; /* fdt_get_mem_rsv returns length */
+        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
 
         if ( s < r_e && r_s < e )
         {
@@ -592,13 +592,13 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     {
         paddr_t mod_s, mod_e;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened,
-                             i - mi->nr_mods,
-                             &mod_s, &mod_e ) < 0 )
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
+                                   i - mi->nr_mods,
+                                   &mod_s, &mod_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
-        /* fdt_get_mem_rsv returns length */
+        /* fdt_get_mem_rsv_paddr returns length */
         mod_e += mod_s;
 
         if ( s < mod_e && mod_s < e )
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 4a89b3a834..e107b86b7b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -159,7 +159,7 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
-        addr = dt_read_number(prop, dt_n_addr_cells(cpu));
+        addr = dt_read_paddr(prop, dt_n_addr_cells(cpu));
 
         hwid = addr;
         if ( hwid != addr )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 19a74909ce..5f8f61aec8 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -241,6 +241,33 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
     return r;
 }
 
+/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    uint64_t dt_r;
+    paddr_t r;
+
+    /*
+     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_r = dt_read_number(cell, size);
+
+    if ( dt_r != (paddr_t)dt_r )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    r = dt_r;
+
+    return r;
+}
+
 /* Helper to convert a number of cells to bytes */
 static inline int dt_cells_to_size(int size)
 {
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
new file mode 100644
index 0000000000..a5340bc9f4
--- /dev/null
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/include/xen/libfdt/libfdt-xen.h
+ *
+ * Wrapper functions for device tree. This helps to convert dt values
+ * between uint64_t and paddr_t.
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ */
+
+#ifndef LIBFDT_XEN_H
+#define LIBFDT_XEN_H
+
+#include <xen/libfdt/libfdt.h>
+
+static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
+                                        paddr_t *address,
+                                        paddr_t *size)
+{
+    uint64_t dt_addr;
+    uint64_t dt_size;
+    int ret;
+
+    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
+    if ( ret < 0 )
+        return ret;
+
+    if ( dt_addr != (paddr_t)dt_addr )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        return -FDT_ERR_MAX;
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Error: Physical size greater than max width supported\n");
+        return -FDT_ERR_MAX;
+    }
+
+    *address = dt_addr;
+    *size = dt_size;
+
+    return ret;
+}
+
+#endif /* LIBFDT_XEN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1



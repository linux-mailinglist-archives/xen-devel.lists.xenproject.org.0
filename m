Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D53FE97C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176910.322078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004l1-FS; Thu, 02 Sep 2021 06:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176910.322078; Thu, 02 Sep 2021 06:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004f4-BJ; Thu, 02 Sep 2021 06:50:56 +0000
Received: by outflank-mailman (input) for mailman id 176910;
 Thu, 02 Sep 2021 06:06:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfs8-0004ZP-Ju
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:06:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f479392f-0bb3-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:06:47 +0000 (UTC)
Received: from DM5PR07CA0167.namprd07.prod.outlook.com (2603:10b6:3:ee::33) by
 DM6PR02MB4218.namprd02.prod.outlook.com (2603:10b6:5:a0::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 2 Sep 2021 06:06:45 +0000
Received: from DM3NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::29) by DM5PR07CA0167.outlook.office365.com
 (2603:10b6:3:ee::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:06:45 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT050.mail.protection.outlook.com (10.13.5.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:06:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:06:44 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:06:44 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfs4-000F6q-1L; Wed, 01 Sep 2021 23:06:44 -0700
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
X-Inumbo-ID: f479392f-0bb3-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9cc6jUikAlp+4tIMYtHViI3oxKr/q1xm+LoyryDZHotnMiUXsZgpfvUIHty6EejDMZNwtXqhJ4BzJnBD6K5nNAmAqrk9sTOElDdhpOYjgcohynI6CCOkXXzBYScsJAuXa2CVB3U6mQD5XbQql66mkorGckbhNeOU3mjNbNIeNQke9JP1vUyJSbQVZEctoLMoAqeumBjLgBNgYB63xhURgjNno9VkV5gTJRbfg6vfXG1qFbG4vrL50If1CPtKfkIitJj0JHTgqOO6Yh+aB0P8m2vBB0CyS3LtGyNnheKWa3Uxhpm+8hbCbCsruwx/aHDLp7k4ms0dh1xcjiMwnsZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0sULzvu56yUkRR8j2QyEg/IiWAf0h/83PzvUjdhg/o=;
 b=mPdDmT3Baq+YiuR8uzEKBZhOsWrbumyFJsNnoIyMcvi0YQbxAdwVPtm00y9H40s7hz0zmfqtFyw7W/uyr6se3CD0xoafNwty2IuJ5rhCn9oe1kce/lI+kqxLGhvnROdoaVygFtThXelxQ/72qCSSM/R8ZmkHsZdeb/q3mFZ3YwMcPc83A64ReGEjREV5o+U3BmqrA3KRAXFDWlyLzJ7PL6nfGEmXCks8KtbINCmOwG2SC5JVbb1mw5pVNk1Z9OBSpQH+mtPE+zhsIX5fP60GE8mrxD+Ct6/mT+1GlOMIkVdlMG4RAFp2duNGaJnYxYKpw3x/UlRzsOXCGabQJU4C8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0sULzvu56yUkRR8j2QyEg/IiWAf0h/83PzvUjdhg/o=;
 b=TiuU8dH4jgG+X2FlI0nGaDbqiNe+3eB17iIgiAudaWv47XmqislETrrLTz1wKXNThHGL0Jc4aCKMr+LI+L4lpEy4DEwj/TFVQmJCkQax8Dz0rhWqm9aEM/KVzmnn3D1dx5pz+rLxqrZLLwhBfN0oU3pt5UWQgndjjWPmbHhdUaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH 01/13] device tree: Remove __init from function type
Date: Wed, 1 Sep 2021 23:05:51 -0700
Message-ID: <1630562763-390068-2-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b402bf5-966b-4cbd-aa4a-08d96dd7d797
X-MS-TrafficTypeDiagnostic: DM6PR02MB4218:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB4218712926570DB3C137CB34BCCE9@DM6PR02MB4218.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HMU2JX5WpfuP5g1RAWmdCLTpQ2YBrd+IW8uYGBCTUstQQxgphy0rUMYUt6hGkyZyazn4d/7zTjiT6Qs9aBLxgrUa1osuklJGTortSVQXmNa2Fk1PSvTS5UZ7XopWxT9ACqkIQ3QmUrWlONzxiztbYVJyAUzffYwkSfPxq9ylwe7eebs5mpWjHQ2md5gsBGbmuYeuZ6UXogEiNyruqJvRmJ9B9wW61t5hkmjSZZac8CBSicVuKJxF81n3gO73wrmUMgpDwrqah9ZOoUGPj12ng8p9163AHDUA18F3OzYihHUMDpOxjbzQ035AUO8q8SDDmer1bzZOR94FLB2IeZ9VxOx47Vb+bH+/7g5SJRpKlK2vl9XMeaOVSvkp3vLoegbmPx2ECrc3JNdsd1nCYyso95LMSI4+nqXCjRdoeJs3U28xgo1xxfy0mBJwgF1seqyGds8TOOp1NIZKQymAFlQ3cO3oSollbCjTlUJtwRgqRRZljP1yvcPFckjTJoih728lyyHXZkjd3GiDAh+WE338kkxxmJNZAUGmjrI57OGqXLgosygNdf+ILmpSHOnT0L4HWczSOZ0843VoMjjJVzpmS4M7QXJriz5w/fIyG6xhZG9y92GXLLzYoRgbhspZpV8gFj3jPhEoBOTSVTvY8Nv9RplCal5xwO844n62nAyeOX3+p/Gy6IHbfhKGK2x7pzUYBrOYaq9M2DM1DnXcP2pITiYQM4+Ef5fVAQuiqVuJk8=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(2906002)(54906003)(508600001)(8936002)(8676002)(2616005)(70206006)(426003)(6916009)(36756003)(5660300002)(7696005)(36860700001)(83380400001)(36906005)(82310400003)(26005)(336012)(316002)(4326008)(70586007)(356005)(9786002)(186003)(47076005)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:06:45.1163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b402bf5-966b-4cbd-aa4a-08d96dd7d797
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4218

Change function type of following function to access during runtime:
    1. handle_device_interrupt()
    2. map_irq_to_domain()
    3. map_range_to_domain()
    4. unflatten_dt_node()
    5. unflatten_device_tree()

Remove .init from domain_build.o and move map_range_data declaration to
domain_build.h.

These changes are done to support the dynamic programming of a nodes where an
overlay node will be added to fdt and unflattened node will be added to dt_host.
Furthermore, irq and mmio mapping will be done for the added node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/Makefile              |  2 +-
 xen/arch/arm/domain_build.c        | 15 ++++-----------
 xen/common/device_tree.c           | 18 +++++++++---------
 xen/include/asm-arm/domain_build.h | 10 ++++++++++
 xen/include/xen/device_tree.h      |  5 +++++
 5 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d3b97b..bef4517 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -15,7 +15,7 @@ obj-y += decode.o
 obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
-obj-y += domain_build.init.o
+obj-y += domain_build.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += gic.o
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 206038d..3a457d3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -47,12 +47,6 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
-struct map_range_data
-{
-    struct domain *d;
-    p2m_type_t p2mt;
-};
-
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
@@ -1144,7 +1138,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init map_irq_to_domain(struct domain *d, unsigned int irq,
+int map_irq_to_domain(struct domain *d, unsigned int irq,
                              bool need_mapping, const char *devname)
 {
     int res;
@@ -1210,7 +1204,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     return 0;
 }
 
-static int __init map_range_to_domain(const struct dt_device_node *dev,
+int map_range_to_domain(const struct dt_device_node *dev,
                                       u64 addr, u64 len,
                                       void *data)
 {
@@ -1300,9 +1294,8 @@ static int __init map_device_children(struct domain *d,
  *   < 0 error
  *   0   success
  */
-static int __init handle_device_interrupts(struct domain *d,
-                                           struct dt_device_node *dev,
-                                           bool need_mapping)
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping)
 {
     unsigned int i, nirq;
     int res;
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 03d25a8..cda21be 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1750,12 +1750,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  * @allnextpp: pointer to ->allnext from last allocated device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-static unsigned long __init unflatten_dt_node(const void *fdt,
-                                              unsigned long mem,
-                                              unsigned long *p,
-                                              struct dt_device_node *dad,
-                                              struct dt_device_node ***allnextpp,
-                                              unsigned long fpsize)
+static unsigned long unflatten_dt_node(const void *fdt,
+                                unsigned long mem,
+                                unsigned long *p,
+                                struct dt_device_node *dad,
+                                struct dt_device_node ***allnextpp,
+                                unsigned long fpsize)
 {
     struct dt_device_node *np;
     struct dt_property *pp, **prev_pp = NULL;
@@ -1986,7 +1986,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -1995,7 +1995,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __init __unflatten_device_tree(const void *fdt,
+void unflatten_device_tree(const void *fdt,
                                            struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
@@ -2118,7 +2118,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    unflatten_device_tree(device_tree_flattened, &dt_host);
     dt_alias_scan();
 }
 
diff --git a/xen/include/asm-arm/domain_build.h b/xen/include/asm-arm/domain_build.h
index 34ceddc..17449b1 100644
--- a/xen/include/asm-arm/domain_build.h
+++ b/xen/include/asm-arm/domain_build.h
@@ -4,10 +4,20 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
+struct map_range_data
+{
+    struct domain *d;
+    p2m_type_t p2mt;
+};
+
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
 int make_chosen_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping);
+int map_range_to_domain(const struct dt_device_node *dev, u64 addr, u64 len,
+                        void *data);
 
 #ifndef CONFIG_ACPI
 static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index b02696b..a4e98a7 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -177,6 +177,11 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/*
+ * unflatten any device tree.
+ */
+void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.7.4



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5B4D21E3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287467.487539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoB-0006v7-Nk; Tue, 08 Mar 2022 19:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287467.487539; Tue, 08 Mar 2022 19:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoB-0006op-BB; Tue, 08 Mar 2022 19:47:47 +0000
Received: by outflank-mailman (input) for mailman id 287467;
 Tue, 08 Mar 2022 19:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfo9-0004Df-Td
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e89::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d6bb113-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:43 +0100 (CET)
Received: from DS7PR06CA0032.namprd06.prod.outlook.com (2603:10b6:8:54::17) by
 DM5PR02MB3896.namprd02.prod.outlook.com (2603:10b6:4:b7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.19; Tue, 8 Mar 2022 19:47:39 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::64) by DS7PR06CA0032.outlook.office365.com
 (2603:10b6:8:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:13 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnd-000Cws-Eq; Tue, 08 Mar 2022 11:47:13 -0800
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
X-Inumbo-ID: 9d6bb113-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYtKFWu1scH24pEV6+3pn2Hh5fjHeU+xk2aIt0gL24+HQnSTok66G/FIBZvSeUl+sREj+g/0xnG9ZPCpDNyAqVg7imSiGmcj9/8b2yW29YCkY6QMon92nsH99BE5YQjdq6DWrcr/C/fBqP3aZG+SCe6KJNPCX1dcEq8ISlwuUTAuFp4VQieSyXIuQ7pD2HFHkh2f6KtXmZ9eK1VARTPl2w9CiExqe59Ki48ZC6hXR5b5RcicMyBBE3qIQlJymZXdM+vw4EvD4xZji6bSqSEDQ99E+9ur74BeQGHsl3AJ6NSLPOGzcsNPD/jE10szSTAINKrK3EMfrDN0w2C6eZwffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGOLVwYIhgLxJ0FfO3ayOZRIIs0BtuO6sjO2GpK4r3o=;
 b=myb3fS3ippQYdiWr5UhtR2sWeP6gVPADl0Dzd7ibwEIJfWDEYhNg0FAeD/muNlF6iCoN9GJ6238FAHvA+Ef8YEfeeX5X6frvM/Yjov5zZHNtkhFB99GuIBfXnzR92gGHCDjIYWIoQH78J5/qiein2dliaaudaOoZLLl76OCTEIQEkGwtWj3SD54KS4/r+m2fXZ2h35fV+mzmXfkJ2KtHuMxmXBnBQ+b4rMwq/lEmFrq8X2PgKiF6vO/R/t/mv9cWncOKFHkx4xqKKxmC2Vd6nGrxNVBhVhdwQH77F4xjhmFmecIJZXat26mNkptyRbR19n5V0mEoAGRjv3/4L2ErUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGOLVwYIhgLxJ0FfO3ayOZRIIs0BtuO6sjO2GpK4r3o=;
 b=lBnJKRZ4+KligpCfMabgh2jHuqO7BCVfA/IiQ3VfhqMd7zmuaAYoT/ZI9u8KrfKVn/KA60VrfX/r5TNUH+Q/c+vgQSncXThD2jRIOOzrzBQIUaOfFrw40GtxNNlwN/VTuCJVzDg45NFXv7DG1+ZmF5aRAlcL3Qyhn1GvigP/crg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v3 01/14] xen/arm/device: Remove __init from function type
Date: Tue, 8 Mar 2022 11:46:51 -0800
Message-ID: <20220308194704.14061-2-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef5bf915-62d3-47c2-de44-08da013c804d
X-MS-TrafficTypeDiagnostic: DM5PR02MB3896:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR02MB38965DF44C7FC9809E492E24BC099@DM5PR02MB3896.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aMV8CKYmDRUtN7YElMMfIUu31J7TQDaJuVAQUWA8w8IURSrvj4Ulhct7CZorWnuFBIrZRx3rhXOgte+uPt6OlncSAZlxJAUYbtm3mjw5IonCNcfDKfOLuXytPXEm9llNvPps2FIrmhp/qkiTaRqiL7XDRqJ+urSy62uRUkYOpr5ichdfyTH+ewoOILkIH0q1A+uoSD1/jWBQfzWIaizqEuNE6OcXJTD8gB9cv45dfUbXHv4v/SUs3iBJRHSc6ZCkDeXYt9XB9H94X2SeEwARDI7FxZsY/+yKVN/0JnsRrzE1n5WUVPsenf2ftI+HDYLiWe7FdeDR0iUSIkebrStRlWxiEeZ9Cd9Dc3HK+HDVViwyTqw/B1l0/myHdemX9vWt/FSVtNw2hOXDU+/7+o0joSpcQ9eya0ivoY+s5BKBNTLxs44NURik7IoK+SHjbQYMjv+skAKh3Ko57H5IHdVVy7XFAALZyQYdRFuIDbmX+iSRTOxzEfkuue1ceKd0VbhZQV7+XfEmrFyox4Y2HxCuAXHHc2TLgI/+ZnZINY6wkZv0DEQst4s5P2SQvjbvLcLmXgn87rPjTa4Q5Ty8iqGGTiKvl0Cha+aLzXZpD17wZJ7DzND9l8XwFb86nNnOi0CqMqzU3hAAdGVXmz2gIdVDM3LYBqEcqu+wLMwRpP9RUNlKdomLWtrth0X78ONsZQX2un1H6RevHvBcoPTPL3LA/Q==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(186003)(83380400001)(36756003)(82310400004)(2906002)(2616005)(356005)(7636003)(336012)(426003)(40460700003)(47076005)(36860700001)(1076003)(316002)(8676002)(4326008)(6916009)(54906003)(6666004)(70206006)(70586007)(30864003)(508600001)(7696005)(8936002)(9786002)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:38.7661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5bf915-62d3-47c2-de44-08da013c804d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3896

Change function type of following function to access during runtime:
    1. map_irq_to_domain()
    2. handle_device_interrupt()
    3. map_range_to_domain()
    4. unflatten_dt_node()
    5. unflatten_device_tree()

Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
device.c.

These changes are done to support the dynamic programming of a nodes where an
overlay node will be added to fdt and unflattened node will be added to dt_host.
Furthermore, IRQ and mmio mapping will be done for the added node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/device.c            | 136 +++++++++++++++++++++++++++++
 xen/arch/arm/domain_build.c      | 142 -------------------------------
 xen/arch/arm/include/asm/setup.h |   3 +
 xen/common/device_tree.c         |  20 ++---
 xen/include/xen/device_tree.h    |   5 ++
 5 files changed, 154 insertions(+), 152 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 70cd6c1a19..0dfd33b33e 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -21,6 +21,9 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/iocap.h>
+#include <asm/domain_build.h>
+#include <asm/setup.h>
 
 extern const struct device_desc _sdevice[], _edevice[];
 extern const struct acpi_device_desc _asdevice[], _aedevice[];
@@ -84,6 +87,139 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                      bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
+               d->domain_id, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * Checking the return of vgic_reserve_virq is not
+         * necessary. It should not fail except when we try to map
+         * the IRQ twice. This can legitimately happen if the IRQ is shared
+         */
+        vgic_reserve_virq(d, irq);
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
+                   irq, d->domain_id);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+    return 0;
+}
+
+int map_range_to_domain(const struct dt_device_node *dev,
+                        u64 addr, u64 len, void *data)
+{
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
+    int res;
+
+    res = iomem_permit_access(d, paddr_to_pfn(addr),
+            paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                d->domain_id,
+                addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
+        return res;
+    }
+
+    if ( !mr_data->skip_mapping )
+    {
+        res = map_regions_p2mt(d,
+                               gaddr_to_gfn(addr),
+                               PFN_UP(len),
+                               maddr_to_mfn(addr),
+                               mr_data->p2mt);
+
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
+                   " - 0x%"PRIx64" in domain %d\n",
+                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
+                   d->domain_id);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
+               addr, addr + len, mr_data->p2mt);
+
+    return 0;
+}
+
+/*
+ * handle_device_interrupts retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int handle_device_interrupts(struct domain *d,
+                             struct dt_device_node *dev,
+                             bool need_mapping)
+{
+    unsigned int i, nirq;
+    int res;
+    struct dt_raw_irq rirq;
+
+    nirq = dt_number_of_irq(dev);
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQ that have no physical meaning
+         * ie: IRQ whose controller is not the GIC
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
+                      i, dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        res = platform_get_irq(dev, i);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..b06770a2af 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1794,41 +1794,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init map_irq_to_domain(struct domain *d, unsigned int irq,
-                             bool need_mapping, const char *devname)
-{
-    int res;
-
-    res = irq_permit_access(d, irq);
-    if ( res )
-    {
-        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
-               d->domain_id, irq);
-        return res;
-    }
-
-    if ( need_mapping )
-    {
-        /*
-         * Checking the return of vgic_reserve_virq is not
-         * necessary. It should not fail except when we try to map
-         * the IRQ twice. This can legitimately happen if the IRQ is shared
-         */
-        vgic_reserve_virq(d, irq);
-
-        res = route_irq_to_guest(d, irq, irq, devname);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
-                   irq, d->domain_id);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - IRQ: %u\n", irq);
-    return 0;
-}
-
 static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
                                        const struct dt_irq *dt_irq,
                                        void *data)
@@ -1860,57 +1825,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     return 0;
 }
 
-int __init map_range_to_domain(const struct dt_device_node *dev,
-                               u64 addr, u64 len, void *data)
-{
-    struct map_range_data *mr_data = data;
-    struct domain *d = mr_data->d;
-    int res;
-
-    /*
-     * reserved-memory regions are RAM carved out for a special purpose.
-     * They are not MMIO and therefore a domain should not be able to
-     * manage them via the IOMEM interface.
-     */
-    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
-                     strlen("/reserved-memory/")) != 0 )
-    {
-        res = iomem_permit_access(d, paddr_to_pfn(addr),
-                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
-                    d->domain_id,
-                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
-            return res;
-        }
-    }
-
-    if ( !mr_data->skip_mapping )
-    {
-        res = map_regions_p2mt(d,
-                               gaddr_to_gfn(addr),
-                               PFN_UP(len),
-                               maddr_to_mfn(addr),
-                               mr_data->p2mt);
-
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
-                   " - 0x%"PRIx64" in domain %d\n",
-                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
-                   d->domain_id);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
-               addr, addr + len, mr_data->p2mt);
-
-    return 0;
-}
-
 /*
  * For a node which describes a discoverable bus (such as a PCI bus)
  * then we may need to perform additional mappings in order to make
@@ -1938,62 +1852,6 @@ static int __init map_device_children(const struct dt_device_node *dev,
     return 0;
 }
 
-/*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-static int __init handle_device_interrupts(struct domain *d,
-                                           struct dt_device_node *dev,
-                                           bool need_mapping)
-{
-    unsigned int i, nirq;
-    int res;
-    struct dt_raw_irq rirq;
-
-    nirq = dt_number_of_irq(dev);
-
-    /* Give permission and map IRQs */
-    for ( i = 0; i < nirq; i++ )
-    {
-        res = dt_device_get_raw_irq(dev, i, &rirq);
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        /*
-         * Don't map IRQ that have no physical meaning
-         * ie: IRQ whose controller is not the GIC
-         */
-        if ( rirq.controller != dt_interrupt_controller )
-        {
-            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
-                      i, dt_node_full_name(rirq.controller));
-            continue;
-        }
-
-        res = platform_get_irq(dev, i);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
-        if ( res )
-            return res;
-    }
-
-    return 0;
-}
-
 /*
  * For a given device node:
  *  - Give permission to the guest to manage IRQ and MMIO range
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 7a1e1d6798..8a26f1845c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -134,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping);
+
 int map_range_to_domain(const struct dt_device_node *dev,
                         u64 addr, u64 len, void *data);
 
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..f43d66a501 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
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
+                                       unsigned long mem,
+                                       unsigned long *p,
+                                       struct dt_device_node *dad,
+                                       struct dt_device_node ***allnextpp,
+                                       unsigned long fpsize)
 {
     struct dt_device_node *np;
     struct dt_property *pp, **prev_pp = NULL;
@@ -2047,7 +2047,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -2056,8 +2056,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+void unflatten_device_tree(const void *fdt,
+                           struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2179,7 +2179,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    unflatten_device_tree(device_tree_flattened, &dt_host);
     dt_alias_scan();
 }
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index fd6cd00b43..06d7866c10 100644
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
2.17.1



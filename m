Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A140378F7C6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594218.927491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGV-0003gN-LS; Fri, 01 Sep 2023 05:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594218.927491; Fri, 01 Sep 2023 05:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGV-0003Zj-9u; Fri, 01 Sep 2023 05:00:15 +0000
Received: by outflank-mailman (input) for mailman id 594218;
 Fri, 01 Sep 2023 05:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGT-0000Nr-HO
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1fd67f-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:11 +0200 (CEST)
Received: from CYZPR10CA0016.namprd10.prod.outlook.com (2603:10b6:930:8a::19)
 by SA1PR12MB7176.namprd12.prod.outlook.com (2603:10b6:806:2bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:00:06 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::35) by CYZPR10CA0016.outlook.office365.com
 (2603:10b6:930:8a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:05 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:04 -0500
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
X-Inumbo-ID: 6e1fd67f-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR29bI8FAsy9ByvUnBkGBKqnyF6RNK0rB8n0zKjjgv4nCNmmyaqwlacR5Cpl0gRv3T+wEZvkde92OuG0NXdnRZ2g+yUuVHdGVIT1TLLwbJ8pc6esXRIrnquSif5M3QiwPJIHaXutn540GDgIZnDk/ppeF4A+MJgUgB2FalOlv4qotLVoM/y1hMDufMLzol35dEpGGeXe5VD+5pUOTBxgjL6Ki6uueocsUvssgrFM/aWtTLvayXZtLhltNQFKjdJaP3if/Cu7UITX8i+ZjtbLmXH+Alm+o+UtV0tS+y6GYMHLasrER0etFskjmF6magxP4VyVeLQOupOGKSd/nJPb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDrA8kyZcppqpVb5vdK9SGxL7ekN3/cHqigiQ/O+H7M=;
 b=eXgBe/deS+Qb+HVzx48IgJtiTciz36fQT8p+b5LI0SeuRIfNeAAM0bmq7n/gJCuhr977Xd2wPARwegmLPae7wkHd1Rg1KkDU4/tYrcKok9kSOTQYI3H44JY55PkKDOjco40BaXKSLJTFUfl/hHafjn+F8/5UI5dfRo2GKcPsLyK+mNIhTBhsWGVwvK/SXDwMan+Xo+r5/T7NOM19YyIMMEePtz6Ffu9XE1Nvq0+y94kR7R9evVicRAdvL0SZBFQcWLI1qOohL0SjEsrPiMaBnSTIWOT35a+laM2jSs7sBmTlkapYQXpfB1rLybozgOnuICpg9es6k6HB/pcJCh3SBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDrA8kyZcppqpVb5vdK9SGxL7ekN3/cHqigiQ/O+H7M=;
 b=oTPw1n2/1wtIyUxxd/oHOZ7hGmsQ+wRd+FTm24nHWYfcI7sf5XJv76Mb7vLTbgaJ6lbnYKIZrgjARJKPxemKdVdBAzDgVOwQUIavrd6B6Ufjk8FcckXBIFguBDruy2TK3usCbgv8aYHbVV7di0sdYhGVuvlXoay4TOwbaa1DSio=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v11 03/20] xen/arm/device: Remove __init from function type
Date: Thu, 31 Aug 2023 21:59:30 -0700
Message-ID: <20230901045947.32351-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SA1PR12MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f503ac-a65e-49ba-3e31-08dbaaa84f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+MWJhJXIdlOJptjSulo38oTtTQRR04+DITU7Bc31XEhloai67ourAYq+2LRdsdSPzqPnuWs1936vKXnn+CRLKmHDDhizxA6ET5cwakZYWIefCUtWiB6eOdpQFzfv4KpsSXs60pve7CZtgpvAX6CKKmUDzhhWZYKmU+lVT+vCcUzcmjbqG3wuWCFmADXun2nvluIqvetS7SuYPVNnxZEg3x0lU0yvWn1Ct0qRDRJufCx3OmNg17lk5fhCfGtPc1DO2/kBqIdSTJnV57xYfY1s+FMjuWHvSccaRrAtwAOdLo0eeQhU2YQQXQhUljT5mV+7l6t04Y+FC/8sMxMNZ00Q4VLud7K1IwmL8uqJbAoKsetQDaKlBaahtnVy6OpzVd4VHnxa7AMgnWFDEedS6O/aDB8OoIyHA2241AuKX2nipbqISacCABZFlxfFdAvQ2hgNNwUWbHWOUW8p2NdpO/K6ROv+n2ezdyA5+1GSXJTHU0+LcNBPfc9gsmfozT/kycWV+z2IphPm4mGFDVNne4GHw/gHY33s/i7AURF6Mdi0FZQdgWZhDU2nYqlDk2VPNiTNv+TANZeaPmQ/ERxpN02fOJSwxNhVey6MaDiJAyCuKUT4bQU8Zpcu4RDOKdlMNP2QlE41W+Dg5GmkSptJgVXQVcB3I1GXXVYeAP/BphuFtcptcWCngjEz/k7ft698C7dwILkwPAPMzjZ2dNPZovre6QV8/A3yX/qvyXD+cdq5BbnV44y7piYiyYhKgZ7FsaKJyTAUw/KKFeOLQ8SO9sFM2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(41300700001)(70586007)(70206006)(2906002)(30864003)(1076003)(2616005)(5660300002)(478600001)(316002)(4326008)(54906003)(6916009)(8936002)(8676002)(44832011)(6666004)(40460700003)(36756003)(36860700001)(47076005)(26005)(40480700001)(83380400001)(81166007)(86362001)(336012)(426003)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:05.9590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f503ac-a65e-49ba-3e31-08dbaaa84f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7176

Remove __init from following function to access during runtime:
    1. map_irq_to_domain()
    2. handle_device_interrupts()
    3. map_range_to_domain()
    4. unflatten_dt_node()
    5. handle_device()
    6. map_device_children()
    7. map_dt_irq_to_domain()
Move map_irq_to_domain() prototype from domain_build.h to setup.h.

Above changes will create an error on build as non-init function are still
in domain_build.c file. So, to avoid build fails, following changes are done:
1. Move map_irq_to_domain(), handle_device_interrupts(), map_range_to_domain(),
    handle_device(), map_device_children() and map_dt_irq_to_domain()
    to device.c. After removing __init type,  these functions are not specific
    to domain building, so moving them out of domain_build.c to device.c.
2. Remove static type from handle_device_interrupts().

Also, renamed handle_device_interrupts() to map_device_irqs_to_domain().

Overall, these changes are done to support the dynamic programming of a nodes
where an overlay node will be added to fdt and unflattened node will be added to
dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
Changes from v10:
    Remove unnecessary rangeset variables  from handle_device() declaration.
    Rename handle_device_interrupts() to map_device_irqs_to_domain().
    Fix code styles.

Changes from v9:
    Move handle_device(), map_device_children() and map_dt_irq_to_domain() out
        of domain_build.c
---
---
 xen/arch/arm/device.c                   | 294 +++++++++++++++++++++++
 xen/arch/arm/domain_build.c             | 295 +-----------------------
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |   9 +
 xen/common/device_tree.c                |  12 +-
 5 files changed, 310 insertions(+), 302 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index ca8539dee5..327e4d24fb 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -9,8 +9,10 @@
  */
 
 #include <asm/device.h>
+#include <asm/setup.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
 #include <xen/lib.h>
 
 extern const struct device_desc _sdevice[], _edevice[];
@@ -75,6 +77,298 @@ enum device_class device_get_class(const struct dt_device_node *dev)
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
+        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
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
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+    return 0;
+}
+
+int map_range_to_domain(const struct dt_device_node *dev,
+                        uint64_t addr, uint64_t len, void *data)
+{
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
+    int res;
+
+    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
+    /*
+     * reserved-memory regions are RAM carved out for a special purpose.
+     * They are not MMIO and therefore a domain should not be able to
+     * manage them via the IOMEM interface.
+     */
+    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
+                     strlen("/reserved-memory/")) != 0 )
+    {
+        res = iomem_permit_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                    d->domain_id,
+                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
+            return res;
+        }
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
+ * map_device_irqs_to_domain retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int map_device_irqs_to_domain(struct domain *d,
+                              struct dt_device_node *dev,
+                              bool need_mapping)
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
+static int map_dt_irq_to_domain(const struct dt_device_node *dev,
+                                const struct dt_irq *dt_irq,
+                                void *data)
+{
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
+    unsigned int irq = dt_irq->irq;
+    int res;
+
+    if ( irq < NR_LOCAL_IRQS )
+    {
+        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
+        return -EINVAL;
+    }
+
+    /* Setup the IRQ type */
+    res = irq_set_spi_type(irq, dt_irq->type);
+    if ( res )
+    {
+        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
+               dt_node_name(dev), irq, d);
+        return res;
+    }
+
+    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
+
+    return res;
+}
+
+/*
+ * For a node which describes a discoverable bus (such as a PCI bus)
+ * then we may need to perform additional mappings in order to make
+ * the child resources available to domain 0.
+ */
+static int map_device_children(const struct dt_device_node *dev,
+                               struct map_range_data *mr_data)
+{
+    if ( dt_device_type_is_equal(dev, "pci") )
+    {
+        int ret;
+
+        dt_dprintk("Mapping children of %s to guest\n",
+                   dt_node_full_name(dev));
+
+        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
+        if ( ret < 0 )
+            return ret;
+
+        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
+        if ( ret < 0 )
+            return ret;
+    }
+
+    return 0;
+}
+
+/*
+ * For a given device node:
+ *  - Give permission to the guest to manage IRQ and MMIO range
+ *  - Retrieve the IRQ configuration (i.e edge/level) from device tree
+ * When the device is not marked for guest passthrough:
+ *  - Try to call iommu_add_dt_device to protect the device by an IOMMU
+ *  - Assign the device to the guest if it's protected by an IOMMU
+ *  - Map the IRQs and iomem regions to DOM0
+ */
+int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
+{
+    unsigned int naddr;
+    unsigned int i;
+    int res;
+    paddr_t addr, size;
+    bool own_device = !dt_device_for_passthrough(dev);
+    /*
+     * We want to avoid mapping the MMIO in dom0 for the following cases:
+     *   - The device is owned by dom0 (i.e. it has been flagged for
+     *     passthrough).
+     *   - PCI host bridges with driver in Xen. They will later be mapped by
+     *     pci_host_bridge_mappings().
+     */
+    struct map_range_data mr_data = {
+        .d = d,
+        .p2mt = p2mt,
+        .skip_mapping = !own_device ||
+                        (is_pci_passthrough_enabled() &&
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
+    };
+
+    naddr = dt_number_of_address(dev);
+
+    dt_dprintk("%s passthrough = %d naddr = %u\n",
+               dt_node_full_name(dev), own_device, naddr);
+
+    if ( own_device )
+    {
+        dt_dprintk("Check if %s is behind the IOMMU and add it\n",
+                   dt_node_full_name(dev));
+
+        res = iommu_add_dt_device(dev);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
+                   dt_node_full_name(dev));
+            return res;
+        }
+
+        if ( dt_device_is_protected(dev) )
+        {
+            dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
+            res = iommu_assign_dt_device(d, dev);
+            if ( res )
+            {
+                printk(XENLOG_ERR "Failed to setup the IOMMU for %s\n",
+                       dt_node_full_name(dev));
+                return res;
+            }
+        }
+    }
+
+    res = map_device_irqs_to_domain(d, dev, own_device);
+    if ( res < 0 )
+        return res;
+
+    /* Give permission and map MMIOs */
+    for ( i = 0; i < naddr; i++ )
+    {
+        res = dt_device_get_paddr(dev, i, &addr, &size);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        res = map_range_to_domain(dev, addr, size, &mr_data);
+        if ( res )
+            return res;
+    }
+
+    res = map_device_children(dev, &mr_data);
+    if ( res )
+        return res;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 54bf5623c8..ff4fc30769 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2293,299 +2293,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
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
-        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
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
-            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - IRQ: %u\n", irq);
-    return 0;
-}
-
-static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
-                                       const struct dt_irq *dt_irq,
-                                       void *data)
-{
-    struct map_range_data *mr_data = data;
-    struct domain *d = mr_data->d;
-    unsigned int irq = dt_irq->irq;
-    int res;
-
-    if ( irq < NR_LOCAL_IRQS )
-    {
-        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
-        return -EINVAL;
-    }
-
-    /* Setup the IRQ type */
-    res = irq_set_spi_type(irq, dt_irq->type);
-    if ( res )
-    {
-        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
-               dt_node_name(dev), irq, d);
-        return res;
-    }
-
-    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
-
-    return res;
-}
-
-int __init map_range_to_domain(const struct dt_device_node *dev,
-                               uint64_t addr, uint64_t len, void *data)
-{
-    struct map_range_data *mr_data = data;
-    struct domain *d = mr_data->d;
-    int res;
-
-    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
-    {
-        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
-               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
-        return -ERANGE;
-    }
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
-/*
- * For a node which describes a discoverable bus (such as a PCI bus)
- * then we may need to perform additional mappings in order to make
- * the child resources available to domain 0.
- */
-static int __init map_device_children(const struct dt_device_node *dev,
-                                      struct map_range_data *mr_data)
-{
-    if ( dt_device_type_is_equal(dev, "pci") )
-    {
-        int ret;
-
-        dt_dprintk("Mapping children of %s to guest\n",
-                   dt_node_full_name(dev));
-
-        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
-        if ( ret < 0 )
-            return ret;
-
-        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
-        if ( ret < 0 )
-            return ret;
-    }
-
-    return 0;
-}
-
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
-/*
- * For a given device node:
- *  - Give permission to the guest to manage IRQ and MMIO range
- *  - Retrieve the IRQ configuration (i.e edge/level) from device tree
- * When the device is not marked for guest passthrough:
- *  - Try to call iommu_add_dt_device to protect the device by an IOMMU
- *  - Assign the device to the guest if it's protected by an IOMMU
- *  - Map the IRQs and iomem regions to DOM0
- */
-static int __init handle_device(struct domain *d, struct dt_device_node *dev,
-                                p2m_type_t p2mt)
-{
-    unsigned int naddr;
-    unsigned int i;
-    int res;
-    paddr_t addr, size;
-    bool own_device = !dt_device_for_passthrough(dev);
-    /*
-     * We want to avoid mapping the MMIO in dom0 for the following cases:
-     *   - The device is owned by dom0 (i.e. it has been flagged for
-     *     passthrough).
-     *   - PCI host bridges with driver in Xen. They will later be mapped by
-     *     pci_host_bridge_mappings().
-     */
-    struct map_range_data mr_data = {
-        .d = d,
-        .p2mt = p2mt,
-        .skip_mapping = !own_device ||
-                        (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
-    };
-
-    naddr = dt_number_of_address(dev);
-
-    dt_dprintk("%s passthrough = %d naddr = %u\n",
-               dt_node_full_name(dev), own_device, naddr);
-
-    if ( own_device )
-    {
-        dt_dprintk("Check if %s is behind the IOMMU and add it\n",
-                   dt_node_full_name(dev));
-
-        res = iommu_add_dt_device(dev);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
-                   dt_node_full_name(dev));
-            return res;
-        }
-
-        if ( dt_device_is_protected(dev) )
-        {
-            dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
-            res = iommu_assign_dt_device(d, dev);
-            if ( res )
-            {
-                printk(XENLOG_ERR "Failed to setup the IOMMU for %s\n",
-                       dt_node_full_name(dev));
-                return res;
-            }
-        }
-    }
-
-    res = handle_device_interrupts(d, dev, own_device);
-    if ( res < 0 )
-        return res;
-
-    /* Give permission and map MMIOs */
-    for ( i = 0; i < naddr; i++ )
-    {
-        res = dt_device_get_paddr(dev, i, &addr, &size);
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        res = map_range_to_domain(dev, addr, size, &mr_data);
-        if ( res )
-            return res;
-    }
-
-    res = map_device_children(dev, &mr_data);
-    if ( res )
-        return res;
-
-    return 0;
-}
-
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -3038,7 +2745,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = handle_device_interrupts(kinfo->d, node, true);
+    res = map_device_irqs_to_domain(kinfo->d, node, true);
     if ( res < 0 )
         return res;
 
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 34ceddc995..b9329c9ee0 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,8 +4,6 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
-int map_irq_to_domain(struct domain *d, unsigned int irq,
-                      bool need_mapping, const char *devname);
 int make_chosen_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 19dc637d55..6cda3e4039 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -165,6 +165,15 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+int handle_device(struct domain *d, struct dt_device_node *dev,
+                  p2m_type_t p2mt);
+
+int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
+                              bool need_mapping);
+
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                      bool need_mapping, const char *devname);
+
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
 
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index b6d9f018c6..fccf98f94e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1847,12 +1847,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
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
-- 
2.17.1



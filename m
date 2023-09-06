Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9637793363
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596119.929901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhM4-0004OI-Hx; Wed, 06 Sep 2023 01:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596119.929901; Wed, 06 Sep 2023 01:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhM4-0004MJ-Eu; Wed, 06 Sep 2023 01:29:16 +0000
Received: by outflank-mailman (input) for mailman id 596119;
 Wed, 06 Sep 2023 01:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA7-0006tr-HC
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:55 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20615.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1065a1e5-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:54 +0200 (CEST)
Received: from MN2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:208:178::31)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 01:16:50 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::b8) by MN2PR19CA0018.outlook.office365.com
 (2603:10b6:208:178::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:46 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:45 -0500
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
X-Inumbo-ID: 1065a1e5-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXt5SUSwssXIp8tIHllnOsBvYQPAwvCwWH82uXfET8Uzpk31nU+Gqq04mV972bipR49aszBx27Y2X/B+p2Fn3YEN6zXCV+Nsdh7C+N9WNFXv3T+29NWw7LYzsd4ZW+QCyCHoP8tnAgN1srIA/0bMGRglOPzE+4DR1lu/PnxBVa/zc0aS/A0lqmKViqC+oZalTYE0LdaMBM+E3+lyUDnTlQVuTZIvDcrzIpOmXJi/JGD1sAJwnjgGxsJLo7LHYiURogJuskau9Xyeb+QlxIiwIZLbpIKDRt/wdjQCnyKBp7/xFeLZwic+Xbzs4U65UL+xb5geiPDWEG6i8PynPK67dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stho6rkmy8rK1oECb+GLo4R5AalHWAkc6H9ty4aMTD0=;
 b=Dka0VPYq/EzD/G2y4GfxRcFI+3837lkPUsVs/oPMH131ZMKa6f7HBXxsjLlh12ZJ6ot9ecqurEVw9v3q1QqSe1YJiOzYloaPdqhNCXSo2I5PkuaM/6h9jQaIgGtvPqAs4PkpoEwh2LIum3ECwsJN/sFKaDhpMLl1FC6QpOZ9jNYcFrXnyCqDY5E1bCI1RfiFMKWGRik9UOdXC2qRu7z2OLQ4pPOs8H3MLAdt4ArcFfR1bKsMIN8njM2t7Z48qC7Tv6I7c6uX8UjGLMLczrOaF3uwUQW7BOUwDycsJ3XFa68TdOY7dXWXbhUVx8UVsOZzLRWtw5nGxV7npwuuC1fSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stho6rkmy8rK1oECb+GLo4R5AalHWAkc6H9ty4aMTD0=;
 b=1F4SU6rl2ubSDbP3yT/NCUHgWy9x5bIHPKnMmMEcP3DsQY2fWXCdBPkTRmP9xFfLwcYxWbbiKhTEwVjIigr1MxqybFc5tusz+mmu6Brtrs3pygvrUogK2fO3PIGt80gQUod5D2vtnUVZkJ5CeMKWyAIaktsb+CK1sJeWAxklD3Y=
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
Subject: [XEN][PATCH v12 15/20] arm/asm/setup.h: Update struct map_range_data to add rangeset.
Date: Tue, 5 Sep 2023 18:16:25 -0700
Message-ID: <20230906011631.30310-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a799134-2e38-4d71-a30b-08dbae76f29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1CUM1Nxp7aG+Ebhf1czbVBk6GNv7gSznYVfOfFmE6xq2024ayKXslt69KEFjgkIsBRl6dBNrSeffQYjirGz601mBVBzjVw3nHqIP+jjMUJFRAo28oAFJOll7fU7cAvdzjp2RCz5tqT8Uc6iMS4Ev2JqSBsVM8YZBQrh9yhoLZ19g9H5Qp0MhnztB4v4xNsMFpjO4HuPCCyadC6oNcFEnA1LrSbHd+ItxvISvsvDL63/YEMUMAasD29y2mQHU89N60hZvC1D4UYOdLu5incfhso0qwjqupanLuoMSNFZvGDRAcycciH7pPIXUGHr1J6/huAKIpjNJLjtH+fjxYdZNw++yDb+mZp70IpYjUOVSdy/B66v5nc1RcTEuvGqejqVr2sdUJYSnUGtGAgpTdxRhwX6GPtx6rLfrrPiNeNbZ+Ba7k+k/cpR2ODSCGEH1HX/DS/DkfPJDuIH7x/K0oPG6Vn2gG5M4R8VzBhyLg4iVuU+P4RhCY32Z8FJbPQqm49lKHdJ+mw1o3lLi/Mm4fXo9saHYTSViq6C4IWm+vTafMoC1i2yazm66fjolVwQpzmtUApsB0git7voLcnait6VNOlSgLfGTZrP1rWqiL5lP5JFsJKZUb8Ck+/0+WowJ//zQ+8avozkhebPcXjUEcXi2A89km0bMj7pNEYLN54Ln8pSLMM/7jkBoFkERteYeP0OaSIQSeBMMrQt68SNnjgg46aRWq6v9vTulZHYX35SkJtWEaphb8JnHeGklWBF03O7bBS4/XNhi0SV90bIgiK0CcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(6666004)(478600001)(83380400001)(1076003)(2616005)(26005)(336012)(426003)(2906002)(44832011)(6916009)(54906003)(41300700001)(316002)(70206006)(70586007)(5660300002)(4326008)(8676002)(8936002)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(86362001)(81166007)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:50.2379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a799134-2e38-4d71-a30b-08dbae76f29d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353

Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
node addition/removal operations. With overlay operations, new IRQs and IOMEMs
are added in dt_host and routed. While removing overlay nodes, nodes are removed
from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
IOMEM and IRQ ranges for overlay remove ops.

Dynamic overlay node add/remove will be introduced in follow-up patches.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes from v10:
    Replace paddr_to_pfn(PAGE_ALIGN()) with paddr_to_pfn_aligned().
    Change data type of irq.
    fix function change for handle_device().
    Remove unnecessary change .d = d in mr_data.
---
---
 xen/arch/arm/device.c            | 43 +++++++++++++++++++++++++-------
 xen/arch/arm/domain_build.c      |  4 +--
 xen/arch/arm/include/asm/setup.h |  9 ++++---
 3 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 327e4d24fb..1f631d3274 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -165,6 +165,15 @@ int map_range_to_domain(const struct dt_device_node *dev,
     dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
                addr, addr + len, mr_data->p2mt);
 
+    if ( mr_data->iomem_ranges )
+    {
+        res = rangeset_add_range(mr_data->iomem_ranges,
+                                 paddr_to_pfn(addr),
+                                 paddr_to_pfn_aligned(addr + len - 1));
+        if ( res )
+            return res;
+    }
+
     return 0;
 }
 
@@ -178,10 +187,11 @@ int map_range_to_domain(const struct dt_device_node *dev,
  */
 int map_device_irqs_to_domain(struct domain *d,
                               struct dt_device_node *dev,
-                              bool need_mapping)
+                              bool need_mapping,
+                              struct rangeset *irq_ranges)
 {
     unsigned int i, nirq;
-    int res;
+    int res, irq;
     struct dt_raw_irq rirq;
 
     nirq = dt_number_of_irq(dev);
@@ -208,17 +218,24 @@ int map_device_irqs_to_domain(struct domain *d,
             continue;
         }
 
-        res = platform_get_irq(dev, i);
-        if ( res < 0 )
+        irq = platform_get_irq(dev, i);
+        if ( irq < 0 )
         {
             printk(XENLOG_ERR "Unable to get irq %u for %s\n",
                    i, dt_node_full_name(dev));
-            return res;
+            return irq;
         }
 
-        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
+        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
         if ( res )
             return res;
+
+        if ( irq_ranges )
+        {
+            res = rangeset_add_singleton(irq_ranges, irq);
+            if ( res )
+                return res;
+        }
     }
 
     return 0;
@@ -249,6 +266,11 @@ static int map_dt_irq_to_domain(const struct dt_device_node *dev,
     }
 
     res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
+    if ( res )
+        return res;
+
+    if ( mr_data->irq_ranges )
+        res = rangeset_add_singleton(mr_data->irq_ranges, irq);
 
     return res;
 }
@@ -289,7 +311,8 @@ static int map_device_children(const struct dt_device_node *dev,
  *  - Assign the device to the guest if it's protected by an IOMMU
  *  - Map the IRQs and iomem regions to DOM0
  */
-int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
+int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
+                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges)
 {
     unsigned int naddr;
     unsigned int i;
@@ -308,7 +331,9 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
         .p2mt = p2mt,
         .skip_mapping = !own_device ||
                         (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
+        .iomem_ranges = iomem_ranges,
+        .irq_ranges = irq_ranges
     };
 
     naddr = dt_number_of_address(dev);
@@ -342,7 +367,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
         }
     }
 
-    res = map_device_irqs_to_domain(d, dev, own_device);
+    res = map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
     if ( res < 0 )
         return res;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ff4fc30769..29dcbb8a2e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2402,7 +2402,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                "WARNING: Path %s is reserved, skip the node as we may re-use the path.\n",
                path);
 
-    res = handle_device(d, node, p2mt);
+    res = handle_device(d, node, p2mt, NULL, NULL);
     if ( res)
         return res;
 
@@ -2745,7 +2745,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = map_device_irqs_to_domain(kinfo->d, node, true);
+    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
     if ( res < 0 )
         return res;
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cda3e4039..b8866c20f4 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -113,6 +113,9 @@ struct map_range_data
     p2m_type_t p2mt;
     /* Set if mapping of the memory ranges must be skipped. */
     bool skip_mapping;
+    /* Rangeset to store IRQs and IOMEM for overlay nodes. */
+    struct rangeset *iomem_ranges;
+    struct rangeset *irq_ranges;
 };
 
 extern struct bootinfo bootinfo;
@@ -165,11 +168,11 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
-int handle_device(struct domain *d, struct dt_device_node *dev,
-                  p2m_type_t p2mt);
+int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
+                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
 int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
-                              bool need_mapping);
+                              bool need_mapping, struct rangeset *irq_ranges);
 
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510578817F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590562.922993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRms-0002id-F2; Fri, 25 Aug 2023 08:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590562.922993; Fri, 25 Aug 2023 08:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmr-0002VD-H0; Fri, 25 Aug 2023 08:03:21 +0000
Received: by outflank-mailman (input) for mailman id 590562;
 Fri, 25 Aug 2023 08:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmk-0007G4-P1
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5cc5d26-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:13 +0200 (CEST)
Received: from MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:08 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::42) by MW4PR03CA0296.outlook.office365.com
 (2603:10b6:303:b5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:07 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:06 -0500
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
X-Inumbo-ID: d5cc5d26-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSsOTsv5SYkcalJtf1erOn8A0zxKP7qkGcOMnuhdQEbq2fn8KSO3+B829NqxuGywbWClB/pR8l9hKRimYaqpcdO48Eg+ve+BeblvGDY4vs6WxTtKZvcJ0+odIRV/bMhu0N6liBXZRyPEHqWQ5CODZMwNiQpmvnzXu9v0RsFYcuOmke7tTtX54S3KFYiWBEMi0XUQ7DdkLZks92rpim5gqwFb8K3T0hAEUxoRaGKqkDQGQGVqC0KSaQOh18FheRm05zUzzGpSq6rQFVUQ2VrHEN2srFLVkwiYkt1+u0q344YilNcylTMqPhCDNywS9r1gz7Zun7QlugweZ5CmGsd9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLOhd+eCdzsILcS2OSpdjdN9Er/z7fDSt3+c00KeABo=;
 b=PKJAFiY0PDzzDqhxfyOKTzrkVgqqOljxXLtiVr2SIpAbZIzvRXrlToN5VaDcjqRHkx31XTL2S9UR/CRR0Nv1o3gJljTIgRO+s4JWedAwqGqcbl7ht1OUFUY5xlJABMJdKo6T7plk/F3znaluSEBGoCap6Z8HTA8Gxs5s7IX9xYKpE80ibDmTZPpaTUyJ2QtuNdmaxA+u1HEsdpywDYC4GnedmHJPfAAvpORPuEeq2b1jglcfKqdxK918dqgu5hSct/H8BJSNU8XA0nDxwdtvtKJrtIrvtdryiVkvYGvFfgX50q7OAnVcsJ/oGO+J+TsBq0hv29ZswHo9wv79xaKHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLOhd+eCdzsILcS2OSpdjdN9Er/z7fDSt3+c00KeABo=;
 b=qVKo3AqFfsJZ3Dph5zczmfQOO2xkJQYOuIWWyKPCnYMegxFJpO2G5j4R08/j3+r8wtbGjNOT9rvzqArpgi7RqaMfG+hPQQi5OKeVr0Yu/K6nDeLWu8CAP/hZJO52PsPcdvGRruhw5zzwbSq7fLI5mjru3uiba5tf7tsrHaqsEZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v10 15/20] arm/asm/setup.h: Update struct map_range_data to add rangeset.
Date: Fri, 25 Aug 2023 01:02:17 -0700
Message-ID: <20230825080222.14247-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: d63acfd1-83ff-439a-b564-08dba541b7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g9X/AsVV56MBJoI6K9WkCBJaEb1tkn/mw27WNB3jZleSVN6H52MuzvEeqOTNTAnNCxvsGFsam4+Jg7l31Gs04LylPCzi/fNMdkI/sFbj9clE9QQ0VD5sHnN8TF5TG1vsE9ZKPDpcDzDc60P8yniVpJIWwHRuLV2Hs6P/ZRicbKTlqzedCdhEdNCnzOI8ffUaTnNSKktWnWLo0WpYoNitx2/TVy/BQCED3W+HSC4RtkmTaWEiK0V6EJqbIsNLzGIT4G5E0QXdZxHd5rQu5zz8a+MStUZHSzDvgtx5lq/7egnhp/FsRD1YoGhgKKHTowt+k1myQA6rtq13YLQgl2pT4sULznmr296qonGb4x+dzHEQwHj9Wrp6iWMxSjFbQFCvKGbZ+Qm3vQj2XgJSoAvpp0shQVqYC8lVlameRxVimX7G3ga3jKQTW8hPF9lS7AnxV8CR680Zle5u/oOddVl10tzsMk2uKT319gbvrF27iQFHXpDTIZFxSpo4iFNwoG3TiV7Uwguxy5wLK80Fji2CUX8To/ED5791PqWMFvb40nWFdLGvGo/05DZld4jYrotaor6JP5/E0NePn33wAuD/v1RhRP8D18luCpmhQstSfm2ERCZgk8wi/cAHFC45l62u0QK37SFnVo8o82DSy/vxZGEQudwPsTbrYmpcu9ymttrP1t9BZNXyJOPLodwt/chMG1VlhpeFQkqRr3dm1oGau+jIL5j0SOJlUYcfMZG3ptZYLS9fVJnjiTKMF/0IX0Sb4mfc4nqrw5BJd0JI/MOVaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(186009)(82310400011)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(54906003)(70586007)(70206006)(316002)(81166007)(6916009)(478600001)(26005)(40480700001)(6666004)(82740400003)(41300700001)(86362001)(2906002)(356005)(8676002)(8936002)(83380400001)(2616005)(40460700003)(4326008)(5660300002)(47076005)(44832011)(1076003)(426003)(336012)(36756003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:07.8196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d63acfd1-83ff-439a-b564-08dba541b7e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
node addition/removal operations. With overlay operations, new IRQs and IOMEMs
are added in dt_host and routed. While removing overlay nodes, nodes are remove
from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
IOMEM and IRQ ranges for overlay remove ops.

Dynamic overlay node add/remove will be introduced in follow-up patches.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/arch/arm/device.c            | 43 +++++++++++++++++++++++++-------
 xen/arch/arm/domain_build.c      |  4 +--
 xen/arch/arm/include/asm/setup.h |  5 +++-
 3 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 857f171a27..9df37abac8 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -165,6 +165,14 @@ int map_range_to_domain(const struct dt_device_node *dev,
     dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
                addr, addr + len, mr_data->p2mt);
 
+    if ( mr_data->iomem_ranges )
+    {
+        res = rangeset_add_range(mr_data->iomem_ranges, paddr_to_pfn(addr),
+                                 paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+        if ( res )
+            return res;
+    }
+
     return 0;
 }
 
@@ -178,9 +186,10 @@ int map_range_to_domain(const struct dt_device_node *dev,
  */
 int handle_device_interrupts(struct domain *d,
                              struct dt_device_node *dev,
-                             bool need_mapping)
+                             bool need_mapping,
+                             struct rangeset *irq_ranges)
 {
-    unsigned int i, nirq;
+    unsigned int i, nirq, irq;
     int res;
     struct dt_raw_irq rirq;
 
@@ -208,17 +217,24 @@ int handle_device_interrupts(struct domain *d,
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
@@ -249,6 +265,11 @@ static int map_dt_irq_to_domain(const struct dt_device_node *dev,
     }
 
     res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
+    if ( res )
+        return res;
+
+    if ( mr_data->irq_ranges )
+        res = rangeset_add_singleton(mr_data->irq_ranges, irq);
 
     return res;
 }
@@ -289,7 +310,8 @@ static int map_device_children(const struct dt_device_node *dev,
  *  - Assign the device to the guest if it's protected by an IOMMU
  *  - Map the IRQs and iomem regions to DOM0
  */
-int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
+int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
+                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges)
 {
     unsigned int naddr;
     unsigned int i;
@@ -304,10 +326,13 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
      *     pci_host_bridge_mappings().
      */
     struct map_range_data mr_data = {
+        .d = d,
         .p2mt = p2mt,
         .skip_mapping = !own_device ||
                         (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
+        .iomem_ranges = iomem_ranges,
+        .irq_ranges = irq_ranges
     };
 
     naddr = dt_number_of_address(dev);
@@ -341,7 +366,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
         }
     }
 
-    res = handle_device_interrupts(d, dev, own_device);
+    res = handle_device_interrupts(d, dev, own_device, irq_ranges);
     if ( res < 0 )
         return res;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 63ca9ea5fe..8e9dd0c373 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2401,7 +2401,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                "WARNING: Path %s is reserved, skip the node as we may re-use the path.\n",
                path);
 
-    res = handle_device(d, node, p2mt);
+    res = handle_device(d, node, p2mt, NULL, NULL);
     if ( res)
         return res;
 
@@ -2744,7 +2744,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return -EINVAL;
     }
 
-    res = handle_device_interrupts(kinfo->d, node, true);
+    res = handle_device_interrupts(kinfo->d, node, true, NULL);
     if ( res < 0 )
         return res;
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 1a052ed924..2dc6d4c1a6 100644
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
@@ -169,7 +172,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
 int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
-                             bool need_mapping);
+                             bool need_mapping, struct rangeset *irq_ranges);
 
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
-- 
2.17.1



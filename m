Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255378F7E1
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594328.927669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS5-0007Qd-RT; Fri, 01 Sep 2023 05:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594328.927669; Fri, 01 Sep 2023 05:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS5-0007Mc-MD; Fri, 01 Sep 2023 05:12:13 +0000
Received: by outflank-mailman (input) for mailman id 594328;
 Fri, 01 Sep 2023 05:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGr-0001Hn-Er
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7afcc685-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:33 +0200 (CEST)
Received: from DM6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:5:190::18)
 by PH7PR12MB6740.namprd12.prod.outlook.com (2603:10b6:510:1ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Fri, 1 Sep
 2023 05:00:28 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::25) by DM6PR11CA0005.outlook.office365.com
 (2603:10b6:5:190::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:27 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:26 -0500
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
X-Inumbo-ID: 7afcc685-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eimMht/BIbCOaf4Ab03L1N9il/aUNePqR6JzU/ebpvo5l3ZqoHsY6GBTzE5LwUS7a8tZnpH7AC/dEfu6J6gREhdBHncIlIXyNq6cfhlKpKQSTDMw/BFcLLiPXm+E3cTyC3YPVHctmyeITnHB50DY1C3vAnYxiea98uI/+60kH6AknCm9ETcvSojiVTN5AwR0yibyG2UNk0fe9Q/whb0PIv277QYw+CmSjaCWKjBtjrh8AA0hwUGm2t5jYcqbTSdrHrAO4wiRrvPTx1IBXghBM47oXU9Buo7u8XCt5bX2nD47i/6wjnfLzRFidg0wP/sh4CCakrrRt7KnLHrRdxEsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y81wVIygGPJh0Ydvh/80eu9K2SfjYwEv+GVsIT2ZkAI=;
 b=WscnBkmj25k8sndAXPLH4wTyEd6XndZui0vF8E8+RY9LaOQYpwfVU+/N1lVo9D3AG9bOxyaUrLZzNyecRt8JDVK6rZTVx9nswzwiC8DVHebHGzdMqNJl9j9q/ZJYnDDRv15TUQTo/3RB3Zbmo3wDJsXF2boWYdIJQotjcq8wtHvsyPUc/Y5jgfmtRus9shNy6SKMr4CJK4e7xQ5J2JRiEk48FGHFVZvKoPovKdLtQMweCuuRxrfMi+/a243g3INwIFqfRal35G+5fiF5xkN2lYAJ3R7J2pZEfmIdouTwVwXnfCeRWRMCUK6kEi/4bg4JvlnOj0BPXvNyZ0Iid9DKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y81wVIygGPJh0Ydvh/80eu9K2SfjYwEv+GVsIT2ZkAI=;
 b=NBpNAVxSMHznO3GuBJYlw/rXwu2ca+1x8hBrDZMr19ZHjkZDur6kVO5EtkPcT0TYlXFeDzZDnOPwFtOkUaTZCT9phnnLEFX5noDDWreS4Tqn/zo2RgFaOUWLhjOOgVjL6apXkvxWcTqvKkvhk/JlIcFXyTvMzZvvf9F4/092qRM=
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
Subject: [XEN][PATCH v11 15/20] arm/asm/setup.h: Update struct map_range_data to add rangeset.
Date: Thu, 31 Aug 2023 21:59:42 -0700
Message-ID: <20230901045947.32351-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|PH7PR12MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a558305-c284-4366-c0af-08dbaaa85c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xQ5sVp8HbXryancRsEbIf5Q07n0zB/qU6d56xod1I0uBQmu84z0MyC21x5lkWgfFUYyfp0xypEGfQZBiUU/eGUy6k+TD3ss4Xf74PfpR+OGq/ybXGYgyjU0ik0ukD6fHLh1iRiliyHxF2SAfrZvXBD20TBDumszO9YDBN0HXbCW+MIgNx3pm9fWfAV4FWMpU5xXpIDviDwKXgGwCf++EOExbJCzlnkBQ8yzAGh9Ozso16sAZpLEcPYhm+uHu2Lp0iQruMvOUhNO2Nnyz7a0bvqKTMq9VUp2fooKwNEKUVI8VUZmtXsgcw/pkHdWT0XBx8m/zOe5XRCYZMUINZbwnwdHWftEZftqNV76/QGXi+oRdy5AHX/zlQzG4eTor5kqZHVHqs2a/AfiekLxCVsD8fgC/myF5SDctlWadz1yGhkgRvW7COIXNiaCqAU0iXcPLGr8KJF17EdjQrzwQxdVmRpW9jBcivIMsyNkhBT2OfzQqlnvQP29bVH7sa5tlp2AMwR/+ZepyGEoSMUQWbiWpKjBUftWMtkZNshymH0hb8qHgNWiatvTpb2T//w8MXk5q63tALNDEb1+mZNOj7PTx6S7uTCeaHGKJG0Se2SEKZqJpwJf7lKaGRWOQbjAuHYtTmYyd+BhfI7jjcZUJLz4pPrri0+KMwVkof54sN6iOyEOHFsrdFiw2QBQ+daFxjbJfyyKEOyTtjhLVLeiQ8MiSSsdT85QdTbqGwTn7IuQMPivCfzReP9rRFqfiGYkBkVAcNI+GfMQZHYeXjY9Jx3aTRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(186009)(82310400011)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(26005)(1076003)(426003)(336012)(47076005)(36860700001)(5660300002)(44832011)(6666004)(82740400003)(356005)(478600001)(8936002)(8676002)(81166007)(4326008)(86362001)(2616005)(83380400001)(70586007)(54906003)(2906002)(6916009)(36756003)(316002)(70206006)(41300700001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:28.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a558305-c284-4366-c0af-08dbaaa85c66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6740

Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
node addition/removal operations. With overlay operations, new IRQs and IOMEMs
are added in dt_host and routed. While removing overlay nodes, nodes are removed
from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
IOMEM and IRQ ranges for overlay remove ops.

Dynamic overlay node add/remove will be introduced in follow-up patches.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

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



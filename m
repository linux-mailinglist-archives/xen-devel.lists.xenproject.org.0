Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E648E708A26
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536552.834990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkrg-0005JQ-LV; Thu, 18 May 2023 21:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536552.834990; Thu, 18 May 2023 21:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkrg-0005HI-IQ; Thu, 18 May 2023 21:08:48 +0000
Received: by outflank-mailman (input) for mailman id 536552;
 Thu, 18 May 2023 21:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkrf-0003gZ-BP
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:08:47 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b72a6b1-f5c0-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:08:44 +0200 (CEST)
Received: from BN8PR07CA0016.namprd07.prod.outlook.com (2603:10b6:408:ac::29)
 by BN9PR12MB5081.namprd12.prod.outlook.com (2603:10b6:408:132::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 21:08:39 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::8) by BN8PR07CA0016.outlook.office365.com
 (2603:10b6:408:ac::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20 via Frontend
 Transport; Thu, 18 May 2023 21:08:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 21:08:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:08:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 14:08:37 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:08:35 -0500
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
X-Inumbo-ID: 2b72a6b1-f5c0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6WW65et7SmaGgTg5sJM1Q8PstoYCaCDY3/JxtcnREc+YqnnQpeQFEVe6MvbTzEctfHmr48CYi2pvfhdPJbzr2fflTpyXXPRWiOG+un7yYLc7xTw/RrQ4ielcD+kfVDDPnq6C2Nxw804n+m72/2p+Pe3svrWFoedveQKnGWjgLXIGzboD4PezmniSqEaPH/IZEN4EXL3SzGdJ0ravY/T4nGNw8IGqCSZtxHPHJYqG2BJnvo3C5GAF8oCjehql4aUiHE4pH7Jx3zkLo2WNIm+wBB/973Djoep/QxnpMGMV6crGTcCOmyBKX89+Bh/Sd8S09VXDbLYFyloFAcimQNelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSpUUbvq9wCcX8m7HccnIFgrdTbsnGWDdpMq97CInwY=;
 b=I4fHFXAkiIC9utfHkR4Q3f68Hwg3tXaDiEJNCsal2dVHRIKX35XVtHAOTt5/h5RSeJJ0de3MTjlWFzwBrn/dGqBKK9YrYy47HbBVSuToOL2t35M2AQ2ie6U7Wk+x9cSdtobqxYKU6H+ZjvKctQuf8xpW1Jf6GMCKAaIvRa9pMazsQi0VO1WYa8wClcnFXVE0p7fA1xc9835ZEENxHKNnoxNtSdQrABd/xS1Do5jCva3Fj+YCsgB/VX+aJeDiUL0q+23KjVsGb2q9ZuXXjB/68f7DRzRefLTDrUXrP7yL+kRgnrtcfYrnBRjTQssUXbl1NexJAeqR2OlZgHo0StoijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSpUUbvq9wCcX8m7HccnIFgrdTbsnGWDdpMq97CInwY=;
 b=aUp4+jQxryUu9eTHHya1t3zNwGru+pGLp+GPoKHqCStNduirnAQpKsBfqfBLsqZAS/7J5tAr62AZbLOpFhI6vAK1/lHd1sohN3Zrpmnc3mLjVYlf2XJQn65tMQMX4eJVWCOSIlADCnyxRa/hYs4D2Vvqi5MxHHBNyxUnMBpT0yY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v3 3/6] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Date: Thu, 18 May 2023 17:06:55 -0400
Message-ID: <20230518210658.66156-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518210658.66156-1-stewart.hildebrand@amd.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|BN9PR12MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f549cc-d34e-43c8-f4dc-08db57e40cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eORbxfv7AXDuo/z6znZIQYxXHfgAxg1YA9IsHee/4OxDcYXq0JdgHfg9MSWjddNUCR10PET3GF8v40pgLw5aFLnf5QcFSvARi1B99WXETroOgFDDc91dF0HPLaBhIMO5Yx8yXz4s2OaeK/OjuvxJA6PdHdV6HJuXgTZDrfV5aOHsb3uTC3Xw0SGMy5DhO1fVVYr7cWr7zu/ZrY+v3jvcwljwAu41JJv8V1Bx1yDAdOaoIZMPkLEYXZcksN5jcrT8M+5zQdVHBHlFnIXzDlNkwuAQC6ZUJNugJPe5lIEulTt35WvTZ653cEpT1R1pS9rKea5qgj/iciXIPPLO9gqYvtPg8aVDwyodndVIHYvC+Pg9Bz+WPLdtmdvgO7qpHykexvxNk0hEBr1FG3BBBJ/raQrxPrSBZM5TKfjDQSpemcrb5s3+QEj+1oeF4230bScf+4MrWLOL3dmlLYNnklzU69l5ZhnQNQ1flpIBGCQe+5su/rOdW/DM5RJz6/31NedoH3H0iLOsd6C7CkbWVs6njK+K1UraZRG77rR+Ckgabzm5JI7768QVOfvkfwjppTuCHkrMicVXL1U73VZMJRlK8IAQ6cx6OlBomTypAuEpR+vbi8A89YvLjEddTGQ+n6fz4nGu3mAS8+9lgTJ/lNzKdiT4QV4LKkzY9Ug6tpi0yqTKwBxDjBbiBoApCfSRyzQbHLJbi7spGfM9G9gWO2kGkzVUDsimK4qb3MOIQiHvi024ZQbrdNKpITHWoiEfeT4xuhnk8YXmaFw1DsTXMeno0Iijos0Lf6dZU0JxGK51cmjvYIK+VR44RoNoLqS5kivTfBDoTYoH+h+J8oQKmkltXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(316002)(2906002)(478600001)(41300700001)(6916009)(4326008)(8936002)(8676002)(54906003)(44832011)(6666004)(70586007)(70206006)(5660300002)(966005)(1076003)(26005)(40460700003)(82740400003)(356005)(186003)(40480700001)(2616005)(47076005)(36756003)(36860700001)(83380400001)(82310400005)(86362001)(81166007)(426003)(336012)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:08:38.4849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f549cc-d34e-43c8-f4dc-08db57e40cff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5081

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves in almost the same way as existing iommu_add_dt_device API,
the difference is in devices to handle and DT bindings to use.

The function of_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

XXX: I don't port pci_for_each_dma_alias from Linux which is a part
of PCI-IOMMU bindings infrastucture as I don't have a good understanding
for how it is expected to work in Xen environment.
Also it is not completely clear whether we need to distinguish between
different PCI types here (DEV_TYPE_PCI, DEV_TYPE_PCI_HOST_BRIDGE, etc).
For example, how we should behave here if the host bridge doesn't have
a stream ID (so not described in iommu-map property) just simple
fail or bypasses translation?

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
* renamed function
  from: iommu_add_dt_pci_device
  to: iommu_add_dt_pci_sideband_ids
* removed stale ops->add_device check
* iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TREE
* iommu.h: add iommu_add_pci_sideband_ids helper
* iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* remove extra devfn parameter since pdev fully describes the device
* remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, rely on
  the existing iommu call in iommu_add_device().
* move the ops->add_device and ops->dt_xlate checks earlier

downstream->v1:
* rebase
* add const qualifier to struct dt_device_node *np arg in dt_map_id()
* add const qualifier to struct dt_device_node *np declaration in iommu_add_pci_device()
* use stdint.h types instead of u8/u32/etc...
* rename functions:
  s/dt_iommu_xlate/iommu_dt_xlate/
  s/dt_map_id/iommu_dt_pci_map_id/
  s/iommu_add_pci_device/iommu_add_dt_pci_device/
* add device_is_protected check in iommu_add_dt_pci_device
* wrap prototypes in CONFIG_HAS_PCI

(cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 140 ++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  25 +++++
 xen/include/xen/iommu.h               |  17 +++-
 3 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1b50f4670944..d568166e19ec 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -151,6 +151,146 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
 
+#ifdef CONFIG_HAS_PCI
+int iommu_dt_pci_map_id(const struct dt_device_node *np, uint32_t id,
+                        const char *map_name, const char *map_mask_name,
+                        struct dt_device_node **target, uint32_t *id_out)
+{
+    uint32_t map_mask, masked_id, map_len;
+    const __be32 *map = NULL;
+
+    if ( !np || !map_name || (!target && !id_out) )
+        return -EINVAL;
+
+    map = dt_get_property(np, map_name, &map_len);
+    if ( !map )
+    {
+        if ( target )
+            return -ENODEV;
+        /* Otherwise, no map implies no translation */
+        *id_out = id;
+        return 0;
+    }
+
+    if ( !map_len || map_len % (4 * sizeof(*map)) )
+    {
+        printk(XENLOG_ERR "%pOF: Error: Bad %s length: %d\n", np,
+            map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask = 0xffffffff;
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If of_property_read_u32() fails, the default is used.
+     */
+    if ( map_mask_name )
+        dt_property_read_u32(np, map_mask_name, &map_mask);
+
+    masked_id = map_mask & id;
+    for ( ; (int)map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
+    {
+        struct dt_device_node *phandle_node;
+        uint32_t id_base = be32_to_cpup(map + 0);
+        uint32_t phandle = be32_to_cpup(map + 1);
+        uint32_t out_base = be32_to_cpup(map + 2);
+        uint32_t id_len = be32_to_cpup(map + 3);
+
+        if ( id_base & ~map_mask )
+        {
+            printk(XENLOG_ERR "%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
+                   np, map_name, map_name, map_mask, id_base);
+            return -EFAULT;
+        }
+
+        if ( masked_id < id_base || masked_id >= id_base + id_len )
+            continue;
+
+        phandle_node = dt_find_node_by_phandle(phandle);
+        if ( !phandle_node )
+            return -ENODEV;
+
+        if ( target )
+        {
+            if ( !*target )
+                *target = phandle_node;
+
+            if ( *target != phandle_node )
+                continue;
+        }
+
+        if ( id_out )
+            *id_out = masked_id - id_base + out_base;
+
+        printk(XENLOG_DEBUG "%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
+               np, map_name, map_mask, id_base, out_base, id_len, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    printk(XENLOG_ERR "%pOF: no %s translation for id 0x%x on %pOF\n",
+           np, map_name, id, target && *target ? *target : NULL);
+
+    /*
+     * NOTE: Linux bypasses translation without returning an error here,
+     * but should we behave in the same way on Xen? Restrict for now.
+     */
+    return -EFAULT;
+}
+
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct dt_phandle_args iommu_spec = { .args_count = 1 };
+    struct device *dev = pci_to_dev(pdev);
+    const struct dt_device_node *np;
+    int rc = NO_IOMMU;
+
+    if ( !iommu_enabled )
+        return NO_IOMMU;
+
+    if ( !ops )
+        return -EINVAL;
+
+    if ( device_is_protected(dev) )
+        return 0;
+
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
+    np = pci_find_host_bridge_node(pdev);
+    if ( !np )
+        return -ENODEV;
+
+    /*
+     * The driver which supports generic PCI-IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->dt_xlate )
+        return -EINVAL;
+
+    /*
+     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
+     * from Linux.
+     */
+    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+                             "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return rc == -ENODEV ? NO_IOMMU : rc;
+
+    rc = iommu_dt_xlate(dev, &iommu_spec);
+    if ( rc < 0 )
+    {
+        iommu_fwspec_free(dev);
+        return -EINVAL;
+    }
+
+    return rc;
+}
+#endif /* CONFIG_HAS_PCI */
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index c1e4751a581f..dc40fdfb9231 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -852,6 +852,31 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
+#ifdef CONFIG_HAS_PCI
+/**
+ * iommu_dt_pci_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @map_mask_name: optional property name of the mask to use.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on that
+ * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
+ * @id_out may be NULL if only the other is required. If @target points to
+ * a non-NULL device node pointer, only entries targeting that node will be
+ * matched; if it points to a NULL value, it will receive the device node of
+ * the first matching target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int iommu_dt_pci_map_id(const struct dt_device_node *np, uint32_t id,
+                        const char *map_name, const char *map_mask_name,
+                        struct dt_device_node **target, uint32_t *id_out);
+#endif /* CONFIG_HAS_PCI */
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
 #ifdef CONFIG_DEVICE_TREE_DEBUG
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971c5..e83de1fced67 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -26,6 +26,7 @@
 #include <xen/spinlock.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
+#include <asm/acpi.h>
 #include <asm/device.h>
 
 TYPE_SAFE(uint64_t, dfn);
@@ -219,7 +220,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -228,12 +230,25 @@ int iommu_release_dt_devices(struct domain *d);
  *      (IOMMU is not enabled/present or device is not connected to it).
  */
 int iommu_add_dt_device(struct dt_device_node *np);
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
 
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
+#else /* !HAS_DEVICE_TREE */
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return 0;
+}
 #endif /* HAS_DEVICE_TREE */
 
+static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    if ( acpi_disabled )
+        return iommu_add_dt_pci_sideband_ids(pdev);
+    return 0;
+}
+
 struct page_info;
 
 /*
-- 
2.40.1



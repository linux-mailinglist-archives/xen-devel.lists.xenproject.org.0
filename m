Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C652472524E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544311.850002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jVv-0004Kd-3K; Wed, 07 Jun 2023 03:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544311.850002; Wed, 07 Jun 2023 03:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jVv-0004Hw-0Z; Wed, 07 Jun 2023 03:07:11 +0000
Received: by outflank-mailman (input) for mailman id 544311;
 Wed, 07 Jun 2023 03:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jVu-0002sk-0A
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:07:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6273928d-04e0-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 05:07:07 +0200 (CEST)
Received: from MW2PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:302:1::32)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:07:04 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::5c) by MW2PR2101CA0019.outlook.office365.com
 (2603:10b6:302:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.7 via Frontend
 Transport; Wed, 7 Jun 2023 03:07:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Wed, 7 Jun 2023 03:07:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:07:03 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:07:01 -0500
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
X-Inumbo-ID: 6273928d-04e0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Itoey9ysYWthzmBqtfMYlz9VQ1D3dqmu3PRXAZNsXVYNxXy2D6QJQIfzHDabyl7GhzX42YeRaHV4kYhrnQOYVjdCvKohlZwTZHFz5r16t0geZNagYycd/x9TpDgqGjdmJ09I6HScuoFzcHjCk176gy00/O0sm5MBA4C5KOx3v3Jl6nQym1kmi2fe0BRbt30MGmBz9ZLDKZ8GhFa0JLkI41CU6/lXD7PMqYsM54c7EXtV6TN7jiummfUqSYgfrZ+dyRMM2Ca9Z7Kp4etwgukOMH7HuxSUh/FCG2e5EuYY8r/Uu3e/IbAvhCiAQDvoFL/0YBir3S5Dubym77PcUJDM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJAdGtIHyvrVYngxULF6IRmPI2fTcN9vqrIymUQEzeM=;
 b=ZluNPUL9su66cGN8W+78Z6qR3zUPH8NF/v5pa/1bMfnhinQBV1XRVroCohHoJmy1iTi0QH4CDqIQ4V0phgLz/nnzZ/KBxl2oZBQ8tFZHXg1Se37QRnGTVTOGPRWe7Zso7PLCTuLlaUGQgFaDP/qcqhVwDJT0+PUWQnXbOXpCl3yQALPOi5S7FwNjg7cQc96g303j2t3mJMAP2VcbTWLLJ+yClkipKcCQKe3LxCKhGExJ0kW1RTpjydiM/a+LEWdNNoZP2ioMf7rllv/3dX9bQ3lt0s9exj/acfjkAQCfZnbpS9T4qynlKSgF/NKO8xMA1CUd+BmVsSkBA0PmDBz7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJAdGtIHyvrVYngxULF6IRmPI2fTcN9vqrIymUQEzeM=;
 b=DTPLTwTfm6SkF8JFSOD+Y6CPTuBHgqB799Ibl2GCI68+LtioM53ZD2uYFP0tkamVFdFtlJp1hu5wbtn50BVVoM1FB/ukRK7iyCuWrAcC/bTRw7qeJuKVhkRIOMm2gDLeQjHWWco8CEo673JdShBLYP0jz4KsNBeAbTyOk8WxstU=
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
Subject: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Date: Tue, 6 Jun 2023 23:02:17 -0400
Message-ID: <20230607030220.22698-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0362084f-5415-4f42-e466-08db67044508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eYOrRG4OkiPBcBXgqmpyRu9TG1nhLfq0IyOwS/KyaSrHUL/MItTlPv9tdQo8ky/OzZoGek1wlvz0TOgqbcoazFr1FU8rSvQx9wrM3y+1HmW0QqQk97nZwyXoGKcjtApWIN0T4PTTHArKHq6taE4OaqSgIHsYRJFH9uzNdCdfF8X1eQn8HeV17tlmRNdHciSfCcsr4dtlEb0uPUCpdhFxVYT0MxYgYnV1lkeZJZx+3JBVO9RxVMRt0sfTQ+ZZjZinmx0VHUHNSVfPX90UvmNexucquunTfAbBf218IdLG3vXB15yzfHJ5oT57cUMW9iatEZ9tgAkf6aUJfQVtMIHYf7/Rpb0Pgept1uz6qVTRVkQUC4CfPhwmAg+KQ0cLfNR87SQQnV02zyarYGzmrjuY3RwXkAKB8XPEpiPcs0wSzmS5+7JX8mBan3sDhQIOMOHuQ37lSXN3gXfWk1rciHUbvslfF95zGfFllSP4EXNxNeFz+fE+phrm45F3a9gJ8OZn4jAuRrLQyXi13wHyJ3tlGmwhFYYVO1+ql0YugH9Q4Mr7XTAfXMD8fiazywWbQN6JOs/4wWBkBKLbOZOthsIc5IZisqEgDotZX76PnjKOuopHG+5cx1riq92zuZSeGUZsAELWTw6lxUiPc/k6dX/wsmxVHYKflNBNs5YpbMOqcZtOow7iO2T6aYbipRJgWXsvLIfyZ2Dy/lpxiCsTNs+eXVWBGb2gClNEygHmw/RPt+EqTw3Z2iWpkEbDXdBRGHJyaMRd8FCKe1ToN4lmUH6Ec/2lzJ0rRT3+ImbWxgEVCIA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(8676002)(8936002)(478600001)(54906003)(966005)(6666004)(5660300002)(316002)(41300700001)(1076003)(26005)(6916009)(44832011)(186003)(4326008)(70206006)(70586007)(336012)(2616005)(83380400001)(40460700003)(2906002)(47076005)(426003)(82740400003)(81166007)(40480700001)(356005)(36860700001)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:07:03.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0362084f-5415-4f42-e466-08db67044508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves similarly to the existing iommu_add_dt_device API, except it
handles PCI devices, and it is to be invoked from the add_device hook in the
SMMU driver.

The function of_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
* fix Michal's remarks about style, parenthesis, and print formats
* remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
* rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specific
  to iommu
* update commit description

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
 xen/drivers/passthrough/device_tree.c | 134 ++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  25 +++++
 xen/include/xen/iommu.h               |  22 ++++-
 3 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index ff9e66ebf92a..bd0aed5df651 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -154,6 +154,140 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
 
+#ifdef CONFIG_HAS_PCI
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out)
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
+
+        /* Otherwise, no map implies no translation */
+        *id_out = id;
+        return 0;
+    }
+
+    if ( !map_len || (map_len % (4 * sizeof(*map))) )
+    {
+        printk(XENLOG_ERR "%s: Error: Bad %s length: %u\n", np->full_name,
+               map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask = 0xffffffff;
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If df_property_read_u32() fails, the default is used.
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
+            printk(XENLOG_ERR "%s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
+                   np->full_name, map_name, map_name, map_mask, id_base);
+            return -EFAULT;
+        }
+
+        if ( (masked_id < id_base) || (masked_id >= (id_base + id_len)) )
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
+        printk(XENLOG_DEBUG "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",
+               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    printk(XENLOG_ERR "%s: no %s translation for id 0x%"PRIx32" on %s\n",
+           np->full_name, map_name, id, (target && *target) ? (*target)->full_name : NULL);
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
+     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
+     * from Linux.
+     */
+    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return (rc == -ENODEV) ? NO_IOMMU : rc;
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
index c2f315140560..8385cd538a58 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -892,6 +892,31 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
+#ifdef CONFIG_HAS_PCI
+/**
+ * dt_map_id - Translate an ID through a downstream mapping.
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
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out);
+#endif /* CONFIG_HAS_PCI */
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
 #ifdef CONFIG_DEVICE_TREE_DEBUG
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971c5..3cac177840f7 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -26,6 +26,9 @@
 #include <xen/spinlock.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
+#ifdef CONFIG_ACPI
+#include <asm/acpi.h>
+#endif
 #include <asm/device.h>
 
 TYPE_SAFE(uint64_t, dfn);
@@ -219,7 +222,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -228,12 +232,28 @@ int iommu_release_dt_devices(struct domain *d);
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
+    int ret = 0;
+#ifdef CONFIG_ACPI
+    if ( acpi_disabled )
+#endif
+        ret = iommu_add_dt_pci_sideband_ids(pdev);
+    return ret;
+}
+
 struct page_info;
 
 /*
-- 
2.40.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102576F38FF
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528264.821200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkX-0006JR-9Y; Mon, 01 May 2023 20:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528264.821200; Mon, 01 May 2023 20:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkX-0006H5-5o; Mon, 01 May 2023 20:03:53 +0000
Received: by outflank-mailman (input) for mailman id 528264;
 Mon, 01 May 2023 20:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZkV-000525-Du
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:03:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492ecb6f-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:03:49 +0200 (CEST)
Received: from MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::32)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:03:46 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::d8) by MW4P223CA0027.outlook.office365.com
 (2603:10b6:303:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:03:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:03:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 13:03:43 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:03:42 -0500
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
X-Inumbo-ID: 492ecb6f-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itY6LV+fQEhdFUOO4+G6drQvRa474rhgPkD3dElQ0n/CBoSn8ViLrJrFWXL0XthXLcqkYQa4m/3lQeMxjBTXOFk45z2VajOni1UCp732CiKiGaTby8K7KeWqVO2xHu+krlZz+goTIIyTXhNBAcrGp0BQAHLb+InkVvU0efz/ydHGhM4UlwII2d2ZwPSMzNqzKjI+SK422/dSJ9qiJR7EKNCWNUNACoDZsH76dL8ABNjQj94+Gw6gOWAMexnLLfFaqWaX0J7untUGwARtqAz0HAJJwfmYRaAIn77UFHJjg9BGWaP8c2EnagZ5yM8FT0VL/l12GEyQp40dIcJ0WmhaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPTXU+0KLiFp2//TpisX/eYI6MvOPIIjwmGHW7rytQA=;
 b=SCNFZJ+Em/zIOeUhRJtm8k7cfah0bZqbMPBJuS0C8mxSAZydfHaDhI5FTp02ltEQ9QZuR5ijMBtTrTYNeZhn6wo5tuPFmHDFS4ogn9ELo8Dl7qs5qV0dow/bpkMG/LwYgi7bTARS+fhF9QZQCNAF7qufAxusRw9W3lNBk54cWHJrj2S5Z3TCys6Mj8q0xCWJvRA2hdRZMf0IHW0Yz3dPuj9wNiHTUdS6qlLCgigpInM/QAp49sF/vTMG8DW5jDKzfXDCwomhNeL6TyGX0OunrJtUPLAKHUSbNt2Jn8Htz1TgrZGpGjubApSmx7Z5SV4F5MtPzDN/FoBRri1x8RMQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPTXU+0KLiFp2//TpisX/eYI6MvOPIIjwmGHW7rytQA=;
 b=jNewda7fLrpIonms0NAPfIMB+Z/unDJRI/jFgpuewQo+7kr+Wxp+YpQVJhBtUKHry0KPItf/CDe3kdm6JcTvwq8uLRwTRxba1hvi01bgtncVEnUj2h3S0XSULc8bfTz7NDDxldtMPNx9FFe+Ztvt50Npabv6+E23nvRJhvMJLdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v1 3/6] iommu/arm: Introduce iommu_add_dt_pci_device API
Date: Mon, 1 May 2023 16:03:02 -0400
Message-ID: <20230501200305.168058-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 47adc05a-10e5-4517-7712-08db4a7f2b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zETcY6KrC2KwwoH7dFvA7/l0iOb8nsC9CPbbncqRqnkpP6ZYaumC5eRjNFJsaBg+7QwQBFb3n8gHlmr/VJRW2zHNeYWHDJjauwprvXR9kW59I31UxauinjSppIWrZqdvpXCwyXs99UGC98/0XjvJMHMf9OWTl9DyyQKKwLmKxh8QiZ46WgXI10Xo4kdV+KBukgyuXgMj2D4+CFOpeJNbGyUbmRgCwqvLG6fuphV7D5MYHzLw9biDZNTvvR0sKTz2aCZELbgYSHHUuxIFxHlgL66/61mhQD+swFhY9mDXWNuehZkQJIn5zsL3ZQWmyrrR63DrsJD+xH7KCpXJ9Eky88x6s/Kv+mzZl0XwfKmGnJ6Ys80RxFRm7W+Qv6mIgFjkSbAOhQS3jE+L3AJDhu6w/QnPlJmBxkJs+O5PKyeDhOxTaxPfx/c3wy+LmPjmWex5mIVFqFYqeXfgOQyJq31McKkQs2tnw0PIcojYlPVegi61BKuA3tJ6mRqtYYzGd+hTy9g20Z/e191wRRQPw0AI79O1ckbQ/d0mi+i0JpfMmjnMY8Ys4U/B3BsTAzw/eYCQR2NfLQcALrnnxrm5Q9MlSnd0B6VINEF9oSwsByv68zE9yEHxvromlyH+ty8GcxPzDg7BuFnMMdtaXKZtKThOLQywjQter5XpjUlh1YnvGTNAN3uoGMQ7ScYtOQV+1/LO0b9UeGinCtMg3+56aRaNPEBP66TI+6X6rOcGNgsNM4Kr4WMCU/JQHhYZPRPA2zA8RNVUX5Lc75jf/3WoefU3qsYbWHUO0EpQQ/C3LaaLJkQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(356005)(81166007)(8936002)(82310400005)(478600001)(8676002)(82740400003)(6916009)(86362001)(40480700001)(4326008)(70586007)(70206006)(41300700001)(36756003)(54906003)(316002)(40460700003)(36860700001)(2906002)(83380400001)(47076005)(44832011)(966005)(186003)(1076003)(26005)(426003)(336012)(2616005)(5660300002)(6666004)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:03:44.9031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47adc05a-10e5-4517-7712-08db4a7f2b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

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
 xen/drivers/passthrough/device_tree.c | 145 ++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  25 +++++
 xen/include/xen/iommu.h               |   6 +-
 3 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1b50f4670944..ef98f343eef2 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -151,6 +151,151 @@ static int iommu_dt_xlate(struct device *dev,
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
+int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev)
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
+    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                             "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return rc == -ENODEV ? NO_IOMMU : rc;
+
+    /*
+     * The driver which supports generic PCI-IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->add_device || !ops->dt_xlate )
+        return -EINVAL;
+
+    rc = iommu_dt_xlate(dev, &iommu_spec);
+
+    /*
+     * Add master device to the IOMMU if latter is present and available.
+     * The driver is responsible to mark that device as protected.
+     */
+    if ( !rc )
+        rc = ops->add_device(devfn, dev);
+
+    if ( rc < 0 )
+        iommu_fwspec_free(dev);
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
index 405db59971c5..d1b91ec13056 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -219,7 +219,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
  *      (IOMMU is not enabled/present or device is not connected to it).
  */
 int iommu_add_dt_device(struct dt_device_node *np);
+#ifdef CONFIG_HAS_PCI
+int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev);
+#endif
 
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-- 
2.40.1



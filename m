Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592F7E7181
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629775.982225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19m7-0001XO-6P; Thu, 09 Nov 2023 18:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629775.982225; Thu, 09 Nov 2023 18:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19m7-0001UM-2n; Thu, 09 Nov 2023 18:29:07 +0000
Received: by outflank-mailman (input) for mailman id 629775;
 Thu, 09 Nov 2023 18:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19m5-00018Z-75
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:29:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e88::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dba3a2ae-7f2d-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 19:29:04 +0100 (CET)
Received: from CY5PR19CA0010.namprd19.prod.outlook.com (2603:10b6:930:15::14)
 by BN9PR12MB5097.namprd12.prod.outlook.com (2603:10b6:408:136::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 18:28:59 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::8f) by CY5PR19CA0010.outlook.office365.com
 (2603:10b6:930:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 18:28:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.19 via Frontend Transport; Thu, 9 Nov 2023 18:28:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:50 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:28:49 -0600
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
X-Inumbo-ID: dba3a2ae-7f2d-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPn3+dg8l0aFrQk5/E1RhV1o7ezQQG9TTaePbJmyJAtQHxolAzKP0efyRMaO08vlfL1Ac+scgIP8uHG8isllZoXkA5XH5++yR6NG/6arU4qshRWFTFZHHa0uR6ci93XfYlHPp/GU5epruS92Zhyc9lY57panRMVu+iDJOKiXui0Er1GpLtxrXDxfD0VKjGnm1wUX2unLo88K12XB9HPFGwB54s1c/74piKTINZXTT0Iotprv9stgKbFmOkZ5kwzhuhlp9jH+B9JjSCxXOGegiU0qSvi+2Tsb1sOzVmmI1BWrLwjF+pvW7CLmMCffIIfmYzrjp2NLryffPs4KoSSCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er47gbLD0nrOyJoeuCOE/UOtw7KE+ZzgpOglVxbhGGw=;
 b=l5I0VcOQRUqSk7MWuaTc2N6qZQWCZIUP8rcVBOdXCvnKyQgsVouepBk6S3sV8ALh3ixEZvHkm4XmOszqi1kGIkwCpuEHOkkxrVs8APD/NyXu8KOnIF1UlZ1zGQy3+UmZRwpmUwjDnSLZxfLz4ne+n8sz7rWaFsdHr+AxlQXrAzsLYbtacRfdBvgWYSyifsL5pHXLRGNxhMFy4SEXTMABhTnu7FWHJmu1QCe89XyyfKWgcktCH11JzsFHRpmxQVzw+RAKfulKkzl3ygOhfQAoin8dRnVjf4in4An07e83tBfEY9SZwbCdIu7EXC1BdRcXC8ooqYWZXHhro8Kjypss6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er47gbLD0nrOyJoeuCOE/UOtw7KE+ZzgpOglVxbhGGw=;
 b=yLHePgudUBf1KHCwSK4Yt4Sghu7SfS6sUBRwIj2RnGBYrR9/GUdldyg8bcUqSic/AS0fQiLIIh6tMsAYlmddPTGT/jHOb4q8B3uo+J0klGEcUIDc0Mo/s70wGnXkMzhb0OO/6aR391njBa8SYQeHBZwXLmbhc/uBv//xd4TGq/I=
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
Subject: [PATCH v6 3/9] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Date: Thu, 9 Nov 2023 13:27:06 -0500
Message-ID: <20231109182716.367119-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|BN9PR12MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e38f7f-e9ff-4fb7-56b4-08dbe151bc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOze1uQf/UOGNezNwoW2+muOcwQvZb360gboQmNg+Sy4/AUj0oubsf9c40RRbOEXVQl5EB90fQT59MaqrJjlfesWNtL02IbLqSyf9+yD8OIYGMt8N1N6qxpAuACwSh1n2XKVMpOail618AZewstjptOJzWwlTeazBs2RT7cbTFJ7cNaBiN43Cgzbh1qtnXDj60hzE0PKey6uBlsl7t/UcZArRjtwJbv7HHJGdRFsKi5X9o+HcnW5QU602gin4+78nbEiRuXHO+RFXjvUJza8VxVFF+Qs2mCK1pVURn1GQpehb0UGHGN6c6eHvuCcutQPY19Vko9MHoZzRpj5r8Qv2KRon5h5q5u6M2KDwCtjd5w9V02MT4oXh7PVZVqJ4rFvvYydvhLp1lhvK8thDQdCrOuz1VMVP9QCxaVN660S+s9kEq56mvUh0XyFI3H60UN0wG84nwFO6Kd+/zyeTkW6owUSbcWOC5s95B68R1mSSzdPwUCpATLSU954ReyVUpVAT/HB46BZ1YHR4QN1asjuWO9dQHVLmYsFhAA8TJCyIAERBndcD4g4/Q+TKyePYVZT+ViL+Cyqv0tFA9wJW1KRdzZcRz1VBgi8+1qnXg8KXV3FSatuoPzWkmK7n5n0qysNdkcZ2dNHe7yh5702o62NQnQ/gNirrI0Pj16qvtnS4JkGPfEGFqfwwzhRaTYW2vaBVvkLgG8ZORxbCns6DUanKHxkn5giizFUj36Xo9mh4T+V/kVvCxVMzW3x//LgLYe988zJVTcboSeHwv7ooSjiwH9YdiXTnHDd2l62OUYnQNV9nyAUbes7UWFRugq9QfWh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(36756003)(40480700001)(6666004)(966005)(41300700001)(4326008)(5660300002)(44832011)(2616005)(36860700001)(8936002)(8676002)(70586007)(6916009)(30864003)(2906002)(426003)(316002)(54906003)(83380400001)(26005)(70206006)(86362001)(478600001)(47076005)(82740400003)(1076003)(336012)(81166007)(356005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:28:56.7389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e38f7f-e9ff-4fb7-56b4-08dbe151bc29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5097

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves similarly to the existing iommu_add_dt_device API, except it
handles PCI devices, and it is to be invoked from the add_device hook in the
SMMU driver.

The function dt_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5->v6:
* pass ops to iommu_dt_xlate()

v4->v5:
* style: add newlines after variable declarations and before return in iommu.h
* drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
* rebase on top of ("dynamic node programming using overlay dtbo") series
* fix typo in commit message
* remove #ifdef around dt_map_id() prototype
* move dt_map_id() to xen/common/device_tree.c
* add function name in error prints
* use dprintk for debug prints
* use GENMASK and #include <xen/bitops.h>
* fix typo in comment
* remove unnecessary (int) cast in loop condition
* assign *id_out and return success in case of no translation in dt_map_id()
* don't initialize local variable unnecessarily
* return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()

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
 xen/common/device_tree.c              | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 24 ++++++-
 4 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index b1c29529514f..5cb84864b89b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -10,6 +10,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <xen/bitops.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
@@ -2243,6 +2244,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
     return (u16)domain;
 }
 
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
+        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__,
+               np->full_name, map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask = GENMASK(31, 0);
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If dt_property_read_u32() fails, the default is used.
+     */
+    if ( map_mask_name )
+        dt_property_read_u32(np, map_mask_name, &map_mask);
+
+    masked_id = map_mask & id;
+    for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
+    {
+        struct dt_device_node *phandle_node;
+        uint32_t id_base = be32_to_cpup(map + 0);
+        uint32_t phandle = be32_to_cpup(map + 1);
+        uint32_t out_base = be32_to_cpup(map + 2);
+        uint32_t id_len = be32_to_cpup(map + 3);
+
+        if ( id_base & ~map_mask )
+        {
+            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
+                   __func__, np->full_name, map_name, map_name, map_mask,
+                   id_base);
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
+        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",
+               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\n",
+           np->full_name, map_name, id,
+           (target && *target) ? (*target)->full_name : NULL);
+
+    if ( id_out )
+        *id_out = id;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 4c35281d98ad..edbd3f17adc5 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
 
+#ifdef CONFIG_HAS_PCI
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct dt_phandle_args iommu_spec = { .args_count = 1 };
+    struct device *dev = pci_to_dev(pdev);
+    const struct dt_device_node *np;
+    int rc;
+
+    if ( !iommu_enabled )
+        return NO_IOMMU;
+
+    if ( !ops )
+        return -EINVAL;
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
+    rc = iommu_dt_xlate(dev, &iommu_spec, ops);
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
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a262bba2edaf..14ec3f565976 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -939,6 +939,29 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
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
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
 #ifdef CONFIG_DEVICE_TREE_DEBUG
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 8cd4b9a6bfb2..2f081a8cea62 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -27,6 +27,9 @@
 #include <xen/errno.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
+#ifdef CONFIG_ACPI
+#include <asm/acpi.h>
+#endif
 #include <asm/device.h>
 
 TYPE_SAFE(uint64_t, dfn);
@@ -222,7 +225,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -231,6 +235,7 @@ int iommu_release_dt_devices(struct domain *d);
  *      (IOMMU is not enabled/present or device is not connected to it).
  */
 int iommu_add_dt_device(struct dt_device_node *np);
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
 
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
@@ -247,8 +252,25 @@ int iommu_remove_dt_device(struct dt_device_node *np);
 
 #define NO_IOMMU    1
 
+#else /* !HAS_DEVICE_TREE */
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -ENOSYS;
+}
 #endif /* HAS_DEVICE_TREE */
 
+static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    int ret = -ENOSYS;
+
+#ifdef CONFIG_ACPI
+    if ( acpi_disabled )
+#endif
+        ret = iommu_add_dt_pci_sideband_ids(pdev);
+
+    return ret;
+}
+
 struct page_info;
 
 /*
-- 
2.42.0



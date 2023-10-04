Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A07B82FD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612643.952667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3JP-0004ea-0t; Wed, 04 Oct 2023 14:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612643.952667; Wed, 04 Oct 2023 14:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3JO-0004c4-Th; Wed, 04 Oct 2023 14:57:18 +0000
Received: by outflank-mailman (input) for mailman id 612643;
 Wed, 04 Oct 2023 14:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3JN-0004W4-4n
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:57:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dea27ec-62c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:57:15 +0200 (CEST)
Received: from MN2PR04CA0036.namprd04.prod.outlook.com (2603:10b6:208:d4::49)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 14:57:11 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:d4:cafe::ba) by MN2PR04CA0036.outlook.office365.com
 (2603:10b6:208:d4::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Wed, 4 Oct 2023 14:57:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:57:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:57:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:57:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:57:07 -0500
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
X-Inumbo-ID: 4dea27ec-62c6-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQdnqz5xFpSXsDP5p542Q3RpMGQQWbEEu/aQywJFGikNmoqGDJ+8LX/WF3yY2k+n/FW9YqtYZCtx2SnoeVsdhO4n0/ahOLvlYElxVmnvw2uGrdIgi37zC87lqe1G2DKBzFzNwWfs/pQ0Pe6Qn1dOhE2ud027V6yN5+kVa8mRVdRWbJJ6ABpEMpHh1cQ2G3RdoYP6LcmEi9lunEP5aqdlvgGq8QCO/6e9nTUidJrc0mBJsHYonAA5FXIlJKO7aecna/jCMIJkPydVwzMY57I1T+VvHTHLxKQxWaYf15LvZmdH9vn1LluS5HnNJbOAoACKL1xxFBK9EOzql1b3DGKNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A30ver62Ahssxfk7OHupEUiGGZlj9h7dhnRjMZiI64A=;
 b=PvPLCa1qTsMnqPsnauU6HZ6j/9DQETnnuVHTaLNxgkMqaW2XNpuDqo9Eu9HpLwIEKQAg00JSQYzVm/LrNryBPBc8wxwvaej85abhOCGwlmOJ2QPCmZ2xLjNURbHnryE8+Ei+bp0f1Tq4xzhJcPP2gfKydmW1SALf/0QrUlYOkyJkaAiFwxuipBpcrBqDmXS1IFEvBNhqJUwefkOufl61snKMaIh54mJsHlZJkp5g+bp+inNVraTkOf4UkmFIj2kLo33bE16p722oQ2xR8owq2wZO2xlDVVfyT+M/RZZuoZntorAuXM8FK+fUDmwFyNjDJhK6GeD5YA7/uv4VupPKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A30ver62Ahssxfk7OHupEUiGGZlj9h7dhnRjMZiI64A=;
 b=rGRpbP+1sk5BZ0RDdgra358wfVgwRbietzztuSpwXMzjhWrUGbqdFzE4lKy9eQ2V5EtmJ0FFjoOwVP4CajuHTe+1A5T6q4WBJyBl4bMS5R+ziv5mDYvVSDV/28EDOVz3LJPBk9jL5Wv/hSQ4+f/5Or+JUk8Mdq4iMMYh+09IKd4=
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
Subject: [PATCH v5 3/9] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Date: Wed, 4 Oct 2023 10:55:47 -0400
Message-ID: <20231004145604.1085358-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BL1PR12MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: a4320b88-5952-467a-9038-08dbc4ea3056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2lQhLsWXOuBorBPmNi0aBPuY/kCAAo0txcJATzKmtZW5j46+ILpmZyYgf2s8sROw+rFoGRXmKcPEFfqi2AsOtTbi++YdPmdcgYnTXyXboAR3GBddFlzTigJpys7cXKQd/Ay5urOcRIPNksfchmJAhgsKjleoEDntUmnKA9eCp57whxTbntSWk7BFt+xW35s1CCiFPh8lT8GDLousePpsqyuoK+V8fynnTvEmeBhj1WXKDn1AGcGMPdlTOEN8wJagHjrjMhGmpoIqnxlRkVSBxKFAfZIYH9VwL238BvL+CaGo752HmFo8GAJIiWxiPy63bUyH2JpN+I3tqKsrmZKMpWpuB4rjXKWaOHkByEoqUpPyrLr0nMULcIVF1xg+eFc+wPG6nY3LdBo5XPv4ZDPjXpmPuMreK+IM16x+T8zvXTAJ5yylRLsoFuCmtCbJ/QwXz2lRFcfMEiKmyfw6W/CA+bTK7gfpSZZz/Z7Nbir8FDF+tp2wZJ4UR6wDtXjA2RY1fHPrrmdWvt0ybVQh4wPvcNdhBMmV30EngnY9TRA7CinOoTXISJbNzh3hz/ilX0gSv7LmBS/zGZhMbfpjxFrWcWlV3OHPEp5XKypEALY/RvmnjdUhOUNisOVdbwO0GOodzmzMG3gtRyH+lqZTbOzGQyv23ruxG8R0ulA3uJ+C56a/XgZ1/lqY7eW8etEikE8d4aa7nQ8a+QMlrxH9OJP71dsY4Z4j7WUyZeLtYPr+t5faKCI4XdGlb0YVoYyoOxX8xmlvpsbF0QzC6BC9iL/Wbf72BR3RV8uOepVBPwIJpWEo35sS5y0x13G2PIAPznrg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(2616005)(1076003)(478600001)(966005)(6666004)(83380400001)(47076005)(336012)(426003)(26005)(30864003)(2906002)(44832011)(5660300002)(70206006)(54906003)(70586007)(6916009)(4326008)(8936002)(8676002)(41300700001)(316002)(40460700003)(82740400003)(36860700001)(36756003)(356005)(81166007)(40480700001)(86362001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:57:11.4959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4320b88-5952-467a-9038-08dbc4ea3056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349

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
index 159ace9856c9..5ee81132cb4d 100644
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



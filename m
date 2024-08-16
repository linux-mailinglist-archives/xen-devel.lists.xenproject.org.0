Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0295477C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778488.1188534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seup8-0001wz-Ve; Fri, 16 Aug 2024 11:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778488.1188534; Fri, 16 Aug 2024 11:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seup8-0001tx-Sk; Fri, 16 Aug 2024 11:08:50 +0000
Received: by outflank-mailman (input) for mailman id 778488;
 Fri, 16 Aug 2024 11:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seup7-0001dU-8l
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:08:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80a6c5e-5bbf-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 13:08:47 +0200 (CEST)
Received: from BL1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:208:256::7)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Fri, 16 Aug
 2024 11:08:41 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:256:cafe::90) by BL1PR13CA0002.outlook.office365.com
 (2603:10b6:208:256::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:37 -0500
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
X-Inumbo-ID: e80a6c5e-5bbf-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHu3I9i469r2xga5Dumc3PV8+yxHIvLwK5eAg9Oi7B49rB4aFT/LcjEt7Pu7LGtu3OS/Z+Oe/TruRhX2YJ45LhR0qugs42eu7LpwfELRwAwVzsuG47KBRPs8NIat3lJTW7Nm0qQCzJb6kWbArlYSUUws7dx4PMta/Kh6aoAI1RnxEqClw/w2PiGT6ZeElgvPYnvdfGcoJ4dK6oiCt/otjHCwso3Bhq9RZLv0gU1ebQ8n0RKhFgBIhmfPyaHWBX5TK+uVCRbLyU9nBNBmu3L7fWpm6FnK+bD8cXqiu0jIsTa9+gEgcIXonuk+LadvHtLFtDA7jS2hC7pTpVYkK51ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyXanb/U7Jt+W/lUhXCnanELwNqOqGwqpo+XIrtjkes=;
 b=Sdw9hRZTThmZkSr+AQuNSSZ9mxSXmZVwBu20SruJceCVGoRF2HYDzObIARt/PMf8khq03LmIqJYsGcM5O8mgyjNBD0fYu26jeZw6D4EOK2Sv9JCoGCogQ2YN0sqdvSRuUiHwjMLzO6Ktf4UmOwqGCw2naRWDnXR/zy45FkvNi/nZI2EEMAPXVbolyM3RBiJWeINQZdjlqspcwQXRale744UsLxbrXiH1ye5KqNBTgQTjOYpDqIgkR833dAJbJyKXxhuZQMeAdIJWsTDHCEqa+qKEQuq62QqXCWDsKn9I3fVcR0xZ8Z0/5v4O1Ei47JcxfrsKh0YR7PYpdzKh4xwOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyXanb/U7Jt+W/lUhXCnanELwNqOqGwqpo+XIrtjkes=;
 b=XUkl0Glodxx/ishz0iK7lFJ+F2M93lC3NGioghtZv8kRs+eWPZopWeM5oQrT+tdJ0p6aFB/9VXaVQ4OQ+L7t9+6R5YaVhg8VlnEtTn7flDo9VQ9Uuiez1Cmn8HLv0vAml1liRPH7j6UqsRRmrKnCF/xTpeVDcR+4g/4TKhFOglY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of pcidev
Date: Fri, 16 Aug 2024 19:08:15 +0800
Message-ID: <20240816110820.75672-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816110820.75672-1-Jiqian.Chen@amd.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 301c08eb-8243-44f4-f4e6-08dcbde3c95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daac0cXhmaJOBBkeO8RgZhNCkqQW00sqqVtKk2nuqJp8c3vA8jzSXn1w5qKN?=
 =?us-ascii?Q?lVn2H3aKK/yDhzu2zSnfKdmj5ut4qmfN0898xJ+s9mitma/H4fNTGzR44NL/?=
 =?us-ascii?Q?IS5m1LoAevKrLTS0XNL0SzQYhl0aKRn7e4uMPe2219nB5aNVwffG94AUC/YN?=
 =?us-ascii?Q?jj8+8SEWsOl7V30uQe7zADL//TRqDxp9BSrV/0WwDPihDoFYyxXQYdadGEKt?=
 =?us-ascii?Q?ODQfMF8MFafZCINlunBZ5yRZ0Sm69rhwF6LnKzZFGE9g/6OOrXeGGn8lXBFO?=
 =?us-ascii?Q?Y24fp5//oWOwbl4phOG1+KS+mFAHfRUtvyR2PT1zLTAy1Qy9zpJCyALdWkDQ?=
 =?us-ascii?Q?YUVV+DnLWyuX4Hx82waNLEqmip3Z7ZPeLzc3P4HlazOwWxrd+pFBBBv1L9wS?=
 =?us-ascii?Q?iJxfZSKUNWERzd7Lq0ngJ6zCQyIZPPnukqbW+Po1hAmtBgRuO6UJ6o1LA/t9?=
 =?us-ascii?Q?w+E/yYqd9VD5j9FYDdv/xr971R9lCA0anjyr8c3CdgMEZFbNNB4e8qzolrMS?=
 =?us-ascii?Q?lQalck8QluK5Gc4Iwjd1QjLsBZwwZD+HSu77L5gwr3LZj4N7f9sRORdOczFf?=
 =?us-ascii?Q?lc3+1LVVLNSOu5/fJariWGs25bCKbMM25LNDfTtaoeCOnmftrOri0fU17lQr?=
 =?us-ascii?Q?X68VE+r3saSMugqTeDoGkqtHL6ES5H/39rnkRxScYkw6bOWld8ZyBzr3i/DG?=
 =?us-ascii?Q?LG+c2Ao3y4/IUnRS8rSblQ3e/rSOJiNiNs0QsXp6AE1Q39HgAdS+aSCpuObw?=
 =?us-ascii?Q?lxl9u7525oCpwQ3OIdhqXG8ZJEX3SuQsVendmy5ZB7fl4fR1V3wttPk1z5pB?=
 =?us-ascii?Q?FEgC3DckBD9iVKzsMZmeCYlZAoAAriGu4IDJMuvh63NJgTFYaQDN1v4jXjiT?=
 =?us-ascii?Q?OYVODqtx53pjiTMlONpnm6zZ5XceZko3Geij62WhEKIhXJ7YEV5xtN4mtquj?=
 =?us-ascii?Q?TS8gaXdbnnLj2x8o8cZ8E6AJlFJO2tKcWpGP62cmimcdKc69MpM54AtD21G4?=
 =?us-ascii?Q?8QCnTzrotRCVXhKe66XDPYW46U+uT8kYmQJQ51q8ry+Y7LfJ0U30G0WA9n9D?=
 =?us-ascii?Q?BBhmbd/UPh6o88I+1Q9LJZhP8nl1ZDLz7JW55XYWxzKJwR4KDP6y67Qvt+fY?=
 =?us-ascii?Q?3ppb+8pdGm+oe6Mc02QIyYYg31wDvr6IxKjzv4H7O2zQr05CVA3IXkWlRFHo?=
 =?us-ascii?Q?UV2EvKg/y6R9TvpjWzN0BmIu4Av81dJbBP7ryaZh5jZkY+U0L++G9X0DVJ7Z?=
 =?us-ascii?Q?6FiFxrKXfPv2WuEcA9FEJvsk8Q25/kfwIdQG/flMmMD0duR9Ssi/3swbL4Jg?=
 =?us-ascii?Q?9Yvg2KA0v8+2oSAjk4CFmNLhAc1KVkhlnjuerEDfXYpQnSEub3E2pmVOJF9S?=
 =?us-ascii?Q?No/bef6BEot1BLtaiNDuOHkkvM78PZ3dX2Gym31+2x1b2/aXqWl5J5ZGRRMR?=
 =?us-ascii?Q?NnW/uMbPAJQJJhY3kV92nX5mKuS8+Xa5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:41.2655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301c08eb-8243-44f4-f4e6-08dcbde3c95e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732

When a device has been reset on dom0 side, the Xen hypervisor
doesn't get notification, so the cached state in vpci is all
out of date compare with the real device state.

To solve that problem, add a new hypercall to support the reset
of pcidev and clear the vpci state of device. So that once the
state of device is reset on dom0 side, dom0 can call this
hypercall to notify hypervisor.

The behavior of different reset types may be different in the
future, so divide them now so that they can be easily modified
in the future without affecting the hypercall interface.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v12->v13 changes:
Deleted all "state" words in new code, because it is not necessary.
Deleted unnecessary parameter reset_type of function vpci_reset_device, and changed this function to inline function
Added description to commit message to indicate that the classification of reset types is for possible different behaviors in the future
Renamed reset_type of struct pci_device_reset to flags, and modified the value of macro definition of reset, let them occupy two lowest bits.
Change the function vpci_reset_device to an inline function and delete the ASSERT(rw_is_write_locked(&pdev->domain->pci_lock)); because this call exists in subsequent functions and it accesses domain and pci_lock, which will affect the compilation process.

v11->v12 changes:
Change the title of this patch(Add hypercall to support reset of pcidev).
Remove unnecessary notes, erroneous stamps, and #define.

v10->v11 changes:
Move the curly braces of "case PHYSDEVOP_pci_device_state_reset" to the next line.
Delete unnecessary local variables "struct physdev_pci_device *dev".
Downgrade printk to dprintk.
Moved struct pci_device_state_reset to the public header file.
Delete enum pci_device_state_reset_type, and use macro definitions to represent different reset types.
Delete pci_device_state_reset_method, and add switch cases in PHYSDEVOP_pci_device_state_reset to handle different reset functions.
Add reset type as a function parameter for vpci_reset_device_state for possible future use.

v9->v10 changes:
Nothing.

v8->v9 changes:
Move pcidevs_unlock below write_lock, and remove "ASSERT(pcidevs_locked());" from vpci_reset_device_state;
Add pci_device_state_reset_type to distinguish the reset types.

v7->v8 changes:
Nothing.

v6->v7 changes:
Nothing.

v5->v6 changes:
Rebase code and change old function vpci_remove_device, vpci_add_handlers to vpci_deassign_device, vpci_assign_device.

v4->v5 changes:
Add pci_lock wrap function vpci_reset_device_state.

v3->v4 changes:
Change the comment of PHYSDEVOP_pci_device_state_reset;
Move printings behind pcidevs_unlock.

v2->v3 changes:
Move the content out of pci_reset_device_state and delete pci_reset_device_state;
Add xsm_resource_setup_pci check for PHYSDEVOP_pci_device_state_reset;
Add description for PHYSDEVOP_pci_device_state_reset;
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
 xen/include/public/physdev.h | 17 ++++++++++++
 xen/include/xen/vpci.h       |  6 +++++
 4 files changed, 76 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index c1bd17571e47..68815b03eb25 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..980ff1ba3d07 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_reset:
+    {
+        struct pci_device_reset dev_reset;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        ret = -EOPNOTSUPP;
+        if ( !is_pci_passthrough_enabled() )
+            break;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+
+        sbdf = PCI_SBDF(dev_reset.dev.seg,
+                        dev_reset.dev.bus,
+                        dev_reset.dev.devfn);
+
+        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
+        if ( ret )
+            break;
+
+        pcidevs_lock();
+        pdev = pci_get_pdev(NULL, sbdf);
+        if ( !pdev )
+        {
+            pcidevs_unlock();
+            ret = -ENODEV;
+            break;
+        }
+
+        write_lock(&pdev->domain->pci_lock);
+        pcidevs_unlock();
+        switch ( dev_reset.flags & PCI_DEVICE_RESET_MASK )
+        {
+        case PCI_DEVICE_RESET_COLD:
+        case PCI_DEVICE_RESET_WARM:
+        case PCI_DEVICE_RESET_HOT:
+        case PCI_DEVICE_RESET_FLR:
+            ret = vpci_reset_device(pdev);
+            break;
+
+        default:
+            ret = -EOPNOTSUPP;
+            break;
+        }
+        write_unlock(&pdev->domain->pci_lock);
+
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..3902723ce1db 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * Notify the hypervisor that a PCI device has been reset, so that any
+ * internally cached state is regenerated.  Should be called after any
+ * device reset performed by the hardware domain.
+ */
+#define PHYSDEVOP_pci_device_reset 32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
@@ -305,6 +312,16 @@ struct physdev_pci_device {
 typedef struct physdev_pci_device physdev_pci_device_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
 
+struct pci_device_reset {
+    physdev_pci_device_t dev;
+#define PCI_DEVICE_RESET_COLD 0x0
+#define PCI_DEVICE_RESET_WARM 0x1
+#define PCI_DEVICE_RESET_HOT  0x2
+#define PCI_DEVICE_RESET_FLR  0x3
+#define PCI_DEVICE_RESET_MASK 0x3
+    uint32_t flags;
+};
+
 #define PHYSDEVOP_DBGP_RESET_PREPARE    1
 #define PHYSDEVOP_DBGP_RESET_DONE       2
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index da8d0f41e6f4..41e7c3bc2791 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -304,6 +304,12 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
+{
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif
 
 /*
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6E96949D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788644.1198090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNb2-0003Pn-DD; Tue, 03 Sep 2024 07:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788644.1198090; Tue, 03 Sep 2024 07:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNb2-0003MU-A7; Tue, 03 Sep 2024 07:05:00 +0000
Received: by outflank-mailman (input) for mailman id 788644;
 Tue, 03 Sep 2024 07:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNb1-00037M-K1
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:04:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d196c6b7-69c2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:04:54 +0200 (CEST)
Received: from DS7PR03CA0278.namprd03.prod.outlook.com (2603:10b6:5:3ad::13)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:04:47 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::69) by DS7PR03CA0278.outlook.office365.com
 (2603:10b6:5:3ad::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 07:04:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:04:46 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:42 -0500
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
X-Inumbo-ID: d196c6b7-69c2-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFIOY5PDbm2IJ2Bc68LT0KV8N2P/rB4mcwJBaHdGlqBBt/wmhEYDm6/2ICmg0vr8CyaoNmf4a7qUF7hL/3EXO0yjUT4MGBWdbOf7V8H0V8qmSHuhhNrjjdO6zShAxvZ/0YED/uWDGOU+aEE+N5wWrGxBxTKhSs0RzMQcDmABqXJqpdavwQslE+obkWiNF7TiNWLR0GgcdMhUtkSdhUDpuJIwg7fzIxs87XwjigKsAA+KWs2OxVzV+ZLFs5ULoHk4g84Bza5FlpYlq07RFwEwZhZemrLUw2Yd8iFtHv8X92w2Wvl3cJovCp1qDBe03Yk5flFLwdTtY+mXyE2Eu8Jj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlGmQrhKjci9o9jmUzzgn/490yIpsScEMAu2suA8Qt0=;
 b=OmlS3+BthIXZxmNDk9L0YhqvVyVSNb4yqWFMnEWULD3n0jWtFiEKhHYkGZrL3SIpRgBreY96E2Rww8XG4kTAowpYZRS+b0yveCx8/6aC7n28Ey4PJrXCKX1aqUo02A0xfDp7jpmFuDexUU5QA2X9v2v62Eaerx1Ym/zE0898/ejzLYyUQVc3eBoMzBmxAQVfhMi0BSsFFUWnuQj+uMKcE66nIxC11yr4IKBQc49/lINNZPznHWH6QBZp+wKtiGtEGWnDLBtBt4BCEj88SOgOejT1qjV+C3EhP/+z1x8GkiPuPgDpCcyjL9kRBMvwbXF3/um7xokTBL/Vodd3DeUX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlGmQrhKjci9o9jmUzzgn/490yIpsScEMAu2suA8Qt0=;
 b=3Nm6gV82ZLD6y4O7aVinYTCe0QPHhqL/zFb9VOZuasl8SGfH3gfdmpaSDQkkKrZ4dE/YQPu4m6BCkcgDffzlJGC+oYCvhe5RAHYOyDuxMVKtKoAEbqU2/hRRSgmOa+/KKXkYWP4CUKRDJQJ5N3jBz1zmTtg7dYv1Ya5bT2jzRxE=
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
Subject: [XEN PATCH v14 1/5] xen/pci: Add hypercall to support reset of pcidev
Date: Tue, 3 Sep 2024 15:04:20 +0800
Message-ID: <20240903070424.982218-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903070424.982218-1-Jiqian.Chen@amd.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: ee918785-d443-466e-a8af-08dccbe6b217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oN7ebrUp4L2A1T/Mqod01VoXijWqmIezZOnzjW9cgtFwrfGkM88W6IjWcDCc?=
 =?us-ascii?Q?w/VTk5QhHoOV/lPMm6ptpFzvZM+p9W7S2K3WcKTSIv1Hs15cqD7YxvvmGGYF?=
 =?us-ascii?Q?/soMwau1uVWwspJyZyYG9LgXMPElucYfryn88mo8KwGlPhuzozIZdL9qsNlR?=
 =?us-ascii?Q?n3qkNJFyi0SfaTELxQY54VoDhuhjW/vCuXEMSeGNuH+QQmmRUJUZyTJ8lWwm?=
 =?us-ascii?Q?kV3gK32teJhsOqeYVgJ5xQ2bRJmwlkmwEY9HVILdmqQS/NQhTSzF/rn+EiDL?=
 =?us-ascii?Q?8cscnKC6hHbIiZBzPR/wdBbitCTN+0LYt/UbSYH+GBsOIGq/SF0zyOFGb54v?=
 =?us-ascii?Q?z5aOXJbUhBNUm08fQakS5LJrmO9ec1bacf/OjYDoiGocmVm6Pg6Gv7+yqaDV?=
 =?us-ascii?Q?77ERLJ5aj0deCxpZehpHZYvLebd3Di9e/fTNVPh0SHPMBnTbMcl4EYRJeYhe?=
 =?us-ascii?Q?VhOMjwGGe2R9erJiFTfBBp9KhOkq75g9o2dWlFS1PF+poZuvdvb8irYcpGxj?=
 =?us-ascii?Q?g3M213+z+vs4U+T96RwrQS5XgX2UTvZdB1nKcGjAi7GXQUvoyBLCnThzVHYQ?=
 =?us-ascii?Q?hvp0gK+AORtbxqGn3Wzkdo1C6ZCnK8r4g+Dn/ByxL0ikVBiy5hBZPG9R8T9a?=
 =?us-ascii?Q?mUfeTdQIgyYp+L5DKHkMy9eaa86Z4kWtM9np0rWVhSf9PAQz5sMMMrlI4T5x?=
 =?us-ascii?Q?IBBEk4Gt39B1hHV2A5NajOZWe7S6mOgjWzmRUfOtXj0uP2YAbhgDyHVws+xB?=
 =?us-ascii?Q?W/HYt0zood4B8/0fV222g/NESU5EMDm8p+d75li2AgcHikNMK4yCDUf/XSb5?=
 =?us-ascii?Q?1JLXI3iHDkfFGy0mTj9DR2ai7vNj4TOBDwaSBW/T0GIAAI1Zy7QzsMQNKMkZ?=
 =?us-ascii?Q?DUD19zzLmh+1AGKEPKoqaWYSSzfZZ1FHM0T8sDoMFepFvoCaGs+I0RcB4Jq/?=
 =?us-ascii?Q?3Nucx1PIyBq5WlWxe5wZwJ0slMQS3pYg8+rLzqDL4zhwqx7JgQWFPNHqjTze?=
 =?us-ascii?Q?4SdeLNdAOdE4kQVVFq9Y9SJhui5WmR1CcGzAl30P5QfgFr0RUdrrcuk/85VO?=
 =?us-ascii?Q?NyBmkcBoqltr2N91SRN4175HxnQNrt91zVangV5rkCqH6L0+K3aQuW9dV5Ux?=
 =?us-ascii?Q?1It2M01KRmfZf+HixCPkbIKBeqDLNYW9mPcx18xcEXdFxv2KEJblUe1u4xEI?=
 =?us-ascii?Q?aUzHlp2FC/GftAMSS9dT6mdDXs1m8evokiJGoCSmTYVekfHdwL4RouzE59PA?=
 =?us-ascii?Q?ONK9s4y1cWOmabVcQeyHVb9pTAJTtI59JTPJELDgPt3zt9b17ecnBkhQkwVL?=
 =?us-ascii?Q?GpdQ8OHuHp+xxwatRpfBULn/Ly+i0xqJRhQo3mwpU8gwn3isc1rjVvcdluiZ?=
 =?us-ascii?Q?e4XtXzKiGZ2OStM1wlu1Zh5jOnkUzSb42l2Iz3Zy4NHNVl8NNuh8BzyhLyWJ?=
 =?us-ascii?Q?VNkpWM2InSlYnb38zUm6Fvsz8+oBrwP6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:04:46.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee918785-d443-466e-a8af-08dccbe6b217
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666

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
v13->v14 changes:
Removed the check ( !is_pci_passthrough_enabled() ).
Added if ( dev_reset.flags & ~PCI_DEVICE_RESET_MASK ) to check if the other bits are zero.

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

for patch 1
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
 xen/include/public/physdev.h | 17 ++++++++++++
 xen/include/xen/vpci.h       |  6 +++++
 4 files changed, 76 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 44342e7e7fc3..f023f7879e24 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..0161a85e1e9c 100644
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
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+
+        ret = -EINVAL;
+        if ( dev_reset.flags & ~PCI_DEVICE_RESET_MASK )
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
+            ret = -EINVAL;
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
index f0c0d4727c0b..45e1c18541c8 100644
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
+#define PHYSDEVOP_pci_device_reset      32
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



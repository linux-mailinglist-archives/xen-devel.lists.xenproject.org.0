Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483688F7F2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698787.1090917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLL-0005HY-58; Thu, 28 Mar 2024 06:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698787.1090917; Thu, 28 Mar 2024 06:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLL-0005Fn-1d; Thu, 28 Mar 2024 06:34:31 +0000
Received: by outflank-mailman (input) for mailman id 698787;
 Thu, 28 Mar 2024 06:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjLK-00050u-1K
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:34:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39cdb8f5-eccd-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:34:29 +0100 (CET)
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 06:34:25 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::c0) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25 via Frontend
 Transport; Thu, 28 Mar 2024 06:34:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:34:24 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:34:20 -0500
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
X-Inumbo-ID: 39cdb8f5-eccd-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgMdqZoIFyzvcLSnGCLx/7HONHgwmhpuc0sfUlgmurKsHfls3K5LgEjb4o6N3qdK6NZQW392diyllmkVuBDEZYH1OlrizMZiqM/ZU/+0gQR6c4Hf1YaVAOlbR6SAp9LGtNqmn0h313O/HNT2ATaQPT3HiDMXjeJMGjUS7n2957DV0AHiaL4lezKnnnMtQH74yD5yAub/j07wh/P8ZALWPD4AGlaunMDcxklvLaikXskBnZPe7RoZ4SxrY2yIwYdh+Fg49HpQeuEoDjEfW6uS30IstM4KkcX3ignGO7gQmM65Ju9LufHwyNNhv8xBXUr55ELpQYTaFnSpKfITdY/Yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGh6+DBUR12UnhAId2zcgyQdtB6rlh4Opu5QWVMJXa4=;
 b=TLhJQxsz2Xew5YykrCfJHyq7hBwrDuI624CTyRacovEnZp7jdE3sPXeSxIQCPO6BblErJzpIMBXyJxeDgF6/UhDBWfbnvmkZGEsRvmQk2vLVbVHaTKijNqy+ChiqsBZ23mlxL7HV14XhUqU8CFBGY52PuA2U3aKZiWvZif38xSGxj5iVJDwyv+jTAFCjMWtNeQZ07QnMovHFZ2OKLfNl5G5Q1IRoBFn52MVBJoo8aWi6RYrqtPotVgIP2VR9dk1O5movkm3ScZdSpuSJFTNtAKBaQ8O9fH7Wju9Xod+HoiuVAhMbQpNRl3QRQyWMJn0qecM+2fu10DordPSPUVb5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGh6+DBUR12UnhAId2zcgyQdtB6rlh4Opu5QWVMJXa4=;
 b=XWCFdmcuxhMUHonDFLCY2kEf877m2QJnCik/vkHVrLlJf+VTfl1nSuVUTa7qkuGd5LUTVTy7UEb2kNFbmsQENPBrIIbfIfhY4+tr3UNd9MDzNa1zvb4uyB4ZovyIpEnVfN48BuXZPeF3Js+rJxORBQ2wpUcincI1cFlhXRvnKfQ=
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
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [XEN PATCH v6 1/5] xen/vpci: Clear all vpci status of device
Date: Thu, 28 Mar 2024 14:33:58 +0800
Message-ID: <20240328063402.354496-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328063402.354496-1-Jiqian.Chen@amd.com>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 98df1f78-2d36-4327-2034-08dc4ef11c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mzOqEtOKuHfgxPtFet6T7OJsUrtO7mBJrJzBKaBv6EjZojLPB//IkWq5mm++PRbnvyOTZ8SLlR8DYCIJVPAnxu04lLE6Raix/4LgtWnW11rEMG1OtMmRTtMEGGljek5XFxxs9cdUBtVCOLumx6o33HJlwHIG9nZGwFIA2AmWZqnxlAYU0MwIdGQE830EFXk5Jbfu/6Z5umW434zQtvQtzA1g82T5TORUmWJd5X10e/APv046RUpu8RX4h5DLcGERdfSmV3QCLnBdgFxe4tRLUYwLIkxEz76bepxIlV8FAyT6YeyDCXMlfAO4wu+SE3JXXCnWfYu0HtJpIkIVgWpXHYolI0NMc2nJHOME8YqGm/UNWkaV6vA+I3sUFjrokueG3e8sTySW/GGfI+vaJWnSOOL0/g9jcuLkXIJcZ3CSHgpneKSpLEuivi0yRK4q8oeMIHbh/s6BsEmSC7awF+1lUFYZ7oHE/cea5ZVDFAw1hioRXmIUxj2yn1t9xEWxohDON3sMlXQSPTs883wYxuJHvAoL42ZVhywoEbZ4sNvtTdjVNjR+zxoJrDCuFXBdlmMP96LAxaIBksRHncvwAUPTlLPxIS9XPUiqRxwuqhv0YSamaaRS+mC8reKzHwwj1H51Cr+jtWVIYlIlD31S9N6GYrJjhKwg9vbGTMOnpa79v+FrFgypVEUbs9I37IBlDYjtCFO10xWifflrzqV5NPPRtFCjb7sTrQwKgXBuwJefwyLwCqqWIgX/rLMBPwJRET+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(7416005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:34:24.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98df1f78-2d36-4327-2034-08dc4ef11c24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 36 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 ++++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 60 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index eeb73e1aa5d0..6ad5b4d5f11f 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..73dc8f058b0e 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,41 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct physdev_pci_device dev;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
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
+        ret = vpci_reset_device_state(pdev);
+        write_unlock(&pdev->domain->pci_lock);
+        pcidevs_unlock();
+        if ( ret )
+            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 260b72875ee1..310700c1e775 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -117,6 +117,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_locked());
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..f5bab1f29779 100644
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
+#define PHYSDEVOP_pci_device_state_reset     32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e89c571890b2..ea64d94e818b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -266,6 +267,11 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
 static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1



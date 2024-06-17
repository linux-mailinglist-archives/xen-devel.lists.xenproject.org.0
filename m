Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD20590A8E7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741966.1148670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Ee-0002Ae-BJ; Mon, 17 Jun 2024 09:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741966.1148670; Mon, 17 Jun 2024 09:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Ee-00029B-7l; Mon, 17 Jun 2024 09:01:08 +0000
Received: by outflank-mailman (input) for mailman id 741966;
 Mon, 17 Jun 2024 09:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d9pI=NT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJ8Ec-0001sw-GB
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:01:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffbf5d6-2c88-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 11:01:04 +0200 (CEST)
Received: from MN2PR01CA0008.prod.exchangelabs.com (2603:10b6:208:10c::21) by
 PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:00:59 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:10c:cafe::a6) by MN2PR01CA0008.outlook.office365.com
 (2603:10b6:208:10c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26 via Frontend
 Transport; Mon, 17 Jun 2024 09:00:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:00:58 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:00:53 -0500
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
X-Inumbo-ID: 1ffbf5d6-2c88-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRjLJhaBRyDq+5cnyIt3BhRt5KVluu2NxTVNPUGwJlKw1InukZqCBywBXC18BwEFkrXFGbCC3g6cNQnWxFrehSETN3mT1Irb/yd2x3sqXuZWi+9fz7AGOq2gei8/tsIjSPExMas+ys7AsqBMw3DLkSq1pNaAUnur7/nK8K0tO5X/zJJR8U0P04goAgKeu6P8efTmWjLV9luOhudDkuI7rluIDwqwCFb92n904MOk9xT9zFbWRaIn1pGcwjwjT8IlXt2sfyBT0AwzPktnjGTI7URhe2LdXqeY7roaotSorspQKDsXP99YZ4mS5FhgeVMXXZSmysD6R0UunMtT3FkUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjVitUbIkh6X7zuVbHNzZlFo2M2H+RQ3FnoFSkKO2gs=;
 b=A1Ntup4jSkAYzLUqnGCMumzFl18Au7QEguno3hubW9WvG08qwk9kxbp4MjyunommKBCtNEaWS9+m6f/1ECbkvFpPtFFPqic6juGzrMbdfSQCQsCtf7WeDf8K+th4u/lNsY0vOFxJhu4u6g6O6MIWr7IvByZk9Gl++RIdQ2KMYokjaZ2AtQELoA3Sd5Xr1OKXt3XibJnVHIJWSctB9h0r0jsz/q9VqyEJTMbkHJCsO4IQ4d4kEmruu/eRcK0IkQTUIiinnRfOb7EvkdCuX7jUyRKuR9mlAB8N67bKKOaTydjXVxDC5OHc1Ecqjb3wKubVfW9rzx+q2JSRP46Kn4vEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjVitUbIkh6X7zuVbHNzZlFo2M2H+RQ3FnoFSkKO2gs=;
 b=BcUStHgYHssKuWcHCfU9KTKx6PCYFsjKSoQtlXIbRSY7wzWpwmN67sBtBf6e9rUE9GMDULa9NSwF2an9Mne87OeJMHlPPDR2yOPNz86s2+RnqIEBIg4/NK+QtUZmLTyoWNqBGylyw8k0XdZVYqIRbCHt/FSYHB26byivzDzd19Q=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
Date: Mon, 17 Jun 2024 17:00:31 +0800
Message-ID: <20240617090035.839640-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617090035.839640-1-Jiqian.Chen@amd.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1566a5-fe34-4277-0ece-08dc8eac0147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|7416011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6RPTYonk2L2i5ysRafTrcPq/HKcR17Hqdf30Osu6YVx/iTiMrl+P/PvTnsxp?=
 =?us-ascii?Q?hz1dAKZMjIM5KVL05ZfQ9qOW42+Ctk++V/nFKj+g3Sh/UU51sr467VcPSE3n?=
 =?us-ascii?Q?redB53M8i/azOd4bpYSwW+R9z8yaM7Q2D0dXuI8+FQmjtJJ52SV6B7ZnDkvo?=
 =?us-ascii?Q?8IUCZEDoW2SL2+4MoDF3JH03kaDbW70rFzhClGaOGryaW5DYjoALNseXkv2j?=
 =?us-ascii?Q?Hbo4yp5/ymn/ZiSAOj2sFbmo2EBSD3JkIaR6dsjB+IxRpiMLl1umufhjso+k?=
 =?us-ascii?Q?L8KUg72MTL5a5hTBo/rsNTHrNXLl7kAY4jvff7Ef/k8Z6Yfo8+S2GHYqFdVF?=
 =?us-ascii?Q?7AtNZYLrPWLK8L0jU2qY2SFhPCNvobYSEtyXyphZMOG2CEmymXbMeeky7wuY?=
 =?us-ascii?Q?0wjbHq6NYTgUNfp2j2qhtUMTiE5Sw5GUueT7HHiK/uPDpPlrAg37eZu6gN8a?=
 =?us-ascii?Q?YmTM6VOcP8B4CerjzehvK4/effPMfR6mSFMBkXQ5TuGVloR08EoZdh26yNPv?=
 =?us-ascii?Q?Y1ONvK5gZPn6iqQjd6HEC7CWIeNdUWRijchu28Sb/Hr+3KBSzG+Zwp1PwK0M?=
 =?us-ascii?Q?+X+YtPwnA6fx8/7eGsf4k4QHYmImEFpMU3Dq/ax24i6AFu7kKKx7L+LY6GF9?=
 =?us-ascii?Q?xBeLGNWtG1Pb77/HWNyaZYXy8SjGxTumul6qf24CuoS23vX+P+ZR6OzTCabO?=
 =?us-ascii?Q?uvyzQAwlCecMs0c4VgiCJHJK7P1d0Rp4FSzihxTQwHyxjtgsNb0eyWwSc+K1?=
 =?us-ascii?Q?qrr3FI+xGh4fxe5snwi57fWXNRw7GQ52E/tUnqpqh28zTRT9wnvdGR9rS+HU?=
 =?us-ascii?Q?r1pTnUaNfzFMPSYEE1eqepQB9TpATjdXCmMiFcAWJM55C8+Z0Ui7mBB5wgBJ?=
 =?us-ascii?Q?6DZV7PIbQOZUVhNlgv6i4mvk98Rcz2bDArcVCv3mXA1yQvETPkiIcKpccBdj?=
 =?us-ascii?Q?KQNTejNJlFBQ8DInENo6K8asotXrfNi1/OargzsYSA9v1RZrwv9KjuikBIFu?=
 =?us-ascii?Q?jWPJVWvseVD/qo2gj769/CZ9w80dzPJjAegfVQwbP6kS5Dy5lBxiczu43su8?=
 =?us-ascii?Q?/HyC1jicS7PjxOce/9NluqtuZMlKqrrfEthfmPx2+m4tKllC/XxMgt3GiFdb?=
 =?us-ascii?Q?H5NL/31QRYUucxYovScjUHEiMou9j1McSOD2XoyP7BLzMYpysoQrAS3+fxPo?=
 =?us-ascii?Q?wWcjsboTrEkdiHg4YFGyn7vxC/SUhNsVdoEOhNEY+VYcXTv3RyEhBK2hAmbT?=
 =?us-ascii?Q?VOOJJjalO5k6hm6rMLjv/lNnfdgMO4VKt1B+Zq4vwNfztsOaMoL9iKIjAY8D?=
 =?us-ascii?Q?Kje67HxwbfgDgUteR/Ry2oIBJVGW0m41Yrb6DaRzvhWkZlOT4oJulS/7XT3L?=
 =?us-ascii?Q?PGo0Cmna1MNAnPSVaNfYp1LOn4XotpSjNA41c7s61QsksHMzrA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(7416011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:00:58.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1566a5-fe34-4277-0ece-08dc8eac0147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 43 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 ++++++++
 xen/include/public/physdev.h |  7 ++++++
 xen/include/xen/pci.h        | 16 ++++++++++++++
 xen/include/xen/vpci.h       |  6 +++++
 6 files changed, 82 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 7fb3136f0c7c..0fab670a4871 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..1cce508a73b1 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,11 +2,17 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
 #endif
 
+static const struct pci_device_state_reset_method
+                    pci_device_state_reset_methods[] = {
+    [ DEVICE_RESET_FLR ].reset_fn = vpci_reset_device_state,
+};
+
 ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     ret_t ret;
@@ -67,6 +73,43 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct pci_device_state_reset dev_reset;
+        struct physdev_pci_device *dev;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+        dev = &dev_reset.dev;
+        sbdf = PCI_SBDF(dev->seg, dev->bus, dev->devfn);
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
+        ret = pci_device_state_reset_methods[dev_reset.reset_type].reset_fn(pdev);
+        write_unlock(&pdev->domain->pci_lock);
+        if ( ret )
+            printk(XENLOG_ERR "%pp: failed to reset vPCI device state\n", &sbdf);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..ff67c2550ccb 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -172,6 +172,15 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..a71da5892e5f 100644
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
+#define PHYSDEVOP_pci_device_state_reset 32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..376981f9da98 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -156,6 +156,22 @@ struct pci_dev {
     struct vpci *vpci;
 };
 
+struct pci_device_state_reset_method {
+    int (*reset_fn)(struct pci_dev *pdev);
+};
+
+enum pci_device_state_reset_type {
+    DEVICE_RESET_FLR,
+    DEVICE_RESET_COLD,
+    DEVICE_RESET_WARM,
+    DEVICE_RESET_HOT,
+};
+
+struct pci_device_state_reset {
+    struct physdev_pci_device dev;
+    enum pci_device_state_reset_type reset_type;
+};
+
 #define for_each_pdev(domain, pdev) \
     list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index da8d0f41e6f4..b230fd374de5 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -38,6 +38,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -282,6 +283,11 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
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



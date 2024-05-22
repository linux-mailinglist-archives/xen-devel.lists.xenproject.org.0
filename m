Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8598CC948
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727912.1132624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwM-0000z8-I2; Wed, 22 May 2024 23:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727912.1132624; Wed, 22 May 2024 23:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwM-0000w5-EA; Wed, 22 May 2024 23:00:10 +0000
Received: by outflank-mailman (input) for mailman id 727912;
 Wed, 22 May 2024 23:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uwL-0007HJ-Om
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 23:00:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 089cad80-188f-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 01:00:09 +0200 (CEST)
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 23:00:04 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::69) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21 via Frontend
 Transport; Wed, 22 May 2024 23:00:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 23:00:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:00:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:00:02 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 18:00:01 -0500
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
X-Inumbo-ID: 089cad80-188f-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCb1Jg5weSlF7ymph+4mnXbVHH52neQ8HxIphgiqeUC1nTyEzXEBdb2IEGrUJr3OrGT4nERAU9SOvLFs+u2de8U0tSeVlpQo5kWpfiKThUEURakGQmAQpypxjPXmIYkvVqCqtb9bSg3TgTgPhMTBqw//zY7+DE+cF9MybQLTQx5dIWxLtwms9PitwjBJJhWG9vsNjpZ17UBxkCEC2P8XJ+cl5EFwbHSV+lAbm1RnzAL7UC7/MITtPQGSWkXEslhak5hcZJwX47e/IKMNStdwCWHbjlrocIlXTm4okiwbGvpazRBn2DDm7ecvJ13jJHLy04gsEwbfF0jemfelstkQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91z7nZP+Kt+sNbijuSvMEIgPYCMJ9j1zgXB7s2O6sEQ=;
 b=og2OV92dLpYsp9J64GHz2H2Q96S3uwXHDfmxxpXxVAgTs8CVGQKYhjAJwI5uI9oURm16wJIBCdvKFLCpVjoBqS3kkppBzbdBFaM7iv46uZZZp0HKAZkhXzaWquW77PAc0J9i4pA1Dy/l2aI8HlGcJe5dBK2JXE5/zmyiZkZf8UgLt3h7a+puXWmzti10lCkyvnKecn4W3Q/hlB7pCl9EykcZv9NbXCtTRDdkM6L1Rqs99OG2co4AkpmXhpFyys7KBc/r6lEQw/UgN3EBAizMAQx5pfiUxqJkPf8oXiootOqKyBoBiKEPUBRt3BVf/CoZq8aTn8fwrDIcMlfM683deQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91z7nZP+Kt+sNbijuSvMEIgPYCMJ9j1zgXB7s2O6sEQ=;
 b=RNZFhMhSaBudPjYAYP1zM0OkfmvRZoms4Sr+kRv94c0R0dMRzm4P8euQnwdD3StHsrLoc5r9FCVywhqoTb75seWCcgta5lvJu7ojUP9h82B/cAnQxRZjc+ewiqwaIyDCQYsbXXYogXPxOiFe+y/t3KHNp9rYtpHsHFFM3zln5pU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v16 3/5] vpci: add initial support for virtual PCI bus topology
Date: Wed, 22 May 2024 18:59:22 -0400
Message-ID: <20240522225927.77398-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3882d1c7-f221-4ec9-c588-08dc7ab2ea80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fcj013H94GzpQGmy8lHng1XcpRo2lzRsJ6evaN1+TWJ81nxgt14dWo50z6zV?=
 =?us-ascii?Q?mavcrcnSBVCG3qhIjzJv9lusbvsM8mRmy+nKNg8vvMC/ymOUX80ZOnJ3qIkS?=
 =?us-ascii?Q?AVLUfiLqcOkeOGNNU76099uJa8Oc6i8ZAeGW50+0qADE51V5zBqQfvWjtrnK?=
 =?us-ascii?Q?ig459zMPHsajQl8F15YcKIWi9QkZ7wiVsOgZlKNcyVPr1+6V+Uo5YgVIRSEt?=
 =?us-ascii?Q?+CkunmPX0K967Qik9NKFmCHQH4hB06P1O7Eud/TfBbKg1Golt7Y38TuXeoxO?=
 =?us-ascii?Q?iXCraScHuBYSOv6G5sj7ybodC5JfBplNwTNzbWPvLLoBkJayf/BJmoAAdAil?=
 =?us-ascii?Q?z0ROZZdB9k2lGOzVmSk24ck/r3ihS5ybGfoJgHNZtu1Ae1oaIax8YazBkxR4?=
 =?us-ascii?Q?Wcbli7SkM7Ym1D4aKBxSy3RNk5xXgjr+eexz0PkwGpUovCpU3m6gkOY8ayq4?=
 =?us-ascii?Q?IeEyBIxk7XGFMiw0RbhmYw6M3BFwOPj2rwg90sl06h63w2w/ie0+8zmfrWmM?=
 =?us-ascii?Q?zzM5+bdi7LabiRLfqzhr7ncxmaI7XIz+v5R48M9QpmEJq59Wz3FH0Cj1YNmB?=
 =?us-ascii?Q?k/FKX36JLsDtiimIMI6EANM+UCERYq8zU/OSXE1I4luiuC8Emr+57w8+lIS4?=
 =?us-ascii?Q?LdZZuJTcA9NngD+j5Pm+R38222UvwPcWhI2cal4Rn0vSy4QhAMeN1EzaHt8c?=
 =?us-ascii?Q?naBLPXQ64YcvtAQPUxzbhpylGBKLTZ1Q9POvLuMbKstHiOjaB7Cs73nU1Q/a?=
 =?us-ascii?Q?9Egv2vNV4534K3MFVN1JEhZn91bXpugwO3vm3kpIVKBtcn1r3u3FwQ7hk/aK?=
 =?us-ascii?Q?jx5U5VxvepK8spUZhxCllr4ShYFCgO0O0zyv1cLAw1yJpKpdqP4DbkZb9eoG?=
 =?us-ascii?Q?ZXwjrelUqKWb6DgqrsF3SJyyBhVyLJZ64AbTric0RK5Bv6l28XReoQyx+VpQ?=
 =?us-ascii?Q?A9jC+n3jwj+5uTZMdA/g5aK7iSdOrcl1HWZBi/qg9ywaxVsdjKaefkME0SFq?=
 =?us-ascii?Q?QwXixwhOh+O5LVCgDlkKu+CfgFNLPCVogcKv+7nfe5qJdjy7lFf6m3WT/lK1?=
 =?us-ascii?Q?Drv5LI8YVXsemg9vyWUEDXXcLXbqLqjwPfa/SgWf4Q+jXD+3Y6BgQJGqi8q0?=
 =?us-ascii?Q?1kqRES1WB2s+At6J81moqlljy8sKAsUFfHUZ0zXYkZNEpMJvZUnECwEmMRjo?=
 =?us-ascii?Q?sAFIyKaLE6pZbt0hSP3lEyK4miIagSm8nVCOPc5nq+GI1k8QxDJqGO5wQHis?=
 =?us-ascii?Q?EcCoKEqnl/XNOPVFnXI1QaT4xgdNm0COd/2u1YgOgCnJyDNwjv3VeO5MlWN7?=
 =?us-ascii?Q?RUhb1qkR9tVPWbbd0AXcUQsYpkBFgHZZsk6cacJmCehZJT5NNGXBAYqe4WHL?=
 =?us-ascii?Q?3WkGzXA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 23:00:03.6217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3882d1c7-f221-4ec9-c588-08dc7ab2ea80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
In v16:
- s/add_virtual_device/assign_virtual_sbdf/
- move ASSERT(rw_is_write_locked(&pdev->domain->pci_lock)) earlier
- add #define INVALID_GUEST_SBDF
In v15:
- add Jan's A-b
In v13:
- s/depends on/select/ in Kconfig
- check pdev->sbdf.fn instead of two booleans in add_virtual_device()
- comment #endifs in sched.h
- clarify comment about limits in vpci.h with seg/bus limit
In v11:
- Fixed code formatting
- Removed bogus write_unlock() call
- Fixed type for new_dev_number
In v10:
- Removed ASSERT(pcidevs_locked())
- Removed redundant code (local sbdf variable, clearing sbdf during
device removal, etc)
- Added __maybe_unused attribute to "out:" label
- Introduced HAS_VPCI_GUEST_SUPPORT Kconfig option, as this is the
  first patch where it is used (previously was in "vpci: add hooks for
  PCI device assign/de-assign")
In v9:
- Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
In v8:
- Added write lock in add_virtual_device
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/Kconfig     |  4 +++
 xen/drivers/vpci/vpci.c | 57 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h | 10 +++++++-
 xen/include/xen/vpci.h  | 13 ++++++++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47a6..20050e9bb8b3 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
 
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	select HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 97e115dc5798..1e6aa5d799b9 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -40,6 +40,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int assign_virtual_sbdf(struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    unsigned int new_dev_number;
+
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->sbdf.fn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number == VPCI_MAX_VIRT_DEV )
+        return -ENOSPC;
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    pdev->vpci->guest_sbdf = PCI_SBDF(0, 0, new_dev_number, 0);
+
+    return 0;
+}
+
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -49,6 +92,12 @@ void vpci_deassign_device(struct pci_dev *pdev)
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+#endif
+
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
@@ -103,6 +152,13 @@ int vpci_assign_device(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf = INVALID_GUEST_SBDF;
+    rc = assign_virtual_sbdf(pdev);
+    if ( rc )
+        goto out;
+#endif
+
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
         rc = __start_vpci_array[i](pdev);
@@ -110,6 +166,7 @@ int vpci_assign_device(struct pci_dev *pdev)
             break;
     }
 
+ out: __maybe_unused;
     if ( rc )
         vpci_deassign_device(pdev);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 132b84199598..2dcd1d1a4f8a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -486,7 +486,15 @@ struct domain
      * 2. pdev->vpci->lock
      */
     rwlock_t pci_lock;
-#endif
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+#endif /* CONFIG_HAS_PCI */
 
 #ifdef CONFIG_HAS_PASSTHROUGH
     struct domain_iommu iommu;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 2064d9354f5b..da8d0f41e6f4 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,14 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ * This limit implies only segment 0, bus 0 is supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) = (x)
@@ -175,6 +183,11 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+#define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf = ~0U })
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
 
-- 
2.45.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76C8C8A8D
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724364.1129625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813C-0007Nh-BE; Fri, 17 May 2024 17:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724364.1129625; Fri, 17 May 2024 17:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813C-0007LT-80; Fri, 17 May 2024 17:07:22 +0000
Received: by outflank-mailman (input) for mailman id 724364;
 Fri, 17 May 2024 17:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s813A-0006C6-OQ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:07:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea53e26b-146f-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 19:07:19 +0200 (CEST)
Received: from DM6PR13CA0061.namprd13.prod.outlook.com (2603:10b6:5:134::38)
 by PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 17:07:13 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:5:134:cafe::d3) by DM6PR13CA0061.outlook.office365.com
 (2603:10b6:5:134::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.13 via Frontend
 Transport; Fri, 17 May 2024 17:07:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:07:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:58 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:06:57 -0500
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
X-Inumbo-ID: ea53e26b-146f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXlIt6aRLa/lQKTfM+WWsVar9wDtckkBisIw8/U4Arw0/P7gsnMk+eY6LuuouvOQc3nrUENeMy8QWbhF3BQnGHV7qeSuB6FALovQF70pnPgjkmTJY1Uhkk/4XT/6oTUmJ+p03Lm9EGHRQA0Lrt05E8RaRUgSx9hRDKfMDvFeQDlSH1O8DQVKjDqpK8Qvh45NJBM7ekphsKSwoNGHlj/u9kVRNx+lkZW67QHK0hmgEjAJd7oQ4SaqiJjy21xIE+/cIsaxm+yxOAFY01pl3zdcYnhEpytBECtJ5YWqYIlK3D+sKVz/XLYY+0tw1kLUTNxDSWDxNW9s+rYtYqQu8rAEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv7+nDlnnhjXbpYGAA9ivNDf2bKqLCBADTr28OUk9Vg=;
 b=aETuViYGb5htggsb9glyy2sZzlELADBNsd26btEK+QcbgRUYQ9UOK9HHyLlOW0s3xzazArgUcn279N4aeK1dOZCwS9Xel8QLfegtMJ7LOrAVT9GsFDvCJL/XlMKzRnqv4Zt2LDtB7IOWacfuiM9D1OWM7bdo8RQSK7YCT3hJJQGJ+pTSLp0lOtPSKkMdEkAZbmbivPq/5UjwUhtsYAL53TwBP0loOc3Kudy1PD64PQ8xZeN8UoSSUBUgsfWnjKpD5BnQzDhM6zJxpQuf59b0aRhQVjrkeTZ7O8/CkcAUmMS5/fjZmMroo5BYLTeDUF69IEyR3mvRwJ/2IyjZ7mBsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv7+nDlnnhjXbpYGAA9ivNDf2bKqLCBADTr28OUk9Vg=;
 b=AJ5xnYte03j+kOZ4Is6aWcOEyWtVqVhYOxflDYeXctbkZKM+CU7lnsQMJ262LiZhV5ldrO4+80kkvSWZkzais8O3eL3dqNyjDA6btvFATPnj0iuJq03HUJcvKlNe0Iv2S5H2P2LrYZowul/E3uuUVz1aSYm+oAM3ejJRPnngT+M=
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
Subject: [PATCH v15 3/5] vpci: add initial support for virtual PCI bus topology
Date: Fri, 17 May 2024 13:06:13 -0400
Message-ID: <20240517170619.45088-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517170619.45088-1-stewart.hildebrand@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 472dc026-7d09-452b-9f67-08dc7693cb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/i+5S5SGy2bG6UpvQvWOsdrdytOEUQj/mqE+G1xy11UV6daVf3zfRrNg9qzf?=
 =?us-ascii?Q?o7N/UVYNaMao2QpONcgAhgcP8AVfztautVjXy9Kl65EIUpIci7Pew3Sjtxgx?=
 =?us-ascii?Q?aKG9LMmyE9toE7COZUf9UDp/gGgVNABJV8vmz9Ji28Vg1a1uFDh/PTmEEIar?=
 =?us-ascii?Q?ijYyR1V9TDMOg+CL3e51w1x7Dwbcp4zp3Zul5YyNzX5qGVseQ/8ulb+JjiYl?=
 =?us-ascii?Q?MSGy/i+WLqNLg3I15L/r3JG+C/uQIS9eCAO7JL2CLUe3bKQ8/Cdr1kRjKBza?=
 =?us-ascii?Q?tG+4X61Zdw6VNoi9/Gv46xaGUk7Cn1q/ACJdYsgI+uS7sQAXWkXYi0VW2Sjk?=
 =?us-ascii?Q?Vx/O4fndl6+JeC2+CYCippRk5wXfjRrGJFJE3l8Ns5+5Zza8AjjQ4s4kVbWm?=
 =?us-ascii?Q?gprBgHqpDCssdi52Veq72sJFu1HyY7nQyig+uvpCLoIqUoK/QHEOfV/NIOM0?=
 =?us-ascii?Q?5qHqgb8iaHn0fRwNbDuCAJrA28yQ5h66YgepwM/84pswG5/SrXTCFF4Jn99n?=
 =?us-ascii?Q?36lsfTPXqWonCIfYnX/48gFq7m25TSaHf3BQYNPudIq0XJY8qz+Eq/bfnGyy?=
 =?us-ascii?Q?e3RVfjMCnaOdPriIhD6iSQldTOnhJ0EeN2EoQP+PODQBWqAt/KDly/8L2dRT?=
 =?us-ascii?Q?Qw3rab3uanExQFuEHIB2hpSNsFcsBObRL/Kx6SG/Dp93F1nUJZ/LUAgMr5v3?=
 =?us-ascii?Q?XwFU4hnPWhIiSuQczQA+t2AKnGvclLSYzwy8Pa09y3bKlQmTp8u0S5Y3R4RF?=
 =?us-ascii?Q?DPAi06gAelGBrb10iwenSpsMXyfi0H7guJI71ivHN+LECEs5UUKBibdl3kDG?=
 =?us-ascii?Q?Fa6o90i2uPaO4HO2jIyRERoP+NiT1IvVJ7AgOAedYvy/uHqiF8LzkTrG+b4u?=
 =?us-ascii?Q?c5MV4SpO2IvRlqQKNTa7vnGb9FPJ25e5CUc5BauayLF256LrHNhiUb+IPDgN?=
 =?us-ascii?Q?M/JwU+MhwVybQp7qn0LfStz0AyLouIomBWnVbmQqfoAiDJ7ApY8seKS3fEqJ?=
 =?us-ascii?Q?4D9mRKa8smVPErQKtrC5WUc1NT2wZsviFHkgShUihpUYtLZmgCNitwGwbI0/?=
 =?us-ascii?Q?dw6x1M6bvvVi1p22l+oghRjVv4fLt7c8MupoxlrXHRBi+RWwA4KZtae1DdA+?=
 =?us-ascii?Q?B2bft58yiptwdOr1d4I7h3rn4T1eGFaKddHvKR1JFyOSuJEa+Zf4qKOxsHLv?=
 =?us-ascii?Q?V9zy2BjoEOeHruL1Lyh3N/teBlyBD/BRy2ddYRHjWrB9Zf+Zy2+8i+v3SdBz?=
 =?us-ascii?Q?RJr1DPVooJ8FO7NAoL+rCVs/V2qoRKctAB7Qv24nP8NPNN3ElMu9X9Y92+vI?=
 =?us-ascii?Q?3V6ZY7JKvBQ9D6BXrWDe0Ve/MTuhtn7QXcVIHYrH/AfDyzRzPi5NQOqLRjd4?=
 =?us-ascii?Q?thDA/og=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:07:12.6272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 472dc026-7d09-452b-9f67-08dc7693cb8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887

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
 xen/include/xen/vpci.h  | 12 +++++++++
 4 files changed, 82 insertions(+), 1 deletion(-)

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
index 97e115dc5798..23722634d50b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -40,6 +40,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    unsigned int new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
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
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+    rc = add_virtual_device(pdev);
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
index 2064d9354f5b..980aded26fc1 100644
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
@@ -175,6 +183,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
 
-- 
2.45.1



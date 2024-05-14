Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE848C5812
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721582.1125125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tEp-0005N2-Ac; Tue, 14 May 2024 14:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721582.1125125; Tue, 14 May 2024 14:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tEp-0005Ke-6x; Tue, 14 May 2024 14:34:43 +0000
Received: by outflank-mailman (input) for mailman id 721582;
 Tue, 14 May 2024 14:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tEo-0004xK-IB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:34:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ab5345-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:34:41 +0200 (CEST)
Received: from MW4PR03CA0105.namprd03.prod.outlook.com (2603:10b6:303:b7::20)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:34:36 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::a) by MW4PR03CA0105.outlook.office365.com
 (2603:10b6:303:b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:34:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:34:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:34:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:34:32 -0500
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
X-Inumbo-ID: 18ab5345-11ff-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C86yrNUpMdZq+nJsTt1XuYh0Fw3MoV5MPVmkSU+eSZd3qBjQicV3Aj1B+FAh1UqEDM6EXvBnhYyLFL+Aeo3ETXB0iZgrifM0wsnbmeHswoilLKYG5fK/coeMSfXZ7msjPZ+NlWAHA5MoJW6ubZTjGWXTnzJkgx9+fWviRuHrqIVQyLDoRdEVW2dDBqEbbGp1LjQKXRSMG01fL0Mq23ZbiB4RJJ00yDef4G6GfWobaVNg5A1ju7deJjFOK7hDzjMX6uwr4Fj+Og3wiTy8/3bWTgLYoCc0hAW/qwjfAnLv785vfJ/K97wfAtjk01lgZEiOfwfgi34ICWesOmxfqkYB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snqZUZKvXcG+0ruyZzznMKpfTsrySOP3X8wsZHFKOLM=;
 b=P6CdCkh81NS3syoOwydVTeCj8ee0kUJRzIGeDnHBWhwgoN2CdATaH7JO6aXvudqM6BjidbOfj9zyCVDUWLtei98fVo9i3HixE2ecoMipHlrTx52pRotgsclYJI3Fh8yyAk9A939XCSN5Mwm3ZkSgaU6kU/8g3U7AAXhejAt7zVHkews1oLh4hrkl9AOou2XooHOxHE31/9ORTIU1gUwMOJT1YWPu8ek9IxoujMDFx/rZDHahhWxfdkukKBNLqWtZ5jIG/cJ3mMfaXfLdTttQe4l18XbIcXrgqE1PcBZCvPtphY243yZvAgh+A2OkDe17Qwz63gh/v/rsT6x2V+Uxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snqZUZKvXcG+0ruyZzznMKpfTsrySOP3X8wsZHFKOLM=;
 b=0TzH70P4RSpzIkBQp5+G6QXIJwjSp0cGsz4MrfjkZNOWHfioeURCRq0MgOdqva5UkKsqwBnLeSdrW+uO0gdqOAmzh5xDsGAYVdtEvj0bkxbO5xmXEXSVO6NaA5792OW94WttjLqoIQftPUVdqoqxPdf86zyFa/rJF/qaTeBq0ww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v14 2/5] vpci: add initial support for virtual PCI bus topology
Date: Tue, 14 May 2024 10:33:54 -0400
Message-ID: <20240514143400.152280-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514143400.152280-1-stewart.hildebrand@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: e10c92a1-2e7c-4b8d-d914-08dc7422fa4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IVwIASX5u+qR4utHccDLFQXnE7EQsaXNuJJvMcW01gKTsrAeVg+VwWsFk7S1?=
 =?us-ascii?Q?ASnNDy9K8ELwSgG7qHzfC+RsPbOjXobOf4pIf1wPx6Q+phTCIDUoq7NT8p3Q?=
 =?us-ascii?Q?HYJ1zYbMpr/nVIQ5/DsRD5GkglS2i1s6KjLCzZmNJPkzvf27DZBRPhf3L/Cc?=
 =?us-ascii?Q?8dCemJ5FOnSgrb4kVDDLEvYCasMfrWGrAdegQ3VF/gfRhfE+RrLQNShU4l9o?=
 =?us-ascii?Q?zuefA6JS9aJ/FCGMNWVnexC/cK39oPUszlTf3zIKm43aKJ+G5MQDzcglxKOL?=
 =?us-ascii?Q?1qe7UP6pKDON0AO41qtNcu+ZhEb19scbSuLPMOJoNFAByjcQxtcsCmQOmtjA?=
 =?us-ascii?Q?08Bk1cadOcLaXUFq9iFr5D7RBV5FDqyR2YzGNIJSOiPODqgbRfUCU8Zzerlb?=
 =?us-ascii?Q?7VIMlADsS41fgaIyl1abfB8EjNagV+N9pyHcptHVjHOusapZfnhVkeOJTCev?=
 =?us-ascii?Q?CbaZhACPLgwb0PKBE0yFA80NXW/3bWIdrXUNouDVu4PNOAYKcNXPi00mjru8?=
 =?us-ascii?Q?qrx3aCJ4Y4JFq3wiJSqomc2DtJjgA4Q1hzRkFRpcb5qoXr/Sk2fmUdP84SXN?=
 =?us-ascii?Q?Q31xxqS0TtTqHCHXLUo0x1PBQBaZiditXGHNrfKTnd8dvdF+wWcOCEWXbOWD?=
 =?us-ascii?Q?C+lBEDTAy4+ckcJKDZWj1fqOXUR6MCVcWLmJ6bXzasBVIFb7yzJNYjY/PP4T?=
 =?us-ascii?Q?2BwSWByxNFtnLcyGRf4We3ZZ1kYG9FVo0R5K/HuR5ddSqqyUq9lpF5Te7ZdC?=
 =?us-ascii?Q?JvKeZJ6jKl1ncJu14RHCbydrMpMtpwdR7UpzU7VFGTBkqB4vL5+yJjvODMxa?=
 =?us-ascii?Q?nbyiTw5NviUjWRr5jfktifNs1kFbTwMucI9kgbbJmNWRrnq6eXXhN+KxrX52?=
 =?us-ascii?Q?Jis91/kGxvK1LWukTTOEJpi2QcJXyEN3p9xPbNIGTXQklKzATho1RxwK3bFm?=
 =?us-ascii?Q?KZTmv0qUfeHFdjponjJVB6dOJ9HVMLDWuajvLJKtfy2d/sbtnKe4Ese0cXc4?=
 =?us-ascii?Q?GKhoaAw/2qHfYGNoOzLH1e7uPTL9ybb0Y8kpZfuBYlaOzQnOwSWba4Hp+uvK?=
 =?us-ascii?Q?KSlpbLofmY4CHijO7mABJBdnJ62UHUdn2VuyGD0RnwTEbHUfoUFjzZy4GPIh?=
 =?us-ascii?Q?UccAFIyzgIWK8yaW4RRrPSvkfe9s+coD40KMWlyd6xUSIf8Vr1lCRnLSEjg1?=
 =?us-ascii?Q?/vNbzO5pVvuNDyo5jYWolcDL0zrhphtiwpulO7188oL5NwV9jAiUjys0XAYH?=
 =?us-ascii?Q?6qNS2u3jyiS/K5V4+PQquuJfx38Tqi7BzVTaZiY64rZHqo+As9vpFx07awU8?=
 =?us-ascii?Q?bRTLujb+orULpK2hPI6KFg0gdneV/ImkOVItcpB3Th5gIaKyuWMOuqiIHhR2?=
 =?us-ascii?Q?Vqkju58=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:34:35.5296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c92a1-2e7c-4b8d-d914-08dc7422fa4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911

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
---
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
2.43.2



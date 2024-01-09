Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EEF828F63
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 23:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665079.1035304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKCL-0008MZ-2l; Tue, 09 Jan 2024 22:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665079.1035304; Tue, 09 Jan 2024 22:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKCK-0008LL-Uu; Tue, 09 Jan 2024 22:03:48 +0000
Received: by outflank-mailman (input) for mailman id 665079;
 Tue, 09 Jan 2024 22:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK3E-0007gG-Am
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:54:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b93a9c-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:54:22 +0100 (CET)
Received: from MN2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:208:a8::35)
 by SA1PR12MB7039.namprd12.prod.outlook.com (2603:10b6:806:24e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:54:19 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::10) by MN2PR12CA0022.outlook.office365.com
 (2603:10b6:208:a8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Tue, 9 Jan 2024 21:54:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:54:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:54:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 9 Jan
 2024 13:54:18 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:54:16 -0600
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
X-Inumbo-ID: a5b93a9c-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9BtIlizngkNSUc/TM76ErL6XdoEY2phrbSmdte7XhmX9iwS/cyDoqdaw4CCdwi/G64CFQG7TTdwHUzh1zbFFUhMqIIKGzQxO+QwEoCgkRTFuvLIIOUq5Gebui77UFOvUdQb6Rj4244dQV00WRAWnnbSoxRWI5KKJo9yBefT4P8kqJ8EojwsIVtVZnVRlnydtwm9cNr6Ht/XCUdDh/zpcsuPvZDFaZF++ofazneZMiAqCu1u4xXL9YZdG7KWNQYbrA/ObuQOdwxsDqxWoSozWqMwREOkotAw9OJFS99CYK2cOX7dRVjmAsqK1WmzWlsHFiOuabggA72zolb81i+bEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzlfpTzl8irwryHRYk7h7olENGrZhukS2mcF6gt7c7w=;
 b=GCy/8CZ5YQHW21zvco9Bnfs76xEKP4oROxkZmxFFGLTL2zXzvoitHj9N/EX2hOzY01qKyjOQZwbYiZKN+2sdMAtkfUd1IqQhC45fcmt5c8FKlEnksG0hf1ypUTW8VmImJkLzTTufyNgpLveyG4/NJQNZXotpuNR9h/MmGVK3R9G6+nia8o7blDg+iYRrDAv9K2jPTmsPv09XCwrAQrpaIpDtq+dc+vA5Xsh44uPmW9i+uVWAVlRJBhJFhvJKiwmMElDxCf8uXo+3FuANHoX9BpxqgA3Dk0DNKCzQKXH5QcbQTmPPCl++VrzFhwpL0VYv4c7QmdPsnca4UVu8rEfgaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzlfpTzl8irwryHRYk7h7olENGrZhukS2mcF6gt7c7w=;
 b=mSXNX9wLyARp/+kLY6hWFsOC4A0AmrySPfADAoOfHMXloyMgAIPTbx0IQCss7hny8O5Prsq1/b7e3ifPc+8pHAuvjht/YwR790W5BjW4DeGOonATPaJq1XJcroD/asITlBShJbf+TyOFLrk9RQvqQggh3tzh1853C6ua/O93ib4=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus topology
Date: Tue, 9 Jan 2024 16:51:26 -0500
Message-ID: <20240109215145.430207-12-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|SA1PR12MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: e25ff8bf-35b0-493b-c94f-08dc115d87c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1kY4rpoNWAyUo6LHB6bUj8h5SaQuz0mkr1VrTLi08ns8DVl71qwpd64jJaWCzwJ9l1tmx7EPN/Yw0v8rQweUFFHy/j5xuUa4ZPdUdCBFugDi7I/9z55/9APfjrRONGujtym29/6LcIADumQuqplWCL5AE1ksw9lUVLCSbGstLLUKbjUdq29kCC41U5Vaa6hWwGILHHk1MeBLmUABxFzD5pJ/RUeRBvmeBkNqAkgMe/1OFpCY9T2mPPk9dVPfxUwC2dpVgPvU1QHX6tbJkzuzI/QQUUlzzx/MaHPrkNS6QkaDzOp3MUEDygAyXjeIx0uYyYTMtOrSGN5eniUPCQxSqxLxWeG9/O+/MjKAqL9mM4j6XjltOJip775s73KNzZzY72SBgxuqs7ax9yM8u2/PnCKVfo0vAV7brrzK4tgCEVoshf59Pnm9n6XP/umEW2eNLlhQz/0CS+WWejioIu/ft5gBcn/4W5Wy4ggkw5xREXvIBe0V0vI/CiNlzkH8i9DHfkr0cT/kc5ARgwBQLq/UYcnatEr9n/u7BtUwRv+MEXepMdkmJdSQdpUcdyc7rntdN7SqB4/67BSovhwwp5j2lStTURBM6h/48rzWSs535j9YFMmwT2H4KnXd3elX7dYe88lZ3cM45VEe8r+i/E8JBvn0f/RN0PGNKbN3ajvcf/67kZ6kja9qKkQPgbPLsQiwCKqslYanXeJssniln+jjlJG2NFMXfqR2YqshDZstKdR2UD2NNOaQ3PllqkLFizpuEX1ODdHxviw/w3Cqewcr6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(83380400001)(426003)(1076003)(336012)(26005)(2616005)(36860700001)(82740400003)(47076005)(4326008)(8676002)(8936002)(7416002)(44832011)(6916009)(5660300002)(2906002)(6666004)(478600001)(316002)(70586007)(70206006)(86362001)(41300700001)(54906003)(356005)(36756003)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:54:18.6790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e25ff8bf-35b0-493b-c94f-08dc115d87c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7039

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
 xen/include/xen/sched.h |  8 ++++++
 xen/include/xen/vpci.h  | 11 ++++++++
 4 files changed, 80 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47a6..780490cf8e39 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
 
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a0e8b1012509..57cfabfd9ad3 100644
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
+    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
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
@@ -105,6 +154,13 @@ int vpci_assign_device(struct pci_dev *pdev)
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
@@ -112,6 +168,7 @@ int vpci_assign_device(struct pci_dev *pdev)
             break;
     }
 
+ out: __maybe_unused;
     if ( rc )
         vpci_deassign_device(pdev);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f5922f3206..b58a822847be 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -484,6 +484,14 @@ struct domain
      * 2. pdev->vpci->lock
      */
     rwlock_t pci_lock;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 77320a667e55..053467f04982 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) = x
@@ -175,6 +182,10 @@ struct vpci {
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
2.43.0



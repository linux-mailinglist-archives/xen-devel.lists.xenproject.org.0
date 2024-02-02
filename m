Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82972847BAD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675239.1050599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dx-0001nZ-Ls; Fri, 02 Feb 2024 21:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675239.1050599; Fri, 02 Feb 2024 21:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dx-0001hC-C8; Fri, 02 Feb 2024 21:37:25 +0000
Received: by outflank-mailman (input) for mailman id 675239;
 Fri, 02 Feb 2024 21:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Cv-0003tJ-8L
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:36:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a1ed3fc-c213-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:36:20 +0100 (CET)
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by CH2PR12MB4924.namprd12.prod.outlook.com (2603:10b6:610:6b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 21:36:13 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::97) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.6 via Frontend
 Transport; Fri, 2 Feb 2024 21:36:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 21:36:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:36:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 2 Feb
 2024 13:36:11 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:36:10 -0600
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
X-Inumbo-ID: 1a1ed3fc-c213-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwOOgn2rYg5D/WvmsCUT8qoBhJQrAtgLYklDazN56h+7gozf/U1RXmKI9yOBn5UqYAU5VAakFNeEQklGiMySOeEe27427haZH6cPdzyj84+ZLcraC9IHApv2uHUGUK1ZXXX7JDojZjEvw4vLosNgA14rPUSf6V1RdYfeoJsiCyRaw7nwdlYqja/AFsgGDH4UO+InEeAA88jg2ZOVTGUjouSDuJLhCxV5cRnygN0uEK9rTSghmt3p2jYxHjUktqYMUb49MC0O1cJa4W5ilxL3rVIU4IsRYZcnWLzx7nOTyXpO35yd4WLZHxxLBGd+JjWmMjQy+mVQ4Br+K05jpmAcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/OcqFAAiB6EoPEXzP0cP8TrQpQFguNrAiXOKI4bieI=;
 b=ct4wHl7v6EYAOeYVrA88XoHXd22z7VpeZbEU571h3N/MsRtBIqrmYgUlgfWjRYtxGiz7ribJn86J6rcBlGtzanWOguvVJUKUQqOTJ4R6lRDQJDzjYTE4VBqcK70t3GMzIwjGWmGWOeIkvRO8YMgddvMfXcCLeXob2y4S6WGn50TkRIIqdVFhibehf3xRpEKEAIdOR2KxEMb8sq12em5i9kVF5wMaq9dzt7CZC9YAR2nJMxREHG1ZajJ7HMlDtPt6XrHiq0DjNY9sQF/bo/ITs10sTJ2dxLwvpU14sL8H2zzknNv6DqQWPHOE9LIEn+UnbzMdY3Xq98exWewfHpnwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/OcqFAAiB6EoPEXzP0cP8TrQpQFguNrAiXOKI4bieI=;
 b=Ude+pJ4U0Qn5DhphKlbgGg2PKATdoQiMFuxK4mtdj3cw/UCnS4hzOJrEsW2X8pU0aIdOhHwVeQ6AeHBPp4eRglz0Da00i5p4233HxvJERi7ErKnQ3WVuFQ9iR1SFlnF2mGSCOzH1WTdiIcFAy4mzYn9ggVfEgri2WXD6deZ9dnU=
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
Subject: [PATCH v13 11/14] vpci: add initial support for virtual PCI bus topology
Date: Fri, 2 Feb 2024 16:33:15 -0500
Message-ID: <20240202213321.1920347-12-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|CH2PR12MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce17121-21b0-493f-f0fa-08dc2436fa45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1LPvKEVU8yLAbZTsAkiEDS9+ieooTes7LRyUKxTsETRdw5IcipVtDLAG/y7h1vtY5UP9KnITXORg1yGxABVX57lU6ctZ/6Ce3VzzTVF3p0BpqtA/vxGIHUjUegat5JZkFLeJgHB218YTmS0UP8npI6PXXm0lGuaCvGVIhlfGD9xXFkNQ35VzqWlRi/BSdQvR/1MfH/cWS90HajWBXS/9GKKrU8Njj3JlQxOj9w7OszD0ky3jQDea7wSJaUT9kw5l7x2pD/uEg+c+I+YrcmqF2KK2Vs2ABINHfov+mjpuyFmPIERDW7ZPHr2hqsalJoFWPmnB8A5jkNoUUo3TvvcMpczlvEd6ptOZKN4kw3KcZqe3UNKcomkdgJTfcTf3fHWKhhe6MqoO0njB4khaI1hGAof2thp8HLpVBwpaFS0SyB9jl/sbJsa2KZzJdIC6cm9vGr0axmC8S6/gyJyYq0SQA/Y0f6XaqEmfJYybM3GQuUU8ZVyJvJjGKk4355IMCA96b/5gSAAmLmyQVpZEm5zm31hLISj/AQfv7qu+ZghCM1TM3Ne3p6FBhWC2qWKcOnrLHll6d7hUcTpPJdZRIhdiG11ES6oHYvT/sF07ThtBmvs01zGPUcsvxed2hed1KhY6s1ZONhuwvxtvKQj/sCKDlr/Jwt9nfqL64gdNWWB9D01s46/Sqj3xyeki+jMJr3cBpN9iUvPta/OBdaN58EicKoUh+wk69gFCiaQGXNu+lDQxp/jmTf7Ne07CYd1XTqF09/ZngU1NwlVOL7/4ldtJHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(83380400001)(26005)(1076003)(47076005)(2616005)(36860700001)(426003)(8936002)(70206006)(7416002)(8676002)(44832011)(81166007)(4326008)(82740400003)(2906002)(316002)(54906003)(5660300002)(6916009)(478600001)(70586007)(36756003)(41300700001)(336012)(356005)(86362001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:36:12.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce17121-21b0-493f-f0fa-08dc2436fa45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4924

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
index 260b72875ee1..3cd142068f4e 100644
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
index c3adec1aca3c..daa3c1743047 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -484,7 +484,15 @@ struct domain
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
index 77320a667e55..a69c640d065a 100644
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
                __used_section(".data.vpci." p) = x
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
2.43.0



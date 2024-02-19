Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BC85A266
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682792.1061954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc285-0005uf-Hw; Mon, 19 Feb 2024 11:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682792.1061954; Mon, 19 Feb 2024 11:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc285-0005sU-CP; Mon, 19 Feb 2024 11:48:13 +0000
Received: by outflank-mailman (input) for mailman id 682792;
 Mon, 19 Feb 2024 11:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzZz=J4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rc283-0005sO-Jt
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:48:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfeb6422-cf1c-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 12:48:09 +0100 (CET)
Received: from DM6PR11CA0015.namprd11.prod.outlook.com (2603:10b6:5:190::28)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Mon, 19 Feb
 2024 11:48:05 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::70) by DM6PR11CA0015.outlook.office365.com
 (2603:10b6:5:190::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 11:48:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 11:48:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 05:48:04 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 19 Feb 2024 05:48:02 -0600
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
X-Inumbo-ID: bfeb6422-cf1c-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gus274+yRrro4nVuP60DKP7PvvXdFfhw4eZiDrEt9VDgP5wYZiYMYVAUjuFsZW43VzdnM4qWPpelcyO7Je33z9q9q/hnBeVekA7781M85WUZ0pTFrSrcmAE/J6htHkVM7Qg4Wbn+rOHIBbu25AKSxgx8axr81j22caNK19+Z2WnLVoIpThKxscHm+reaSa48O7Un9619IU16B6XbzRDfHPaD8BXmbsGPej9PJlbV4ifWgXxTBvJYP7wOZGV/dQJT26ErZAFObGope9z+F7+2sMd3oW1AnUjVncdnIV2aWx3RWSPzF8+vAVZwLu/s6R1fS5CiNXkkOHoWcIkpC3sgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RncrB+LZkM2n1kaYhG7aciVHltGE6ewfgMj7WhF63eU=;
 b=fw9PtS8VNNV4lUYGX+uiAtaMh7V+OROUgdE2inGb7M9+vv0PPS4RO/s/rhMERRFYuxooxSzaZS2pc/vHJKFomF4rLDpEIccXy09aPcuAx8EXOhp+SIQXp/F4eF/I4g1Ne+7k1CvThjimjcPEPeoc3w3iUQhXiifeex2OsSPmzJy0vXTovssUE8iSNw4OdgJWcH3qIwmWJ3w3PoYBrjDnmxES5hJT9f6CqYwlsW7hZ9wtkTlXhFyiynSAUKZ4CtTmpKkqSO/v8/nKk8Jbw9OmIhFu1Qjb44tuaKBgEsQlguJo/oiIrIBFFBK+Hci5qogsnS3jca2CKbRu8B+2yeVdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RncrB+LZkM2n1kaYhG7aciVHltGE6ewfgMj7WhF63eU=;
 b=D7EkUU8fo003+zdGYwlKUZtTJZpWhgOwL0Hgmq5C7/wgaGkA14pelXU3FHEHh5g9Cab0gCMgyCNzVDlK7Vq7XgqwT0qVYI59wrfcL17vmETeTfupA5C2zcfZtNv6EIlq+Kbo3L6ANazBWMRhzshJ7mWn9nfFFW0/JVVgHsaQnjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v13.2 01/14] vpci: use per-domain PCI lock to protect vpci structure
Date: Mon, 19 Feb 2024 06:47:48 -0500
Message-ID: <20240219114750.151730-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240202213321.1920347-2-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com> <20240202213321.1920347-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA0PR12MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: 050cd7b6-724f-43e1-fe71-08dc3140a273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZHsp6aHffNB/wXbBy8mYS8M/C8JOv5PSgSI/WtgMlJ2C/E40AdHwMOsGinhZpnENvWIqBrRlRUn1bRwgtjlxo3UnPi7JGq9n80Lim9F4T3aSVNF735bLUbHJhJtUZAnzD6nSYUzgTUmJW+K+xa9biiwjT+8y19csuvu1ExgZ/2TTvP9Gz4MB8Do61jPJz+d5NvBue/QmS2OxZox5phDcgryFKrULkBDS//7nMgHbwI5k1f0kZDHb1x5R3EpMktYXt8EjvFZVhhe9NLwGMC+HEEBUrXpqnFIN1YD6Sbn690WsvuBOULZVJ2YVg235zIX79qorviZhCI/LTXsJHioVyLWnRzbwuiB99Yq8GGwCBfVgBnPpLWSQbw1FGq8Trm/oIInUa+fSIuqRQ7K6btiqSMy7tz7EhXkMlsavmeDVBXi+Z/JSHKzb5hrxM0fueXkHI9LEJPNScZ+q0TacawoWmKXLqFmydQQ5DYU0wZOrDmSNVjtWiacLaKAxarhCazchvwinQVL2HgyEQnAgWTl8gjaDFd33ljntavbANjxIAxuFWk5HLIV+hQf+Vqo9Sw73L9WNY2zsa4/b9qI3iwMK3Wxvsw0FvHUwp2Hm+SdRCL/uBSChboByAASAllkd1J2XrMuqxNWYrrKxBX15ohXgOWc0tLJuGuQd6t3zwfQesQI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 11:48:05.1697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050cd7b6-724f-43e1-fe71-08dc3140a273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Use the per-domain PCI read/write lock to protect the presence of the
pci device vpci field. This lock can be used (and in a few cases is used
right away) so that vpci removal can be performed while holding the lock
in write mode. Previously such removal could race with vpci_read for
example.

When taking both d->pci_lock and pdev->vpci->lock, they should be
taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
possible deadlock situations.

1. Per-domain's pci_lock is used to protect pdev->vpci structure
from being removed.

2. Writing the command register and ROM BAR register may trigger
modify_bars to run, which in turn may access multiple pdevs while
checking for the existing BAR's overlap. The overlapping check, if
done under the read lock, requires vpci->lock to be acquired on both
devices being compared, which may produce a deadlock. It is not
possible to upgrade read lock to write lock in such a case. So, in
order to prevent the deadlock, use d->pci_lock in write mode instead.

All other code, which doesn't lead to pdev->vpci destruction and does
not access multiple pdevs at the same time, can still use a
combination of the read lock and pdev->vpci->lock.

3. Drop const qualifier where the new rwlock is used and this is
appropriate.

4. Do not call process_pending_softirqs with any locks held. For that
unlock prior the call and re-acquire the locks after. After
re-acquiring the lock there is no need to check if pdev->vpci exists:
 - in apply_map because of the context it is called (no race condition
   possible)
 - for MSI/MSI-X debug code because it is called at the end of
   pdev->vpci access and no further access to pdev->vpci is made

5. Use d->pci_lock around for_each_pdev and pci_get_pdev()
while accessing pdevs in vpci code.

6. Switch vPCI functions to use per-domain pci_lock for ensuring pdevs
do not go away. The vPCI functions call several MSI-related functions
which already have existing non-vPCI callers. Change those MSI-related
functions to allow using either pcidevs_lock() or d->pci_lock for
ensuring pdevs do not go away. Holding d->pci_lock in read mode is
sufficient. Note that this pdev protection mechanism does not protect
other state or critical sections. These MSI-related functions already
have other race condition and state protection mechanims (e.g.
d->event_lock and msixtbl RCU), so we deduce that the use of the global
pcidevs_lock() is to ensure that pdevs do not go away.

7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
that pdevs do not go away. The purpose of this wrapper is to aid
readability and document the intent of the pdev protection mechanism.

8. When possible, the existing non-vPCI callers of these MSI-related
functions haven't been switched to use the newly introduced per-domain
pci_lock, and will continue to use the global pcidevs_lock(). This is
done to reduce the risk of the new locking scheme introducing
regressions. Those users will be adjusted in due time. One exception
is where the pcidevs_lock() in allocate_and_map_msi_pirq() is moved to
the caller, physdev_map_pirq(): this instance is switched to
read_lock(&d->pci_lock) right away.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Changes in v13.2:
 - clarify comment in vpci_msix_arch_print()
 - add parenthesis around arg in macro definition
 - make the helper macro an ASSERT itself

Changes in v13.1:
 - move pdev_list_is_read_locked() to pci.h
 - use pdev_list_is_read_locked() in more places
 - use d directly in pdev_list_is_read_locked()
 - wrap pdev_list_is_read_locked() helper in #ifndef NDEBUG, and add
   declaration in the #else case with no implementation
 - replace pcidevs_lock() with read_lock(&d->pci_lock) in physdev.c

Changes in v13:
 - hold off adding Roger's R-b tag even though it was provided on v12.2
 - use a wrapper construct to ease readability of odd-looking ASSERTs
 - new placement of ASSERT in __pci_enable_msix(), __pci_enable_msi(),
   and pci_enable_msi(). Rearrange/add pdev NULL check.
 - expand commit description with details about using either
   pcidevs_lock() or d->pci_lock

Changes in v12.2:
 - drop Roger's R-b
 - drop both locks on error paths in vpci_msix_arch_print()
 - add another ASSERT in vpci_msix_arch_print(), to enforce the
   expectation both locks are held before calling vpci_msix_arch_print()
 - move pdev_done label in vpci_dump_msi()
 - update comments in vpci_dump_msi() to say locks (plural)

Changes in v12.1:
 - use read_trylock() in vpci_msix_arch_print()
 - fixup in-code comments (revert double space, use DomXEN) in
   vpci_{read,write}()
 - minor updates in commit message
 - add Roger's R-b

Changes in v12:
 - s/pci_rwlock/pci_lock/ in commit message
 - expand comment about scope of pci_lock in sched.h
 - in vpci_{read,write}, if hwdom is trying to access a device assigned
   to dom_xen, holding hwdom->pci_lock is sufficient (no need to hold
   dom_xen->pci_lock)
 - reintroduce ASSERT in vmx_pi_update_irte()
 - reintroduce ASSERT in __pci_enable_msi{x}()
 - delete note 6. in commit message about removing ASSERTs since we have
   reintroduced them

Changes in v11:
 - Fixed commit message regarding possible spinlocks
 - Removed parameter from allocate_and_map_msi_pirq(), which was added
 in the prev version. Now we are taking pcidevs_lock in
 physdev_map_pirq()
 - Returned ASSERT to pci_enable_msi
 - Fixed case when we took read lock instead of write one
 - Fixed label indentation

Changes in v10:
 - Moved printk pas locked area
 - Returned back ASSERTs
 - Added new parameter to allocate_and_map_msi_pirq() so it knows if
 it should take the global pci lock
 - Added comment about possible improvement in vpci_write
 - Changed ASSERT(rw_is_locked()) to rw_is_write_locked() in
   appropriate places
 - Renamed release_domain_locks() to release_domain_write_locks()
 - moved domain_done label in vpci_dump_msi() to correct place
Changes in v9:
 - extended locked region to protect vpci_remove_device and
   vpci_add_handlers() calls
 - vpci_write() takes lock in the write mode to protect
   potential call to modify_bars()
 - renamed lock releasing function
 - removed ASSERT()s from msi code
 - added trylock in vpci_dump_msi

Changes in v8:
 - changed d->vpci_lock to d->pci_lock
 - introducing d->pci_lock in a separate patch
 - extended locked region in vpci_process_pending
 - removed pcidevs_lockis vpci_dump_msi()
 - removed some changes as they are not needed with
   the new locking scheme
 - added handling for hwdom && dom_xen case
---
 xen/arch/x86/hvm/vmsi.c       | 37 +++++++++++++++++--------
 xen/arch/x86/hvm/vmx/vmx.c    |  2 +-
 xen/arch/x86/irq.c            |  8 +++---
 xen/arch/x86/msi.c            | 20 +++++++++-----
 xen/arch/x86/physdev.c        |  2 ++
 xen/drivers/passthrough/pci.c |  9 +++---
 xen/drivers/vpci/header.c     | 18 ++++++++++++
 xen/drivers/vpci/msi.c        | 30 +++++++++++++++++---
 xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c       | 24 ++++++++++++++--
 xen/include/xen/pci.h         | 13 +++++++++
 xen/include/xen/sched.h       |  3 +-
 12 files changed, 177 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 128f23636279..bb1c60782419 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
     struct msixtbl_entry *entry, *new_entry;
     int r = -EINVAL;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
 {
     unsigned int i;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
 
     if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
     {
@@ -725,8 +725,8 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
     int rc;
 
     ASSERT(msi->arch.pirq != INVALID_PIRQ);
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
 
-    pcidevs_lock();
     for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
     {
         struct xen_domctl_bind_pt_irq unbind = {
@@ -745,7 +745,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
 
     msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
                                        msi->vectors, msi->arch.pirq, msi->mask);
-    pcidevs_unlock();
 }
 
 static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
@@ -778,15 +777,14 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
     int rc;
 
     ASSERT(msi->arch.pirq == INVALID_PIRQ);
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
     rc = vpci_msi_enable(pdev, vectors, 0);
     if ( rc < 0 )
         return rc;
     msi->arch.pirq = rc;
 
-    pcidevs_lock();
     msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
                                        msi->arch.pirq, msi->mask);
-    pcidevs_unlock();
 
     return 0;
 }
@@ -797,8 +795,8 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
     unsigned int i;
 
     ASSERT(pirq != INVALID_PIRQ);
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
 
-    pcidevs_lock();
     for ( i = 0; i < nr && bound; i++ )
     {
         struct xen_domctl_bind_pt_irq bind = {
@@ -814,7 +812,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
     write_lock(&pdev->domain->event_lock);
     unmap_domain_pirq(pdev->domain, pirq);
     write_unlock(&pdev->domain->event_lock);
-    pcidevs_unlock();
 }
 
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
@@ -854,6 +851,7 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
     int rc;
 
     ASSERT(entry->arch.pirq == INVALID_PIRQ);
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
     rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
                          table_base);
     if ( rc < 0 )
@@ -861,7 +859,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
 
     entry->arch.pirq = rc;
 
-    pcidevs_lock();
     rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
                          entry->masked);
     if ( rc )
@@ -869,7 +866,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
         vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
         entry->arch.pirq = INVALID_PIRQ;
     }
-    pcidevs_unlock();
 
     return rc;
 }
@@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
     unsigned int i;
 
+    /*
+     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
+     * is not suitable here because it may allow either pcidevs_lock() or
+     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
+     * pcidevs_lock().
+     */
+    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
+    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
+
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
@@ -913,13 +918,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
             struct pci_dev *pdev = msix->pdev;
 
             spin_unlock(&msix->pdev->vpci->lock);
+            read_unlock(&pdev->domain->pci_lock);
             process_pending_softirqs();
+
+            if ( !read_trylock(&pdev->domain->pci_lock) )
+                return -EBUSY;
+
             /* NB: we assume that pdev cannot go away for an alive domain. */
             if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
+            {
+                read_unlock(&pdev->domain->pci_lock);
                 return -EBUSY;
+            }
+
             if ( pdev->vpci->msix != msix )
             {
                 spin_unlock(&pdev->vpci->lock);
+                read_unlock(&pdev->domain->pci_lock);
                 return -EAGAIN;
             }
         }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 48376cc32751..80a20b17f8a9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -413,7 +413,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
 
     spin_unlock_irq(&desc->lock);
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
 
     return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index bbae7751e494..4beafa83f14b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2164,7 +2164,7 @@ int map_domain_pirq(
         struct pci_dev *pdev;
         unsigned int nr = 0;
 
-        ASSERT(pcidevs_locked());
+        ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
 
         ret = -ENODEV;
         if ( !cpu_has_apic )
@@ -2321,7 +2321,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
@@ -2886,6 +2886,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 {
     int irq, pirq, ret;
 
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+
     switch ( type )
     {
     case MAP_PIRQ_TYPE_MSI:
@@ -2915,7 +2917,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
     msi->irq = irq;
 
-    pcidevs_lock();
     /* Verify or get pirq. */
     write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
@@ -2931,7 +2932,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
  done:
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
     if ( ret )
     {
         switch ( type )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 335c0868a225..e721aaf5c001 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -602,7 +602,7 @@ static int msi_capability_init(struct pci_dev *dev,
     unsigned int i, mpos;
     uint16_t control;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(dev->domain);
     pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
@@ -771,7 +771,7 @@ static int msix_capability_init(struct pci_dev *dev,
     if ( !pos )
         return -ENODEV;
 
-    ASSERT(pcidevs_locked());
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(dev->domain);
 
     control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
     /*
@@ -988,11 +988,11 @@ static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
 {
     struct msi_desc *old_desc;
 
-    ASSERT(pcidevs_locked());
-
     if ( !pdev )
         return -ENODEV;
 
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+
     old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSI);
     if ( old_desc )
     {
@@ -1043,9 +1043,12 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
 {
     struct msi_desc *old_desc;
 
-    ASSERT(pcidevs_locked());
+    if ( !pdev )
+        return -ENODEV;
+
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
 
-    if ( !pdev || !pdev->msix )
+    if ( !pdev->msix )
         return -ENODEV;
 
     if ( msi->entry_nr >= pdev->msix->nr_entries )
@@ -1154,7 +1157,10 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
 int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
                    struct msi_desc **desc)
 {
-    ASSERT(pcidevs_locked());
+    if ( !pdev )
+        return -ENODEV;
+
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
 
     if ( !use_msi )
         return -EPERM;
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 47c4da0af7e1..7efa17cf4c1e 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
 
     case MAP_PIRQ_TYPE_MSI:
     case MAP_PIRQ_TYPE_MULTI_MSI:
+        read_lock(&d->pci_lock);
         ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
+        read_unlock(&d->pci_lock);
         break;
 
     default:
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 47c0eee7bdcc..c97dd4504a7a 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -750,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         pdev->domain = hardware_domain;
         write_lock(&hardware_domain->pci_lock);
         list_add(&pdev->domain_list, &hardware_domain->pdev_list);
-        write_unlock(&hardware_domain->pci_lock);
 
         /*
          * For devices not discovered by Xen during boot, add vPCI handlers
@@ -759,18 +758,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         ret = vpci_add_handlers(pdev);
         if ( ret )
         {
-            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
-            write_lock(&hardware_domain->pci_lock);
             list_del(&pdev->domain_list);
             write_unlock(&hardware_domain->pci_lock);
             pdev->domain = NULL;
+            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
             goto out;
         }
+        write_unlock(&hardware_domain->pci_lock);
         ret = iommu_add_device(pdev);
         if ( ret )
         {
-            vpci_remove_device(pdev);
             write_lock(&hardware_domain->pci_lock);
+            vpci_remove_device(pdev);
             list_del(&pdev->domain_list);
             write_unlock(&hardware_domain->pci_lock);
             pdev->domain = NULL;
@@ -1146,7 +1145,9 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
     } while ( devfn != pdev->devfn &&
               PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
 
+    write_lock(&ctxt->d->pci_lock);
     err = vpci_add_handlers(pdev);
+    write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
                ctxt->d->domain_id, err);
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 58195549d50a..8f5850b8cf6d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -173,6 +173,7 @@ bool vpci_process_pending(struct vcpu *v)
         if ( rc == -ERESTART )
             return true;
 
+        write_lock(&v->domain->pci_lock);
         spin_lock(&v->vpci.pdev->vpci->lock);
         /* Disable memory decoding unconditionally on failure. */
         modify_decoding(v->vpci.pdev,
@@ -191,6 +192,7 @@ bool vpci_process_pending(struct vcpu *v)
              * failure.
              */
             vpci_remove_device(v->vpci.pdev);
+        write_unlock(&v->domain->pci_lock);
     }
 
     return false;
@@ -202,8 +204,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     struct map_data data = { .d = d, .map = true };
     int rc;
 
+    ASSERT(rw_is_write_locked(&d->pci_lock));
+
     while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
+    {
+        /*
+         * It's safe to drop and reacquire the lock in this context
+         * without risking pdev disappearing because devices cannot be
+         * removed until the initial domain has been started.
+         */
+        write_unlock(&d->pci_lock);
         process_pending_softirqs();
+        write_lock(&d->pci_lock);
+    }
+
     rangeset_destroy(mem);
     if ( !rc )
         modify_decoding(pdev, cmd, false);
@@ -244,6 +258,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     unsigned int i;
     int rc;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
     if ( !mem )
         return -ENOMEM;
 
@@ -524,6 +540,8 @@ static int cf_check init_header(struct pci_dev *pdev)
     int rc;
     bool mask_cap_list = false;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index a253ccbd7db7..dc71938e23f5 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -263,7 +263,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
 
 void vpci_dump_msi(void)
 {
-    const struct domain *d;
+    struct domain *d;
 
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
@@ -275,6 +275,9 @@ void vpci_dump_msi(void)
 
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
 
+        if ( !read_trylock(&d->pci_lock) )
+            continue;
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -313,17 +316,36 @@ void vpci_dump_msi(void)
                 {
                     /*
                      * On error vpci_msix_arch_print will always return without
-                     * holding the lock.
+                     * holding the locks.
                      */
                     printk("unable to print all MSI-X entries: %d\n", rc);
-                    process_pending_softirqs();
-                    continue;
+                    goto pdev_done;
                 }
             }
 
+            /*
+             * Unlock locks to process pending softirqs. This is
+             * potentially unsafe, as d->pdev_list can be changed in
+             * meantime.
+             */
             spin_unlock(&pdev->vpci->lock);
+            read_unlock(&d->pci_lock);
+        pdev_done:
             process_pending_softirqs();
+            if ( !read_trylock(&d->pci_lock) )
+            {
+                printk("unable to access other devices for the domain\n");
+                goto domain_done;
+            }
         }
+        read_unlock(&d->pci_lock);
+    domain_done:
+        /*
+         * We need this label at the end of the loop, but some
+         * compilers might not be happy about label at the end of the
+         * compound statement so we adding an empty statement here.
+         */
+        ;
     }
     rcu_read_unlock(&domlist_read_lock);
 }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index d1126a417da9..58c16ebdf283 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 {
     struct vpci_msix *msix;
 
+    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
         const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
@@ -163,7 +165,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
 static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    int rc;
+
+    read_lock(&v->domain->pci_lock);
+    rc = !!msix_find(v->domain, addr);
+    read_unlock(&v->domain->pci_lock);
+
+    return rc;
 }
 
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -358,21 +366,35 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
 static int cf_check msix_read(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct domain *d = v->domain;
+    struct vpci_msix *msix;
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
     *data = ~0UL;
 
+    read_lock(&d->pci_lock);
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        read_unlock(&d->pci_lock);
         return X86EMUL_RETRY;
+    }
 
     if ( adjacent_handle(msix, addr) )
-        return adjacent_read(d, msix, addr, len, data);
+    {
+        int rc = adjacent_read(d, msix, addr, len, data);
+
+        read_unlock(&d->pci_lock);
+        return rc;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        read_unlock(&d->pci_lock);
         return X86EMUL_OKAY;
+    }
 
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
@@ -404,6 +426,7 @@ static int cf_check msix_read(
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
@@ -491,19 +514,33 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
 static int cf_check msix_write(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct domain *d = v->domain;
+    struct vpci_msix *msix;
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
+    read_lock(&d->pci_lock);
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        read_unlock(&d->pci_lock);
         return X86EMUL_RETRY;
+    }
 
     if ( adjacent_handle(msix, addr) )
-        return adjacent_write(d, msix, addr, len, data);
+    {
+        int rc = adjacent_write(d, msix, addr, len, data);
+
+        read_unlock(&d->pci_lock);
+        return rc;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        read_unlock(&d->pci_lock);
         return X86EMUL_OKAY;
+    }
 
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
@@ -579,6 +616,7 @@ static int cf_check msix_write(
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 72ef277c4f8e..475272b173f3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -42,6 +42,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
 
@@ -77,6 +79,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
     const unsigned long *ro_map;
     int rc = 0;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
     if ( !has_vpci(pdev->domain) )
         return 0;
 
@@ -361,7 +365,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
 
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
@@ -376,12 +380,18 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     /*
      * Find the PCI dev matching the address, which for hwdom also requires
      * consulting DomXEN.  Passthrough everything that's not trapped.
+     * If this is hwdom and the device is assigned to DomXEN, acquiring hwdom's
+     * pci_lock is sufficient.
      */
+    read_lock(&d->pci_lock);
     pdev = pci_get_pdev(d, sbdf);
     if ( !pdev && is_hardware_domain(d) )
         pdev = pci_get_pdev(dom_xen, sbdf);
     if ( !pdev || !pdev->vpci )
+    {
+        read_unlock(&d->pci_lock);
         return vpci_read_hw(sbdf, reg, size);
+    }
 
     spin_lock(&pdev->vpci->lock);
 
@@ -428,6 +438,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    read_unlock(&d->pci_lock);
 
     if ( data_offset < size )
     {
@@ -470,7 +481,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
@@ -484,7 +495,13 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     /*
      * Find the PCI dev matching the address, which for hwdom also requires
      * consulting DomXEN.  Passthrough everything that's not trapped.
+     * If this is hwdom and the device is assigned to DomXEN, acquiring hwdom's
+     * pci_lock is sufficient.
+     *
+     * TODO: We need to take pci_locks in exclusive mode only if we
+     * are modifying BARs, so there is a room for improvement.
      */
+    write_lock(&d->pci_lock);
     pdev = pci_get_pdev(d, sbdf);
     if ( !pdev && is_hardware_domain(d) )
         pdev = pci_get_pdev(dom_xen, sbdf);
@@ -493,6 +510,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         /* Ignore writes to read-only devices, which have no ->vpci. */
         const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
 
+        write_unlock(&d->pci_lock);
+
         if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
             vpci_write_hw(sbdf, reg, size, data);
         return;
@@ -534,6 +553,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    write_unlock(&d->pci_lock);
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index aabc5465a7d3..f4577faf75fd 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -171,6 +171,19 @@ void pcidevs_lock(void);
 void pcidevs_unlock(void);
 bool __must_check pcidevs_locked(void);
 
+#ifndef NDEBUG
+/*
+ * Check to ensure there will be no changes to the entries in d->pdev_list (but
+ * not the contents of each entry).
+ * This check is not suitable for protecting other state or critical regions.
+ */
+#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
+        /* NB: d may be evaluated multiple times, or not at all */       \
+        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
+#else
+#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ({ (void)(d); })
+#endif
+
 bool pci_known_segment(u16 seg);
 bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9da91e0e6244..37f5922f3206 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -462,7 +462,8 @@ struct domain
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
     /*
-     * pci_lock protects access to pdev_list.
+     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
+     * structure from being removed.
      *
      * Any user *reading* from pdev_list, or from devices stored in pdev_list,
      * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,

base-commit: 78398afae10bfb4ab94e8af17b7ed58510a57d96
-- 
2.43.2



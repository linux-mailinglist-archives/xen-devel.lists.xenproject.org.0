Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC5082E0D6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 20:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667565.1038962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSrp-0000MR-Gp; Mon, 15 Jan 2024 19:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667565.1038962; Mon, 15 Jan 2024 19:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSrp-0000Kc-Dx; Mon, 15 Jan 2024 19:43:29 +0000
Received: by outflank-mailman (input) for mailman id 667565;
 Mon, 15 Jan 2024 19:43:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghqi=IZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPSrn-0000KU-O8
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 19:43:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5746205c-b3de-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 20:43:25 +0100 (CET)
Received: from SJ0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:a03:3a1::23)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 19:43:19 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::2f) by SJ0PR03CA0378.outlook.office365.com
 (2603:10b6:a03:3a1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 19:43:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 19:43:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 13:43:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 15 Jan
 2024 11:43:17 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 15 Jan 2024 13:43:15 -0600
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
X-Inumbo-ID: 5746205c-b3de-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPetEuDyaPwMay0L2rf+kLH63lxdG1W+MAmO16kpU3JSjNMFDG9EbndmyIbrdtTmgxQohMG4351FI7/STdkklPIcoVSh0UCXH5sxOvqSzQqHJtDKtMZLgsZhUJgogNatkKZnjuQ5fDE2NSE/bIqN6kmN2HN80hzvI/CoCzqPdwjchP1QeW2bGgYIyeuDn0cMYk7ZDoJyW5+WP9XbueKLYrcNzEsOwX3UELD91s6FbV7svLlRYk4KUFhJccBYX7n0aIjKLhNt1h0TT278Khn4l+meN/yQcNrtKkWyMEml4jPHC7PlVaevuhmV5U6KbMm5UM2H4t0AG5P1e1qgOM/Rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSFgtIJRmpk8ECdEPUQ/pOCw9F0Lfc+srsWHQubhRJQ=;
 b=eLr3SdIuHtnElDK+slMBW2BXFwZItT5WgtpNTQfwIXPMGnQyFYgp3cp2pYS0THyxsSS2kMTGuUPduCpmk3U8XJhdhQeHMqaJokHVORH/hQ9bDHn2Zs27JPBkEeOaSmaJM21gQUqt+DQ9ZwNhoMYk2AExRIe+F9DHpjDydXI/7RDrfuC4nsDLpSJpLzR4fN89vlz2XLkfRMfzzXoz+EYR5pE2pkt4zs/khc8q5N7GZSpvowledeW/wulOz6iLzhUgCFX5bdrDqvuiCM7Yw5MDvAa6YcQXe44MEVSv5fPjV0vXpR7WP0AOTTj8F+z9Gs+qMkLjze4Rypo1dgASJsHSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSFgtIJRmpk8ECdEPUQ/pOCw9F0Lfc+srsWHQubhRJQ=;
 b=MMqjynQ9Set3QbJQ3/wjXP0HhlA/bzT1PNfT2qbILHcXHF8LTaywGX74qFwMFtONkhjCRSEVfrQ/YhQccfCjDMB5GAlKmL3PY2uJEhX3/sIXc/WhYnIRQB1QYZiT3X/RHYFy6jqoBovyxVZQDXZS1BcgC94oW/WqrCyiDNw1hpw=
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
Subject: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci structure
Date: Mon, 15 Jan 2024 14:43:08 -0500
Message-ID: <20240115194309.45683-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-2-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com> <20240109215145.430207-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 050b146c-64d6-4621-ba7c-08dc16023969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MB+nKefKUQq20vkRDyxKlGP9PeaWvqsPXR1U/Sm6hoU8AC812WBc/7LRGQPp1VtsWsVfnkK9HkreLuxCRqQbN8d5J1qg2p77vxONEATwoSOA5bxAE7pTwVufu0WCtqPWyEO6M/vM6oJeX7ixZs8LpiyBVpAzSv5MblntcD0ZTDux++fcbdedd1YleFNJUa+dbSKVemB4pxyZR9p/Wt366PNZ20wQqEd6VD54NRpOSWTtH8CCB/P1VJFacE3fMQkdJ69QKucmNnm5oH7xsgOmn7BkY+SdljVUg8mqu5rL1vzpTRbxuVRwfPCxI6gkoarkSDJuaIFNKaYzmqu/k2rOOBlK3NELBAi7kIm9L5BIJezqBJTS7u3qgVPjnuu8g45s6byMYY7lVU0ypkb5yyAMQEbtGqe6gsu6izJwMNCK361ItghkkYDIzK0kdOSTjse98ktz9mrps6wswQCcDn4sorywa90hYg7Y0IrolzHjYa8/uo3mF4iFkP1/2zi/FWUcEnMjeuIHM+vodc4fYoMNJYJAIBN2Gffg50kDJIcQydVOGAjRynHYLA/iIKBEnrfeX/eMwA06VkJ/SQd2FJTo1G+4yS9J2dZZzXfbuyuy0dyz2a6XJQQbQ02fyfRkeeriRL5ghu9KBghrabJda+eNm0Ri7XWRYmrvqeXUUiS/lxCbsYsZA9Ni9vc7PL6YlltYIeLDDW3RcFJ8dJjgbUit0GJqwLIepbzDkYKXbc5bDswsvb55vvRbPWt+ikV9WCF/5Amv0nMXTNQdO+kWi1z9F2p0CvxRBwoBks2KpYbK3Bk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(426003)(83380400001)(54906003)(2616005)(6916009)(26005)(82740400003)(47076005)(70586007)(336012)(6666004)(1076003)(8936002)(4326008)(7416002)(8676002)(2906002)(30864003)(36860700001)(5660300002)(478600001)(44832011)(41300700001)(86362001)(81166007)(36756003)(70206006)(316002)(356005)(40480700001)(40460700003)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 19:43:18.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b146c-64d6-4621-ba7c-08dc16023969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797

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

5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
while accessing pdevs in vpci code.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/arch/x86/hvm/vmsi.c       | 31 +++++++++++++--------
 xen/arch/x86/hvm/vmx/vmx.c    |  2 +-
 xen/arch/x86/irq.c            |  8 +++---
 xen/arch/x86/msi.c            | 14 +++++-----
 xen/arch/x86/physdev.c        |  2 ++
 xen/drivers/passthrough/pci.c |  9 +++---
 xen/drivers/vpci/header.c     | 18 ++++++++++++
 xen/drivers/vpci/msi.c        | 30 +++++++++++++++++---
 xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c       | 24 ++++++++++++++--
 xen/include/xen/sched.h       |  3 +-
 11 files changed, 152 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 128f23636279..9e5e93a6ba0f 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
     struct msixtbl_entry *entry, *new_entry;
     int r = -EINVAL;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
 {
     unsigned int i;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
     if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
     {
@@ -725,8 +725,8 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
     int rc;
 
     ASSERT(msi->arch.pirq != INVALID_PIRQ);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
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
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
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
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
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
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
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
@@ -895,6 +891,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
     unsigned int i;
 
+    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
+    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
+
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
@@ -913,13 +912,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
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
index 8ff675883c2b..890faef48b82 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -413,7 +413,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
 
     spin_unlock_irq(&desc->lock);
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&msi_desc->dev->domain->pci_lock));
 
     return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 50e49e1a4b6f..4d89d9af99fe 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2166,7 +2166,7 @@ int map_domain_pirq(
         struct pci_dev *pdev;
         unsigned int nr = 0;
 
-        ASSERT(pcidevs_locked());
+        ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
 
         ret = -ENODEV;
         if ( !cpu_has_apic )
@@ -2323,7 +2323,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
@@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 {
     int irq, pirq, ret;
 
+    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
+
     switch ( type )
     {
     case MAP_PIRQ_TYPE_MSI:
@@ -2917,7 +2919,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
     msi->irq = irq;
 
-    pcidevs_lock();
     /* Verify or get pirq. */
     write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
@@ -2933,7 +2934,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
  done:
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
     if ( ret )
     {
         switch ( type )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 335c0868a225..7da2affa2e82 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -602,7 +602,7 @@ static int msi_capability_init(struct pci_dev *dev,
     unsigned int i, mpos;
     uint16_t control;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
     pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
@@ -771,7 +771,7 @@ static int msix_capability_init(struct pci_dev *dev,
     if ( !pos )
         return -ENODEV;
 
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
 
     control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
     /*
@@ -988,11 +988,11 @@ static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
 {
     struct msi_desc *old_desc;
 
-    ASSERT(pcidevs_locked());
-
     if ( !pdev )
         return -ENODEV;
 
+    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
+
     old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSI);
     if ( old_desc )
     {
@@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
 {
     struct msi_desc *old_desc;
 
-    ASSERT(pcidevs_locked());
-
     if ( !pdev || !pdev->msix )
         return -ENODEV;
 
+    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
+
     if ( msi->entry_nr >= pdev->msix->nr_entries )
         return -EINVAL;
 
@@ -1154,7 +1154,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
 int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
                    struct msi_desc **desc)
 {
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
 
     if ( !use_msi )
         return -EPERM;
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 47c4da0af7e1..369c9e788c1c 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
 
     case MAP_PIRQ_TYPE_MSI:
     case MAP_PIRQ_TYPE_MULTI_MSI:
+        pcidevs_lock();
         ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
+        pcidevs_unlock();
         break;
 
     default:
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 1439d1ef2b26..3a973324bca1 100644
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
index d1126a417da9..b6abab47efdd 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 {
     struct vpci_msix *msix;
 
+    ASSERT(rw_is_locked(&d->pci_lock));
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

base-commit: c2ce3466472e9c9eda79f5dc98eb701bc6fdba20
-- 
2.43.0



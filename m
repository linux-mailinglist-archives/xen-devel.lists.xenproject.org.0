Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA3828F6B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 23:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665089.1035315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKER-000156-Jx; Tue, 09 Jan 2024 22:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665089.1035315; Tue, 09 Jan 2024 22:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKER-00011r-GT; Tue, 09 Jan 2024 22:05:59 +0000
Received: by outflank-mailman (input) for mailman id 665089;
 Tue, 09 Jan 2024 22:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK2d-0007gG-PN
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:53:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f52a3d3-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:53:45 +0100 (CET)
Received: from SJ0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:a03:3a0::19)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Tue, 9 Jan
 2024 21:53:41 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::d9) by SJ0PR03CA0254.outlook.office365.com
 (2603:10b6:a03:3a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:53:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:53:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:40 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:53:39 -0600
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
X-Inumbo-ID: 8f52a3d3-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ8LdFFdpPqsdBlAaEdalVN2W6q4/m9/OMZ2QX+60gsa+ukNv8mPs+fV/2QvsZ2Zdphujqkw6xGDJcGCzAIz+yu9hs2US8spVmIpx3BCBQo2KASqSE3IP3pSAD1L6ITuFN506mR6UqisMVZYg7K/R1Yb7BD+Epb/nUXnfxq99er8ZzPsgTHe833gg5uoP/YNJ32itB60umpqfBgTLpZwknITal9e2/eYpBKNCcpN15d57Y9MwadoAJLSguBfHx4t2bG3kssasxg9QuKabDNa6echG0WAS/cuqvRNqLPRep6fsyhROO/X5F+GSrp8XqPfKioIC1IAo+DuUU/3hSLF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rT/5Ji7hQyXs6rmimqQBYS2da8mep0A+0DZ9Q5ryDI=;
 b=VSjmurngnAIBEwvuPoq/p/ZMqXW+Z2nwHtUsX8hMZyvTk+infL5JkRlVDyNKon354Y4N7jv6D2yMknpMWAH2+/XiPpf8nlvjW8DADfnFrhb+QTAb6T+tFVvOKgANg6VJpAz4oGvtqvzqiNgW+/AkzAc2dXwwGjDvWe8vx00BWapp7IaDv1NxnxDNcls/PZzDFobfFY+9TMThtYNyUWDp9lfpByTIcos4sV4FoHp9G0CWHYAoIM0bXxiJQ2uwLQ6mFZcBqPp7/CKMzQuEkm4qGZLFMLwX+yPOZ2Ef59RsvBUKvige40RrmJCWod/FzuTjUzmF626A/HJ/CFfIqVPnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rT/5Ji7hQyXs6rmimqQBYS2da8mep0A+0DZ9Q5ryDI=;
 b=OSNOQWIGMDBR+zQgnYwBdt1he+Pbv9qOfagol4HdFKGP5H65DIDzLxggn3nW2oC9eU+PsnDVmShfML7iGoNLNVo73AaNE75Ktaazr134kqy9nDZ+NbPIbUvFwA6ZmBIUKN1rA6mLtN8WKdsUUZ5+szYPYZrijeThrfEPpdWEhRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 08/15] vpci/header: handle p2m range sets per BAR
Date: Tue, 9 Jan 2024 16:51:23 -0500
Message-ID: <20240109215145.430207-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 525c7da1-a1dc-4416-5a0d-08dc115d7131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kuzD1DFmS0pNCy//oT2WjRRl18sPlpGUY89DGtN2eBTZWojoVi+OaRHySzpLJOfxoWTpq3FwRxNyB5xhoAJsZ09Z2ElA2goL1jhx5QF4aT6etMwmFWSAeA5Y0r9iZ4tWl5hIiDelmximMLyAnKFlUXSnqrk1IuK1yei7a9pf3iXaFG10tgy2WF09spP10RvSvFNKP4/RefiVcMVRfL6A36stV5mTIo0Zw74kAgWkxPbX4HiwriVRgTWp8LYIpuIuUlGprJJif6s9H5dgqySc5a5J/P0t7R+7yz5PFo7cLcPZ0DR8RbIWZb/wuT4Di37AoGUtzoSvHl4T97TFS5SlJm0yC0lbcEIZ0tB7r0bsKZ+FlaMFEoXlqt3jR7vZVAhox3i0kpiKn+dDzxuzTBB5QPFbpJ1xdANNVMrTmv9i1ps2svhr5lng5hsQF1xulks9XGnw8ZK0yM8+Uos8VYju5IBF1ooCRjRni5AGK+sSQQbVlORc1EpU98qYGv2tXfgJkca+VKDI9ckWiB5HUfRfOwXNVpng3BkZ/ZSxl/bq5MAhq/Noxip+Chx1qxyB8epKOAFK63q28KYc4lIz95ZIQHvY4cA381tTv1/Fp0/eJC3Z095Qtg0d3PzrbHA0AQ/iKgizo8Rj8m/0B2qXxSXxoIdn5LvEbADJ0wXEnyoDQsuODTIjfijOxwIMvropkjqT6iNNov8Lx5aETmQUbfUeN0Rc0h9CXrsWdjKYP0kObBU66LS+YEIqv1HrLnSEPxfL6oWxOo+CfDKEJVFkf7uM1JF/GSLDpqWew1YDFzDyGT2FVbcMrdNDIATzehnucmdy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(2906002)(478600001)(36860700001)(30864003)(5660300002)(6666004)(81166007)(4326008)(44832011)(356005)(41300700001)(8936002)(316002)(70206006)(70586007)(54906003)(36756003)(6916009)(8676002)(2616005)(86362001)(426003)(26005)(336012)(1076003)(83380400001)(47076005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:53:40.7208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525c7da1-a1dc-4416-5a0d-08dc115d7131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Instead of handling a single range set, that contains all the memory
regions of all the BARs and ROM, have them per BAR.
As the range sets are now created when a PCI device is added and destroyed
when it is removed so make them named and accounted.

Note that rangesets were chosen here despite there being only up to
3 separate ranges in each set (typically just 1). But rangeset per BAR
was chosen for the ease of implementation and existing code re-usability.

Also note that error handling of vpci_process_pending() is slightly
modified, and that vPCI handlers are no longer removed if the creation
of the mappings in vpci_process_pending() fails, as that's unlikely to
lead to a functional device in any case.

This is in preparation of making non-identity mappings in p2m for the MMIOs.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v12:
- s/rangeset_empty/rangeset_purge/
- change i to num_bars for expansion ROM (purely cosmetic change)
In v11:
- Modified commit message to note changes in error handling in
vpci_process_pending()
- Removed redundant ASSERT() in defer_map. There is no reason to
introduce it in this patch and there is no other patch where
introducing that ASSERT() was appropriate.
- Fixed formatting
- vpci_process_pending() clears v->vpci.pdev if it failed
  checks at the beginning
- Added Roger's R-B tag
In v10:
- Added additional checks to vpci_process_pending()
- vpci_process_pending() now clears rangeset in case of failure
- Fixed locks in vpci_process_pending()
- Fixed coding style issues
- Fixed error handling in init_bars
In v9:
- removed d->vpci.map_pending in favor of checking v->vpci.pdev !=
NULL
- printk -> gprintk
- renamed bar variable to fix shadowing
- fixed bug with iterating on remote device's BARs
- relaxed lock in vpci_process_pending
- removed stale comment
Since v6:
- update according to the new locking scheme
- remove odd fail label in modify_bars
Since v5:
- fix comments
- move rangeset allocation to init_bars and only allocate
  for MAPPABLE BARs
- check for overlap with the already setup BAR ranges
Since v4:
- use named range sets for BARs (Jan)
- changes required by the new locking scheme
- updated commit message (Jan)
Since v3:
- re-work vpci_cancel_pending accordingly to the per-BAR handling
- s/num_mem_ranges/map_pending and s/uint8_t/bool
- ASSERT(bar->mem) in modify_bars
- create and destroy the rangesets on add/remove
---
 xen/drivers/vpci/header.c | 257 ++++++++++++++++++++++++++------------
 xen/drivers/vpci/vpci.c   |   6 +
 xen/include/xen/vpci.h    |   2 +-
 3 files changed, 185 insertions(+), 80 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 39e11e141b38..feccd070ddd0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -162,63 +162,107 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    struct pci_dev *pdev = v->vpci.pdev;
+    struct map_data data = {
+        .d = v->domain,
+        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+    };
+    struct vpci_header *header = NULL;
+    unsigned int i;
+
+    if ( !pdev )
+        return false;
+
+    read_lock(&v->domain->pci_lock);
+
+    if ( !pdev->vpci || (v->domain != pdev->domain) )
     {
-        struct map_data data = {
-            .d = v->domain,
-            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
-        };
-        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
+        v->vpci.pdev = NULL;
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    header = &pdev->vpci->header;
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+        int rc;
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
         if ( rc == -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
             return true;
+        }
 
-        write_lock(&v->domain->pci_lock);
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
-
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
         if ( rc )
-            /*
-             * FIXME: in case of failure remove the device from the domain.
-             * Note that there might still be leftover mappings. While this is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
-            vpci_deassign_device(v->vpci.pdev);
-        write_unlock(&v->domain->pci_lock);
+        {
+            spin_lock(&pdev->vpci->lock);
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
+                            false);
+            spin_unlock(&pdev->vpci->lock);
+
+            /* Clean all the rangesets */
+            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+                if ( !rangeset_is_empty(header->bars[i].mem) )
+                     rangeset_purge(header->bars[i].mem);
+
+            v->vpci.pdev = NULL;
+
+            read_unlock(&v->domain->pci_lock);
+
+            if ( !is_hardware_domain(v->domain) )
+                domain_crash(v->domain);
+
+            return false;
+        }
     }
+    v->vpci.pdev = NULL;
+
+    spin_lock(&pdev->vpci->lock);
+    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
+    spin_unlock(&pdev->vpci->lock);
+
+    read_unlock(&v->domain->pci_lock);
 
     return false;
 }
 
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            struct rangeset *mem, uint16_t cmd)
+                            uint16_t cmd)
 {
     struct map_data data = { .d = d, .map = true };
-    int rc;
+    struct vpci_header *header = &pdev->vpci->header;
+    int rc = 0;
+    unsigned int i;
 
     ASSERT(rw_is_write_locked(&d->pci_lock));
 
-    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        /*
-         * It's safe to drop and reacquire the lock in this context
-         * without risking pdev disappearing because devices cannot be
-         * removed until the initial domain has been started.
-         */
-        write_unlock(&d->pci_lock);
-        process_pending_softirqs();
-        write_lock(&d->pci_lock);
-    }
+        struct vpci_bar *bar = &header->bars[i];
 
-    rangeset_destroy(mem);
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) == -ERESTART )
+        {
+            /*
+             * It's safe to drop and reacquire the lock in this context
+             * without risking pdev disappearing because devices cannot be
+             * removed until the initial domain has been started.
+             */
+            write_unlock(&d->pci_lock);
+            process_pending_softirqs();
+            write_lock(&d->pci_lock);
+        }
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
 
@@ -226,7 +270,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
 }
 
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -237,7 +281,6 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.mem = mem;
     curr->vpci.cmd = cmd;
     curr->vpci.rom_only = rom_only;
     /*
@@ -251,33 +294,33 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
-    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
-    unsigned int i;
+    unsigned int i, j;
     int rc;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
-    if ( !mem )
-        return -ENOMEM;
-
     /*
-     * Create a rangeset that represents the current device BARs memory region
-     * and compare it against all the currently active BAR memory regions. If
-     * an overlap is found, subtract it from the region to be mapped/unmapped.
+     * Create a rangeset per BAR that represents the current device memory
+     * region and compare it against all the currently active BAR memory
+     * regions. If an overlap is found, subtract it from the region to be
+     * mapped/unmapped.
      *
-     * First fill the rangeset with all the BARs of this device or with the ROM
+     * First fill the rangesets with the BAR of this device or with the ROM
      * BAR only, depending on whether the guest is toggling the memory decode
      * bit of the command register, or the enable bit of the ROM BAR register.
      */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        const struct vpci_bar *bar = &header->bars[i];
+        struct vpci_bar *bar = &header->bars[i];
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
+        if ( !bar->mem )
+            continue;
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
@@ -293,14 +336,31 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        rc = rangeset_add_range(mem, start, end);
+        rc = rangeset_add_range(bar->mem, start, end);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start, end, rc);
-            rangeset_destroy(mem);
             return rc;
         }
+
+        /* Check for overlap with the already setup BAR ranges. */
+        for ( j = 0; j < i; j++ )
+        {
+            struct vpci_bar *prev_bar = &header->bars[j];
+
+            if ( rangeset_is_empty(prev_bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(prev_bar->mem, start, end);
+            if ( rc )
+            {
+                gprintk(XENLOG_WARNING,
+                       "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
+                        &pdev->sbdf, start, end, rc);
+                return rc;
+            }
+        }
     }
 
     /* Remove any MSIX regions if present. */
@@ -310,14 +370,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        rc = rangeset_remove_range(mem, start, end);
-        if ( rc )
+        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
         {
-            printk(XENLOG_G_WARNING
-                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
-                   start, end, rc);
-            rangeset_destroy(mem);
-            return rc;
+            const struct vpci_bar *bar = &header->bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                gprintk(XENLOG_WARNING,
+                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
+                        &pdev->sbdf, start, end, rc);
+                return rc;
+            }
         }
     }
 
@@ -357,27 +424,37 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
             for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
-                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
-                unsigned long start = PFN_DOWN(bar->addr);
-                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
-
-                if ( !bar->enabled ||
-                     !rangeset_overlaps_range(mem, start, end) ||
-                     /*
-                      * If only the ROM enable bit is toggled check against
-                      * other BARs in the same device for overlaps, but not
-                      * against the same ROM BAR.
-                      */
-                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
+                const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
+                unsigned long start = PFN_DOWN(remote_bar->addr);
+                unsigned long end = PFN_DOWN(remote_bar->addr +
+                                             remote_bar->size - 1);
+
+                if ( !remote_bar->enabled )
                     continue;
 
-                rc = rangeset_remove_range(mem, start, end);
-                if ( rc )
+                for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
-                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
-                           start, end, rc);
-                    rangeset_destroy(mem);
-                    return rc;
+                    const struct vpci_bar *bar = &header->bars[j];
+
+                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                         /*
+                          * If only the ROM enable bit is toggled check against
+                          * other BARs in the same device for overlaps, but not
+                          * against the same ROM BAR.
+                          */
+                         (rom_only &&
+                          tmp == pdev &&
+                          bar->type == VPCI_BAR_ROM) )
+                        continue;
+
+                    rc = rangeset_remove_range(bar->mem, start, end);
+                    if ( rc )
+                    {
+                        gprintk(XENLOG_WARNING,
+                                "%pp: failed to remove [%lx, %lx]: %d\n",
+                                &pdev->sbdf, start, end, rc);
+                        return rc;
+                    }
                 }
             }
         }
@@ -401,10 +478,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, mem, cmd);
+        return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(dev->domain, dev, mem, cmd, rom_only);
+    defer_map(dev->domain, dev, cmd, rom_only);
 
     return 0;
 }
@@ -593,6 +670,18 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
+                            unsigned int i)
+{
+    char str[32];
+
+    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
+
+    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+
+    return !bar->mem ? -ENOMEM : 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -748,6 +837,10 @@ static int cf_check init_header(struct pci_dev *pdev)
         else
             bars[i].type = VPCI_BAR_MEM32;
 
+        rc = bar_add_rangeset(pdev, &bars[i], i);
+        if ( rc )
+            goto fail;
+
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -798,6 +891,12 @@ static int cf_check init_header(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
+        else
+        {
+            rc = bar_add_rangeset(pdev, rom, num_bars);
+            if ( rc )
+                goto fail;
+        }
     }
     else if ( !is_hwdom )
     {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 42eac85106a3..a0e8b1012509 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -42,6 +42,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_deassign_device(struct pci_dev *pdev)
 {
+    unsigned int i;
+
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -67,6 +69,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
             if ( pdev->vpci->msix->table[i] )
                 iounmap(pdev->vpci->msix->table[i]);
     }
+
+    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
+        rangeset_destroy(pdev->vpci->header.bars[i].mem);
+
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b0e38a5a1acb..817ee9ee7300 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -92,6 +92,7 @@ struct vpci {
             /* Guest address. */
             uint64_t guest_addr;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -176,7 +177,6 @@ struct vpci {
 
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct rangeset *mem;
     struct pci_dev *pdev;
     uint16_t cmd;
     bool rom_only : 1;
-- 
2.43.0



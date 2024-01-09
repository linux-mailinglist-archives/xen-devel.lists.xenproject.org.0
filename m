Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64407828F62
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 23:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665074.1035293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKBq-0007mr-Ne; Tue, 09 Jan 2024 22:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665074.1035293; Tue, 09 Jan 2024 22:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKBq-0007kv-Kg; Tue, 09 Jan 2024 22:03:18 +0000
Received: by outflank-mailman (input) for mailman id 665074;
 Tue, 09 Jan 2024 22:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK2t-0007gG-Li
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:54:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 989366b6-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:54:01 +0100 (CET)
Received: from MN2PR08CA0029.namprd08.prod.outlook.com (2603:10b6:208:239::34)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:53:55 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::76) by MN2PR08CA0029.outlook.office365.com
 (2603:10b6:208:239::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:53:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:53:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:54 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:53:53 -0600
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
X-Inumbo-ID: 989366b6-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItPSuv7suMx4U2wRojCyh4OZPpOdnIs1PHP0KJjI5QXrdWKCh8+8mRnCCeFOZSvKDbbiuHC60dBRxZixP+Jz56tzJEiv9K2Za9f1p33t6GFg2wNQ727oTMeiaNHfIPXIgkR9YXjJg/YUzjDE4dMstSdnutVBi7dxv8pMf+jRuX7FiNVNa/pY4W5tfChUhltntC850lHwsqJ4KWxrKxhNKNHPYLrrtekdXUzbRZFLsKedRb77g7/cysxU4C6D5f3hGGy3dR/cqTKjY3x+sWjQdIewLPifZ9cdCQjO89SSkVRWHKY0wKKi4eEfS11YOeahHTKM/Ezpo1jUsbPMGhKwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OVx++8ILg3L0aD2CuO8hPm8Z1yWpD5eQLVMw0q3dKw=;
 b=cfRamUJYRztRnorK2IuhKaWwIsviD0d/OMryuXz6XZFbvFT55DW6lvc1UyitGo21sCF8+Scveingl8avj/jw9UIIrXo9T0cyCrKnClHtZ1bqDFsDZLyPRnJ7LtoZBD56x3t4/kGVcGMRQLhxLtw004NKItzzof3U6b6rf5KQYX5NKfvTrjjjh7uQ5fAkmUiElip9PcE5bapNpeXCnLlbpKykBlBSmGC5rEwjo6XaQ+L00ZQtB25MoIyeuDTVezKeRXeRrLNAaJvdsxbBx2f129c0c7Okz/9PHJ+rFTkOynsTB7qyqQfdTiDxbGjfXq2hAd3EbU9V4AMG6S6S5ffVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OVx++8ILg3L0aD2CuO8hPm8Z1yWpD5eQLVMw0q3dKw=;
 b=EeDOaNdZIk7gscAIQ/8XvB/3DIPZbluVbFmnIr6bucuHFjPBrxHur9VonjqZXII/GquICS0Uj3Hv0xAJph6usZjcWLaiJsFIytqoeQsCLxRTQqvHw1RNLh+CyYA+hYeed2yJCluHdXB5WwVDRvqwxVqHzws5mjvgkETSO7OrEds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v12 09/15] vpci/header: program p2m with guest BAR view
Date: Tue, 9 Jan 2024 16:51:24 -0500
Message-ID: <20240109215145.430207-10-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: c49a5374-5ab3-4d3a-c8c9-08dc115d79a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BLYCoHe7MEN0Nkcnd6GlnZeuXBXf+mCSSlB8pTGjB4mbvZFtQAUGK5Pa3rw3jLon5tDseua4khnJnS9FXzY/zcH157UCRk9aajV7yyY28EZLDGJNRdspNatG1VWJsEoVFC5WrqMDPQfNajLb0iXzFYRKp1yvFQAcwF+QC3HgkIqEkRw79Jd1d+uc0R5rzTfvGoNHIiXuIW0Idtw4SdMF4i9Ct8UwC+vBYKAyrV9LelUqvLt4uPkrmA2WzMrHOXjt9Y6nQ92h2AoA+NgnaoXh7BL86ChFFlS4oERVvYzt8RDnlVOsq41MeaPa+IKnAII6qREQP4BaxE5C1yG3hTLwhsykwJf4+057EKJgs3xURxkXMNWMRfUSAis6wAsJbu8f/vomIJfnx1PYuiOXh6W+3439adZfkhZAdC+kDZQ08oREIlCKmIFbjoDnr1Zll/mt37d13FKTFJgEzfmHOSjvQMrRwsaKxLvErkx/kjIOC7rSQtfM2Y753tRAh9yGCMNgcApjrd8TE3dQWubMzGq1/n3MRABCOTzMRTW5MD/GiFVbyE6BTSDCGnxhQWeAQ8ZlbHGSi8OAYVhA8ykhUiQ32OknCOnLYuOJ+hSaJ0nEJAuQjIYvFpi1xE52YaHwcg8Ppks9nU8cdVJi2Emi4UcudnaC5nGBQAa1826TsPfJCiDUtm5adYiibElZToH2mrSI0yprqANVM4HTgc1z0gGZtpDZJGyH9Melo23z/dvswPVqFwcLz3p1gkl+JokPhvMiw+8vIrVkOg88+TPNGBtYMt9hjDGlPhrSK37w9+TDW/zmSixLcTJCwlRC451MhWje
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230173577357003)(230273577357003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(336012)(83380400001)(2616005)(426003)(47076005)(40480700001)(1076003)(26005)(36860700001)(4326008)(44832011)(478600001)(6666004)(40460700003)(82740400003)(316002)(356005)(6916009)(70206006)(54906003)(70586007)(8936002)(8676002)(81166007)(41300700001)(86362001)(2906002)(36756003)(5660300002)(30864003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:53:54.9706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c49a5374-5ab3-4d3a-c8c9-08dc115d79a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Hardware domain continues getting the BARs identity mapped, while for
domUs the BARs are mapped at the requested guest address without
modifying the BAR address in the device PCI config space.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v12:
- Update guest_addr in rom_write()
- Use unsigned long for start_mfn and map_mfn to reduce mfn_x() calls
- Use existing vmsix_table_*() functions
- Change vmsix_table_base() to use .guest_addr
In v11:
- Add vmsix_guest_table_addr() and vmsix_guest_table_base() functions
  to access guest's view of the VMSIx tables.
- Use MFN (not GFN) to check access permissions
- Move page offset check to this patch
- Call rangeset_remove_range() with correct parameters
In v10:
- Moved GFN variable definition outside the loop in map_range()
- Updated printk error message in map_range()
- Now BAR address is always stored in bar->guest_addr, even for
  HW dom, this removes bunch of ugly is_hwdom() checks in modify_bars()
- vmsix_table_base() now uses .guest_addr instead of .addr
In v9:
- Extended the commit message
- Use bar->guest_addr in modify_bars
- Extended printk error message in map_range
- Moved map_data initialization so .bar can be initialized during declaration
Since v5:
- remove debug print in map_range callback
- remove "identity" from the debug print
Since v4:
- moved start_{gfn|mfn} calculation into map_range
- pass vpci_bar in the map_data instead of start_{gfn|mfn}
- s/guest_addr/guest_reg
Since v3:
- updated comment (Roger)
- removed gfn_add(map->start_gfn, rc); which is wrong
- use v->domain instead of v->vpci.pdev->domain
- removed odd e.g. in comment
- s/d%d/%pd in altered code
- use gdprintk for map/unmap logs
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 81 +++++++++++++++++++++++++++++++--------
 xen/include/xen/vpci.h    |  3 +-
 2 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index feccd070ddd0..f0b0b64b0929 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -34,6 +34,7 @@
 
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
 
@@ -41,13 +42,24 @@ static int cf_check map_range(
     unsigned long s, unsigned long e, void *data, unsigned long *c)
 {
     const struct map_data *map = data;
+    /* Start address of the BAR as seen by the guest. */
+    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
+    /* Physical start address of the BAR. */
+    unsigned long start_mfn = PFN_DOWN(map->bar->addr);
     int rc;
 
     for ( ; ; )
     {
         unsigned long size = e - s + 1;
+        /*
+         * Ranges to be mapped don't always start at the BAR start address, as
+         * there can be holes or partially consumed ranges. Account for the
+         * offset of the current address from the BAR start.
+         */
+        unsigned long map_mfn = start_mfn + s - start_gfn;
+        unsigned long m_end = map_mfn + size - 1;
 
-        if ( !iomem_access_permitted(map->d, s, e) )
+        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
         {
             printk(XENLOG_G_WARNING
                    "%pd denied access to MMIO range [%#lx, %#lx]\n",
@@ -55,7 +67,8 @@ static int cf_check map_range(
             return -EPERM;
         }
 
-        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
+        rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end,
+                               map->map);
         if ( rc )
         {
             printk(XENLOG_G_WARNING
@@ -73,8 +86,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
 
-        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
+        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
+                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
         if ( rc == 0 )
         {
             *c += size;
@@ -83,8 +96,9 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, map_mfn,
+                   map_mfn + size, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -163,10 +177,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 bool vpci_process_pending(struct vcpu *v)
 {
     struct pci_dev *pdev = v->vpci.pdev;
-    struct map_data data = {
-        .d = v->domain,
-        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
-    };
     struct vpci_header *header = NULL;
     unsigned int i;
 
@@ -186,6 +196,11 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct map_data data = {
+            .d = v->domain,
+            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .bar = bar,
+        };
         int rc;
 
         if ( rangeset_is_empty(bar->mem) )
@@ -236,7 +251,6 @@ bool vpci_process_pending(struct vcpu *v)
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             uint16_t cmd)
 {
-    struct map_data data = { .d = d, .map = true };
     struct vpci_header *header = &pdev->vpci->header;
     int rc = 0;
     unsigned int i;
@@ -246,6 +260,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct map_data data = { .d = d, .map = true, .bar = bar };
 
         if ( rangeset_is_empty(bar->mem) )
             continue;
@@ -311,12 +326,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * First fill the rangesets with the BAR of this device or with the ROM
      * BAR only, depending on whether the guest is toggling the memory decode
      * bit of the command register, or the enable bit of the ROM BAR register.
+     *
+     * For non-hardware domain we use guest physical addresses.
      */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
+        unsigned long start_guest = PFN_DOWN(bar->guest_addr);
+        unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
         if ( !bar->mem )
             continue;
@@ -336,11 +355,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        rc = rangeset_add_range(bar->mem, start, end);
+        /*
+         * Make sure that the guest set address has the same page offset
+         * as the physical address on the host or otherwise things won't work as
+         * expected.
+         */
+        if ( PAGE_OFFSET(bar->guest_addr) != PAGE_OFFSET(bar->addr) )
+        {
+            gprintk(XENLOG_G_WARNING,
+                    "%pp: Can't map BAR%d because of page offset mismatch: %lx vs %lx\n",
+                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
+                    PAGE_OFFSET(bar->addr));
+            return -EINVAL;
+        }
+
+        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
-                   start, end, rc);
+                   start_guest, end_guest, rc);
             return rc;
         }
 
@@ -352,12 +385,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             if ( rangeset_is_empty(prev_bar->mem) )
                 continue;
 
-            rc = rangeset_remove_range(prev_bar->mem, start, end);
+            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
-                        &pdev->sbdf, start, end, rc);
+                        &pdev->sbdf, start_guest, end_guest, rc);
                 return rc;
             }
         }
@@ -425,8 +458,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
                 const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
-                unsigned long start = PFN_DOWN(remote_bar->addr);
-                unsigned long end = PFN_DOWN(remote_bar->addr +
+                unsigned long start = PFN_DOWN(remote_bar->guest_addr);
+                unsigned long end = PFN_DOWN(remote_bar->guest_addr +
                                              remote_bar->size - 1);
 
                 if ( !remote_bar->enabled )
@@ -513,6 +546,8 @@ static void cf_check bar_write(
     struct vpci_bar *bar = data;
     bool hi = false;
 
+    ASSERT(is_hardware_domain(pdev->domain));
+
     if ( bar->type == VPCI_BAR_MEM64_HI )
     {
         ASSERT(reg > PCI_BASE_ADDRESS_0);
@@ -543,6 +578,10 @@ static void cf_check bar_write(
      */
     bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
     bar->addr |= (uint64_t)val << (hi ? 32 : 0);
+    /*
+     * Update guest address as well, so hardware domain sees BAR identity mapped
+     */
+    bar->guest_addr = bar->addr;
 
     /* Make sure Xen writes back the same value for the BAR RO bits. */
     if ( !hi )
@@ -639,11 +678,14 @@ static void cf_check rom_write(
     }
 
     if ( !rom->enabled )
+    {
         /*
          * If the ROM BAR is not mapped update the address field so the
          * correct address is mapped into the p2m.
          */
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
+        rom->guest_addr = rom->addr;
+    }
 
     if ( !header->bars_mapped || rom->enabled == new_enabled )
     {
@@ -667,7 +709,10 @@ static void cf_check rom_write(
         return;
 
     if ( !new_enabled )
+    {
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
+        rom->guest_addr = rom->addr;
+    }
 }
 
 static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
@@ -862,6 +907,7 @@ static int cf_check init_header(struct pci_dev *pdev)
         }
 
         bars[i].addr = addr;
+        bars[i].guest_addr = addr;
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
@@ -884,6 +930,7 @@ static int cf_check init_header(struct pci_dev *pdev)
         rom->type = VPCI_BAR_ROM;
         rom->size = size;
         rom->addr = addr;
+        rom->guest_addr = addr;
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 817ee9ee7300..e89c571890b2 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -216,7 +216,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix);
  */
 static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned int nr)
 {
-    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
+    return vpci->header.bars[vpci->msix->tables[nr] &
+                             PCI_MSIX_BIRMASK].guest_addr;
 }
 
 static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D4847B9A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675227.1050542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1CJ-0007Wl-52; Fri, 02 Feb 2024 21:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675227.1050542; Fri, 02 Feb 2024 21:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1CJ-0007UI-2A; Fri, 02 Feb 2024 21:35:43 +0000
Received: by outflank-mailman (input) for mailman id 675227;
 Fri, 02 Feb 2024 21:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1CH-0003tJ-Dj
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:35:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02493886-c213-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:35:40 +0100 (CET)
Received: from CY5PR15CA0220.namprd15.prod.outlook.com (2603:10b6:930:88::22)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 21:35:35 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:88:cafe::bc) by CY5PR15CA0220.outlook.office365.com
 (2603:10b6:930:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30 via Frontend
 Transport; Fri, 2 Feb 2024 21:35:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:35:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:34 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:35:33 -0600
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
X-Inumbo-ID: 02493886-c213-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWw7qFCFgb7Y6CQAyPCxLZ7UyiP5+MEy4Aw84yglAmarrZJG3L/KDmyiPsHsL6WVuos3RNShPZmCUsDALq2f8Ien99sQ3AullPXr/O+GJuqBrAVTbD7Xi53aDFg4ip+Fa+gldfkPiYdE0lP3vvYbarQbF8TZFfgVzFrtzXknYIFW8CqrSOawE4VB/+U0xOiY/V2hvb0Q1LG7IX1Ap5gSFV0cW4peBWxO6ZACPTEJV8ck3SX9xqNM/n9elNhfaMoXtqY00tSH1CUlX+26Yq1V3B7NTShFDHbm6e8dDJX7YfsxWKpFa98VjvMj7kFRqLbtrF0RgiUz3LpTheiV+41jSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDy9jvm+K+yrePwNekCbbD5gVDRQvCSbWFl/2rlmQPI=;
 b=hC7d7WpTLHjV6dPiKMvNeF8LjdJzBaElTejbn1za9K+OlvJ9a6pbDR+4+blBXw31XJqHw9j/pwJl3XNBIiTrv3uULbbW+odFnaGrk+dxFsajXraKCdfcsvyuKC41TD6T6y7M83P1yUWMgk2jOZInQs8nJqKR5mX9xE72WWRqwbmFqtfcE2lIJq+NF4fSTziLyLA2GTgR5BRod8SKvqxeGkPlOvuXZ7y5lb2mFIsp59TnEOPC1tB44DzvL6RHmxSnNsNZIPKmv+H1WTBAh/u7WjTPTNiQMOKWDMZkL7J7neQY3NhhekYqJqeGNvvn8HftNzHPwUBzyjUMYtQSVVTneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDy9jvm+K+yrePwNekCbbD5gVDRQvCSbWFl/2rlmQPI=;
 b=fdRW8+qVIWcLlJcdIa94/THaCsB3HshFHmoHwvFAQFqm3lOiwbPT5/3Ecs097ylsW/eqoBQQC1dxO2y0Ev5iaBAAbBQx6nGWQZnEVW2fvApPo1bCj7bpTbCB8X94m2WiS6yTVw7UEw1+Al+2NIlnstbgGmT9UiG+QI9HY6caaPo=
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
Subject: [PATCH v13 08/14] vpci/header: handle p2m range sets per BAR
Date: Fri, 2 Feb 2024 16:33:12 -0500
Message-ID: <20240202213321.1920347-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 266ebd28-21d1-45c1-49f7-08dc2436e40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g1TZxLMAuXKKeKCZDmkJh4IGyFyQ8okVd3gRN/aif429iN6n4qjOmgNE/d2AtoeT9hqThTA0Vt/qLPZF4/MpiQt55XikR2cvf5egcy8ttGRoYgpWOB7aVg+4GS9lE+EyTdUhvC4N6dxpFjTHaavYgnTSQcw+4qhNvOasLaYc9CF0Ckcb4+jyP6gX12meXjs66M/8UT4fW0fl0Bt9bJxWukcpDlc1NqsCoAukpIRb5c8lW1JnFcR8cYeXO5/KDgbkVhRarkOKaKEB2m7DQbF92d9/uNC3LpCTzfR7h2xrm3Npo/9n0+Xu3CoYZ50mNQrVgD99A7GfOt8dGH+H4tk43rV/3qR3F/sc5KQEU3KeSLNmZKMeyC+gO0NsVt1dRd14Psh06FDDwLCClJeyDPDKTlKXgopa4+StSr2YYB4E+wXgq9iBUUrQG4p9nHkm4yOPEl+DlgfzkxXx7rIEGh/4a5Tb2BbHKkjOJSXMjm4TPzLSd25x7KLujjYwMo+uagJebaJYlVNNxHE7V0ouUbAURkq8uFMnTLdh+elXqQJOQrv35TUz9+y2mlnPnuT1R558UkMtlqGCVV0ZZr9rduEBclPMYz4f+m4+27Z3XiuNc7sW/4wt8yUMs8w1RH8+dKSXzINEYcK0pdVj0DfK9j+Wg+rS7WYy/zxa+2UZ9XqZPXb8uh9C83JRP++oKuLHSQIlAdRwE+/vX7f38+gvcFpSrblxJMRZm2oitUrwKVI8aKOKLUyH5KRI/+HlKMSUX9horh2wEkjUcfTEueMd7Co+3w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(83380400001)(336012)(86362001)(41300700001)(356005)(36756003)(47076005)(426003)(36860700001)(4326008)(5660300002)(26005)(2616005)(81166007)(2906002)(1076003)(70206006)(6666004)(30864003)(316002)(82740400003)(70586007)(6916009)(8936002)(8676002)(44832011)(54906003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:35:35.1559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266ebd28-21d1-45c1-49f7-08dc2436e40f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850

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
index ff4837391786..260b72875ee1 100644
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



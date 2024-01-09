Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9B828F42
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665026.1035224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1x-0001Ob-Qk; Tue, 09 Jan 2024 21:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665026.1035224; Tue, 09 Jan 2024 21:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1x-0001Lu-Mg; Tue, 09 Jan 2024 21:53:05 +0000
Received: by outflank-mailman (input) for mailman id 665026;
 Tue, 09 Jan 2024 21:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK1w-0008W6-O8
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:53:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76bf668c-af39-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 22:53:03 +0100 (CET)
Received: from MN2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:208:239::35)
 by SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:53:00 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::48) by MN2PR08CA0030.outlook.office365.com
 (2603:10b6:208:239::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Tue, 9 Jan 2024 21:52:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:52:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:58 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:52:57 -0600
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
X-Inumbo-ID: 76bf668c-af39-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5b5Fw/AzErrrlM6vfG/PLd918GfdvQeL+oaLT0/vPm8IhDcJG4LbnUMDhHilMmZUYwj6ufxEyF8EBmpJVXoq88Y//w/p3xYjCT7a9FkJRL2Gy60hpPbN7uoalPnoNlqlFM2AXVXrliybOApBMTl2slkIA+5rOVCX5DxFjhb9DdW24w/rPN/O72COydeGmpUf3kPQldKiue+Pox+69mipcvkYxRzlKAp2WYtzs8FmOyD9j8oEupg9+sTWMCMnDoYhLwcEGVCRRXVT8RBekL2KspuDaBe556qpBXbHiuiRWuTqcP2VXlI+Ruku+7fR/J7mQcx1OzLO6R/oZwIPK27GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fv9DTE0P0KLmwQzPHqaJ/yxioeZbVVsJLRZmvugJrA=;
 b=MPvT46Ugv/DKPNl4xfpzhu7LPSsPFaMmkRfCXucOpNaNJaRaLQsPDuD4bWa5xXWFxRMJV3Y8rVxGOkjOHdJIew0gkR3bP/xjsmmHQ1ksy+r6hbzVnHjnQMwk4FstEEjgNmeGvrMWMWQQ1J78HmmrfPSlY3c5xI4TrjcYZzuzU6SA0OhiaUNEbYK/Hh7bak0An4gN7CJGQJY5whOCfZMFoPdpktXXgaL4ectGf2xMK86hEWAGA6zQAQf8vZe4k3+oUXOiw/PN8V+itzy8yqfaYgGKQDrcadw3VFpB9mEbPjMALW30ngwf3zVCL8bwOgUX44FOTrQdtthqS+CN3p4clQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fv9DTE0P0KLmwQzPHqaJ/yxioeZbVVsJLRZmvugJrA=;
 b=GTebfnXm9F59ch75uYteM5zIK14PU1hQ1aJW/96Khljb5c2kC1T/QxqCdItMfB7KLSUBRyqXwZqLOu9UHNvJ4RHjiHTVWOa4iuZ0LhQ7bVf4e0/K48iYOwi/zX4vsrMdJ+ehUcU3YnsBOMi522F2FWpDLq6LNNRY23f4G3i+/Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 05/15] vpci/header: implement guest BAR register handlers
Date: Tue, 9 Jan 2024 16:51:20 -0500
Message-ID: <20240109215145.430207-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SJ0PR12MB5488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3fbd5e-ce19-4d4f-b775-08dc115d5879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IcUbXmpu/TxDo7CJ/ZS/lEIhzs5pB8Y5pgmNQGKtJL0taHcLfSw1qRxaCP9EQP3YgWFonB3ECZhCAH5dGB1q8upiSfgHAYTe6DuVazXxej0SZULolVdcPQ60JtLWjiWZBSBsvTfNC5+fvTN6wpuZYyhhXEJ7cHXz6RtNh/An5CgfzkMMe3fKLy39DcNzGgX8T/ywkxEo95+TRaGbWk85pFn/rBVW+fRgUCRCTqtIZswIeNtUJ5JFQxgtzGtAAtx93HUTu4aTkmzLaQ/ufJx031Zo2UNa/JJ5eJln2vDUFtCDxbTXyHuDkHYrxLg9d5OFtZ57fFBdme1icsoT57X4vKVYWL0ALECJeH2pD2HqLM1rvUTZrmKC5slwwgQ5dfvQ1blqabOzEDXF/9g2+AKqS9z15dAyBrBUUXMYWtrZ14lIT0BoXIEc9MtP1xyvgO+7T8l9rqjuHs6mNcIW/raIszXVO7Sp70izK+wVk1NGmlInRdXgN+nNj61FSlce9R+XBkD6LzZ4MxFRpNGPTZ43QSvNqruBwtUAyftVtK7aZEVNqoxJAL3PluSbQ3Qm2tgfaoeDXB9D1p2hlCcpGxawtm19JQwJmSZW8PGrItASWVWabjW/lu9WPA58RXHyVlRwzIEjbIiF8VqKfkmzcg2zsyh3y9feM+E6wtlkPJumfWyUj409D0IMsse0t2VfCHCRvxoVJD7hL6SJ8KLwyZ2+N9UpABTOSrWDndmTVwowHHeCbZRRLHqrEhsJYrIhFcvkJcxAokuqQp0BsW6wp54vLWAAjqsR6TbOXpDFXLv9/SbG0RYxhft+S/K4yFHk1V16
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(83380400001)(316002)(70586007)(41300700001)(356005)(81166007)(82740400003)(86362001)(36756003)(70206006)(36860700001)(47076005)(478600001)(5660300002)(336012)(426003)(1076003)(2616005)(26005)(6666004)(6916009)(2906002)(54906003)(8936002)(44832011)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:52:59.3457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3fbd5e-ce19-4d4f-b775-08dc115d5879
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Introduce is_hwdom convenience variable and convert an existing
is_hardware_domain() check.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v12:
- Add Roger's R-b
- Get rid of empty_bar_read, use vpci_read_val instead
- Convert an existing is_hardware_domain() check to is_hwdom
- Re-indent usage of ternary operator
- Use ternary operator to avoid re-indenting expansion ROM block
In v11:
- Access guest_addr after adjusting for MEM64_HI bar in
guest_bar_write()
- guest bar handlers renamed and now  _mem_ part to denote
that they are handling only memory BARs
- refuse to update guest BAR address if BAR is enabled
In v10:
- ull -> ULL to be MISRA-compatbile
- Use PAGE_OFFSET() instead of combining with ~PAGE_MASK
- Set type of empty bars to VPCI_BAR_EMPTY
In v9:
- factored-out "fail" label introduction in init_bars()
- replaced #ifdef CONFIG_X86 with IS_ENABLED()
- do not pass bars[i] to empty_bar_read() handler
- store guest's BAR address instead of guests BAR register view
Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 109 +++++++++++++++++++++++++++++++++++---
 xen/include/xen/vpci.h    |   3 ++
 2 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 803fe4bb99a6..39e11e141b38 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -478,6 +478,69 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
+                                         unsigned int reg, uint32_t val,
+                                         void *data)
+{
+    struct vpci_bar *bar = data;
+    bool hi = false;
+    uint64_t guest_addr;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi = true;
+    }
+    else
+    {
+        val &= PCI_BASE_ADDRESS_MEM_MASK;
+    }
+
+    guest_addr = bar->guest_addr;
+    guest_addr &= ~(0xffffffffULL << (hi ? 32 : 0));
+    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
+
+    /* Allow guest to size BAR correctly */
+    guest_addr &= ~(bar->size - 1);
+
+    /*
+     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
+     * writes as long as the BAR is not mapped into the p2m.
+     */
+    if ( bar->enabled )
+    {
+        /* If the value written is the current one avoid printing a warning. */
+        if ( guest_addr != bar->guest_addr )
+            gprintk(XENLOG_WARNING,
+                    "%pp: ignored guest BAR %zu write while mapped\n",
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+    bar->guest_addr = guest_addr;
+}
+
+static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
+                                            unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar = data;
+    uint32_t reg_val;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        return bar->guest_addr >> 32;
+    }
+
+    reg_val = bar->guest_addr;
+    reg_val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32 :
+                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
+    reg_val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+
+    return reg_val;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -539,6 +602,7 @@ static int cf_check init_header(struct pci_dev *pdev)
     struct vpci_bar *bars = header->bars;
     int rc;
     bool mask_cap_list = false;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
@@ -564,7 +628,7 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( !is_hwdom )
     {
         if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
         {
@@ -653,8 +717,11 @@ static int cf_check init_header(struct pci_dev *pdev)
         if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
         {
             bars[i].type = VPCI_BAR_MEM64_HI;
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
-                                   4, &bars[i]);
+            rc = vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32
+                                            : guest_mem_bar_read,
+                                   is_hwdom ? bar_write : guest_mem_bar_write,
+                                   reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
 
@@ -665,6 +732,14 @@ static int cf_check init_header(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
         {
             bars[i].type = VPCI_BAR_IO;
+            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                       reg, 4, (void *)0);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
@@ -681,6 +756,15 @@ static int cf_check init_header(struct pci_dev *pdev)
         if ( size == 0 )
         {
             bars[i].type = VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                       reg, 4, (void *)0);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
 
@@ -688,14 +772,18 @@ static int cf_check init_header(struct pci_dev *pdev)
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
-                               &bars[i]);
+        rc = vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_read,
+                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
             goto fail;
     }
 
     /* Check expansion ROM. */
-    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
+    rc = is_hwdom ? pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size,
+                                     PCI_BAR_ROM)
+                  : 0;
     if ( rc > 0 && size )
     {
         struct vpci_bar *rom = &header->bars[num_bars];
@@ -711,6 +799,15 @@ static int cf_check init_header(struct pci_dev *pdev)
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
     }
+    else if ( !is_hwdom )
+    {
+        /* TODO: Check expansion ROM, we do not handle ROM for guests for now */
+        header->bars[num_bars].type = VPCI_BAR_EMPTY;
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               rom_reg, 4, (void *)0);
+        if ( rc )
+            goto fail;
+    }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 99fe76f08ace..b0e38a5a1acb 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -87,7 +87,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest address. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.43.0



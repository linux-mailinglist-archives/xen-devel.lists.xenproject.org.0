Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE987847B96
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675218.1050523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Be-0006Dc-Ja; Fri, 02 Feb 2024 21:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675218.1050523; Fri, 02 Feb 2024 21:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Be-0006AV-GT; Fri, 02 Feb 2024 21:35:02 +0000
Received: by outflank-mailman (input) for mailman id 675218;
 Fri, 02 Feb 2024 21:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Bd-0003tJ-Hr
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:35:01 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea8d533f-c212-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:35:00 +0100 (CET)
Received: from DS7PR06CA0011.namprd06.prod.outlook.com (2603:10b6:8:2a::6) by
 DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.12; Fri, 2 Feb 2024 21:34:57 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::d5) by DS7PR06CA0011.outlook.office365.com
 (2603:10b6:8:2a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31 via Frontend
 Transport; Fri, 2 Feb 2024 21:34:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:34:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:34:56 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:34:55 -0600
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
X-Inumbo-ID: ea8d533f-c212-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjJQLFq2KtvqVaN/Tm2Ex8k70gamTp6bwQQWhrzQPMbFuyzFxrU6rex1iFGnPWJqiByAZaRCjiFDnjJjtKAIWevOcMImk9bMcGiQPpX0P/WfltgxWlnK80L21dNRR2MsN2DWRQm4B6im0t+q5P8s3aVx1q7YAvUaIsNxaY6g9748K+6gxTFYDrknGGHzdWyoW1W1iAlmDjqQHra9I3Y2vg5YDXQreEXvS3C1CpS2bj9EdpFLOK9nOm8WtDLbYS50wE19rzpQRI+zSVHkOw4SWhHEgX+g/eX6MFscyEIP1miVJ4Acur6nzYL7+YoZOA4jT1gxLf24zO4n4QwjqOqTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fv9DTE0P0KLmwQzPHqaJ/yxioeZbVVsJLRZmvugJrA=;
 b=cwd9UEcWrsXAEAap3OK6GoReAC7oF3fzD0SzB6/yhnur054AYY37dBLyJsJOnSgBz+YbV7yLzFiXfU9ELuRc8sOgoqv/RtFiOPFSIdZMhxgVJJd0QDgexQdglaEqwTVqzy4jn++nqFhPlGuOq/zO/7lSbrxf9W5wlL4XbL6jZdiwmXw2ZeSoTLRq70BKvopcD8hrFzEDooAYJNzi/9nbA3DZXN5ivYcLMxLHWTuoc6G3bOM6NLITf57exlbRAAUT6bEHuWpXwndJ7B5aqM5iZDeMYcQ5nvl7XOXCkzcjVaZ5YKIONZbt8Xnw5cclks21ytdxHOWQEZ8JYxEMSa5Tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fv9DTE0P0KLmwQzPHqaJ/yxioeZbVVsJLRZmvugJrA=;
 b=kKFkQXJVa2as7Kwh/DiORASGaAjUdCbXawJE2QeonZBgPCuqid3OynZ+WP/F4rF1u/vx3UYY0oIg21wKuDE0wcbcj7Llry8SYAh2CKpS1djeiChTiRVdQ6mDw7k8TEvI4NEgtj+KLe0mjVizk7gbUTJJN5CU1J7FbuVKx+BUz9w=
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
Subject: [PATCH v13 05/14] vpci/header: implement guest BAR register handlers
Date: Fri, 2 Feb 2024 16:33:09 -0500
Message-ID: <20240202213321.1920347-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6336fe6a-39fa-4bb8-fc01-08dc2436cd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W33MB+IUMfFJVkt+OdUiGD1Ek3orT1eAO7jFBQVCSL1r/dw6oorWkGUL8Q7F/4VkxbnyOHWyD5f+FvatBV5beImKOMkHYO39EJbM58xCR/2lPBeZd9/atLQn7lR8Vf4ISr9DV/rMtUN0al/WtpbmZIrHlDRG60EPQLyaxkcXHVlTnq4ERa6s7b3S+loJ7orh8e/hJYNmXIXajwtw3vQ/k1BScGSwQICHuoXFdrSZOnF6bnBr+SZ4uTs+NvTV9G6DHfby6g+1xRLy2px+xiTMF3DhsO9nn/3ae5G0/yrBy+smd41+TeRqGw9zE3Ro86GV4ogYhtuxaY1+/sX3tx+yfBQIy8UVfO3ToFc0YxkUHkHNnl6M4vDfW093L4LWPB1i0GpVLh0q2sEkM3e6lhw4q8jrhcHVnVq2k7de56RV7saXNlDb1xyLkLwOXuOFuZFjC292HApbBudLf68plvlBpwvMbCgk/48Sg6zbxGaJetkcY2hCG5IEYhPVIOaGuhs+kqmESvwQyWDdJs+0cCySnfaAoCASoCKs5w77Bu7INSYjw3xMBUT2uOdOKRa33k/Eser1xjmlnK5+CncZzjNAgaeuFTFI4W5Rkpi8qC7NJ7widCsFyEhczMMAHDrSBmp5TP/LOWqTPIsevEDjBOAmP+u0yeh5nUn4WHJ38Q9yvT6wB15LTTpBJQhcZBupZYrPOT1ervRiIKZiF5uIjAhIJ+WwetAuLc7u14RHdi18ZJRTTPwMT9cqOJvK/7Ta5zplUIEXVRsjsHkhHxwMBgUR/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230273577357003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(41300700001)(86362001)(1076003)(36756003)(478600001)(356005)(2616005)(81166007)(83380400001)(47076005)(26005)(2906002)(54906003)(4326008)(36860700001)(316002)(6666004)(82740400003)(426003)(336012)(44832011)(8936002)(70586007)(70206006)(8676002)(5660300002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:34:56.7785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6336fe6a-39fa-4bb8-fc01-08dc2436cd2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265

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



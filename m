Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE1A8A645
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 20:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954337.1348615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4kbx-00056p-CR; Tue, 15 Apr 2025 18:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954337.1348615; Tue, 15 Apr 2025 18:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4kbx-00053k-9a; Tue, 15 Apr 2025 18:02:17 +0000
Received: by outflank-mailman (input) for mailman id 954337;
 Tue, 15 Apr 2025 18:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4sU=XB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u4kbv-00053e-Cp
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 18:02:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2009::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1d0f18e-1a23-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 20:02:13 +0200 (CEST)
Received: from SJ0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:a03:3a1::33)
 by CY8PR12MB7361.namprd12.prod.outlook.com (2603:10b6:930:53::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 15 Apr
 2025 18:02:10 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::d5) by SJ0PR03CA0388.outlook.office365.com
 (2603:10b6:a03:3a1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 18:02:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 18:02:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:02:06 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Apr 2025 13:02:05 -0500
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
X-Inumbo-ID: c1d0f18e-1a23-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGTsIzlydB8hrE96dARo9p139yK//K9s+UBnb42U4BvoknlO+dgdlN942j0dXHL+9UuzOZBuwL7Zuz17F+g0T4uhHQo1OTLLtJtD2/Y3e6YHbMQ8IrBPXySoRejyypq4K7SiN8M01shCLDQ8o0q821M3JFG+Wy8M+CTNa0sfthuTW/oBgMGVo5Gnlz0EkIhY8E8+C9j/tmhDJ60sYVpioqA/OjtSLTgaQ6Pl1j5DDrpfYZFY7v7pZWRlrYu6s5mJWt9dOlDp6t6VS5jt/gH/qN8A9alNqScikmb5fcIVkKk5Hb8F9bDV/ckC4QDbmL6MUW2lWHB0BUD8fbhBk0xPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yX9qihEG9ZRRl+9JNZ1O5WlZCmgIF1K6CKiWw0zST8=;
 b=J3GM8NhgaYrBrklDrcgwg/xZMKN+S9iQerAx2B0nNq2ypM+OW9yt4rtQk7HUNqDHrLTdsJquMRPVFMd5YgrtTVdndQ5ucv3d8eiL/caFiIf3aa+0BCStxEWPleEYaO3rr24zbYzTucc8qqjzFom/4pTgRQB/XEP5Z71J9KmMmzbgpelA8zTAy1U77jb3EsPHYBMUUuIAYQ4ShvE4Zj8SkJK+/MMkqWeB8FYr+VyccdOA+4yfbx7gqWNGz51YswIVi298aK3W/S+hgBKh4n4KbD0eXPGxdF30JCSCC4jpVTSvftZ8uo9PurCeAtfQRZGQ8/AdqcOX0nFRYjWoaUoJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yX9qihEG9ZRRl+9JNZ1O5WlZCmgIF1K6CKiWw0zST8=;
 b=KBRT1IIGnbtssNdCx00SVuY0etuqv1ixo0PCRXOq9OpV2WXiQYPjSOR4oLYJN8tj8fGiHdv1mlZ7HX/zG9O9naxBDpX2vSHz0oZmvMsQvCyWXDILdXliYxXPh8y5sPQDRIDN9sBMx2zM0r/hrjTL3a6FREQlGKanKETLrI/cwlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] vpci/msix: use host msix table address
Date: Tue, 15 Apr 2025 14:01:56 -0400
Message-ID: <20250415180200.436578-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|CY8PR12MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 568cc156-73f5-44b3-3c89-08dd7c47a390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wd+AOO3YM9F5RL1xJ50raG4e0kOq48abptfkm6NZG72S8aXQAxkX3LOEHVAx?=
 =?us-ascii?Q?JGz8OiL/DsppqG2Rs9Gfj7hlO5pCQDred9eKiN4MkpjyiV8ZBxMR9or+2eeT?=
 =?us-ascii?Q?WQGogATfLS88LuLicmz2baC4kBZUi+PT+rvp7kwLwmhydRq3RA7Aj5P7XsaY?=
 =?us-ascii?Q?Xst8Ty4m0IXpgM3FpaGlSWSoOX28cj8Y47OswQMYqOtfKK1y1Ym4GBWUu5I7?=
 =?us-ascii?Q?fQIh1FZIQmEtoN1bNHBG0uzwykW+laqtPL3wmQPCOK2nHRmX9b2rY0pQlBsu?=
 =?us-ascii?Q?wZ6E16o5Dm0/Xtv9djTyO+RDGid69t8vDvx6OfVNjfjAif/R8x/i2DLmaGkW?=
 =?us-ascii?Q?rQy/P9v9XBPi9QBkJUNN3yw11ifioiWmFeSQ/QGYM2u374HqERXSzfkc0wY2?=
 =?us-ascii?Q?nd9PQkrXOdMrlYt79sTv7CKxmPKrLoJnIplYUJDop1om/7nyxAo6WwzmhgNA?=
 =?us-ascii?Q?crUvsx0+w9zK5zCB8fst2Wt73D2Rirpqgc5DavIMkt3mrk3S0oCMaK64jqe8?=
 =?us-ascii?Q?3IdZlutTEEwHKKHdmvS6OetNDrpqZ/4SrUrjmWUWfH3OuHltGTprImIaOAbb?=
 =?us-ascii?Q?AJF+v6tMquaOYPQhpGNyPW+pcGyBZib/o+vm/IZImgwZD3nB2iUyCJjibEAz?=
 =?us-ascii?Q?bYrvBM0jpHWwIWJ3XY63BquSX4Lu1/P5j3a7+i+ql4uZ07+ABJIEegHdZjqO?=
 =?us-ascii?Q?joYe/4He7BRCoQibM5XUhOTAW5z6RZCEzAkH7nPgqc2AgTrxzdYya1PyWAvX?=
 =?us-ascii?Q?+NJWG9DucXO7IAt3KcZ9w6PxT2wENaUPchP4V8KVlBK69afDkAQFmxUF+An1?=
 =?us-ascii?Q?QtqDU20cCXVeBxhb0Y0axK9JPd1KKevvgbTtRTow7rZn+dvjsQ1Xx4dniEJa?=
 =?us-ascii?Q?EX9N4RYet3MKJpO2QeTJjQ4QaFnRQza8JC0HpPKouV3bmBeCAVeFD7Q/RpMC?=
 =?us-ascii?Q?EAAWdrkX13o5gAmEoLWKkz60meBmev25rnjtGjPRtY/X9XsQIeLutteYgGUT?=
 =?us-ascii?Q?Z3IQEwS/k20rs9MBRGDMy7e1EMS5jIE5TNoPiqZsxdZiWHmdFEKootPZ43rt?=
 =?us-ascii?Q?RR019itPwimB3+6iZY4byiShoen2qKx1iCmCn6jXg2vpFw+GjBkofMdcfH0n?=
 =?us-ascii?Q?RbaoncNsNKY9H6aq2OnfHH45zzyWO3/JG0GacNJB5k5HtPgGTPzmxhorBcvE?=
 =?us-ascii?Q?kxpfUrkjSv6Bzv5zYcVWPUJQvIQJSH0di5zNXHLOWsMwdocBtUTOK1L0gbJa?=
 =?us-ascii?Q?Awt7GgW1atUq4fJjcM4QjRCUC9Od4liXDn4ms6ll7juep6tNAaKK2UOk/X/g?=
 =?us-ascii?Q?csDr9dxSDZPlzdyJfGQKQWAXj8K78huHbMiCl52u6Q6xi8ZZe4J/N9pr0lwx?=
 =?us-ascii?Q?y1K5oqG9GVFk2ECiADUtdkRh5tx2Co0qhWrqHeH7N5VLO/YygN07MnhxBV0Z?=
 =?us-ascii?Q?n6fw9mptUy1pn2aay3io0Mt5oEvPftrs0c8kUZHvlxsXJKaqw/ul5bHD5rEj?=
 =?us-ascii?Q?4GvXXk3/yxrc6W6IjaNXDJbZiA+9/k3po4cm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:02:08.3577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 568cc156-73f5-44b3-3c89-08dd7c47a390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7361

Introduce vmsix_table_host_{addr,base} returning the host physical MSI-X
table address and base. Use them in update_entry() and get_table().

Remove stale comment.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
I considered adding this tag:
Fixes: 52ebde3cfae2 ("vpci/header: program p2m with guest BAR view")
but I left it out since upstream currently only supports identity-mapped
vPCI.
---
 xen/drivers/vpci/msix.c | 14 ++++----------
 xen/include/xen/vpci.h  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6bd8c55bb48e..f3804ce047a3 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -57,8 +57,8 @@ static void update_entry(struct vpci_msix_entry *entry,
     }
 
     rc = vpci_msix_arch_enable_entry(entry, pdev,
-                                     vmsix_table_base(pdev->vpci,
-                                                      VPCI_MSIX_TABLE));
+                                     vmsix_table_host_base(pdev->vpci,
+                                                           VPCI_MSIX_TABLE));
     if ( rc )
     {
         gprintk(XENLOG_WARNING, "%pp: unable to enable entry %u: %d\n",
@@ -218,14 +218,14 @@ static void __iomem *get_table(const struct vpci *vpci, unsigned int slot)
         addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
         fallthrough;
     case VPCI_MSIX_TBL_HEAD:
-        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+        addr += vmsix_table_host_addr(vpci, VPCI_MSIX_TABLE);
         break;
 
     case VPCI_MSIX_PBA_TAIL:
         addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
         fallthrough;
     case VPCI_MSIX_PBA_HEAD:
-        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        addr += vmsix_table_host_addr(vpci, VPCI_MSIX_PBA);
         break;
 
     default:
@@ -242,12 +242,6 @@ static unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
 {
     unsigned long pfn = PFN_DOWN(addr);
 
-    /*
-     * The logic below relies on having the tables identity mapped to the guest
-     * address space, or for the `addr` parameter to be translated into its
-     * host physical memory address equivalent.
-     */
-
     if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
         return VPCI_MSIX_TBL_HEAD;
     if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..475981cb8155 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -231,6 +231,19 @@ int vpci_msix_arch_print(const struct vpci_msix *msix);
  * Helper functions to fetch MSIX related data. They are used by both the
  * emulated MSIX code and the BAR handlers.
  */
+static inline paddr_t vmsix_table_host_base(const struct vpci *vpci,
+                                            unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
+}
+
+static inline paddr_t vmsix_table_host_addr(const struct vpci *vpci,
+                                            unsigned int nr)
+{
+    return vmsix_table_host_base(vpci, nr) +
+           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+}
+
 static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned int nr)
 {
     return vpci->header.bars[vpci->msix->tables[nr] &

base-commit: 38d07809794e3c723a4de7e10c25c1f6cb590dc6
-- 
2.49.0



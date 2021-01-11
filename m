Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBD2F0BFD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 05:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64569.114067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kypDG-000178-Mo; Mon, 11 Jan 2021 04:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64569.114067; Mon, 11 Jan 2021 04:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kypDG-00016j-Iz; Mon, 11 Jan 2021 04:53:54 +0000
Received: by outflank-mailman (input) for mailman id 64569;
 Mon, 11 Jan 2021 04:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kypDE-00016e-Bh
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 04:53:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d6ef1af-05ef-4027-b1d3-4a01652ee805;
 Mon, 11 Jan 2021 04:53:50 +0000 (UTC)
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
X-Inumbo-ID: 1d6ef1af-05ef-4027-b1d3-4a01652ee805
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610340830;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=4xaMTGPKnMA4X76XrghfKZsFvxhiqTp3/+83cpgVziE=;
  b=dbfy1cmLId8LB0ZxNLn4B4evUcD+DelyWNsqr8KA3zGiRfiQTS2KooXG
   oY0IkYXkh/Yc+QBICdrwHmuj+aNkFTtEDngdYGhRdDuBudBwQFrEWb4JP
   VCMd8gRyq7dhiKc3iYMe9VTVu1b4yr6Q0U41pr5MP0XWJdrJubhgGjmuP
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xWU/WsM2W6TTxGZMyY8JQ4DDuv2YiQCjHNzPgd1S+BGt4uYc1Uc3mo58ZirAjGTsDBlXXX1eVN
 vMjQJU8RzlSYV9N5sNdIqK2IeVsj3igKg39D/1ydvTkD0A9IUaMSjmyNjs/dqBHkCO52yZMoJM
 YjqHodOwiLq1Thov9nsLa6t0hBKZ9xd/ODtdCre5n8GjToVCCFSDvauqEZryZK1dRRmJd45s5P
 gE9zmXZfyKQGHb9ipYk8/6sPjhxDtB7vs2nxJzmRengbVsgD4UOKF6BQtXOXp1kOGUbm9WdVf7
 Pgw=
X-SBRS: 5.2
X-MesageID: 35163712
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,337,1602561600"; 
   d="scan'208";a="35163712"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
Date: Mon, 11 Jan 2021 04:53:31 +0000
Message-ID: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

We faced a problem with passing through a PCI device with 64GB BAR to
UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
64G address which pushes physical address space to 37 bits. OVMF uses
address width early in PEI phase to make DXE identity pages covering
the whole addressable space so it needs to know the last address it needs
to cover but at the same time not overdo the mappings.

As there is seemingly no other way to pass or get this information in
OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
xenstore is not yet initialized) - extend the info structure with a new
table. Since the structure was initially created to be extendable -
the change is backward compatible.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

Companion change in OVMF:
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00516.html

---
 tools/firmware/hvmloader/ovmf.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a0..9bfe274 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -61,6 +61,14 @@ struct ovmf_info {
     uint32_t e820_nr;
 } __attribute__ ((packed));
 
+#define OVMF_INFO_PCI_TABLE 0
+struct ovmf_pci_info {
+    uint64_t low_start;
+    uint64_t low_end;
+    uint64_t hi_start;
+    uint64_t hi_end;
+} __attribute__ ((packed));
+
 static void ovmf_setup_bios_info(void)
 {
     struct ovmf_info *info = (void *)OVMF_INFO_PHYSICAL_ADDRESS;
@@ -74,9 +82,21 @@ static void ovmf_setup_bios_info(void)
 static void ovmf_finish_bios_info(void)
 {
     struct ovmf_info *info = (void *)OVMF_INFO_PHYSICAL_ADDRESS;
+    struct ovmf_pci_info *pci_info;
+    uint64_t *tables = scratch_alloc(sizeof(uint64_t)*OVMF_INFO_MAX_TABLES, 0);
     uint32_t i;
     uint8_t checksum;
 
+    pci_info = scratch_alloc(sizeof(struct ovmf_pci_info), 0);
+    pci_info->low_start = pci_mem_start;
+    pci_info->low_end = pci_mem_end;
+    pci_info->hi_start = pci_hi_mem_start;
+    pci_info->hi_end = pci_hi_mem_end;
+
+    tables[OVMF_INFO_PCI_TABLE] = (uint32_t)pci_info;
+    info->tables = (uint32_t)tables;
+    info->tables_nr = 1;
+
     checksum = 0;
     for ( i = 0; i < info->length; i++ )
         checksum += ((uint8_t *)(info))[i];
-- 
2.7.4



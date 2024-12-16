Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C149F3E76
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 00:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858507.1270756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKta-0005Dd-3O; Mon, 16 Dec 2024 23:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858507.1270756; Mon, 16 Dec 2024 23:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKta-0005Aa-01; Mon, 16 Dec 2024 23:53:02 +0000
Received: by outflank-mailman (input) for mailman id 858507;
 Mon, 16 Dec 2024 23:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNKtY-0004wR-DN
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 23:53:00 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0be2027-bc08-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 00:52:58 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 00:52:59 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 57B8E2EB7;
 Tue, 17 Dec 2024 00:52:58 +0100 (CET)
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
X-Inumbo-ID: e0be2027-bc08-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734393179; x=1765929179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wsuAFQksUReamPBle/EzWnEkgLkOUKoKn+XJSAZOxeU=;
  b=C3EgGv/HW/wkUNWmb0R8XG5x4Ir/kgIgtKHQDHA52LAr30KiQBYro4kT
   gYACim/YvuNgFTbV/2CsaAWizTaEwtDmhvZ9Fl/UmzPK0i8tKjK67eV31
   c+pel1QMBLN1/pc54RrW85uMLi86e9tA1nHgWe9sy0qH6KuB4MC8OPSIz
   U=;
X-CSE-ConnectionGUID: v7LBfRqdRH25XXAOgTDV4Q==
X-CSE-MsgGUID: qAkoC3LxQDuHZzA0HBScIQ==
X-IronPort-AV: E=Sophos;i="6.12,240,1728943200"; 
   d="scan'208";a="28208689"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH v2 1/1] tools/libacpi: clear ASL warning about PCI0
Date: Tue, 17 Dec 2024 00:50:25 +0100
Message-ID: <20241216235241.217642-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iasl complains _HID and _ADR cannot be used at the same time:

```
/usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID

tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
```

Per ACPI 2.0 (Jul. 27, 2000; Section 6.1, page 146), the configuration was legit:

"A device object must contain either an _HID object or an _ADR object,
but can contain both." [1]

But, per ACPI 6.5 (Aug. 2022), this is no more legit:

"A device object must contain either an _HID object or an _ADR object,
but must not contain both." [2]

Generally _HID devices are enumerated and have their drivers loaded
by ACPI ("ASL 2.0 Introduction and Overview", page 4).

Removing _ADR, the warning is cleared out.

The change should be compatible down to OSes released after ACPI 2.0,
including Windows XP:

1. The _HID kept in the DSDT files is the EISA ID "PNP0A03",
Microsoft recognizes it as PCI bus:

```
$ curl -k -s https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/devids.txt | grep PNP0A

PNP0A00         ISA Bus
PNP0A01         EISA Bus
PNP0A02         MCA Bus
PNP0A03         PCI Bus
PNP0A04         VESA/VL Bus
PNP0A05         Generic ACPI Bus
PNP0A06         Generic ACPI Extended-IO Bus (EIO bus)
```

2. Linux 6.12 uses also _HID for identifying PCI devices [3]:

```
$ cat /sys/firmware/acpi/tables/DSDT > dsdt.dat
$ iasl -v

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20240927
Copyright (c) 2000 - 2023 Intel Corporation

$ iasl -d dsdt.dat 2>/dev/null

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20240927
Copyright (c) 2000 - 2023 Intel Corporation

$ grep PNP0A03 -B3 dsdt.dsl
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
```

[1] https://uefi.org/sites/default/files/resources/ACPI_2.pdf
[2] https://uefi.org/specs/ACPI/6.5/06_Device_Configuration.html?highlight=_hid#device-identification-objects
[3] https://www.infradead.org/~mchehab/kernel_docs/firmware-guide/acpi/namespace.html

Link: https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/documentation.html
Fixes: a5da231f56268702ba9d9e0c4f1ad7156446e77b
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 tools/libacpi/dsdt.asl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
index 32b42f85ae..9d50578e98 100644
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -41,7 +41,6 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_UID, 0x00)
-           Name (_ADR, 0x00)
            Name (_BBN, 0x00)
 
            /* Make cirrues VGA S3 suspend/resume work in Windows XP/2003 */
-- 
2.47.1



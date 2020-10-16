Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE86228FC22
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 02:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7750.20403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTDmb-0007Fb-Kh; Fri, 16 Oct 2020 00:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7750.20403; Fri, 16 Oct 2020 00:39:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTDmb-0007FC-HR; Fri, 16 Oct 2020 00:39:45 +0000
Received: by outflank-mailman (input) for mailman id 7750;
 Fri, 16 Oct 2020 00:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tE9=DX=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kTDmZ-0007F6-86
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 00:39:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39bd4f66-7deb-4e53-b153-db2ac39a2d1e;
 Fri, 16 Oct 2020 00:39:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4tE9=DX=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kTDmZ-0007F6-86
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 00:39:43 +0000
X-Inumbo-ID: 39bd4f66-7deb-4e53-b153-db2ac39a2d1e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39bd4f66-7deb-4e53-b153-db2ac39a2d1e;
	Fri, 16 Oct 2020 00:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602808781;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=A7SS5LkOU52vzc6By7hOafvn87xPxCwRLNNCpbXX8O8=;
  b=CY/Vb/jCcahcaFT7KBAJv+xxZz5jgjL5y0kfdVEOQ4krZhWAtNji5mCC
   1LUEqc8KX7jB0QMdc6PCywd+WZzRSaG2C83pHnQeEksq/0Sw3MAOtNRMz
   wNmrg9zy8rF32ffpyVRdMmDPgTHuMng8I8zjQZ92EJydWkuHCXwe/kPtI
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sfdou8sKDvvWTiRJit1Kwt5bCz0OD68kt32J5SZ8stCn13rsb/nbREETUQAygbLmL/P0YAjBBn
 Eo3GN+g+yMoATm8ZaxgMV2RmgDOA8KpyX5icnNN+EVYs7/qGrKOWH9W5BwntTbcl25pWqJqTMC
 Uj5ziVpgDwbNPtkiCjh0rFwrCP/8YlnPHuolDoSPwLk2xMPtVn3MiRvMfXf9ia3sU50zXvE121
 21SnF6/Sg95mrPynirtJU84xIz8FGEFy4gO3ob82p048jbOp09uUKaCyuUDnAXe5rhmRo6g2Ur
 n9s=
X-SBRS: 2.5
X-MesageID: 29377436
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,380,1596513600"; 
   d="scan'208";a="29377436"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH v2] hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region
Date: Fri, 16 Oct 2020 01:39:23 +0100
Message-ID: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

ACPI specification contains statements describing memory marked with regular
"ACPI data" type as reclaimable by the guest. Although the guest shouldn't
really do it if it wants kexec or similar functionality to work, there
could still be ambiguities in treating these regions as potentially regular
RAM.

One such example is SeaBIOS which currently reports "ACPI data" regions as
RAM to the guest in its e801 call. Which it might have the right to do as any
user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
to ignore that fact and is instead using e801 to find a place for initrd which
causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
to be fixed / improved here, that is just one example of the potential problems
from using a reclaimable memory type.

Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
described by the spec as non-reclaimable (so cannot ever be treated like RAM).

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- Put the exact reasoning into a comment
- Improved commit message
---
 tools/firmware/hvmloader/e820.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 38bcf18..c490a0b 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -202,16 +202,21 @@ int build_e820_table(struct e820entry *e820,
     nr++;
 
     /*
-     * Mark populated reserved memory that contains ACPI tables as ACPI data.
+     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
      * That should help the guest to treat it correctly later: e.g. pass to
-     * the next kernel on kexec or reclaim if necessary.
+     * the next kernel on kexec.
+     *
+     * Using NVS type instead of a regular one helps to prevent potential
+     * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
+     * before an ACPI OS takes control. This is possible due to the fact that
+     * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
      */
 
     if ( acpi_enabled )
     {
         e820[nr].addr = RESERVED_MEMBASE;
         e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
-        e820[nr].type = E820_ACPI;
+        e820[nr].type = E820_NVS;
         nr++;
     }
 
-- 
2.7.4



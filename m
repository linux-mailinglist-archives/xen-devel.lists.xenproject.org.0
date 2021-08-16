Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EB3ED788
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 15:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167348.305461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFclo-0005Yc-Fs; Mon, 16 Aug 2021 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167348.305461; Mon, 16 Aug 2021 13:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFclo-0005Wf-Cp; Mon, 16 Aug 2021 13:35:16 +0000
Received: by outflank-mailman (input) for mailman id 167348;
 Mon, 16 Aug 2021 13:35:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFclm-0005WX-JT
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 13:35:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cd43071-3a08-48ee-867c-bef8d2ab4669;
 Mon, 16 Aug 2021 13:35:13 +0000 (UTC)
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
X-Inumbo-ID: 9cd43071-3a08-48ee-867c-bef8d2ab4669
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629120913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J3Rz2pdrx18ZZ+7VvhEz+bCgJyTqT/VHf8O3JBJwNHM=;
  b=g11IB4PSQH4/8zcca4O/Aon7Q3Lyj0Bb88vNwdpCebJJTry6xKa9uzSB
   RhmsDDa21grmvuz1baYHUI9VycLAnefQIGe60qRjJbNsIQQbrRXeOrHE5
   P+ZksRqV/jZAtivifpFZBTLkLj1s9ZJRz29J2qrudbsuJf2h97KqziSSs
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nNue01P5FLgoYh+xBhs4YIh16TNPfWBgrZvqWI45iUDd17kox+qCjxF8ZoZ78XKeucBIrNKjSL
 eSDUOOWACCfmsmNH9epUiwlc6cL6qw6Zf4Q4q98khZ19Uz0d1KEq5vkdMe8xpdXLEtHnqC95CS
 iUbY+8n2g8ClNObjX9AsmsN0dQLE8NnPFYSh1x2w9HsHl5VTvxsz2qlY96xgEmgh5MznpWEENh
 tVGVzGoFiK4aYtN68B8l7TjS5xbPgRqwhatU86wxtvoYzVENosqEu+HctFebxEyNlH3UFJrJf6
 1IZipsiKRNENmBX7AXsPb6yT
X-SBRS: 5.1
X-MesageID: 50526644
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Gp7mI6Psp5xmS8BcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.84,326,1620705600"; 
   d="scan'208";a="50526644"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ACPI: Insert missing newlines into FACS error messages
Date: Mon, 16 Aug 2021 14:35:05 +0100
Message-ID: <20210816133505.32484-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Booting Xen as a PVH guest currently yields:

  (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
  (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
  (XEN) ACPI: Local APIC address 0xfee00000

Insert newlines as appropriate.

Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

As to why the FACS is misaligned, clearly that is a bug in the domain builder
for PVH guests, but I don't have time to go debugging.
---
 xen/arch/x86/acpi/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index ff4685279f68..8fe2d6fe0f42 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -432,19 +432,19 @@ acpi_fadt_parse_sleep_info(const struct acpi_table_fadt *fadt)
 	}
 
 	if (facs->length < 24) {
-		printk(KERN_ERR PREFIX "Invalid FACS table length: %#x",
+		printk(KERN_ERR PREFIX "Invalid FACS table length: %#x\n",
 			facs->length);
 		goto done;
 	}
 
 	if (facs->length < 64)
 		printk(KERN_WARNING PREFIX
-			"FACS is shorter than ACPI spec allow: %#x",
+			"FACS is shorter than ACPI spec allow: %#x\n",
 			facs->length);
 
 	if (facs_pa % 64)
 		printk(KERN_WARNING PREFIX
-			"FACS is not 64-byte aligned: %#lx",
+			"FACS is not 64-byte aligned: %#lx\n",
 			facs_pa);
 
 	acpi_sinfo.wakeup_vector = facs_pa + 
-- 
2.11.0



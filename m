Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233C6BBCB5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510181.787468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWE1-0004nD-9i; Wed, 15 Mar 2023 18:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510181.787468; Wed, 15 Mar 2023 18:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWE1-0004kG-6O; Wed, 15 Mar 2023 18:51:49 +0000
Received: by outflank-mailman (input) for mailman id 510181;
 Wed, 15 Mar 2023 18:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcWDz-0004kA-3L
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:51:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d0d77ee-c362-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 19:51:44 +0100 (CET)
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
X-Inumbo-ID: 6d0d77ee-c362-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678906304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MgtwZSSEuFo5S2LwKAm5oTAQpnpB+zwGo/RrTXBCARE=;
  b=NeS4vkhAE6XeX8i8nUx5BOMIx7e7Exj2icKABFSsP+g7lTN2OyrGMDnn
   DchGgxbzsHB7XLlPCUEJrknEb4QYiMwIhXHwMATIpWRFvnIETAe3Tfr3O
   fsLCFzxkLCvb0ET2juvvZ9BR+ghvj0Jt4kV/+Hfu9hHLmDzfeejTGsfl4
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99809356
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FF28qq64b1ww2hM4CFrUtAxRtArHchMFZxGqfqrLsTDasY5as4F+v
 mEWXWHVaayONzP9KIogaITnoUwHvcXRztE1QQE/pX82Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 aYRAS89Sw64uLiVg4yWSs1jqsAzI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zxfI/
 jOdojqR7hcyOe278Bik6ECXlPL1hhvEfcU3D7C236s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9NUEvYm4QCXjKTO6gCSB3MsUTJKLtchsaceTzsg3
 E6EhNPtCDlmtpWaTHuc8vGfqjbaESMSK2kFZyMNUwoey9bmqYA3yBnIS75e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1Vydihuzlr3XdTFvxUbpc2KB4S99dIHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiOMrKigbArLmdrGR2CgmbBt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsCrlkX+iOLGOyT9pVI53LymP4gEAF6s+l2Jo
 76zyePTo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6RqSwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9Qio5Meq1Dc0h9SpT0O5FFQ/A5kXPqL2HtM83H6bbt5F9nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:0sIzwaCGH78GhSflHelc55DYdb4zR+YMi2TDt3oddfU1SL3+qy
 nKpp4mPHDP5wr5NEtPpTnEAtjifZq+z+8Q3WByB9eftWDd0QPFEGgh1/qB/9SJIUbDH4VmpM
 JdmsZFaeEZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="99809356"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH] xen/riscv: Fix build with GCC 10
Date: Wed, 15 Mar 2023 18:51:21 +0000
Message-ID: <20230315185121.665635-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

  riscv64-linux-gnu-gcc -MMD -MP -MF arch/riscv/.early_printk.o.d -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64  -I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -mcmodel=medany   -c arch/riscv/early_printk.c -o arch/riscv/early_printk.o
  arch/riscv/early_printk.c:18:2: error: #error "early_*() can be called from head.S with MMU-off"
     18 | #error "early_*() can be called from head.S with MMU-off"
        |  ^~~~~

  $ riscv64-linux-gnu-gcc --version
  riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110

The binary is otherwise correct, so remove the incorrect check.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>

I was honestly hoping to leave this to some poor sole in the future.

But the irony of this check, after all the argument it caused, breaking the
very case it was trying to enforce, speaks volumes.
---
 xen/arch/riscv/early_printk.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index dfe4ad77e25d..b66a11f1bc1a 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -7,17 +7,6 @@
 #include <asm/early_printk.h>
 #include <asm/sbi.h>
 
-/*
- * When the MMU is off during early boot, any C function called has to
- * use PC-relative rather than absolute address because the physical address
- * may not match the virtual address.
- *
- * To guarantee PC-relative address cmodel=medany should be used
- */
-#ifndef __riscv_cmodel_medany
-#error "early_*() can be called from head.S with MMU-off"
-#endif
-
 /*
  * TODO:
  *   sbi_console_putchar is already planned for deprecation
-- 
2.30.2



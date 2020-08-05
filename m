Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8723CB4A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 15:56:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Jsr-0000Sf-5I; Wed, 05 Aug 2020 13:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3Jsq-0000Sa-4v
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 13:55:08 +0000
X-Inumbo-ID: eefbd95f-2a62-4165-84c7-0511a117ab01
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eefbd95f-2a62-4165-84c7-0511a117ab01;
 Wed, 05 Aug 2020 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596635706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4gaE8tRpToc/tJWR936re1gQrXhgXYeq0Cw0ab7DDzc=;
 b=iByycVsk1sGoMeq78N48XtUaJ6xyD1Y+SzERYWlwvOmEExJINesIS4/V
 g1kLPIEueIY5Rpip+OYSBmnTm84S0EVmE/0Rk4ud4WR6Q/rR7al85TZk0
 SnzgcCt0sUgJ7VQbdU6OFZeHRfkUldYPKzFEItiaS3msdcJfh+Jv4zYRx Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: l3AaX3pjiT/6Ld2AsmG+4tHWQXSR/XNWZW4+dDgDdUU1Icc0YoEKLFli+JVwc4A4R1JExpg5+e
 v+SbinPt6V1uglH9UOcbhfKVckIrmozfDP7zwSJ7i1qIG7kBVeXR+1loRcuC3FSleKOLHlcjAY
 PwlOx0KzAXhz/yN7Om0CgixkbxCyUTcqxlefHwoFIL8AHv0riHByA+QoxK6Tp1oeiN3uMPEP0I
 QuRGV+JEaMO98orYLC/QuiwVNdftxbvXx02B35K2vvFuqKOT+iDUDWGg+fKg30x7KkiJa54FJT
 a/U=
X-SBRS: 3.7
X-MesageID: 24253665
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24253665"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/ioapic: Improve code generation for __io_apic_{read,
 write}()
Date: Wed, 5 Aug 2020 14:54:18 +0100
Message-ID: <20200805135418.31528-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The write into REGSEL prevents the optimiser from reusing the address
calculation, forcing it to be calcualted twice.

The calculation itself is quite expensive.  Pull it out into a local varaible.

Bloat-o-meter reports:
  add/remove: 0/0 grow/shrink: 0/26 up/down: 0/-1527 (-1527)

Also correct the register type, which is uint32_t, not int.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/io_apic.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/asm-x86/io_apic.h
index daf17d4c3d..cb36e4ca1b 100644
--- a/xen/include/asm-x86/io_apic.h
+++ b/xen/include/asm-x86/io_apic.h
@@ -14,8 +14,8 @@
  */
 
 #define IO_APIC_BASE(idx)                                               \
-    ((volatile int *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx)           \
-                      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
+    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx)      \
+                           + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
 
 #define IO_APIC_ID(idx) (mp_ioapics[idx].mpc_apicid)
 
@@ -135,8 +135,10 @@ unsigned int io_apic_gsi_base(unsigned int apic);
 
 static inline unsigned int __io_apic_read(unsigned int apic, unsigned int reg)
 {
-    *IO_APIC_BASE(apic) = reg;
-    return *(IO_APIC_BASE(apic)+4);
+    volatile uint32_t *regs = IO_APIC_BASE(apic);
+
+    regs[0] = reg;
+    return regs[4];
 }
 
 static inline unsigned int io_apic_read(unsigned int apic, unsigned int reg)
@@ -148,8 +150,10 @@ static inline unsigned int io_apic_read(unsigned int apic, unsigned int reg)
 
 static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    *IO_APIC_BASE(apic) = reg;
-    *(IO_APIC_BASE(apic)+4) = value;
+    volatile uint32_t *regs = IO_APIC_BASE(apic);
+
+    regs[0] = reg;
+    regs[4] = value;
 }
 
 static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
-- 
2.11.0



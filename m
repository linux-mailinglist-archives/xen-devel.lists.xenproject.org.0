Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE745F1FE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233235.404583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeAi-0000TX-ED; Fri, 26 Nov 2021 16:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233235.404583; Fri, 26 Nov 2021 16:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeAi-0000Rk-BC; Fri, 26 Nov 2021 16:34:00 +0000
Received: by outflank-mailman (input) for mailman id 233235;
 Fri, 26 Nov 2021 16:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqeAh-0000Re-23
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 16:33:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d49001-4ed6-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 17:33:57 +0100 (CET)
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
X-Inumbo-ID: a5d49001-4ed6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637944437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KYEz55HYjAYxPEm8qBYCpFw4y6kWRbV6ztRd7oOqaJA=;
  b=WvrHmTftpGN6Q0ezAqdAE5VQf5Au5teR5yIHGwhNywysZ2Wku57IIwD6
   NIRBmzh7AF660Xxgkzes19jnYDFA61wEOi/8W2YLTU8xARw4B8Lm3rRGl
   qIMpszfoIwgjNApKgK3NucbsALw8tXIEDM3AnTOhTjGG8LhjnVgL3kw7t
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y3N6KCa5Nnq1a+ynvFHrqGW7zFkGMYUyORd1SouRYf6P6YfSS0dqUsh0PvczSSi+w+BvSZ9zF1
 UdhgQyi5KUYgxgyeoZKdAv+ZOPtq9jtM7VuSh6RQPOcvdInld8pgLpHE0s+6CNYHm/wT7jqiG7
 uBO852vbK1lQoyrubqOW0W9lVuHsm6GN4FRrrd12BNRQINHAYuTjQZlwkTq/KUwrFf3ugVAuVI
 ijkbVChwhyHbNDg/wPI28wOKo2XLN+SiRkPeYFAyoGG6eBAc0th2XLRVv39e3dl/QcU9hQZLSp
 Z6LFkUWskjABUo1oPMgW3LEu
X-SBRS: 5.1
X-MesageID: 58206538
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7q3XoKu1xEsXix5Y31QeXi/FsufnVJtZMUV32f8akzHdYApBsoF/q
 tZmKW6GbPaONjGjethwPdnl80IFv8fRz9FgTQdsqig2Ri9H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqLKgEioqN7b1h+kZcTt2NityYbdJ9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5BBN2c0PHwsZTUXFFQIDrcDmtyUuTq8MB9jkG2/hvsOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO/AU+FqgyaPP2hmUAkomYBtLZIA8u8BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:5W/Pm6w9dTxYf486RQubKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58206538"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64 instructions
Date: Fri, 26 Nov 2021 16:33:40 +0000
Message-ID: <20211126163340.26714-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to prevent the optimiser creating unsafe code.  See the code comment for
full details.

Also add a build time check for endbr64 embedded in imm32 operands, which
catches the obvious cases where the optimiser has done an unsafe thing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/Makefile       |  4 ++++
 xen/include/asm-x86/endbr.h | 55 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 xen/include/asm-x86/endbr.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 69b6cfaded25..64a5c0d20018 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
+ifeq ($(CONFIG_XEN_IBT),y)
+	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
+		{ echo "Found embedded endbr64 instructions" >&2; false; } || :
+endif
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
diff --git a/xen/include/asm-x86/endbr.h b/xen/include/asm-x86/endbr.h
new file mode 100644
index 000000000000..47f766024c12
--- /dev/null
+++ b/xen/include/asm-x86/endbr.h
@@ -0,0 +1,55 @@
+/******************************************************************************
+ * include/asm-x86/endbr.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2021 Citrix Systems Ltd.
+ */
+#ifndef XEN_ASM_ENDBR_H
+#define XEN_ASM_ENDBR_H
+
+#include <xen/compiler.h>
+
+/*
+ * In some cases we need to inspect/insert endbr64 instructions.
+ *
+ * The naive way, mem{cmp,cpy}(ptr, "\xf3\x0f\x1e\xfa", 4), optimises unsafely
+ * by placing 0xfa1e0ff3 in an imm32 operand, which marks a legal indirect
+ * branch target as far as the CPU is concerned.
+ *
+ * gen_endbr64() is written deliberately to avoid the problematic operand, and
+ * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
+ */
+static inline uint32_t __attribute_const__ gen_endbr64(void)
+{
+    uint32_t res;
+
+    asm ( "mov $~0xfa1e0ff3, %[res]\n\t"
+          "not %[res]\n\t"
+          : [res] "=r" (res) );
+
+    return res;
+}
+
+static inline bool is_endbr64(const void *ptr)
+{
+    return *(const uint32_t *)ptr == gen_endbr64();
+}
+
+static inline void place_endbr64(void *ptr)
+{
+    *(uint32_t *)ptr = gen_endbr64();
+}
+
+#endif /* XEN_ASM_ENDBR_H */
-- 
2.11.0



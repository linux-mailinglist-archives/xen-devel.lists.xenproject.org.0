Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68050187E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 18:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304940.519700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf2K7-0006Ke-Rb; Thu, 14 Apr 2022 16:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304940.519700; Thu, 14 Apr 2022 16:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf2K7-0006Io-OZ; Thu, 14 Apr 2022 16:27:59 +0000
Received: by outflank-mailman (input) for mailman id 304940;
 Thu, 14 Apr 2022 16:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nf2K6-0006Ii-V4
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 16:27:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7129773-bc0f-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 18:27:57 +0200 (CEST)
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
X-Inumbo-ID: d7129773-bc0f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649953677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YpbrNsO5eqU21GpQZ9G2rrY/TRBO8lp6nInT+GXGccI=;
  b=Vdv6JI0vOsqW64hdqk0wtU+/Sc0pvwcd4t8ZVC1y/HsHNRYIE7L1xXlO
   3YTZ1em88Lmh6YAEV93cEhzbeuwrNyeglIC5Pos2mKYwuZwEOdqKl6m7/
   ZZchyyEGIdBFT3GMar4e1ZxARL+FDxHy9/1UoRSmvWspQe3HcS4josggH
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68981224
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dQx8YKABLndCEhVW/yzjw5YqxClBgxIJ4kV8jS/XYbTApG52gmMPy
 modWW+OO6qMYmqjft9wYYuw/BwC6sTcnNVjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh/8
 Mxzn5mVEz4gJ7HooO4dTBwFSCZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4eTKaHP
 ZBFAdZpRA7+SQJ0GXYSMcMVgryBuHjaTht6rk3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0VeJJLcc/zVu0w7PIxz6TBncBE2VGd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAufh8wbJpfImKBj
 KrvVeV5vs470JyCN/EfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CbSgOXiGrdROdTjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:SFltrao3E1Y8mB/+awMcrCkaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="68981224"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v1.1 2/3] x86/build: Don't convert boot/{cmdline,head}.bin back to .S
Date: Thu, 14 Apr 2022 17:27:39 +0100
Message-ID: <20220414162739.7251-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414114708.4788-3-andrew.cooper3@citrix.com>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There's no point wasting time converting binaries back to asm source.  Just
use .incbin directly.  Explain in head.S what these binaries are.

Also, align the blobs.  While there's very little static data in the blobs,
they should have at least 4 byte alignment.  There was previously no guarantee
that cmdline_parse_early was aligned, and there is no longer an implicit
4-byte alignment between cmdline_parse_early and reloc caused by the use of
.long.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

v1.1:
 * Rebase over the out-of-tree build work

Cleanup to $(head-srcs) deferred to the subsequent patch to make the change
legible.
---
 xen/arch/x86/boot/Makefile |  9 ++++-----
 xen/arch/x86/boot/head.S   | 10 ++++++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index a5dd094836f6..0670e03b72e0 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -10,7 +10,10 @@ head-srcs := $(addprefix $(obj)/, $(head-srcs))
 ifdef building_out_of_srctree
 $(obj)/head.o: CFLAGS-y += -iquote $(obj)
 endif
-$(obj)/head.o: $(head-srcs)
+# For .incbin - add $(obj) to the include path and add the dependencies
+# manually as they're not included in .d
+$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
+$(obj)/head.o: $(head-srcs:.S=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -24,10 +27,6 @@ CFLAGS_x86_32 += -I$(srctree)/include
 $(head-srcs:.S=.o): CFLAGS_stack_boundary :=
 $(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 
-$(head-srcs): %.S: %.bin
-	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
-	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
-
 %.bin: %.lnk
 	$(OBJCOPY) -j .text -O binary $< $@
 
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 3db47197b841..0fb7dd3029f2 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -777,11 +777,17 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        /*
+         * cmdline and reloc are written in C, and linked to be 32bit PIC with
+         * entrypoints at 0 and using the stdcall convention.
+         */
+        ALIGN
 cmdline_parse_early:
-#include "cmdline.S"
+        .incbin "cmdline.bin"
 
+        ALIGN
 reloc:
-#include "reloc.S"
+        .incbin "reloc.bin"
 
 ENTRY(trampoline_start)
 #include "trampoline.S"
-- 
2.11.0



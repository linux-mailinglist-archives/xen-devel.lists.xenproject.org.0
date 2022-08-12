Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0D59111A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 14:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385672.621351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUCR-0004dj-5u; Fri, 12 Aug 2022 12:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385672.621351; Fri, 12 Aug 2022 12:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUCR-0004bE-3L; Fri, 12 Aug 2022 12:55:39 +0000
Received: by outflank-mailman (input) for mailman id 385672;
 Fri, 12 Aug 2022 12:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hyho=YQ=citrix.com=prvs=2169cd8bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMUCP-0004b8-Ib
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 12:55:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cc9fe09-1a3e-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 14:55:35 +0200 (CEST)
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
X-Inumbo-ID: 0cc9fe09-1a3e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660308935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8JIf2CfYKdN68HIPrtR9xErp0XoCwk+IsT0juT9qucM=;
  b=IvOzn4dvA4yq5VNI5dZVJgbEKlgEcUgZ055s6JXK4Pysgto0GR9Zx0X5
   UsDHtdiwHGlr3oZBhB/8ByXeVSUiJ05dcSUrd1/RM1+xyOMQ3Y0IGaiIv
   doSXe2VFLt4sn7X4MihZ1S+vbaBxHoie8iGgIDazzySkYkJiQnlnn0986
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77956319
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1bjkK6khC+AuKImKTDJW4+Ho5gzuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbXm2Caa6DYzPxL4hzaIzn/UoAuJDTmIJlTlNl/nozRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2o4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2lnIdIl8PkqM1pp7
 MIgKgI3aEqh3Mi5lefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVmPFsNBY14t+CvnnTlKBVTqU6PpLpx6G/WpOB0+OeyYYeLIYXbLSlTtkKAn
 mTm7WPiOyhAE/GG6je81Gi+ueCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRqGSzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1p6vLkDmtZBouCnY8XS02dw1fwYLJr9Rm5v7QdeqPAJJZn/WsR2+om
 WDU/Hlj71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuscKYSX3PfUoM9vZ5yEWIU/IS7zYug38NIISMvCdiifelM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4nNEiT9xLvHr91+eJ6mUgDKZb7H8+TI+KPjeXDPxZ4iN4tbDOzUwzOxPzZ+VqPo
 ooOaKNnCXx3CYXDX8UeyqZLRXhiEJTxLcqeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:SPDNLq4NV1YFRMQlVAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.93,231,1654574400"; 
   d="scan'208";a="77956319"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] x86/build: Don't convert boot/{cmdline,head}.bin back to .S
Date: Fri, 12 Aug 2022 13:55:08 +0100
Message-ID: <20220812125508.26104-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414114708.4788-3-andrew.cooper3@citrix.com>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There's no point wasting time converting binaries back to asm source.  Just
use .incbin directly.  Explain in head.S what these binaries are.

Also, explicitly align the blobs.  They contain 4-byte objects, and happen to
be 4-byte aligned currently because of the position of `lret` and the size of
cmdline.S but this is incredibly fragile.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * Drop CFLAGS -iquote
---
 xen/arch/x86/boot/Makefile | 10 ++--------
 xen/arch/x86/boot/head.S   | 10 ++++++++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 1fb0ca02e87f..96beb420a260 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,10 +7,8 @@ targets += $(head-srcs:.S=.o)
 
 head-srcs := $(addprefix $(obj)/, $(head-srcs))
 
-ifdef building_out_of_srctree
-$(obj)/head.o: CFLAGS-y += -iquote $(obj)
-endif
-$(obj)/head.o: $(head-srcs)
+$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
+$(obj)/head.o: $(head-srcs:.S=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -27,10 +25,6 @@ $(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
 
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



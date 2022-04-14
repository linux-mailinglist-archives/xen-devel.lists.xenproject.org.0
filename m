Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C2D500C5C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 13:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304647.519338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwZ-0001Cw-SR; Thu, 14 Apr 2022 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304647.519338; Thu, 14 Apr 2022 11:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwZ-00018Q-Ls; Thu, 14 Apr 2022 11:47:23 +0000
Received: by outflank-mailman (input) for mailman id 304647;
 Thu, 14 Apr 2022 11:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nexwY-0000HT-RA
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 11:47:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a45c59e1-bbe8-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 13:47:20 +0200 (CEST)
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
X-Inumbo-ID: a45c59e1-bbe8-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649936840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qQkIV3HBke5CTXRiQlZD/OE4VAVlxsLpbZwbQuQSMI=;
  b=etLfSynhN03yGbY9uIPgHJZQJ2puM2qnUmpcPmupTeQRyzxbciyNvsvj
   Yy3rqdMOPHHNSQggM2evJxgI1+WOnc/FvnhuzqKiz/b+mTUOCnCJMR+vn
   Oum8foclr3dir3M7TU17kTWK01yehk2OcZuzSC1pix1EDAgayjWsFfr2B
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68353100
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vODzhq1sn9LzIsIItPbD5dZxkn2cJEfYwER7XKvMYLTBsI5bpzVRn
 WQaXD+CM/zZNDSjc4xyPYzipEwBsZWHzt82TwY+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1E7peObjgJJ5bilcBNVhAIAhxVMapvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiOP
 JdCMGI3BPjGSxtwIAwoT7kYoMOXiXXuch9mhwLKtJNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4GrYx1iay6rPvzQu9Vm0NHi98Q9AhnZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJV8yR5xLpQZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBY5aJ5dJ2OyO
 xK7VeZtCHl7ZirCgUhfOdzZNijX5fK4SYSNug78M7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWO3CJqt9CcQpXdRDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:YdKSUaPGy+HEEcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68353100"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 2/3] x86/build: Don't convert boot/{cmdline,head}.bin back to .S
Date: Thu, 14 Apr 2022 12:47:07 +0100
Message-ID: <20220414114708.4788-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414114708.4788-1-andrew.cooper3@citrix.com>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There's no point wasting time converting binaries back to asm source.  Just
use .incbin directly.  Explain in head.S what these binaries are.

Also, align the blobs.  While there's very little static data in the blobs,
they should have at least 4 byte alignment.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

Cleanup to $(head-srcs) deferred to the subsequent patch to make the change
legible.
---
 xen/arch/x86/boot/Makefile |  9 ++++-----
 xen/arch/x86/boot/head.S   | 10 ++++++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 09d1f9f75394..294ac2418583 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,7 +7,10 @@ targets += $(head-srcs:.S=.o)
 
 head-srcs := $(addprefix $(obj)/, $(head-srcs))
 
-$(obj)/head.o: $(head-srcs)
+# For .incbin - add $(obj) to the include path and add the dependencies
+# manually as they're not included in .d
+$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
+$(obj)/head.o: $(head-srcs:.S=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -18,10 +21,6 @@ CFLAGS_x86_32 += -I$(srctree)/include
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



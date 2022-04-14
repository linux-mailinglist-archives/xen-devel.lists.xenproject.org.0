Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4E500C5A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 13:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304646.519333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwZ-000184-KE; Thu, 14 Apr 2022 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304646.519333; Thu, 14 Apr 2022 11:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwZ-00015R-By; Thu, 14 Apr 2022 11:47:23 +0000
Received: by outflank-mailman (input) for mailman id 304646;
 Thu, 14 Apr 2022 11:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nexwX-0000HT-R1
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 11:47:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35e2510-bbe8-11ec-8fbd-03012f2f19d4;
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
X-Inumbo-ID: a35e2510-bbe8-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649936840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0s1yCBflD3p2q66QNUN1vJ9nlrel+PCFiTRjaDEozt8=;
  b=T+WRhVlZtU0wpD4hPfsk4Vn9w23aA/V+riqBYqR/7Yas3c55iBHI3AGG
   +kw3RY1PWAV7zZNMGzLTF5Sw4pSIMY4vMb4jbtCu2JkASj7hRjra92VdS
   tCKuMp6n3Rm+6ZkQkRkZbOQ5Rfg6JAuF7DEvpI8FIi3loKy2cLxYNoGb+
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68829284
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0Ks8dq4J9j4PxqPoJoan2gxRtDTHchMFZxGqfqrLsTDasY5as4F+v
 mAbDG+Ob/yMZDPwLo9+YN+x9kkOu8TUz9RhQQpurHxgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSRYFsiNKjnsd4dXklBNRlaHrZA6Zv+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RJOWA+NkScC/FJEgsrDZgUp8K3ulXAQydHlF6vp/M6xXeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSySjRwaDRyC+jBmVUVxh5TP89st4SfGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWuoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LPhAzpJcvT/BFhuM1XQNmUCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmRvon95mNvAi92
 48Zb6NmPT0EC7agCsQWmKZORW03wY8TXMmo8J0GKrTeemKL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:xLfyg6OVQ0I0hcBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68829284"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 3/3] x86/build: Clean up boot/Makefile
Date: Thu, 14 Apr 2022 12:47:08 +0100
Message-ID: <20220414114708.4788-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414114708.4788-1-andrew.cooper3@citrix.com>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are no .S intermediate files, so rework in terms of head-bin-objs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

I'm slightly -1 on this, because

  head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))

is substantial obfuscation which I'd prefer to bin.

Anthony: Why does dropping the targets += line interfere with incremental
builds?  With it gone, *.bin are regenerated unconditionally, but I can't see
what would cause that, nor why the normal dependencies on head.o don't work.
---
 xen/arch/x86/boot/Makefile | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 294ac2418583..527f3e393037 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,16 +1,17 @@
 obj-bin-y += head.o
-head-srcs := cmdline.S reloc.S
 
-nocov-y += $(head-srcs:.S=.o)
-noubsan-y += $(head-srcs:.S=.o)
-targets += $(head-srcs:.S=.o)
+head-bin-objs := cmdline.o reloc.o
 
-head-srcs := $(addprefix $(obj)/, $(head-srcs))
+nocov-y += $(head-bin-objs)
+noubsan-y += $(head-bin-objs)
+targets += $(head-bin-objs)
+
+head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
 
 # For .incbin - add $(obj) to the include path and add the dependencies
 # manually as they're not included in .d
 $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
-$(obj)/head.o: $(head-srcs:.S=.bin)
+$(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -18,8 +19,8 @@ CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
 CFLAGS_x86_32 += -I$(srctree)/include
 
 # override for 32bit binaries
-$(head-srcs:.S=.o): CFLAGS_stack_boundary :=
-$(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+$(head-bin-objs): CFLAGS_stack_boundary :=
+$(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 
 %.bin: %.lnk
 	$(OBJCOPY) -j .text -O binary $< $@
@@ -27,4 +28,4 @@ $(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 %.lnk: %.o $(src)/build32.lds
 	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
 
-clean-files := cmdline.S reloc.S *.lnk *.bin
+clean-files := *.lnk *.bin
-- 
2.11.0



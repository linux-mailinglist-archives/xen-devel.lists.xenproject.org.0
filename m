Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340174C486F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279180.476792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI0-0007ZI-3s; Fri, 25 Feb 2022 15:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279180.476792; Fri, 25 Feb 2022 15:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHz-0007Wb-W0; Fri, 25 Feb 2022 15:13:47 +0000
Received: by outflank-mailman (input) for mailman id 279180;
 Fri, 25 Feb 2022 15:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcHy-0007Bf-43
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f32f10-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:44 +0100 (CET)
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
X-Inumbo-ID: 84f32f10-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5eg0u8Tr2A+J7E6dTFFsvBCkPDf1mtYo9cEvKklzXuc=;
  b=BkNN56BgxF87OvJE7Ndl5wNCbNfvTvUh0yRktHS3w7elYZc5uuEjsQqb
   n1WVQoENhFWshThtjewpnU22YPE87OV/LknyhaWI/3Bf7KXx5JgaadqdI
   XI9DEnzMJtY+VOOnSeys6NW9V9k3wXPbW6d18xtnk/9vutunT9sG7FYD2
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000277
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nYATfKPWRRNaTgDvrR2Jl8FynXyQoLVcMsEvi/4bfWQNrUog02dSz
 GRLX22EOfaKYGegKN9wPI7g9UJXsJHcyoRjGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 4p2sp+sZAETNYrVw89CThAHTAcuIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQK6GP
 5BGNlKDajztTTxENkgsEa4kkcGBolnkcSxcjWK88P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PL+l8v9nhnWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWWFkma9au5qwm5HjFOBjAfbHBba1satoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNs1shDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGN6bKMN8N4n9hIx5JFVdoBiN2ZDB00WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMocRPsEtKVffpHkGiausM4bFyhlEfUYXY
 8rzTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zb+Zr
 ingARYDkDISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:kUcsQ6s9ODr1zToVJZPIQ0Ow7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000277"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 05/29] tools/fuzz/libelf: rework makefile
Date: Fri, 25 Feb 2022 15:12:57 +0000
Message-ID: <20220225151321.44126-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rename ELF_LIB_OBJS to LIBELF_OBJS as to have the same name as in
libs/guest/.

Replace "-I" by "-iquote".

Remove the use of "vpath". It will not works when we will convert this
makefile to subdirmk. Instead, we create symlinks to the source files.

Since we are creating a new .gitignore for the links, also move the
existing entry to it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - create a per-directory .gitignore to add new entry and existing one

 tools/fuzz/libelf/Makefile   | 21 ++++++++++-----------
 .gitignore                   |  1 -
 tools/fuzz/libelf/.gitignore |  2 ++
 3 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 tools/fuzz/libelf/.gitignore

diff --git a/tools/fuzz/libelf/Makefile b/tools/fuzz/libelf/Makefile
index 9eb30ee40c..9211f75951 100644
--- a/tools/fuzz/libelf/Makefile
+++ b/tools/fuzz/libelf/Makefile
@@ -1,25 +1,24 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-# libelf fuzz target
-vpath %.c ../../../xen/common/libelf
-CFLAGS += -I../../../xen/common/libelf
-ELF_SRCS-y += libelf-tools.c libelf-loader.c libelf-dominfo.c
-ELF_LIB_OBJS := $(patsubst %.c,%.o,$(ELF_SRCS-y))
+LIBELF_OBJS := libelf-tools.o libelf-loader.o libelf-dominfo.o
 
-$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-
-$(ELF_LIB_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
+CFLAGS += -iquote ../../../xen/common/libelf
+$(LIBELF_OBJS): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
 
 libelf-fuzzer.o: CFLAGS += $(CFLAGS_xeninclude)
 
-libelf.a: libelf-fuzzer.o $(ELF_LIB_OBJS)
+$(LIBELF_OBJS:.o=.c): libelf-%.c: ../../../xen/common/libelf/libelf-%.c FORCE
+	ln -nsf $< $@
+
+libelf.a: libelf-fuzzer.o $(LIBELF_OBJS)
 	$(AR) rc $@ $^
 
 .PHONY: libelf-fuzzer-all
 libelf-fuzzer-all: libelf.a libelf-fuzzer.o
 
-afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(ELF_LIB_OBJS)
+afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(LIBELF_OBJS)
 	$(CC) $(CFLAGS) $^ -o $@
 
 # Common targets
@@ -31,7 +30,7 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.o .*.d *.a *-libelf-fuzzer
+	rm -f *.o .*.d *.a *-libelf-fuzzer $(LIBELF_OBJS:.o=.c)
 
 .PHONY: install
 install: all
diff --git a/.gitignore b/.gitignore
index 4e2a850f94..fb29d42342 100644
--- a/.gitignore
+++ b/.gitignore
@@ -194,7 +194,6 @@ tools/flask/utils/flask-loadpolicy
 tools/flask/utils/flask-setenforce
 tools/flask/utils/flask-set-bool
 tools/flask/utils/flask-label-pci
-tools/fuzz/libelf/afl-libelf-fuzzer
 tools/fuzz/x86_instruction_emulator/asm
 tools/fuzz/x86_instruction_emulator/afl-harness
 tools/fuzz/x86_instruction_emulator/afl-harness-cov
diff --git a/tools/fuzz/libelf/.gitignore b/tools/fuzz/libelf/.gitignore
new file mode 100644
index 0000000000..ed634214c9
--- /dev/null
+++ b/tools/fuzz/libelf/.gitignore
@@ -0,0 +1,2 @@
+/afl-libelf-fuzzer
+/libelf-*.c
-- 
Anthony PERARD



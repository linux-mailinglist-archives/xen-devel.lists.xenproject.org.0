Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC4590508
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384785.620272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMo-00041T-TC; Thu, 11 Aug 2022 16:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384785.620272; Thu, 11 Aug 2022 16:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMo-0003xh-NW; Thu, 11 Aug 2022 16:49:06 +0000
Received: by outflank-mailman (input) for mailman id 384785;
 Thu, 11 Aug 2022 16:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMm-0003Aq-T4
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81b25845-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:03 +0200 (CEST)
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
X-Inumbo-ID: 81b25845-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J/SLv4tpkZk1s80iDBxg+IpFakavr4UAIdUl4Zv0U+U=;
  b=iRSnFYAAMyzWhH5DZm2PxxqtfNpG4kDPzWFGzS1z7iCaYF0DKlqo5Xk3
   4naHTPgzgXmDNph1Y34VxOIQw/bUm42cSTXjHIGnI1CY4Kh5m1VgLHmcO
   2uomQPq2wcV4yEMQn71MUbB+xYPmktrhe3WaDtDwqCuiYSARpXLnS+QS1
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650092
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6r5dPaO5BQILab7vrR2Kl8FynXyQoLVcMsEvi/4bfWQNrUorhDACy
 DdMWz2AaP7ZNGH3eooiPNi09UsEucLSy9NiQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/va8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPe7vstIGgfM7c/oNhnH3AT/
 P5IJS0CO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeMklEpiOm3WDbTUt6zH9lEjnqXn
 Uff21vlXSBLJtajkSXQpxpAgceQxHimCer+DoaQ9ONugVCV7nweDlsRT1TTieKilke0VtZbK
 koV0ikjt64/8AqsVNaVdwK8iG6JuFgbQdU4O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBASFkufubQHSW+7OQsBu7Iy1TJmgHDQcGRwYY59jooKkokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vsR+i5bTgZwAPwV/pTny0swp7NIO4aNn9gbTE1sqsPLp1X3HY4
 iZcw5nBtblQZX2evHfTGbtQRdlF897AaWSB2gA3QvHN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9vy/D5g4lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EV/w/k2LvFrdAi+VDKsUCKYT7G/jGI+mPi+LCNBZ5t59cWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDX8UjyqZKdAhiBSVqWvjLRzl/LLHrzvxORD58UJc8ANoJJ+RYokiivruRo
 i3hBxQIlAOXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:lJ988K+KyqxXtxpLzi9uk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650092"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v4 03/32] tools/fuzz/x86_instruction_emulator: rework makefile
Date: Thu, 11 Aug 2022 17:48:16 +0100
Message-ID: <20220811164845.38083-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework dependencies of all objects. We don't need to add dependencies
for headers that $(CC) is capable of generating, we only need to
include $(DEPS_INCLUDE). Some dependencies are still needed so make
knows to generate symlinks for them.

We remove the use of "vpath" for cpuid.c. While it works fine for now,
when we will convert this makefile to subdirmk, vpath will not be
usable. Also, "-iquote" is now needed to build "cpuid.o".

Replace "-I." by "-iquote .", so it applies to double-quote includes
only.

Rather than checking if a symlink exist, always regenerate the
symlink. So if the source tree changed location, the symlink is
updated.

Since we are creating a new .gitignore for the symlink, also move the
entry to it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---

Notes:
    v4:
    - Use pattern rules to link sources from libx86 and from x86 emulator
      tests
    - fix rm of .*.d2 dependency files
    
    v2:
    - create a new per-directory .gitignore to add the new entry and existing ones

 tools/fuzz/x86_instruction_emulator/Makefile  | 35 +++++++++----------
 .gitignore                                    |  6 ----
 .../fuzz/x86_instruction_emulator/.gitignore  |  7 ++++
 3 files changed, 24 insertions(+), 24 deletions(-)
 create mode 100644 tools/fuzz/x86_instruction_emulator/.gitignore

diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 1a6dbf94e1..13aa238503 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -9,32 +9,29 @@ x86-insn-fuzz-all:
 endif
 
 # Add libx86 to the build
-vpath %.c $(XEN_ROOT)/xen/lib/x86
+%.c: $(XEN_ROOT)/xen/lib/x86/%.c FORCE
+	ln -nsf $< $@
 
-x86_emulate:
-	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
+x86_emulate: FORCE
+	ln -nsf $(XEN_ROOT)/xen/arch/x86/$@
 
 x86_emulate/%: x86_emulate ;
 
-x86-emulate.c x86-emulate.h wrappers.c: %:
-	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*
+%.c: $(XEN_ROOT)/tools/tests/x86_emulator/%.c FORCE
+	ln -nsf $< $@
+%.h: $(XEN_ROOT)/tools/tests/x86_emulator/%.h FORCE
+	ln -nsf $< $@
 
-CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -I.
+CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -iquote .
+cpuid.o: CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
 
 GCOV_FLAGS := --coverage
 %-cov.o: %.c
 	$(CC) -c $(CFLAGS) $(GCOV_FLAGS) $< -o $@
 
-x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
-                     x86-vendors.h x86-defns.h msr-index.h) \
-         $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
-                     cpuid.h cpuid-autogen.h)
-x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
-
-# x86-emulate.c will be implicit for both
-x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h)
-
-fuzz-emul.o fuzz-emulate-cov.o cpuid.o wrappers.o: $(x86_emulate.h)
+x86-emulate.h: x86_emulate/x86_emulate.h
+x86-emulate.o x86-emulate-cov.o: x86-emulate.h x86_emulate/x86_emulate.c
+fuzz-emul.o fuzz-emul-cov.o wrappers.o: x86-emulate.h
 
 x86-insn-fuzzer.a: fuzz-emul.o x86-emulate.o cpuid.o
 	$(AR) rc $@ $^
@@ -51,11 +48,11 @@ all: x86-insn-fuzz-all
 
 .PHONY: distclean
 distclean: clean
-	rm -f x86_emulate x86-emulate.c x86-emulate.h
+	rm -f x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: clean
 clean:
-	rm -f *.a *.o .*.d afl-harness afl-harness-cov *.gcda *.gcno *.gcov
+	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
 
 .PHONY: install
 install: all
@@ -67,3 +64,5 @@ afl: afl-harness
 
 .PHONY: afl-cov
 afl-cov: afl-harness-cov
+
+-include $(DEPS_INCLUDE)
diff --git a/.gitignore b/.gitignore
index ed7bd8bdc7..ff1d668489 100644
--- a/.gitignore
+++ b/.gitignore
@@ -195,12 +195,6 @@ tools/flask/utils/flask-loadpolicy
 tools/flask/utils/flask-setenforce
 tools/flask/utils/flask-set-bool
 tools/flask/utils/flask-label-pci
-tools/fuzz/x86_instruction_emulator/asm
-tools/fuzz/x86_instruction_emulator/afl-harness
-tools/fuzz/x86_instruction_emulator/afl-harness-cov
-tools/fuzz/x86_instruction_emulator/wrappers.c
-tools/fuzz/x86_instruction_emulator/x86_emulate
-tools/fuzz/x86_instruction_emulator/x86-emulate.[ch]
 tools/helpers/init-xenstore-domain
 tools/helpers/xen-init-dom0
 tools/hotplug/common/hotplugpath.sh
diff --git a/tools/fuzz/x86_instruction_emulator/.gitignore b/tools/fuzz/x86_instruction_emulator/.gitignore
new file mode 100644
index 0000000000..65c3cf9702
--- /dev/null
+++ b/tools/fuzz/x86_instruction_emulator/.gitignore
@@ -0,0 +1,7 @@
+/asm
+/afl-harness
+/afl-harness-cov
+/cpuid.c
+/wrappers.c
+/x86_emulate
+/x86-emulate.[ch]
-- 
Anthony PERARD



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F215559E0F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355607.583397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnc-0006NQ-QV; Fri, 24 Jun 2022 16:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355607.583397; Fri, 24 Jun 2022 16:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnc-0006JE-Iv; Fri, 24 Jun 2022 16:04:48 +0000
Received: by outflank-mailman (input) for mailman id 355607;
 Fri, 24 Jun 2022 16:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnb-0004qb-3R
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db7e901-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:46 +0200 (CEST)
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
X-Inumbo-ID: 5db7e901-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H6lNZDzSWqxu4KmA0eh73M+dV6/C4L+8X1rFIcfviuI=;
  b=byRBltptZh787kRD6crDvZ13r6JPwg6+bs5aadtzvlhMfWrkmK0HnyBD
   euLMmxEfLmc3rA7soH/MDF+e936/oVTUky6q61JHJfIZw8luYKnLhqo2D
   +Vhb9MXvExFTuyowUzZoyaMuKaYVIc4K2skvfzbQ9qYlHlKCrSvpup9Ew
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74208075
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eLfogag4YypOK+jahAu2T33DX161YhAKZh0ujC45NGQN5FlHY01je
 htvXG/Va/6PY2OjKNEnbIqwoE4Hv57Wnd8xTFA/rio0E3kb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVnR4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ0mea3DhdtHaRYCNHFiEoga9IDfLFHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmY1NESYPEAn1lE/VckAmsi2hyLGUzQH80vWgJoY0mLS9VkkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8pzz1OScIEjU4anUjHRcqxoXvn5k+p0eaJjp8K5JZnuEZCBmpn
 W3U9HNj3+pD5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSXyNf4uPN7pU5tCIU3c+TLNDKi8gj1mMvBMmPKvpnkyNSZ8IUi3+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TX8Go8pILKb/YfGKL2ggJUpfs/F/oQKQ994w9qwsC1
 i3VtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:WEOs36vjTnPFiW1lnemP18Vr7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74208075"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework makefile
Date: Fri, 24 Jun 2022 17:04:03 +0100
Message-ID: <20220624160422.53457-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
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
---

Notes:
    v2:
    - create a new per-directory .gitignore to add the new entry and existing ones

 tools/fuzz/x86_instruction_emulator/Makefile  | 32 ++++++++-----------
 .gitignore                                    |  6 ----
 .../fuzz/x86_instruction_emulator/.gitignore  |  7 ++++
 3 files changed, 21 insertions(+), 24 deletions(-)
 create mode 100644 tools/fuzz/x86_instruction_emulator/.gitignore

diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 1a6dbf94e1..f11437e6a2 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -8,33 +8,27 @@ else
 x86-insn-fuzz-all:
 endif
 
-# Add libx86 to the build
-vpath %.c $(XEN_ROOT)/xen/lib/x86
+cpuid.c: %: $(XEN_ROOT)/xen/lib/x86/% FORCE
+	ln -nsf $< $@
 
-x86_emulate:
-	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
+x86_emulate: FORCE
+	ln -nsf $(XEN_ROOT)/xen/arch/x86/$@
 
 x86_emulate/%: x86_emulate ;
 
-x86-emulate.c x86-emulate.h wrappers.c: %:
-	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*
+x86-emulate.c x86-emulate.h wrappers.c: %: $(XEN_ROOT)/tools/tests/x86_emulator/% FORCE
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
@@ -51,7 +45,7 @@ all: x86-insn-fuzz-all
 
 .PHONY: distclean
 distclean: clean
-	rm -f x86_emulate x86-emulate.c x86-emulate.h
+	rm -f x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: clean
 clean:
@@ -67,3 +61,5 @@ afl: afl-harness
 
 .PHONY: afl-cov
 afl-cov: afl-harness-cov
+
+-include $(DEPS_INCLUDE)
diff --git a/.gitignore b/.gitignore
index 6410dfbc72..8b6886f3fd 100644
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



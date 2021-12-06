Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3C46A27E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239553.415603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUb-0006K5-4K; Mon, 06 Dec 2021 17:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239553.415603; Mon, 06 Dec 2021 17:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUa-0006FE-RM; Mon, 06 Dec 2021 17:09:32 +0000
Received: by outflank-mailman (input) for mailman id 239553;
 Mon, 06 Dec 2021 17:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHP8-0005ti-TQ
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d14dfc1-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:53 +0100 (CET)
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
X-Inumbo-ID: 7d14dfc1-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fz7iB4/hMl48cBu22uue0tUZKrebFs2DyNDqcnDK2Iw=;
  b=ROxuHnGSlcrATfWsflv6fhHKkdpgAY4sXEMp0yo9UfA6xPu762IPO69V
   wE2nas5k2pr2q5tFe7gyHIb6xQkeuKTm8XQ96CW/bz5gc4BqDM4/DbHiK
   dbNHm6U8Yo4xjfmYUw5UQhOyAXZbEQnuwUBL/esgHGpu81zvwzaxV12Y9
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rirpVZty3j+bOOjV58EewuXvHGh72oMfFIzE1grCdfzyyFYMI0I0jfwqx1uVIrPgNyZsu4/GBn
 bDPg8yO86RRGlotZjf08VliKBcOa8+0ykg+tp0tPpW5mvcZ2Udcgm4lzilnDDs9HKtelc9dkvT
 +9qg5Rfg3/FrbE3IUd5rNnqx+bELznVHN/LEiIBRslWLovavcfRAIrTXYd/FfKMLqcpP3zPwez
 Yzjilyz6uyCODfBOSniUCc5In7jNYbDPIEY5Mmr3ijRckKuDS3l1//xTG77Ji9vk0C4MGyx4Fa
 Oj9cfJTMT1h7HwhIgB8pLFjn
X-SBRS: 5.1
X-MesageID: 59766481
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1pHFnKmo4M32J74P2aZkctfo5gwaIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeC23UbPaJYDD9L9gkOYXl9h8Av8fTytYyTVBtriEwRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NtmnJKfVA0mBZ3dqMoMVkllOhhlEKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeBO
 ZRFOWMHgBLoZydXBXEpVLwEo+7xgkb2axMb9kzOqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsRzhdaNsgpYkuSCYjz
 FOhkNbgBDgpu7qQIVqc6bW8vT60ITISL2IJeWkDVwRt3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhCYVrrs8kMQE7JWqzX7WhmKRj6HSYwFgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWF2QY3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5lzpUQDPY68PhwxUjaoSsIrHONg1HsxDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgnjOMH8GmlU75jur2iJuppVEtagHmggcRtvzsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfIeN6qbc9lKEsF
 JHouayoW5xyd9gOwBxFBbGVkWCoXE3DadumM3X3bT4hUYRnQgCVqNbochG2rHsFDzattNt4q
 Lqlj1uJTZ0GTgVkLcDXdPPwkA/h4SlDwLp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzRxIIH2TS4busGzPd+26vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfMkXeiCFZK7cpYoopz
 f145ZwT4g27zBErLsyHnmZf8GHVdi4MVKAut5c7Bo73i1V0lgEeMMKEUiKmsouSb9hsM1UxJ
 m7GjaXPsL1Q207efidhDnPKx+dc2cwDtR0iIIXu/LhVdg4pXsMK4SA=
IronPort-HdrOrdr: A9a23:tpesOqnjWiLHPUrUxexJ662u7cbpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766481"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 28/57] tools/fuzz/x86_instruction_emulator: rework makefile
Date: Mon, 6 Dec 2021 17:02:11 +0000
Message-ID: <20211206170241.13165-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore                                   |  1 +
 tools/fuzz/x86_instruction_emulator/Makefile | 32 +++++++++-----------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4267bb4dee..8fb74a4c94 100644
--- a/.gitignore
+++ b/.gitignore
@@ -201,6 +201,7 @@ tools/fuzz/libelf/libelf-*.c
 tools/fuzz/x86_instruction_emulator/asm
 tools/fuzz/x86_instruction_emulator/afl-harness
 tools/fuzz/x86_instruction_emulator/afl-harness-cov
+tools/fuzz/x86_instruction_emulator/cpuid.c
 tools/fuzz/x86_instruction_emulator/wrappers.c
 tools/fuzz/x86_instruction_emulator/x86_emulate
 tools/fuzz/x86_instruction_emulator/x86-emulate.[ch]
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
-- 
Anthony PERARD



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B134C4877
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279186.476848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI7-0000kG-I4; Fri, 25 Feb 2022 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279186.476848; Fri, 25 Feb 2022 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI7-0000XO-7n; Fri, 25 Feb 2022 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 279186;
 Fri, 25 Feb 2022 15:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI4-0007Bf-VI
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a2e6326-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:51 +0100 (CET)
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
X-Inumbo-ID: 8a2e6326-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UAbT4K/ao9ETM/4n/1jW37qwLD7c5IdIpzy2VsdfrxM=;
  b=a7iYnPM95J/FN6D9guuAKj5vCfZ1/0jMIgHLD2rv2aMHzPcLnCfffMWb
   CC2Jv+ALOY5ivLPB6XGsopJTLWuZB3g2/3WKlsiuBtwYTRY1mkXy2Yj7C
   SgJ8SjDUnQoOlX8oTrnP+5y3sP94vOqKMfT9IRCJ93BOgRaMEAiDIhLDV
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407531
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yuB00KnLwLkyxNy7HZLyCc3o5gyuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWT2APfyDYmb0LtBzYdjg9kxUvZbQm4VjT1Bt+Hg1RiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYdR0kB7zJkt4hfhh6TSVBNoFf+pvfLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNGY3M0mbOnWjPH9KKJ8umruWjEL9dnoBtGKrn5Zow0jMmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+Owm0eDjUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+otz6LKC0fF1MvZA1aSTQOz8DhhJk820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8Vwn9hO0yT6FWy13N2YDB04WirjUWW0C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFLYoHgyOBbIhziFfK0QfUcXY
 8bznSGEVytyNEia5GDuG7d1PUEDnEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARcJmAKi3iSccW1nqBlLMdvSYHq2llpjVQREALpi8yJ6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:v9zODa1cg82wlKRb0ZmrLgqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407531"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 06/29] tools/fuzz/x86_instruction_emulator: rework makefile
Date: Fri, 25 Feb 2022 15:12:58 +0000
Message-ID: <20220225151321.44126-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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
index fb29d42342..3da56594c5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -194,12 +194,6 @@ tools/flask/utils/flask-loadpolicy
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



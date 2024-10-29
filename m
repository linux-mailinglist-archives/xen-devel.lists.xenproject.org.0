Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6A9B46DD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827208.1241759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jU9-00072q-9Q; Tue, 29 Oct 2024 10:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827208.1241759; Tue, 29 Oct 2024 10:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jU9-0006vd-6Y; Tue, 29 Oct 2024 10:30:01 +0000
Received: by outflank-mailman (input) for mailman id 827208;
 Tue, 29 Oct 2024 10:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5jU7-0006t1-Ql
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:29:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc7cbeb6-95e0-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 11:29:54 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so932032266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:29:54 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbc7e8sm458495466b.31.2024.10.29.03.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:29:52 -0700 (PDT)
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
X-Inumbo-ID: bc7cbeb6-95e0-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjN2NiZWI2LTk1ZTAtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMTk3Nzk0LjEwNzkzMywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730197793; x=1730802593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2530RwEhxR4OVHfLP111aspcHFheFeR8Wqbyi70InQ=;
        b=e/ardDZJzePMEAWNvyodsJw0GkoC10gVy5bZ+tF6+Svrf4BzPlbNmkRTHWSzxZWru5
         9bvMW4u7b0Kjoksi84ty062uq89hM43OYy1FUezquwYXpnx85bjRV2HKe6g+DsfcBjo/
         DOzlgvoLG9/x8Wl2VmxCi0KxyZ/93DiaZWSLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197793; x=1730802593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2530RwEhxR4OVHfLP111aspcHFheFeR8Wqbyi70InQ=;
        b=tK5Q9FA9m+kvSQrDWKFU0pzcGbX4hHYRUuXXQJpDhPEIncF4+iLhdjMGdepIdrAUpv
         rMqN1teRtj5Qir5aJJUGkFxDS1YpMKUm6QtLcSGtMvEBxMbPhbwS0Qvh4hHDGQ09kwFK
         U8DKNpzn4R5ETc8taPQUekZomL+rWIWXzTcV4lxHXepGZs+EBQlAxFGvst+jwNbNfECb
         1RBF1LrHE1eh7vT0vqVRl0cYeXPSfc6EKyWIypdISdPVA6/ZbgK7HNa/5qUvryAn4giC
         gPHK2EXYRDGOnSQcFO1iAEifU7r4cPGI9R5mmAhWojbnXDhVFRDsM5Irf51X3jQZyX8y
         t95Q==
X-Gm-Message-State: AOJu0YxIyIlV05AXwsZFHTKvv1KomP+uv10HY1gFd7G6YmViBXhICzfq
	VeLpi2tq+2Jg7e684jIegK8LRnEZC2I2ZF1I6r7nR2z6rGmkWpAM9hQzTK13Puq2gyrQ2X0Csw6
	B
X-Google-Smtp-Source: AGHT+IGqi4IiyqKCrZfPAJf3ixUkVe0yePsJSJcdMsqaMwbT8Et/CClHACELk+CHHDyFz04og9VjIA==
X-Received: by 2002:a17:907:3182:b0:a9a:bbd1:aa5 with SMTP id a640c23a62f3a-a9e2b0167d0mr116366966b.31.1730197793050;
        Tue, 29 Oct 2024 03:29:53 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 1/5] x86/boot: Rework how 32bit C is linked/included for early boot
Date: Tue, 29 Oct 2024 10:29:38 +0000
Message-Id: <20241029102942.162912-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029102942.162912-1-frediano.ziglio@cloud.com>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now, the two functions which were really too complicated to write
in asm are compiled as 32bit PIC, linked to a blob and included
directly, using global asm() to arrange for them to have function semantics.

This is limiting and fragile; the use of data relocations will compile
fine but malfunction when used, creating hard-to-debug bugs.

Furthermore, we would like to increase the amount of C, to
deduplicate/unify Xen's boot logic, as well as making it easier to
follow.  Therefore, rework how the 32bit objects are included.

Link all 32bit objects together first.  This allows for sharing of logic
between translation units.  Use differential linking and explicit
imports/exports to confirm that we only have the expected relocations,
and write the object back out as an assembly file so it can be linked
again as if it were 64bit, to integrate with the rest of Xen.

This allows for the use of external references (e.g. access to global
variables) with reasonable assurance of doing so safely.

No functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v2:
- removed W^X limitation, allowing data;
- added some comments to python script;
- added extension to python script;
- added header to generated assembly code from python script;
- added starting symbol to generated assembly code from python script
  to make disassembly more clear;
- other minor style changes to python script.

Changes since v4:
- add build32.final.lds build32.other.lds to targets macro;
- place some comments over a rule, not inside;
- simplified linking and producing binary rule;
- renamed built_in_32 to built-in-32, coding style;
- fix minor indentation;
- put magic numbers in Makefile and propagate them;
- minor variable cleanups in Python script;
- add dependency to Python script.

Changes since v5:
- renamed "other" and "final" phases to "base" and "offset";
- use if_changed macro to generate built-in-32.S.

Changes since v6:
- update some indentation to make code more coherent;
- move some comments from commit message to code;
- rewrote commit message (Andrew Cooper);
- add missing file to .gitignore;
- rollback a change in section order.
---
 xen/arch/x86/boot/.gitignore                  |   6 +-
 xen/arch/x86/boot/Makefile                    |  66 +++++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  35 ++-
 xen/arch/x86/boot/cmdline.c                   |  12 -
 xen/arch/x86/boot/head.S                      |  12 -
 xen/arch/x86/boot/reloc.c                     |  14 --
 xen/tools/combine_two_binaries.py             | 220 ++++++++++++++++++
 7 files changed, 314 insertions(+), 51 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (66%)
 create mode 100755 xen/tools/combine_two_binaries.py

diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignore
index a379db7988..595cef6a2c 100644
--- a/xen/arch/x86/boot/.gitignore
+++ b/xen/arch/x86/boot/.gitignore
@@ -1,3 +1,5 @@
 /mkelf32
-/*.bin
-/*.lnk
+/build32.*.lds
+/built-in-32.*.bin
+/built-in-32.*.map
+/built-in-32.S
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 1199291d2b..230a99a1e5 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,4 +1,5 @@
 obj-bin-y += head.o
+obj-bin-y += built-in-32.o
 
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
@@ -9,9 +10,6 @@ targets   += $(obj32)
 
 obj32 := $(addprefix $(obj)/,$(obj32))
 
-$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
-$(obj)/head.o: $(obj32:.32.o=.bin)
-
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
@@ -25,14 +23,66 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 $(obj)/%.32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
 LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 
-%.bin: %.lnk
-	$(OBJCOPY) -j .text -O binary $< $@
+# The parameters below tweak the generated linker scripts:
+# - text_gap: padding between .text section external symbols and code.
+# - text_diff: address of the .text section.
+#
+# Note external symbols are only affected by text_diff, while internal symbols
+# are affected by both text_diff and text_gap.  Ensure the sum of gap and diff
+# is greater than 2^16 so that any 16bit relocations if present in the object
+# file turns into a build-time error.
+text_gap := 0x010200
+text_diff := 0x408020
+
+$(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
+$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
+$(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
+	$(call if_changed_dep,cpp_lds_S)
+
+targets += build32.offset.lds build32.base.lds
+
+# Generate a single 32bit object.
+#
+# Resolve any relocations resulting from references between the translation
+# units.  This ensures the same combined object file can be used to generate
+# multiple images with slightly different linker scripts.
+$(obj)/built-in-32.tmp.o: $(obj32)
+	$(LD32) -r -o $@ $^
+
+# Link bundle with a given layout and extract a binary from it.
+# The linker will allocate GOP and resolve symbols specified in the linker
+# script.
+# The conversion to binary avoids polluting global symbols not used externally;
+# also removes conflict with needed 64 bit GOP.
+# If possible we use --orphan-handling=error option to make sure we account
+# for all possible sections from C code.
+$(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
+	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
+	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
+	rm -f $(@:bin=o)
+
+quiet_cmd_combine = GEN     $@
+cmd_combine = \
+    $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
+              --gap       $(text_gap) \
+              --text-diff $(text_diff) \
+              --script    $(obj)/build32.offset.lds \
+              --bin1      $(obj)/built-in-32.base.bin \
+              --bin2      $(obj)/built-in-32.offset.bin \
+              --map       $(obj)/built-in-32.offset.map \
+              --exports   cmdline_parse_early,reloc \
+              --output    $@
+
+targets += built-in-32.S
 
-%.lnk: %.32.o $(src)/build32.lds
-	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
+# generate final object file combining and checking above binaries
+$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin \
+                      $(srctree)/tools/combine_two_binaries.py FORCE
+	$(call if_changed,combine)
 
-clean-files := *.lnk *.bin
+clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
similarity index 66%
rename from xen/arch/x86/boot/build32.lds
rename to xen/arch/x86/boot/build32.lds.S
index 56edaa727b..d1b9dc6689 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -15,12 +15,37 @@
  * with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-ENTRY(_start)
+#ifdef FINAL
+# undef GAP
+# define GAP 0
+# define MULT 0
+# define TEXT_START
+#else
+# define MULT 1
+# define TEXT_START TEXT_DIFF
+#endif
+#define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
+
+ENTRY(dummy_start)
 
 SECTIONS
 {
   /* Merge code and data into one section. */
-  .text : {
+  .text TEXT_START : {
+        /* Silence linker warning, we are not going to use it */
+        dummy_start = .;
+
+        /*
+         * Any symbols used should be declared below, this ensures which
+         * symbols are visible to the 32bit C boot code.
+         * With the exception of using external 32 bit function (maybe
+         * exported by head.S) they should point all to variables.
+         * Attention should be paid to pointers taking care of possible later
+         * relocation.
+         */
+        DECLARE_IMPORT(__base_relocs_start);
+        DECLARE_IMPORT(__base_relocs_end);
+        . = . + GAP;
         *(.text)
         *(.text.*)
         *(.data)
@@ -30,7 +55,11 @@ SECTIONS
         *(.bss)
         *(.bss.*)
   }
-
+  /DISCARD/ : {
+       *(.comment)
+       *(.comment.*)
+       *(.note.*)
+  }
   /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
   .got : {
         *(.got)
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc9241ede9..196c580e91 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -18,18 +18,6 @@
  * Linux kernel source (linux/lib/string.c).
  */
 
-/*
- * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - %eax      = &cmdline,
- *   - %edx      = &early_boot_opts.
- */
-asm (
-    "    .text                         \n"
-    "    .globl _start                 \n"
-    "_start:                           \n"
-    "    jmp  cmdline_parse_early      \n"
-    );
-
 #include <xen/compiler.h>
 #include <xen/kconfig.h>
 #include <xen/macros.h>
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index c4de1dfab5..e0776e3896 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -759,18 +759,6 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
-        /*
-         * cmdline and reloc are written in C, and linked to be 32bit PIC with
-         * entrypoints at 0 and using the fastcall convention.
-         */
-FUNC_LOCAL(cmdline_parse_early)
-        .incbin "cmdline.bin"
-END(cmdline_parse_early)
-
-FUNC_LOCAL(reloc)
-        .incbin "reloc.bin"
-END(reloc)
-
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 8c58affcd9..94b078d7b1 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -12,20 +12,6 @@
  *    Daniel Kiper <daniel.kiper@oracle.com>
  */
 
-/*
- * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - %eax       = MAGIC,
- *   - %edx       = INFORMATION_ADDRESS,
- *   - %ecx       = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
- *   - 0x04(%esp) = BOOT_VIDEO_INFO_ADDRESS.
- */
-asm (
-    "    .text                         \n"
-    "    .globl _start                 \n"
-    "_start:                           \n"
-    "    jmp  reloc                    \n"
-    );
-
 #include <xen/compiler.h>
 #include <xen/macros.h>
 #include <xen/types.h>
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
new file mode 100755
index 0000000000..447c0d3bdb
--- /dev/null
+++ b/xen/tools/combine_two_binaries.py
@@ -0,0 +1,220 @@
+#!/usr/bin/env python3
+
+from __future__ import print_function
+import argparse
+import functools
+import re
+import struct
+import sys
+
+parser = argparse.ArgumentParser(description='Generate assembly file to merge into other code.')
+auto_int = functools.update_wrapper(lambda x: int(x, 0), int) # allows hex
+parser.add_argument('--script', dest='script',
+                    required=True,
+                    help='Linker script for extracting symbols')
+parser.add_argument('--bin1', dest='bin1',
+                    required=True,
+                    help='First binary')
+parser.add_argument('--bin2', dest='bin2',
+                    required=True,
+                    help='Second binary')
+parser.add_argument('--gap', dest='gap',
+                    required=True,
+                    type=auto_int,
+                    help='Gap inserted at the start of code section')
+parser.add_argument('--text-diff', dest='text_diff',
+                    required=True,
+                    type=auto_int,
+                    help='Difference between code section start')
+parser.add_argument('--output', dest='output',
+                    help='Output file')
+parser.add_argument('--map', dest='mapfile',
+                    help='Map file to read for symbols to export')
+parser.add_argument('--exports', dest='exports',
+                    help='Symbols to export')
+parser.add_argument('--section-header', dest='section_header',
+                    default='.section .init.text, "ax", @progbits',
+                    help='Section header declaration')
+parser.add_argument('-v', '--verbose',
+                    action='store_true')
+args = parser.parse_args()
+
+gap = args.gap
+text_diff = args.text_diff
+
+# Parse linker script for external symbols to use.
+# Next regex matches expanded DECLARE_IMPORT lines in linker script.
+symbol_re = re.compile(r'\s+(\S+)\s*=\s*\.\s*\+\s*\((\d+)\s*\*\s*0\s*\)\s*;')
+symbols = {}
+lines = {}
+for line in open(args.script):
+    m = symbol_re.match(line)
+    if not m:
+        continue
+    (name, line_num) = (m.group(1), int(m.group(2)))
+    if line_num == 0:
+        raise Exception("Invalid line number found:\n\t" + line)
+    if line_num in symbols:
+        raise Exception("Symbol with this line already present:\n\t" + line)
+    if name in lines:
+        raise Exception("Symbol with this name already present:\n\t" + name)
+    symbols[line_num] = name
+    lines[name] = line_num
+
+exports = []
+if args.exports is not None:
+    exports = dict([(name, None) for name in args.exports.split(',')])
+
+# Parse mapfile, look for ther symbols we want to export.
+if args.mapfile is not None:
+    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
+    for line in open(args.mapfile):
+        m = symbol_re.match(line)
+        if not m or m.group(2) not in exports:
+            continue
+        addr = int(m.group(1), 16)
+        exports[m.group(2)] = addr
+for (name, addr) in exports.items():
+    if addr is None:
+        raise Exception("Required export symbols %s not found" % name)
+
+file1 = open(args.bin1, 'rb')
+file2 = open(args.bin2, 'rb')
+file1.seek(0, 2)
+size1 = file1.tell()
+file2.seek(0, 2)
+size2 = file2.tell()
+if size1 > size2:
+    file1, file2 = file2, file1
+    size1, size2 = size2, size1
+if size2 != size1 + gap:
+    raise Exception('File sizes do not match')
+del size2
+
+file1.seek(0, 0)
+data1 = file1.read(size1)
+del file1
+file2.seek(gap, 0)
+data2 = file2.read(size1)
+del file2
+
+max_line = max(symbols.keys())
+
+def to_int32(n):
+    '''Convert a number to signed 32 bit integer truncating if needed'''
+    mask = (1 << 32) - 1
+    h = 1 << 31
+    return (n & mask) ^ h - h
+
+i = 0
+references = {}
+internals = 0
+while i <= size1 - 4:
+    n1 = struct.unpack('<I', data1[i:i+4])[0]
+    n2 = struct.unpack('<I', data2[i:i+4])[0]
+    i += 1
+    # The two numbers are the same, no problems
+    if n1 == n2:
+        continue
+    # Try to understand why they are different
+    diff = to_int32(n1 - n2)
+    if diff == -gap: # this is an internal relocation
+        pos = i - 1
+        print("Internal relocation found at position %#x "
+              "n1=%#x n2=%#x diff=%#x" % (pos, n1, n2, diff),
+              file=sys.stderr)
+        i += 3
+        internals += 1
+        if internals >= 10:
+            break
+        continue
+    # This is a relative relocation to a symbol, accepted, code/data is
+    # relocatable.
+    if diff < gap and diff >= gap - max_line:
+        n = gap - diff
+        symbol = symbols.get(n)
+        # check we have a symbol
+        if symbol is None:
+            raise Exception("Cannot find symbol for line %d" % n)
+        pos = i - 1
+        if args.verbose:
+            print('Position %#x %d %s' % (pos, n, symbol), file=sys.stderr)
+        i += 3
+        references[pos] = symbol
+        continue
+    # First byte is the same, move to next byte
+    if diff & 0xff == 0 and i <= size1 - 4:
+       continue
+    # Probably a type of relocation we don't want or support
+    pos = i - 1
+    suggestion = ''
+    symbol = symbols.get(-diff - text_diff)
+    if symbol is not None:
+        suggestion = " Maybe %s is not defined as hidden?" % symbol
+    raise Exception("Unexpected difference found at %#x "
+                    "n1=%#x n2=%#x diff=%#x gap=%#x.%s" % \
+                    (pos, n1, n2, diff, gap, suggestion))
+if internals != 0:
+    raise Exception("Previous relocations found")
+
+def line_bytes(buf, out):
+    '''Output an assembly line with all bytes in "buf"'''
+    # Python 2 compatibility
+    if type(buf) == str:
+        print("\t.byte " + ','.join([str(ord(c)) for c in buf]), file=out)
+    else:
+        print("\t.byte " + ','.join([str(n) for n in buf]), file=out)
+
+def part(start, end, out):
+    '''Output bytes of "data" from "start" to "end"'''
+    while start < end:
+        e = min(start + 16, end)
+        line_bytes(data1[start:e], out)
+        start = e
+
+def reference(pos, out):
+    name = references[pos]
+    n = struct.unpack('<I', data1[pos:pos+4])[0]
+    sign = '+'
+    if n >= (1 << 31):
+        n -= (1 << 32)
+    n += pos
+    if n < 0:
+        n = -n
+        sign = '-'
+    print("\t.hidden %s\n"
+          "\t.long %s %s %#x - ." % (name, name, sign, n),
+          file=out)
+
+def output(out):
+    prev = 0
+    exports_by_addr = {}
+    for (sym, addr) in exports.items():
+        exports_by_addr.setdefault(addr, []).append(sym)
+    positions = list(references.keys())
+    positions += list(exports_by_addr.keys())
+    for pos in sorted(positions):
+        part(prev, pos, out)
+        prev = pos
+        if pos in references:
+            reference(pos, out)
+            prev = pos + 4
+        if pos in exports_by_addr:
+            for sym in exports_by_addr[pos]:
+                print("\t.global %s\n"
+                      "\t.hidden %s\n"
+                      "%s:" % (sym, sym, sym),
+                      file=out)
+    part(prev, size1, out)
+
+out = sys.stdout
+if args.output is not None:
+    out = open(args.output, 'w')
+print('''/*
+ * File autogenerated by combine_two_binaries.py DO NOT EDIT
+ */''', file=out)
+print('\t' + args.section_header, file=out)
+print('obj32_start:', file=out)
+output(out)
+print('\n\t.section .note.GNU-stack,"",@progbits', file=out)
+out.flush()
-- 
2.34.1



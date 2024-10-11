Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD09999F59
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816776.1230891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBON-0001zW-JS; Fri, 11 Oct 2024 08:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816776.1230891; Fri, 11 Oct 2024 08:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBON-0001sK-G8; Fri, 11 Oct 2024 08:52:59 +0000
Received: by outflank-mailman (input) for mailman id 816776;
 Fri, 11 Oct 2024 08:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBOM-0001pc-7t
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:52:58 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35f3fee5-87ae-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:52:57 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5398b589032so3082989e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:52:57 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:55 -0700 (PDT)
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
X-Inumbo-ID: 35f3fee5-87ae-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636776; x=1729241576; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kevqHPlOngQuOmstH4bxiNiM3x5PtCpRDsAd+HUlWeY=;
        b=IcyCYIL0aFqEbryKqeHXG/li/H8DW0KUKOScao7/GDY0dYovOhYMgeme3QEqJho683
         5gl6X+5/IvCJ6TwTgUlzlT+W4QpZzsb3MgaXX/B9fG38FO01t9+LUUiQyuaAaxeqDlI/
         BywahSqVrlBSR/aU5+y+HTO9BFTrvAsTkyGK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636776; x=1729241576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kevqHPlOngQuOmstH4bxiNiM3x5PtCpRDsAd+HUlWeY=;
        b=CAjpEsYr4UcSxvU8Alc/FcRkW9jbHgTfxM2m16e2c6dvLy8v4vsu6tbSGQiZU3RM9E
         kf9Hnb6iA8WaBJBqrsKV7KewmoJYoiQb1WrK0IImZ5SMdbAUghVn/ejewKtQ9qeZT5Z1
         Yadw0K4KJrdkZytCTMJeyENvRLl6mY05twTO0b8yJ55y/4f85WCIwirZeY95/P3ezr6H
         Dklljovuis6/AbOX/eYcJIFkL3I1yU2x48+iBEK+hZER3DzPdfBxsLd3sunBWLeTEuwD
         iRqqy7g4f9FXcB67EkLvR/yqQgeKZs/3SepUsD1sNdEP+mbbFu804UUPRCZnl/8gIJVb
         QfIQ==
X-Gm-Message-State: AOJu0YzBTD0/bH5Oer7yJCuQg2Td5a/H+ejQdRtQFqKBulEpx71gyI4j
	JZdWxJr8GlgN4V+rZO4QBrn+0PWzhT5pgxekA5cnn2sqjr66/cKx68J1qNMVij1i2Lws40ZN70/
	9
X-Google-Smtp-Source: AGHT+IEyrRg/HCEajzOUUpGzIiNFdhvAgIdLhgp7IEdHP832Xej2NWnC5GKZHjbm6xOcH3/7EH3EQA==
X-Received: by 2002:a05:6512:3196:b0:539:a353:279b with SMTP id 2adb3069b0e04-539da3b1ec8mr1321973e87.9.1728636776162;
        Fri, 11 Oct 2024 01:52:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/5] x86/boot: create a C bundle for 32 bit boot code and use it
Date: Fri, 11 Oct 2024 09:52:40 +0100
Message-Id: <20241011085244.432368-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011085244.432368-1-frediano.ziglio@cloud.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current method to include 32 bit C boot code is:
- compile each function we want to use into a separate object file;
- each function is compiled with -fpic option;
- convert these object files to binary files. This operation removes GOP
  which we don't want in the executable;
- a small assembly part in each file add the entry point;
- code can't have external references, all possible variables are passed
  by value or pointer;
- include these binary files in head.S.

There are currently some limitations:
- code is compiled separately, it's not possible to share a function
  (like memcpy) between different functions to use;
- although code is compiled with -fpic there's no certainty there are
  no relocations, specifically data ones. This can lead into hard to
  find bugs;
- it's hard to add a simple function;
- having to pass external variables makes hard to do multiple things
  otherwise functions would require a lot of parameters so code would
  have to be split into multiple functions which is not easy;
- we generate a single text section containing data and code, not a
  problem at the moment but if we want to add W^X protection it's
  not helpful.

Current change extends the current process:
- all object files are linked together before getting converted making
  possible to share code between the function we want to call;
- a single object file is generated with all functions to use and
  exported symbols to easily call;
- variables to use are declared in linker script and easily used inside
  C code. Declaring them manually could be annoying but makes also
  easier to check them. Using external pointers can be still an issue if
  they are not fixed. If an external symbol is not declared this gives a
  link error;
- linker script put data (bss and data) into a separate section and
  check that that section is empty making sure code is W^X compatible;

Some details of the implementation:
- C code is compiled with -fpic flags (as before);
- object files from C code are linked together;
- the single bundled object file is linked with 2 slightly different
  script files to generate 2 bundled object files;
- the 2 bundled object files are converted to binary removing the need
  for global offset tables;
- a Python script is used to generate assembly source from the 2
  binaries;
- the single assembly file is compiled to generate final bundled object
  file;
- to detect possible unwanted relocation in data/code code is generated
  with different addresses. This is enforced starting .text section at
  different positions and adding a fixed "gap" at the beginning.
  This makes sure code and data is position independent;
- to detect used symbols in data/code symbols are placed in .text
  section at different offsets (based on the line in the linker script).
  This is needed as potentially a reference to a symbol is converted to
  a reference to the containing section so multiple symbols could be
  converted to reference to same symbol (section name) and we need to
  distinguish them;
- to avoid relocations
- --orphan-handling=error option to linker is used to make sure we
  account for all possible sections from C code;

Current limitations:
- the main one is the lack of support for 64 bit code. It would make
  sure that even the code used for 64 bit (at the moment EFI code) is
  code and data position independent. We cannot assume that code that
  came from code compiled for 32 bit and compiled for 64 bit is code and
  data position independent, different compiler options lead to
  different code/data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- separate lines adding files in Makefile;
- remove unneeded "#undef ENTRY" in build32.lds.S;
- print some information from combine_two_binaries only passing --verbose;
- detect --orphan-handling=error option dynamically;
- define and use a LD32;
- more intermediate targets to build more in parallel;
- use obj32 in Makefile to keep list of 32 bit object files;
- 32 bit object files are now named XXX.32.o;
- rename "cbundle" to "built_in_32".
---
 xen/arch/x86/boot/.gitignore                  |   5 +-
 xen/arch/x86/boot/Makefile                    |  58 +++--
 .../x86/boot/{build32.lds => build32.lds.S}   |  43 +++-
 xen/arch/x86/boot/cmdline.c                   |  12 --
 xen/arch/x86/boot/head.S                      |  12 --
 xen/arch/x86/boot/reloc.c                     |  14 --
 xen/tools/combine_two_binaries                | 198 ++++++++++++++++++
 7 files changed, 283 insertions(+), 59 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (63%)
 create mode 100755 xen/tools/combine_two_binaries

diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignore
index a379db7988..ebad650e5c 100644
--- a/xen/arch/x86/boot/.gitignore
+++ b/xen/arch/x86/boot/.gitignore
@@ -1,3 +1,4 @@
 /mkelf32
-/*.bin
-/*.lnk
+/build32.*.lds
+/built_in_32.*.bin
+/built_in_32.*.map
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ff0f965876..4cf0d7e140 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,15 +1,18 @@
+obj32 := cmdline.o
+obj32 += reloc.o
+
 obj-bin-y += head.o
+obj-bin-y += built_in_32.o
 
-head-bin-objs := cmdline.o reloc.o
+obj32 := $(patsubst %.o,%.32.o,$(obj32))
 
-nocov-y   += $(head-bin-objs)
-noubsan-y += $(head-bin-objs)
-targets   += $(head-bin-objs)
+nocov-y   += $(obj32)
+noubsan-y += $(obj32)
+targets   += $(obj32)
 
-head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
+obj32 := $(addprefix $(obj)/,$(obj32))
 
 $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
-$(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -17,17 +20,46 @@ CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
 CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
+LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
+
 # override for 32bit binaries
-$(head-bin-objs): CFLAGS_stack_boundary :=
-$(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+$(obj32): CFLAGS_stack_boundary :=
+$(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
 
-%.bin: %.lnk
-	$(OBJCOPY) -j .text -O binary $< $@
+$(obj)/%.32.o: $(src)/%.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/build32.final.lds: AFLAGS-y += -DFINAL
+$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.S
+	$(call if_changed_dep,cpp_lds_S)
+
+orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
+
+# link all object files together
+$(obj)/built_in_32.tmp.o: $(obj32)
+	$(LD32) -r -o $@ $(obj32)
+
+$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.tmp.o
+## link bundle with a given layout
+	$(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
+## extract binaries from object
+	$(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
+	rm -f $(obj)/built_in_32.$(*F).o
 
-%.lnk: %.o $(src)/build32.lds
-	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
+# generate final object file combining and checking above binaries
+$(obj)/built_in_32.o: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
+	$(PYTHON) $(srctree)/tools/combine_two_binaries \
+		--script $(obj)/build32.final.lds \
+		--bin1 $(obj)/built_in_32.other.bin --bin2 $(obj)/built_in_32.final.bin \
+		--map $(obj)/built_in_32.final.map \
+		--exports cmdline_parse_early,reloc \
+		--section-header '.section .init.text, "ax", @progbits' \
+		--output $(obj)/built_in_32.s
+	$(CC) -c $(obj)/built_in_32.s -o $@.tmp
+	rm -f $(obj)/built_in_32.s $@
+	mv $@.tmp $@
 
-clean-files := *.lnk *.bin
+clean-files := built_in_32.*.bin built_in_32.*.map build32.*.lds
diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
similarity index 63%
rename from xen/arch/x86/boot/build32.lds
rename to xen/arch/x86/boot/build32.lds.S
index 56edaa727b..72a4c5c614 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -15,22 +15,52 @@
  * with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-ENTRY(_start)
+#ifdef FINAL
+# define GAP 0
+# define MULT 0
+# define TEXT_START
+#else
+# define GAP 0x010200
+# define MULT 1
+# define TEXT_START 0x408020
+#endif
+# define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
+
+ENTRY(dummy_start)
 
 SECTIONS
 {
-  /* Merge code and data into one section. */
-  .text : {
+  /* Merge code and read-only data into one section. */
+  .text TEXT_START : {
+        /* Silence linker warning, we are not going to use it */
+        dummy_start = .;
+
+        /* Declare below any symbol name needed.
+         * Each symbol should be on its own line.
+         * It looks like a tedious work but we make sure the things we use.
+         * Potentially they should be all variables. */
+        DECLARE_IMPORT(__base_relocs_start);
+        DECLARE_IMPORT(__base_relocs_end);
+        . = . + GAP;
         *(.text)
         *(.text.*)
-        *(.data)
-        *(.data.*)
         *(.rodata)
         *(.rodata.*)
+  }
+
+  /* Writeable data sections. Check empty.
+   * We collapse all into code section and we don't want it to be writeable. */
+  .data : {
+        *(.data)
+        *(.data.*)
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
@@ -64,3 +94,4 @@ ASSERT(SIZEOF(.igot.plt) == 0,    ".igot.plt non-empty")
 ASSERT(SIZEOF(.iplt) == 0,        ".iplt non-empty")
 ASSERT(SIZEOF(.plt) == 0,         ".plt non-empty")
 ASSERT(SIZEOF(.rel) == 0,         "leftover relocations")
+ASSERT(SIZEOF(.data) == 0,        "we don't want data")
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
diff --git a/xen/tools/combine_two_binaries b/xen/tools/combine_two_binaries
new file mode 100755
index 0000000000..ea2d6ddc4e
--- /dev/null
+++ b/xen/tools/combine_two_binaries
@@ -0,0 +1,198 @@
+#!/usr/bin/env python3
+
+from __future__ import print_function
+import argparse
+import re
+import struct
+import sys
+
+parser = argparse.ArgumentParser(description='Generate assembly file to merge into other code.')
+parser.add_argument('--script', dest='script',
+                    required=True,
+                    help='Linker script for extracting symbols')
+parser.add_argument('--bin1', dest='bin1',
+                    required=True,
+                    help='First binary')
+parser.add_argument('--bin2', dest='bin2',
+                    required=True,
+                    help='Second binary')
+parser.add_argument('--output', dest='output',
+                    help='Output file')
+parser.add_argument('--map', dest='mapfile',
+                    help='Map file to read for symbols to export')
+parser.add_argument('--exports', dest='exports',
+                    help='Symbols to export')
+parser.add_argument('--section-header', dest='section_header',
+                    default='.text',
+                    help='Section header declaration')
+parser.add_argument('-v', '--verbose',
+                    action='store_true')
+args = parser.parse_args()
+
+gap = 0x010200
+text_diff = 0x408020
+
+# Parse linker script for external symbols to use.
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
+
+file1.seek(0, 0)
+data1 = file1.read(size1)
+file2.seek(gap, 0)
+data2 = file2.read(size1)
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
+        print(("Internal relocation found at position %#x "
+               "n1=%#x n2=%#x diff=%#x") % (pos, n1, n2, diff),
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
+    raise Exception(("Unexpected difference found at %#x "
+                     "n1=%#x n2=%#x diff=%#x gap=%#x.%s") % \
+                     (pos, n1, n2, diff, gap, suggestion))
+if internals != 0:
+    raise Exception("Previous relocations found")
+
+def line_bytes(buf, out):
+    '''Output an assembly line with all bytes in "buf"'''
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
+    print("\t.hidden %s\n\t.long %s %s %#x - ." % (name, name, sign, n),
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
+                print("\t.global %s\n\t.hidden %s\n%s:" % (sym, sym, sym),
+                      file=out)
+    part(prev, size1, out)
+
+out = sys.stdout
+if args.output is not None:
+    out = open(args.output, 'w')
+print('\t' + args.section_header, file=out)
+output(out)
+print('\n\t.section\t.note.GNU-stack,"",@progbits', file=out)
+out.flush()
-- 
2.34.1



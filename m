Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7996C16F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790438.1200197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001PF-I5; Wed, 04 Sep 2024 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790438.1200197; Wed, 04 Sep 2024 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001Ke-CD; Wed, 04 Sep 2024 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 790438;
 Wed, 04 Sep 2024 14:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRQ-0001Be-K0
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:04 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f22c8885-6acd-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 16:57:03 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f3edb2d908so22911411fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:03 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:02 -0700 (PDT)
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
X-Inumbo-ID: f22c8885-6acd-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461823; x=1726066623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhuenP36n8TMCf74RJXF7g3MJ6TuGNcropEsMnWR+Rk=;
        b=OghulXcBnAsCCzGu3dlqy7nClgnDfB7Q/pwBufg3z97Wdrq4e0c/D8PBvb1HdiZkdd
         lwOtjhUD0hJr67pHdw5vPKPbA6tSVHLNEfYaIlFUNqAlw9p54/4nkROCmztuDgwtUdF6
         MYj1/xDZK41umc8kNKu1qMPJQmL1hf9w0vWlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461823; x=1726066623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhuenP36n8TMCf74RJXF7g3MJ6TuGNcropEsMnWR+Rk=;
        b=m1QL9FH5H6me9Bstbn7YUhzyCeM/DSdgZGU1sVtCNcBy16EnOgQaLkSeZnknEz4k40
         npBLlJSous9hB3qesVxx1ycFut7Hq7O6xYYcR5kBdFU0BL3FD4N8gMmc4FbB6fKgxiqN
         7H1jCXBKnIov0+hrID0JBqnsBOR2VVg/glc0PpG03QfX1m2Kyc8XtnedlnPU0zQ4gWUD
         LoEkgC9Qlw96qb1HdSV5+4R6nQ9yNcpea+dVi0r3AMqDsleFzcOaBJ4lU45GobVUmv9i
         +Y21++Z+1I+CG3oJrGNa6dkhK2cU1SmVU0T8FotxLkB9pLibO7+j45OfvKxY/XKmgBCd
         UEMg==
X-Gm-Message-State: AOJu0YwEcAnQKqLjjIGoAeqSbj0PqUpPvFN2jtd7aW0scX/L+phUFeyi
	cztF8M8w/ujrjZvuC86RbiDdjniFD/vaURYxoN0dI969K7i5IjOqGvCJVTT50CckWTJyp+WoUQH
	K
X-Google-Smtp-Source: AGHT+IE/ZGUZ8ql2kd9pUeMGocx9V4rXrh5/OY7MrGom8aGtdFt0XR3t6lelnO/LleaOkNqgZ1FhBA==
X-Received: by 2002:a2e:bc09:0:b0:2ef:2c91:502a with SMTP id 38308e7fff4ca-2f6443faf63mr62366771fa.3.1725461822493;
        Wed, 04 Sep 2024 07:57:02 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 2/5] x86/boot: create a C bundle for 32 bit boot code and use it
Date: Wed,  4 Sep 2024 15:56:45 +0100
Message-ID: <20240904145648.33707-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
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
 .gitignore                                    |   3 +-
 xen/arch/x86/boot/Makefile                    |  28 ++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  46 ++++-
 xen/arch/x86/boot/cmdline.c                   |   7 -
 xen/arch/x86/boot/head.S                      |  12 --
 xen/arch/x86/boot/reloc.c                     |   7 -
 xen/tools/make_output                         | 177 ++++++++++++++++++
 7 files changed, 242 insertions(+), 38 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (62%)
 create mode 100755 xen/tools/make_output

diff --git a/.gitignore b/.gitignore
index d8b57e32f8..442f3272de 100644
--- a/.gitignore
+++ b/.gitignore
@@ -251,8 +251,7 @@ xen/System.map
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
 xen/arch/x86/boot/reloc.S
-xen/arch/x86/boot/*.bin
-xen/arch/x86/boot/*.lnk
+xen/arch/x86/boot/build32.*.lds
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 8f5bbff0cc..ed8d55866d 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,4 +1,4 @@
-obj-bin-y += head.o
+obj-bin-y += head.o cbundle.o
 
 head-bin-objs := cmdline.o reloc.o
 
@@ -9,7 +9,6 @@ targets   += $(head-bin-objs)
 head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
 
 $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
-$(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -24,10 +23,31 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
 
+$(obj)/build32.final.lds: AFLAGS-y += -DFINAL
+$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.S
+	$(call if_changed_dep,cpp_lds_S)
+
 %.bin: %.lnk
 	$(OBJCOPY) -j .text -O binary $< $@
 
-%.lnk: %.o $(src)/build32.lds
-	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
+$(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final.lds
+## link all object files together
+	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -r -o $(obj)/cbundle.tmp.o $(head-bin-objs)
+## link twice with 2 different layouts
+	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) --orphan-handling=error -N -T $(obj)/build32.other.lds -o $@.1.o $(obj)/cbundle.tmp.o
+	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) --orphan-handling=error -N -T $(obj)/build32.final.lds -Map $(obj)/cbundle.map -o $@.2.o $(obj)/cbundle.tmp.o
+## extract binaries from them
+	$(OBJCOPY) -j .text -O binary $@.1.o $@.1.bin
+	$(OBJCOPY) -j .text -O binary $@.2.o $@.2.bin
+## generate final assembly file combining and checking above binaries
+	$(PYTHON) $(srctree)/tools/make_output \
+		--script $(obj)/build32.final.lds \
+		--bin1 $@.1.bin --bin2 $@.2.bin \
+		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc \
+		--section-header '.section .init.text, "ax", @progbits' \
+		--output $(obj)/cbundle.s
+	$(CC) -c $(obj)/cbundle.s -o $@.tmp
+	rm -f $(obj)/cbundle.tmp.o $@.1.o $@.2.o $@.1.bin $@.2.bin $(obj)/cbundle.map $(obj)/cbundle.s $@
+	mv $@.tmp $@
 
 clean-files := *.lnk *.bin
diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
similarity index 62%
rename from xen/arch/x86/boot/build32.lds
rename to xen/arch/x86/boot/build32.lds.S
index 56edaa727b..87d2a589b5 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -15,22 +15,54 @@
  * with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-ENTRY(_start)
+#undef ENTRY
+
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
@@ -49,6 +81,7 @@ SECTIONS
   }
   .rel : {
         *(.rel.*)
+        *(.data.rel.*)
   }
 }
 
@@ -64,3 +97,4 @@ ASSERT(SIZEOF(.igot.plt) == 0,    ".igot.plt non-empty")
 ASSERT(SIZEOF(.iplt) == 0,        ".iplt non-empty")
 ASSERT(SIZEOF(.plt) == 0,         ".plt non-empty")
 ASSERT(SIZEOF(.rel) == 0,         "leftover relocations")
+ASSERT(SIZEOF(.data) == 0,        "we don't want data")
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc9241ede9..48062b21a0 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -23,13 +23,6 @@
  *   - %eax      = &cmdline,
  *   - %edx      = &early_boot_opts.
  */
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
index 12bbb97f33..791a1fee80 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -870,18 +870,6 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
-        /*
-         * cmdline and reloc are written in C, and linked to be 32bit PIC with
-         * entrypoints at 0 and using the fastcall convention.
-         */
-        ALIGN
-cmdline_parse_early:
-        .incbin "cmdline.bin"
-
-        ALIGN
-reloc:
-        .incbin "reloc.bin"
-
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index de8487483a..6652f9bde9 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -19,13 +19,6 @@
  *   - %ecx       = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
  *   - 0x04(%esp) = BOOT_VIDEO_INFO_ADDRESS.
  */
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
diff --git a/xen/tools/make_output b/xen/tools/make_output
new file mode 100755
index 0000000000..0644a4bf12
--- /dev/null
+++ b/xen/tools/make_output
@@ -0,0 +1,177 @@
+#!/usr/bin/env python3
+
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
+    l = int(m.group(2))
+    if l == 0:
+        raise Exception(f"Invalid line number found:\n\t{line}")
+    if l in symbols:
+        raise Exception(f"Symbol with this line already present:\n\t{line}")
+    symbols[l] = m.group(1)
+    lines[m.group(1)] = l
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
+        raise Exception(f"Required export symbols {name} not found")
+
+file1 = open(args.bin1, 'rb')
+file2 = open(args.bin2, 'rb')
+size1 = file1.seek(0, 2)
+size2 = file2.seek(0, 2)
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
+    diff = n1 - n2
+    if diff == -gap: # this is an internal relocation
+        pos = i - 1
+        print(f"Internal relocation found at position {pos:#x} "
+              f"n1={n1:#x} n2={n2:#x} diff={diff:#x}", file=sys.stderr)
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
+            raise Exception(f"Cannot find symbol for line {n}")
+        pos = i - 1
+        print(f'Position {pos:#x} {n} {symbol}', file=sys.stderr)
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
+        suggestion = f" Maybe {symbol} is not defined as hidden?"
+    raise Exception(f"Unexpected difference found at {i:#x} "
+                    f"n1={n1:#x} n2={n2:#x} diff={diff:#x}.{suggestion}")
+if internals != 0:
+    raise Exception("Previous relocations found")
+
+def line_bytes(buf, out):
+    '''Output an assembly line with all bytes in "buf"'''
+    print("\t.byte " + ','.join([str(n) for n in buf]), file=out)
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
+    print(f"\t.hidden {name}\n\t.long {name} {sign} {n:#x} - .", file=out)
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
+                print(f"\t.global {sym}\n\t.hidden {sym}\n{sym}:", file=out)
+    part(prev, size1, out)
+
+out = sys.stdout
+if args.output is not None:
+    out = open(args.output, 'w')
+print(f'\t{args.section_header}', file=out)
+output(out)
+print('\n\t.section\t.note.GNU-stack,"",@progbits', file=out)
+out.flush()
-- 
2.46.0



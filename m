Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE73986299
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804087.1215025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTir-0006SR-KS; Wed, 25 Sep 2024 15:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804087.1215025; Wed, 25 Sep 2024 15:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTir-0006Nk-6s; Wed, 25 Sep 2024 15:14:33 +0000
Received: by outflank-mailman (input) for mailman id 804087;
 Wed, 25 Sep 2024 15:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q3Mj=QX=flex--ardb.bounces.google.com=35yX0ZggKCUIevhf+kmxksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@srs-se1.protection.inumbo.net>)
 id 1stTWj-0002UM-Uw
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:01 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1de86146-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:01 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e21dcc7044so16139867b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:01 -0700 (PDT)
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
X-Inumbo-ID: 1de86146-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276520; x=1727881320; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DA1xJ7QlyinRe20ykWBw1TGfZPAZZ2L4ow9I41mAh9Y=;
        b=EAgo+G1Z183pDmglPxmorF/NimPCIqFsNkSpUKA40a0K3rR/4mQCz99X7iL3j1eoIn
         78dYWioNcmF9cWPf0oSoCCLQYGjQm8VE7O7qFuw98WumTY2bniqRbKJB7cYpoTaQHk/Z
         fD5kIv5sjMZjH5UznIbRIkxsLws8PrEL3FMHxg0B7jy72hs/fRgyRkFb1Lk12nqASLWh
         rTeBZLpHEkYjDOtjvot2uVVqgixrcNDjzeN+8ngev1drTVZFQktVJk66I3RG6IrFkSKI
         weaxK/xzgOSgOMU4x8gB9aVcR5iBYgHtJaXzijbNQm4r0hygV/T0lDi096zh7pNcG8Nn
         U1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276520; x=1727881320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DA1xJ7QlyinRe20ykWBw1TGfZPAZZ2L4ow9I41mAh9Y=;
        b=nfaDY7nyVfRBbDUvKOZiaV9Xbugy0lg069GmgRHuvRs6y1qBpA3/zcIh6zDAuG2D8v
         eJdO7+Vk2rJtRphxZ8mTTtU/MMfmjZ9r/V13zisAOxqYBAJsF9eLk37l9EjjOEvgFTmS
         /75s1+R+GHkM06QPPGXSnw5iJroya8om0Lixz020ZBV0UMs+XjxQQL84ecLBsbrv6ufI
         6WrIAJZhM1pTNZrqtur+uRyxgHcIRdNicCCqH6x1JPotHAIWpaEI5ECnEd3s+zvXGf2z
         Z6kXd605pdUO2oJM8bH4NK7u+fBTc2IiGyjhVL4BVm52H+WqC3wEsxL5++Gh1/ew3qZ2
         14UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEYpLFrGxVJatMXHZcRGZIAMBcQjZCD7STAw62bSZ/75shi6sIOqhBh7u3XqBuz705sVPHcO2fsiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz74eUUIcuKh/9tJS31EUBM3tRmlNdh2e9XLaz4bc8UWqio2Nst
	vkRCOkQOPieKq7D6NBwoNVfvQnQlnawDkrSmyOuS7quoKJl0v9EE/zdwgWGWfe2YwL4qZw==
X-Google-Smtp-Source: AGHT+IEVIf0RcL61TjfNJbSKcMrFRGT1L5gz2hG55UguzadiqCTtHCs2NniTQT5w6cgRQkWXw9cPp9k2
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a81:77c4:0:b0:61c:89a4:dd5f with SMTP id
 00721157ae682-6e21d0e8b05mr227547b3.0.1727276519796; Wed, 25 Sep 2024
 08:01:59 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:04 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=ardb@kernel.org;
 h=from:subject; bh=xSyMofrsI8W/QeJfcidSH2VUWxFZ3VEJOcPkUtiBlzY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6sYKk4m5xZLyVelenm+8zuTMnXPA0faQXMTl3XV33
 iYnS2/oKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMRz2b4p2z7TbK64+yiCfEm
 LE6n5/75udhiw87M0k896bfk2oo/BTL8U20uvRe5bfeVZc9kGMJfb1kvfTNqJu/W1Zs+sddu+hR pywYA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-34-ardb+git@google.com>
Subject: [RFC PATCH 04/28] x86/boot: Permit GOTPCREL relocations for x86_64 builds
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Some of the early x86_64 startup code is written in C, and executes in
the early 1:1 mapping of the kernel, which is not the address it was
linked at, and this requires special care when accessing global
variables. This is currently being dealt with on an ad-hoc basis,
primarily in head64.c, using explicit pointer fixups, but it would be
better to rely on the compiler for this, by using -fPIE to generate code
that can run at any address, and uses RIP-relative accesses to refer to
global variables.

While it is possible to avoid most GOT based symbol references that the
compiler typically emits when running in -fPIE mode, by using 'hidden'
visibility, there are cases where the compiler will always rely on the
GOT, for instance, for weak external references (which may remain
unsatisfied at link time).

This means the build may produce a small number of GOT entries
nonetheless. So update the reloc processing host tool to add support for
this, and place the GOT in the .text section rather than discard it.

Note that multiple GOT based references to the same symbol will share a
single GOT entry, and so naively emitting a relocation for the GOT entry
each time a reference to it is encountered could result in duplicates.
Work around this by relying on the fact that the relocation lists are
sorted, and deduplicate 64-bit relocations as they are emitted by
comparing each entry with the previous one.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile                 |  4 +++
 arch/x86/kernel/vmlinux.lds.S     |  5 +++
 arch/x86/tools/relocs.c           | 33 ++++++++++++++++++--
 include/asm-generic/vmlinux.lds.h |  7 +++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 801fd85c3ef6..6b3fe6e2aadd 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -192,6 +192,10 @@ else
         KBUILD_CFLAGS += -mcmodel=kernel
         KBUILD_RUSTFLAGS += -Cno-redzone=y
         KBUILD_RUSTFLAGS += -Ccode-model=kernel
+
+        # Don't emit relaxable GOTPCREL relocations
+        KBUILD_AFLAGS_KERNEL += -Wa,-mrelax-relocations=no
+        KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no
 endif
 
 #
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 6e73403e874f..7f060d873f75 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -20,6 +20,9 @@
 #define RUNTIME_DISCARD_EXIT
 #define EMITS_PT_NOTE
 #define RO_EXCEPTION_TABLE_ALIGN	16
+#ifdef CONFIG_X86_64
+#define GOT_IN_RODATA
+#endif
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
@@ -464,10 +467,12 @@ SECTIONS
 	 * Sections that should stay zero sized, which is safer to
 	 * explicitly check instead of blindly discarding.
 	 */
+#ifdef CONFIG_X86_32
 	.got : {
 		*(.got) *(.igot.*)
 	}
 	ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
+#endif
 
 	.plt : {
 		*(.plt) *(.plt.*) *(.iplt)
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 35a73e4aa74d..880f0f2e465e 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -223,6 +223,8 @@ static const char *rel_type(unsigned type)
 		REL_TYPE(R_X86_64_JUMP_SLOT),
 		REL_TYPE(R_X86_64_RELATIVE),
 		REL_TYPE(R_X86_64_GOTPCREL),
+		REL_TYPE(R_X86_64_GOTPCRELX),
+		REL_TYPE(R_X86_64_REX_GOTPCRELX),
 		REL_TYPE(R_X86_64_32),
 		REL_TYPE(R_X86_64_32S),
 		REL_TYPE(R_X86_64_16),
@@ -843,6 +845,7 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 	case R_X86_64_32:
 	case R_X86_64_32S:
 	case R_X86_64_64:
+	case R_X86_64_GOTPCREL:
 		/*
 		 * References to the percpu area don't need to be adjusted.
 		 */
@@ -861,6 +864,31 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 			break;
 		}
 
+		if (r_type == R_X86_64_GOTPCREL) {
+			Elf_Shdr *s = &secs[sec->shdr.sh_info].shdr;
+			unsigned file_off = offset - s->sh_addr + s->sh_offset;
+
+			/*
+			 * GOTPCREL relocations refer to instructions that load
+			 * a 64-bit address via a 32-bit relative reference to
+			 * the GOT.  In this case, it is the GOT entry that
+			 * needs to be fixed up, not the immediate offset in
+			 * the opcode. Note that the linker will have applied an
+			 * addend of -4 to compensate for the delta between the
+			 * relocation offset and the value of RIP when the
+			 * instruction executes, and this needs to be backed out
+			 * again. (Addends other than -4 are permitted in
+			 * principle, but make no sense in practice so they are
+			 * not supported.)
+                         */
+			if (rel->r_addend != -4) {
+				die("invalid addend (%ld) for %s relocation: %s\n",
+				    rel->r_addend, rel_type(r_type), symname);
+				break;
+			}
+			offset += 4 + (int32_t)get_unaligned_le32(elf_image + file_off);
+		}
+
 		/*
 		 * Relocation offsets for 64 bit kernels are output
 		 * as 32 bits and sign extended back to 64 bits when
@@ -870,7 +898,7 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 		if ((int32_t)offset != (int64_t)offset)
 			die("Relocation offset doesn't fit in 32 bits\n");
 
-		if (r_type == R_X86_64_64)
+		if (r_type == R_X86_64_64 || r_type == R_X86_64_GOTPCREL)
 			add_reloc(&relocs64, offset);
 		else
 			add_reloc(&relocs32, offset);
@@ -1085,7 +1113,8 @@ static void emit_relocs(int as_text, int use_real_mode)
 
 		/* Now print each relocation */
 		for (i = 0; i < relocs64.count; i++)
-			write_reloc(relocs64.offset[i], stdout);
+			if (!i || relocs64.offset[i] != relocs64.offset[i - 1])
+				write_reloc(relocs64.offset[i], stdout);
 
 		/* Print a stop */
 		write_reloc(0, stdout);
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 19ec49a9179b..cc14d780c70d 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -443,6 +443,12 @@
 #endif
 #endif
 
+#ifdef GOT_IN_RODATA
+#define GOT_RODATA	*(.got .igot*)
+#else
+#define GOT_RODATA
+#endif
+
 /*
  * Read only Data
  */
@@ -454,6 +460,7 @@
 		SCHED_DATA						\
 		RO_AFTER_INIT_DATA	/* Read only after init */	\
 		. = ALIGN(8);						\
+		GOT_RODATA						\
 		BOUNDED_SECTION_BY(__tracepoints_ptrs, ___tracepoints_ptrs) \
 		*(__tracepoints_strings)/* Tracepoints: strings */	\
 	}								\
-- 
2.46.0.792.g87dc391469-goog



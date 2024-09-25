Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC199862B0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804146.1215191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjC-0003BP-Dj; Wed, 25 Sep 2024 15:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804146.1215191; Wed, 25 Sep 2024 15:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjB-0002jU-1K; Wed, 25 Sep 2024 15:14:53 +0000
Received: by outflank-mailman (input) for mailman id 804146;
 Wed, 25 Sep 2024 15:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0Eo=QX=flex--ardb.bounces.google.com=3Iib0ZggKCX0bsec+hjuhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@srs-se1.protection.inumbo.net>)
 id 1stTXh-0002k3-Pt
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:03:01 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4104da09-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:03:00 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e035949cc4eso10636164276.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:03:00 -0700 (PDT)
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
X-Inumbo-ID: 4104da09-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276579; x=1727881379; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IM+8uvbpUOTrNblc27FtujIjdoMKE18YT3ThvhmVkQ=;
        b=dUs7glrTvZ59aTguuOWRGC/c2tRZgK/vPc3aJAyY23ld1w6qo2QJ6fT3V1+1VY+Tc3
         ZTbmFjGQ2HtlKCVoDxfJ3SfaHuF44ymcNbWHzHw3oHlBUNOyZPH6obiIFqH6lDXzPv3z
         dYIAjcSdqZ0RVdUXmVlsmZ8Ie3+x5ZowLOv3aceV5gDy3VpPVz/O5tlgsA5/TROVOaWd
         RDPceL7C3MHM+KYWYAO/1MhBiiDYs292rVIs/8qsIsqkjdBoYrFHj2DAfY87LhnZhRRq
         hXeoVLZv1x5Kb+ChW6MTBHP/YfoMCsmlMCj1y/F8ZTzH0RJoa3ytbTnoXe1cwint/TuJ
         1D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276579; x=1727881379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IM+8uvbpUOTrNblc27FtujIjdoMKE18YT3ThvhmVkQ=;
        b=npPwtDrh36a5CAuIieIt1cEEd5OgSSAbUUtuEnWi+o3Au5CKsZi6bOa5EdH961AetL
         644VJt+f7CJ3GiDQp7Dx1ulQH6NMZ0ZAUQ+GCLs12btx0ZfOBiMvBQgKYq40UUw0FweW
         1oKJQppt+dIGucR5/fxpK2q7l5O2GO8BNe1Ije3FmXGIK9PPD0wKpRDlSDesmGmfGNvI
         9UAwmwIxoFh8HpkGERKnE47YB3HimtJS/6hVIYOfdbbgGlYHPA/GcDEdks2azDlic6Ac
         mTBl2/ZvuBMjFHpTGM+CNZNQVOZRSTbzXiriFffsJanLUZ59NFijAbcYzrIbXtpksmTS
         iNkw==
X-Forwarded-Encrypted: i=1; AJvYcCWSYx+XCxpiwCFf+BMxWENjwfm8Y72Z2mVMdXgESK8wgNNTTXLy946rB/KQzBP08Dt5ERFSyzj8j9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJmQlAIBQzPrrVfruucdjMUKf+DAEtRTemwfvHOnIU8BcBr2n/
	maMzVsQ6mqat70dTJBl5KWtA5nOjA6OU6Mhnp76WWzWTrO9EvBpMkqx9WTM/pAWaguwP2Q==
X-Google-Smtp-Source: AGHT+IHCtqA+oNLQfmXqpM//kOUUkVuRiayEu9UAQA8X933VnnJ2JGMGIKXjp5QscVvSLG685e3KtDKL
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:1782:b0:e0b:958a:3344 with SMTP id
 3f1490d57ef6-e24da39b0c3mr17940276.10.1727276578847; Wed, 25 Sep 2024
 08:02:58 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:27 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=ardb@kernel.org;
 h=from:subject; bh=Qfoxr/CYN1brA02vZLn1djUOVE7sfU2DhAxM/gB47SE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6qUIX51znF3nJyzZfmoB13+eT2d+37/IY95y8cys2
 5n+JYzJHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAifvYMv5jZZ0me+ya2VVnU
 Ozku0cJESLKOW+VHtMSKvW8vdx2dKMfIsJzzq0hJkqFDXdOunnmqwir812MtQuf0H13yi9n0fe8 DLgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-57-ardb+git@google.com>
Subject: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
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

Build the kernel as a Position Independent Executable (PIE). This
results in more efficient relocation processing for the virtual
displacement of the kernel (for KASLR). More importantly, it instructs
the linker to generate what is actually needed (a program that can be
moved around in memory before execution), which is better than having to
rely on the linker to create a position dependent binary that happens to
tolerate being moved around after poking it in exactly the right manner.

Note that this means that all codegen should be compatible with PIE,
including Rust objects, so this needs to switch to the small code model
with the PIE relocation model as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Kconfig                        |  2 +-
 arch/x86/Makefile                       | 11 +++++++----
 arch/x86/boot/compressed/misc.c         |  2 ++
 arch/x86/kernel/vmlinux.lds.S           |  5 +++++
 drivers/firmware/efi/libstub/x86-stub.c |  2 ++
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 54cb1f14218b..dbb4d284b0e1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2187,7 +2187,7 @@ config RANDOMIZE_BASE
 # Relocation on x86 needs some additional build support
 config X86_NEED_RELOCS
 	def_bool y
-	depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
+	depends on X86_32 && RELOCATABLE
 
 config PHYSICAL_ALIGN
 	hex "Alignment value to which kernel should be aligned"
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 83d20f402535..c1dcff444bc8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -206,9 +206,8 @@ else
                 PIE_CFLAGS-$(CONFIG_SMP) += -mstack-protector-guard-reg=gs
         endif
 
-        # Don't emit relaxable GOTPCREL relocations
-        KBUILD_AFLAGS_KERNEL += -Wa,-mrelax-relocations=no
-        KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no $(PIE_CFLAGS-y)
+        KBUILD_CFLAGS_KERNEL	+= $(PIE_CFLAGS-y)
+        KBUILD_RUSTFLAGS_KERNEL	+= -Ccode-model=small -Crelocation-model=pie
 endif
 
 #
@@ -264,12 +263,16 @@ else
 LDFLAGS_vmlinux :=
 endif
 
+ifdef CONFIG_X86_64
+ldflags-pie-$(CONFIG_LD_IS_LLD)	:= --apply-dynamic-relocs
+ldflags-pie-$(CONFIG_LD_IS_BFD)	:= -z call-nop=suffix-nop
+LDFLAGS_vmlinux			+= --pie -z text $(ldflags-pie-y)
+
 #
 # The 64-bit kernel must be aligned to 2MB.  Pass -z max-page-size=0x200000 to
 # the linker to force 2MB page size regardless of the default page size used
 # by the linker.
 #
-ifdef CONFIG_X86_64
 LDFLAGS_vmlinux += -z max-page-size=0x200000
 endif
 
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 89f01375cdb7..79e3ffe16f61 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -495,6 +495,8 @@ asmlinkage __visible void *extract_kernel(void *rmode, unsigned char *output)
 		error("Destination virtual address changed when not relocatable");
 #endif
 
+	boot_params_ptr->kaslr_va_shift = virt_addr - LOAD_PHYSICAL_ADDR;
+
 	debug_putstr("\nDecompressing Linux... ");
 
 	if (init_unaccepted_memory()) {
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index f7e832c2ac61..d172e6e8eaaf 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -459,6 +459,11 @@ xen_elfnote_phys32_entry_offset =
 
 	DISCARDS
 
+	/DISCARD/ : {
+		*(.dynsym .gnu.hash .hash .dynamic .dynstr)
+		*(.interp .dynbss .eh_frame .sframe)
+	}
+
 	/*
 	 * Make sure that the .got.plt is either completely empty or it
 	 * contains only the lazy dispatch entries.
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index f8e465da344d..5c03954924fe 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -912,6 +912,8 @@ static efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
 	if (status != EFI_SUCCESS)
 		return status;
 
+	boot_params_ptr->kaslr_va_shift = virt_addr - LOAD_PHYSICAL_ADDR;
+
 	entry = decompress_kernel((void *)addr, virt_addr, error);
 	if (entry == ULONG_MAX) {
 		efi_free(alloc_size, addr);
-- 
2.46.0.792.g87dc391469-goog



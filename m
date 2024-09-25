Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20DD9862A5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804112.1215128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj1-0000ln-Dp; Wed, 25 Sep 2024 15:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804112.1215128; Wed, 25 Sep 2024 15:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj0-0000Wi-9i; Wed, 25 Sep 2024 15:14:42 +0000
Received: by outflank-mailman (input) for mailman id 804112;
 Wed, 25 Sep 2024 15:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsEB=QX=flex--ardb.bounces.google.com=3Cyb0ZggKCWYEVHF+KMXKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@srs-se1.protection.inumbo.net>)
 id 1stTXK-0002k3-Iv
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:38 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 332c4c14-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:37 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e035949cc4eso10635671276.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:36 -0700 (PDT)
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
X-Inumbo-ID: 332c4c14-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276556; x=1727881356; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDR79FvO/p7pnSynPl14YMv6NBkHhQBDE9t/OHYGGd4=;
        b=3jY5ROt97/csoi0j6IG4ByWefC8x3qvetk7Jtk3IDESZm+YI4Fd6EffTOUrWVUld0s
         Br6Yn67O2P+c4MhA9IduyUaf24NhrZMjkbAfEJJAiVWZhmknGuRoTU1Of1rRJmLOiMDP
         rjQGBxjtHpKYryYy5mqUPcmKdT5ikEpOfZpyGopWfAzkcXFosRaKdcPSIWxfDsF/Aron
         Glo7YM/eGj0VLwcQBFnHdHbFVGHNgNaEWVLa5TQYWf7xq91ct1ndrXtVL7h4RLsn+XjI
         B28VJhQIIh2zRY+7QYwdr4eHTW+ZqUcsy/JWZaZsVwCjLkijBSaB1xpzw4ZCS9ERvVB9
         S46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276556; x=1727881356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDR79FvO/p7pnSynPl14YMv6NBkHhQBDE9t/OHYGGd4=;
        b=KKU8Vq51zD+sCRglfjCM8SEAkIToP/TgQAYv0HVwrsAN+bIwLiWZgwIYpH2MxlTm6N
         M7rq8dsDVjZijg+mGvtTR2bFRxhkMkbSozBudSLYVqILKVH832KwVIFN9KqJliz+7iME
         ve8ZOLqmPYj2y8ilIpQzKmLBABc5Nkre38C+P5vqZ1cKJ/uDxKM+fE0TtOA/IhHs0XeE
         G+Sh0/BfLhtQvESz7/F075NLJPolIvf71QbqY4WP/OWsRnDNK1XbgzPXijS5JPXwJIt5
         uxyg3fowdyskH97dmx3hcSGikQ3P73VrYrF2g48z1efxqenrZREKCV3ttDJyS/r75o+u
         QrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOeIq9LrobtJODcJEEkh3yV+crQh18cmUwKXzoRqlYzU831OPaMpib90YY2qzw5MQw95wq3EkfG3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+yskxyhmf1eAo3mFo5/70LWUxC3FauWtBVQDdjohnIZqwngcJ
	M82cW3fFpNS6PBQtiR31/Rz97ydq6TnlWqj7EwYK91S6Yq8ruu2GfLj1DL6ER1m0BOntHQ==
X-Google-Smtp-Source: AGHT+IHZ4KYfHMEhV3OEcung24V1cc8XfcFAbHD7O3r+Hgg2lidAI5AomtBdq038iHk4HR3+YtV8+eXL
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:ec8:0:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e24d47abf13mr23895276.0.1727276555668; Wed, 25 Sep 2024 08:02:35
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:18 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4435; i=ardb@kernel.org;
 h=from:subject; bh=GHJcalcWc5Qb+zlhfpCjetJZ0xMQ4h6Eadch5mSu/kI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6tGDolHZO8I/hR3x3e/2aucUz1XW9pJNyVMcgt6LK
 d6perupo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkjgkjw6k/n413NQiwSlie
 DnVk14nq3/xeMf2gfMyRHcx1Ja3nuRj+h2Vr7vj9abJ2U31nzqv2/TMymqLWPwla++d7/1o/hhv mDAA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-48-ardb+git@google.com>
Subject: [RFC PATCH 18/28] x86/boot/64: Determine VA/PA offset before entering
 C code
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

Implicit absolute symbol references (e.g., taking the address of a
global variable) must be avoided in the C code that runs from the early
1:1 mapping of the kernel, given that this is a practice that violates
assumptions on the part of the toolchain. I.e., RIP-relative and
absolute references are expected to produce the same values, and so the
compiler is free to choose either. However, the code currently assumes
that RIP-relative references are never emitted here.

So an explicit virtual-to-physical offset needs to be used instead to
derive the kernel virtual addresses of _text and _end, instead of simply
taking the addresses and assuming that the compiler will not choose to
use a RIP-relative references in this particular case.

Currently, phys_base is already used to perform such calculations, but
it is derived from the kernel virtual address of _text, which is taken
using an implicit absolute symbol reference. So instead, derive this
VA-to-PA offset in asm code, using the kernel VA of common_startup_64
(which we already keep in a global variable for other reasons), and pass
it to the C startup code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/setup.h | 2 +-
 arch/x86/kernel/head64.c     | 8 +++++---
 arch/x86/kernel/head_64.S    | 9 ++++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 0667b2a88614..85f4fde3515c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -49,7 +49,7 @@ extern unsigned long saved_video_mode;
 
 extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
-extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp);
+extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
 extern void startup_64_setup_gdt_idt(void);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index d4398261ad81..de33ac34773c 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -138,12 +138,14 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
  * doesn't have to generate PC-relative relocations when accessing globals from
  * that function. Clang actually does not generate them, which leads to
  * boot-time crashes. To work around this problem, every global pointer must
- * be accessed using RIP_REL_REF().
+ * be accessed using RIP_REL_REF(). Kernel virtual addresses can be determined
+ * by subtracting p2v_offset from the RIP-relative address.
  */
-unsigned long __head __startup_64(unsigned long physaddr,
+unsigned long __head __startup_64(unsigned long p2v_offset,
 				  struct boot_params *bp)
 {
 	pmd_t (*early_pgts)[PTRS_PER_PMD] = RIP_REL_REF(early_dynamic_pgts);
+	unsigned long physaddr = (unsigned long)&RIP_REL_REF(_text);
 	unsigned long pgtable_flags;
 	unsigned long load_delta;
 	pgdval_t *pgd;
@@ -163,7 +165,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * Compute the delta between the address I am compiled to run at
 	 * and the address I am actually running at.
 	 */
-	load_delta = physaddr - (unsigned long)(_text - __START_KERNEL_map);
+	load_delta = __START_KERNEL_map + p2v_offset;
 	RIP_REL_REF(phys_base) = load_delta;
 
 	/* Is the address not 2M aligned? */
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index ab6ccee81493..db71cf64204b 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -99,13 +99,20 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Sanitize CPU configuration */
 	call verify_cpu
 
+	/*
+	 * Use the 1:1 physical and kernel virtual addresses of
+	 * common_startup_64 to determine the physical-to-virtual offset, and
+	 * pass it as the first argument to __startup_64().
+	 */
+	leaq	common_startup_64(%rip), %rdi
+	subq	0f(%rip), %rdi
+
 	/*
 	 * Perform pagetable fixups. Additionally, if SME is active, encrypt
 	 * the kernel and retrieve the modifier (SME encryption mask if SME
 	 * is active) to be added to the initial pgdir entry that will be
 	 * programmed into CR3.
 	 */
-	leaq	_text(%rip), %rdi
 	movq	%r15, %rsi
 	call	__startup_64
 
-- 
2.46.0.792.g87dc391469-goog



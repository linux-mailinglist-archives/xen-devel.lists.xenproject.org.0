Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77198629E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804102.1215092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTix-00087L-06; Wed, 25 Sep 2024 15:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804102.1215092; Wed, 25 Sep 2024 15:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiw-0007mQ-Co; Wed, 25 Sep 2024 15:14:38 +0000
Received: by outflank-mailman (input) for mailman id 804102;
 Wed, 25 Sep 2024 15:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=254E=QX=flex--ardb.bounces.google.com=3-SX0ZggKCVQwDzx+24F2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@srs-se1.protection.inumbo.net>)
 id 1stTX1-0002UM-Ii
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:19 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28849315-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:19 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6d7124939beso104377427b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:19 -0700 (PDT)
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
X-Inumbo-ID: 28849315-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276538; x=1727881338; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WebA59vxPkU4u7rhQajyH4BvEeqGZRhskbQXw1lowfs=;
        b=bltNc210DV+lNvtCsuh7mnlnVNpa4SLhTYfIpX/0EPMWGKkMFSvSoOG2KROy6er6TW
         YPSwUUH53s0UOWooHDySPwmCaKio1stBb8YY+0o60K5NYSj/7Squf4RnTwOavmpLkFKL
         bEwi2ypcExMNcQXJzwYOsMeBpm9NTr36F9kckL1fDASMh7ZKt2RLCGeybdDPCrBQUmsr
         mARlDpeD9kPkxWagIvb7fGUuAe6YhvmhKu0x2sDq61VaKxTwsblVA1FF4n1F+zvH33mS
         u3PTt6ebZ9HUNv2P40mfFabxYjJZSyPudKTNk2lde2+6bn3YuqpqnhmW8pCCSGjzRjWH
         V++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276538; x=1727881338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WebA59vxPkU4u7rhQajyH4BvEeqGZRhskbQXw1lowfs=;
        b=sRRBOAmqaS+K/zhl7N8l7gXHNY90uIYCExn+QCJJeW2rznzOxOJPtfwIjPjPcGVoqi
         9CmcR6O4a+9H18ojSqh9TRZO4H6eqo7DSenv+K6+L/34s1Un7+2x0PKwcQFMLEKlDUEb
         cAM6h4MHTUoPTwRwvjw8yvmPumSYFpTf/FSsW9X4zFhqvvPJFtSejfgile/FfQ8j+UKM
         DC4acgBI2qye1xxeLX2/FfnWASvMrkGxpvvhcFg0+c/DT8TNdk68f0vaYOjhKa/vGNmX
         8lD7ATUg4hWIaHxC24cAJgrpt7unIKfmoLlHRXeaTjmp+tGKWdlmKTIh40YIMczfzkb/
         MH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXvbaO1IMcB/Gg0l/y3pmAopii/ZUHnTMc+JwJq/n8i4n90i2ekgpp0poMBb/jOoSd+1yB0m0AwPzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYxdYVu3cTzv5QIf5uuL2V4oMHtUqfi4TbvDlj88ZIYtQ3PLTI
	DyfBudNSLP+9avkdJjAU7tq19igpXN/noP5Mr7WIQAi3ADjcnx86QNx4rIH1RHhgbwtTjA==
X-Google-Smtp-Source: AGHT+IG1eaRHJ+k+oWi0MEewfWnHRvzWiyuPrZa2XUixnuMGDlz9gyzzCn4pjg7USYksDYWFG76nQbXB
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a81:7c46:0:b0:673:b39a:92ce with SMTP id
 00721157ae682-6e21da5ea7bmr151347b3.3.1727276537527; Wed, 25 Sep 2024
 08:02:17 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:11 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=ardb@kernel.org;
 h=from:subject; bh=R6ohiPGa3ul2ikQd2A7YE6wpEPvXq0bd6W2LGMrzZ/k=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6m4L/Wkc7n0aPQzsYULiEQZPMlgefsmsLHv4K8KPe
 c6T1d0dpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCLF8YwMhwNCO7WWnu4+bHJ/
 R+KN+e/7+Z5GTZy4J83mRy0Xx+UbAowMLwuTAsXUc+SfqAVdK+gtnHdHT+jRjZtrv3D/ms77oD2 BCwA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-41-ardb+git@google.com>
Subject: [RFC PATCH 11/28] x86/pvh: Avoid absolute symbol references in .head.text
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

The .head.text section contains code that may execute from a different
address than it was linked at. This is fragile, given that the x86 ABI
can refer to global symbols via absolute or relative references, and the
toolchain assumes that these are interchangeable, which they are not in
this particular case.

In the case of the PVH code, there are some additional complications:
- the absolute references are in 32-bit code, which get emitted with
  R_X86_64_32 relocations, and these are not permitted in PIE code;
- the code in question is not actually relocatable: it can only run
  correctly from the physical load address specified in the ELF note.

So rewrite the code to only rely on relative symbol references: these
are always 32-bits wide, even in 64-bit code, and are resolved by the
linker at build time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 39 ++++++++++++++------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index adbf57e83e4e..e6cb7da40e09 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -54,7 +54,20 @@ SYM_CODE_START(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
-	lgdt (_pa(gdt))
+	/*
+	 * This is position dependent code that can only execute correctly from
+	 * the physical address that the kernel was linked to run at. Use the
+	 * symbols emitted for the ELF note to construct the build time physical
+	 * address of pvh_start_xen(), without relying on absolute 32-bit ELF
+	 * relocations, as these are not supported by the linker when running in
+	 * -pie mode, and should be avoided in .head.text in general.
+	 */
+0:	mov $xen_elfnote_phys32_entry_offset - 0b, %ebp
+	sub $xen_elfnote_phys32_entry - 0b, %ebp
+
+	lea (gdt - pvh_start_xen)(%ebp), %eax
+	add %eax, 2(%eax)
+	lgdt (%eax)
 
 	mov $PVH_DS_SEL,%eax
 	mov %eax,%ds
@@ -62,14 +75,14 @@ SYM_CODE_START(pvh_start_xen)
 	mov %eax,%ss
 
 	/* Stash hvm_start_info. */
-	mov $_pa(pvh_start_info), %edi
+	lea (pvh_start_info - pvh_start_xen)(%ebp), %edi
 	mov %ebx, %esi
-	mov _pa(pvh_start_info_sz), %ecx
+	mov (pvh_start_info_sz - pvh_start_xen)(%ebp), %ecx
 	shr $2,%ecx
 	rep
 	movsl
 
-	mov $_pa(early_stack_end), %esp
+	lea (early_stack_end - pvh_start_xen)(%ebp), %esp
 
 	/* Enable PAE mode. */
 	mov %cr4, %eax
@@ -84,17 +97,21 @@ SYM_CODE_START(pvh_start_xen)
 	wrmsr
 
 	/* Enable pre-constructed page tables. */
-	mov $_pa(init_top_pgt), %eax
+	lea (init_top_pgt - pvh_start_xen)(%ebp), %eax
 	mov %eax, %cr3
 	mov $(X86_CR0_PG | X86_CR0_PE), %eax
 	mov %eax, %cr0
 
 	/* Jump to 64-bit mode. */
-	ljmp $PVH_CS_SEL, $_pa(1f)
+	lea  (1f - pvh_start_xen)(%ebp), %eax
+	push $PVH_CS_SEL
+	push %eax
+	lret
 
 	/* 64-bit entry point. */
 	.code64
 1:
+	UNWIND_HINT_END_OF_STACK
 	/* Clear %gs so early per-CPU references target the per-CPU load area */
 	mov $MSR_GS_BASE,%ecx
 	xor %eax, %eax
@@ -108,10 +125,8 @@ SYM_CODE_START(pvh_start_xen)
 	call *%rax
 
 	/* startup_64 expects boot_params in %rsi. */
-	mov $_pa(pvh_bootparams), %rsi
-	mov $_pa(startup_64), %rax
-	ANNOTATE_RETPOLINE_SAFE
-	jmp *%rax
+	lea pvh_bootparams(%rip), %rsi
+	jmp startup_64
 
 #else /* CONFIG_X86_64 */
 
@@ -146,8 +161,8 @@ SYM_CODE_END(pvh_start_xen)
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
+	.word gdt_end - gdt_start - 1
+	.long gdt_start - gdt
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
-- 
2.46.0.792.g87dc391469-goog



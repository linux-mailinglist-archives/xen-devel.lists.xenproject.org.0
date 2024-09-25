Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0179862B7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804154.1215222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjJ-0004Tq-Jm; Wed, 25 Sep 2024 15:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804154.1215222; Wed, 25 Sep 2024 15:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjG-0003zY-OS; Wed, 25 Sep 2024 15:14:58 +0000
Received: by outflank-mailman (input) for mailman id 804154;
 Wed, 25 Sep 2024 15:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12nj=QX=flex--ardb.bounces.google.com=3Eyb0ZggKCW4MdPN+SUfSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@srs-se1.protection.inumbo.net>)
 id 1stTXS-0002k3-O0
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:46 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38060100-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:45 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e02fff66a83so10698672276.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:45 -0700 (PDT)
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
X-Inumbo-ID: 38060100-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276564; x=1727881364; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=zdYKtjTZL53sOPSej7O5Lk7pIq+c33T8Od1H4+/yb49Ag3zCBQApYLTNvIFolB7LHI
         vDueO41KJCsQye7UsaZOPCejatQqzjRnJsApj5dbju4Hx3/9cdYRRDEnwbunbXYQ86ko
         cPIJ0x3cPZj5CYvk4sMJURrEMHU7qlPjBor5d14thvTigXv1+2V3ZvCx8ukSGzLwCurU
         RbsSuiPMe+O31uhXiLfDQ00cG1z2S+U4pjADkw9k+9UPlNrm1IDx01qM7qmHfOJebNBA
         VsjnzpMIM3ppHtAwdwltDPcVMGHu7HnWi1/mdPzRdohpXSggHU2x2a6ryr3JI89465cf
         Nizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276564; x=1727881364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=JSosPA49hNkiQXJrmkO7BkiRVz07ng9ntw+GYelvlSyL49tMAcPFHiUAkugH+GtVSr
         0DoGb/ITZIf5Lux7SWs0CXHSAZhCLHZJzUoohzav2t7iYeq+nvkyc8FAoVAfBix8+qe4
         f4+U6aHGW34GItWJE88BPugFhwprv3IoSyZv0TTIoFsLjU9iZSs2hRncicP7yntW07uR
         kEheUx2weZe/GbwFmn0bLvuYy3tb/wcxgqgDFbAHswaSuK88bE/scTyi7uFvuDdmU92V
         v9j6d2ac5khR5Pqb+OzSTmfBA2jen4fe0GLtnDV38SDRKdnEyNYNVPnb6o8Xm4ycpVWa
         xywQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO9HC0rV7oNgHO3Ls0bWrZ6rxc8F4WY1+Rz5M0iz5UQngkNZwkCX3NsJMqbQax+2IpHy7PSDphxEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGQklkFS2zMyDB4ZsTjv4mKm+DpSrS7tRjyb1dZ9uFKVLgr2K5
	kHKLGQE6SKMmEwzxWn3daxU4kljfVZ+Lui9GCwBw3NRLDudlgpaZDJx/pI+sy0VUWOQ3Xg==
X-Google-Smtp-Source: AGHT+IG8l7xPrwiQoCJNQ/ba3EMloi9V99YK0VEhh/KbnKIqVODzSQX4+kTe9p6XHA3xEE581cvXY/7/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:fc20:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e2517cb37ebmr1573276.9.1727276563646; Wed, 25 Sep 2024 08:02:43
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:21 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=ardb@kernel.org;
 h=from:subject; bh=aFznGPhrIJfcYbFW/zJm7PxtyN4XPqpBJvJpRLs7DOQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6smrOU/sUlwy2LTW237rV4pUONJ8T3XtdLO2DQ3bj
 80/F1nfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyyZHhn8LWprti0g+tdKf9
 /bStUjGJXy/+qc4H120n962eP03h1yKG/wHHj7aK75zgynumw7x0V1PPmh2muXNy98WcvvZ74cO kJi4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-51-ardb+git@google.com>
Subject: [RFC PATCH 21/28] x86/head: Use PIC-compatible symbol references in
 startup code
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

Use RIP-relative symbol references to make them compatible with running
the linker in PIE mode.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S            | 14 +++++++++-----
 arch/x86/kernel/relocate_kernel_64.S |  6 ++++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index db71cf64204b..cc2fec3de4b7 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -182,8 +182,9 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	xorl	%r15d, %r15d
 
 	/* Derive the runtime physical address of init_top_pgt[] */
-	movq	phys_base(%rip), %rax
-	addq	$(init_top_pgt - __START_KERNEL_map), %rax
+	leaq	init_top_pgt(%rip), %rax
+	subq	$__START_KERNEL_map, %rax
+	addq	phys_base(%rip), %rax
 
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
@@ -314,7 +315,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 
 .Lsetup_cpu:
 	/* Get the per cpu offset for the given CPU# which is in ECX */
-	movq	__per_cpu_offset(,%rcx,8), %rdx
+	leaq	__per_cpu_offset(%rip), %rdx
+	movq	(%rdx,%rcx,8), %rdx
 #else
 	xorl	%edx, %edx /* zero-extended to clear all of RDX */
 #endif /* CONFIG_SMP */
@@ -325,7 +327,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *
 	 * RDX contains the per-cpu offset
 	 */
-	movq	pcpu_hot + X86_current_task(%rdx), %rax
+	leaq	pcpu_hot + X86_current_task(%rip), %rax
+	movq	(%rax,%rdx), %rax
 	movq	TASK_threadsp(%rax), %rsp
 
 	/*
@@ -346,7 +349,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 */
 	subq	$16, %rsp
 	movw	$(GDT_SIZE-1), (%rsp)
-	leaq	gdt_page(%rdx), %rax
+	leaq	gdt_page(%rip), %rax
+	addq	%rdx, %rax
 	movq	%rax, 2(%rsp)
 	lgdt	(%rsp)
 	addq	$16, %rsp
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index e9e88c342f75..cbfd0227ea3e 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -106,6 +106,9 @@ SYM_CODE_START_NOALIGN(relocate_kernel)
 	/* setup a new stack at the end of the physical control page */
 	lea	PAGE_SIZE(%r8), %rsp
 
+	/* take the virtual address of virtual_mapped() before jumping */
+	leaq	virtual_mapped(%rip), %r14
+
 	/* jump to identity mapped page */
 	addq	$(identity_mapped - relocate_kernel), %r8
 	pushq	%r8
@@ -225,8 +228,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	movq	%rax, %cr3
 	lea	PAGE_SIZE(%r8), %rsp
 	call	swap_pages
-	movq	$virtual_mapped, %rax
-	pushq	%rax
+	pushq	%r14
 	ANNOTATE_UNRET_SAFE
 	ret
 	int3
-- 
2.46.0.792.g87dc391469-goog



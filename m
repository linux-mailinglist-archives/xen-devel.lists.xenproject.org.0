Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91198629F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804109.1215119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj0-0000XX-7b; Wed, 25 Sep 2024 15:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804109.1215119; Wed, 25 Sep 2024 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiz-0000AO-Hk; Wed, 25 Sep 2024 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 804109;
 Wed, 25 Sep 2024 15:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bgGM=QX=flex--ardb.bounces.google.com=3Bib0ZggKCWE9QCA+FHSFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@srs-se1.protection.inumbo.net>)
 id 1stTXE-0002k3-M1
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:32 +0000
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [2a00:1450:4864:20::349])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ffcb5ed-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:31 +0200 (CEST)
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-42cb374f0cdso5460625e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:31 -0700 (PDT)
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
X-Inumbo-ID: 2ffcb5ed-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276550; x=1727881350; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vAC8l3Y8WvFUyajZb+pirsZCUpFvZ3r8+BwrpQuj/SE=;
        b=1NURscgRI3vtyb7ymtpWAZL/ywv1l8Nn7LGK/De9pw9/5HI+kz4NPB/dM03neHILrV
         Og+fRd5Nc6l0bMSwsfou7cbsidr6OPh4e1e00qxQibIvSb6cRMkIgf/Y3aNbUyOxYvpG
         DmFuFRXTYG1ccqIOxnlpfK7OX8jZmG+3wjDUDzrAw0NWyrJJ9tLBMl5IuDh8MxiPUmuz
         SY5amy73KbRgAFSNBSb1/i4li/JqtI55s/1Zs/cHYpBxBfc5U2E6+kxePuDrpA1VkWxj
         dRXEQblfZvs9NQiJ8F2ICkgO85IFIMfoM80VAnqZtdmqiXKm1xA6d2pOq9szOMyBj/GM
         Vs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276550; x=1727881350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAC8l3Y8WvFUyajZb+pirsZCUpFvZ3r8+BwrpQuj/SE=;
        b=iMfe5uV0ZO3lVflWxprVpWDoOqwOwM0KXaTQFYQF0HyCQQ5b/wuwEu3gSZog1iTYfJ
         Zf6CWbudROQKBvSKeenhEFBSRc2gDFHUZT+EuflJfoA6XyufWAZAylk6aHPo0QqFwEef
         tud0sayTG1ufAXOPO75O+Z/PcKwsQEQE7iQE6dxrzOIzFWZE8lUcy7PgAfreM34449Ci
         FamykL+kYiMTTXCPCl//8s8r0slyEyB9UvRC9diguwG/XM2EK/PLa72JvMsb/PK5mYo5
         XNsvTFH0Vdz5zaSRtdmMU+7XbDeYWak76h0ITMrdrBTEFgpEDycwHztfy6qdqv+1ybPz
         Yr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaLDdBPE1hkGk/aFPieiQeBN0y4YwhX8FWeQ3yHX40zUD8h9I5zuVzpERKCNPMr1CsALDgAUM8CAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+357hU1RpFevWfW7gNEsdXM8piYJZkcbixvgads/aLLA/7SX/
	qCUWC0PFT9EPXBTQLKY+3wYmTPzwA2lGlDSRjGvkKjoj1e9cHdsFd1Ghdhk7m9g5JJtwfQ==
X-Google-Smtp-Source: AGHT+IGsHQZbBz7v7rjB2VogUNbzT3V2zpNGtAWZsXzYUPDihu4mWF0GF+yn2VIMs1ZNTkRqyJuf4PXN
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:4ca2:b0:42c:acd5:c641 with SMTP id
 5b1f17b1804b1-42e96037975mr279665e9.2.1727276550412; Wed, 25 Sep 2024
 08:02:30 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:16 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=ardb@kernel.org;
 h=from:subject; bh=tMElkct6gfSM6gp7MMWL/mRF1vGpc7RrYvn7ljZWXyE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6iGZPaJMr8LDnd//b/RW8SszXOfdmXXq3NuftZV75
 oQv+lfaUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZy4w/DHw7GS21Or9/PeKL6
 7ZX8zCMs6WX7p7QFXu6zKz6oZDhn3S9GhnkFPcEfOSfJKv9IYrKOXfBu+/X/Xl4zqlnSnqz7v02 4kwsA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-46-ardb+git@google.com>
Subject: [RFC PATCH 16/28] x86/entry_64: Use RIP-relative addressing
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

Fix up a couple of occurrences in the x86_64 entry code where we take
the absolute address of a symbol while we could use RIP-relative
addressing just the same. This avoids relocation fixups at boot for
these quantities.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/entry/calling.h  |  9 +++++----
 arch/x86/entry/entry_64.S | 12 +++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index ea81770629ee..099da5aaf929 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -375,8 +375,8 @@ For 32-bit we have the following conventions - kernel is built with
 .endm
 
 .macro SAVE_AND_SET_GSBASE scratch_reg:req save_reg:req
+	GET_PERCPU_BASE \scratch_reg \save_reg
 	rdgsbase \save_reg
-	GET_PERCPU_BASE \scratch_reg
 	wrgsbase \scratch_reg
 .endm
 
@@ -412,15 +412,16 @@ For 32-bit we have the following conventions - kernel is built with
  * Thus the kernel would consume a guest's TSC_AUX if an NMI arrives
  * while running KVM's run loop.
  */
-.macro GET_PERCPU_BASE reg:req
+.macro GET_PERCPU_BASE reg:req scratch:req
 	LOAD_CPU_AND_NODE_SEG_LIMIT \reg
 	andq	$VDSO_CPUNODE_MASK, \reg
-	movq	__per_cpu_offset(, \reg, 8), \reg
+	leaq	__per_cpu_offset(%rip), \scratch
+	movq	(\scratch, \reg, 8), \reg
 .endm
 
 #else
 
-.macro GET_PERCPU_BASE reg:req
+.macro GET_PERCPU_BASE reg:req scratch:req
 	movq	pcpu_unit_offsets(%rip), \reg
 .endm
 
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 1b5be07f8669..6509e12b6329 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -1038,7 +1038,8 @@ SYM_CODE_START(error_entry)
 	movl	%ecx, %eax			/* zero extend */
 	cmpq	%rax, RIP+8(%rsp)
 	je	.Lbstep_iret
-	cmpq	$.Lgs_change, RIP+8(%rsp)
+	leaq	.Lgs_change(%rip), %rcx
+	cmpq	%rcx, RIP+8(%rsp)
 	jne	.Lerror_entry_done_lfence
 
 	/*
@@ -1250,10 +1251,10 @@ SYM_CODE_START(asm_exc_nmi)
 	 * the outer NMI.
 	 */
 
-	movq	$repeat_nmi, %rdx
+	leaq	repeat_nmi(%rip), %rdx
 	cmpq	8(%rsp), %rdx
 	ja	1f
-	movq	$end_repeat_nmi, %rdx
+	leaq	end_repeat_nmi(%rip), %rdx
 	cmpq	8(%rsp), %rdx
 	ja	nested_nmi_out
 1:
@@ -1307,7 +1308,8 @@ nested_nmi:
 	pushq	%rdx
 	pushfq
 	pushq	$__KERNEL_CS
-	pushq	$repeat_nmi
+	leaq	repeat_nmi(%rip), %rdx
+	pushq	%rdx
 
 	/* Put stack back */
 	addq	$(6*8), %rsp
@@ -1346,7 +1348,7 @@ first_nmi:
 	addq	$8, (%rsp)	/* Fix up RSP */
 	pushfq			/* RFLAGS */
 	pushq	$__KERNEL_CS	/* CS */
-	pushq	$1f		/* RIP */
+	pushq	1f@GOTPCREL(%rip) /* RIP */
 	iretq			/* continues at repeat_nmi below */
 	UNWIND_HINT_IRET_REGS
 1:
-- 
2.46.0.792.g87dc391469-goog



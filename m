Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F69862B2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804150.1215209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjG-0003zm-CO; Wed, 25 Sep 2024 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804150.1215209; Wed, 25 Sep 2024 15:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjE-0003cA-VN; Wed, 25 Sep 2024 15:14:56 +0000
Received: by outflank-mailman (input) for mailman id 804150;
 Wed, 25 Sep 2024 15:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tN6d=QX=flex--ardb.bounces.google.com=3ESb0ZggKCWwKbNL+QSdQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@srs-se1.protection.inumbo.net>)
 id 1stTXQ-0002k3-50
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:44 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368bbc09-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:42 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6d4bd76f5a8so106916987b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:42 -0700 (PDT)
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
X-Inumbo-ID: 368bbc09-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276561; x=1727881361; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlbORA03gt7VD7U3AKlte04ifRsDRozPK1w/WollpSI=;
        b=2rVzqEkShUh3rW4UBTnJfRSUaIEvNrafDYOC4f5UqhL9ml4yQAFqx2wuInXda0CXUX
         5xWZalzOx7v04C68ZnVzGxFpAlmMW/dEqPml8aLHifhJ1htT0rTlMQemYt1KFcM5yDd1
         Iq25LiXiD++hJ5Rs7sJuiMxZXXPLvgWIG/0PBKzEL4DPnhUDe535QSk2X5kBUhr2H4qd
         TyZK+z62lcKbWugQL83ktiKn+NB+MQOtBuBhRCwwlyJs6WpzAgP9ggEN/+l+V3e1Ounk
         b6XuuxberGft63z5zvRlirrEsrHuy9lwxDpvv0YYLW1w+c5DidjoB3W/+7Bro6p5yLRH
         ui6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276561; x=1727881361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlbORA03gt7VD7U3AKlte04ifRsDRozPK1w/WollpSI=;
        b=tbsr+LCFa3/fhlm4CjIjL6NsAqFr1MoYVJdCpm1Zq3Etkxz8jxyQC99uDeJCyNfXOZ
         zhpZ0snfqby6Ey2M2zhxRcvT87CF/pHutcUWNxwGYz6SHtt9Nhfxz7VBQKrt7XZOY05V
         rJwE/HoTHpmyzc85heVcgB5y0JOouEe/khlDY2eofjULW70P+VCMhe5LoaPWojyZ1EAw
         CZ2BvHbrTuJg2E862WoegqQL/4OZ7XYYSKr6nLgx25P1KJJUEJvLkF5e3hhVGW/mB7Az
         xQic+dTQyMUCH0yXCg3Gw702tlzy3bSIZa12EZIkWv9/pz4mt4zpDNOBsI+y4cK7PrOq
         EzMA==
X-Forwarded-Encrypted: i=1; AJvYcCUVhITatX5995qck/LGuRKp3FdTGZExlKXHadhjB8VD/wZM8xEn9Ic3oYbc6oHcsBLWrQA8BunXkGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWzxwu1ubi5QXD7MtTcVAhKH63qqBhIVHeSeaS1PqrWmW9Il3h
	OdAqd5GSV5jNtV60Ce3HyVXkT+WXLyVP07HPfE8d8FboZXZf2jyBoAekGKqPyrb3YmJFBA==
X-Google-Smtp-Source: AGHT+IH4yCJxpgJpRghyt05ffZ0KMtbzY3622CltTm7OPK0ZYLkhBwwkH9bUzMfV7VeGOafl80KA41By
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:4289:b0:6e0:1ad:b197 with SMTP id
 00721157ae682-6e21d9eb35cmr74667b3.3.1727276561223; Wed, 25 Sep 2024 08:02:41
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:20 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=ardb@kernel.org;
 h=from:subject; bh=udZt3Ybebg1JaBid31YzntWp5JIa5pAk0HVUlAzZyZ0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6gljFsPIOfpfC+4mTz0SPOfTfNeM53artXe5vlz2r
 m2tZ4xiRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI/0qG/z53N1inv844/EXP
 gLPr2aVVD8T/nDB5/WSxtlzL53WrfboZGX7d3NY04aKrkHqeft+Obu4DWbvCTcvYF6zT0yzuZn0 pwQAA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-50-ardb+git@google.com>
Subject: [RFC PATCH 20/28] x64/acpi: Use PIC-compatible references in wakeup_64.S
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

Use ordinary RIP-relative references to make the code compatible with
running the linker in PIE mode.

Note that wakeup_long64() runs in the kernel's ordinary virtual mapping
so there is no need to record the address of .Lresume_point in a global
variable. And fix the comment while at it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/acpi/wakeup_64.S | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
index 94ff83f3d3fe..af2f2ed57658 100644
--- a/arch/x86/kernel/acpi/wakeup_64.S
+++ b/arch/x86/kernel/acpi/wakeup_64.S
@@ -14,7 +14,7 @@
 
 .code64
 	/*
-	 * Hooray, we are in Long 64-bit mode (but still running in low memory)
+	 * Hooray, we are in Long 64-bit mode
 	 */
 SYM_FUNC_START(wakeup_long64)
 	movq	saved_magic(%rip), %rax
@@ -40,7 +40,7 @@ SYM_FUNC_START(wakeup_long64)
 	movq	saved_rsi(%rip), %rsi
 	movq	saved_rbp(%rip), %rbp
 
-	movq	saved_rip(%rip), %rax
+	leaq	.Lresume_point(%rip), %rax
 	ANNOTATE_RETPOLINE_SAFE
 	jmp	*%rax
 SYM_FUNC_END(wakeup_long64)
@@ -51,7 +51,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
 	xorl	%eax, %eax
 	call	save_processor_state
 
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	%rsp, pt_regs_sp(%rax)
 	movq	%rbp, pt_regs_bp(%rax)
 	movq	%rsi, pt_regs_si(%rax)
@@ -70,8 +70,6 @@ SYM_FUNC_START(do_suspend_lowlevel)
 	pushfq
 	popq	pt_regs_flags(%rax)
 
-	movq	$.Lresume_point, saved_rip(%rip)
-
 	movq	%rsp, saved_rsp(%rip)
 	movq	%rbp, saved_rbp(%rip)
 	movq	%rbx, saved_rbx(%rip)
@@ -88,7 +86,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
 	.align 4
 .Lresume_point:
 	/* We don't restore %rax, it must be 0 anyway */
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	saved_context_cr4(%rax), %rbx
 	movq	%rbx, %cr4
 	movq	saved_context_cr3(%rax), %rbx
@@ -137,7 +135,6 @@ saved_rsi:		.quad	0
 saved_rdi:		.quad	0
 saved_rbx:		.quad	0
 
-saved_rip:		.quad	0
 saved_rsp:		.quad	0
 
 SYM_DATA(saved_magic,	.quad	0)
-- 
2.46.0.792.g87dc391469-goog



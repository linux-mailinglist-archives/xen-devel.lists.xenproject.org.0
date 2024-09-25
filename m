Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33992986294
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804081.1215005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiq-00069M-6M; Wed, 25 Sep 2024 15:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804081.1215005; Wed, 25 Sep 2024 15:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiq-00064z-1z; Wed, 25 Sep 2024 15:14:32 +0000
Received: by outflank-mailman (input) for mailman id 804081;
 Wed, 25 Sep 2024 15:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVAW=QX=flex--ardb.bounces.google.com=33yX0ZggKCToWnZX+cepckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@srs-se1.protection.inumbo.net>)
 id 1stTWc-0002k3-UV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:01:54 +0000
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com
 [2a00:1450:4864:20::34a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ffc7f3-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:01:52 +0200 (CEST)
Received: by mail-wm1-x34a.google.com with SMTP id
 5b1f17b1804b1-42cb33e6299so45729745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:01:52 -0700 (PDT)
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
X-Inumbo-ID: 18ffc7f3-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276512; x=1727881312; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvHrMBM7osvq1YNoyXkrrTpmrTIb8bNW96uzrIXNQu8=;
        b=MG7R0YY+Tx2W+D5iKUDAZzVULY9gxuiQFXFYgFIbRsVClwykZSL8ueV0YvRZVXhai7
         ZvC9ZcYiLcgdPex06HxOngRfGH3/yDk5VPd4pwy5Cmx10KqJN96ExrTRIl3wzzoIlO4r
         0ntrMCTAMfoxuniNH+SBs3tqNazZ+RcSl3oTxDQd9QKncNsTx70ArBz3jrZu2EHiMjLY
         ZkAOYVIhx0nNACVo5wSYWvXz52Ib9swxts+LiGgxkKoWw0qwCVwD5heDR+Eu3SKX3KDp
         mR72qFt4F9Pm85iNPnKsl3UMiI+PxxrBSs8U9eyNg1YQ03nvc3HrPiL8bqLo208Cs/fk
         vfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276512; x=1727881312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvHrMBM7osvq1YNoyXkrrTpmrTIb8bNW96uzrIXNQu8=;
        b=kms8Rm2J4j/4wbpTOX6m3XP9aPjfWxMTai32iMz4TVU9lzTeeAFzLV0CwAaT7bpUhV
         A5hJWu4AN3jsCrAYwHMJUdBKHgjFZ06vpKtPL6m5hBn5+nsnSNJIDPZhigWBp0JuWv0m
         hBcF1Dc9G+qji9Naom+2oofVzjRwB3I5yMF11NPcogpmaDnyT5av/CcYVvVDA2faurUJ
         /60YsAE/khR59+ZcyrYmwmjtj341CSV0Yb3bX2F+JqLV76C5wyLPpRTYFb/FE6akm+Zl
         /6FuLMJ4O0caYP+5asd91ACpWe64a/rXa/eeKHmAX6eTzHIcQcoWysM1FReRARNmZEm2
         re7A==
X-Forwarded-Encrypted: i=1; AJvYcCV+b8xtSG1LYVB/q8hNrOrRLRIF7OzhwXZPwk/oRKUnPJwR4B1bXIOkSepcPfCWFbXlaR1uxLxEFbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4MUEsuA0B7omQiVKl5Sb96WjXcsdaOozis/MQ2xzbWOoOvVOj
	uPlfSWvB7IKpZiGWexCnqzQUwrx1WicjhuZEjIkm8ioXJQB4VIDADI4AgW1w0Ky5HfcUzw==
X-Google-Smtp-Source: AGHT+IGNEZwim//wtoUQ0IgEwXQAmuWMXuvjVNrkXztiUbXuSVle0sf2azOpfGly/wGUuNh4kSi9g764
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:4b23:b0:42c:b635:9ba7 with SMTP id
 5b1f17b1804b1-42e961449f9mr294105e9.3.1727276511763; Wed, 25 Sep 2024
 08:01:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:01 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=ardb@kernel.org;
 h=from:subject; bh=kkus52hb+9U3rGqLGvcTtWiqi7ULiH1wdI2hpFI7/9I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6loPG1eTz6/TRZ+ExF55v9yoPVaMz0DJP05TXvNix
 3yvWS87SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwER0vzAyLNdk+Hf0DcN93e0c
 kou2iV0ReKfEPrsn3ORh04fsoM3R+gz/0yZt5ne4cnJFldTMQpGfLor75ZYczDujFLCs+4iee6Q pMwA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-31-ardb+git@google.com>
Subject: [RFC PATCH 01/28] x86/pvh: Call C code via the kernel virtual mapping
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

Calling C code via a different mapping than it was linked at is
problematic, because the compiler assumes that RIP-relative and absolute
symbol references are interchangeable. GCC in particular may use
RIP-relative per-CPU variable references even when not using -fpic.

So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
that those RIP-relative references produce the correct values. This
matches the pre-existing behavior for i386, which also invokes
xen_prepare_pvh() via the kernel virtual mapping before invoking
startup_32 with paging disabled again.

Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..a308b79a887c 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -101,7 +101,11 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	xor %edx, %edx
 	wrmsr
 
-	call xen_prepare_pvh
+	/* Call xen_prepare_pvh() via the kernel virtual mapping */
+	leaq xen_prepare_pvh(%rip), %rax
+	addq $__START_KERNEL_map, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	call *%rax
 
 	/* startup_64 expects boot_params in %rsi. */
 	mov $_pa(pvh_bootparams), %rsi
-- 
2.46.0.792.g87dc391469-goog



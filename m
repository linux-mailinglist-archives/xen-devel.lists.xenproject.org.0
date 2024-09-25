Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDA9862A3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804107.1215110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiz-0000CJ-82; Wed, 25 Sep 2024 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804107.1215110; Wed, 25 Sep 2024 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiy-0008Ea-5U; Wed, 25 Sep 2024 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 804107;
 Wed, 25 Sep 2024 15:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1DAC=QX=flex--ardb.bounces.google.com=3_yX0ZggKCVo2J53+8AL8GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1stTX6-0002UM-Nw
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:24 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba19c93-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:24 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e035949cc4eso10635363276.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:24 -0700 (PDT)
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
X-Inumbo-ID: 2ba19c93-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276543; x=1727881343; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vu/ZbROFphQGBAR+273iXbk1tlXuWo8crbz4dEomRj0=;
        b=TW2scN/LTDHYWp4wNaMlQkFwTLRjiBq8eEtajXeRp1/aQRmFm/ah0xqQhGIV0miBAG
         sLNcNgurgDXn75/p0l9nd2V814sl+mRoJbiNxjhe06aISPDjCkQCcMaZ4P+NS0eWhsaQ
         kU2UTh0pRu8WfblmdA8vhkEhDu5AKQPMHZC9kTDHnvE4QOyz0kOexKbIxadGMXlQYPPw
         3qaUUAgF3YK0+nsAuLJVP7iQFKHtOcvam/9xVFA1Vm5JqLMNMrhOhfYg0z0SkhPQufL5
         iduXXKF3vmTMRr68hbMm/E1nxKDm1CUZjM4BujkEMxdloB9gQv9o8Y1e09LEIsUIbRgD
         oAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276543; x=1727881343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu/ZbROFphQGBAR+273iXbk1tlXuWo8crbz4dEomRj0=;
        b=LrtxIMKQ4uysiA4rrcgjWjc3b06KAejNnejOJnJft1ptHAnu5AmSGJGopvRyYUb8Pr
         Hv5MgTuwoPl6jTRK+kcMgHhG02v2r+W1+GGMF5KdUWB/0R0Xvk9pNAmFGHoxjFdY78jg
         ZPK01wI/2SA/JKih6zoLRkvwFK5qyh0dzHNNp4gW2q46XcxKLNP8CEp8atPXRHN59ro6
         xwPQ05/iVY016K4GG0k1AmLYSHd+00HMiEqOhC7FcoC346KVHsL/JnGaTbzEYzuWgi8I
         DanvFEJqcF86ombT0m76NC9p4JLc1XHxVdbtbDVM5GFncjpVVWageqCwieu1nMREi+x8
         gvbg==
X-Forwarded-Encrypted: i=1; AJvYcCUBOuZ/R5mBbVskTzucHssTefNY14ixziawV6crwT4c6OUEqqX7kzU22d8KDnVutCurHlbXHWm03GY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkZZwNneG8oHGvbLoHcr/8A/qwEnUegXOvQDvG0FXmnOlEDece
	jKFUngw5VFTQvzAJvhawj96pe6GWuNhFHbwfOeAYSMLFHrYtwqCNLt3seFzzotCz6lpQZQ==
X-Google-Smtp-Source: AGHT+IEyaWBDeaj2o4LzPpSYVvpQbis55gp/KI/SuWbxXUep7wBTAaa7DqSfUrTGsylfjBz2VoxVb7Nf
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:1782:b0:e0b:958a:3344 with SMTP id
 3f1490d57ef6-e24da39b0c3mr17936276.10.1727276543053; Wed, 25 Sep 2024
 08:02:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:13 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397; i=ardb@kernel.org;
 h=from:subject; bh=OCB6ogDK8zWwsvV7jOJ7CFiQBF2ggvTbOxK6mQJaX9A=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6r76WO61FcfVRPyObM7vdxPl3nB63j7e+T6H1Wu+r
 TX46mXYUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyaR4jwzOv6S8kr9nwfXyX
 9iPzW9q5kzeEqzTXKbA29B6+VB8ddZORYZns0cK9u93/3DfuTd/m9X/T7v+32d81/dIy2BMjHfO RgwMA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-43-ardb+git@google.com>
Subject: [RFC PATCH 13/28] x86/kvm: Use RIP-relative addressing
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

Avoid absolute references in code, which require fixing up at boot time,
and replace them with RIP-relative ones. In this particular case, due to
the register pressure, they cannot be avoided entirely, so one absolute
reference is retained but the resulting reference via the GOT is
compatible with running the linker in PIE mode.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/kvm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 263f8aed4e2c..8eac209a31aa 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -800,9 +800,11 @@ extern bool __raw_callee_save___kvm_vcpu_is_preempted(long);
  * Hand-optimize version for x86-64 to avoid 8 64-bit register saving and
  * restoring to/from the stack.
  */
-#define PV_VCPU_PREEMPTED_ASM						     \
- "movq   __per_cpu_offset(,%rdi,8), %rax\n\t"				     \
- "cmpb   $0, " __stringify(KVM_STEAL_TIME_preempted) "+steal_time(%rax)\n\t" \
+#define PV_VCPU_PREEMPTED_ASM						\
+ "leaq   __per_cpu_offset(%rip), %rax				\n\t"	\
+ "movq   (%rax,%rdi,8), %rax					\n\t"	\
+ "addq   steal_time@GOTPCREL(%rip), %rax			\n\t"	\
+ "cmpb   $0, " __stringify(KVM_STEAL_TIME_preempted) "(%rax)	\n\t"	\
  "setne  %al\n\t"
 
 DEFINE_ASM_FUNC(__raw_callee_save___kvm_vcpu_is_preempted,
-- 
2.46.0.792.g87dc391469-goog



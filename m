Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB469862AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804132.1215163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj6-0001sC-K7; Wed, 25 Sep 2024 15:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804132.1215163; Wed, 25 Sep 2024 15:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj5-0001Td-2Q; Wed, 25 Sep 2024 15:14:47 +0000
Received: by outflank-mailman (input) for mailman id 804132;
 Wed, 25 Sep 2024 15:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWIs=QX=flex--ardb.bounces.google.com=3CCb0ZggKCWMBSEC+HJUHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@srs-se1.protection.inumbo.net>)
 id 1stTXG-0002UM-AE
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:34 +0000
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com
 [2a00:1450:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3199af2b-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:33 +0200 (CEST)
Received: by mail-wr1-x449.google.com with SMTP id
 ffacd0b85a97d-37a4d65df57so1279644f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:33 -0700 (PDT)
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
X-Inumbo-ID: 3199af2b-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276553; x=1727881353; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ1cTLWN/qm1UuyAwDsDiC37ecAWh5CqzUoGN/3jT3Q=;
        b=UjUkaUv3IfntJwJ3EYnvMwX1fTbgHh5d0VVO5VSK8ZyemgXEabtTu5Oozwigl11H4p
         iuAfOBn87B9HzGS3a86GXBbrQCpPaHfrV8amqP7ssg5zla/AzAA8xk/DHZ/O0HGCwN4T
         1ILAF2Rw7Yqwi93RweBnhZya4VtzQHkZGi0SsTjqvWNjZbWPxtL/stu5dyRqxUQfdc/S
         /aDvrMVaqQBxQkLNpFslkUEioMj5B+ZQbOuqPIGM9oTQZ3938nwm36PIG0lJVPzUYFIM
         352tZRyKyGXVdSlx/ORhjiKaPYKHdVyiBA84mXfqWtV71j2csWRjBnXhq/zxmODRskuq
         so5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276553; x=1727881353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ1cTLWN/qm1UuyAwDsDiC37ecAWh5CqzUoGN/3jT3Q=;
        b=wmRB7wdHPUdZsWHXxbiMEq20cKJc5AyhL81y6pY/uP4fGlPQ6Yi5O8hyjFcRzTLNhr
         Fyif78T4PtXpBtrwifN8LHa1navMoS1cjEiwx+lEXLSuWU1I/zROXALxEKSZ0AKDNcDe
         bwfbuvqBwAZ2WqF/oMyeJv+WRk4cL6HfTPwZMCb6F09CuoE34mt4KpBebwRsXFye5cTj
         zPyso2sMeFG31OkMBinNVV6Z0ylpXDNOQil+1hL6VyiAHxpHGs2fxTUUzFcKhe9qhKCZ
         n++hxF/mQS0KOxPp8qHy4QiccW8Escb5E4On6U6PS0YV+xoMUMyOEcLn7DvzScPFk4DF
         qsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUopZfmCSIcBTf9dNfxjSVQGWXz4Q/O6mqYSAoBmR8Btd/xr9Q0uVZ29WuwN85Rzfi1YaX6w9LrV2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztBpuJybIzbycOGms7f1NqikwKrPWbvIPxp39lnVqB2Sli7HaQ
	tXGXsWm+TnpOLVndA581Vh5TcMzZJVFhwFOJPrsh3pAFWACAfq7iDrcY+O7mOCyF7qgSuA==
X-Google-Smtp-Source: AGHT+IEbuxsanqyADq8Deat2AYN/hrx0yHWhBh+K99NJ5NNzbtyXWGf28ibYOumK1/7kTAhssaq/BKmU
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6000:1948:b0:371:8d08:6302 with SMTP id
 ffacd0b85a97d-37cc2466282mr1755f8f.2.1727276552813; Wed, 25 Sep 2024 08:02:32
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:17 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=ardb@kernel.org;
 h=from:subject; bh=Gk3vl5lcNVlUG5WaXx6+kW7e4vi5Wc78FqbNjCEkOO8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pHFHOXq05/1nFnPcudQmJ7wpr7dLDufJIa/O8C5x
 Txd0oW5o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExENobhf+k7pXk1KeYh8xfa
 vazOipusdTSTNTQtS+jqxsxgKQvlywz/y0srlXSWbHHluXU+4voFET+GHMONjSy3U2vjQqX5RWI YAQ==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-47-ardb+git@google.com>
Subject: [RFC PATCH 17/28] x86/hibernate: Prefer RIP-relative accesses
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

Replace some absolute symbol references with RIP-relative ones, so we
don't need to fix them up at boot.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/power/hibernate_asm_64.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/power/hibernate_asm_64.S b/arch/x86/power/hibernate_asm_64.S
index 0a0539e1cc81..1d96a119d29d 100644
--- a/arch/x86/power/hibernate_asm_64.S
+++ b/arch/x86/power/hibernate_asm_64.S
@@ -39,7 +39,7 @@ SYM_FUNC_START(restore_registers)
 	movq	%rax, %cr4;  # turn PGE back on
 
 	/* We don't restore %rax, it must be 0 anyway */
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	pt_regs_sp(%rax), %rsp
 	movq	pt_regs_bp(%rax), %rbp
 	movq	pt_regs_si(%rax), %rsi
@@ -70,7 +70,7 @@ SYM_FUNC_START(restore_registers)
 SYM_FUNC_END(restore_registers)
 
 SYM_FUNC_START(swsusp_arch_suspend)
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	%rsp, pt_regs_sp(%rax)
 	movq	%rbp, pt_regs_bp(%rax)
 	movq	%rsi, pt_regs_si(%rax)
-- 
2.46.0.792.g87dc391469-goog



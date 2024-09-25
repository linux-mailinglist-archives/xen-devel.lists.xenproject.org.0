Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB129862A7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804128.1215146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj3-0001EZ-FH; Wed, 25 Sep 2024 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804128.1215146; Wed, 25 Sep 2024 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj2-0000vy-HC; Wed, 25 Sep 2024 15:14:44 +0000
Received: by outflank-mailman (input) for mailman id 804128;
 Wed, 25 Sep 2024 15:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUHm=QX=flex--ardb.bounces.google.com=3ASb0ZggKCVw4L75+ACNAIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@srs-se1.protection.inumbo.net>)
 id 1stTX9-0002UM-DT
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:27 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d3cb473-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:27 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6db7a8c6910so102659327b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:26 -0700 (PDT)
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
X-Inumbo-ID: 2d3cb473-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276546; x=1727881346; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=VPnRY32Mtyae7+f45FGGXIcq9WJ1V15y38o7AYk8G/gDTvWhrLwChDB/aW75CnwuSr
         dWGMHA0KvecQYVK8rW3OmP1L4iBgY0W89+xzmLOz6oZke99tCfiTHOoc4fqGa5DED0Kt
         M01CV/CU1DCq8QxjOj9NgsO4WbLyl59zCKoiLTXJ2qq0VeaCuTI+H1HvZ+ceTBU6KQ6Y
         uFDNChQ4P5ewhPNpiV2rDwxLeVjsgGyKH6iyI/ZLwxtNsh4KvTa9SXeU2IFE6KSTrryr
         jhn2XNjfDBCfyOBQh6dqKhAOH9sRaCOrP8Wh4CQH4Bcr4hjPmC9RcuFDTL0RL36kgRJq
         XRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276546; x=1727881346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=DOTXp333o6Iyv/Gm139DYHFZfkON+5gZhahBHlPhA3qProaAv39la/HMmL50qowz5K
         nb4vImO+S/AvCwihG5isuiEyzy4HL6tPOP+eaF5cQTlHqRYaGGubj/yxoVHug5VF9jOS
         YglBiIZn0EQFNmiDvQrmrolJXqABR8U7Uf1Qy8nDHu/cKxh6Eb8uoUz8ZSpJ+zCujCBJ
         wBxvJMCpwfuAJ50ptrWOxxZ7UuOCB0Zp4GP7BjXsfotLNfR23fd8q9m37fMytdtTCEZW
         tX6AxR3qp5Zx0+PdCrCG3Ld1FZt0QmOxS4bwig46zrrvbhmF5RfiOhvpC7biGhgz4sdi
         aGvg==
X-Forwarded-Encrypted: i=1; AJvYcCU596DNS2rVtbspHNdW+NH2lP/tD3CqdcQWYeDMTOly9d4+v7eYPkRJkSYHRhLxiW2kypeY/W+dDy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzibzm8KK7+zU0uPOS5A13uKNHhS3U2Pt82Tux78pd1y9k6RnVP
	RuohOOP+V1XdxQfINIBCUlNgNs1qqAj7Z/NDe7thl69Qu0YWfEONKlXjgS95KIK84KVG+Q==
X-Google-Smtp-Source: AGHT+IGW5+6XYu5evov+Dvb+HROZj8E6YTyxVVP1a7XWDg5djajQJxqHbA/Whb8+5/ewCu11GBBmm/SO
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:438d:b0:6b1:8b74:978a with SMTP id
 00721157ae682-6e21d9d4ae9mr51697b3.4.1727276545723; Wed, 25 Sep 2024 08:02:25
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:14 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=ardb@kernel.org;
 h=from:subject; bh=DJZDFnSYvzXqQFYRPN/gizuDfobz3ccWU866DGFdU/U=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6v7XV9cI3q9cJcJR8+Vf2+Fz2Wk/Dh/Y/X1ToOXyt
 a351cxsHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiXdsZGZaErou6cPCEcv22
 Prcpp+bqHWznepHA8X6Z9Zn/83etFNBlZOg9+zlgLqMlq/AX9n2rM647K2+Mmvyn9GzNS4f81qf fJ/EAAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-44-ardb+git@google.com>
Subject: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for return address
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

Instead of pushing an immediate absolute address, which is incompatible
with PIE codegen or linking, use a LEA instruction to take the address
into a register.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/rethook.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/rethook.c b/arch/x86/kernel/rethook.c
index 8a1c0111ae79..3b3c17ba3cd5 100644
--- a/arch/x86/kernel/rethook.c
+++ b/arch/x86/kernel/rethook.c
@@ -27,7 +27,8 @@ asm(
 #ifdef CONFIG_X86_64
 	ANNOTATE_NOENDBR	/* This is only jumped from ret instruction */
 	/* Push a fake return address to tell the unwinder it's a rethook. */
-	"	pushq $arch_rethook_trampoline\n"
+	"	leaq arch_rethook_trampoline(%rip), %rdi\n"
+	"	pushq %rdi\n"
 	UNWIND_HINT_FUNC
 	"       pushq $" __stringify(__KERNEL_DS) "\n"
 	/* Save the 'sp - 16', this will be fixed later. */
-- 
2.46.0.792.g87dc391469-goog



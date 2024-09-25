Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004E9862B3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804149.1215204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjF-0003fd-AH; Wed, 25 Sep 2024 15:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804149.1215204; Wed, 25 Sep 2024 15:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjD-0003BH-GG; Wed, 25 Sep 2024 15:14:55 +0000
Received: by outflank-mailman (input) for mailman id 804149;
 Wed, 25 Sep 2024 15:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juIg=QX=flex--ardb.bounces.google.com=3BCb0ZggKCV87OA8+DFQDLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@srs-se1.protection.inumbo.net>)
 id 1stTXB-0002UM-OP
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:29 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea307a7-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:29 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e21dcc7044so16151967b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:29 -0700 (PDT)
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
X-Inumbo-ID: 2ea307a7-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276548; x=1727881348; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApY23d/9zEIgxeEREKcGvRSADQZAXD1f0/BrlQ4mdDw=;
        b=EKAmJOjQ6+iTF9/E3EkTtDM4O2GcCl/CNK2kKU736G3mDSmjNrqvA7dKzyp3IyZtRn
         3PydrlMkirR9gWaIysw1kruP9uFeZH/JEDdpQoilD1Pld+iu8U2NVRnsnm6jAKdwLN17
         XXkiesbhhU+Jrq8lslabjVCoAnPN0M927ADZ7EhimVB4UH8M/3NN4X3B58foxIzV3JdM
         7IYzYAxzOKaQ4Pe45f7ZEaxatXeerBjPkGq3arEgodBuVHNQ/q4pUO+zrA/3l/wAVpZu
         6v67d5/1qpxeBmZ22gsE928VIgzdEibQ4IiBHSTHhDS2nvaEGpjScAwnBb8UJ2wqP6Bv
         l7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276548; x=1727881348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApY23d/9zEIgxeEREKcGvRSADQZAXD1f0/BrlQ4mdDw=;
        b=CCcyykQB9wf2rG53ANKaId45lD/7W1+1SeAkUfoqNSofEA5YLdjphEiS1NKPlh/+dK
         k6W9n35HndCZflAn3hFpZPudba3cHQg8cuuIfD17ZSdTgOCzVySTgqT1HbxtwCOqZ7GT
         +klzuwrc+RYb3HHvWjYq9fIBvF1wlzU5t0Q2c87VW9iRe7W4wCqdWf25Wu2GJ32Bwgyr
         edmOMi0HhwHc/no1jW0BDwCm0TBd1pPlsrQLUEf+xlfuvAvBR9lwqvbwgzhq5GzRY+8Z
         yncl8fG73XvGR1uEXB5hxP2ZzM7ibZMAI7IJkssFunnqO+wTr2jpNHsv0Lo6srTf2Vjr
         g1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXynMP9ii8ET86JXOQtyxHQTpZCuO5njUAU53xyBNZNejwoHc27kCuIdHaEgVfY13H0YA3PRM8iXLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdDckHbZguLsVtA/UXX/5PAMnLJIPgGp6bvkcCsT8oGemWvfJ4
	eAENVmgk+IHuYBwZWOBEfZ/x3vwlFnw3i18ghpl+jrBtfsd/wS/fVaaE4QeEqXHemqcnGA==
X-Google-Smtp-Source: AGHT+IG0+ryHhOjgZiIz9yF/upguc+H1WcXc9rbc3LtAhjefmA+cSn7SHizdSFamvUM2J9fCM9A9Vr3/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:d85:b0:6db:e107:75a2 with SMTP id
 00721157ae682-6e21da5c761mr429007b3.4.1727276548084; Wed, 25 Sep 2024
 08:02:28 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:15 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=ardb@kernel.org;
 h=from:subject; bh=MI3z3hAzDWNLGP+bB6WD9qNMTMv7yb8jTXTlUIfHWCE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6sHwPz3fHPWC8oK2RzHe5nszs/XmM4NX7P1ae3YFv
 bWd+fJLRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI/9UMfwVfxZ9hrm+9xvze
 6zfvw/cKoUe5Kv5w1pmKsYfxH/f4do3hf+75iD2ndC64zYjxsFPZpbpKIrxBk/fzstDCxW8eO9h OYgAA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-45-ardb+git@google.com>
Subject: [RFC PATCH 15/28] x86/sync_core: Use RIP-relative addressing
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

Use RIP-relative accesses and avoid fixups at runtime.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/sync_core.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sync_core.h b/arch/x86/include/asm/sync_core.h
index ab7382f92aff..cfd2f3bca83b 100644
--- a/arch/x86/include/asm/sync_core.h
+++ b/arch/x86/include/asm/sync_core.h
@@ -31,7 +31,8 @@ static inline void iret_to_self(void)
 		"pushfq\n\t"
 		"mov %%cs, %0\n\t"
 		"pushq %q0\n\t"
-		"pushq $1f\n\t"
+		"leaq 1f(%%rip), %q0\n\t"
+		"pushq %q0\n\t"
 		"iretq\n\t"
 		"1:"
 		: "=&r" (tmp), ASM_CALL_CONSTRAINT : : "cc", "memory");
-- 
2.46.0.792.g87dc391469-goog



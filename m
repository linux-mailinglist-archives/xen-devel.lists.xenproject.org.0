Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276B9862AB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804141.1215182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjA-0002fc-9U; Wed, 25 Sep 2024 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804141.1215182; Wed, 25 Sep 2024 15:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj8-00025M-Ns; Wed, 25 Sep 2024 15:14:50 +0000
Received: by outflank-mailman (input) for mailman id 804141;
 Wed, 25 Sep 2024 15:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wloc=QX=flex--ardb.bounces.google.com=3GSb0ZggKCXQSjVT+YalYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@srs-se1.protection.inumbo.net>)
 id 1stTXX-0002k3-Qq
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:51 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b257834-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:50 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6dbffbae597so115565287b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:50 -0700 (PDT)
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
X-Inumbo-ID: 3b257834-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276569; x=1727881369; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRXmTW/MqFQ5H7gO5V6pXIYv4aezSxVZvDN4lDSH+kA=;
        b=RjRXbaD0UrPuUl69kHn+8HUpGGmxM74QKSWkndr94lQjyJSS/BwPU6/2wq17/DPPBM
         xcZNAUnqSmB4wsy3PlHhP+9hAD3gmLhH5c1uZ1otVvPjJILgpQb+SRTPvuBhx5+u7QSG
         C1K3kj62JZSphhWR36GwH9AXFiYMouD2fxq6IYSnFTCaSrSTqRf7xvjnI4whMOkr56TJ
         j9/BDZmNqpnxO0yByFc+GAtqN2QL/pU6LV46V4GP/o1F7fNIEuuNOzxg8Oosn/k+uMq4
         90Miqf6SsEWtPboBp45nngJG7SbCT1TXC1EKc7l2LpnWbHJM6803Y8T4DER+yNNg3uIB
         HfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276569; x=1727881369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRXmTW/MqFQ5H7gO5V6pXIYv4aezSxVZvDN4lDSH+kA=;
        b=mBXYVm8/rLOa2UWi6gs66d0H0i+CcMqcaVLRRK9hbBgCvskovD4u1ZHe+fOiGlK6YN
         mRw3JR+rAvYW683B09IVVQIQpQKG/dbPt+eHcvBUIL/HzOHQwXom7CtUTBt9XsgUjZtL
         ubWYAtJvGpU91dbJ8EYYuxBJTOfLlcnWU/e6Ctg+Zpdi5A/sx2bv7yWLfu3NCdpexAJj
         BxnUBCKQSb7NaLM07PmcjizwtpzkqM3VA2vTyzQ2/JNTuemf8hdpuOVR8y1LOo9xmVUf
         J4dViCyi1Pq/2v1Q5e8n58jtB204vi29qyMH/j882Fjzvs0dhyuZaptfD2rU5WaAoUiQ
         EURw==
X-Forwarded-Encrypted: i=1; AJvYcCU0xlTdyMxwABZBOWyLj2n6DwksF5ipurw7C6MnOznKL/lrexsQ0qAiqN6d3zaLZvxOEXyN4O8MWWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTHsrBBw5aqpjQlGsptEEI0wpUfRiWjDlASgxYdVxVd+IGsjtx
	BuMKjKeUrWZRrhLRsXLSp8fZNPp9PTcWe0uGGu1LUIy1ZPU7R2202ASpWlbDCB1y8TEqmQ==
X-Google-Smtp-Source: AGHT+IEC1dPqUcAfKXMWGhZtWcpNQB40zyIE7CTDx8E05n1FmrMxkCCUsqBlLo74/YEl/S1/swIJOPiD
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:841:0:b0:e1d:7ce:4844 with SMTP id
 3f1490d57ef6-e24d7ee7f12mr17133276.4.1727276569059; Wed, 25 Sep 2024 08:02:49
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:23 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=ardb@kernel.org;
 h=from:subject; bh=AFLlY9eKyU6HJQ3jUUf7ewU02HHQByNyZjoPWXcfJAc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pkD1l1SMr9PdplxF72UMD0WHhu/+uT9iz8dfy0Km
 CzCpZrbUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbCVcjIsG+u8YbnfWsvLOy8
 8P/8g7N6wi1XH/y+rLV/v86EltfmLq8ZGR6dT3mnbCtQs96/+mLXk3mrOl5/49b4OFvBlCnX4bD oQm4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-53-ardb+git@google.com>
Subject: [RFC PATCH 23/28] tools/objtool: Mark generated sections as writable
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

objtool generates ELF sections such as __mcount_loc, which carry
absolute symbol references that need to be fixed up at boot time, based
on the actual virtual placement of the kernel binary.

This involves writing to the section at boot time, and in some cases
(e.g., when using --pie and -z text), the lld linker is more pedantic
about this, and complains about absolute relocations operating on
read-only sections.

None of this actually matters for vmlinux, which manages its own mapping
permissions, and so we can just set the SHF_WRITE flag on those sections
to make the linker happy.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..26a39b010c92 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1142,7 +1142,7 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 	sec->sh.sh_entsize = entsize;
 	sec->sh.sh_type = SHT_PROGBITS;
 	sec->sh.sh_addralign = 1;
-	sec->sh.sh_flags = SHF_ALLOC;
+	sec->sh.sh_flags = SHF_ALLOC | SHF_WRITE;
 
 	/* Add section name to .shstrtab (or .strtab for Clang) */
 	shstrtab = find_section_by_name(elf, ".shstrtab");
-- 
2.46.0.792.g87dc391469-goog



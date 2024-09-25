Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605D9862A9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804131.1215151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj4-0001TY-K3; Wed, 25 Sep 2024 15:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804131.1215151; Wed, 25 Sep 2024 15:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj3-0001DT-H3; Wed, 25 Sep 2024 15:14:45 +0000
Received: by outflank-mailman (input) for mailman id 804131;
 Wed, 25 Sep 2024 15:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1w1I=QX=flex--ardb.bounces.google.com=3Fib0ZggKCXEPgSQ+VXiVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@srs-se1.protection.inumbo.net>)
 id 1stTXV-0002k3-1B
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:49 +0000
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [2a00:1450:4864:20::44a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39ab8c52-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:47 +0200 (CEST)
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-37ccc99920dso235249f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:47 -0700 (PDT)
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
X-Inumbo-ID: 39ab8c52-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276567; x=1727881367; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNx8CgL2JjB1FACn8gZOCDgH3XlG/cZ7BMhQN82yM0M=;
        b=HGdsDOCS6/7pimoGP36sOPYpLchRkC6uM1XuL4PL2C52JxF4xGOEpbJxy4pB7MHD4S
         WbnTC3I4Nw6z2Vfy7fAl+qmXr84Mex+oGZIAHT5du3bwWG/2fRC6VSfv7Oim4mpKokzZ
         Ssdb28sxl4gKUZZ95Xq7V5GUj+AY+6eaV3HC1bSkKGSjGJoCvwsobCfVCAPuDEEsc2uA
         VXA3v3lUtreK6Nn+RCWKna0DUc0cxbHxjHP8vHW5fa2Zs7ku+BNXgIJTNj+i1mMPjNUl
         ROA+Ka7POsnllX6uBmAFJOqey+I6GnDrWdGfj2Dt1QNiSsu/TMzSEmYEnKGOl3kiutZy
         KERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276567; x=1727881367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNx8CgL2JjB1FACn8gZOCDgH3XlG/cZ7BMhQN82yM0M=;
        b=Orkvd6W022Ga5CljHSr9bz6kTHTWdG1ceKuXiqWou/GIzt5EARTLCntH9HLJwACRGr
         hWRO4BgxPgkW/beHs6bD7jJwKi4MOzqvwL91h4WGE+hyuoAcBC6vY6OaPQThk3RDR+mD
         XG07CvotTaZqnpNOsUSl2GJGb68dLSRz0qJvgiIAsetyqAbMK9wGtIdQUtYZvhZdAfw3
         xLqmTeK31M/DYCRScnBIn6Q8SNl5f0z+IfRZzHrRjznZCValf11SbGFcS20pxstWPo7a
         pB+W+814wa45wQWATEZPDxmdO9V5zSbaTdJe1XhDVjTVQlD+eBTf07ygvkQDuNb3m02I
         8Low==
X-Forwarded-Encrypted: i=1; AJvYcCUaDKYxCOSlGTng8eJahfFy80Jxf3/fjIXmbhFUZLkXkol5B7cj0Yy0xqfA6lKkK8SWG8xKHur+tLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzhbct48azb++cGSA8gX/ueTDlWedF+edQ/PakcQ1M5kgk7bKpu
	q/6NBJHYjYwjy4cYvtP1/qkPRam/dDv/mxyti8/JMdEiHQlBWNNqZmD9mgNR3XjG2FOuvw==
X-Google-Smtp-Source: AGHT+IHtZA65C9eNefhgBWqmYh0kGm6u7UMHidCQ+DZrqbEOemMqvMt90MEtVjIphkQcIFg1qUNObHvF
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:5e04:0:b0:37c:c51b:d07f with SMTP id
 ffacd0b85a97d-37cc51bd43bmr945f8f.9.1727276566478; Wed, 25 Sep 2024 08:02:46
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:22 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300; i=ardb@kernel.org;
 h=from:subject; bh=LZda20wnQiwQiTXt6tiHm30A1wODb0KBnxm/teE+Lu4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6unSO+7/NsayfzpQ7uW+6/sf035bm8SjMXouItt6v
 vsqNLN3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlUFzIyLClfembn6Wlfb79Z
 nLiyrmmade3VvmNH2xq0FwTP8FnOwsHwmyXhPONLDfu9MQfFQ+MyCsJWuy/VFOpa8t9x77FzLsv /8AAA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-52-ardb+git@google.com>
Subject: [RFC PATCH 22/28] asm-generic: Treat PIC .data.rel.ro sections as .rodata
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

When running the compiler in PIC/PIE mode, it will emit data objects
that are 'const' in the context of the program into the .data.rel.ro
section if they contain absolute addresses of statically allocated
global objects. This helps the dynamic loader distinguish between
objects that are truly const from objects that will need to be fixed up
by the loader before starting the program.

This is not a concern for the kernel, but it does mean those
.data.rel.ro input sections need to be handled. So treat them as
.rodata.

It also means some explicit uses of .rodata for global structures
containing absolute addresses need to be changed to .data.rel.ro to
prevent the linker from warning about incompatible section flags.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/asm-generic/vmlinux.lds.h       |  2 +-
 include/linux/compiler.h                |  2 +-
 scripts/kallsyms.c                      |  2 +-
 tools/objtool/check.c                   | 11 ++++++-----
 tools/objtool/include/objtool/special.h |  2 +-
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index cc14d780c70d..2b079f73820f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -456,7 +456,7 @@
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
 		__start_rodata = .;					\
-		*(.rodata) *(.rodata.*)					\
+		*(.rodata .rodata.* .data.rel.ro*)			\
 		SCHED_DATA						\
 		RO_AFTER_INIT_DATA	/* Read only after init */	\
 		. = ALIGN(8);						\
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ec55bcce4146..f7c48b7c0a6b 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -133,7 +133,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define annotate_unreachable() __annotate_unreachable(__COUNTER__)
 
 /* Annotate a C jump table to allow objtool to follow the code flow */
-#define __annotate_jump_table __section(".rodata..c_jump_table")
+#define __annotate_jump_table __section(".data.rel.ro.c_jump_table")
 
 #else /* !CONFIG_OBJTOOL */
 #define annotate_reachable()
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 9c34b9397872..1700e97400aa 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -357,7 +357,7 @@ static void write_src(void)
 	printf("#define ALGN .balign 4\n");
 	printf("#endif\n");
 
-	printf("\t.section .rodata, \"a\"\n");
+	printf("\t.section .data.rel.ro, \"a\"\n");
 
 	output_label("kallsyms_num_syms");
 	printf("\t.long\t%u\n", table_cnt);
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 01237d167223..04725bd83232 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2575,15 +2575,16 @@ static void mark_rodata(struct objtool_file *file)
 	 * Search for the following rodata sections, each of which can
 	 * potentially contain jump tables:
 	 *
-	 * - .rodata: can contain GCC switch tables
-	 * - .rodata.<func>: same, if -fdata-sections is being used
-	 * - .rodata..c_jump_table: contains C annotated jump tables
+	 * - .rodata .data.rel.ro		: can contain GCC switch tables
+	 * - .rodata.<func> .data.rel.ro.<func>	: same, if -fdata-sections is being used
+	 * - .data.rel.ro.c_jump_table		: contains C annotated jump tables
 	 *
 	 * .rodata.str1.* sections are ignored; they don't contain jump tables.
 	 */
 	for_each_sec(file, sec) {
-		if (!strncmp(sec->name, ".rodata", 7) &&
-		    !strstr(sec->name, ".str1.")) {
+		if ((!strncmp(sec->name, ".rodata", 7) &&
+		     !strstr(sec->name, ".str1.")) ||
+		    !strncmp(sec->name, ".data.rel.ro", 12)) {
 			sec->rodata = true;
 			found = true;
 		}
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 86d4af9c5aa9..89ee12b1a138 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -10,7 +10,7 @@
 #include <objtool/check.h>
 #include <objtool/elf.h>
 
-#define C_JUMP_TABLE_SECTION ".rodata..c_jump_table"
+#define C_JUMP_TABLE_SECTION ".data.rel.ro.c_jump_table"
 
 struct special_alt {
 	struct list_head list;
-- 
2.46.0.792.g87dc391469-goog



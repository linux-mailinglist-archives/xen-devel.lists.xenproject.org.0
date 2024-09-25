Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983189862AA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804137.1215170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj7-00027f-SE; Wed, 25 Sep 2024 15:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804137.1215170; Wed, 25 Sep 2024 15:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj6-0001p2-EP; Wed, 25 Sep 2024 15:14:48 +0000
Received: by outflank-mailman (input) for mailman id 804137;
 Wed, 25 Sep 2024 15:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sByw=QX=flex--ardb.bounces.google.com=3Gyb0ZggKCXYUlXV+acnaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@srs-se1.protection.inumbo.net>)
 id 1stTXZ-0002UM-9r
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:53 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c933c09-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:52 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6db7a8c6910so102668377b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:52 -0700 (PDT)
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
X-Inumbo-ID: 3c933c09-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276571; x=1727881371; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Siui3EQaHZbOP2Zf5u6bj1Z6F9xVc5htz8ViId7Yw=;
        b=UgQOwkIlTsd0WBE1LlF2Zrm2//t8ge8Bgz9/+aVGlFf6Zo+yAMX/YN0BUqP+oWM8HO
         XzA4La0jXuKXbLUaE0AlzTY5IUvCw7Mo03Hq/teG9VPKNEbGVl5LBVzZGN371oVm10/X
         qrdV39t/1lu2VqgSaM1UvjlK6YP6AGZqm08rzRm6Re2WAzBl2W+ANWkdZy0kD/1/Uj4B
         wW0rFWK84MrYFnTXC/uxnJa1KKbkUc8kWxsEa/fYJ9x8dP3QJstIs/+uDCBfuhYf3CRG
         AlFM10f7tJ1Hl+otrRWq0Y4uJAvRlR0cDn+Qp6D9cKe1NPHtl9m+uv+bw1tNhlDkD8aI
         cy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276571; x=1727881371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Siui3EQaHZbOP2Zf5u6bj1Z6F9xVc5htz8ViId7Yw=;
        b=wOT3B4bpc9ftAkbUHCZg4bPRkCISsOvcHqoUr/Hui1d8etcHkD0lpm2HxM+jNdgwPC
         DwZZkYoa+rUoFSQ9jm8Epf5SVdFhlwKk3b12ETcH0Cdso/v7bHJx20Vus06aPLM2xKGI
         7HuC/t5PndK6tc+F+dWSMvRRH090KY4hly0WUQvGJ4X2ZcHV7fJ3gPZwQMKktrOl7UQP
         RgVPAOebYd9CV/CYlgJ/JOtSyoX60+/6MxTCX9o1gAyONSaRupxgPCHRU3VSqv22deHz
         37L2vn63pjtpXDoBQv9LfCalSyCf3oolT6bvkTWhBCiQ20iSk8ELkQ/I9Fe4gM3ABH5w
         nXDA==
X-Forwarded-Encrypted: i=1; AJvYcCVsALQUbRkD0q3WAR/TNPPj8x44j5rjH2chx4oK4z9ocCXgqYDKOBDpE1KpksR/DLSqPwiDl1ZPLJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Ipvq0XHjL6mYqNzM00mO8QtD8LztYLfgeiVLYshiyN1WnI3J
	pHa6y/uFaKvHA2xBXboJo7QDkqzHzsxfF9Zo9+RmN8HGRq7fna2BQXAO8abd2sE3H74IGw==
X-Google-Smtp-Source: AGHT+IGUGK/IbClqwN6y6QvmI8hCfQn6s2hVSiVHB1d+dhN6jVJxxhzTiRxXUiYwgEqTcxKFspPDWKFo
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:f90:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e21d9f2676mr100587b3.5.1727276571410; Wed, 25 Sep 2024
 08:02:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:24 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=ardb@kernel.org;
 h=from:subject; bh=s5eg4POBUMz0+xutAa57cnb7wChxapKHTEsRfaj5xkM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6rmrbx/K9pd0n9poZ7rKarM71/pb64Mu3OE7WFCew
 +trFZHXUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYiIMfIsHzp8ptxntWap0qz
 /54LMvVhTo1RvbxcftLGA6VFgfY+Jxn+B/cyx9dHTT/wO+rQQaXszxPMFk1geHr9aqrVTv/NPxI dmAE=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-54-ardb+git@google.com>
Subject: [RFC PATCH 24/28] tools/objtool: Treat indirect ftrace calls as
 direct calls
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

In some cases, the compiler may rely on indirect calls using GOT slots
as memory operands to emit function calls. This leaves it up to the
linker to relax the call to a direct call if possible, i.e., if the
destination address is known at link time and in range, which may not be
the case when building shared libraries for user space.

On x86, this may happen when building in PIC mode with ftrace enabled,
and given that vmlinux is a fully linked binary, this relaxation is
always possible, and therefore mandatory per the x86_64 psABI.

This means that the indirect calls to __fentry__ that are observeable in
vmlinux.o will have been converted to direct calls in vmlinux, and can
be treated as such by objtool.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/check.c | 32 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 04725bd83232..94a56099e22d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1696,11 +1696,39 @@ static int add_call_destinations(struct objtool_file *file)
 	struct reloc *reloc;
 
 	for_each_insn(file, insn) {
-		if (insn->type != INSN_CALL)
+		if (insn->type != INSN_CALL &&
+		    insn->type != INSN_CALL_DYNAMIC)
 			continue;
 
 		reloc = insn_reloc(file, insn);
-		if (!reloc) {
+		if (insn->type == INSN_CALL_DYNAMIC) {
+			if (!reloc)
+				continue;
+
+			/*
+			 * GCC 13 and older on x86 will always emit the call to
+			 * __fentry__ using a relaxable GOT-based symbol
+			 * reference when operating in PIC mode, i.e.,
+			 *
+			 *   call   *0x0(%rip)
+			 *             R_X86_64_GOTPCRELX  __fentry__-0x4
+			 *
+			 * where it is left up to the linker to relax this into
+			 *
+			 *   call   __fentry__
+			 *   nop
+			 *
+			 * if __fentry__ turns out to be DSO local, which is
+			 * always the case for vmlinux. Given that this
+			 * relaxation is mandatory per the x86_64 psABI, these
+			 * calls can simply be treated as direct calls.
+			 */
+			if (arch_ftrace_match(reloc->sym->name)) {
+				insn->type = INSN_CALL;
+				add_call_dest(file, insn, reloc->sym, false);
+			}
+
+		} else if (!reloc) {
 			dest_off = arch_jump_destination(insn);
 			dest = find_call_destination(insn->sec, dest_off);
 
-- 
2.46.0.792.g87dc391469-goog



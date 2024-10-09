Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AA9970A4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814891.1228626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFV-0005di-U3; Wed, 09 Oct 2024 16:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814891.1228626; Wed, 09 Oct 2024 16:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFV-0005WI-OY; Wed, 09 Oct 2024 16:09:17 +0000
Received: by outflank-mailman (input) for mailman id 814891;
 Wed, 09 Oct 2024 16:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuLI=RF=flex--ardb.bounces.google.com=3q6oGZwgKCVo2J53+8AL8GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1syZFV-0004OJ-11
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:17 +0000
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com
 [2a00:1450:4864:20::34a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50a3166-8658-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:09:16 +0200 (CEST)
Received: by mail-wm1-x34a.google.com with SMTP id
 5b1f17b1804b1-4311412e042so3823525e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:16 -0700 (PDT)
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
X-Inumbo-ID: d50a3166-8658-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490156; x=1729094956; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HupRAXXBqO2c8knr9kCujOHZqjOYFZu7/+ot2dyBYgU=;
        b=04A3D0bNyaFC+Qrueo/Mhjc7Vo2/Pv9J6mrrYjX3/5SUd9wh2typobO32bibuoTogG
         t3T+396EWYiqUcopWL/4mwdUfSwt9bgWZtsR6baOJaHOVgPFO4xogIl8wJAn/lGtPhC1
         Os52S9kubnvX3fYb41HdyOBP8EvBpP/lrQq6K0SIyE7IqcYhGMd7dSGPtJ+N4DhFu51B
         93Ro/6l3jj3sH7zDZRTEpa9swMNzx0HbKBsfy/ZYJCbtmOtWk4l3vAyvuCa2nvRil8S5
         MPN7EO3jfm56HD+IKzKlG2IQzv49ALYAQUqZv9Zil7RzYiSEO9VniPGsRUhUmFPHGR6c
         lAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490156; x=1729094956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HupRAXXBqO2c8knr9kCujOHZqjOYFZu7/+ot2dyBYgU=;
        b=VjQQ9S8eLccSBAt8pFNOEs1kZHCkHV7FU86ncwBLDvym0XHOo5rriqTTI8Ef6o5BKb
         4MAW0SwgWlvJTup99WWKeX3XqF+//p2kS2EJMrSsDsLS+JrjCRzGeDjUcIXhBG30uRNT
         C2t+tuo7BQIJa///it1aTp+nTYTLB7g4dNEtTCbvYa2Xzqty/CJCbBYAxyBndEdWHmJS
         7RVinfWnk+n3c5Th9UIYXNSbzr1dAhmLHPxZexzZdnNzwVo4hJfKxv0rpxXosrH6ExoG
         sD+qeSKefZbM86LVzzdUBiXFGHGXhVTzb3D4W9sc4ChiG5OM/WouIUtFVH+V38VxmeSj
         q16A==
X-Forwarded-Encrypted: i=1; AJvYcCVaYZz7dOF6WNw2OkTdwJxXsX12MMLU5RfbJdhi7BiMLaIDm/p/AdYL3icB8arTXFumOeGy4G74uno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHxoUBztzcjSuWf6k9uXHHGNtxHVJaXRwlRTFvD1Km4y/PPiII
	JPsmktcsl0Od51XpbGCd2Z3gavXZ9evQfc5LBwG5buBixcBdn1zwdXFescLyiZHeJoyybw==
X-Google-Smtp-Source: AGHT+IF0eoXWAHq3au8yX0LdvnbgYQERBk447P9771B7f8cbOEk+/t/HPey2CQbVWfl9cygw+xLeM33/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:331b:b0:426:67e0:3b2 with SMTP id
 5b1f17b1804b1-430ccefabddmr20795e9.1.1728490155371; Wed, 09 Oct 2024 09:09:15
 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:44 +0200
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518; i=ardb@kernel.org;
 h=from:subject; bh=6GoieogoUAEj17Av6HLsT2CSmywAr8csNjqtL7xNpKA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5TzXWXXdV5/qr9v97+vxsDkHP999MSFXzvk3C9cBl
 rO2X9o8O0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEZl1iZHghPLHULP3cMp+6
 cz9NT5ow3TPcfrzua0qmU4Dg27SDJ48z/E84sEs74ejfB2lTLTI6z0zttAue3telfDGjOslWYfl nez4A
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-12-ardb+git@google.com>
Subject: [PATCH v3 5/5] x86/pvh: Avoid absolute symbol references in .head.text
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The .head.text section contains code that may execute from a different
address than it was linked at. This is fragile, given that the x86 ABI
can refer to global symbols via absolute or relative references, and the
toolchain assumes that these are interchangeable, which they are not in
this particular case.

For this reason, all absolute symbol references are being removed from
code that is emitted into .head.text. Subsequently, build time
validation may be added that ensures that no absolute ELF relocations
exist at all in that ELF section.

In the case of the PVH code, the absolute references are in 32-bit code,
which gets emitted with R_X86_64_32 relocations, and these are even more
problematic going forward, as it prevents running the linker in PIE
mode.

So update the 64-bit code to avoid _pa(), and to only rely on relative
symbol references: these are always 32-bits wide, even in 64-bit code,
and are resolved by the linker at build time.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 30 ++++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index e6f39d77f0b4..4733a5f467b8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -6,7 +6,9 @@
 
 	.code32
 	.text
+#ifdef CONFIG_X86_32
 #define _pa(x)          ((x) - __START_KERNEL_map)
+#endif
 #define rva(x)          ((x) - pvh_start_xen)
 
 #include <linux/elfnote.h>
@@ -72,8 +74,7 @@ SYM_CODE_START(pvh_start_xen)
 	movl $0, %esp
 
 	leal rva(gdt)(%ebp), %eax
-	leal rva(gdt_start)(%ebp), %ecx
-	movl %ecx, 2(%eax)
+	addl %eax, 2(%eax)
 	lgdt (%eax)
 
 	mov $PVH_DS_SEL,%eax
@@ -103,10 +104,23 @@ SYM_CODE_START(pvh_start_xen)
 	btsl $_EFER_LME, %eax
 	wrmsr
 
+	/*
+	 * Reuse the non-relocatable symbol emitted for the ELF note to
+	 * subtract the build time physical address of pvh_start_xen() from
+	 * its actual runtime address, without relying on absolute 32-bit ELF
+	 * relocations, as these are not supported by the linker when running
+	 * in -pie mode, and should be avoided in .head.text in general.
+	 */
 	mov %ebp, %ebx
-	subl $_pa(pvh_start_xen), %ebx /* offset */
+	subl rva(xen_elfnote_phys32_entry)(%ebp), %ebx
 	jz .Lpagetable_done
 
+	/*
+	 * Store the resulting load offset in phys_base.  __pa() needs
+	 * phys_base set to calculate the hypercall page in xen_pvh_init().
+	 */
+	movl %ebx, rva(phys_base)(%ebp)
+
 	/* Fixup page-tables for relocation. */
 	leal rva(pvh_init_top_pgt)(%ebp), %edi
 	movl $PTRS_PER_PGD, %ecx
@@ -165,14 +179,6 @@ SYM_CODE_START(pvh_start_xen)
 	xor %edx, %edx
 	wrmsr
 
-	/*
-	 * Calculate load offset and store in phys_base.  __pa() needs
-	 * phys_base set to calculate the hypercall page in xen_pvh_init().
-	 */
-	movq %rbp, %rbx
-	subq $_pa(pvh_start_xen), %rbx
-	movq %rbx, phys_base(%rip)
-
 	/* Call xen_prepare_pvh() via the kernel virtual mapping */
 	leaq xen_prepare_pvh(%rip), %rax
 	subq phys_base(%rip), %rax
@@ -218,7 +224,7 @@ SYM_CODE_END(pvh_start_xen)
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
 	.word gdt_end - gdt_start - 1
-	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
+	.long gdt_start - gdt
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
-- 
2.47.0.rc0.187.ge670bccf7e-goog



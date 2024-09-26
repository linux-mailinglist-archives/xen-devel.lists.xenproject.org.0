Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57D9871C6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805307.1216406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwk-00050n-En; Thu, 26 Sep 2024 10:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805307.1216406; Thu, 26 Sep 2024 10:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwk-0004wz-8H; Thu, 26 Sep 2024 10:42:06 +0000
Received: by outflank-mailman (input) for mailman id 805307;
 Thu, 26 Sep 2024 10:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2/P=QY=flex--ardb.bounces.google.com=3eTr1ZggKCQIctfd+ikviqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1stlwi-0003NZ-K2
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:42:04 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f706624b-7bf3-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:42:03 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e2261adfdeso4169447b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:42:02 -0700 (PDT)
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
X-Inumbo-ID: f706624b-7bf3-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347322; x=1727952122; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQvQh3ouoZ2SzJYUdvKa6rkKBNpFrAMDmjZmjc8fkmc=;
        b=ANPjzwKjmGcQLd2kTwoxepe1d9f7J432BKdRXqah5kcqTx6CzWC/WcFeYSUNuk5KM1
         YNZib2GxHsdnqKNGDBPHdjgpCWU9twGDMzCwPAeMVgfBPUEmXsmW+CcG3yNNFXMq1NhK
         /ZK5f5ZwElaTtNlJ7ynlJYdPK5pe7NJ6QdgC1HkiEuQlrHGrvppJUtZZnibsiXibOUd9
         ayIfKCXeq9bRy7GQg8UkveU593B97x8zNHWqAMwsKVF5aAxNd+FEY1vZFIq2n8yWH8EQ
         NnpGzPUrNNCN2w1/Ug9yyL4KrtAI85+Mvg1jYZFf4TZqLYKjTqQjvo2hHtSpCdIVFTwW
         AH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347322; x=1727952122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQvQh3ouoZ2SzJYUdvKa6rkKBNpFrAMDmjZmjc8fkmc=;
        b=Fovv3H3gTcMF6gGkyeuGMLq3K1WDshm2DX7VFYepCq9aNwc4u/Jp01u/88fRqOWMlQ
         yy3mOpH3RNRILgN5noz5t21W5gB9GpjTG8R2jUqAkZJk/YzgsvcYp4XuJ3i7HSnMH3PJ
         ZGgllejf3gyQfJvvTkWeRU1tJhl/wUpG1HBu2jFPcU1thie2Wp6c+8oUYayOKEF4V+a2
         dnZGGV5av9AugexwgtxLWVnPXbreHMmmZg7SefQtHRjyBQOXwD7k9xu+39SVRBJfC1aH
         JSVL2o3woLiFVqAXcAqa/Wh1GOcNxnoO65eR6IGzsHnYY3xbzeDMnrbljZ8Zzbcu9OfE
         gOFw==
X-Forwarded-Encrypted: i=1; AJvYcCVgR4OB+DsZ+pBb/vvzNvFwOW4BRwRLhrLz1pNpraYqtJl2Rv7ea32KFNftO5z1ZhqNr2PZKc8eeLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy01+qLWjnqsNG99fTyyHkzh7f00AOlDHd05gD4gC7jFH4hlakH
	SpvPKkxzYlx+9QMek2ZrqICGkG+731wFYz8gUOnBrr+dbooef3g959Sm+hWruBrrroYt/A==
X-Google-Smtp-Source: AGHT+IED/HqLFtACdNSCzdIAMjiljzdhHUspe8O6E5X9FAgkcVHwbKoR9oANRkary8b012uJsnNNw6L8
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:f90:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e21d9f2676mr435227b3.5.1727347321787; Thu, 26 Sep 2024
 03:42:01 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:19 +0200
In-Reply-To: <20240926104113.80146-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415; i=ardb@kernel.org;
 h=from:subject; bh=x+U+qNnjscbrHmx6YcgJLNHMT4vROYkFANObHeQgRKE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rVaBDx855y79etX3zniOruepu3tutT/4kaaac3H/9q
 VdHYvucjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRJfGMDLPeRdoFyOhyOd2c
 ffqUd8zxMz2p+foPmpSu3uKavKRtKQ8jw34thinbRFa/qD6buU/y9AuTvefMZK90ymw9clHjOvd cYw4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-12-ardb+git@google.com>
Subject: [PATCH 5/5] x86/pvh: Avoid absolute symbol references in .head.text
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
which get emitted with R_X86_64_32 relocations, and these are even more
problematic going forward, as it prevents running the linker in PIE
mode.

So update the 64-bit code to avoid _pa(), and to only rely on relative
symbol references: these are always 32-bits wide, even in 64-bit code,
and are resolved by the linker at build time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 30 ++++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index e2ab4c74f596..b2742259ed60 100644
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
 	addq $__START_KERNEL_map, %rax
@@ -217,7 +223,7 @@ SYM_CODE_END(pvh_start_xen)
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
 	.word gdt_end - gdt_start - 1
-	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
+	.long gdt_start - gdt
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
-- 
2.46.0.792.g87dc391469-goog



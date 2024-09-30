Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF5989B25
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807026.1218226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAdB-0000gS-Fj; Mon, 30 Sep 2024 07:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807026.1218226; Mon, 30 Sep 2024 07:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAdB-0000dt-Af; Mon, 30 Sep 2024 07:15:41 +0000
Received: by outflank-mailman (input) for mailman id 807026;
 Mon, 30 Sep 2024 07:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caOs=Q4=flex--ardb.bounces.google.com=3GVD6ZggKCeACTFD+IKVIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@srs-se1.protection.inumbo.net>)
 id 1svAdA-0007Ms-5i
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:40 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf6518b-7efb-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:15:38 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e25d494faa4so4172309276.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:38 -0700 (PDT)
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
X-Inumbo-ID: caf6518b-7efb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680537; x=1728285337; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CFvtg1tsmmc7nnsyP1PbKrXmu+3EkOxGHWY/dTtKRQ=;
        b=2IngiC6a3qv9Wa9UpBDvkt0EccAfduBBcicBePh1dPHdhyp9q3YTjBJEuZJzg8V1QG
         JKEOMYO2oTckGUR/qmvoBpyeCoeGy43q5LeNexGyyC7AdPQ0OS0oKmUqi71iClvnsyLH
         xOmZNoRjdZtI97jZCATNYfzLy4hdEPTFqSJK5PdYE/Kb+z0cFYhDZZoAxGdARGz7pvuq
         QTygFhbYEtD5j/e1vC5u2+7Hm3XBcZiHWgg0OPs75QKu5s553b6VPQ/NcUD19HsoT25y
         E5Gf8apGLnWj5LUMaoo6Auy23bAWBWWGDwDFyz0E2KMt8Xu2UF3VjKNyYKwRT3cx4xDt
         mRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680537; x=1728285337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CFvtg1tsmmc7nnsyP1PbKrXmu+3EkOxGHWY/dTtKRQ=;
        b=wE5yeOTKbnJzrfEhOy6XBCrkuSY+1+Cl4waszKgxxcJ0yQ8c4pHeTjulB+9v1dLoru
         I+EC3IrnjVDtP10LqZX7fBzyJtHWMygdfY3BH3dusdRVAKhNHji5oUfGLYqodE3ZsYjN
         oFaJtyI76JKdeZzNpq1mZGQ/+nd0BnDScRBlJmoKo1eS1wBI11y7fIEy7N0lyd3H5JEa
         XriUB2xGHACc0ZTl7ufNsXE8vKgb7MVC4cRi8nZzdNj5tUlCe6P9G0o3x6kSooYGiMQv
         8Y5vFGrwBtic1gRJ/vLAdzLd1LHlJHvuceKA47t/rEBU5PqrCMUFT+3dDjOdE5G5Q5L2
         LHmg==
X-Forwarded-Encrypted: i=1; AJvYcCVihqMktqjZooP5/d51FW5bBjQLZztAirGJG9IBNIA//VI0U7XDvixoc8r0UsVFHjP1xJaOodbFkD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2GnoS1VZSpKqjGNU2heT97kSacVL0buDUj8rfWiUG245ZL96d
	jVyxqVDiMEN3NyA2fRTG4f4qtbRtenpCz3Ir6f+SSEi0TNToMnbPkrLgtmk6s92KwyQuEw==
X-Google-Smtp-Source: AGHT+IFA41+aY1vjA3qRLYDvZ5y36Ykxv072kp8hE6GaWoKZfJQ0OURO8Mgln/pCtspPyxRtv5RBaV37
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:b2a5:0:b0:e20:1596:87b8 with SMTP id
 3f1490d57ef6-e2604c96b81mr122133276.11.1727680537310; Mon, 30 Sep 2024
 00:15:37 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:19 +0200
In-Reply-To: <20240930071513.909462-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=ardb@kernel.org;
 h=from:subject; bh=egKJbcLb5hGkTqo8SwRF/Pu4TXJQbEy7JOjiJJa0ERg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XAEestNQGk6l50lmPs5eufzv/6Lmly76atGQ+v9Td+
 ewGZyprRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiI/HmG/+4pHxsFSpvWz+3h
 OKl79PF2Vud3V+eaLVi24Y1424yTaUsYGXatXdDioZAscT/1TO/jQ6Gq9w1elZ7/7bfv2KxbgaU /y1gB
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-12-ardb+git@google.com>
Subject: [PATCH v2 5/5] x86/pvh: Avoid absolute symbol references in .head.text
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
index 2b0d887e0872..cf89b2385c5a 100644
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
2.46.1.824.gd892dcdcdd-goog



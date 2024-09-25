Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B099862A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804114.1215133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj1-0000xK-V4; Wed, 25 Sep 2024 15:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804114.1215133; Wed, 25 Sep 2024 15:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTj1-0000jW-2s; Wed, 25 Sep 2024 15:14:43 +0000
Received: by outflank-mailman (input) for mailman id 804114;
 Wed, 25 Sep 2024 15:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COxo=QX=flex--ardb.bounces.google.com=3DSb0ZggKCWgGXJH+MOZMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@srs-se1.protection.inumbo.net>)
 id 1stTXM-0002k3-PX
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:40 +0000
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [2a00:1450:4864:20::349])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34cc82ba-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:39 +0200 (CEST)
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-42cb635b108so47819195e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:39 -0700 (PDT)
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
X-Inumbo-ID: 34cc82ba-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276558; x=1727881358; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=If2fzGYCGwBnqYyJZ9PtA7MpTD5EDRXIER0Mmi+qoTw=;
        b=4duf2rx+4+wj9+GEpPTwgq1hy3z60mUaMNinpjtGqfgT969v/PzUR8u/V304HrAUdo
         YBWR4z0BLdulvLefF1T4+wgEiOmF7ycDboiDT2Q0r7fagM+z4Ku7bk6C15TOO4cHEVna
         kNUfR14EocF1MTv52D5xfvdKTF7Rvorwkruvcef1/JT5y32Qsz0ck5GjqGl3d8vIPHuC
         lQCyJIhfWhNvqjroJBA8Vp/bjSV7bK7fuUjRfTjxiPPIgJKXyoUlzujEsrwh06TE3LUO
         M3yjee5V74PguVGKhQE/wHXm/Pif4n8zwDbCFJh1EtwaCWmYt3cf7EYPukSDuRYrrVWU
         zARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276558; x=1727881358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=If2fzGYCGwBnqYyJZ9PtA7MpTD5EDRXIER0Mmi+qoTw=;
        b=xNHIi+ZRYPf1kIRBuf0j7fgxjkJD6oH+ZBKBRaML24vpebqV2Ot4fI5ZZfXodDMAwb
         8AsdxSFky+GwoOwHB+yUs1zHKBbb2++72cqfUMheMvrc+440T5RGL1SEktys/upNkvIR
         D82XPBeEIOBDG2nlONc+dzN6Ir5p/tQyfh09XxO2toNid15dcVxBWQ+8R7najbK2+SYh
         +0La+8DEeMq4iF22tSNASNito+mxGCd2KSU15OjMb8f/Vc10E4owTnlf3D7mD2OkDpm1
         Dx27KpejFbHHl03Qg+bx5JnS1VWlfaFxg/tMQMxXupah4Mtl13JoYKjHabCSwk/jFG58
         ePLA==
X-Forwarded-Encrypted: i=1; AJvYcCUo3U2G3/QuNKeXE00YAh4lXgfsr/CW+8vRaOnE6NN4UkMDmS/2xX4jcUvdbdPvr/w4PFt+PnfXhNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8APCcG/dF4cbI8wvEN4Ag4xAPXz2EpN06lIYA4m4i+5FRljjA
	IgVDB6ceIJM3cbuZJskzNwVG8CFvNL02udYl5RUoKlBUaLwhcSVBbLw+NXxMG/ENsjSFGA==
X-Google-Smtp-Source: AGHT+IGkF5zmfUWW4O6+9JFmmh7xBD2vdGsjZEUVC3p8TPU+fzBQ5QlHTxnNWj2zBWn7gVrNU3EsN2Rx
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:5547:0:b0:378:89be:1826 with SMTP id
 ffacd0b85a97d-37cc2473cc2mr1714f8f.4.1727276557999; Wed, 25 Sep 2024 08:02:37
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:19 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681; i=ardb@kernel.org;
 h=from:subject; bh=1WKyFOMOSweUVoFxWBVIeZQGadqaqXWeT1GGGyj8jAA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6jGPaQaG+1hu3Z0QvW9R+99QHb2J68ydL88WzUpdH
 Hf1+4blHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiex8y/GZ5P9H2XQc705Yd
 pyrK5txZNU1B4+0LjklBfTe9r2ed6mlhZNiZU/rz52b9K88lGacbreAU2ufVkfLX5bhxnpO8ivb mR0wA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-49-ardb+git@google.com>
Subject: [RFC PATCH 19/28] x86/boot/64: Avoid intentional absolute symbol
 references in .head.text
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

The code in .head.text executes from a 1:1 mapping and cannot generally
refer to global variables using their kernel virtual addresses. However,
there are some occurrences of such references that are valid: the kernel
virtual addresses of _text and _end are needed to populate the page
tables correctly, and some other section markers are used in a similar
way.

To avoid the need for making exceptions to the rule that .head.text must
not contain any absolute symbol references, derive these addresses from
the RIP-relative 1:1 mapped physical addresses, which can be safely
determined using RIP_REL_REF().

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 30 ++++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index de33ac34773c..49e8ba1c0d34 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -91,9 +91,11 @@ static inline bool check_la57_support(void)
 	return true;
 }
 
-static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdval_t *pmd)
+static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
+						    pmdval_t *pmd,
+						    unsigned long p2v_offset)
 {
-	unsigned long vaddr, vaddr_end;
+	unsigned long paddr, paddr_end;
 	int i;
 
 	/* Encrypt the kernel and related (if SME is active) */
@@ -106,10 +108,10 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
 	 * attribute.
 	 */
 	if (sme_get_me_mask()) {
-		vaddr = (unsigned long)__start_bss_decrypted;
-		vaddr_end = (unsigned long)__end_bss_decrypted;
+		paddr = (unsigned long)&RIP_REL_REF(__start_bss_decrypted);
+		paddr_end = (unsigned long)&RIP_REL_REF(__end_bss_decrypted);
 
-		for (; vaddr < vaddr_end; vaddr += PMD_SIZE) {
+		for (; paddr < paddr_end; paddr += PMD_SIZE) {
 			/*
 			 * On SNP, transition the page to shared in the RMP table so that
 			 * it is consistent with the page table attribute change.
@@ -118,11 +120,11 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
 			 * mapping (kernel .text). PVALIDATE, by way of
 			 * early_snp_set_memory_shared(), requires a valid virtual
 			 * address but the kernel is currently running off of the identity
-			 * mapping so use __pa() to get a *currently* valid virtual address.
+			 * mapping so use the PA to get a *currently* valid virtual address.
 			 */
-			early_snp_set_memory_shared(__pa(vaddr), __pa(vaddr), PTRS_PER_PMD);
+			early_snp_set_memory_shared(paddr, paddr, PTRS_PER_PMD);
 
-			i = pmd_index(vaddr);
+			i = pmd_index(paddr - p2v_offset);
 			pmd[i] -= sme_get_me_mask();
 		}
 	}
@@ -146,6 +148,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 {
 	pmd_t (*early_pgts)[PTRS_PER_PMD] = RIP_REL_REF(early_dynamic_pgts);
 	unsigned long physaddr = (unsigned long)&RIP_REL_REF(_text);
+	unsigned long va_text, va_end;
 	unsigned long pgtable_flags;
 	unsigned long load_delta;
 	pgdval_t *pgd;
@@ -172,6 +175,9 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	if (load_delta & ~PMD_MASK)
 		for (;;);
 
+	va_text = physaddr - p2v_offset;
+	va_end  = (unsigned long)&RIP_REL_REF(_end) - p2v_offset;
+
 	/* Include the SME encryption mask in the fixup value */
 	load_delta += sme_get_me_mask();
 
@@ -232,7 +238,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	pmd_entry += sme_get_me_mask();
 	pmd_entry +=  physaddr;
 
-	for (i = 0; i < DIV_ROUND_UP(_end - _text, PMD_SIZE); i++) {
+	for (i = 0; i < DIV_ROUND_UP(va_end - va_text, PMD_SIZE); i++) {
 		int idx = i + (physaddr >> PMD_SHIFT);
 
 		pmd[idx % PTRS_PER_PMD] = pmd_entry + i * PMD_SIZE;
@@ -257,11 +263,11 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	pmd = &RIP_REL_REF(level2_kernel_pgt)->pmd;
 
 	/* invalidate pages before the kernel image */
-	for (i = 0; i < pmd_index((unsigned long)_text); i++)
+	for (i = 0; i < pmd_index(va_text); i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
 	/* fixup pages that are part of the kernel image */
-	for (; i <= pmd_index((unsigned long)_end); i++)
+	for (; i <= pmd_index(va_end); i++)
 		if (pmd[i] & _PAGE_PRESENT)
 			pmd[i] += load_delta;
 
@@ -269,7 +275,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	for (; i < PTRS_PER_PMD; i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
-	return sme_postprocess_startup(bp, pmd);
+	return sme_postprocess_startup(bp, pmd, p2v_offset);
 }
 
 /* Wipe all early page tables except for the kernel symbol map */
-- 
2.46.0.792.g87dc391469-goog



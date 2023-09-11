Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE679AAEF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 20:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599748.935300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfm8J-00069l-Iy; Mon, 11 Sep 2023 18:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599748.935300; Mon, 11 Sep 2023 18:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfm8J-000672-Ft; Mon, 11 Sep 2023 18:59:39 +0000
Received: by outflank-mailman (input) for mailman id 599748;
 Mon, 11 Sep 2023 18:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7n0b=E3=flex--justinstitt.bounces.google.com=3l2P_ZAsKCYox867w167w77u22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@srs-se1.protection.inumbo.net>)
 id 1qfm8H-00066U-Ni
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 18:59:37 +0000
Received: from mail-oa1-x49.google.com (mail-oa1-x49.google.com
 [2001:4860:4864:20::49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f46c23-50d5-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 20:59:37 +0200 (CEST)
Received: by mail-oa1-x49.google.com with SMTP id
 586e51a60fabf-1d5aa672aa4so2105635fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 11:59:37 -0700 (PDT)
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
X-Inumbo-ID: 59f46c23-50d5-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694458776; x=1695063576; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FyAfsddzgMfH7Rve3tTC+ObTn5S/B+6cd6RfEH0mPVQ=;
        b=oAvtgxZjTzfWygSULBgUZz2swB7w5r+IKiFwMgIT63IsOX4g7F1GM8xuiqQqUZVQ/N
         H3uapaZAl2VargTD4W0MezWR8ibwN4XLL8rp81hSqXBQITJD3Wq7NWLH7/npB4bF7m+H
         Xh4Wtxognl2kjbXYkXw6wX3eF3S7p26ZAyXkkAVGp/GGUqp3j5xzyR3MethRh1GS+6My
         Nf3k+sAaDiAWS/EWweVU/J+vUlDJ/QEIu+X8c8QIU3T4ESGLhpcrSlItHAyBBv8etnar
         f2Ymm1EfEQbkrn7340PgmaYka/g1JcczdF+5nSTdC7D1Zm/6dorKfAv79+lcLunHTVo4
         9DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694458776; x=1695063576;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyAfsddzgMfH7Rve3tTC+ObTn5S/B+6cd6RfEH0mPVQ=;
        b=NWNME4o1vROEs+IFtLUy/FVfvb9PR/5219W9p4Mr1qRVzheKf5fsG2Vu5urGIFViQT
         v8qzMHcodF6o8iCgZ8wZyMq4LtZ4ChwvUil3wW0uFy3x5csMcqCXp1gmMmG7pWNdTf2T
         0rojtizAfbrjBb1yIH1TJBHuLhvCqY0I/Hr9B2LhLtDrAZ9gnbhdzZ67oeoYPjrvhWCg
         qpgK1gSH0IfyUs4ekuLVf8IU3WuTmy+He+RzNF0+lzDrN79zijcDP+iT3yP4/h051XT1
         7XaKtx1NVwBHZDqvo1nLrqf/X0OGMwfF8sHF2SBOhtDE0o9mhLxGG7Spg+PUDvITpL8e
         wa8Q==
X-Gm-Message-State: AOJu0Ywf0xZGaJAzu/TJrfaVcl3Yv6soRXMAHbiIFOuRCDQmT+Lpi5jh
	KbwXni+0BHHCV0+6qV99hajocuJBM26WahQ0BA==
X-Google-Smtp-Source: AGHT+IG59wr8uLni3C2V55r07TIhyuDid4iDz2o8Yv9hT/IRZPvGxl55SBxndfL1I8UCe+ixrBA6mOeCDnFrXvY09g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:9e86:b0:1d5:95fc:2a65 with
 SMTP id pu6-20020a0568709e8600b001d595fc2a65mr148856oab.0.1694458775855; Mon,
 11 Sep 2023 11:59:35 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:59:31 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJj/2QC/x3MPQqAMAxA4atIZgO2/tariEOpUbNUSUUqxbtbH
 L83vASBhCnAWCQQujnw4TNUWYDbrd8IeckGXem6MkphuMS780Erbsc4dBjJI62MDlWjjV5b2xs iyINTco//fJrf9wMst+a9bAAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458775; l=1828;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=DBdVSubynrF3pAFkkMi1f9BTT60ciWDcbq2SU5EuRBg=; b=CYAmwiK7CDP7Z4adgOTjVKLEq7h3INeqRHS6jvpRLX93AfrV+Q2Ca6uptviT7Eq/HPolQcYba
 0Nfvn1OstRHDSyzQLfFZDyLtDKOqlDinW0kE1WVe67cXgmYQQVy+vkC
X-Mailer: b4 0.12.3
Message-ID: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>
Subject: [PATCH] xen/efi: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

`efi_loader_signature` has space for 4 bytes. We are copying "Xen" (3 bytes)
plus a NUL-byte which makes 4 total bytes. With that being said, there is
currently not a bug with the current `strncpy()` implementation in terms of
buffer overreads but we should favor a more robust string interface
either way.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer while being functionally the
same in this case.

Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested
---
 arch/x86/xen/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 863d0d6b3edc..7250d0e0e1a9 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -138,7 +138,7 @@ void __init xen_efi_init(struct boot_params *boot_params)
 	if (efi_systab_xen == NULL)
 		return;
 
-	strncpy((char *)&boot_params->efi_info.efi_loader_signature, "Xen",
+	strscpy((char *)&boot_params->efi_info.efi_loader_signature, "Xen",
 			sizeof(boot_params->efi_info.efi_loader_signature));
 	boot_params->efi_info.efi_systab = (__u32)__pa(efi_systab_xen);
 	boot_params->efi_info.efi_systab_hi = (__u32)(__pa(efi_systab_xen) >> 32);

---
base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
change-id: 20230911-strncpy-arch-x86-xen-efi-c-14292f5a79ee

Best regards,
--
Justin Stitt <justinstitt@google.com>



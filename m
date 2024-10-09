Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AD9970A2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814887.1228588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFN-0004XV-N9; Wed, 09 Oct 2024 16:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814887.1228588; Wed, 09 Oct 2024 16:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFN-0004S3-Ij; Wed, 09 Oct 2024 16:09:09 +0000
Received: by outflank-mailman (input) for mailman id 814887;
 Wed, 09 Oct 2024 16:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLPn=RF=flex--ardb.bounces.google.com=3oqoGZwgKCVEtAwu+z1Cz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@srs-se1.protection.inumbo.net>)
 id 1syZFM-0004OJ-I9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:08 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf804ea4-8658-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:09:07 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e290947f6f8so502951276.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:07 -0700 (PDT)
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
X-Inumbo-ID: cf804ea4-8658-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490146; x=1729094946; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4os8DmpWomyhdXT3uIE5sI0/fikMzrPBJolJZzSSPQ=;
        b=NH2bw0GyiHo8F2u7zAqZPmm6MalNs89+wzFZwheEoiSheZiTmq1JZs1hIRpqoCgNXo
         hh2JTmKTsnS3sONIAm7qk/ge8oXwQtb5lbWu7jHdcdp+k13fqeqWf/j9of1lNp2Q1t2g
         HgqD/12w0R8cggrLgP5SBxXpk64ldH1J0Wcq2QTTUEBRa2n/tOF6NgfuBpcVXB3JssmO
         zB1o3f6P5MaVmztPf+Nl+V51ZNxWy4ullm7B6Z0JrtnO3vPfwYStp3TaXHmxnqSU0Gap
         F5G2FaYtKURu5jGQZ1DQ29BJi5x+gcJE/x4A3fZl19cc4gvSUnUot6NkGBxHZwUm3+uV
         CVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490146; x=1729094946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4os8DmpWomyhdXT3uIE5sI0/fikMzrPBJolJZzSSPQ=;
        b=AG+9PNpH8LQwOp+kLulFdf2kxFm3ezlEUXZIc9D+59eVQO504etM1RzC5FpZITXdaq
         0/FUAgwZwNzEXZ8VdHQ2qAYK3avlb61VKchczpx3cDldiuf3pmAWwBmkRJjiwz/G8GtH
         77yph9QKN1nbXy0qZ7LwC94X2lB2GWwztIgfJ2ODdpvQZO9mql6mKG6Cpv8Ufea3awsv
         GoE6b/zN5RnRCIspAabIMvQ1X5E2KMED1C0wwtTBCaNhNvC0EzhsPlpmL09ollZH9bGb
         fgs9DpOglzSm+szixo9HbYfwUxfQsMOIjtN4UY5MDI7h2Ig7KKz6oUkdt+S7dgV3MIH9
         FnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXQMjxv4HY3BsJv8AunHnx3hzjIVI2Eo8rMz7QexawKXchNoE3C3KjJB7dYUtWznonONuDCUb0xmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8/87DEw7vOJFwizcFZMWl3xkKWVlYkwA3EWDtgBlWSQPzm3Fd
	Xv2QaQNAD5/UxK/37FZLgOlIm5/sXoklihS2Eh06L6a6wCHU2qHO1c0fosPo5SYHzUmLNA==
X-Google-Smtp-Source: AGHT+IFT6IBvqDFvd1nh9Nvp19An6mvh9GEkIy5aq6tG0DxKt0GfrpuME+IFqFwS7fy8QSz4NyDyDfDy
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:850d:0:b0:e25:5cb1:77d8 with SMTP id
 3f1490d57ef6-e28fe4edeb1mr2566276.6.1728490146127; Wed, 09 Oct 2024 09:09:06
 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:40 +0200
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=ardb@kernel.org;
 h=from:subject; bh=iWMVWWds+djQXEXyMG9PXtB+asvAc5L9HBTrJQ9xUI0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5Qzb+5vWNIRfeP0j+K0038QHKYoJW6Ocbk1xPSMu9
 /ZLNUtyRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIlByGPzxHlDuFHVdUrt/r
 MSct7e16de7eyB6v8DvPj7HsC2gs3MrwT9XpV2I1e25o/5H0axwpbNmz58ruzF5mZerQszMwWMW EFwA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-8-ardb+git@google.com>
Subject: [PATCH v3 1/5] x86/pvh: Call C code via the kernel virtual mapping
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Calling C code via a different mapping than it was linked at is
problematic, because the compiler assumes that RIP-relative and absolute
symbol references are interchangeable. GCC in particular may use
RIP-relative per-CPU variable references even when not using -fpic.

So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
that those RIP-relative references produce the correct values. This
matches the pre-existing behavior for i386, which also invokes
xen_prepare_pvh() via the kernel virtual mapping before invoking
startup_32 with paging disabled again.

Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 64fca49cd88f..ce4fd8d33da4 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -172,7 +172,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	movq %rbp, %rbx
 	subq $_pa(pvh_start_xen), %rbx
 	movq %rbx, phys_base(%rip)
-	call xen_prepare_pvh
+
+	/* Call xen_prepare_pvh() via the kernel virtual mapping */
+	leaq xen_prepare_pvh(%rip), %rax
+	subq phys_base(%rip), %rax
+	addq $__START_KERNEL_map, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	call *%rax
+
 	/*
 	 * Clear phys_base.  __startup_64 will *add* to its value,
 	 * so reset to 0.
-- 
2.47.0.rc0.187.ge670bccf7e-goog



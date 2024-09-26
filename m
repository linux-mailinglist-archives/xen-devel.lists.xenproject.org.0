Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0B9871C1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805303.1216366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwZ-0003jB-Aq; Thu, 26 Sep 2024 10:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805303.1216366; Thu, 26 Sep 2024 10:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwZ-0003g1-75; Thu, 26 Sep 2024 10:41:55 +0000
Received: by outflank-mailman (input) for mailman id 805303;
 Thu, 26 Sep 2024 10:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9u9=QY=flex--ardb.bounces.google.com=3bzr1ZggKCfYYpbZ+egremmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@srs-se1.protection.inumbo.net>)
 id 1stlwX-0003PD-7F
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:41:53 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f0000b-7bf3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:41:52 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6de0b23f4c5so11273067b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:41:52 -0700 (PDT)
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
X-Inumbo-ID: f0f0000b-7bf3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347311; x=1727952111; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwoP1rcUlc5IEWvZoDzQ3o2b6cQ+HDztqml72ZvJe/8=;
        b=PPedG0qk0tfIYEQrKQph4LgquD03MY4RfJQTe1p0uczGCBmAopCU0JmIGH5HSvpuyF
         XSx5c6WOlE+09Pr1Yy+jzb5K5/AH6ypjPICTAY3cMH7hq5XHZJPKi8SHVSGzLyL5tGri
         RZx9X63EFv0pPr8pStSEX0EAPSFgsYf5GWJwG+l5EIdW6crwxWuMwWu1gf0Ki/PbYIS6
         XzM5C2D+0J9gKsHrfpZoH9EGbVTpl9gOfCNxPZJuED8s8saOW5g2wXfQ+FrVNWPLvH3S
         7qj9UttAXruDZN7CJoWCNqAQJM22DloRKHaGZRiFZiDVobjJL+X2pd8/WpBFMcqNp7db
         +c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347311; x=1727952111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwoP1rcUlc5IEWvZoDzQ3o2b6cQ+HDztqml72ZvJe/8=;
        b=asTJEYVEePRac3wisxStr8J3VcRF83Dl9N0/7pSGtcrxT21oUJGIxnIS6HcGf7tYI3
         2HVhmIdNrLf6dDvNXNuoQRGvCiCC2SZ6YE4OGA2Z4WjUArKAZz+Kzd9F1hVAPuwfaxGE
         tlgwiwRNm6aUCghUB5TyQTUmcEsHy8q11DhWnCCTdGJADP1oiwoLqKBEzfHXARKn9rZ3
         VfySW3hS495K957YibEEs7/bBy4LGUPY3VPZfoVJCPnF59LJtmHbvP64vKYhMBrC5WhI
         vQfOwMad0hRBt5/xGgZHWWpFny9TBvtOVIGPPfNrapgSeocFwQuwz1UoXmxbuz/SL+cB
         dYFw==
X-Forwarded-Encrypted: i=1; AJvYcCU7s35pbR2MFxjFfwez2hfNafcpY5fxJJiQ94lJZmodRIXtNitov4yc1+OLWue3X5/C+dmJ7O35DHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLkf05qMEE59qh1YKjrrIPAou6dj916PsCmkhoIMCoNp+h3WQO
	iImqGTfTKSl0r232Vd1wbRMoRaUA2XoPnRb1VobcI0XYDepfwmZ8lZ9cgvHFewZSgvSyRQ==
X-Google-Smtp-Source: AGHT+IGFcogBWg0YNHvYrp22ksYkslUYaSpidn/WqA3QXt5WaLA/ISxC26Dr6MxOSXjYzk1lqyi8vs0/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:7203:b0:6dc:836a:e272 with SMTP id
 00721157ae682-6e22ec9e35fmr540887b3.0.1727347311481; Thu, 26 Sep 2024
 03:41:51 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:15 +0200
In-Reply-To: <20240926104113.80146-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=ardb@kernel.org;
 h=from:subject; bh=nGFC7zN3evy7O6d/rvxHyA6d64EhlpFJ+bJvxzbH5PE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rlfekYxbphgk37j1fI2+6+6JyzKRrSvf5uPkYr2770
 /vy3/atHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiV4oY/uneq+0IOFzKn64x
 6dHOnxXrpRKSfhs4zFp0WuTkvae5c6cxMhxm0Y98ri366awCh9g15YlN/ov+djz78lvU7gN3WcX 8FTwA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-8-ardb+git@google.com>
Subject: [PATCH 1/5] x86/pvh: Call C code via the kernel virtual mapping
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
 arch/x86/platform/pvh/head.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 64fca49cd88f..98ddd552885a 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -172,7 +172,13 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	movq %rbp, %rbx
 	subq $_pa(pvh_start_xen), %rbx
 	movq %rbx, phys_base(%rip)
-	call xen_prepare_pvh
+
+	/* Call xen_prepare_pvh() via the kernel virtual mapping */
+	leaq xen_prepare_pvh(%rip), %rax
+	addq $__START_KERNEL_map, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	call *%rax
+
 	/*
 	 * Clear phys_base.  __startup_64 will *add* to its value,
 	 * so reset to 0.
-- 
2.46.0.792.g87dc391469-goog



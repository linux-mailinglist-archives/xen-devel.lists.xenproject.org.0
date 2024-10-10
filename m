Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EE9982AE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815894.1230126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-0003xc-Ia; Thu, 10 Oct 2024 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815894.1230126; Thu, 10 Oct 2024 09:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-0003vC-EH; Thu, 10 Oct 2024 09:45:40 +0000
Received: by outflank-mailman (input) for mailman id 815894;
 Thu, 10 Oct 2024 09:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sypjm-0003ri-3K
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:45:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f1eef3-86ec-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 11:45:37 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9968114422so104121466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 02:45:37 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dcf0dsm64513266b.175.2024.10.10.02.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 02:45:35 -0700 (PDT)
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
X-Inumbo-ID: 66f1eef3-86ec-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728553536; x=1729158336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfnt+tah//kuTb3yKzY3k7uoRLjpA5A8TSsiJRJV2Sc=;
        b=RT4XerQIJAVMkjs7HAG4/WyimijOpH2ctxLEbvt3WZ+vZTidXgZS57HNVkhaKZodQs
         Y2oYgpxQCAyDK+qFvNhzEeoA46P6EMSvHbAdi2kbquCg4GpDWjdwDlTNjaGZhmAKPoEv
         29kQjjt6VX9opR4IZNReoMF6lvCmzoeXtr5RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553536; x=1729158336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfnt+tah//kuTb3yKzY3k7uoRLjpA5A8TSsiJRJV2Sc=;
        b=LwL3QscuAUOeVy8L7XK17VU9HE9a6ClAwbjXPQsYxRiB+MSK/r4vocfcUPZckGxirq
         w8SawpaNk65pFgnaZQ8HONoI/WSED9gobirZqUFlEfwJn9cYjai7SaExJKndlKTZfPtB
         8QzRSUP09p+G+pwiKOiXs9v+snO3LD5dYblsV6zLifT5M4Ft4tkNUSks9UAmGCqUjn4U
         xe0zbnPlQw5sMhE7YrH8ZMAj/LwHhVlHV8rR+PjuidfWHKd2Epgw1AsmoE5KLlhcd3rF
         +21UTTLstIGIugfE9DUNO+Yj1h2y01+jzJtphCl/ei32Sf4LHkINuoWODgCxsCEUYN66
         NGqQ==
X-Gm-Message-State: AOJu0YxHiszVyGNerTQ33sVxYtp6s2fson9H/y0ng8RdrqdHBzRMoRjf
	j2NIXucLdM7xnWBpAwg460z8tNPT3U5tsBya0bzVUygV/mDIJtSQWQWy6ZZ9NNw3ZAW1J/7TRDE
	E
X-Google-Smtp-Source: AGHT+IGy49NxfDxb82h0D1MCQV9JIdMmL+xQMfI3Kv1RHdhLC05xp1XHIhzXvR1QzDHxEFW5dLSjUw==
X-Received: by 2002:a17:907:3d8f:b0:a99:87ea:e773 with SMTP id a640c23a62f3a-a999e69cacamr270938266b.22.1728553536132;
        Thu, 10 Oct 2024 02:45:36 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 1/2] x86/boot: Align mbi2.c stack to 16 bytes
Date: Thu, 10 Oct 2024 10:45:23 +0100
Message-Id: <20241010094524.1836495-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
References: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing previous testing with an Alder Lake Intel machine the with
"x86/boot: Improve MBI2 structure check" commit test started to fail.
Removing the commit makes the tests succeed however there was not apparent
reason (looking at the code) for the failure.
So I instrumented code to output the structure and tested code with
this extracted data with and without the mentioned commit and results
were the same.
Compiled assembly code from lab was also fine beside not keeping
the 16-byte alignment for the stack.
Turning on stack alignment solve the problem on Alder Lake machine.

Fixes: eb21ce14d709 ('x86/boot: Rewrite EFI/MBI2 code partly in C')
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v8:
- added "Fixes:" line;
- typo in commit message: Adler -> Alder;
- add ".init" to mbi2.o;
- reduce difference.
---
 xen/arch/x86/efi/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 7e2b5c07de..c6678652fc 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -9,11 +9,11 @@ $(obj)/%.o: $(src)/%.ihex FORCE
 $(obj)/boot.init.o: $(obj)/buildid.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-$(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
+$(addprefix $(obj)/,$(EFIOBJ-y) mbi2.init.o): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
-obj-bin-y += mbi2.o
+obj-bin-y += mbi2.init.o
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
-- 
2.34.1



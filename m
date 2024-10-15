Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76199E0F8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 10:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819031.1232340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0cs0-00040L-5n; Tue, 15 Oct 2024 08:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819031.1232340; Tue, 15 Oct 2024 08:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0cs0-0003wI-2I; Tue, 15 Oct 2024 08:25:32 +0000
Received: by outflank-mailman (input) for mailman id 819031;
 Tue, 15 Oct 2024 08:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tju4=RL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0cry-0003el-Hv
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 08:25:30 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0767adbb-8acf-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 10:25:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c9404c0d50so5240665a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 01:25:26 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29749663sm41590566b.64.2024.10.15.01.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 01:25:24 -0700 (PDT)
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
X-Inumbo-ID: 0767adbb-8acf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728980726; x=1729585526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPO73Ee+gUhp/QdwEt6rbkUZv+DPxFBuM2HxdwBJt8g=;
        b=YK7bXFlPcrFqHVQphJJs0eBs2UzaEwmg4u4RlgW8ScV1FP3Mom1wowtS7xGySmOmv0
         bcKGd/G6QNpaK3O4aPfQHN+IfbOB1/hCzABWB5OVFAuF6quO6zOKf07JmRZuJv0d4Yfz
         3DCm8XfaUTYOYh0a0djQatTZFHroxYPoUMCuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980726; x=1729585526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPO73Ee+gUhp/QdwEt6rbkUZv+DPxFBuM2HxdwBJt8g=;
        b=Gk6keVAg7nYVaMY3WIp2/ZdalRLoPPE0C+3X8tkSxd/vseLO5mcIARWcO7EXCMxL78
         iRRaJd9NBAHgS/lUGGTH55KNp9tZAhLmtP4p/yjlAYBWII5udiDtb6BR12K0gYCNQDV2
         FqWdaiCIhDWx4TfG4BfSBCMzCas4camStzXtVPjbpI+j/pXE21XsEvN6liPOgU0+xQD4
         foVma7uF7N1czLPnxyVtUo4pU1x0Jhli2XbYdLX1Rtjse34feJbXwL23xr5lOnudNt9h
         LLIsk5RsaC7K6XGHUiR8HAY0YKFHPtY6TUh7xv3SlRDKMBKO+LFtCQ2gGhUtBYJKwM8l
         xzUw==
X-Gm-Message-State: AOJu0YwfAA6CHpa/dDgWzGGfRyk2C/62rUE/iuoAaGm+1qRwIqTevBYL
	VGT9kNzvGCpjdpn6FBHvxSFKL8vcLZKPmuakA6qlM1ElPjuniWFu9AGIgzd4+MPL6c/K0Pb81Eq
	6
X-Google-Smtp-Source: AGHT+IEpcEqQDW+bs96iXMea6FXPIQJxU+sMVnJveA9vSV+igd1zzb17GQIiKtbznJ5/DbwHk3BbJQ==
X-Received: by 2002:a17:907:940e:b0:a99:4152:1cb4 with SMTP id a640c23a62f3a-a99b9585801mr1221023466b.42.1728980725546;
        Tue, 15 Oct 2024 01:25:25 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 1/2] x86/boot: Align mbi2.c stack to 16 bytes
Date: Tue, 15 Oct 2024 09:25:12 +0100
Message-Id: <20241015082513.2477806-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
References: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing previous testing with an Alder Lake Intel machine with the
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v8:
- added "Fixes:" line;
- typo in commit message: Adler -> Alder;
- add ".init" to mbi2.o;
- reduce difference.

Changes since v9:
- minor commit message fix;
- added Reviewed-by.
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



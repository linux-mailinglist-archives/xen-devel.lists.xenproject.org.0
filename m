Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082BB3A3C3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099203.1453198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHp-000408-9W; Thu, 28 Aug 2025 15:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099203.1453198; Thu, 28 Aug 2025 15:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHp-0003wK-1j; Thu, 28 Aug 2025 15:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1099203;
 Thu, 28 Aug 2025 15:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCk-00035A-2Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8deb692b-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:20 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7c56a987so2491995e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:20 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:15 -0700 (PDT)
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
X-Inumbo-ID: 8deb692b-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393576; x=1756998376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrDLZojjpeEcCCCwufcD7E82gZIQTbD6hJlojBPfd1Y=;
        b=fx4jO1u5Pe6DfGf8/niOGST7PfBD1ZP6gknEMjQKVeyiHVWD7um7A2GwFdlk0s6rlU
         R1uUCcwAlWAu2k/OomExuPy7TRcZsH2bQ4GGR4fFoHPlZf4D0UKAWxYukJ0H02dS3U+i
         DznaUcYX4rUVuk+SpO7ZNuJD5+sStmw+aYY58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393576; x=1756998376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrDLZojjpeEcCCCwufcD7E82gZIQTbD6hJlojBPfd1Y=;
        b=sFNJlJT8c0gluWLsskFdvnPsEBcfRkwAge7ql1XhMjZoCwn8rBeBf4nU7ursiSLb7W
         iQ9Kj4LPPl0b1IALoNRFHlNcIGM/jGM9gHB8iQA3st/2uNxXw1P9bvnJ6zsljKc3wtac
         Ul+LcqDvDh8eVULW6e77ClTPZN/lr1WIHfBVBke3r6am9HHQdfyAX+xggRK/B96R1WWz
         CMgP9kTmRcYG6SCOFo5WCvVtMgQrAxnAkbIHv/DYhpOtAc8V0ObghYVjISr7BEjUS7KK
         an0gU2ZpXF1isKIs7ZLoMPFjCy1bJ/LJhDZha60GIKeQNjavADGgJK8HPEcsxKGG4fee
         IFEQ==
X-Gm-Message-State: AOJu0YxFSAjzVuM4keZK2+K0fTz6eXNSAzPtKKtMd5dbt2D6qlW8BSVf
	lRRD/dIDxuHY17BYZronQ7yk0/hz+5233AeHYlWKjGbkQ9RCWMKQG9zSqqFQbYcikKt6EUYgDnb
	weN72
X-Gm-Gg: ASbGncvJkH+M+XWsLQzFCNR1W7VcKnUo1YFGbmBw96SKBCKMPIIQnllBV404Kok6/ce
	83f+srsUGvCI0kiA7kDbJTbO4TJUkyTvNzH1xnoBQLEik4Y/whFR7bSnM8SgAP7/P+Rl9Y4720P
	i2ZfC5agqCPMZEOyMx3EF+TqX5nHCKI7nKBHfpxetK89Hs6kEizbLznj/vf0FINyEf2A1nJr1+B
	Qd12dmA9pCpCDl+32d8vca7iFD/gWoW0ch/RMDsINFj1+P2H1E9L+iEvJle+1bm/LgOXfJH6XkW
	ZBKsOY8vv/cReqpaLvcOWepqK0ToTi8vHG5a2+4WtB03s14IKb3RZt+zAaKNt/1Lxgm35xN/55d
	ImrSF/aZjm3F8eepgI/yvn/ULOf0HZUIyvXzmwq7ujEMQGkbN0AGZVuKmYAkcxuXH27S46LOnhh
	WoumBaen5Kzmo=
X-Google-Smtp-Source: AGHT+IFXn2lu5/qDMrHuLeebtuu84azm8XvndGfqNIgKY0Ef4fMOu6/+AjthmwWQxQOQbXtUwhhZTQ==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr230098655e9.30.1756393576217;
        Thu, 28 Aug 2025 08:06:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 17/23] x86/entry: Drop the pre exception table infrastructure
Date: Thu, 28 Aug 2025 16:04:03 +0100
Message-Id: <20250828150409.901315-18-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is no longer used.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/extable.c               | 14 --------------
 xen/arch/x86/include/asm/asm_defns.h | 11 ++++-------
 xen/arch/x86/include/asm/uaccess.h   |  2 --
 xen/arch/x86/xen.lds.S               |  5 -----
 4 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index cf637d0921e4..a9b6c6b904f5 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -61,7 +61,6 @@ void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
 void __init sort_exception_tables(void)
 {
     sort_exception_table(__start___ex_table, __stop___ex_table);
-    sort_exception_table(__start___pre_ex_table, __stop___pre_ex_table);
 }
 
 static unsigned long
@@ -219,16 +218,3 @@ int __init cf_check stub_selftest(void)
 }
 __initcall(stub_selftest);
 #endif /* CONFIG_SELF_TESTS */
-
-unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
-{
-    unsigned long addr = regs->rip;
-    unsigned long fixup = search_one_extable(
-        __start___pre_ex_table, __stop___pre_ex_table, addr);
-    if ( fixup )
-    {
-        dprintk(XENLOG_INFO, "Pre-exception: %p -> %p\n", _p(addr), _p(fixup));
-        perfc_incr(exception_fixed);
-    }
-    return fixup;
-}
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index a81a4043d0f1..d7eafedf0e4c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -65,22 +65,19 @@ register unsigned long current_stack_pointer asm("rsp");
 
 /* Exception table entry */
 #ifdef __ASSEMBLY__
-# define _ASM__EXTABLE(sfx, from, to)             \
-    .section .ex_table##sfx, "a" ;                \
+# define _ASM_EXTABLE(from, to)                   \
+    .section .ex_table, "a" ;                     \
     .balign 4 ;                                   \
     .long _ASM_EX(from), _ASM_EX(to) ;            \
     .previous
 #else
-# define _ASM__EXTABLE(sfx, from, to)             \
-    " .section .ex_table" #sfx ",\"a\"\n"         \
+# define _ASM_EXTABLE(from, to)                   \
+    " .section .ex_table,\"a\"\n"                 \
     " .balign 4\n"                                \
     " .long " _ASM_EX(from) ", " _ASM_EX(to) "\n" \
     " .previous\n"
 #endif
 
-#define _ASM_EXTABLE(from, to)     _ASM__EXTABLE(, from, to)
-#define _ASM_PRE_EXTABLE(from, to) _ASM__EXTABLE(.pre, from, to)
-
 #ifdef __ASSEMBLY__
 
 .macro BUILD_BUG_ON condstr, cond:vararg
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 719d053936b9..4c41a0fe0426 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -410,8 +410,6 @@ struct exception_table_entry
 };
 extern struct exception_table_entry __start___ex_table[];
 extern struct exception_table_entry __stop___ex_table[];
-extern struct exception_table_entry __start___pre_ex_table[];
-extern struct exception_table_entry __stop___pre_ex_table[];
 
 union stub_exception_token {
     struct {
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 966e514f2034..66075bc0ae6d 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -119,11 +119,6 @@ SECTIONS
        *(.ex_table)
        __stop___ex_table = .;
 
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
        . = ALIGN(PAGE_SIZE);
        __ro_after_init_end = .;
 
-- 
2.39.5



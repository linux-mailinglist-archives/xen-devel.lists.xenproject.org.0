Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B5BB85CA
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136915.1473450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of8-0000ek-1i; Fri, 03 Oct 2025 22:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136915.1473450; Fri, 03 Oct 2025 22:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of7-0000Nw-Fv; Fri, 03 Oct 2025 22:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1136915;
 Fri, 03 Oct 2025 22:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4of3-0004mF-56
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:01 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0b9c5e-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:54:00 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so30096515e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:00 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:59 -0700 (PDT)
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
X-Inumbo-ID: da0b9c5e-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532040; x=1760136840; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANvzpW72vwwsvyjhYzLTTiCaXWsRhxHL8R8E+kHqpjw=;
        b=pYGmjyV314wYCdbhUHlLvOw7W28qWla+iyuvtN/TF4gofkqrM1bsSB138ei4znNs+c
         ccnFuOLFX48GKUaffP/5hNOFdQFvOU/q+gidy/EH4xOj1EYE4HJse5JdgUv9p9pLlv+G
         buKtRW3zSVWApol2FT1p52t9nYBX8o0lSK5mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532040; x=1760136840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANvzpW72vwwsvyjhYzLTTiCaXWsRhxHL8R8E+kHqpjw=;
        b=q2gS74IB+RFBbUO7R/LvObHzFzHMyHRrYVJI9gIwfmer89HX/5o7HH/17pyAxg6DJS
         XrFhuJ6h8zOekSqM46EsmnRodtBH3K9/KhV0uj9qn8pi4StOjYnWw5q7pjGfPiQAVWT+
         Q1oqDQ1RJhmdA+fRL/7PhPHUr38fRXqVx3aIatUqDTPlnNGMO6VtEnbr+FAbJvAbIIrl
         F+5MOUZANidPJC/XHAjsGDQvAqtwUozbm9UY1b0dT+GMi+7BdzbEOzCCcystWTY/CHXW
         2i6r5Gm58MtJADtcvtrUY2ooAA87p7fhZ7VIkVkdPsXTcNAwjU6UyvMMGCI72vtA+OQQ
         cbug==
X-Gm-Message-State: AOJu0YzJAQbu1Fx5WtJufgw0qzswnvbsctVMRr6xucV9UcKM/RNZpTyi
	tpTyIExEJs23RLy0jB9aCwI4CsuaiY8BjjLi+Y1I/ray7vipnjCnhceqAdfyLLJboWhIvA46OK3
	Xmv4pidOdLQ==
X-Gm-Gg: ASbGncsI4LWd7RX2bku/F/xIagCbk5i7gEPvm8Ib0f1ZMcjOUYMaZlRGn9Xhr1CnrCA
	RDWdgf5Z3Dgxt/YWDnlbKBWDclbF40koU2fUj6nYJ+5KVqKvO1IWqBcmbLadh6h4NDy5d1wyi4c
	Pts0ge12e5xxU8W0UgotrJtFAGKn4Y//tRS7MJKNHGKSYuuRwI9CBDCC/iCF8Ns6jF74tpvxhZP
	sQL5QPJLPdNY+1pJXGKcrHQEl92i1lR9KJqhXnyU+GLNXtXGIrriLwYXYydMv2oodylEizBcU+u
	nRJf8fn78+UqaxkZ+SMsZ6XaT+FGBD7z87jOHGFn3Yb3STLHLdhwH/oVFYS4yPHT8GIhC1w0aST
	1YJuWEP/xhzua+91RNqIWIOVRkRJRpL3PSxxtsNk7PTRIbfkkN0/keWgVd0dTGtEaUr3wU5nR2w
	Yxgv+viCG//KNGMnt1iX0C
X-Google-Smtp-Source: AGHT+IF8aEJo+fOqUAgR0jh5lYjGuweJ2kLO3kj48UhE4rEUCkOi0B236wTO2XQ7xbpR05hk9r+xNA==
X-Received: by 2002:a05:6000:2483:b0:3dc:1473:18bc with SMTP id ffacd0b85a97d-42566e05d8fmr2659758f8f.0.1759532039956;
        Fri, 03 Oct 2025 15:53:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 16/22] x86/entry: Drop the pre exception table infrastructure
Date: Fri,  3 Oct 2025 23:53:28 +0100
Message-Id: <20251003225334.2123667-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is no longer used.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0585473A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680545.1058524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCcm-0003Dr-W6; Wed, 14 Feb 2024 10:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680545.1058524; Wed, 14 Feb 2024 10:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCcm-0003Af-Si; Wed, 14 Feb 2024 10:36:20 +0000
Received: by outflank-mailman (input) for mailman id 680545;
 Wed, 14 Feb 2024 10:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luzD=JX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1raCcl-0003AZ-4E
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:36:19 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e28012ce-cb24-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:36:17 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-561f8b8c058so1232302a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:36:17 -0800 (PST)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vh2-20020a170907d38200b00a3d08f3283fsm1437202ejc.104.2024.02.14.02.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:36:16 -0800 (PST)
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
X-Inumbo-ID: e28012ce-cb24-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707906977; x=1708511777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FosWLS1dcg2XMXFMITky5HoMZurHyMN4qiTpqnCFJHU=;
        b=BXu+Ra4YAqWuoCwXIYS6e0dQxpLmf8dRZ6GTl7johYMv68xeBL5mJEPXl93XvkMpy0
         QBTxrqkZL0vtMeQZomnOAe2Tt7hhmUw+m3PUo1nJItj5PfP6pWtehmlFsbjJVxijD5AQ
         Xb1gfXx5CkMqTv+Z6KcWcjxbDPq+WwAl2m3xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707906977; x=1708511777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FosWLS1dcg2XMXFMITky5HoMZurHyMN4qiTpqnCFJHU=;
        b=WEh2//GW7o+vs9zxBJ3/0e2XWbrLZy3bo312zFdmJ2az2EpwiaNa6OR9urW4ApJbJ9
         x3qlP+dBU02ABKYbIX9wgQ1Z/B013NajZWs0hV47Lx+5x2xIEMbRejCiyDGK2rJv6Szv
         KxpN7PfBlLcGPzNorlpr744MMHeJmploJ8c0kvzaBDJN/qUsE0aafnalhgRGc7ZF68Mh
         6arO205fH1+vURlukNVEZao4yZVD0U1quGB3Z7L/qPMXBplGxfk7z/hH4daugGX6Uk9X
         VwzziG/JixvqZjGrgvd8iLlEUGPqTAOTwdGcAbocEhOlwG6hcFs0r1nI2xqOiTFkH29j
         JJ+g==
X-Gm-Message-State: AOJu0Yy0scIae/1EDXrjistaIex/MuN2DS1wTScqjTrT4YkrSAuahLh3
	bwwof6X04LJaQcaCq25qqUfCT+Ec3DQRQ+a/+svrygFf8kJyGJQhurCAoEWVftVQNJD37tyaFbs
	smkpdIQ==
X-Google-Smtp-Source: AGHT+IFYL14JZHJiAjJ54j01NpkKVY3G50fkLJmaKJUjKyX80A4jCZBJ9aXXNLAX90ypZ/+tW4A6kw==
X-Received: by 2002:a17:906:c10f:b0:a38:107a:94e9 with SMTP id do15-20020a170906c10f00b00a38107a94e9mr1683054ejc.2.1707906976664;
        Wed, 14 Feb 2024 02:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEiAW5NqTmW2pUYsOgjJuWfhOp1l4pUApWWsxWNtt1Twn/S6i5fWLkcbwjUKZD8zHlJjcCuo3bEqCCj4B8ysf0pkxOgdzoh1ObgytPJ/GAotxDWAI2+SPDoO68y/dOP7na0NSLMcJVb0HraFRJgGymovFYaT7bWIQiDBMyGsw=
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] Reduce assembly code size of exception entry points
Date: Wed, 14 Feb 2024 10:35:58 +0000
Message-Id: <20240214103558.13655-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We just pushed a 8-bytes zero and exception constants are
small so we can just write a single byte saving 3 bytes for
instruction.
With ENDBR64 this reduces the size of many entry points from 32 to
16 bytes (due to alignment).
Similar code is already used in autogen_stubs.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
--
v2:
- added missing entry points;
- add mention to autogen_stubs code, as suggested.
---
 xen/arch/x86/x86_64/entry.S | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ecdd6e5b47..a28a0d4044 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -389,7 +389,7 @@ FUNC(entry_int80)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-        movl  $0x80, 4(%rsp)
+        movb  $0x80, 4(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -653,7 +653,7 @@ END(ret_from_intr)
         .section .init.text, "ax", @progbits
 FUNC(early_page_fault)
         ENDBR64
-        movl  $X86_EXC_PF, 4(%rsp)
+        movb  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
@@ -898,105 +898,105 @@ END(handle_exception)
 FUNC(entry_DE)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_DE, 4(%rsp)
+        movb  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
 END(entry_DE)
 
 FUNC(entry_MF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_MF, 4(%rsp)
+        movb  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
 END(entry_MF)
 
 FUNC(entry_XM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_XM, 4(%rsp)
+        movb  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
 END(entry_XM)
 
 FUNC(entry_NM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_NM, 4(%rsp)
+        movb  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
 END(entry_NM)
 
 FUNC(entry_DB)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_DB, 4(%rsp)
+        movb  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
 END(entry_DB)
 
 FUNC(entry_BP)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BP, 4(%rsp)
+        movb  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
 END(entry_BP)
 
 FUNC(entry_OF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_OF, 4(%rsp)
+        movb  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
 END(entry_OF)
 
 FUNC(entry_BR)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BR, 4(%rsp)
+        movb  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
 END(entry_BR)
 
 FUNC(entry_UD)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_UD, 4(%rsp)
+        movb  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
 END(entry_UD)
 
 FUNC(entry_TS)
         ENDBR64
-        movl  $X86_EXC_TS, 4(%rsp)
+        movb  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
 END(entry_TS)
 
 FUNC(entry_NP)
         ENDBR64
-        movl  $X86_EXC_NP, 4(%rsp)
+        movb  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
 END(entry_NP)
 
 FUNC(entry_SS)
         ENDBR64
-        movl  $X86_EXC_SS, 4(%rsp)
+        movb  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
 END(entry_SS)
 
 FUNC(entry_GP)
         ENDBR64
-        movl  $X86_EXC_GP, 4(%rsp)
+        movb  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
 END(entry_GP)
 
 FUNC(entry_AC)
         ENDBR64
-        movl  $X86_EXC_AC, 4(%rsp)
+        movb  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
 END(entry_AC)
 
 FUNC(entry_CP)
         ENDBR64
-        movl  $X86_EXC_CP, 4(%rsp)
+        movb  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
 END(entry_CP)
 
 FUNC(entry_DF)
         ENDBR64
-        movl  $X86_EXC_DF, 4(%rsp)
+        movb  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
@@ -1022,7 +1022,7 @@ END(entry_DF)
 FUNC(entry_NMI)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_NMI, 4(%rsp)
+        movb  $X86_EXC_NMI, 4(%rsp)
 END(entry_NMI)
 
 FUNC(handle_ist_exception)
@@ -1158,7 +1158,7 @@ END(handle_ist_exception)
 FUNC(entry_MC)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_MC, 4(%rsp)
+        movb  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
 END(entry_MC)
 
-- 
2.34.1



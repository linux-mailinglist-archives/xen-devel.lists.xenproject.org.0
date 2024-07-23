Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5C939DD4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762893.1173122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBs6-0005zq-6Z; Tue, 23 Jul 2024 09:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762893.1173122; Tue, 23 Jul 2024 09:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBs6-0005xw-3v; Tue, 23 Jul 2024 09:31:50 +0000
Received: by outflank-mailman (input) for mailman id 762893;
 Tue, 23 Jul 2024 09:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQdi=OX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWBs4-0005xq-IK
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:31:48 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62012341-48d6-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 11:31:47 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2d7d8854so22634941fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:31:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6906a96sm168073485e9.22.2024.07.23.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 02:31:46 -0700 (PDT)
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
X-Inumbo-ID: 62012341-48d6-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721727107; x=1722331907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4p5EBajcnF2PBWFGM7P90104CDoSF78S5SKBKjL4e/Y=;
        b=Px2VoIjBIiErERU+l+1A9M8P1zeEqostM0d7WZMyjzTGmnt12yyevBUQCDCTqFAfGe
         XNfQjSPetoLXVnCGa1Qx0U1VYvnnmU4xL9jv5p2RY8qjBjdzSNPE8OEXVJ6IdxH8DNfm
         Cl115pM/3AwBrXsC/ITqvndHFPzhzAK1TnOSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727107; x=1722331907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4p5EBajcnF2PBWFGM7P90104CDoSF78S5SKBKjL4e/Y=;
        b=DA6t35KkC+8q7lRboyQRWdg4c4HsgcHZEaXmDcfqSREH3x+jD04fjbyFU4OzBnrA1x
         K2y7Cu1xOiKUmfjR/UQuaFVURNBRv2FPIwraaSVRy92Ua/iKOiL+k+rmoS1HfwTCMooW
         0oVtBfvaFsMa2+ryWQJUxE3QMxN4HtDtpiHYQLbKYBa6fAgUumvsVKBPNp5Tp5I9aptl
         ldQMxvVxZxBIujE7XsRmsV/5FnM7ObogABEXdfOTfA+PrbyuM+h31Qr+JcvTWpmmbKIp
         fMtuGx7Oukp8pqIEIfYn0G045agt8LDxuSsv1YUoyu8vg2UX3Jcq/ibwYq9Ns/0TcKpe
         9knA==
X-Gm-Message-State: AOJu0YwVfJVMeDckRSLELqnowhuZFObSmuRJNNyRv9fEsN/SdN8uRDC1
	l3EoPI1jxky2iLhdB5tYz9gQXNn5hb0VDiphHxWQzT7onF6aRi9U2IRQpKuzOZbRvXD1PyB6Efu
	B
X-Google-Smtp-Source: AGHT+IE1pyooqsY8trGVubUq4gK4A3xLfKdqvT96Y8tKgrPiFsTVxiOCI/mJeYESNEAImuc7Km7BXA==
X-Received: by 2002:a2e:9f16:0:b0:2ee:80b2:1e99 with SMTP id 38308e7fff4ca-2f01ead8f10mr16221501fa.44.1721727106436;
        Tue, 23 Jul 2024 02:31:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] x86/altcall: fix clang code-gen when using altcall in loop constructs
Date: Tue, 23 Jul 2024 11:31:17 +0200
Message-ID: <20240723093117.99487-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yet another clang code generation issue when using altcalls.

The issue this time is with using loop constructs around alternative_{,v}call
instances using parameter types smaller than the register size.

Given the following example code:

static void bar(bool b)
{
    unsigned int i;

    for ( i = 0; i < 10; i++ )
    {
        int ret_;
        register union {
            bool e;
            unsigned long r;
        } di asm("rdi") = { .e = b };
        register unsigned long si asm("rsi");
        register unsigned long dx asm("rdx");
        register unsigned long cx asm("rcx");
        register unsigned long r8 asm("r8");
        register unsigned long r9 asm("r9");
        register unsigned long r10 asm("r10");
        register unsigned long r11 asm("r11");

        asm volatile ( "call %c[addr]"
                       : "+r" (di), "=r" (si), "=r" (dx),
                         "=r" (cx), "=r" (r8), "=r" (r9),
                         "=r" (r10), "=r" (r11), "=a" (ret_)
                       : [addr] "i" (&(func)), "g" (func)
                       : "memory" );
    }
}

See: https://godbolt.org/z/qvxMGd84q

Clang will generate machine code that only resets the low 8 bits of %rdi
between loop calls, leaving the rest of the register possibly containing
garbage from the use of %rdi inside the called function.  Note also that clang
doesn't truncate the input parameters at the callee, thus breaking the psABI.

Fix this by turning the `e` element in the anonymous union into an array that
consumes the same space as an unsigned long, as this forces clang to reset the
whole %rdi register instead of just the low 8 bits.

Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Adding Oleksii as to whether this could be considered for 4.19: it's strictly
limited to clang builds, plus will need to be backported anyway.
---
 xen/arch/x86/include/asm/alternative.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 0d3697f1de49..e63b45927643 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -185,10 +185,10 @@ extern void alternative_branches(void);
  */
 #define ALT_CALL_ARG(arg, n)                                            \
     register union {                                                    \
-        typeof(arg) e;                                                  \
+        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
         unsigned long r;                                                \
     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
-        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
+        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
     }
 #else
 #define ALT_CALL_ARG(arg, n) \
-- 
2.45.2



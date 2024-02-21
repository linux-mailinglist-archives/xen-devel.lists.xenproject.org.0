Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F185E3F0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 18:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684124.1063830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcq0X-00055j-B5; Wed, 21 Feb 2024 17:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684124.1063830; Wed, 21 Feb 2024 17:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcq0X-00053b-7q; Wed, 21 Feb 2024 17:03:45 +0000
Received: by outflank-mailman (input) for mailman id 684124;
 Wed, 21 Feb 2024 17:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8C+a=J6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcq0W-00053V-5G
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 17:03:44 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a2d4c01-d0db-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 18:03:42 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so95483661fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 09:03:42 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05620a056a00b00785d9e3b744sm4465716qkp.108.2024.02.21.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 09:03:40 -0800 (PST)
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
X-Inumbo-ID: 2a2d4c01-d0db-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708535021; x=1709139821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vP4gMZWRt3kH7TAC3U/8MIPnSOHiEExJGIwVsdIZ4b0=;
        b=dBDPsVWC1bT52aZCo785iFYPTYDgY4qjzeZrxejlRvyH94c/ubU2SS3i021MntkU5v
         CcEy5qOAg8+LNNMalktdVyxISdGdoQLr2ylY3SFgEEuSbq86CrA9e/mILgsRKZD4PeMF
         ziu0c+oxeTCJW2LlE5GinPqt0gLkgjaddn8GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708535021; x=1709139821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP4gMZWRt3kH7TAC3U/8MIPnSOHiEExJGIwVsdIZ4b0=;
        b=iUmObAP/y70yJxR669iOLitdNRTEjSSFyBSOvU9wiQfDmlfcr5ZGSQQ+GYmamo1tQ7
         ZX6t58icY358n577o3GiMbrXOLvxK3uvv6freCKzEwQwqQojQiBHp1ero3x22VGb0rq1
         rGbZihPaZQOqWcwgeYGyxY38L7T7n1G1U8htQOljJdD7Ig8FruFdfCR3mG2PAApf9cGA
         z3r3cJcvTzdG0RFubXLZQ8LdOLt6qodNGIcsN4d7knCffV9mxZidl79mHyrgSbJ6FhQA
         sh4DX8RkO/MhzIrQ/WhM4VEQuH+FR9gqhmAbsJoRuiSXjQR0BHE326Mm6HMSqMRd0qRa
         sGZQ==
X-Gm-Message-State: AOJu0YyVJLCk/CVW18LiMD9turuhURoOUHIpPFEDf4p2ybRlcQfpUR45
	O+XLPwlR8SbbTC9hWpgFTe44tHHNbdkQ2FnU/tUhkwQ37BkrzHzG4+jv2qMWVodOQkP2zOGDDFU
	9
X-Google-Smtp-Source: AGHT+IH5j3kGz37N+2rV3nlptBNUSFLzJus9O05ZAevSgc1+blIeBsAlCf2EbPFkdjAOP3Cjm6bcGw==
X-Received: by 2002:a05:651c:1988:b0:2d2:2fb7:b30f with SMTP id bx8-20020a05651c198800b002d22fb7b30fmr9457535ljb.7.1708535020648;
        Wed, 21 Feb 2024 09:03:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/altcall: use an union as register type for function parameters
Date: Wed, 21 Feb 2024 18:03:31 +0100
Message-ID: <20240221170331.60605-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code for alternative calls uses the caller parameter types as the
types for the register variables that serve as function parameters:

uint8_t foo;
[...]
alternative_call(myfunc, foo);

Would expand roughly into:

register unint8_t a1_ asm("rdi") = foo;
register unsigned long a2_ asm("rsi");
[...]
asm volatile ("call *%c[addr](%%rip)"...);

However under certain circumstances clang >= 16.0.0 with -O2 can generate
incorrect code, given the following example:

unsigned int func(uint8_t t)
{
    return t;
}

static void bar(uint8_t b)
{
    int ret_;
    register uint8_t di asm("rdi") = b;
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

void foo(unsigned int a)
{
    bar(a);
}

Clang generates the following code:

func:                                   # @func
        movl    %edi, %eax
        retq
foo:                                    # @foo
        callq   func
        retq

Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
passed into bar() is lost.

The above can be worked around by using an union when defining the register
variables, so that `di` becomes:

register union {
    uint8_t e;
    unsigned long r;
} di asm("rdi") = { .e = b };

Which results in following code generated for `foo()`:

foo:                                    # @foo
        movzbl  %dil, %edi
        callq   func
        retq

So the truncation is not longer lost.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Seems like all gitlab build tests are OK with this approach.
---
 xen/arch/x86/include/asm/alternative.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a1cd6a9fe5b8..837dfd953d2f 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -167,9 +167,18 @@ extern void alternative_branches(void);
 #define ALT_CALL_arg5 "r8"
 #define ALT_CALL_arg6 "r9"
 
-#define ALT_CALL_ARG(arg, n) \
-    register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
-        ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })
+/*
+ * Use an union with an unsigned long in order to prevent clang >= 16.0.0 from
+ * skipping a possible truncation of the value.  By using the union any
+ * truncation is carried before the call instruction.
+ */
+#define ALT_CALL_ARG(arg, n)                                            \
+    register union {                                                    \
+        typeof(arg) e;                                                  \
+        unsigned long r;                                                \
+    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
+        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
+    }
 #define ALT_CALL_NO_ARG(n) \
     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n )
 
-- 
2.43.0



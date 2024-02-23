Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9F861237
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 14:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684862.1065045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdVE9-0004sW-SC; Fri, 23 Feb 2024 13:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684862.1065045; Fri, 23 Feb 2024 13:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdVE9-0004qZ-PQ; Fri, 23 Feb 2024 13:04:33 +0000
Received: by outflank-mailman (input) for mailman id 684862;
 Fri, 23 Feb 2024 13:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdVE9-0004qT-6F
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 13:04:33 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15eaccdd-d24c-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 14:04:32 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512cca90f38so921229e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 05:04:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 r19-20020ac84253000000b0042e30153d7csm3115670qtm.2.2024.02.23.05.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 05:04:22 -0800 (PST)
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
X-Inumbo-ID: 15eaccdd-d24c-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708693471; x=1709298271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9i4075X9PLnoKVpgo6Uj90eLDaJ7j9BjLkIR0nRpAH0=;
        b=V8fXwPYTUBOKWFemTyuBiUNbxCddOkBGhNNO6GjtpOskKQFA8bXfOyYDkQ41UyEbj1
         zEKJ+ZrQhxvlv+OHXUYPVN0uZEY/XB7EZbsd5K0YOG9VK9i+KIqRcnW3+KpxQTuzOZ9j
         Bf2Yt+7xQaI+ehI4+OezjKETWZWEhJYdvv554=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708693471; x=1709298271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9i4075X9PLnoKVpgo6Uj90eLDaJ7j9BjLkIR0nRpAH0=;
        b=epuHDKyO9tv17N7M1y1+kLZgK+LQuyn+1/zvnvVYF8vuRAWlUwgoOIqTCFq4rqaovd
         scg44dYmwXjMs6VsePV8gogtWHx2tyUM+zI6p4GNHdw2ZR//yynMYW3rQDkpeLPEhLNv
         mnnZwtzm7XZZKJt+34ezLN4DoKA9SQeW5coMe4af+zHTFWlvFCED4d1M9qVb36c4f7Ul
         rzPhk2mAFnXBbnrAf9MTyXXGndnArGHKF46dlPlFuv36o4+A0HYc5whEaH7WXhB2M3++
         tGAK3gh1+0AjgJD76mZ/LlTvlQ9vnmpWGos1+/oGD7cvmB3v8ywgaUqAgtUaiYMKFrYi
         3gZA==
X-Gm-Message-State: AOJu0YwOMMekln+i0xDy9JWe7omumn8cssNJ88N0Gu7DX80RBaxfudRN
	TkqCM3o35DUfJV4KSQE8tqMbQwl/l2SZu2awnBQYw1+NtBZhG5O1VjurmTeqUWvko0NzuN3pPwJ
	2
X-Google-Smtp-Source: AGHT+IECUZ0RXhIwP4VagDHxPgB4V67aKSns1JCI1uE9dRzz8mQ/h0v3rWTvi+g0md61K3QbgD/GXQ==
X-Received: by 2002:ac2:4d03:0:b0:512:b24c:dba with SMTP id r3-20020ac24d03000000b00512b24c0dbamr1184494lfi.60.1708693470944;
        Fri, 23 Feb 2024 05:04:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Matthew Grooms <mgrooms@shrew.net>
Subject: [PATCH v3] x86/altcall: use an union as register type for function parameters on clang
Date: Fri, 23 Feb 2024 14:03:54 +0100
Message-ID: <20240223130354.73936-1-roger.pau@citrix.com>
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

However with -O2 clang will generate incorrect code, given the following
example:

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

Clang generates the following assembly code:

func:                                   # @func
        movl    %edi, %eax
        retq
foo:                                    # @foo
        callq   func
        retq

Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
passed into bar() is lost.  clang doesn't zero extend the parameters in the
callee when required, as the psABI mandates.

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

So the truncation is not longer lost.  Apply such workaround only when built
with clang.

Reported-by: Matthew Grooms <mgrooms@shrew.net>
Link: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=277200
Link: https://github.com/llvm/llvm-project/issues/12579
Link: https://github.com/llvm/llvm-project/issues/82598
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Expand the code comment.

Changes since v1:
 - Only apply the union workaround with clang.

Seems like all gitlab build tests are OK with this approach.
---
 xen/arch/x86/include/asm/alternative.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a1cd6a9fe5b8..3c14db5078ba 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -167,9 +167,34 @@ extern void alternative_branches(void);
 #define ALT_CALL_arg5 "r8"
 #define ALT_CALL_arg6 "r9"
 
+#ifdef CONFIG_CC_IS_CLANG
+/*
+ * Use a union with an unsigned long in order to prevent clang from
+ * skipping a possible truncation of the value.  By using the union any
+ * truncation is carried before the call instruction, in turn covering
+ * for ABI-non-compliance in that the necessary clipping / extension of
+ * the value is supposed to be carried out in the callee.
+ *
+ * Note this behavior is not mandated by the standard, and hence could
+ * stop being a viable workaround, or worse, could cause a different set
+ * of code-generation issues in future clang versions.
+ *
+ * This has been reported upstream:
+ * https://github.com/llvm/llvm-project/issues/12579
+ * https://github.com/llvm/llvm-project/issues/82598
+ */
+#define ALT_CALL_ARG(arg, n)                                            \
+    register union {                                                    \
+        typeof(arg) e;                                                  \
+        unsigned long r;                                                \
+    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
+        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
+    }
+#else
 #define ALT_CALL_ARG(arg, n) \
     register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
         ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })
+#endif
 #define ALT_CALL_NO_ARG(n) \
     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n )
 
-- 
2.43.0



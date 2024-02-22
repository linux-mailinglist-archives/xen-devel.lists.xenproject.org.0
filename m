Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F885FE68
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 17:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684498.1064395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdCES-0002sr-VF; Thu, 22 Feb 2024 16:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684498.1064395; Thu, 22 Feb 2024 16:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdCES-0002qa-SV; Thu, 22 Feb 2024 16:47:36 +0000
Received: by outflank-mailman (input) for mailman id 684498;
 Thu, 22 Feb 2024 16:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdCER-0002qT-5Q
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 16:47:35 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ffce5d-d1a2-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 17:47:34 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512bde3d197so4831511e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 08:47:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 or6-20020a056214468600b0068f7f26d74asm4320658qvb.138.2024.02.22.08.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 08:47:31 -0800 (PST)
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
X-Inumbo-ID: 12ffce5d-d1a2-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708620452; x=1709225252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6OftHvItKM5qkGRVczxkILrn6fjNA4NJKNo1579rFo=;
        b=uh2BdqG+SV2Ep2YkZvY1nOVmJn6x/W5CCFMYvf0w1OPinSToz2pyucbl/3PQ6xsTY4
         G3P/uQEVy5qVEAkQMbzua38mlXRZkv0a3GzM7pk3keaEcr1tlGpZQ/UQELbLx1Rav2VI
         X60aK8HtfqCojrUwpgV89B2llET99r/loS9+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708620452; x=1709225252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6OftHvItKM5qkGRVczxkILrn6fjNA4NJKNo1579rFo=;
        b=h9Qy2foDzrRsMWG6Xr4eoBLBW+OdVAi5WGLAY0XZcfDhRJTUp3oJvBGaUO0g4CpwSc
         4ZxLTJBM5pFpy4KEQNgvgWOHakKa+MnBQwP5qL3U/tu9sTL9PtkwmncIGrf+7xvl30BV
         O58/B94XQRCTNOMHN+nN3QiTaifh1JZRgU/ZuUEbKL4ze44MbQJ9HHhOWlwtGffuiUjo
         /XNGf2rSPkYg2lCd83swCnzjVsNBpbr+eJhxKsxZ3EkRAqueejeNZYTonRACJQ6voHB8
         zR4eGwb4leqa1Ju/8D5ieG39DU7pxHUmSRtw48L9jywLa6EaCAej93T+sGHi+jVgqodh
         iU/A==
X-Gm-Message-State: AOJu0YzkQPROb94gTOipya3FpXOoW8JDuMR2scE3bKzxf0t+mYUzaNdz
	4xoPKcwC+nYfVsqTNnIBUIHtcMgchqag6Ibr36JcjPlCcgXmEYkqGdcael181GJdz1M2M5hyviI
	p
X-Google-Smtp-Source: AGHT+IGxMja/Obx6Is7A875tQAOe8Ul7LHdFqcKWHRAQ8tm2mIESByI3NPYREhBgits+8sqNbSEpzQ==
X-Received: by 2002:ac2:489a:0:b0:511:5f38:76e with SMTP id x26-20020ac2489a000000b005115f38076emr13237993lfc.1.1708620452135;
        Thu, 22 Feb 2024 08:47:32 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Matthew Grooms <mgrooms@shrew.net>
Subject: [PATCH v2] x86/altcall: use an union as register type for function parameters
Date: Thu, 22 Feb 2024 17:44:55 +0100
Message-ID: <20240222164455.67248-1-roger.pau@citrix.com>
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

So the truncation is not longer lost.  Apply such workaround only when built
with clang.

Reported-by: Matthew Grooms <mgrooms@shrew.net>
Link: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=277200
Link: https://github.com/llvm/llvm-project/issues/82598
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Only apply the union workaround with clang.

Seems like all gitlab build tests are OK with this approach.
---
 xen/arch/x86/include/asm/alternative.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a1cd6a9fe5b8..3fe27ea791bf 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -167,9 +167,25 @@ extern void alternative_branches(void);
 #define ALT_CALL_arg5 "r8"
 #define ALT_CALL_arg6 "r9"
 
+#ifdef CONFIG_CC_IS_CLANG
+/*
+ * Use an union with an unsigned long in order to prevent clang from skipping a
+ * possible truncation of the value.  By using the union any truncation is
+ * carried before the call instruction.
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



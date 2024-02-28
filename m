Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5C86B10D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686652.1068927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKSt-0004Ij-Ds; Wed, 28 Feb 2024 13:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686652.1068927; Wed, 28 Feb 2024 13:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKSt-0004GX-B9; Wed, 28 Feb 2024 13:59:19 +0000
Received: by outflank-mailman (input) for mailman id 686652;
 Wed, 28 Feb 2024 13:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqYS=KF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfKSr-0004GR-Vj
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:59:17 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f0e7510-d641-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 14:59:16 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-21ffac15528so1945337fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:59:16 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y8-20020ac87088000000b0042e6ad88de0sm4541777qto.73.2024.02.28.05.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 05:59:14 -0800 (PST)
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
X-Inumbo-ID: 8f0e7510-d641-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709128755; x=1709733555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=os3HgQ8AeYU2sQX2v+d85sqmjd8DP68ruVnpK6fu8HM=;
        b=VsMrFVMwHQbxeX82oQz7YWdgJ/vZZm4D6K3kiiqxcCMx97iqGM5nCgq2+jPbmKdKWK
         mYxoEYmXnOIpIRHPzDzacPSdEIUyCzT87zxL9Vsgw/4KoUtaDyPsW3cFNqaxTKv5vhTv
         XLdc0dce6NTwDay31jTc6O9AW7fqmuk4yqIMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128755; x=1709733555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=os3HgQ8AeYU2sQX2v+d85sqmjd8DP68ruVnpK6fu8HM=;
        b=rnWaGqYFCQrtHgg9GVQ+2eibWPKGY4cmGObf4KhTIs030DXeo45/ofMB2af24UtiGu
         fF+R6y1h0cd4FjMcrueViLRE6ATxNspHjFmvFY58nonrcMI5PzOtHjHAw86DZ3rmEuVW
         H2JQ4V1Um9uA/aYnpbCsGxDDuskctQZq+lDjoj59S9D+uEmyy3nRmpIzEI/FQfIqhXTu
         tXYUDUhXw37RZE0xAGBIgPd/UNHHKDzF+DMPG4aj2NloNtcAkpIjvzM+OOMmrTuzyDH+
         5GnL66mhOLtba9RNIsTrgj2PJ5YndwTgFJBJfC4PovLqRp5YuuZ6hNQd6+3svo5/65ZT
         zU6w==
X-Gm-Message-State: AOJu0YxvoV3SNjiy3fiMv4wo+m3XizLBW3N8O7D1GuoTHQuprFQej8gt
	P/hQbv9v6Wsv+f+64ZHmnIs/YD75cvIgbmfX7H8or4ZsxP7z663GcsmITGFGWlTColCcuCXQ8Lr
	z
X-Google-Smtp-Source: AGHT+IEHnPPzPBUqjZiM/VDJhnbwmqY4z8BNRWRpslfDq6RWy82cxvphMLpvVrohfA9Zc6J9wCs3ag==
X-Received: by 2002:a05:6870:164d:b0:21e:a94b:e80 with SMTP id c13-20020a056870164d00b0021ea94b0e80mr14668408oae.18.1709128754933;
        Wed, 28 Feb 2024 05:59:14 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/altcall: always use a temporary parameter stashing variable
Date: Wed, 28 Feb 2024 14:59:08 +0100
Message-ID: <20240228135908.13319-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage in ALT_CALL_ARG() on clang of:

register union {
    typeof(arg) e;
    const unsigned long r;
} ...

When `arg` is the first argument to alternative_{,v}call() and
const_vlapic_vcpu() is used results in clang 3.5.0 complaining with:

arch/x86/hvm/vlapic.c:141:47: error: non-const static data member must be initialized out of line
         alternative_call(hvm_funcs.test_pir, const_vlapic_vcpu(vlapic), vec) )

Workaround this by pulling `arg1` into a local variable, like it's done for
further arguments (arg2, arg3...)

Originally arg1 wasn't pulled into a variable because for the a1_ register
local variable the possible clobbering as a result of operators on other
variables don't matter:

https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables

Note clang version 3.8.1 seems to already be fixed and don't require the
workaround, but since it's harmless do it uniformly everywhere.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Gitlab CI seems OK on both the 4.17 and staging branches with this applied:

4.17:    https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1193801183
staging: https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1193801881
---
 xen/arch/x86/include/asm/alternative.h | 36 +++++++++++++++++---------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 3c14db5078ba..0d3697f1de49 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -253,21 +253,24 @@ extern void alternative_branches(void);
 })
 
 #define alternative_vcall1(func, arg) ({           \
-    ALT_CALL_ARG(arg, 1);                          \
+    typeof(arg) v1_ = (arg);                       \
+    ALT_CALL_ARG(v1_, 1);                          \
     ALT_CALL_NO_ARG2;                              \
     (void)sizeof(func(arg));                       \
     (void)alternative_callN(1, int, func);         \
 })
 
 #define alternative_call1(func, arg) ({            \
-    ALT_CALL_ARG(arg, 1);                          \
+    typeof(arg) v1_ = (arg);                       \
+    ALT_CALL_ARG(v1_, 1);                          \
     ALT_CALL_NO_ARG2;                              \
     alternative_callN(1, typeof(func(arg)), func); \
 })
 
 #define alternative_vcall2(func, arg1, arg2) ({           \
+    typeof(arg1) v1_ = (arg1);                            \
     typeof(arg2) v2_ = (arg2);                            \
-    ALT_CALL_ARG(arg1, 1);                                \
+    ALT_CALL_ARG(v1_, 1);                                 \
     ALT_CALL_ARG(v2_, 2);                                 \
     ALT_CALL_NO_ARG3;                                     \
     (void)sizeof(func(arg1, arg2));                       \
@@ -275,17 +278,19 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call2(func, arg1, arg2) ({            \
+    typeof(arg1) v1_ = (arg1);                            \
     typeof(arg2) v2_ = (arg2);                            \
-    ALT_CALL_ARG(arg1, 1);                                \
+    ALT_CALL_ARG(v1_, 1);                                 \
     ALT_CALL_ARG(v2_, 2);                                 \
     ALT_CALL_NO_ARG3;                                     \
     alternative_callN(2, typeof(func(arg1, arg2)), func); \
 })
 
 #define alternative_vcall3(func, arg1, arg2, arg3) ({    \
+    typeof(arg1) v1_ = (arg1);                           \
     typeof(arg2) v2_ = (arg2);                           \
     typeof(arg3) v3_ = (arg3);                           \
-    ALT_CALL_ARG(arg1, 1);                               \
+    ALT_CALL_ARG(v1_, 1);                                \
     ALT_CALL_ARG(v2_, 2);                                \
     ALT_CALL_ARG(v3_, 3);                                \
     ALT_CALL_NO_ARG4;                                    \
@@ -294,9 +299,10 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call3(func, arg1, arg2, arg3) ({     \
+    typeof(arg1) v1_ = (arg1);                            \
     typeof(arg2) v2_ = (arg2);                           \
     typeof(arg3) v3_ = (arg3);                           \
-    ALT_CALL_ARG(arg1, 1);                               \
+    ALT_CALL_ARG(v1_, 1);                                \
     ALT_CALL_ARG(v2_, 2);                                \
     ALT_CALL_ARG(v3_, 3);                                \
     ALT_CALL_NO_ARG4;                                    \
@@ -305,10 +311,11 @@ extern void alternative_branches(void);
 })
 
 #define alternative_vcall4(func, arg1, arg2, arg3, arg4) ({ \
+    typeof(arg1) v1_ = (arg1);                              \
     typeof(arg2) v2_ = (arg2);                              \
     typeof(arg3) v3_ = (arg3);                              \
     typeof(arg4) v4_ = (arg4);                              \
-    ALT_CALL_ARG(arg1, 1);                                  \
+    ALT_CALL_ARG(v1_, 1);                                   \
     ALT_CALL_ARG(v2_, 2);                                   \
     ALT_CALL_ARG(v3_, 3);                                   \
     ALT_CALL_ARG(v4_, 4);                                   \
@@ -318,10 +325,11 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call4(func, arg1, arg2, arg3, arg4) ({  \
+    typeof(arg1) v1_ = (arg1);                              \
     typeof(arg2) v2_ = (arg2);                              \
     typeof(arg3) v3_ = (arg3);                              \
     typeof(arg4) v4_ = (arg4);                              \
-    ALT_CALL_ARG(arg1, 1);                                  \
+    ALT_CALL_ARG(v1_, 1);                                   \
     ALT_CALL_ARG(v2_, 2);                                   \
     ALT_CALL_ARG(v3_, 3);                                   \
     ALT_CALL_ARG(v4_, 4);                                   \
@@ -332,11 +340,12 @@ extern void alternative_branches(void);
 })
 
 #define alternative_vcall5(func, arg1, arg2, arg3, arg4, arg5) ({ \
+    typeof(arg1) v1_ = (arg1);                                    \
     typeof(arg2) v2_ = (arg2);                                    \
     typeof(arg3) v3_ = (arg3);                                    \
     typeof(arg4) v4_ = (arg4);                                    \
     typeof(arg5) v5_ = (arg5);                                    \
-    ALT_CALL_ARG(arg1, 1);                                        \
+    ALT_CALL_ARG(v1_, 1);                                         \
     ALT_CALL_ARG(v2_, 2);                                         \
     ALT_CALL_ARG(v3_, 3);                                         \
     ALT_CALL_ARG(v4_, 4);                                         \
@@ -347,11 +356,12 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call5(func, arg1, arg2, arg3, arg4, arg5) ({  \
+    typeof(arg1) v1_ = (arg1);                                    \
     typeof(arg2) v2_ = (arg2);                                    \
     typeof(arg3) v3_ = (arg3);                                    \
     typeof(arg4) v4_ = (arg4);                                    \
     typeof(arg5) v5_ = (arg5);                                    \
-    ALT_CALL_ARG(arg1, 1);                                        \
+    ALT_CALL_ARG(v1_, 1);                                         \
     ALT_CALL_ARG(v2_, 2);                                         \
     ALT_CALL_ARG(v3_, 3);                                         \
     ALT_CALL_ARG(v4_, 4);                                         \
@@ -363,12 +373,13 @@ extern void alternative_branches(void);
 })
 
 #define alternative_vcall6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({ \
+    typeof(arg1) v1_ = (arg1);                                          \
     typeof(arg2) v2_ = (arg2);                                          \
     typeof(arg3) v3_ = (arg3);                                          \
     typeof(arg4) v4_ = (arg4);                                          \
     typeof(arg5) v5_ = (arg5);                                          \
     typeof(arg6) v6_ = (arg6);                                          \
-    ALT_CALL_ARG(arg1, 1);                                              \
+    ALT_CALL_ARG(v1_, 1);                                               \
     ALT_CALL_ARG(v2_, 2);                                               \
     ALT_CALL_ARG(v3_, 3);                                               \
     ALT_CALL_ARG(v4_, 4);                                               \
@@ -379,12 +390,13 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({  \
+    typeof(arg1) v1_ = (arg1);                                          \
     typeof(arg2) v2_ = (arg2);                                          \
     typeof(arg3) v3_ = (arg3);                                          \
     typeof(arg4) v4_ = (arg4);                                          \
     typeof(arg5) v5_ = (arg5);                                          \
     typeof(arg6) v6_ = (arg6);                                          \
-    ALT_CALL_ARG(arg1, 1);                                              \
+    ALT_CALL_ARG(v1_, 1);                                               \
     ALT_CALL_ARG(v2_, 2);                                               \
     ALT_CALL_ARG(v3_, 3);                                               \
     ALT_CALL_ARG(v4_, 4);                                               \
-- 
2.44.0



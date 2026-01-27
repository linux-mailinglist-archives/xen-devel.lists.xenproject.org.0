Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLgTKEWReGmirAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:19:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C831C92A54
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214169.1524541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgAa-0004Bj-4p; Tue, 27 Jan 2026 10:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214169.1524541; Tue, 27 Jan 2026 10:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgAa-00048u-1b; Tue, 27 Jan 2026 10:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1214169;
 Tue, 27 Jan 2026 10:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkgAY-00048o-Ho
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:19:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6856ae-fb69-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 11:19:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so62621405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 02:19:33 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm50065445e9.9.2026.01.27.02.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 02:19:05 -0800 (PST)
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
X-Inumbo-ID: ac6856ae-fb69-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769509172; x=1770113972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gV4rnnSv2OTm/CHA9k4TvRRTSI/H5TfWuxCUjH6P6lQ=;
        b=XrWrYP2f3c3Q2BoPYo0t4qeLJG8QlKGBnuGjcwxlqkxubk+WrYDjGIeaMvhE3bX5xs
         lWBEqv0qUI40X/T5Z9Lwk1t3jf4uqlipfzHLhORtru9N/BkuXaOU09YkjsRlUFvvkdlV
         Tk2VHg1JoRLaHqQh3IQAxd0ywPGt9OdPhmvL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509172; x=1770113972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gV4rnnSv2OTm/CHA9k4TvRRTSI/H5TfWuxCUjH6P6lQ=;
        b=iSgF13D28Q1KJjBNTwo8oznET0Z/pIOsmSOT5/YllnLkEfKbhbYiKEfE3f05laO2FQ
         4Sk5A9tFPU84DtYibnQhQb0dwkhyf+B8DSGIHhq6AoW10iuGThP4EziM8hmGsf/vp/lx
         1vVEz3/b5J/Pn9GZD7wEAGVf8MUP7NZ0ZqVOfU2NzQV4foDmK2NFjtFIFS/zlAAo92Rw
         I4bGj+BJSBjT/zvek0v/P5x3Psy8G14iFZB+vk4fTT7y0XPl1bw8WCq4AmD2vOl9hZnj
         pc27cCKGvJwJg5wZ+fmJNfTIr3C6Qc+3rB21v+E0w43DPMnX+oHONeUa4apCZr9nHkgq
         xisw==
X-Gm-Message-State: AOJu0YxtCEHXmNqKLVsAy50wEVv7Uej8U5vlBVCtRG/v8uEgnB42eEwN
	tctMfVr0dHHnqmLZakyWh3fDDnEqr4q49ab3wzMN9n/zYyXixEaihT3N7gE1bMxgVFGhukqggaU
	Ixv+L
X-Gm-Gg: AZuq6aLwI5/OiNn5O+HHrb6fssZKrTHbdvqbSaf/EJ9mMpAg9MFuUnNFIc4GS1rXwZh
	Qp2Nc/7I7iZRXT+2h04EOa/BI9yJVSzcQZ97sPbX3cK1AmhlQF11kTwY7ns7z/+kBLVPAWiJkq3
	0S5hcZbwZVpkjOgZHJyp1lWpVb1A1PpzrAIA+t7k92jcPgnFox2azwFZ3x/P+qbMkQsqCi9sBED
	JGGzki1LXQALooSMBW5ufbfSuudPyI2utqWfBll731TI3fyxt0OiRsltz/R/NFMHurNEU3tIaVS
	A1i2Vi8ANKAV4fZyM43qzORsbdG+Do/Q+NU0kXPXOXHAZIaJpBkPJhR8d1s90VCMMqYDItKrEue
	Gxfi3+S/zNcPUHf4eUEzvwLDieny2We/G0y+PBcV5vt2y49LewhybAG4wOXmfNrtpGhumZ+Kpdu
	ia3II2g6660oF+un5WLXw6ZYghJ/zgNHpq3ty9FdGm7q7MY9Z15p7HtmhcI2s=
X-Received: by 2002:a05:600c:450b:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-48069c0fd5amr15861325e9.6.1769509172308;
        Tue, 27 Jan 2026 02:19:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/treewide: More typeof() -> auto conversions
Date: Tue, 27 Jan 2026 10:18:41 +0000
Message-Id: <20260127101841.2213758-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,suse.com:email,amd.com:email,arm.com:email,gitlab.com:url,citrix.com:email,citrix.com:dkim,citrix.com:mid,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C831C92A54
X-Rspamd-Action: no action

All of these are simple cases of using typeof() to avoid multiple parameter
evaluation.  Using auto avoids multiple textural expansion also.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

There's an oddity with SMCCC.  4 or fewer args strictly use unsigned long for
ouput types where 5 or more use a dynamic type.  I've left it as-was, but it
looks wrong.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287583251
---
 xen/arch/arm/include/asm/smccc.h            | 26 +++----
 xen/arch/x86/include/asm/alternative-call.h | 84 ++++++++++-----------
 xen/common/bitops.c                         |  2 +-
 xen/include/xen/bitops.h                    |  4 +-
 xen/include/xen/nospec.h                    |  4 +-
 xen/include/xen/self-tests.h                |  4 +-
 6 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 441b3ab65dee..29f1128bc283 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -129,7 +129,7 @@ struct arm_smccc_res {
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_1(a0, a1, res)                        \
-    typeof(a1) __a1 = (a1);                                 \
+    auto __a1 = (a1);                                       \
     struct arm_smccc_res    *___res = (res);                \
     register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
@@ -137,8 +137,8 @@ struct arm_smccc_res {
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
-    typeof(a1) __a1 = (a1);                                 \
-    typeof(a2) __a2 = (a2);                                 \
+    auto __a1 = (a1);                                       \
+    auto __a2 = (a2);                                       \
     struct arm_smccc_res    *___res = (res);                \
     register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
@@ -146,9 +146,9 @@ struct arm_smccc_res {
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
-    typeof(a1) __a1 = (a1);                                 \
-    typeof(a2) __a2 = (a2);                                 \
-    typeof(a3) __a3 = (a3);                                 \
+    auto __a1 = (a1);                                       \
+    auto __a2 = (a2);                                       \
+    auto __a3 = (a3);                                       \
     struct arm_smccc_res    *___res = (res);                \
     register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
@@ -156,24 +156,24 @@ struct arm_smccc_res {
     register unsigned long  r3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
-    typeof(a4) __a4 = (a4);                             \
+    auto __a4 = (a4);                                   \
     __declare_arg_3(a0, a1, a2, a3, res);               \
     register unsigned long r4 ASM_REG(4) = __a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
-    typeof(a5) __a5 = (a5);                             \
+    auto __a5 = (a5);                                   \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
-    register typeof(a5) r5 ASM_REG(5) = __a5
+    register auto r5 ASM_REG(5) = __a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
-    typeof(a6) __a6 = (a6);                                 \
+    auto __a6 = (a6);                                       \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
-    register typeof(a6) r6 ASM_REG(6) = __a6
+    register auto r6 ASM_REG(6) = __a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
-    typeof(a7) __a7 = (a7);                                     \
+    auto __a7 = (a7);                                           \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
-    register typeof(a7) r7 ASM_REG(7) = __a7
+    register auto r7 ASM_REG(7) = __a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
diff --git a/xen/arch/x86/include/asm/alternative-call.h b/xen/arch/x86/include/asm/alternative-call.h
index b22c10c32283..27024797f584 100644
--- a/xen/arch/x86/include/asm/alternative-call.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -111,7 +111,7 @@ struct alt_call {
 })
 
 #define alternative_vcall1(func, arg) ({           \
-    typeof(arg) v1_ = (arg);                       \
+    auto v1_ = (arg);                              \
     ALT_CALL_ARG(v1_, 1);                          \
     ALT_CALL_NO_ARG2;                              \
     (void)sizeof(func(arg));                       \
@@ -119,15 +119,15 @@ struct alt_call {
 })
 
 #define alternative_call1(func, arg) ({            \
-    typeof(arg) v1_ = (arg);                       \
+    auto v1_ = (arg);                              \
     ALT_CALL_ARG(v1_, 1);                          \
     ALT_CALL_NO_ARG2;                              \
     alternative_callN(1, typeof(func(arg)), func); \
 })
 
 #define alternative_vcall2(func, arg1, arg2) ({           \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                            \
+    auto v1_ = (arg1);                                    \
+    auto v2_ = (arg2);                                    \
     ALT_CALL_ARG(v1_, 1);                                 \
     ALT_CALL_ARG(v2_, 2);                                 \
     ALT_CALL_NO_ARG3;                                     \
@@ -136,8 +136,8 @@ struct alt_call {
 })
 
 #define alternative_call2(func, arg1, arg2) ({            \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                            \
+    auto v1_ = (arg1);                                    \
+    auto v2_ = (arg2);                                    \
     ALT_CALL_ARG(v1_, 1);                                 \
     ALT_CALL_ARG(v2_, 2);                                 \
     ALT_CALL_NO_ARG3;                                     \
@@ -145,9 +145,9 @@ struct alt_call {
 })
 
 #define alternative_vcall3(func, arg1, arg2, arg3) ({    \
-    typeof(arg1) v1_ = (arg1);                           \
-    typeof(arg2) v2_ = (arg2);                           \
-    typeof(arg3) v3_ = (arg3);                           \
+    auto v1_ = (arg1);                                   \
+    auto v2_ = (arg2);                                   \
+    auto v3_ = (arg3);                                   \
     ALT_CALL_ARG(v1_, 1);                                \
     ALT_CALL_ARG(v2_, 2);                                \
     ALT_CALL_ARG(v3_, 3);                                \
@@ -157,9 +157,9 @@ struct alt_call {
 })
 
 #define alternative_call3(func, arg1, arg2, arg3) ({     \
-    typeof(arg1) v1_ = (arg1);                           \
-    typeof(arg2) v2_ = (arg2);                           \
-    typeof(arg3) v3_ = (arg3);                           \
+    auto v1_ = (arg1);                                   \
+    auto v2_ = (arg2);                                   \
+    auto v3_ = (arg3);                                   \
     ALT_CALL_ARG(v1_, 1);                                \
     ALT_CALL_ARG(v2_, 2);                                \
     ALT_CALL_ARG(v3_, 3);                                \
@@ -169,10 +169,10 @@ struct alt_call {
 })
 
 #define alternative_vcall4(func, arg1, arg2, arg3, arg4) ({ \
-    typeof(arg1) v1_ = (arg1);                              \
-    typeof(arg2) v2_ = (arg2);                              \
-    typeof(arg3) v3_ = (arg3);                              \
-    typeof(arg4) v4_ = (arg4);                              \
+    auto v1_ = (arg1);                                      \
+    auto v2_ = (arg2);                                      \
+    auto v3_ = (arg3);                                      \
+    auto v4_ = (arg4);                                      \
     ALT_CALL_ARG(v1_, 1);                                   \
     ALT_CALL_ARG(v2_, 2);                                   \
     ALT_CALL_ARG(v3_, 3);                                   \
@@ -183,10 +183,10 @@ struct alt_call {
 })
 
 #define alternative_call4(func, arg1, arg2, arg3, arg4) ({  \
-    typeof(arg1) v1_ = (arg1);                              \
-    typeof(arg2) v2_ = (arg2);                              \
-    typeof(arg3) v3_ = (arg3);                              \
-    typeof(arg4) v4_ = (arg4);                              \
+    auto v1_ = (arg1);                                      \
+    auto v2_ = (arg2);                                      \
+    auto v3_ = (arg3);                                      \
+    auto v4_ = (arg4);                                      \
     ALT_CALL_ARG(v1_, 1);                                   \
     ALT_CALL_ARG(v2_, 2);                                   \
     ALT_CALL_ARG(v3_, 3);                                   \
@@ -198,11 +198,11 @@ struct alt_call {
 })
 
 #define alternative_vcall5(func, arg1, arg2, arg3, arg4, arg5) ({ \
-    typeof(arg1) v1_ = (arg1);                                    \
-    typeof(arg2) v2_ = (arg2);                                    \
-    typeof(arg3) v3_ = (arg3);                                    \
-    typeof(arg4) v4_ = (arg4);                                    \
-    typeof(arg5) v5_ = (arg5);                                    \
+    auto v1_ = (arg1);                                            \
+    auto v2_ = (arg2);                                            \
+    auto v3_ = (arg3);                                            \
+    auto v4_ = (arg4);                                            \
+    auto v5_ = (arg5);                                            \
     ALT_CALL_ARG(v1_, 1);                                         \
     ALT_CALL_ARG(v2_, 2);                                         \
     ALT_CALL_ARG(v3_, 3);                                         \
@@ -214,11 +214,11 @@ struct alt_call {
 })
 
 #define alternative_call5(func, arg1, arg2, arg3, arg4, arg5) ({  \
-    typeof(arg1) v1_ = (arg1);                                    \
-    typeof(arg2) v2_ = (arg2);                                    \
-    typeof(arg3) v3_ = (arg3);                                    \
-    typeof(arg4) v4_ = (arg4);                                    \
-    typeof(arg5) v5_ = (arg5);                                    \
+    auto v1_ = (arg1);                                            \
+    auto v2_ = (arg2);                                            \
+    auto v3_ = (arg3);                                            \
+    auto v4_ = (arg4);                                            \
+    auto v5_ = (arg5);                                            \
     ALT_CALL_ARG(v1_, 1);                                         \
     ALT_CALL_ARG(v2_, 2);                                         \
     ALT_CALL_ARG(v3_, 3);                                         \
@@ -231,12 +231,12 @@ struct alt_call {
 })
 
 #define alternative_vcall6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({ \
-    typeof(arg1) v1_ = (arg1);                                          \
-    typeof(arg2) v2_ = (arg2);                                          \
-    typeof(arg3) v3_ = (arg3);                                          \
-    typeof(arg4) v4_ = (arg4);                                          \
-    typeof(arg5) v5_ = (arg5);                                          \
-    typeof(arg6) v6_ = (arg6);                                          \
+    auto v1_ = (arg1);                                                  \
+    auto v2_ = (arg2);                                                  \
+    auto v3_ = (arg3);                                                  \
+    auto v4_ = (arg4);                                                  \
+    auto v5_ = (arg5);                                                  \
+    auto v6_ = (arg6);                                                  \
     ALT_CALL_ARG(v1_, 1);                                               \
     ALT_CALL_ARG(v2_, 2);                                               \
     ALT_CALL_ARG(v3_, 3);                                               \
@@ -248,12 +248,12 @@ struct alt_call {
 })
 
 #define alternative_call6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({  \
-    typeof(arg1) v1_ = (arg1);                                          \
-    typeof(arg2) v2_ = (arg2);                                          \
-    typeof(arg3) v3_ = (arg3);                                          \
-    typeof(arg4) v4_ = (arg4);                                          \
-    typeof(arg5) v5_ = (arg5);                                          \
-    typeof(arg6) v6_ = (arg6);                                          \
+    auto v1_ = (arg1);                                                  \
+    auto v2_ = (arg2);                                                  \
+    auto v3_ = (arg3);                                                  \
+    auto v4_ = (arg4);                                                  \
+    auto v5_ = (arg5);                                                  \
+    auto v6_ = (arg6);                                                  \
     ALT_CALL_ARG(v1_, 1);                                               \
     ALT_CALL_ARG(v2_, 2);                                               \
     ALT_CALL_ARG(v3_, 3);                                               \
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index e46ea1d3ecf8..859a4ca5c131 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -147,7 +147,7 @@ static void __init test_for_each_set_bit(void)
  * A copy of @val is taken internally.
  */
 #define for_each_set_bit_reverse(iter, val)             \
-    for ( typeof(val) __v = (val); __v; __v = 0 )       \
+    for ( auto __v = (val); __v; __v = 0 )              \
         for ( unsigned int (iter);                      \
               __v && ((iter) = fls_g(__v) - 1, true);   \
               __clear_bit(iter, &__v) )
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a4d31ec02a7c..24882fb4822d 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -299,7 +299,7 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
  * A copy of @val is taken internally.
  */
 #define for_each_set_bit(iter, val)                     \
-    for ( typeof(val) __v = (val); __v; __v = 0 )       \
+    for ( auto __v = (val); __v; __v = 0 )              \
         for ( unsigned int (iter);                      \
               __v && ((iter) = ffs_g(__v) - 1, true);   \
               __v &= __v - 1 )
@@ -310,7 +310,7 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
  */
 #define multiple_bits_set(x)                    \
     ({                                          \
-        typeof(x) _v = (x);                     \
+        auto _v = (x);                          \
         (_v & (_v - 1)) != 0;                   \
     })
 
diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index c8167a8a245c..0e474145b476 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -51,8 +51,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
  */
 #define array_index_nospec(index, size)                                 \
 ({                                                                      \
-    typeof(index) _i = (index);                                         \
-    typeof(size) _s = (size);                                           \
+    auto _i = (index);                                                  \
+    auto _s = (size);                                                   \
     unsigned long _mask = array_index_mask_nospec(_i, _s);              \
                                                                         \
     BUILD_BUG_ON(sizeof(_i) > sizeof(long));                            \
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index c57cceb3b962..c4937e781f66 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -18,7 +18,7 @@
  */
 #define COMPILE_CHECK(fn, val, res)                                     \
     do {                                                                \
-        typeof(fn(val)) real = fn(val);                                 \
+        auto real = fn(val);                                            \
                                                                         \
         if ( !__builtin_constant_p(real) )                              \
             BUILD_ERROR("'" STR(fn(val)) "' not compile-time constant"); \
@@ -36,7 +36,7 @@
  */
 #define RUNTIME_CHECK(fn, val, res)                     \
     do {                                                \
-        typeof(fn(val)) real = fn(HIDE(val));           \
+        auto real = fn(HIDE(val));                      \
                                                         \
         if ( real != (res) )                            \
             panic("%s: %s(%s) expected %u, got %u\n",   \
-- 
2.39.5



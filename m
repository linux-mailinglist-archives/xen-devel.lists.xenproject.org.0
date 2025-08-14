Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58048B27196
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 00:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082604.1442410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umgO2-0004qw-LK; Thu, 14 Aug 2025 22:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082604.1442410; Thu, 14 Aug 2025 22:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umgO2-0004oh-Hu; Thu, 14 Aug 2025 22:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1082604;
 Thu, 14 Aug 2025 22:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umgO1-0004ob-7f
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 22:25:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940f68b2-795d-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 00:25:27 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b04f8b5so7291405e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 15:25:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6cec65sm37122845e9.11.2025.08.14.15.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 15:25:25 -0700 (PDT)
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
X-Inumbo-ID: 940f68b2-795d-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755210326; x=1755815126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKVFUdCKTfX+XVpvbvYWLH9RGVLOaxaOH7QOH70/CtY=;
        b=WCbwWr6Q58/w5JZ1TC5XNNwYrPaNlrnBmo5jTy4/gQn/xuQ/iQ4SfkOWglb5/SUqf1
         BmkSxWP3gSFBjEwlmN1rr/xxBni/Lu3anmLe/ZSMEUlNA7VWsToRNAowsU8jXB0UuuTg
         kMn8lrbjxtn+sPSpOVJgvCm4Zk/3eS6SDC/Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755210326; x=1755815126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKVFUdCKTfX+XVpvbvYWLH9RGVLOaxaOH7QOH70/CtY=;
        b=kk3ZmnxwN4Y3h/vuCYvXPDuTKYM4SgwNu6BQAqeLxVuiOiYf6dB1qG2joxcHajaWzN
         Egt7RH0070RJY7jbkDTmSSbbAre6Vrk+lrdHFQXw+CAEWcY+Fyx5WcJJfzfTi59GWVPo
         ESc90LrUFypFvd8xjqw3AGLuCxATm18QDXJ1MBJg1BrklP9cMw1gbZMrDqXclOdbqhfj
         MqIxJh5h3QJxz4Vm2RXME4N6nevfuMWMrRqSfqSQ0iRy9heVP4qxnb5V6joD18sZ8rTn
         EXGvkymIUTDkyAywJ6A6pD+MkiU59QP1GRos6ges7+bshA5tgpyltdoVUnJhbjRKwqMu
         ot3A==
X-Gm-Message-State: AOJu0YzEi4ica7NA6NhMcHPiBhwVFQJ5HVbf9fKBvRmv04+7240N4E3f
	o/qWbKnGP4/qQemDmyE0l2th+CpFpLxQAG5/36+P+cDLDHTVugRbyrPAcO0znTBNYnp05NX3Y5o
	YKw4T
X-Gm-Gg: ASbGncs9EIBYEXrbdA080ZAb0NCy67hDFbFl4pBRcc9kfdJQuSjWAeaKSBHhHMkZejg
	+aj7lslUlrp6KOz3lHQcsFGcR5z+zu0GR1wghDD7X4BKTkgAq2CstL8SkmYrQYau24EMB+SD3TV
	CxJHBS6d5jIpDoLPYbLqtHLQFVwDXhmNzTFHSXy0GuodJcCT1mnVVAQDpQJY8hRKIYJL2K5Deu5
	m20cg2q1PnhLObUGGrkIKF8aWpcW/iub3c5JQnYzpHp7Iv+EG01UEXarFbfZEBtAGD7M+eZZ36T
	Q3xVlb1FkixNQ5IffHqJnGV4DDf0Bp8oceBXE16Y/2MN+tDzbINCDq40kcrntZgB8tjcUW10HR4
	1D0e3Tu9yyRa0N5mR7plbHpZGt0CrmhJYbdgoIpGMPxcT8TYaswDJW3CjytVAYnIhdODlL4AM+f
	GD
X-Google-Smtp-Source: AGHT+IGsz8sayD1aehoqLqII8CiRc7etrgUdKkOyoFbLyfBbTsOCNjeLIRRFQD/UxTOyScimHI+raA==
X-Received: by 2002:a05:600c:8010:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-45a217ecb09mr215125e9.10.1755210326392;
        Thu, 14 Aug 2025 15:25:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH v2] xen: Use auto as per C23
Date: Thu, 14 Aug 2025 23:25:24 +0100
Message-Id: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In macros it is common to declare local variables using typeof(param) in order
to ensure that side effects are only evaluated once.  A consequence of this is
double textural expansion of the parameter, which can get out of hand very
quickly with nested macros.

In C23, the auto keyword has been repurposed to perform type inference.

A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
and avoids the double textural expansion.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

The resulting build is identical.

v2:
 * Use auto directly
 * Eclair configuration

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1985289434
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 11 +++++++++--
 docs/misra/C-language-toolchain.rst             |  2 ++
 xen/include/xen/compiler.h                      | 14 ++++++++++++++
 xen/include/xen/macros.h                        | 14 +++++++-------
 4 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 842f8377e561..125f99a06583 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -15,6 +15,7 @@
     __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and \"6.44 Determining the Alignment of Functions, Types or Variables\" of "GCC_MANUAL".
     asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
     __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL".
+    __auto_type: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
     __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
     __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functions Provided by GCC\" of "GCC_MANUAL".
     __builtin_va_arg: non-documented GCC extension.
@@ -26,6 +27,7 @@
 -name_selector+={alignof, "^(__alignof__|__alignof)$"}
 -name_selector+={asm, "^(__asm__|asm)$"}
 -name_selector+={attribute, "^__attribute__$"}
+-name_selector+={auto_type, "^__auto_type$"}
 -name_selector+={builtin_offsetof, "^__builtin_offsetof$"}
 -name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
 -name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
@@ -39,6 +41,7 @@
 "alignof||
 asm||
 attribute||
+auto_type||
 builtin_offsetof||
 builtin_types_p||
 builtin_va_arg||
@@ -114,6 +117,7 @@ volatile"
 -doc_end
 
 -doc_begin="
+    ext_auto_type: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
     ext_c_missing_varargs_arg: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
     ext_enum_value_not_int: non-documented GCC extension.
     ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
@@ -126,6 +130,7 @@ volatile"
     ext_return_has_void_expr: see the documentation for -Wreturn-type in Section \"3.8 Options to Request or Suppress Warnings\" of "GCC_MANUAL".
     ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on void- and Function-Pointers\" of "GCC_MANUAL".
 "
+-name_selector+={ext_auto_type, "^ext_auto_type$"}
 -name_selector+={ext_c_missing_varargs_arg, "^ext_c_missing_varargs_arg$"}
 -name_selector+={ext_enum_value_not_int, "^ext_enum_value_not_int$"}
 -name_selector+={ext_flexible_array_in_array, "^ext_flexible_array_in_array$"}
@@ -139,7 +144,8 @@ volatile"
 -name_selector+={ext_sizeof_alignof_void_type, "^ext_sizeof_alignof_void_type$"}
 
 -config=STD.diag,behavior+={c99,GCC_ARM64,
-"ext_c_missing_varargs_arg||
+"ext_auto_type||
+ext_c_missing_varargs_arg||
 ext_forward_ref_enum_def||
 ext_gnu_array_range||
 ext_gnu_statement_expr_macro||
@@ -149,7 +155,8 @@ ext_return_has_void_expr||
 ext_sizeof_alignof_void_type"
 }
 -config=STD.diag,behavior+={c99,GCC_X86_64,
-"ext_c_missing_varargs_arg||
+"ext_auto_type||
+ext_c_missing_varargs_arg||
 ext_enum_value_not_int||
 ext_flexible_array_in_array||
 ext_flexible_array_in_struct||
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index cb81f5c09872..635936004554 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -94,6 +94,8 @@ The table columns are as follows:
           see Sections "6.48 Alternate Keywords" and "6.44 Determining the Alignment of Functions, Types or Variables" of GCC_MANUAL.
        __attribute__:
           see Section "6.39 Attribute Syntax" of GCC_MANUAL.
+       __auto_type:
+          see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
        __builtin_types_compatible_p:
           see Section "6.59 Other Built-in Functions Provided by GCC" of GCC_MANUAL.
        __builtin_va_arg:
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 88bf26bc5109..38ef5d82ad95 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -64,6 +64,20 @@
 # define asm_inline asm
 #endif
 
+/*
+ * In C23, the auto keyword has been repurposed to perform type inference.
+ *
+ * This behaviour is available via the __auto_type extension in supported
+ * toolchains.
+ *
+ * https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
+ * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
+ */
+#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
+/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23 meaning. */
+#define auto __auto_type
+#endif
+
 /*
  * Add the pseudo keyword 'fallthrough' so case statement blocks
  * must end with any of these keywords:
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index f9ccde86fb23..ceca2e4a1bf1 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -63,18 +63,18 @@
 /* Hide a value from the optimiser. */
 #define HIDE(x)                                 \
     ({                                          \
-        typeof(x) _x = (x);                     \
+        auto _x = (x);                          \
         asm volatile ( "" : "+r" (_x) );        \
         _x;                                     \
     })
 
 #define ABS(x) ({                              \
-    typeof(x) x_ = (x);                        \
+    auto x_ = (x);                             \
     (x_ < 0) ? -x_ : x_;                       \
 })
 
 #define SWAP(a, b) \
-   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
+   do { auto t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
 
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
 
@@ -102,15 +102,15 @@
  */
 #define min(x, y)                               \
     ({                                          \
-        const typeof(x) _x = (x);               \
-        const typeof(y) _y = (y);               \
+        const auto _x = (x);                    \
+        const auto _y = (y);                    \
         (void)(&_x == &_y); /* typecheck */     \
         _x < _y ? _x : _y;                      \
     })
 #define max(x, y)                               \
     ({                                          \
-        const typeof(x) _x = (x);               \
-        const typeof(y) _y = (y);               \
+        const auto _x = (x);                    \
+        const auto _y = (y);                    \
         (void)(&_x == &_y); /* typecheck */     \
         _x > _y ? _x : _y;                      \
     })

base-commit: b2c0dc44b37516b758c38de04c61ad295ac0dff2
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27992C80123
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170287.1495352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUNa-0000qq-1T; Mon, 24 Nov 2025 11:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170287.1495352; Mon, 24 Nov 2025 11:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUNZ-0000od-UI; Mon, 24 Nov 2025 11:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1170287;
 Mon, 24 Nov 2025 11:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNUNZ-0000oX-Bn
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:05:09 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fcc9e2f-c925-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:05:08 +0100 (CET)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-88267973e5cso25609586d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:05:08 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e59ec1dsm98274406d6.50.2025.11.24.03.05.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Nov 2025 03:05:05 -0800 (PST)
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
X-Inumbo-ID: 6fcc9e2f-c925-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763982307; x=1764587107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iUhRz6kyEhDHWy8rKX7at4d36jRoTEsdUQgnZ9zc8s=;
        b=TinVxy3OYyFoJhEnGsyqj6rPc9p0h1oIn9z1JFGq3hFh1Cm0G169Z7Vgdl2wC5DEZy
         L083Idx6LPMmlTtf7/6G7VjlmAx3G6l+vbx/N1keZAvZQ2tDWxpjKF4TdQf0tsMIVWfE
         QVFQpL8Mp7LvICrnz7Gv/2YsVwv2He0RY/oVXxiI5ivQbzejXtQheZMMM2bcpw3oDp5o
         swJN18grl/ktY1OAfIzhScoYeWr0e11iX/z5FY4FuiR7YRBJQbtKt3hEAcpOct/wRDFF
         jVXB2fDU5UrEUdn/6UWi7SXj1W7mmQ6baD4DuFhUSmA5Y7bpKC8ISA8jAmDsZFO2VHrS
         ieAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982307; x=1764587107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iUhRz6kyEhDHWy8rKX7at4d36jRoTEsdUQgnZ9zc8s=;
        b=Eo5sv3n3hgbf3aDAEwDsI2FU9L2EKH6DNw5csEQ27XEna1qCYjh58MwXZeYUPJCjI0
         m99v3fup33TrUi+5kAeEyt95nWgEF0od3Cpz8zEc4frZGVBtcCYc3bWkJFah8/Yn5RZK
         dVEmb4dVD8ywz93kpu4EKAOG2gzYjVhzUYiRcMlb8u4u8bNX15mUe0OmokYhuQgSGNSH
         3JgDQyzJS8ywOTgMZ3ze6TcAUpwLcfU+mwn5D0aoEMh+NsVzXHFEpm7RvOaHKb8p/3m7
         Z70ZTAisFAFBDTVKF8nT8j+SQEKCLB8JiHEOhW/jX0e+hmmy3CSANumZLB0y4zNrJ1ha
         PPPw==
X-Gm-Message-State: AOJu0YzlqJBJSjb4EFex83HceBRVh5Ij6xdFjIzl/80CkPg0wKqznzVT
	Fxug5kDlGTjXvlpdy/gVWMDRq6/bE1N6tHqHIKAF+hgulmvRPiTDyPtClz+5bLs=
X-Gm-Gg: ASbGncv2JqDtdvVXjmbdfVdkcWlE5+cOGmlD94DixpxL2oAfDg6b5fcMJpGcesrvht7
	v558FPHKbvlDYPqi5CIJ9CyYnDUdgLftlETDA/fYf7N0H6cuxRhWN1e/s+VEJGqpb1Zcj3lV4Uu
	sWYafmDQ7iRSUm5du97iUtZFES8vuADKhkH8Hh8FHgCpvxMlZJb1Ml7bvl7kFpbhbwkfGtbVap0
	IgdT4vHS/o9OgoDcmB13zDd3NbIQHstzE+Aee/bK62fnVXQ55LMhLjqmd8UwrYKUVb+G2uT3MtO
	4sdDsgR0mKSaQya8aHLkel8y43vlRqng2SldvWVgtfEO9RmhKZ8p7pj5vtoGGgCRCJMC7T3v2UA
	KC61cjruE0tJvq2JUKkaAMnsWf41ivjSKs6hRTRWusTc3bbz2MRhABklp9e/96f5nupouYKiBwI
	UvCyJiRcDod1oAG0cf3a75hvf3EmIQXm81VZSDhEAIBxdB7lRrWeD0zZ/frG9runJ/HSUWcqP2l
	GBWT7ZnEjd4VwRUJQMWR3e3p9voFTM8MI7zgLSpLxd8OrEhT0+gAI0T/X4kVJP7g1RHW0MXJQ==
X-Google-Smtp-Source: AGHT+IE7MrZHK8YEhAEADYExyNGl8yaoS9nYcML9avP0sv0QXWPR7h72lv2KyDlL84ZwOiQaghUaFw==
X-Received: by 2002:a05:6214:40a:b0:880:53da:fcbc with SMTP id 6a1803df08f44-8847c4d2a76mr151890156d6.7.1763982306504;
        Mon, 24 Nov 2025 03:05:06 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] XEN: enable MC/DC coverage for Clang
Date: Mon, 24 Nov 2025 05:04:34 -0600
Message-ID: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang >= 18 supports Modified Condition/Decision Coverage (MC/DC).
This patch enables the detection and usage of this feature when
compiling Xen with Clang.

- Update detection logic in Kconfig to check for the required set of
  Clang flags for MC/DC:
  '-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc'.
  This bundle is necessary because '-fcoverage-mcdc' requires
  '-fcoverage-mapping', which in turn requires '-fprofile-instr-generate'.
- Update llvm.c to handle the profile format changes (bitmap section)
  required for MC/DC.
- Guard -Wno-error=coverage-too-many-conditions with CONFIG_CC_IS_GCC
  to avoid passing a GCC-only warning option to Clang

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/Kconfig                |  2 +-
 xen/Rules.mk               |  1 +
 xen/arch/x86/Makefile      |  2 +-
 xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index a5e5af3b76..5508993f02 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT
 
 # Compiler supports -fcondition-coverage aka MC/DC
 config CC_HAS_MCDC
-	def_bool $(cc-option,-fcondition-coverage)
+	def_bool $(cc-option,-fcondition-coverage) || $(cc-option,-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc)
 
 # Set code alignment.
 #
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 24f447b957..57ea664f02 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -136,6 +136,7 @@ non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
+    cov-cflags-$(CONFIG_CONDITION_COVERAGE) +=  -fcoverage-mcdc
 else
     cov-cflags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
     cov-cflags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510..6c0ff67fa8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -98,7 +98,7 @@ $(obj)/usercopy.o: CFLAGS-y += -iquote .
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
-ifeq ($(CONFIG_CONDITION_COVERAGE),y)
+ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
 endif
 
diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 532889c857..a8c7e7e8d2 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -120,6 +120,10 @@ extern const char __start___llvm_prf_names[];
 extern const char __stop___llvm_prf_names[];
 extern uint64_t __start___llvm_prf_cnts[];
 extern uint64_t __stop___llvm_prf_cnts[];
+#ifdef CONFIG_CONDITION_COVERAGE
+extern const char __start___llvm_prf_bits[];
+extern const char __stop___llvm_prf_bits[];
+#endif
 
 #define START_DATA      ((const void *)__start___llvm_prf_data)
 #define END_DATA        ((const void *)__stop___llvm_prf_data)
@@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
 #define END_NAMES       ((const void *)__stop___llvm_prf_names)
 #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
 #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
+#define START_BITMAP    ((void *)__start___llvm_prf_bits)
+#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
 
 static void cf_check reset_counters(void)
 {
     memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
+#ifdef CONFIG_CONDITION_COVERAGE
+    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
+#endif
 }
 
 static uint32_t cf_check get_size(void)
 {
-    return ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
+    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
                    END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
+#ifdef CONFIG_CONDITION_COVERAGE
+    size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
+#endif
+    return size;
 }
 
 static int cf_check dump(
@@ -147,11 +160,17 @@ static int cf_check dump(
         .version = LLVM_PROFILE_VERSION,
         .num_data = DIV_ROUND_UP(END_DATA - START_DATA, sizeof(struct llvm_profile_data)),
         .num_counters = DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, sizeof(uint64_t)),
+#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
+        .num_bitmap_bytes = END_BITMAP - START_BITMAP,
+#endif
         .names_size = END_NAMES - START_NAMES,
 #if LLVM_PROFILE_VERSION >= 8
         .counters_delta = START_COUNTERS - START_DATA,
 #else
         .counters_delta = (uintptr_t)START_COUNTERS,
+#endif
+#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
+        .bitmap_delta = START_BITMAP - START_DATA,
 #endif
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
@@ -168,6 +187,9 @@ static int cf_check dump(
     APPEND_TO_BUFFER(&header, sizeof(header));
     APPEND_TO_BUFFER(START_DATA, END_DATA - START_DATA);
     APPEND_TO_BUFFER(START_COUNTERS, END_COUNTERS - START_COUNTERS);
+#if defined(CONFIG_CONDITION_COVERAGE)
+    APPEND_TO_BUFFER(START_BITMAP, END_BITMAP - START_BITMAP);
+#endif
     APPEND_TO_BUFFER(START_NAMES, END_NAMES - START_NAMES);
 #undef APPEND_TO_BUFFER
 
-- 
2.49.0



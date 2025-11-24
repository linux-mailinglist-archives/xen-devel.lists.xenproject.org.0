Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB99C7ED01
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 03:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170108.1495201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNMB0-0005s0-Rm; Mon, 24 Nov 2025 02:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170108.1495201; Mon, 24 Nov 2025 02:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNMB0-0005pK-LX; Mon, 24 Nov 2025 02:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1170108;
 Mon, 24 Nov 2025 02:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNMAz-0005pE-El
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 02:19:37 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0375b106-c8dc-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 03:19:33 +0100 (CET)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4ed82e82f0fso38111591cf.1
 for <xen-devel@lists.xenproject.org>; Sun, 23 Nov 2025 18:19:33 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e65e3bsm78070101cf.17.2025.11.23.18.19.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 23 Nov 2025 18:19:30 -0800 (PST)
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
X-Inumbo-ID: 0375b106-c8dc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763950771; x=1764555571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5v9PSuuDVd2uhCbusTELo+qAKTiBx4CMZ2+0sXsOsYI=;
        b=HlMCeiYcivlfPlzqWQEkWZ/eSwC+dHtxYqAV3LVqlWFM/BBKzEBUWWBjDwawFOnzQM
         9W5WrnyjXXfNvhDjRMENIRxjNHF4zYH9qeKAKvVDCao3+q5HNvwotglYRI5s3sJTql4R
         Xp4EQhZoA/MAvbWIb8guunPsMLqAXZ0qkhsMnrviqcIX7iuDmX3CQMXt+uhvnPFuy9t4
         aOOllqMeooy/RQ2DGdIY3A0c/npATiho1lNPekW4OfDBdGPvSsuwi+L9o7UaQ93vgh+w
         XRA/P2o80ax8tLW7T2LRybPJjLA/OYhC8TVHV2uSbFcs++U2NXa0GseOQCSnkqmLMJqK
         mPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950771; x=1764555571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v9PSuuDVd2uhCbusTELo+qAKTiBx4CMZ2+0sXsOsYI=;
        b=NNoaP/DWygjGnTwEcU2ZDBRkBT5wgnr2qaulF9pfMDiJsn1I18OKKeBvOB9FJcR3GM
         W6ZnNFb9IHEd9asDZIPq0e3hbU5LV4LKf6tRM4UduYrqQAhMQPyXRf2mZRPWWVX8rlO8
         Ud6OgGs8UfjbRYGpuv7ZXj7fuIpMiIxHUaP2M+03dQphaciKebKF4AQK/Hm18sNRGxD4
         sbX+XUoCSc2hwfalgb1dZMO+zV6gUBKqwgNnsxQWfO/BSTl5c3pp5n3V+b/MftQufaBr
         gxpAzgELy401YIGr1yHxeTg9N9FuBc+sjhTNRiJtT0SmVseWy6wG/kpAGIKDG/qmXlgT
         uzbQ==
X-Gm-Message-State: AOJu0Yw+24qfYTcDkPUyf4HjH7UfEjHD92WOEzVKACbAzNsLN9BiTyyJ
	sVoqmzcKUdsE9je5QUyN24yCpgP75ptjBWFhmTF5+6iKaZ9KU0k+y/mJ0BkbcTg=
X-Gm-Gg: ASbGncsDAIMvybj1xvj3VafVspzGyKJ4bOU1ANyZxRL4jOr2ZXHK9BmDiDZpQ/vROvS
	yOq+eJKknbm/vgI2UK/oI2ZBdNPF6YTw+/dM9Mb6TA4KKAmy3n864Bbi5ZImZ9OehoQ1zPsCHUl
	hmdKVafke5XSnVjFTOVd/hPfH53zdw3Ld4vfD4fQTh0U9kuJsg5sqLcGkK4nW0O6RaX1/R/ko1/
	hj03m5UEcPj5cZ+lFDChlNu3Q4J7MqEf/9VePckx9LflIo8Jldg7oVqDtKO9PbRHwuiu3Pam5xB
	vp79ECFCapNDy7Tq8geUMDZTAL+CSV+QsWjf8M40Vf6WYyA8+EWzYinEDj26Nw5CRohUoRzl0Mk
	dTudMUkZiGMejjJhRIIfFQsQ1ItxTTWV+WU1lNAejfe6YRtB7DOC7qwF/sorFfMdflRA2VlBEmV
	yvR5wl2rIquoLdcwaHSVklq9tSjJm3X4Ha4IH1dOxGG1l5+hrj63wxQ7aFBkMkwrAKsrLNZS4db
	V/wm34YUGoUNUQ+P997Dao3EirRhDtzUPiNE9lihItMdfvzmVj/3pp+E1HGsn0yCONy4KhPDhjl
	2tI=
X-Google-Smtp-Source: AGHT+IGUW6aDHv5iZIFtp+fyhmyvRdWPNnUNfHfWzZCOicOaJSbQZNjsOKBPQVxDOgr+w3NVlsrvHA==
X-Received: by 2002:ac8:5d4e:0:b0:4ec:f001:e186 with SMTP id d75a77b69052e-4ee58935cc0mr149551191cf.62.1763950771468;
        Sun, 23 Nov 2025 18:19:31 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] XEN: enable MC/DC coverage for Clang
Date: Sun, 23 Nov 2025 20:18:44 -0600
Message-ID: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang >= 18 supports Modified Condition/Decision Coverage (MC/DC).
This patch enables the detection and usage of this feature when
compiling Xen with Clang.

- Update detection logic to check for '-fcoverage-mcdc' when using Clang.
- Update llvm.c to handle the profile format changes (bitmap section)
  required for MC/DC.
- Guard -Wno-error=coverage-too-many-conditions with CONFIG_CC_IS_GCC
  to avoid passing a GCC-only warning option to Clang

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/Kconfig                |  2 +-
 xen/Rules.mk               |  1 +
 xen/arch/x86/Makefile      |  4 +++-
 xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

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
index 407571c510..00dfc992b3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -99,7 +99,9 @@ ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
 ifeq ($(CONFIG_CONDITION_COVERAGE),y)
-$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
+    ifeq ($(CONFIG_CC_IS_GCC),y)
+        $(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
+    endif
 endif
 
 efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
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



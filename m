Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C6C80B31
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 14:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170896.1495917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWRk-0002ZZ-S8; Mon, 24 Nov 2025 13:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170896.1495917; Mon, 24 Nov 2025 13:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWRk-0002XP-PI; Mon, 24 Nov 2025 13:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1170896;
 Mon, 24 Nov 2025 13:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNWRj-0002XH-60
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 13:17:35 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef507f16-c937-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 14:17:33 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-88043139c35so42759376d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 05:17:32 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e54e9e2sm99403716d6.31.2025.11.24.05.17.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Nov 2025 05:17:31 -0800 (PST)
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
X-Inumbo-ID: ef507f16-c937-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763990251; x=1764595051; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1cmzrTJ50vwCC7yI8wn//dLiVisgkYIouMfBXVIbVA=;
        b=avrHtCjjRuODN+NfYJIh8/JBW4eli56nN/2+auQA1Iw4m2VPJLOdG3k815cwRhsb9q
         62blaAs2vbgdNHwg06AdfxE3Huv3Niv2azbL4Uh0n9296ez9sXudoE5Qt078Wg0HfTMg
         i+EiSuqPs0cn50ZTgOWQLl/dHItPSyRMCZpfCuHZAOWelyPNGHdyv7BKlqtVDse8YUn9
         WaNPR5R5Y8Sboj2/2G2/xDm0k2qXn2Q5D+7hljj1o+nEI9gB+Oy8iQYt+CgP4iJFh8Qk
         GfdX3PBLiakd5MMr2nbdmNoMJ9lkCF8Kd/rSzIblp/IdYE/UjpM33wAFQFPwpreXCjtB
         2FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990251; x=1764595051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1cmzrTJ50vwCC7yI8wn//dLiVisgkYIouMfBXVIbVA=;
        b=J00GTUaDhZkOI7dBi/6VaXyUcs5j1R/7vCPyCf8FgLJbnBqdF2+QWQxB0SW8HjE8OU
         h113npAn6ybLa+94JXxDBJTHQvDB69Ft+POI/G/5GadCNZGjW1TssdkeawunlV+EjHQ2
         XnbNgAVtgUOlsDMrnRjHmX7owdgpW8Xg0YdZP1ETb2OuavmqLt3KdMopuJJt3VG2owiR
         iFySmEJV3ee442xCPebj2c1j9PcKOch2b1lrZnfDIZ+bPb20qEojYcy/yHjiPLQjYHuL
         CZeM+ikgpIv+U6kBP2/h4ItFHIC2iPdp3AD/amVMgzCL0TlnygH4EFd506Hc9oUlmPhv
         W4gg==
X-Gm-Message-State: AOJu0YytZp6BzhHpwuLAmzER1pgJd4/o7TYNg0uvJCB0O5G3yKEt6nDL
	Inrk1BzZ4wIVwws2kbNC2bRq9TklH9ZBQRrBPIESCaDMNd5Uo26DfGLhJivLItQ=
X-Gm-Gg: ASbGncv4beKQ7cYzW/60uAuRJ3ILH9up9VqfGKKbwkM9KRFHlg5pvK1t7Jody7Tx0N5
	lQtBLLvawi1RSvKsW63WAkAQNUksyWgWyUi3sJUo+ZYfh99MbvEIl0iqdgB5fAGj0KiHqzGcm8c
	kllKAWVvojPf3qP9Eaz2CTuNEO0PyMGbvqRFI/QK6KMkNDZC0SPvXYbNXZ8MSWMqz4wm0Zlt7KL
	5j26dvGxE+Ggg5HpkTA1G7Fl4IEazquK+l3+uHT6anWgb5d29b9EZJFtaPZHX+5PGITnjNNVLS8
	eg95VguknObUpM69w9NugBcQuF0iuK7ql1+kM3QjJ93T3Uh8Iv/R9Saoy/5Aod12elxO2eQ1TIY
	Sn2XoYSWuSTlK/gJp7zQFMQ+K5YtftoRgAjL2EpBTHGh8uLDH3onC00e20IaTRJnOoxaFaWHLUk
	xgYBqgsdEDEJv0ONo1S4CyhCKI5zQ5W6Womy87M2hAeTLeHsSlNgbJhcBHB1W2LTOZRJkh15wiv
	iCrlAOWwitur72Nb8/jWFposqQiQOwjP0ptrKivSwXi/LGMRQelTDde1h9sPoVuGP+kaUPQxys8
	HtM=
X-Google-Smtp-Source: AGHT+IFHNRObG6KPLTocz7VgtGSA2GbUMp3Tc8MCg/Az3NT8x2atRCr0Vuu1WHQUjTOS6NRup6GKlA==
X-Received: by 2002:a05:622a:44:b0:4ee:1bc7:9d7b with SMTP id d75a77b69052e-4ee588cb852mr168410651cf.39.1763990251475;
        Mon, 24 Nov 2025 05:17:31 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] XEN: enable MC/DC coverage for Clang
Date: Mon, 24 Nov 2025 07:17:24 -0600
Message-ID: <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
References: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Kconfig                |  9 +++++++--
 xen/Rules.mk               |  1 +
 xen/arch/x86/Makefile      |  2 +-
 xen/common/coverage/llvm.c | 18 +++++++++++++++++-
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index a5e5af3b76..8f2cc111cd 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -51,9 +51,14 @@ config CC_HAS_ASM_GOTO_OUTPUT
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
-# Compiler supports -fcondition-coverage aka MC/DC
+# Compiler supports Modified Condition/Decision Coverage (MC/DC).
+# MC/DC is a rigorous code coverage metric that requires every condition
+# within a decision (boolean expression) to be shown to independently
+# influence the decision's final outcome.
+#
+# Minimum toolchain baseline: GCC >= 14, or Clang >= 18.
 config CC_HAS_MCDC
-	def_bool $(cc-option,-fcondition-coverage)
+	def_bool $(cc-option,-fcondition-coverage) || $(cc-option,-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc)
 
 # Set code alignment.
 #
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 24f447b957..2b28d1ac3c 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -136,6 +136,7 @@ non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
+    cov-cflags-$(CONFIG_CONDITION_COVERAGE) += -fcoverage-mcdc
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
index 532889c857..5663fb10dd 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -120,6 +120,8 @@ extern const char __start___llvm_prf_names[];
 extern const char __stop___llvm_prf_names[];
 extern uint64_t __start___llvm_prf_cnts[];
 extern uint64_t __stop___llvm_prf_cnts[];
+extern const char __start___llvm_prf_bits[];
+extern const char __stop___llvm_prf_bits[];
 
 #define START_DATA      ((const void *)__start___llvm_prf_data)
 #define END_DATA        ((const void *)__stop___llvm_prf_data)
@@ -127,16 +129,23 @@ extern uint64_t __stop___llvm_prf_cnts[];
 #define END_NAMES       ((const void *)__stop___llvm_prf_names)
 #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
 #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
+#define START_BITMAP    ((void *)__start___llvm_prf_bits)
+#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
 
 static void cf_check reset_counters(void)
 {
     memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
+    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
+        memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
 }
 
 static uint32_t cf_check get_size(void)
 {
-    return ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
+    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
                    END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
+    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
+        size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
+    return size;
 }
 
 static int cf_check dump(
@@ -155,6 +164,10 @@ static int cf_check dump(
 #endif
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
+#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
+        .num_bitmap_bytes = END_BITMAP - START_BITMAP,
+        .bitmap_delta = START_BITMAP - START_DATA,
+#endif
     };
     unsigned int off = 0;
 
@@ -168,6 +181,9 @@ static int cf_check dump(
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



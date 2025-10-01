Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F165BB1F24
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 00:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135114.1472471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v451X-0002G1-Ej; Wed, 01 Oct 2025 22:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135114.1472471; Wed, 01 Oct 2025 22:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v451X-0002EP-Bo; Wed, 01 Oct 2025 22:10:11 +0000
Received: by outflank-mailman (input) for mailman id 1135114;
 Wed, 01 Oct 2025 22:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rba4=4K=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1v451W-0002EJ-QD
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 22:10:10 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a19ee0-9f13-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 00:10:09 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-856701dc22aso39531285a.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Oct 2025 15:10:09 -0700 (PDT)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-87772460cbasm86196185a.23.2025.10.01.15.10.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 15:10:07 -0700 (PDT)
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
X-Inumbo-ID: 64a19ee0-9f13-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759356608; x=1759961408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8obnliYdUG73eTILyef34SMYH3QjzHchGje3FN/rKY=;
        b=DhmlAL54wQAghI0EuqY47cwjKPSumK8POmkKBe0mLa6nTiHBW8kifTwlYwvPaFqGoX
         R/5cbaEHzvqKTvRiKPPPW5miu2CHeyxDCFSTQF4/JI3Ycr0tbohbgnEbs1fRW6jQ20xF
         QoLJc9WD/uZDQOfQ49y4JUucbD8QjzX9UEBZMqMmWfU3YbK6TVElHUDoQ1qZpWG+pAun
         eb1DQWMVHs9gyDAZjRsEPkUquesrWW+OSZFDTJ7I9qczMI4AOYpaLMCSNbV+h3cnJrR4
         wJHb+gx7Mm4c/XhSeJU2e9ubnU07aPhLsTtXntZp5nVDpb2zIwLIRkLN5pZGQNH2auY5
         JBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356608; x=1759961408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8obnliYdUG73eTILyef34SMYH3QjzHchGje3FN/rKY=;
        b=Jmawr2t6KCd2ZQWGexlB1RF4eMYR++HpZ0wOtttuAaimRL+HvOh0kdpz/riftwthIJ
         9SnhFvQMBkhO2PdWCKm1lK/Uw/JYvgIyYYvQFw1/fX+9py7ycC4GE0Arl7YLe4t1ciD2
         fm/ZiMZZSeSSmO0Nr3rUusxY8v9ZDbtbWxMuuGLkdHMKxSVX3nvFtDTPX5INA6ZEdVmK
         ar4K0JlzDCR1eVQMcdTdpVZbWhT1uggLZSgo9ES08F6AR1M6zl36oZvnIVQYK3gonj03
         U63+//QahjEISPn0frS9yXH9B1uilqHI0+bE1wVKAyRi3smtGek/0JrUHbH8oH6eScar
         x47Q==
X-Gm-Message-State: AOJu0YzEVmkRSeEv6oui1di3Q8PrY9lyWVURgiIY1P16HzY63noPNusw
	DwxVy1yHNGUL/2vem9n8L/jN9yb1fazrWbS+93jnp4TvaaCeev8PMT4CoBLi
X-Gm-Gg: ASbGncvGVILA11+TKJ9L2QytLQa3GCHv9CrV9V5ToMWrEEoIWtfnpRn9tEgt+61tKgv
	mxtatg+EdQfwQHBPMyBYIPB+YxFLWU2kCQR+9oOOKBg6w9okkr1nzp0w4ClqT7PMkSHw1+QeabZ
	ORDRpMnjs3oim3MiIRYpBS9i8oGnpEyXyBFltrzlH0ilL7rIzhsupd6L0LjVJwkfm8+ZirKl8aA
	dRtu9faasmxOA9oKJvhNJYh8cE2luIrvo6J/0SDD8EyjJaHMggSj+JEN0VfZRQ/wLpGRLlb/frL
	pP0Wsv/QNh4rbaUY3MzqYq14NFOeuGr72m9tvHDB0YHLGqS2/zP30i/YiVScJmwx9vXHwUKBOWb
	3i7wgurH8OmAl+cI1eo4Lbch8ZrqSuSEaC0iAlSLq7ZUdD7e8nx4MjJrFP/lBoMv1FQUF9txGNm
	CjsXMibgbSm11chtwXkTe/8pqJahIo08TN1CK1GVJXYIhQHNwcfY23RcFxmkYf1jXS/6CQrgjfv
	Q==
X-Google-Smtp-Source: AGHT+IFde8Y3z2IjUZvRtkKudHLr7N9A6FoOw1gfmjGZAqapr7RIblLh+bq8YBQr64JxIrL4baRSMA==
X-Received: by 2002:a05:620a:4550:b0:864:c43:865d with SMTP id af79cd13be357-8737566bbafmr813792485a.54.1759356608084;
        Wed, 01 Oct 2025 15:10:08 -0700 (PDT)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Saman Dehghan <samaan.dehghan@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Support LLVM raw profile versions 8, 9, and 10
Date: Wed,  1 Oct 2025 17:09:52 -0500
Message-ID: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enables compatibility for measuring code coverage
with Clang versions 14 through 20 by supporting their
respective raw profile formats.

1- Add support for LLVM raw profile versions 8, 9, and 10
2- Initialized llvm_profile_header for all versions based on llvm source code in 
   `compiler-rt/include/profile/InstrProfData.inc` for each version.
3- We tested this patch for all clang versions from 14 through 20 on both ARM and X86 platform

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
 xen/include/xen/types.h    |  1 +
 2 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 517b2aa8c2..f92f10654c 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,27 +44,55 @@
     ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
 #endif
 
-#define LLVM_PROFILE_VERSION    4
+#if __clang_major__ >= 19
+#define LLVM_PROFILE_VERSION    10
+#define LLVM_PROFILE_NUM_KINDS  3
+#elif __clang_major__ == 18
+#define LLVM_PROFILE_VERSION    9
 #define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ >= 14
+#define LLVM_PROFILE_VERSION    8
+#define LLVM_PROFILE_NUM_KINDS  2
+#else
+#error "Unsupported Clang version"
+#endif
 
 struct llvm_profile_data {
     uint64_t name_ref;
     uint64_t function_hash;
-    void *counter;
-    void *function;
-    void *values;
+    intptr_t *relative_counter;
+#if __clang_major__ >= 18
+    intptr_t *relative_bitmap;
+#endif
+    intptr_t *function;
+    intptr_t *values;
     uint32_t nr_counters;
     uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
+#if __clang_major__ >= 18
+    uint32_t numbitmap_bytes;
+#endif
 };
 
 struct llvm_profile_header {
     uint64_t magic;
     uint64_t version;
-    uint64_t data_size;
-    uint64_t counters_size;
+    uint64_t binary_ids_size;
+    uint64_t num_data;
+    uint64_t padding_bytes_before_counters;
+    uint64_t num_counters;
+    uint64_t padding_bytes_after_counters;
+    uint64_t num_bitmap_bytes;
+    uint64_t padding_bytes_after_bitmap_bytes;
     uint64_t names_size;
+#if __clang_major__ >= 18
     uint64_t counters_delta;
+    uint64_t bitmap_delta;
+#endif
     uint64_t names_delta;
+#if __clang_major__ >= 19
+    uint64_t num_vtables;
+    uint64_t vnames_size;
+#endif
     uint64_t value_kind_last;
 };
 
@@ -76,19 +104,20 @@ struct llvm_profile_header {
  */
 int __llvm_profile_runtime;
 
-extern const struct llvm_profile_data __start___llvm_prf_data[];
-extern const struct llvm_profile_data __stop___llvm_prf_data[];
-extern const char __start___llvm_prf_names[];
-extern const char __stop___llvm_prf_names[];
-extern uint64_t __start___llvm_prf_cnts[];
-extern uint64_t __stop___llvm_prf_cnts[];
+extern char __start___llvm_prf_data[];
+extern char __stop___llvm_prf_data[];
+extern char __start___llvm_prf_names[];
+extern char __stop___llvm_prf_names[];
+extern char __start___llvm_prf_cnts[];
+extern char __stop___llvm_prf_cnts[];
+
+#define START_DATA      ((const char *)__start___llvm_prf_data)
+#define END_DATA        ((const char *)__stop___llvm_prf_data)
+#define START_NAMES     ((const char *)__start___llvm_prf_names)
+#define END_NAMES       ((const char *)__stop___llvm_prf_names)
+#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
+#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)
 
-#define START_DATA      ((const void *)__start___llvm_prf_data)
-#define END_DATA        ((const void *)__stop___llvm_prf_data)
-#define START_NAMES     ((const void *)__start___llvm_prf_names)
-#define END_NAMES       ((const void *)__stop___llvm_prf_names)
-#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
-#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
 
 static void cf_check reset_counters(void)
 {
@@ -107,10 +136,15 @@ static int cf_check dump(
     struct llvm_profile_header header = {
         .magic = LLVM_PROFILE_MAGIC,
         .version = LLVM_PROFILE_VERSION,
-        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
-        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
-        .names_size = END_NAMES - START_NAMES,
-        .counters_delta = (uintptr_t)START_COUNTERS,
+        .binary_ids_size = 0,
+        .num_data = (((intptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)
+                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),
+        .padding_bytes_before_counters = 0,
+        .num_counters = (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
+                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
+        .padding_bytes_after_counters = 0,
+        .names_size = (END_NAMES - START_NAMES) * sizeof(char),
+        .counters_delta = (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
     };
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 73ddccbbd5..799bfe0b95 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -18,6 +18,7 @@ typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 typedef __UINTPTR_TYPE__ uintptr_t;
+typedef __INTPTR_TYPE__ intptr_t;
 
 /*
  * Users of this macro are expected to pass a positive value.
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A72C03F15
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 02:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149791.1481289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC5Tf-0004Pn-2j; Fri, 24 Oct 2025 00:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149791.1481289; Fri, 24 Oct 2025 00:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC5Te-0004Nm-Vg; Fri, 24 Oct 2025 00:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1149791;
 Fri, 24 Oct 2025 00:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EH92=5B=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vC5Td-0004MC-GO
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 00:16:17 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a78058c3-b06e-11f0-9d15-b5c5bf9af7f9;
 Fri, 24 Oct 2025 02:16:16 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-89cd189ada3so111676285a.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 17:16:15 -0700 (PDT)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c1169a577sm267372385a.35.2025.10.23.17.16.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 17:16:13 -0700 (PDT)
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
X-Inumbo-ID: a78058c3-b06e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761264974; x=1761869774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJGAc5g1HlYm2yuCkMWbVplBSlxeGyWyA09NaRPJC28=;
        b=TJ/9ofhCY+avcUCkp3UvmYnIMvpeUpHTZHdWodHy8DKvi4XqNScpScHmB+pO9kkHvx
         1UEiMOr8zMkjRXfYtJyBg0Xr8wJwfvdcEoF+ITfhRBB1sYBPDSK4bo1t1v+gqrSEDAS4
         jBQKlQxd9koa6xO2GEQVBoF5jKtDkuT71Tz4/IoKeb534CkCMUbQAFN3yTfUvFgBQCXc
         pj7xjsvjrAwkFIt3sgQMWiVltTcqOhuP/Gcqt9DBKNaJD6e/xSjYTAu/vlb25cFuaaj2
         aZMB8xk1YrNiFLRxvSddziZ0GY+6K1heEjpC4e2RUzVeiE0bP/gNpdAmzO564+bKVFoP
         gDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264974; x=1761869774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJGAc5g1HlYm2yuCkMWbVplBSlxeGyWyA09NaRPJC28=;
        b=ELa2I4z4qaYiq28hk+JFW5QFf48r8rZ2Y6HV+7LMnUeM5XnaHooL2IPExFHRFlKatX
         Cik2546BfFfuffzkFAbw8DS8sak8XYuxSCkP7UdeUIon9ahf/5RP2hAOAvk7N5dCWa4N
         qXO4tfyc34WZxFxcxu+S34/0omeLymTI+bHkFWJr3PeIs0VyuJEIFcPoToFmsyzhqT2+
         UQ1wb2XgHnCvS2TxbVDnHnw9A4AVKR1gqUVWOFcX/dxK1bqAAfTzcw0zLe3+1tsCPNVx
         Dws1PKlvAP+J2aF5tjR+MQ4e6rVrJ7QoPjbMza8+KdnlrEn5C5BSBJAar88oc3BcOiXS
         +CTQ==
X-Gm-Message-State: AOJu0Yw9SrxxUAO6U8nM4ONaWPmRbcTEFqj+2sfGTMhD/jfShrC7k0pL
	qNONgSQVDoAaeSmTmgpFbEfYCsBuMei1f+XFQNsOKgR12XMEMf+AAL30MXZdQzM=
X-Gm-Gg: ASbGncsRruiwUb26xACqxLW0pPa+rnvGkbt3pRNLgwnZ3rDRT2cOT34kheg7bit1UME
	UHhe52yt8CSMa2Q4gGE+SAGJEjJeE/voXfh8lQbh07i1o6myzXkJsUXb+iXhjxw9yQI9VHZA6jy
	wkDe25ZenTXFvcXcKcsHukVw0cpRxQV8187XUlsfQF9PHtsoI9wI6u1oLqM3E5hjvmkMPXDa+/6
	hca9RTRcoEzM6gpRPeE+vL28ql3nKqStM8UY4PWh3N8WyDCiE8iZ1b3a9vMtrWQqHx7VlKyjhP/
	mE9GdZ2IuTdnOSW6rX6eTZg5ABmpTu/fFx7h+AauFOJkku3CDtwqnyIleGNixm44+eNrArWMGGJ
	etkPfp+qFObwf0QVwvubIIASi/a4wH0AutYHeq2I2ZDPfi3slanboWkrnF8wNZ9dzX6I8KrTc6R
	tN3/zuoHR/iHRCafO4EAm/xY/Im2ry7jurXJJagVyMFmvB0Fs36sOQ+dz9QiFTFewmXYbIxcuc/
	6Wj2z2l+Y0JPL5wGMlGwNqdGaT/R9hsnBlcgBxp+Q==
X-Google-Smtp-Source: AGHT+IHhywd/b+j7MZ4cLej2VfEKJgoicIWcip9gYUm5jxGqo6M5dskRGKl+5OdirElmYsxE/Fn4nw==
X-Received: by 2002:a05:620a:170a:b0:891:5a6a:fe9b with SMTP id af79cd13be357-89da2275963mr114774285a.33.1761264974088;
        Thu, 23 Oct 2025 17:16:14 -0700 (PDT)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Wentao Zhang <wentaoz5@illinois.edu>,
	Matthew L Weber <matthew.l.weber3@boeing.com>
Subject: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10
Date: Thu, 23 Oct 2025 19:16:11 -0500
Message-ID: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
References: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enables compatibility for measuring code coverage
with Clang versions 14 through 20 by supporting their
respective raw profile formats.

1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
2- Initialized llvm_profile_header for all versions based on llvm source code in
   compiler-rt/include/profile/InstrProfData.inc for each version.
3- We tested this patch for all Clang versions from 11 through 20 on x86 platform.
4- Fixed linking warnings related to coverage code in x86.

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 xen/arch/x86/xen.lds.S     |  6 ++++
 xen/common/coverage/llvm.c | 73 ++++++++++++++++++++++++++++++++++----
 xen/include/xen/xen.lds.h  | 18 ++++++++++
 3 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 966e514f20..5d02f83a40 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -186,6 +186,8 @@ SECTIONS
   } PHDR(note) PHDR(text)
 #endif
 
+  LLVM_COV_RO_DATA
+
   _erodata = .;
 
   . = ALIGN(SECTION_ALIGN);
@@ -323,6 +325,8 @@ SECTIONS
        *(.data .data.*)
   } PHDR(text)
 
+  LLVM_COV_RW_DATA
+
   DECL_SECTION(.bss) {
        __bss_start = .;
        *(.bss.page_aligned*)
@@ -357,6 +361,8 @@ SECTIONS
 
   DWARF2_DEBUG_SECTIONS
 
+  LLVM_COV_DEBUG
+
 #ifdef CONFIG_HYPERV_GUEST
   hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
 #endif
diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 517b2aa8c2..e3272a546f 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,27 +44,65 @@
     ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
 #endif
 
-#define LLVM_PROFILE_VERSION    4
+#if __clang_major__ >= 19 && __clang_major__ <= 20
+#define LLVM_PROFILE_VERSION    10
+#define LLVM_PROFILE_NUM_KINDS  3
+#elif __clang_major__ == 18
+#define LLVM_PROFILE_VERSION    9
 #define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ >= 14
+#define LLVM_PROFILE_VERSION    8
+#define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ == 13
+#define LLVM_PROFILE_VERSION    7
+#define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ >= 11
+#define LLVM_PROFILE_VERSION    5
+#define LLVM_PROFILE_NUM_KINDS  2
+#else
+#error "LLVM coverage selected but an unsupported clang version is used"
+#endif
 
 struct llvm_profile_data {
     uint64_t name_ref;
     uint64_t function_hash;
-    void *counter;
+    void *relative_counter;
+#if __clang_major__ >= 18
+    void *relative_bitmap;
+#endif
     void *function;
     void *values;
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
+#if __clang_major__ >= 13
+    uint64_t binary_ids_size;
+#endif
+    uint64_t num_data;
+    uint64_t padding_bytes_before_counters;
+    uint64_t num_counters;
+    uint64_t padding_bytes_after_counters;
+#if __clang_major__ >= 18
+    uint64_t num_bitmap_bytes;
+    uint64_t padding_bytes_after_bitmap_bytes;
+#endif
     uint64_t names_size;
     uint64_t counters_delta;
+#if __clang_major__ >= 18
+    uint64_t bitmap_delta;
+#endif
     uint64_t names_delta;
+#if __clang_major__ >= 19 && __clang_major__ <= 20
+    uint64_t num_vtables;
+    uint64_t vnames_size;
+#endif
     uint64_t value_kind_last;
 };
 
@@ -107,11 +145,34 @@ static int cf_check dump(
     struct llvm_profile_header header = {
         .magic = LLVM_PROFILE_MAGIC,
         .version = LLVM_PROFILE_VERSION,
-        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
-        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
+#if __clang_major__ >= 13
+        .binary_ids_size = 0,
+#endif
+        .num_data = ((END_DATA + sizeof(struct llvm_profile_data) - 1)
+                - START_DATA) / sizeof(struct llvm_profile_data),
+        .padding_bytes_before_counters = 0,
+        .num_counters = ((END_COUNTERS + sizeof(uint64_t) - 1)
+                - START_COUNTERS) / sizeof(uint64_t),
+        .padding_bytes_after_counters = 0,
+#if __clang_major__ >= 18
+        .num_bitmap_bytes = 0,
+        .padding_bytes_after_bitmap_bytes = 0,
+#endif
         .names_size = END_NAMES - START_NAMES,
+#if __clang_major__ >= 14
+        .counters_delta = START_COUNTERS - START_DATA,
+#else
         .counters_delta = (uintptr_t)START_COUNTERS,
+#endif
+
+#if __clang_major__ >= 18
+        .bitmap_delta = 0,
+#endif
         .names_delta = (uintptr_t)START_NAMES,
+#if __clang_major__ >= 19 && __clang_major__ <= 20
+        .num_vtables = 0,
+        .vnames_size = 0,
+#endif
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
     };
     unsigned int off = 0;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index b126dfe887..42550a85a2 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -81,6 +81,24 @@
   .stab.index 0 : { *(.stab.index) }         \
   .stab.indexstr 0 : { *(.stab.indexstr) }
 
+#if defined(CONFIG_COVERAGE) && defined(CONFIG_CC_IS_CLANG)
+
+#define LLVM_COV_RW_DATA                                   \
+    DECL_SECTION(__llvm_prf_cnts) { *(__llvm_prf_cnts) }   \
+    DECL_SECTION(__llvm_prf_data) { *(__llvm_prf_data) }   \
+    DECL_SECTION(__llvm_prf_bits) { *(__llvm_prf_bits) }
+
+#define LLVM_COV_RO_DATA                                   \
+    DECL_SECTION(__llvm_prf_names) { *(__llvm_prf_names) }
+
+#define LLVM_COV_DEBUG                                     \
+    DECL_DEBUG(__llvm_covfun, 8)                           \
+    DECL_DEBUG(__llvm_covmap, 8)
+#else
+#define LLVM_COV_RW_DATA
+#define LLVM_COV_RO_DATA
+#define LLVM_COV_DEBUG
+#endif
 /*
  * ELF sections.
  *
-- 
2.49.0



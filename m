Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB4C1190D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 22:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151796.1482335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUoO-0003II-RC; Mon, 27 Oct 2025 21:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151796.1482335; Mon, 27 Oct 2025 21:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUoO-0003FA-NT; Mon, 27 Oct 2025 21:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1151796;
 Mon, 27 Oct 2025 21:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tA0f=5E=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vDUoN-0003F4-Gu
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 21:31:31 +0000
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [2607:f8b0:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c37aae6-b37c-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 22:31:29 +0100 (CET)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-430d06546d3so47128135ab.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 14:31:29 -0700 (PDT)
Received: from wirelessprv-10-195-113-235.near.illinois.edu
 (mobile-130-126-255-145.near.illinois.edu. [130.126.255.145])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5aea73dc10bsm3577491173.7.2025.10.27.14.31.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 14:31:27 -0700 (PDT)
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
X-Inumbo-ID: 4c37aae6-b37c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761600688; x=1762205488; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5flQN2+DVKOQ4Kbqjyc43ZkLPZFyCReYvsM6zkADKI=;
        b=jYt1x94ZCOpePJdVzEt/WYhGpNSdtceclzlxmb63GURyAxyIk2zbDoHI4k2mmdyn+g
         pEguL4OO3ANtRj7o5LG+4/dSVyLPScKRZ1NIw9lTvTG6dRtciQ+mHWzeChyzMsDyJGte
         5mmKKXtGFvsaIUPOBhLibz1EdQtIPjJZ9uxQ85jnSwOW/ikB1UEGTH/hcG7R9sP/ZM7R
         lS1xr/HU7MUn/LjwP6jqI7CSQiy3yPjdBgHTNoow7sxaz96cOo67fJWW5+37vpG+LOil
         ji/rPMIYL7lrBtWdpxzCBZPLa5dBOgG3e4RV05PvU2OlummpNMR2/Cq3Zxh0U53Wgzeu
         iXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761600688; x=1762205488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5flQN2+DVKOQ4Kbqjyc43ZkLPZFyCReYvsM6zkADKI=;
        b=Md220kZ4ua9XwoAVxnKpW+wruaRJ3PdUsJ6DoHhNY46rM+7K560VICLr+hDFh27vN0
         R8bR2lBab7AxBdzvI4nRIxz89302FHljJTMQT6VWh8axcbYckZCJxCRpKzFhzJr7L4mW
         Ffd9MrKTyo90qH04St1RkoWaFNGtxg8BGY5FT02mEwzOsVnu/HJ+raL7G2oZtfwG0Bkg
         Fhsd4ybvVo15/7STajLNryBqP7pln+I4cuTDOkrQ7nb7GeIP3RFl6r2H3pFzYiWiPZsm
         9DoMbplwRGUQElQklDLr68s40I+CzaorDBb4OUZGFKlFGWKcn8lwGUGzx29Kug48Sx9j
         mEAA==
X-Gm-Message-State: AOJu0YyvNjYZ5k5zXDgOJlaogv2ewQH/os1T60KjI5Zo0+4c90jqO07p
	y5LRV4FfoF08D9SBtBctU0LgY4b6dOinus422PaizBAYcrCdmyk6bPyGUpcl3Ss=
X-Gm-Gg: ASbGncv89b+ypNJdU5j7yeZCAdmJ/UK/yNt5tDiU1jfAZmYmiRB1Zo6TTKl45ohF2Nu
	xV+8x1Rw3+ul1CP55pvS0K8a00kCNPAQW99ZlmDzaGgVnuCQKsMs2oxJZoV2ZaRdwqlzozJaEgl
	b34KpHUfUsFKNVvL5TURaM8PifDX4hktf2BFrYpHiUF2ZZSxoGz/BL0u2x93a54xHbm+E5OzYBp
	xuj+lVSiAd6SauGBUObPwmke7khOjA0OB+AUbRt63JcBhUV43VysOzqsBXOrCGgTpjG0lLIvpVb
	R5zJwCt2wbobKQ+5b4jH2bTjVEHaRbZPm/7VX3WEJwNfKOalZnyOXMqY8gqv/oC9kzlOvblYdWm
	agmGKRTFeZfHcBOLmQcBbPWxxJdw8htBbcY2yslrVz64IG1+Bj9Wb5u99uwYuNOlssGXWFh/vSo
	HwineYeYoqiDB6/XaApBfbb8qIhkmMAEMVPEOt2NqxOuUycXq1wxy4Mvpq7SEOyWceloFc27PXJ
	X9AeJ68R0GKYDscAf4VAcoAQ7VQ8AXNDhAw5KPRic/WAoZc/Zg=
X-Google-Smtp-Source: AGHT+IEm7pte/PLitjU4ni195C4zq4LfZ9T2dBx1GBmVHJ90HbhEGAXEDN1OYFBzJ+g/aYCBjTWovg==
X-Received: by 2002:a05:6e02:16c6:b0:42d:8c07:70d2 with SMTP id e9e14a558f8ab-4320f7cb417mr24477155ab.11.1761600687578;
        Mon, 27 Oct 2025 14:31:27 -0700 (PDT)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wentao Zhang <wentaoz5@illinois.edu>,
	Matthew L Weber <matthew.l.weber3@boeing.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4] xen: Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10
Date: Mon, 27 Oct 2025 16:30:51 -0500
Message-ID: <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enables compatibility for measuring code coverage
with Clang versions 11 through 20 by supporting their respective raw
profile formats.

1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
2- Initialized llvm_profile_header for all versions based on llvm source
   code in compiler-rt/include/profile/InstrProfData.inc for each version.
3- We tested this patch for all Clang versions from 11 through 20
   on x86 platform.
4- Fixed linking warnings related to LLVM profile sections in x86.


Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Tested-by: Wentao Zhang <wentaoz5@illinois.edu>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes from v3 to v4:
  1- Use LLVM_PROFILE_VERSION in preprocessor conditionals
     instead of __clang_major__.
  2- Use DIV_ROUND_UP helper.
  3- Remove unnecessary zero initialization inside struct.
  4- Remove fallback macro definitions in linker script.
Changes from v2 to v3:
  1- Additionally support raw profile version 5, 6, 7 in clang 11, 12, 13.
  2- Fix coverage related linking warnings in x86.
  3- Revert unnecessary type changes, casting, etc.
---
 xen/arch/x86/xen.lds.S     |  6 +++++
 xen/common/coverage/llvm.c | 54 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/xen.lds.h  | 13 +++++++++
 3 files changed, 67 insertions(+), 6 deletions(-)

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
index 517b2aa8c2..532889c857 100644
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
+#if LLVM_PROFILE_VERSION >= 9
+    void *relative_bitmap;
+#endif
     void *function;
     void *values;
     uint32_t nr_counters;
     uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
+#if LLVM_PROFILE_VERSION >= 9
+    uint32_t numbitmap_bytes;
+#endif
 };
 
 struct llvm_profile_header {
     uint64_t magic;
     uint64_t version;
-    uint64_t data_size;
-    uint64_t counters_size;
+#if LLVM_PROFILE_VERSION >= 7
+    uint64_t binary_ids_size;
+#endif
+    uint64_t num_data;
+    uint64_t padding_bytes_before_counters;
+    uint64_t num_counters;
+    uint64_t padding_bytes_after_counters;
+#if LLVM_PROFILE_VERSION >= 9
+    uint64_t num_bitmap_bytes;
+    uint64_t padding_bytes_after_bitmap_bytes;
+#endif
     uint64_t names_size;
     uint64_t counters_delta;
+#if LLVM_PROFILE_VERSION >= 9
+    uint64_t bitmap_delta;
+#endif
     uint64_t names_delta;
+#if LLVM_PROFILE_VERSION == 10
+    uint64_t num_vtables;
+    uint64_t vnames_size;
+#endif
     uint64_t value_kind_last;
 };
 
@@ -107,10 +145,14 @@ static int cf_check dump(
     struct llvm_profile_header header = {
         .magic = LLVM_PROFILE_MAGIC,
         .version = LLVM_PROFILE_VERSION,
-        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
-        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
+        .num_data = DIV_ROUND_UP(END_DATA - START_DATA, sizeof(struct llvm_profile_data)),
+        .num_counters = DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, sizeof(uint64_t)),
         .names_size = END_NAMES - START_NAMES,
+#if LLVM_PROFILE_VERSION >= 8
+        .counters_delta = START_COUNTERS - START_DATA,
+#else
         .counters_delta = (uintptr_t)START_COUNTERS,
+#endif
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
     };
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index b126dfe887..d80c895959 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -81,6 +81,19 @@
   .stab.index 0 : { *(.stab.index) }         \
   .stab.indexstr 0 : { *(.stab.indexstr) }
 
+/* Clang coverage sections. */
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
+
 /*
  * ELF sections.
  *
-- 
2.49.0



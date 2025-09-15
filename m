Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAFB582A1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 18:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124381.1466763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyCUv-0006Sp-Bq; Mon, 15 Sep 2025 16:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124381.1466763; Mon, 15 Sep 2025 16:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyCUv-0006Pj-8f; Mon, 15 Sep 2025 16:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1124381;
 Mon, 15 Sep 2025 16:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+7g=32=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1uyCUu-0006Pd-7E
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 16:56:12 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0cd7200-9254-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 18:56:10 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-8127215a4c6so518367385a.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 09:56:10 -0700 (PDT)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-820c974d5edsm837402085a.26.2025.09.15.09.56.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 15 Sep 2025 09:56:08 -0700 (PDT)
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
X-Inumbo-ID: e0cd7200-9254-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757955369; x=1758560169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rAZQe97A8nOk7FS8pbW2Xc+T7ma3O2xAHfOfQiOuws=;
        b=Pjda92+4R+3jaesJYmKusDi2vD9cnO/1+R7Jj9aJTuIhyEENx/GvWbE00sKWLkqfIS
         abstBLS2yyor4o75+nPK5xajukTeluqMF7F8EXBlkMmQX7kFUq7yky1wRjmtVMExoxDB
         c0i8DIIxauoqxjZSzM2aFTHNUjLwjbHp+N1YeNGQkJE8tb6rf1MyCjctzPrG1/JHzfji
         psxbh9s7xmzj8i5nXrMXYABoMtTU9nqA2O036sbD3xpLw7kUcQUMwosv8wvyI1yklQCn
         PlGbAxxP4j2Mw3Yb/HNrW+BRtovZ9WqkMNxNtMah+mBr+dNTgmoVIZ+OhcG8beGa4T7F
         cNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955369; x=1758560169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rAZQe97A8nOk7FS8pbW2Xc+T7ma3O2xAHfOfQiOuws=;
        b=U97kNj1z2171CHk8bqNPkFlqIUcs45XTSgaJQjJTpD3PlTmh9GeIjrG7C7lB34Jyd1
         JerV7ZivpTH/c/s9WJPwmAZbk63/sGlyfVMBkNIzsPHMHnoV8NGAwlQKWrjSpZLxS58K
         qyCxgVPylH7rQzyQco9Zcab9VPK59FU0nsRV6tyb3JRwc9wFpBFCtjK4Z487l03RZc/z
         xPepDxsVNE6+bS+RiTJxgNymoxGrslvhk8JgBr6lIvTX3aK6o7R1YZU74VjAGplHOgZ1
         kynCGufjn55HR427crWXffmWJyTC966sUBAFG5TNBUBb/wwlwQLs2ubC8hILaG+adsRJ
         yvvw==
X-Gm-Message-State: AOJu0YzaKCdyOLDHQbhHxVlliicxri557oq65OYeZF87JgG0zsZUZyhb
	3Eei0gK6gnDLhecehANqTg02taFT2H8ayo5Z8fFFpbQfndyfyHFVgyhzU9PEAH8=
X-Gm-Gg: ASbGncs4JtwPyK+3orR22dQE9Yec9gOt4KFoVjS4YdxSKmtm9RM3lzByPbefZVtkRIy
	FmQJfpMjLvCa5oP45gZly+61NlZyZCpz/tBIORLQo7A/zosgcvPfnN/DmzMwkETcJ0tDagR688/
	OEhojBUsUV30nbcOPfwHxpzEJcjBC7Ll8NUOHcrWTvS68gt4MZu6KlePjsNgcLmuGkujabfEc75
	BANSQkqI266NZ5MxD9c0UjG4E9ZxWqlbDcoK2z9bX33epcMUw7PqSY+dQdv0LBL0gSsk+K6Sz7k
	1fcZYluNkzm+R1Ft8VoclPXQqCkUk+38aA1nxKDwylo9pPaFG2JWu4aI1yve+OJarCgpEGrLlkk
	7AjHjnUiL7vm353PLMTVp4jtKlv9qptfvr0g5GP+BgoSxJXJLyEgfFUqUP9IdK8njkIomgVpNBp
	5RmnvCMmCsoGJ+ZpW565Dc4iROzmH5vGty1XKc4/mCQlXCMPEQPkJcRapRR66o
X-Google-Smtp-Source: AGHT+IEUZt+Slbf2P4wxa7IUZCWchf5tchX1yumP4roroVSNZApDnQHzN0X3nxgCiIUQln9gdyYEmw==
X-Received: by 2002:a05:620a:7185:b0:823:f5e9:db04 with SMTP id af79cd13be357-823f5e9dba8mr1283601785a.33.1757955368482;
        Mon, 15 Sep 2025 09:56:08 -0700 (PDT)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Saman Dehghan <samaan.dehghan@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [llvm coverage] Update LLVM profile raw format from v4 to v10
Date: Mon, 15 Sep 2025 11:56:05 -0500
Message-ID: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates the LLVM profile raw format in
`xen/common/coverage/llvm.c` from version 4 to version 10,
enabling compatibility with LLVM versions 19 and 20.
While the patch supports only one version:
1. It seems better to support one version than no version --
   the current profile version 4 is not compatible with
   LLVM version 11 or later
2. The patch could be extended to support multiple
   LLVM profile versions, e.g., from 5 to 10

The llvm-cov toolchain, with its Source-based Code Coverage,
offers two substantial advantages over gcov:
  - More accurate coverage reporting when compiler optimizations
    are enabled, ensuring better analysis of optimized code.
  - Better tracking of coverage across inlined function boundaries,
    critical for complex control flows in Xen.

Overall, this change would enhance Xen's code coverage analysis
capabilities by leveraging the latest LLVM toolchain improvements,
particularly for safety-critical hypervisor code.

The patch modifies only `xen/common/coverage/llvm.c`,
maintaining API compatibility while enabling modern toolchain support.
Testing was performed with LLVM 19 and 20 to confirm functionality.

---
 xen/common/coverage/llvm.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 517b2aa8c2..3da82c6cda 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,27 +44,37 @@
     ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
 #endif
 
-#define LLVM_PROFILE_VERSION    4
-#define LLVM_PROFILE_NUM_KINDS  2
+#define LLVM_PROFILE_VERSION    10
+#define LLVM_PROFILE_NUM_KINDS  3
 
 struct llvm_profile_data {
     uint64_t name_ref;
     uint64_t function_hash;
-    void *counter;
+    void *relative_counter;
+    void *relative_bitmap;
     void *function;
     void *values;
     uint32_t nr_counters;
     uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
+    uint32_t numbitmap_bytes;
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
     uint64_t counters_delta;
+    uint64_t bitmap_delta;
     uint64_t names_delta;
+    uint64_t num_vtables;
+    uint64_t vnames_size;
     uint64_t value_kind_last;
 };
 
@@ -110,7 +120,7 @@ static int cf_check dump(
         .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
         .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
         .names_size = END_NAMES - START_NAMES,
-        .counters_delta = (uintptr_t)START_COUNTERS,
+        .counters_delta = (uintptr_t)(START_COUNTERS - START_DATA),
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
     };
-- 
2.49.0



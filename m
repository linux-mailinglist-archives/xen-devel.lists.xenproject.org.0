Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4A994252
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812824.1225599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5nT-0005M2-Td; Tue, 08 Oct 2024 08:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812824.1225599; Tue, 08 Oct 2024 08:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5nT-0005JL-Q3; Tue, 08 Oct 2024 08:42:23 +0000
Received: by outflank-mailman (input) for mailman id 812824;
 Tue, 08 Oct 2024 08:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTuH=RE=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sy5nR-0004xD-Ut
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:42:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ba6a7c1-8551-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:42:21 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so6176113a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:42:21 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e784012sm478647966b.109.2024.10.08.01.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 01:42:19 -0700 (PDT)
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
X-Inumbo-ID: 3ba6a7c1-8551-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728376940; x=1728981740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpXWYdq1849X0Tk2QXIfCmOFvI7h/tXkYDx2ovlXJWA=;
        b=Sqi57o6Gv7LKofPAEc1Z7xMl/V4KGxC+1LxB8DfWtRbgwhEb26eTrQNgf+3b5lqC4R
         a+wOpD6WWAUEpcGi8HFq2L7JgAZJNkAUjiWHrTGHEZVlZmvUKx5LFel5TTO4OwLT1PVs
         8MAKNDnytti/tS84jqCeBYiBu+D9AIWJ7m1UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376940; x=1728981740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpXWYdq1849X0Tk2QXIfCmOFvI7h/tXkYDx2ovlXJWA=;
        b=XXUUNJjpfg4+Ql1ZnoDJ3eHDcyHo+nIkEecZQ6SOCrM7dE4Jl19hChaSROFAFdrlbv
         M0u295DNNxPH3zsbAe8NbvLMtSWTHUrZ7/UPIO//JWiIT0qKDpuWtzsUj3N066vT1Zya
         Nz+Sx1YLKqLFHJRoX4UveyGqi1qYQBE9OlobhrGD5BxbrIk+zqPyP9P9TQV9MBP7MSEf
         5RzU+rQGw0dHKciRpRq8aTNfBqsJMmJGeWz/OPypNGl6zfNN9b15LjCMT3wj7bCzn3yy
         4H2CPQOuDF2PKFJhqfjCL7lCmZkxg3iM7stS9CZK9CKyLHMxODSU7Eyt6kfjdtGHVwwk
         Q4WA==
X-Gm-Message-State: AOJu0YyZOpYcijD6GQJ0zn+/qzK/5JRw1qcGAWTjrp+15VgirPJFWlKO
	pBKx98inIhCKcHDFSFYswk+wqeDMdmeiy5r7Esxabqu2cYxQ02aKhjTOtxRVPk0Go8DY+92T/YY
	w
X-Google-Smtp-Source: AGHT+IFRkwahzJHXTsFCJeQ5jZuq7EfZBvMwgXTPOofdTv89NQ4RuznEoEO+xzanrMjlq7Lbm645sg==
X-Received: by 2002:a17:907:1ca9:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-a991bd497d1mr1368907366b.24.1728376940413;
        Tue, 08 Oct 2024 01:42:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86: Use standard C types in multiboot2.h header
Date: Tue,  8 Oct 2024 09:41:57 +0100
Message-Id: <20241008084157.35652-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header already uses standard types for many fields, extend
their usage.
No functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/multiboot2.h | 62 ++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
index f792040205..7cda620eec 100644
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -115,46 +115,46 @@
 
 #ifndef __ASSEMBLY__
 typedef struct {
-    u32 total_size;
-    u32 reserved;
+    uint32_t total_size;
+    uint32_t reserved;
 } multiboot2_fixed_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
+    uint32_t type;
+    uint32_t size;
 } multiboot2_tag_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u32 load_base_addr;
+    uint32_t type;
+    uint32_t size;
+    uint32_t load_base_addr;
 } multiboot2_tag_load_base_addr_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
+    uint32_t type;
+    uint32_t size;
     char string[];
 } multiboot2_tag_string_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u32 mem_lower;
-    u32 mem_upper;
+    uint32_t type;
+    uint32_t size;
+    uint32_t mem_lower;
+    uint32_t mem_upper;
 } multiboot2_tag_basic_meminfo_t;
 
 typedef struct {
-    u64 addr;
-    u64 len;
-    u32 type;
-    u32 zero;
+    uint64_t addr;
+    uint64_t len;
+    uint32_t type;
+    uint32_t zero;
 } multiboot2_memory_map_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u32 entry_size;
-    u32 entry_version;
+    uint32_t type;
+    uint32_t size;
+    uint32_t entry_size;
+    uint32_t entry_version;
     multiboot2_memory_map_t entries[];
 } multiboot2_tag_mmap_t;
 
@@ -212,22 +212,22 @@ typedef struct
 } multiboot2_tag_framebuffer_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u64 pointer;
+    uint32_t type;
+    uint32_t size;
+    uint64_t pointer;
 } multiboot2_tag_efi64_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u64 pointer;
+    uint32_t type;
+    uint32_t size;
+    uint64_t pointer;
 } multiboot2_tag_efi64_ih_t;
 
 typedef struct {
-    u32 type;
-    u32 size;
-    u32 mod_start;
-    u32 mod_end;
+    uint32_t type;
+    uint32_t size;
+    uint32_t mod_start;
+    uint32_t mod_end;
     char cmdline[];
 } multiboot2_tag_module_t;
 #endif /* __ASSEMBLY__ */
-- 
2.34.1



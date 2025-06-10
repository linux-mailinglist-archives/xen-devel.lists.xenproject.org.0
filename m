Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC9AD380D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010792.1389076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfs-0007Kh-Il; Tue, 10 Jun 2025 13:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010792.1389076; Tue, 10 Jun 2025 13:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfr-0007Fz-Vc; Tue, 10 Jun 2025 13:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1010792;
 Tue, 10 Jun 2025 13:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfp-0004Sm-E0
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:53 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a0ba8a-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ade30256175so732559266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:51 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:50 -0700 (PDT)
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
X-Inumbo-ID: a2a0ba8a-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560751; x=1750165551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVaSdEzC4kuCiD3ZiuCTTzD/g+ai4zWkigRCI0Mr+vI=;
        b=MWJGlQtF4LJiNfUNvmSLhz2vdmMcmBxnWqAjqQvbzm87PH6H9SnKpmbzXBbjahBj5R
         UtiwxXYLsSLKYZGDsYuCfrnZj7y8gIEm9kP9ggwHkBHOQU3BeE5DCZZWWfAbhnPP1rNq
         PONijfB0kTAz05H82T7jDDnP2QboPZbsSN+B6IFsj2kK3MEJsmsn12pVNFG7yeqv25k/
         ZEbslCg9jRKJp77S50eUa+CEZeSt6O3wZsaXo8jhDIJk6OrdQLzIMuirHLz5tCbtKJrx
         VCDgv+n5Pmq5PeGQ9BeSrudVLB0oaM2WE5XDBFgJPh/z1+ayB0QE1BD1BZYRYpcj2YQ9
         g4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560751; x=1750165551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVaSdEzC4kuCiD3ZiuCTTzD/g+ai4zWkigRCI0Mr+vI=;
        b=fRvR4XvaUyg5zIn3vqjM8i/0mGrYNdokxduW2uBUbCwfLsDmQiATf/Xn7LnEhcoK7F
         IS6Nrd8OCt1CNgCuLhJlc9gtpNSWIrBCTDgTXOLnpfS9RTEMya5UN1uw516tKXAiVNoY
         p0HxiZL5vIX8qthvmoxO52jJNKWpvKG23iY/Odh8e8bNpe5CWSrX7TP8ucWxPqMYvvFC
         05yvfYlMrtJ0r+nZJC0TJzI9SXyU2aNrAhtWY2vUr8zbcevNnqPD7wC17Z76w0RCloEm
         5VXxHdkLnfZYCuOTSaH5gswLxB3NeV/hlJHeRO7x1JBPFGLQR7SXIXyE8dgbMABDGLPJ
         ZjfA==
X-Gm-Message-State: AOJu0YwPA4Up0/rqQxF6gfMqUqEEA9Z3vudrvWKq9atVZsDUA9tqvFC0
	Yhx7iHigu4kZeIzXXPhVctKm9aF0x2/aM2ovfSPCgnjtrbv7ipKQlxXwfy1G8g==
X-Gm-Gg: ASbGnctxsKx7td2q2cKr2y8fidJAzStxlsPeTh2Z7VFA5g21vyqrTXZGAC65X/vpAAb
	WrV2YTv0azGGYZ9mTBS/muuzTSH738MYrIQW8iXNL0Nz2Pm39HLhD0Ntm4VUxikWdnCGhegxDAJ
	/Z/7LL0cBWPmV8zHDTYhQsRTn9C0VS+V8WAZSuqeOcuifnaOCXaHjoKgX/QVBbcJwPjzjS/91Rv
	Q3zklYPvxDW94aLIxf+gj/+79i5ivmKIZR4vumOhi2pvEcffgRPso1L/gaSZ/dYIHdxxcZiU6Bx
	uHtZ94m0OkJirr+XSWXbLl3PwMC3oXWzLZK5sM0Dptahs+dq/aKZbJc8+B6L5wIEMwq3TrVI93E
	loVdU4mCHU6E7UzRBpDOtpM/9aHiG
X-Google-Smtp-Source: AGHT+IE57NqUZYYdmSJcp44+MSwcLpDkmkm3jzcquze2ekyofX7OKjw2jn8+5NYp/0z4UB7CpLhpug==
X-Received: by 2002:a17:907:c15:b0:adb:3272:7df5 with SMTP id a640c23a62f3a-ade1a93bb89mr1797332166b.16.1749560750536;
        Tue, 10 Jun 2025 06:05:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 09/17] xen/riscv: introduce page_set_xenheap_gfn()
Date: Tue, 10 Jun 2025 15:05:24 +0200
Message-ID: <186e4a778a6dfab205428dfb4d0c59584a162a9f.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce page_set_xenheap_gfn() helper to encode the GFN associated with
a Xen heap page directly into the type_info field of struct page_info.

Introduce a GFN field in the type_info of a Xen heap page by reserving 10
bits (sufficient for both Sv32 and Sv39+ modes), and define PGT_gfn_mask
and PGT_gfn_width accordingly. This ensures a consistent bit layout across
all RISC-V MMU modes, avoiding the need for mode-specific ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - This changes were part of "xen/riscv: implement p2m mapping functionality".
   No additional changes were done.
---
 xen/arch/riscv/include/asm/mm.h | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 912bc79e1b..41bf9002d7 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,7 @@
 #include <xen/sections.h>
 #include <xen/types.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/page-bits.h>
 
 extern vaddr_t directmap_virt_start;
@@ -229,9 +230,21 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
-/* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
+ /* 9-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(0x3FF, 10)
+
+/*
+ * Sv32 has 22-bit GFN. Sv{39, 48, 57} have 44-bit GFN.
+ * Thereby we can use for `type_info` 10 bits for all modes, having the same
+ * amount of bits for `type_info` for all MMU modes let us avoid introducing
+ * an extra #ifdef to that header:
+ *   if we go with maximum possible bits for count on each configuration
+ *   we would need to have a set of PGT_count_* and PGT_gfn_*).
+ */
+#define PGT_gfn_width     PG_shift(10)
+#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
+
+#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
 
 /*
  * Page needs to be scrubbed. Since this bit can only be set on a page that is
@@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 #define PFN_ORDER(pg) ((pg)->v.free.order)
 
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    unsigned long x, nx, y = p->u.inuse.type_info;
+
+    ASSERT(is_xen_heap_page(p));
+
+    do {
+        x = y;
+        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
+    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
+}
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C1AD386A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010862.1389141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOym6-0006GY-Fc; Tue, 10 Jun 2025 13:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010862.1389141; Tue, 10 Jun 2025 13:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOym6-0006EN-Cq; Tue, 10 Jun 2025 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1010862;
 Tue, 10 Jun 2025 13:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfw-0004iH-VI
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:06:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a76f8c09-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:59 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so794163866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:59 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:57 -0700 (PDT)
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
X-Inumbo-ID: a76f8c09-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560759; x=1750165559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLkVEHfi1jrO45zgqffaLAKyuwJWGqpdSuo4c300uoo=;
        b=a4WV+ObV8bS++SVIR1CCtOtfhlq9ARhXV62KFMUFzqhWqfVQJYFVq0zAdqr/wkijhJ
         JoCBo9nOmL9hm5R84LYsp/v+BTWkUiNmGcuLNJqxD+ad6LWfVC4eSbjzAxmvyRegsN4g
         WyN6jWZea9EAZic1TBbnu9N4Ayqz/TLpeOywjFtXGW8CcA86qNI6f+rrMzvVp718F26A
         I4urpZDz5DfcDZMTJGdkSikMa8Gs6ltYr6i+xAc/fuaJnNYu7Cr2nAOnYyTsXdUjnUGM
         JPH9/KPF3TNQ9CN0BXYprFnn5v8hN1JdeDKk7t726PSjsBh86cc/CyEYSbi7uYDebM/a
         DAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560759; x=1750165559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLkVEHfi1jrO45zgqffaLAKyuwJWGqpdSuo4c300uoo=;
        b=WR0VGNwOSoK+bwqEKX7tBLZKa/pUpJzcTa/cqJrPhj/oD08G8gQr6cVJG/ZSTNC8CW
         n/myCJmtKnf8IaFVzDm3tHYnWEDXdKcVP4/Zw4jdF8x4ecTvqO0XKaAsdS+qdzSABbpC
         zMTX5swdt9Y5icgznaZBzst4/ts+r3WfodfIGLAmfj0g+qyY4ckygr6K7/BMVq+UcAZv
         GgdS11KWcil9Eiw4CZKy5WTm+9XUJr0epRFIe09PW5F+GNIrdQueA3yuB6/BqUps+3cx
         dWCvVfdvMzZ6RVObkmj6nLJayRPHzyDfXNMRUFdUO9BZtNPOxUIcAiEbwujVTpN6X7bC
         Ksng==
X-Gm-Message-State: AOJu0Yzrh5VbQrYtagzXM0j0NapFOIAbON71moIOaS4TdUAoJ5/kkUf+
	BqvEkN5RkBPtQgFf42cS6IGQzNUr4JiQF6xy+I+wLQYUlYVT1ULyjJ7ZoZ9Quw==
X-Gm-Gg: ASbGncuqKt5GFAZz7hMhwblM8SJRfMskay+qkLHzcPrRcSo4CqrggEgTxpBXeMfw7HL
	hfIi6OHeq9eKgUd5q2x61FBBh7kvcR6RDbNclzlMZOSLxWfcizvQ1hJuuzL4W/Ax89U2EVXOOM6
	6vEMGEuBkbWbeCiPEsllWeG8eSAaXZq69jLFguD1v+bUrQK8r7roXKzKy/MWaZpHxfYL1b8/nhy
	PaZ+IeOgjKtn15xDYOihCBXttW+AuVqeKPNo3GsJSqvgEuy5TodVppk+mgfgcjWz7HttJLqrJNz
	Ly99BLLgnoaWctDiNN5oosIYQH5o7Iy9hjFMjeJ8BDDGIAPePGM+q98yaBVsPTVmM7XNFSLbitq
	lYZ+cnV/W7mw1lb6GsLiWc5NznaP5VJPqbRoCByo=
X-Google-Smtp-Source: AGHT+IEBaIt1MD6aKhJxCYZ43RfPWThnVB8CtvWfUM39Lk0b4i2B38h1vrfVFizytmU7ODufwOjrjQ==
X-Received: by 2002:a17:907:3f23:b0:ad8:9c97:c2fa with SMTP id a640c23a62f3a-ade1a8da8f7mr1694147666b.4.1749560757808;
        Tue, 10 Jun 2025 06:05:57 -0700 (PDT)
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
Subject: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Tue, 10 Jun 2025 15:05:31 +0200
Message-ID: <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
  riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
  /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
  /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
  /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
  riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
  /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
  make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
  reference to a page and retrieve its owner.
- put_page() and put_page_nr() to release page references and free the page
  when the count drops to zero.
  For put_page_nr(), code related to static memory configuration is wrapped
  with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
  common code. Therefore, PGC_static and free_domstatic_page() are not
  introduced for RISC-V. However, since this configuration could be useful
  in the future, the relevant code is retained and conditionally compiled.
- A stub for page_is_ram_type() that currently always returns 0 and asserts
  unreachable, as RAM type checking is not yet implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/mm.h |  9 ++-
 xen/arch/riscv/mm.c             | 97 +++++++++++++++++++++++++++++++--
 2 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 41bf9002d7..bd8511e5f9 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/compiler.h>
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
@@ -288,8 +289,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define page_get_owner(p)    (p)->v.inuse.domain
 #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
 
-/* TODO: implement */
-#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+extern unsigned long start_page;
+
+#define mfn_valid(mfn) ({                                   \
+    unsigned long mfn__ = mfn_x(mfn);                       \
+    likely((mfn__ >= start_page) && (mfn__ < max_page));    \
+})
 
 #define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4047d67c0e..c88908d4f0 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -361,11 +361,6 @@ unsigned long __init calc_phys_offset(void)
     return phys_offset;
 }
 
-void put_page(struct page_info *page)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_dump_shared_mem_info(void)
 {
     BUG_ON("unimplemented");
@@ -525,6 +520,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
 #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
 
+unsigned long __read_mostly start_page;
+
 /*
  * Setup memory management
  *
@@ -577,6 +574,8 @@ void __init setup_mm(void)
     }
 
     setup_frametable_mappings(ram_start, ram_end);
+
+    start_page = PFN_DOWN(ram_start);
     max_page = PFN_DOWN(ram_end);
 }
 
@@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    ASSERT_UNREACHABLE();
+
+    return 0;
+}
+
+static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
+                                                      unsigned long nr)
+{
+    unsigned long x, y = page->count_info;
+    struct domain *owner;
+
+    /* Restrict nr to avoid "double" overflow */
+    if ( nr >= PGC_count_mask )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    do {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
+        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
+            return NULL;
+    }
+    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    return page_get_owner_and_nr_reference(page, 1);
+}
+
+void put_page_nr(struct page_info *page, unsigned long nr)
+{
+    unsigned long nx, x, y = page->count_info;
+
+    do {
+        ASSERT((y & PGC_count_mask) >= nr);
+        x  = y;
+        nx = x - nr;
+    }
+    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
+
+    if ( unlikely((nx & PGC_count_mask) == 0) )
+    {
+#ifdef CONFIG_STATIC_MEMORY
+        if ( unlikely(nx & PGC_static) )
+            free_domstatic_page(page);
+        else
+#endif
+            free_domheap_page(page);
+    }
+}
+
+void put_page(struct page_info *page)
+{
+    put_page_nr(page, 1);
+}
+
+bool get_page_nr(struct page_info *page, const struct domain *domain,
+                 unsigned long nr)
+{
+    const struct domain *owner = page_get_owner_and_nr_reference(page, nr);
+
+    if ( likely(owner == domain) )
+        return true;
+
+    if ( owner != NULL )
+        put_page_nr(page, nr);
+
+    return false;
+}
+
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    return get_page_nr(page, domain, 1);
+}
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C297DCC47D1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188288.1509560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYN4-00083S-L1; Tue, 16 Dec 2025 16:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188288.1509560; Tue, 16 Dec 2025 16:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYN4-000827-Gs; Tue, 16 Dec 2025 16:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1188288;
 Tue, 16 Dec 2025 16:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYLB-0006gk-5e
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:56:01 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ad1425-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:59 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so6865964a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:59 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:58 -0800 (PST)
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
X-Inumbo-ID: 18ad1425-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904158; x=1766508958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npnrVfa20a3qHvfG7hC8vnLRP2tR37Ck6hm1kYf1IlE=;
        b=XOWRqdQzrP4TZP9NiHLA/wGrtkDPXZmaEF1m/TcDrfCrwee16glfOjx8YLxyLVtMVI
         c644jxOx0/qU3BTe1/DI+UlbWzr5h4Xzza8HgUbz25EL29KnIiqx5j+XkXY3K2HvvxM9
         OY+OoXYFnP7vqd/VEQYOD7tgWhGMepPrbQMM6W18m7PuhV9znrqZ6RAYKEjzFdSWg2eB
         2gx2Om4BWb5B9ti3AMZf+2pFpZnp4maWMRAGjS7yMYLP2a1j4EvgSJqIVa3v/TiJs+Ma
         bPZfCEZfLfhp43fqtiSf/AYNFotxiXNM8tWZdFuuaiAqYrrv46VCACeCjt6DGbmdKmxv
         Pkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904158; x=1766508958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npnrVfa20a3qHvfG7hC8vnLRP2tR37Ck6hm1kYf1IlE=;
        b=PvgacSEaQ2QVDIUx6jzI+UF3KbIIUzweywoqrMH2oWruvJ/2yTMgIWGmTn7AxMGsRM
         KrO+GPrfw0LcY9rX5OvUFDXdAGmJ1f5R69OT69adKjoSfwyDQHnhk4mZoFiCJlw044yk
         CHUxH8E9UGoKR6l31eaTYs9cBCDjQ7oUMdPrnBJmYx27sHb4Jjr+QWJ/Ufaxg0Ccj6vu
         cuYz9FREE0OBitCqBtSChr9uJMQwMkIw+EnAxvEleUjsDkyUBa7sraYfp0VylwEiXv5A
         CKEaNYUhgVuhjDCwrLzwRGnSldP0+dgEssxjpH1ZmAQBPMh4d4o5dpr38J3/y0sJze+1
         pVEw==
X-Gm-Message-State: AOJu0YwBdyJgAf6AbJOp8fU90WFSnK+6KzuWImLm35LZGGF+qXTd/sat
	IzlszQGAZMVnHWHTXnDvzTpEeOajCkEia9fyAbOqVOdT7Bfq/+z9mbvhvUEgfA==
X-Gm-Gg: AY/fxX7W9SqeopnHIjjtqbs5LxuLQY1XCw/4WBe+WF7HiennWjco9lJaoQZg+UCa4w0
	r5cJIed3FdSEKEYRDI+0Au87cnaYgwU3OgU0TmTmNcX9C/1+tIk1eHFyxJIO5CDA5ChBPD+lB7n
	yh0KmK5okBYeH436KUc8czOF3VDXrC0hAfppAOd4T6H+mTIJJkcUou26uKRuJ2Ql+6dC9vstRfR
	fFhbFQooMQ57MInTc00yA3KSJW8ryltjUXhCFJ9v2VfDcd0iWpTsyCuKQypjaWXiG12U0JhHvH+
	qJwXU41oXRojvd3nuSfPV4FmAc5uitW4wM7kUMJmoOueeTGZ9PYkn07FU9WQLJlLtjmVyOogc/W
	BTfyGKeUgm2+2Qyya8XW6vOWX6Qvbm9pLmupNTxz7ih37lAW1JTRUvgOwY2hBkuk7pJz3oAMUQp
	QNW/K982NMMJxw0gt2wej/Xz8wxt6drfyGo7H3YTK2n/Fg7hQGk0P/900=
X-Google-Smtp-Source: AGHT+IEhh96FoG+DlQmle/loaK4dt/aUlX1QxFx9FUfXT3OtZxjfvvsrSI7taBBzvEZBtzDDIoeC7Q==
X-Received: by 2002:a17:907:3f20:b0:b79:f965:1cd4 with SMTP id a640c23a62f3a-b7d23aa403amr1599499566b.55.1765904158502;
        Tue, 16 Dec 2025 08:55:58 -0800 (PST)
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
Subject: [PATCH v7 16/19] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Tue, 16 Dec 2025 17:55:26 +0100
Message-ID: <d6574849004dcc42eb65999908b49f3c89e8b1e3.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.
Also, initialize pdx_group_valid() by calling set_pdx_range() when
memory banks are being mapped.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
  riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
  /build/xen/common/page_alloc.c:1054: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1035: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: prelink.o: in function `reserve_offlined_page':
  /build/xen/common/page_alloc.c:1151: undefined reference to `page_is_offlinable'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_is_offlinable' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
  make[2]: *** [arch/riscv/Makefile:28: xen-syms] Error 1

To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
  reference to a page and retrieve its owner.
- Implement page_is_offlinable() to return false for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6-7:
 - Nothing changed. Only rebase.
---
Changes in V5:
- Move declaration/defintion of page_is_offlinale() before put_page() to have
  get_ and put_ functions together.
- Correct code style of do-while loop.
- Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Rebase the patch on top of patch series "[PATCH v2 0/2] constrain page_is_ram_type() to x86".
 - Add implementation of page_is_offlinable() instead of page_is_ram().
 - Update the commit message.
---
Changes in V3:
 - Update defintion of mfn_valid().
 - Use __ro_after_init for variable start_page.
 - Drop ASSERT_UNREACHABLE() in page_get_owner_and_nr_reference().
 - Update the comment inside do/while in page_get_owner_and_nr_reference().
 - Define _PGC_static and drop "#ifdef CONFIG_STATIC_MEMORY" in put_page_nr().
 - Initialize pdx_group_valid() by calling set_pdx_range() when memory banks are mapped.
 - Drop page_get_owner_and_nr_reference() and implement page_get_owner_and_reference()
   without reusing of a page_get_owner_and_nr_reference() to avoid potential dead code.
 - Move defintion of get_page() to "xen/riscv: add support of page lookup by GFN", where
   it is really used.
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/mm.h |  9 +++++++--
 xen/arch/riscv/mm.c             | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 08f500c99d..1a99e1cf0a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/compiler.h>
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
@@ -300,8 +301,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define page_get_owner(p)    (p)->v.inuse.domain
 #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
 
-/* TODO: implement */
-#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+extern unsigned long start_page;
+
+#define mfn_valid(mfn) ({                                               \
+    unsigned long tmp_mfn = mfn_x(mfn);                                 \
+    likely((tmp_mfn >= start_page)) && likely(__mfn_valid(tmp_mfn));    \
+})
 
 #define PFN_ORDER(pg) ((pg)->v.free.order)
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 2e42293986..e25f995b72 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -521,6 +521,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
 #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
 
+unsigned long __ro_after_init start_page;
+
 /*
  * Setup memory management
  *
@@ -570,9 +572,13 @@ void __init setup_mm(void)
         ram_end = max(ram_end, bank_end);
 
         setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
+
+        set_pdx_range(paddr_to_pfn(bank_start), paddr_to_pfn(bank_end));
     }
 
     setup_frametable_mappings(ram_start, ram_end);
+
+    start_page = PFN_DOWN(ram_start);
     max_page = PFN_DOWN(ram_end);
 }
 
@@ -623,6 +629,11 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
+bool page_is_offlinable(mfn_t mfn)
+{
+    return false;
+}
+
 void put_page(struct page_info *page)
 {
     unsigned long nx, x, y = page->count_info;
@@ -641,3 +652,24 @@ void put_page(struct page_info *page)
             free_domheap_page(page);
     }
 }
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    unsigned long x, y = page->count_info;
+    struct domain *owner;
+
+    do {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
+        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
+            return NULL;
+    } while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4831C808BF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170784.1495837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVx3-0006uZ-TF; Mon, 24 Nov 2025 12:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170784.1495837; Mon, 24 Nov 2025 12:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVx3-0006ss-Q5; Mon, 24 Nov 2025 12:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1170784;
 Mon, 24 Nov 2025 12:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVm2-0001zv-SS
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eae89e90-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:28 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b73161849e1so747730766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:28 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:26 -0800 (PST)
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
X-Inumbo-ID: eae89e90-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987667; x=1764592467; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCrVTv3VliCWG5e18Y/6OBBXltGq/TeH9UeHgbc48QM=;
        b=K9X2CVdLoBfLGNo6g/FRh3OTewRnmiVPhWkkvoRSYB476IseAjYbehwvoLYoKlEabt
         lJNn5QndCEuZTWY4tMoQeAcOIo84GDjm1k2cNgGHVGGj7XcS7qcfA/WgUD9txGjaJzWj
         FO0hDP06AEGF6q9XpluXG0lmsWIaV46tH4zr7O3EeTr6SgZ3PGmQEGLJmKj/qzhhUF1q
         9OL8mT5APhthBm06aYuQxMpx97aMeG/nh2Pz+Rei1uxCi8ZFBJTZPJBC9GTaKmiJHACi
         /H7zmmEjt4aluV5wYOvzYR6yY+4I14bdtMXS29kt88Qe0W2l9NgkyHEtOE3/sc73x72G
         0L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987667; x=1764592467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCrVTv3VliCWG5e18Y/6OBBXltGq/TeH9UeHgbc48QM=;
        b=B/faVntJsGaF1DJopExdtp11uUjJeaNYTFmmVfJhvEse8MyOSBeTw4+9aXgT9DgVdx
         DxcPlzclRqPLNKu9/ys99UcxCoHQFbR+31VbhpZIzrZ7WbfEAQLotSQ9lqXeuavSEl8+
         OF26nFjT2MJRyiUq3xMQRGSz6l84Tg1Qh2jERLvF1J8HadIaYPTNBy3qGl3E74FC+vaE
         lIWPu29Mq4IXe5Rve9Q3HvUGWYcZkXMeBSs5hTupbI4BSFlh2FdL0bzWeWqLvLTZtiuG
         c1n1dwpngwMQcq23fRoFB+UorzZ9Kmded0+RShvlXP2kymW0QjUhxaVL7aPX6P2Df2/X
         03jg==
X-Gm-Message-State: AOJu0YzIwMz2PhOXSL+wmB7ekuBZncz2IIB3XQxhy6Lj2Tk4nKft4TjV
	T/a14Fz/gZIL36Kuua0uHdxMnv1g3VO7fAS83WLXcbFY8Pk7teLyxTCz1cgnecEk
X-Gm-Gg: ASbGnctmMjW6X0KSheC9KFxNrogUq4KOdR+f0ly6C5q8r9MGnxtN1/HrjJlp7BqfAuU
	q2r6/RQzQtSycMrQ7YcZhRjSnfeJmwR2ZXiZl+3PQIhujxE4d+BaV60jhjAPEeOBeg3APs9nNd0
	0thKUfsQAH4wNOfNcveUCP6RM8qKoB2oOU7RRWgRr+60a1bDZYJClVRst8CntrXMxrzb5gHvi7P
	QY8uCFEXG1tPnNQDIzbqir3SVCh/nfZTAwM6m7NRjHrhbmDdmWZ4FT4Du/m4k7rOyNfBKhccH/0
	Qia81gmK3J356t3Tyyk4QRGBfvNrCpDe0IXtQhwrtXvWvZNMW++yqPy653WPigVgNYiTFEfkfwk
	Z54iLsr20qTzSUvevoQnjHcEXj/71cCFJRzded/3lOdmV92Wap+PIoWUgbHpIX8uzj2RIdLbKkH
	fLNaBr0XQ8EC5oZdsHlW0rrC3lLGSi3ZeJF0C4sSE4YJQqkXy0OffpmFU=
X-Google-Smtp-Source: AGHT+IFHNjI9V1kRigbh1MkfOb7gqWwail5zhwDyOSBtFsaSreRWO+9bkzjxqfDWLhWRJHVkHvvzqQ==
X-Received: by 2002:a17:907:7287:b0:b73:9fea:331c with SMTP id a640c23a62f3a-b767170aec0mr1300485066b.47.1763987667058;
        Mon, 24 Nov 2025 04:34:27 -0800 (PST)
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
Subject: [PATCH v6 17/19] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Mon, 24 Nov 2025 13:33:50 +0100
Message-ID: <00e300afe000fc123582e7c124971fe7bae9fc86.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
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
index 0503c92e6c..1b16809749 100644
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
 
 #define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
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
2.51.1



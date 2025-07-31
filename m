Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FCB1748A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065989.1431374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjm-0004Jc-6W; Thu, 31 Jul 2025 16:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065989.1431374; Thu, 31 Jul 2025 16:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjm-0004Gj-2h; Thu, 31 Jul 2025 16:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1065989;
 Thu, 31 Jul 2025 16:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgJ-0001FB-6w
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444282a6-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:57 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3322f5413easo8495901fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:57 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:56 -0700 (PDT)
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
X-Inumbo-ID: 444282a6-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977537; x=1754582337; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxvRILGbsHos6OERRrUZU2kvL3C38QZb4m5E0yQHCno=;
        b=VEqZVkLbUl727cMdi4A+GZ9Pr+cB3NUnjnOBZVdArOOtKrFdcfCI6TjMKbNZMWIn90
         GY7Tyaowat34eeRsdX0qPlld0iQo1T6B9hOi2g88lJS5UID9q01soAeVoYmJ8cJNNGH2
         OaeRnt7R1hzTsQ6c5sNL/NuLX0oOxLt8y9/ZgRFa5+IV8Vc6TXvnQzcACdsUYMT9dPEe
         +bm5G5HU7vaWBWSm8goFztHabb35j0xU+8xHHV5CNIDyRCUqBKp0+Z74WW2PdPESnhqC
         U1dihwB0cUEp3LGT0UERIPkQrBivIfvmpVtuDGTb0opZdK7o2exdQ4VRRJBKtTVNGeuy
         dz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977537; x=1754582337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxvRILGbsHos6OERRrUZU2kvL3C38QZb4m5E0yQHCno=;
        b=L21hXa0R9kP+eEKsV+VOMqd7M8KfaJF5MlJIU0FtOg7lTnQqiUoc6naLOcpf/vklAk
         J1Md/9azvTLAoElhaUtr9JfNQYH2XuIwUS9oy0QgtUf/X+vbyYMhLS6/oPeTx4XMkd1V
         yfRVPgdVB0Y4c29r/dbysL4a4PZBQLtJU3KokCtdtaN6VXIhkxskvSk3XNCZ4SWVpnuM
         kZ37yMrQ81rQKHSmtI6/u9kDI3lxrjx2BXiRoID7IgkOqD69f/Z0m8Wz7givZXv3nOYU
         EQDZV3M0Nzv9WMpFE4vpzsx/RS8WH+JahDmzq6Y0gsK/O9hVnbypXitqxstzMspX2Yi9
         izzg==
X-Gm-Message-State: AOJu0YyCfIOh3cbdEn40ObWCFcThLp092T5P7TK3COEZ7fl0EOJ7lAn7
	Yxb1ZylmnTyQOP1qWBnXdu5UOc5v+V3bQLer3VmUGI3YZvI7UyB1GjnzLLBr4A==
X-Gm-Gg: ASbGnctXTRxaN+iNm2liaWMYOQBTox5eDAsdq2K0v818W7terpP9TjiWesRxa3Xsxwg
	fQKudj9iV0j9wZeqeeJNSH4KJc/GbRmHxOdMkmzdb1fwqKEcJGjjGFWSWpTw6OkTNdg2zZwE6pC
	LwSjf3ZaZfIS8SOv2g8aiwEUsUnly7K8dcuYSeo+LATVZH0PzdG+xK7dKDQITaWlhQJ3fmp7QJD
	lLtHengDftyd/p8vnioT2VSPqWCugJSNqsL75bdQZOzz9Sv9ZaS1CPcm74ymnwJttHZp4/a3NF+
	HZWjJqtbFrfq21eWj0C6IGoMpTKejgwIFkNUQ2M5/gUzQ9HQpeKIWooJjkTWOKCm2IQ3w3dMjv7
	JJDKJ3fKemicm3Ksdxp3X8BlpU433hXE5Shvz+NNya0Z7egmPd+Yprow93wsht6SSniLENyEd
X-Google-Smtp-Source: AGHT+IHTzoICYIk7JdW6+FqXoo6u269QOmtq3RTyi7yaQF2Oo3cJRSEqt7PGiiVjcKxqkcCoqHxRBQ==
X-Received: by 2002:a05:6512:32ca:b0:55a:3358:a7d3 with SMTP id 2adb3069b0e04-55b7c0b71aamr2249462e87.54.1753977536809;
        Thu, 31 Jul 2025 08:58:56 -0700 (PDT)
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
Subject: [PATCH v3 18/20] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Thu, 31 Jul 2025 17:58:17 +0200
Message-ID: <fe455eac54b6c874b8ddb69e94703c9a28330a4c.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
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
- A stub for page_is_ram_type() that currently always returns 0 and asserts
  unreachable, as RAM type checking is not yet implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/mm.c             | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index b914813e52..d5be328906 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/compiler.h>
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
@@ -309,8 +310,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define page_get_owner(p)    (p)->v.inuse.domain
 #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
 
-/* TODO: implement */
-#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+extern unsigned long start_page;
+
+#define mfn_valid(mfn) ({                                           \
+    unsigned long mfn__ = mfn_x(mfn);                               \
+    likely((mfn__ >= start_page)) && likely(__mfn_valid(mfn__));    \
+})
 
 #define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 3cac16f1b7..3ad2b9cf93 100644
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
 
@@ -642,3 +648,32 @@ void put_page(struct page_info *page)
             free_domheap_page(page);
     }
 }
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    ASSERT_UNREACHABLE();
+
+    return 0;
+}
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
+    }
+    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
-- 
2.50.1



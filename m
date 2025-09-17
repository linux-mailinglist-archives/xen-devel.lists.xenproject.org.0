Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C4B821A1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125769.1467650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Il-0000yw-0J; Wed, 17 Sep 2025 22:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125769.1467650; Wed, 17 Sep 2025 22:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Ik-0000wx-RP; Wed, 17 Sep 2025 22:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1125769;
 Wed, 17 Sep 2025 22:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08M-0007Lu-IJ
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:14 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 202fd343-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:56:13 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2570bf6058aso3814545ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:13 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:11 -0700 (PDT)
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
X-Inumbo-ID: 202fd343-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146171; x=1758750971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWW/RPoHDDMmiNcnSl6hhO3V0ICFKFmoC7Uis76f4UI=;
        b=ABuzYF087xnXF8aZvIWexr/DQX5IOScDoJupi1bN1CQQsMRVlORkhZ+8j07nGgw7St
         t9O2aU1iv0pE/TWIxCUfKZ2r1NEioOjgbpRqHvWSZ7If/oemnnK9wRMsCwltsTKHyFA+
         0O8dN48vOQmf/d/DOwMhjXytuzkna3us94eCnGSkn21CYKYFquRzNyHDzI0s0d/7PBQD
         c5UoRS2hyIzrBQxUth32WXhpgL7pHUtH/xynr+byzqfm2H/leD7rhCoAX3x+oLbmy1+O
         tAtoXFntkbB61LKxgV3tgeHbK17pzMn3T1UFsVIogGBCgB8v76zUjvVTVAPPXNJuMTO/
         F5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146171; x=1758750971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWW/RPoHDDMmiNcnSl6hhO3V0ICFKFmoC7Uis76f4UI=;
        b=kTX8kD1lU9Ef0/C1xyrd+nclDq1NKnIwd/3SWC3iF0zFHzqVjqwX0bMvEIDjftqCz5
         nTU6pFxRY1wLfM9M8XivHWJif3EEAcZuOPKmJmf+7fUtmwQyT5mOk+ZkM+143EPjWOSM
         d+SrmxFs+QsprBL4Vzu2OmCxRrlsI3SHYeX+NkffttOp7h3ORXiUgyJtly065jodsjYf
         9FfvTK8S1sgevX2+Td029T2JBYZ9nqZhhWJKc7fXls2hyQfEWCJkhcJXXtUeti+A3KL6
         ugFC+dHMwW/P/djLFUQusbHiy0na4e72QZiDOOTxDAVWQZCGKeyJLp6i5D+O78tT7hhS
         Rf+g==
X-Gm-Message-State: AOJu0Yy62NTW19Js9w6T2/oYvofIO2pPU47DH5tSNrSnAZvU90iXDRKZ
	2FAexhKD68V+d5i42nv+J6GQsM4ROFoR68jNZONLAtuaFvEjbCKd6EjZYuEk6zLYIvA=
X-Gm-Gg: ASbGnctz8AeWI10+GvUwpstiP5U9PIDlHpKBV9fjzPzh6u/64+hTZMltQb6ycaa+rEw
	NmkavaTSrUd+sd2Ug8xKMExc2NJr6R62wfOY0tHIOfxXb4qNfE3W+r/9BAnRLOKAd18spcUfmPI
	iD9Et81C8nHBTT6zAhvEhrVJ/Ikp0TEWzkctRGX7tOUbxknlKCkLZyCZ86zgBKPbLvtieBi0SX5
	+JAMgu8EJ4fvXatO6wcSzY1GahjVdA3dRAEW/2V2nUrO+Fam/huvTkxsLSRTo3WMZ88xXLBFtRV
	/WJaMM72WrGHgZ7Q1g6TIBOQzCbYjb+jLKRSHkbi1mD96BvXMMcKo3GkLPdCvLAakw2r/LAEWZD
	aaNvI9OkOgPK5kvLGiEIF0dCdytOPsZAsx89u11sb4qqv
X-Google-Smtp-Source: AGHT+IFNulg9ua/1KcKiq1d9eq2CTw7cQ9UG4yEDrbmVuEwCKwmA/vPRU34oqpsarcTO/vxdiRpRjw==
X-Received: by 2002:a17:903:11c8:b0:25d:5b09:a201 with SMTP id d9443c01a7336-2681238073amr49800165ad.27.1758146171396;
        Wed, 17 Sep 2025 14:56:11 -0700 (PDT)
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
Subject: [PATCH v4 16/18] xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
Date: Wed, 17 Sep 2025 23:55:36 +0200
Message-ID: <09317ebbd1f6fb7dda9454aa7e0b1ba3cbd0726c.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/mm.c             | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

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
index 3cac16f1b7..8c6e8075f3 100644
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
 
@@ -642,3 +648,30 @@ void put_page(struct page_info *page)
             free_domheap_page(page);
     }
 }
+
+bool page_is_offlinable(mfn_t mfn)
+{
+    return false;
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
2.51.0



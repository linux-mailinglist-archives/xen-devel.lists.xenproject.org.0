Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B9AD9218
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014703.1392836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6lo-0005xY-0e; Fri, 13 Jun 2025 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014703.1392836; Fri, 13 Jun 2025 15:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6ln-0005pW-Rt; Fri, 13 Jun 2025 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1014703;
 Fri, 13 Jun 2025 15:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6lm-0005oc-T8
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:56:42 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff959bc8-486e-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:56:42 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo4390702a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:56:42 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a93b03sm1357883a12.54.2025.06.13.08.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:56:40 -0700 (PDT)
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
X-Inumbo-ID: ff959bc8-486e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830201; x=1750435001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL7nARGDQ50XMu4IV0d9zQhakNWn40CT42TpoqjeEbk=;
        b=VKkf9n71rzy5QZ5/Pl5SMIC1CGvZtafJF59mRG+CRyVJPvOFzyrl3o5QxW2rUCEzWw
         T0e1B5DaoWFCCi0sN7E2dh3PPt02YHe8XI0i5Yqyx0DLDye3Z9K9piNVH7v5BF3pywCM
         vGYyvBOXOeCOhHlgA5waNlfkFHv5y0xAGHOQK4ItaoF70LuLKjNuWXsh6BXlPlP2QQcA
         9Vaf+IC7fWOOpfci7VmhAirCcNqY+mFtVeBDtdR6kuBf9XrKvC+XBfYs5BhEPUk1kb7R
         Nftn2PIVFkQheMbnXgSZJQzz86HHT/QfzWOmNNFD9a5GtGx44HttHdkj/gp6cpXeLK+z
         PgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830201; x=1750435001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL7nARGDQ50XMu4IV0d9zQhakNWn40CT42TpoqjeEbk=;
        b=tqeTn3e4flAp8yQuz5I6M9E96vZwDDPIOdKFzaVmHvMlwaKph93gJJKqVFtfsPvnq4
         8SBfsKmfPnXjDa2eID2q7AVxM3ujQxOL0ayqZDKc3M/bjpeElOHoodoiG+sC4kopYqti
         zgcuJwMxwBpnDFId1O+5tAZez6y3dOVy6clfjj3WL63wiSQyuD0nKHXwf/4jKf+52oEA
         JvUpSTHoq0Vzvk1C5chF4wQ9jHu4j+dXaPF37U1poziIwu5RkCuFjrszO1eNJGUIomSe
         BWF34VSy0MKCosgV/UsmWDG4UhsLskahZO0xgwz24oIq2+0gKu6p+MScY6Zc0zDwxgpy
         TyBw==
X-Gm-Message-State: AOJu0Yz0cyiXTVlv+3pG8RIOqQEpZKqFkdtJwZYNw2aUngcyqirbAR3c
	0RPv7s190qMuXSfSGQZLx5lFaueg1mzsvIQmjB4LqpD8NeLJjMmYNYtzFBXR7Q==
X-Gm-Gg: ASbGncuLd0cbmVBPhiL5ZauKg4i1fmfWKB6lNfCx0jbZqNixMdse/Uol0dVw5m1y1J1
	lxWI15DbdIYavao5mSV2hMBgSQdlvtgxW4F1tn1fz8wBx72BgSHsIO6cqNKA+5zpzsfNYehXUUh
	y79n/Ba9pQOW/DFI/ZHCJ0dHi5dbkLmcoU2fGT36zI/7MEpgn1G+0kqWCzKz+pO3sDgY0nuYIzh
	3qvTac6rSQrwuKaYphIV4YL7qFWpXUshv+AILooc6m/6cx9pa2bhfj8IYJg/W+u+8jn6V9kzT2p
	gCkmSjaRHFVxiLSvJdgbFEDYNc9MIv9rxurtfvs+WaqTfB+Vuiezwk76Tod8m9erzUa8iVjb9v9
	qzJyvFMKq33qcxsE6xe3w+1HXM6xH
X-Google-Smtp-Source: AGHT+IEgsfiFu8C5E+JUWbofGE4zlzEgehEqBX2LkqAdmeSZ5GBYRlpFEgsuZe194HQ+AG85Yu9H9A==
X-Received: by 2002:a05:6402:d08:b0:604:e6fb:e2e1 with SMTP id 4fb4d7f45d1cf-608b4a92b52mr3295769a12.33.1749830201206;
        Fri, 13 Jun 2025 08:56:41 -0700 (PDT)
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
Subject: [PATCH v1 1/2] xen/riscv: rework asm/mm.h and asm/page.h includes to match other architectures
Date: Fri, 13 Jun 2025 17:56:35 +0200
Message-ID: <42696025e262f50ee7d26b252bfe3d3c0a9c77e6.1749829230.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749829230.git.oleksii.kurochko@gmail.com>
References: <cover.1749829230.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To align with other architectures where <asm/page.h> is included from <asm/mm.h>
(and not the other way around), the following changes are made:
- Since <asm/mm.h> is no longer included in <asm/page.h>:
  - Move the definitions of paddr_to_pte() and pte_to_paddr() to <asm/mm.h>,
    as paddr_to_pfn() and pte_to_paddr() are already defined there.
  - Move _vmap_to_mfn() to <asm/mm.h> because mfn_from_pte() is defined there and
    open-code it inside macros vmap_to_mfn().
- Drop the inclusion of <xen/domain_page.h> from <asm/page.h> to resolve a compilation error:
    ./include/xen/domain_page.h:63:12: error: implicit declaration of function '__mfn_to_virt'; did you mean 'mfn_to_nid'? [-Werror=implicit-function-declaration]
       63 |     return __mfn_to_virt(mfn_x(mfn));
  This happens because __mfn_to_virt() is defined in <asm/mm.h>, but due to
  the current include chain:
    <xen/domain.h>
      <asm/domain.h>
        <xen/mm.h>
          <asm/mm.h>
            <asm/page.h>
              <xen/domain_page.h>
                static inline void *map_domain_page_global(mfn_t mfn)
		{
		    return __mfn_to_virt(mfn_x(mfn));
                }
            ...
          ...
          #define __mfn_to_virt() ...

  This leads to a circular dependency and the build error above.

  As a result, since <xen/domain_page.h> is no longer included in
  <asm/page.h>, the flush_page_to_ram() definition cannot remain there.
  It is now moved to riscv/mm.c.

Including <asm/page.h> from <asm/mm.h> does not cause issues with the
declaration/definition of clear_page() when <xen/mm.h> is included, and
also prevents build errors such as:
  common/domain.c: In function 'alloc_domain_struct':
  common/domain.c:797:5: error: implicit declaration of function 'clear_page';did you mean 'steal_page'? [-Werror=implicit-function-declaration]
  797 |     clear_page(d);
      |     ^~~~~~~~~~
      |     steal_page
caused by using clear_page() in common/domain.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h   | 24 ++++++++++++++++++---
 xen/arch/riscv/include/asm/page.h | 35 +------------------------------
 xen/arch/riscv/mm.c               | 14 +++++++++++++
 3 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 01bbd92a06..9283616c02 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,7 @@
 #include <xen/sections.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
 extern vaddr_t directmap_virt_start;
@@ -19,11 +20,21 @@ extern vaddr_t directmap_virt_start;
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
+static inline pte_t paddr_to_pte(paddr_t paddr,
+                                 unsigned int permissions)
+{
+    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
+}
+
+static inline paddr_t pte_to_paddr(pte_t pte)
+{
+    return pfn_to_paddr(pte.pte >> PTE_PPN_SHIFT);
+}
+
 #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     _vmap_to_mfn((vaddr_t)(va))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 static inline void *maddr_to_virt(paddr_t ma)
@@ -35,6 +46,15 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)va;
 }
 
+#define mfn_from_pte(pte) maddr_to_mfn(pte_to_paddr(pte))
+
+#define vmap_to_mfn(va)                             \
+({                                                  \
+    pte_t __entry = pt_walk((vaddr_t)(va), NULL);   \
+    BUG_ON(!pte_is_mapping(__entry));               \
+    maddr_to_mfn(pte_to_paddr(__entry));            \
+})
+
 /*
  * virt_to_maddr() is expected to work with virtual addresses from either
  * the directmap region or Xen's linkage (XEN_VIRT_START) region.
@@ -76,8 +96,6 @@ static inline unsigned long virt_to_maddr(unsigned long va)
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
-#define mfn_from_pte(pte) maddr_to_mfn(pte_to_paddr(pte))
-
 struct page_info
 {
     /* Each frame can be threaded onto a doubly-linked list. */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 4cb0179648..0684229790 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,12 +7,10 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
-#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
-#include <asm/mm.h>
 #include <asm/page-bits.h>
 
 #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
@@ -114,17 +112,6 @@ typedef struct {
 #endif
 } pte_t;
 
-static inline pte_t paddr_to_pte(paddr_t paddr,
-                                 unsigned int permissions)
-{
-    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
-}
-
-static inline paddr_t pte_to_paddr(pte_t pte)
-{
-    return pfn_to_paddr(pte.pte >> PTE_PPN_SHIFT);
-}
-
 static inline bool pte_is_valid(pte_t p)
 {
     return p.pte & PTE_VALID;
@@ -198,18 +185,7 @@ static inline void invalidate_icache(void)
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
-static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
-{
-    const void *v = map_domain_page(_mfn(mfn));
-
-    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
-        BUG();
-
-    unmap_domain_page(v);
-
-    if ( sync_icache )
-        invalidate_icache();
-}
+void flush_page_to_ram(unsigned long mfn, bool sync_icache);
 
 /* Write a pagetable entry. */
 static inline void write_pte(pte_t *p, pte_t pte)
@@ -231,15 +207,6 @@ static inline pte_t pte_from_mfn(mfn_t mfn, pte_attr_t flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
-static inline mfn_t _vmap_to_mfn(vaddr_t va)
-{
-    pte_t entry = pt_walk(va, NULL);
-
-    BUG_ON(!pte_is_mapping(entry));
-
-    return mfn_from_pte(entry);
-}
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4047d67c0e..774ea42f2d 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -3,6 +3,7 @@
 #include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/libfdt/libfdt.h>
@@ -613,3 +614,16 @@ void __iomem *ioremap(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
+
+void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    const void *v = map_domain_page(_mfn(mfn));
+
+    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
+        BUG();
+
+    unmap_domain_page(v);
+
+    if ( sync_icache )
+        invalidate_icache();
+}
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC394773A51
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579783.907910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMD-0003Y2-Do; Tue, 08 Aug 2023 13:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579783.907910; Tue, 08 Aug 2023 13:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMD-0003SD-7e; Tue, 08 Aug 2023 13:02:41 +0000
Received: by outflank-mailman (input) for mailman id 579783;
 Tue, 08 Aug 2023 13:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMMC-0003KL-6A
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:02:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da3608df-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:02:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb724cso35102535e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:02:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d4acf000000b003144b50034esm13567072wrs.110.2023.08.08.06.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:02:37 -0700 (PDT)
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
X-Inumbo-ID: da3608df-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499758; x=1692104558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bmCX6/SgqPEzLULBMXi4oRdiZi0jx4EL6SjA6yskLk=;
        b=bYvV3jm8vm2ZXHhiwwyLmeZIgAfDGl8g1mq6KQErwgRsYe/a/ByiM5MSIQS7FZHhel
         6Hv3ekMucT5gR64edHqzlpOaJpy4Foi3NGc2eQgQaAiReMfAute04vzsr6W1bR/F5ewv
         iMY2HtiwXSxkMf1JC1nXYTTs6DCeAyM4JyN9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499758; x=1692104558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bmCX6/SgqPEzLULBMXi4oRdiZi0jx4EL6SjA6yskLk=;
        b=jTaErEwRMirqqcJkhQBv19YNwrI8JwX38zzqeis4V6ooUHyfqGe/mU7SfsNQ41oiHI
         a++r5xk8TV+Psc0yXOORVKQ/CEkDAd8FLJXh00Tfd2uIqMWS19KhEM2Z3IAym4JBRZJj
         rbDzpL2/tShna+EZeKph3MlkK+z3bdFcvx0Fm/LB7fqgYN6a7JRZTvGik4oA52qTuPFu
         H3tztfhQwxSmahXOwOLfN5P7aU6IcK51B6Dnd0KkGyvS+yFaRyVGkEagfngR75QLSiGv
         dbArUJq0XQ7E/7lgUrPuL4BlX4fCIJ+4PJuNqK+pPwF7adDCWNLo4/d3GuMQm4WqgNrk
         gIlw==
X-Gm-Message-State: AOJu0YzuNHGy3sMewVkbeCXJ8c/zCsd4q9fdWI14QQw0+4VYFby43CGo
	l07KWgQFMg6MnatXqomZyZqkCiZt5o3cT73vf5I=
X-Google-Smtp-Source: AGHT+IERdw9jYA65AeSDb2KHKpJuXgzQlTIsNLOUX/DL5ZjhbGQmF3n4QiyOitzjtZblISW7wP80Xg==
X-Received: by 2002:adf:e50e:0:b0:314:1ebc:6e19 with SMTP id j14-20020adfe50e000000b003141ebc6e19mr8153117wrm.64.1691499758316;
        Tue, 08 Aug 2023 06:02:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 2/4] mm/pdx: Standardize region validation wrt pdx compression
Date: Tue,  8 Aug 2023 14:02:18 +0100
Message-Id: <20230808130220.27891-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regions must be occasionally validated for pdx compression validity. That
is, whether any of the machine addresses spanning the region have a bit set
in the pdx "hole" (which is expected to always contain zeroes). There are
a few such tests through the code, and they all check for different things.

This patch replaces all such occurrences with a call to a centralized
function that checks a region for validity.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
  * Pack variable declarations on top of the function (Jan)
  * Restrict variable scope by moving their declaration to the top of the
    loop in which they are used (Jan)
---
 xen/arch/x86/x86_64/mm.c |  6 ++++--
 xen/common/efi/boot.c    | 13 ++++++++++---
 xen/common/pdx.c         | 10 ++++++++--
 xen/include/xen/pdx.h    |  9 +++++++++
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 15b36e332d..d3f7c59638 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1158,6 +1158,8 @@ static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 {
     unsigned long s, e, length, sidx, eidx;
+    paddr_t mem_base = pfn_to_paddr(spfn);
+    unsigned long mem_npages = epfn - spfn;
 
     if ( (spfn >= epfn) )
         return 0;
@@ -1168,7 +1170,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
     if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
         return 0;
 
-    if ( (spfn | epfn) & pfn_hole_mask )
+    if ( !pdx_is_region_compressible(mem_base, mem_npages) )
         return 0;
 
     /* Make sure the new range is not present now */
@@ -1207,7 +1209,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 
     length += (e - s) * sizeof(struct page_info);
 
-    if ((length >> PAGE_SHIFT) > (epfn - spfn))
+    if ((length >> PAGE_SHIFT) > mem_npages)
         return 0;
 
     return 1;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 79a654af69..be4e3a0259 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -14,6 +14,7 @@
 #include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/pci_regs.h>
+#include <xen/pdx.h>
 #include <xen/pfn.h>
 #if EFI_PAGE_SIZE != PAGE_SIZE
 # error Cannot use xen/pfn.h here!
@@ -1645,9 +1646,11 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
 
 static bool __init cf_check ram_range_valid(unsigned long smfn, unsigned long emfn)
 {
+    paddr_t ram_base = pfn_to_paddr(smfn);
+    unsigned long ram_npages = emfn - smfn;
     unsigned long sz = pfn_to_pdx(emfn - 1) / PDX_GROUP_COUNT + 1;
 
-    return !(smfn & pfn_hole_mask) &&
+    return pdx_is_region_compressible(ram_base, ram_npages) &&
            find_next_bit(pdx_group_valid, sz,
                          pfn_to_pdx(smfn) / PDX_GROUP_COUNT) < sz;
 }
@@ -1681,6 +1684,8 @@ void __init efi_init_memory(void)
         u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
         unsigned long smfn, emfn;
         unsigned int prot = PAGE_HYPERVISOR_RWX;
+        paddr_t mem_base;
+        unsigned long mem_npages;
 
         printk(XENLOG_INFO " %013" PRIx64 "-%013" PRIx64
                            " type=%u attr=%016" PRIx64 "\n",
@@ -1732,6 +1737,9 @@ void __init efi_init_memory(void)
         smfn = PFN_DOWN(desc->PhysicalStart);
         emfn = PFN_UP(desc->PhysicalStart + len);
 
+        mem_base = pfn_to_paddr(smfn);
+        mem_npages = emfn - smfn;
+
         if ( desc->Attribute & EFI_MEMORY_WB )
             prot |= _PAGE_WB;
         else if ( desc->Attribute & EFI_MEMORY_WT )
@@ -1759,8 +1767,7 @@ void __init efi_init_memory(void)
             prot |= _PAGE_NX;
 
         if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
-             !(smfn & pfn_hole_mask) &&
-             !((smfn ^ (emfn - 1)) & ~pfn_pdx_bottom_mask) )
+             pdx_is_region_compressible(mem_base, mem_npages))
         {
             if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
                 prot &= ~_PAGE_GLOBAL;
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 99d4a90a50..3c88ceeb9c 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -88,7 +88,7 @@ bool __mfn_valid(unsigned long mfn)
 }
 
 /* Sets all bits from the most-significant 1-bit down to the LSB */
-static uint64_t __init fill_mask(uint64_t mask)
+static uint64_t fill_mask(uint64_t mask)
 {
     while (mask & (mask + 1))
         mask |= mask + 1;
@@ -96,6 +96,12 @@ static uint64_t __init fill_mask(uint64_t mask)
     return mask;
 }
 
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    return !(paddr_to_pfn(base) & pfn_hole_mask) &&
+           !(pdx_region_mask(base, npages * PAGE_SIZE) & ~ma_va_bottom_mask);
+}
+
 /* We don't want to compress the low MAX_ORDER bits of the addresses. */
 uint64_t __init pdx_init_mask(uint64_t base_addr)
 {
@@ -103,7 +109,7 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
+uint64_t pdx_region_mask(uint64_t base, uint64_t len)
 {
     /*
      * We say a bit "moves" in a range if there exist 2 addresses in that
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 8f29598230..5674506f3a 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -79,6 +79,15 @@ extern unsigned long pfn_top_mask, ma_top_mask;
                          (sizeof(*frame_table) & -sizeof(*frame_table)))
 extern unsigned long pdx_group_valid[];
 
+/**
+ * Validate a region's compatibility with the current compression runtime
+ *
+ * @param base Base address of the region
+ * @param npages Number of PAGE_SIZE-sized pages in the region
+ * @return True iff the region can be used with the current compression
+ */
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages);
+
 /**
  * Calculates a mask covering "moving" bits of all addresses of a region
  *
-- 
2.34.1



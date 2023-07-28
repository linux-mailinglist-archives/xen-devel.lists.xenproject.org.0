Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2036766616
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571349.894985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINc-0006jk-Lx; Fri, 28 Jul 2023 07:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571349.894985; Fri, 28 Jul 2023 07:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINc-0006i4-Ip; Fri, 28 Jul 2023 07:59:20 +0000
Received: by outflank-mailman (input) for mailman id 571349;
 Fri, 28 Jul 2023 07:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINa-0006Dw-Q7
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:18 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a725496d-2d1c-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 09:59:18 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso28344991fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:18 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:17 -0700 (PDT)
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
X-Inumbo-ID: a725496d-2d1c-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531157; x=1691135957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReW9AFHXUwWmGUET4cW6Dn/Jk38PwulLbjZEb+sqj5c=;
        b=NoLmZEJcNafj6b36zzbyv7+fjNo1/f+wlIq+rbDqvoqQR2eRXbRWVDgRO40mAn4Hfa
         xg86awH016D18+eTYIDtF4BZS3xi8qiGCgRl7zv831+6LL8+Qym8Q2O2QWaxnX+gAjJy
         jt8qJhHfyHb6Cqv2/oTAwfqBiZ+BTtadKZ+KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531157; x=1691135957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReW9AFHXUwWmGUET4cW6Dn/Jk38PwulLbjZEb+sqj5c=;
        b=ImDduFd75uLBoyyxz+rJ7WiK11wkWwaSwcU10CY0GNynXJq+CUhQEPFhVDxujNE8f1
         o4qgZFLANBSWv0NnA3OTpRyLVaEUFlkGHU868aYI/TNddaBM9vhE0dthVytFHRd8iu3b
         P6MBBvJWQ9eKD6gvauIKluIeL/mxUHcxSDHgpq3dwJ276v75w4hH260G0bvb5grpe+1O
         FJllZnZw726jHIf6Oe7fPameTOntSuvaYrWwB02h1nn4qlyPznPusB6qhejKrnnRpS0N
         8Xl/rljHUDWFHYRRC4f+9u/cVoYOflWx3vbCfcmiDvWV0RuewM4t5FjuQsF5imfp/6uR
         cVwQ==
X-Gm-Message-State: ABy/qLap1JrX6RMsIIiwK0TaPsLAeS6DQpYgzJRs2C5zFPvMB8KsNKZN
	/UXLmXnNVT/uYvWAl9vwRjnTUaZagJ1F1AzT3e7A5g==
X-Google-Smtp-Source: APBJJlGL69JYizj8RU8kJ9Wo/8uZ+bmzmVMetwAhxVo7wvpNSIlCNWp52zwJYLLmY19BdSqP5HvIJw==
X-Received: by 2002:a2e:b045:0:b0:2b6:e283:32cb with SMTP id d5-20020a2eb045000000b002b6e28332cbmr1153579ljl.23.1690531157645;
        Fri, 28 Jul 2023 00:59:17 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/5] mm/pdx: Standardize region validation wrt pdx compression
Date: Fri, 28 Jul 2023 08:59:01 +0100
Message-Id: <20230728075903.7838-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regions must be occasionally validated for pdx compression validity. That
is, whether any of the machine addresses spanning the region have a bit set
in the pdx "hole" (which is expected to always contain zeroes). There are
a few such tests through the code, and they all check for different things.

This patch replaces all such occurrences with a call to a centralized
function that checks a region for validity.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * s/occurences/ocurrences in commit message (Julien)
  * Use pfn_to_paddr()/paddr_to_pfn() (Julien)
  * Use (paddr_t,unsigned long) in pdx_is_region_compressible() (Julien, Jan)
---
 xen/arch/x86/x86_64/mm.c |  7 +++++--
 xen/common/efi/boot.c    | 13 ++++++++++---
 xen/common/pdx.c         | 10 ++++++++--
 xen/include/xen/pdx.h    |  9 +++++++++
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 60db439af3..652e787934 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1159,6 +1159,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 {
     unsigned long s, e, length, sidx, eidx;
 
+    paddr_t mem_base = pfn_to_paddr(spfn);
+    unsigned long mem_npages = epfn - spfn;
+
     if ( (spfn >= epfn) )
         return 0;
 
@@ -1168,7 +1171,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
     if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
         return 0;
 
-    if ( (spfn | epfn) & pfn_hole_mask )
+    if ( !pdx_is_region_compressible(mem_base, mem_npages) )
         return 0;
 
     /* Make sure the new range is not present now */
@@ -1207,7 +1210,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 
     length += (e - s) * sizeof(struct page_info);
 
-    if ((length >> PAGE_SHIFT) > (epfn - spfn))
+    if ((length >> PAGE_SHIFT) > mem_npages)
         return 0;
 
     return 1;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 79a654af69..52a7239389 100644
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
@@ -1660,6 +1663,8 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
 
 void __init efi_init_memory(void)
 {
+    paddr_t mem_base;
+    unsigned long mem_npages;
     unsigned int i;
     l4_pgentry_t *efi_l4t;
     struct rt_extra {
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
index d96f03d6e6..8c6aec2aea 100644
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



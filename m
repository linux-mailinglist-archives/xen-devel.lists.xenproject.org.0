Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EA7568A2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564733.882425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh7-0003HW-Tf; Mon, 17 Jul 2023 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564733.882425; Mon, 17 Jul 2023 16:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh7-00037B-LN; Mon, 17 Jul 2023 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 564733;
 Mon, 17 Jul 2023 16:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh5-0002Zo-Ih
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:27 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764ff69d-24bb-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 18:03:25 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5216569f9e3so4831001a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
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
X-Inumbo-ID: 764ff69d-24bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609805; x=1692201805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhpWCn/ri7wmy6U70OoVzKYS333ZuYeUMZy4TaZcJGg=;
        b=LC8OXhHYu2epObgaJF1GN8yE+taRZmj2Deix//fzqFxnm4zzgTsSRxqKU35v6fbcaY
         Fo3dh22EUX1fPQx8YgXsJt8gWAY5OeKljz9zY2CL4yNl9ksag1Y0Q0Wy4rmZSqD07dSt
         OHNePmKyjiZElFKHZrs6C2QYd+1pzVU4Ppjjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609805; x=1692201805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhpWCn/ri7wmy6U70OoVzKYS333ZuYeUMZy4TaZcJGg=;
        b=dWAR5Hhju0ANpEtpW7+pxIjBSgcO24xiYdOa1+j/KjroscnrIWpD3J7VXbSzF889Qd
         neXSPIZZrJ2D+JWdttDqptH0e8cTwaCS8mWcMr/u+sSiqAJGz1KzvKqcUuZGjgUazosG
         40fvk1r3Cs8KBryJKh9DU9jmIagUYdNvWQ1EOnIOU4JWplTjfqM+WurlXlLSDdb0Fe6g
         puGHCkYSn5A9vmxDI6ne8/3QYGdtb88O3D+EncWIdYLGFBvhvlktGZDEh1FfJZoHYlrn
         VB/HvuCrXdZRYCHJhpsUspCnVyXdIdeO4zAD+CCdrQZKUs+PjTG064Id0YxD1iJHKMnM
         jhpg==
X-Gm-Message-State: ABy/qLY/mgRNmWM0A2KTZPakhNB2WXJyWDZweNRnGLb+q6GK6l8rXIAg
	9h8N7aAdTF61BMygIGS5HFuwchzlSwoZNugTIYg=
X-Google-Smtp-Source: APBJJlFnFUUmOQ+wqt6dusKepCAatkVsCd0yz8EvIbApX95MNtQnG6lkA4Vb2tobteJBuPe+BusbqA==
X-Received: by 2002:a05:6402:335:b0:51e:288d:2a27 with SMTP id q21-20020a056402033500b0051e288d2a27mr12091129edw.11.1689609805273;
        Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
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
Subject: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx compression
Date: Mon, 17 Jul 2023 17:03:16 +0100
Message-Id: <20230717160318.2113-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regions must be occasionally validated for pdx compression validity. That
is, whether any of the machine addresses spanning the region have a bit set
in the pdx "hole" (which is expected to always contain zeroes). There are
a few such tests through the code, and they all check for different things.

This patch replaces all such occurences with a call to a centralized
function that checks a region for validity.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/x86_64/mm.c |  2 +-
 xen/common/efi/boot.c    |  6 +++---
 xen/common/pdx.c         | 13 +++++++++++--
 xen/include/xen/pdx.h    |  9 +++++++++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 60db439af3..914e65c26c 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1168,7 +1168,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
     if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
         return 0;
 
-    if ( (spfn | epfn) & pfn_hole_mask )
+    if ( !pdx_is_region_compressible(spfn, epfn) )
         return 0;
 
     /* Make sure the new range is not present now */
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 24169b7b50..b098a8c030 100644
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
@@ -1647,7 +1648,7 @@ static bool __init cf_check ram_range_valid(unsigned long smfn, unsigned long em
 {
     unsigned long sz = pfn_to_pdx(emfn - 1) / PDX_GROUP_COUNT + 1;
 
-    return !(smfn & pfn_hole_mask) &&
+    return pdx_is_region_compressible(smfn, emfn) &&
            find_next_bit(pdx_group_valid, sz,
                          pfn_to_pdx(smfn) / PDX_GROUP_COUNT) < sz;
 }
@@ -1759,8 +1760,7 @@ void __init efi_init_memory(void)
             prot |= _PAGE_NX;
 
         if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
-             !(smfn & pfn_hole_mask) &&
-             !((smfn ^ (emfn - 1)) & ~pfn_pdx_bottom_mask) )
+             pdx_is_region_compressible(smfn, emfn))
         {
             if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
                 prot &= ~_PAGE_GLOBAL;
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 99d4a90a50..72845e4bab 100644
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
@@ -96,6 +96,15 @@ static uint64_t __init fill_mask(uint64_t mask)
     return mask;
 }
 
+bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
+{
+    uint64_t base = smfn << PAGE_SHIFT;
+    uint64_t len = (emfn - smfn) << PAGE_SHIFT;
+
+    return !(smfn & pfn_hole_mask) &&
+           !(pdx_region_mask(base, len) & ~ma_va_bottom_mask);
+}
+
 /* We don't want to compress the low MAX_ORDER bits of the addresses. */
 uint64_t __init pdx_init_mask(uint64_t base_addr)
 {
@@ -103,7 +112,7 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
+uint64_t pdx_region_mask(uint64_t base, uint64_t len)
 {
     /*
      * We say a bit "moves" in a range if there exist 2 addresses in that
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index f8ca0f5821..5378e664c2 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -77,6 +77,15 @@ extern unsigned long pfn_top_mask, ma_top_mask;
                          (sizeof(*frame_table) & -sizeof(*frame_table)))
 extern unsigned long pdx_group_valid[];
 
+/**
+ * Validate a region's compatibility with the current compression runtime
+ *
+ * @param smfn Start mfn
+ * @param emfn End mfn (non-inclusive)
+ * @return True iff the region can be used with the current compression
+ */
+bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn);
+
 /**
  * Calculates a mask covering "moving" bits of all addresses of a region
  *
-- 
2.34.1



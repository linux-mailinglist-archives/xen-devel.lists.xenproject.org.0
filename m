Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2117568A7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564732.882418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh7-000379-CU; Mon, 17 Jul 2023 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564732.882418; Mon, 17 Jul 2023 16:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh7-00030p-59; Mon, 17 Jul 2023 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 564732;
 Mon, 17 Jul 2023 16:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh5-00027B-4c
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:27 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75f1a2cd-24bb-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:03:25 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51e56749750so6312473a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:25 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:24 -0700 (PDT)
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
X-Inumbo-ID: 75f1a2cd-24bb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609804; x=1692201804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaOSzOKwnaNDbtFFGDCLrWszAMCEvLERpiHBsiwXmN8=;
        b=VvXSrWXjavQXI5yrEBMvKrTHVuE2itZE0f9oFhSLvAVAI1RTJGLVA3uqhxBzf3MMSh
         zTyK49m5celffRs4jobunADI5Kc3uv3YaHzbiP4iy9ONqjGDUNA2QMg69bXyvuq5wjl5
         3MYXJd4ATPjuKvZGXB/uxLoB04zVq8sxvM1l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609804; x=1692201804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaOSzOKwnaNDbtFFGDCLrWszAMCEvLERpiHBsiwXmN8=;
        b=dAjb9EUzeNiNBZDLzdWNmgn7m776iSFuQt1W4/ANG5Y7cDJnc7MMEBHdGkwFwCkLo+
         h6qty6M6LhX+0eUqis74GlNhtN7UKC51JyV0qB7mCkN5xnOXYumwv2UBx5nfeIxGbV7Z
         aIwnY5k3We7LBYir2RDTFQu/PiGaRy998fgOKZnPGvZYb2IO1bAD4BN5y2cDHWovQGdN
         BzjViPuWxES8GI3p+XlFFdUGXyJobFyvgA2NdUnpSslQVarS5DdJ3XKRMh3rrCJniWdO
         oxEtSsmO3Tdb9pFLGzCA1sBPWECbYUW2yY7GlVJki2KEuoIXZ879VRhNlfQd4Fdkaa2m
         EZRQ==
X-Gm-Message-State: ABy/qLYFMYNfCPmq2Hojanoxe2gc4y1dXKDxeisgK+xiEFNRHrXqKGYR
	rlv5+jd38kd2qR6cXcEm7YxDyJETIvdh09JF+cs=
X-Google-Smtp-Source: APBJJlHxlHXDnujOKuyyvPzhR1A6cx4oXng80WRe0d6aM0pVJeTuzQusY90cvxRft80tFLU+BAPBZA==
X-Received: by 2002:a05:6402:8c2:b0:51d:ece5:afd9 with SMTP id d2-20020a05640208c200b0051dece5afd9mr12464346edz.21.1689609804717;
        Mon, 17 Jul 2023 09:03:24 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/8] mm: Factor out the pdx compression logic in ma/va converters
Date: Mon, 17 Jul 2023 17:03:15 +0100
Message-Id: <20230717160318.2113-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch factors out the pdx compression logic hardcoded in both ports
for the maddr<->vaddr conversion functions.

Touches both x86 and arm ports.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/arm/include/asm/mm.h          |  3 +--
 xen/arch/x86/include/asm/x86_64/page.h | 28 +++++++++++---------------
 xen/include/xen/pdx.h                  | 25 +++++++++++++++++++++++
 3 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 1a83f41879..78cb23858a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -320,8 +320,7 @@ static inline void *maddr_to_virt(paddr_t ma)
            (DIRECTMAP_SIZE >> PAGE_SHIFT));
     return (void *)(XENHEAP_VIRT_START -
                     (directmap_base_pdx << PAGE_SHIFT) +
-                    ((ma & ma_va_bottom_mask) |
-                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
+                    maddr_to_directmapoff(ma));
 }
 #endif
 
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 53faa7875b..b589c93e77 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -36,26 +36,22 @@ static inline unsigned long __virt_to_maddr(unsigned long va)
 {
     ASSERT(va < DIRECTMAP_VIRT_END);
     if ( va >= DIRECTMAP_VIRT_START )
-        va -= DIRECTMAP_VIRT_START;
-    else
-    {
-        BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START != GB(1));
-        /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
-        ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) ==
-               ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
-
-        va += xen_phys_start - XEN_VIRT_START;
-    }
-    return (va & ma_va_bottom_mask) |
-           ((va << pfn_pdx_hole_shift) & ma_top_mask);
+        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+
+    BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START != GB(1));
+    /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
+    ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) ==
+           ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
+
+    return xen_phys_start + va - XEN_VIRT_START;
 }
 
 static inline void *__maddr_to_virt(unsigned long ma)
 {
-    ASSERT(pfn_to_pdx(ma >> PAGE_SHIFT) < (DIRECTMAP_SIZE >> PAGE_SHIFT));
-    return (void *)(DIRECTMAP_VIRT_START +
-                    ((ma & ma_va_bottom_mask) |
-                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
+    /* Offset in the direct map, accounting for pdx compression */
+    size_t va_offset = maddr_to_directmapoff(ma);
+    ASSERT(va_offset < DIRECTMAP_SIZE);
+    return (void *)(DIRECTMAP_VIRT_START + va_offset);
 }
 
 /* read access (should only be used for debug printk's) */
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 67ae20e89c..f8ca0f5821 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -158,6 +158,31 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
+/**
+ * Computes the offset into the direct map of an maddr
+ *
+ * @param ma Machine address
+ * @return Offset on the direct map where that
+ *         machine address can be accessed
+ */
+static inline unsigned long maddr_to_directmapoff(uint64_t ma)
+{
+    return ((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
+           (ma & ma_va_bottom_mask);
+}
+
+/**
+ * Computes a machine address given a direct map offset
+ *
+ * @param offset Offset into the direct map
+ * @return Corresponding machine address of that virtual location
+ */
+static inline uint64_t directmapoff_to_maddr(unsigned long offset)
+{
+    return ((offset << pfn_pdx_hole_shift) & ma_top_mask) |
+           (offset & ma_va_bottom_mask);
+}
+
 /**
  * Initializes global variables with information about the compressible
  * range of the current memory regions.
-- 
2.34.1



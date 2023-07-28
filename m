Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84079766613
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571348.894970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINb-0006KG-Fv; Fri, 28 Jul 2023 07:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571348.894970; Fri, 28 Jul 2023 07:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINb-0006GD-Bh; Fri, 28 Jul 2023 07:59:19 +0000
Received: by outflank-mailman (input) for mailman id 571348;
 Fri, 28 Jul 2023 07:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINZ-0006Dw-W6
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6a4c6db-2d1c-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 09:59:17 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe078dcc3aso3667735e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:17 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:15 -0700 (PDT)
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
X-Inumbo-ID: a6a4c6db-2d1c-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531157; x=1691135957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt7MNId42NKzPH0LoomOcyWXMl9Ow7M05CuxT4VL3vE=;
        b=ihzhbyOMiOe6/fCo3LmEqaQjxwMArNoiDj9g23OikZX3YEN+jnulWtI+iCqwhRCpVf
         Vdhy+DqWq0Vf9fL72lxJ3krkkuyHZ3SkABo4+/2yhmg+8sQv4qh94aHW+EYq/9IqIboN
         l+FVMc9ipD4SHHa4uhKJ4345dMi74v/8HEm1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531157; x=1691135957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt7MNId42NKzPH0LoomOcyWXMl9Ow7M05CuxT4VL3vE=;
        b=KvAWZM0WOda0pAovmZIUs7+lQS8c90iwRN7KP6ajSXNjkdsyr6w56oyhUB9jJmgRn3
         0yCmfrfAR2BRV+SHpb4F4CD6WZBzZ4mUQ+CWThRlg1Wiu9avpceYalhWghreDg5+YlAg
         AEAbDKDBIB1ZR7JBsxC7L3y76hkrPf84y1GAhIej4LYmLoqiih5PkLxTLOtfs+iXBu/Y
         8wYU0skirw0RbEJfbIe9njpnFGU8Ujw+AK5Lp+a60/cfMcPzykEH1x+ENceAObwFpH13
         bQlwFANQQJSP5IP+v8pZ7hI7/NlG6Doqe6wgYUIXfIM+DqjMd+zH5h1FY6H33Brs/CJg
         2rjA==
X-Gm-Message-State: ABy/qLZq5Z9OI6tuSxZgHeWvnLyimV6Iwgbn5FWc4HcofnXjCxG0ibPm
	raiduS1ReRmB/FPx7/qMvJIOheNWQ/ZTj1i9eVn9nQ==
X-Google-Smtp-Source: APBJJlEAvsPA2G6iRDxTSJAWiZjDXyB+jNdecDwz4ksSRdcfd3N5Whf7AuucdMUNf6QHOHK68TUHNA==
X-Received: by 2002:a05:600c:2048:b0:3f9:b30f:a013 with SMTP id p8-20020a05600c204800b003f9b30fa013mr1237444wmg.6.1690531156785;
        Fri, 28 Jul 2023 00:59:16 -0700 (PDT)
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
Subject: [PATCH v2 2/5] mm: Factor out the pdx compression logic in ma/va converters
Date: Fri, 28 Jul 2023 08:59:00 +0100
Message-Id: <20230728075903.7838-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch factors out the pdx compression logic hardcoded in both ports
for the maddr<->vaddr conversion functions.

Touches both x86 and arm ports.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Cast variable to u64 before shifting left to avoid overflow (Julien)
---
 xen/arch/arm/include/asm/mm.h          |  3 +--
 xen/arch/x86/include/asm/x86_64/page.h | 28 +++++++++++---------------
 xen/include/xen/pdx.h                  | 25 +++++++++++++++++++++++
 3 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5b530f0f40..c0d7f0f181 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -319,8 +319,7 @@ static inline void *maddr_to_virt(paddr_t ma)
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
index de5439a5e5..d96f03d6e6 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -160,6 +160,31 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
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
+    return (((uint64_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
+           (offset & ma_va_bottom_mask);
+}
+
 /**
  * Initializes global variables with information about the compressible
  * range of the current memory regions.
-- 
2.34.1



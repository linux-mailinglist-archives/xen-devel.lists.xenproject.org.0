Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1744773A55
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579782.907904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMD-0003Qo-3s; Tue, 08 Aug 2023 13:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579782.907904; Tue, 08 Aug 2023 13:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMC-0003Mw-Tx; Tue, 08 Aug 2023 13:02:40 +0000
Received: by outflank-mailman (input) for mailman id 579782;
 Tue, 08 Aug 2023 13:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMMB-0003KL-QL
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:02:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9aac536-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:02:38 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe2fb9b4d7so47794765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:02:38 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d4acf000000b003144b50034esm13567072wrs.110.2023.08.08.06.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:02:36 -0700 (PDT)
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
X-Inumbo-ID: d9aac536-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499757; x=1692104557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6QBQAGjY2r360IlHRoBLqtdiryrX7RiFTTDs7pUf/s=;
        b=lc7bZs3dOMd6Nfz9ANn2pPGoZX0osgPGShUy6l6kN2Yq6Z/ZJoMOqVnmGyLsy4hCDL
         B6MG6+iJjZKS9NaWVbpqrgb28AwKQWOzmdYsoFhSiStk+8R0UMs9djSaBGjN14+qhMkn
         GX+CpclGLCSR4GndhJCA93ewSmAEiGEuTp4Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499757; x=1692104557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6QBQAGjY2r360IlHRoBLqtdiryrX7RiFTTDs7pUf/s=;
        b=Yb1k6OWU82S00uPKZ4rgat0tUsRvZpsKHzVjIiKtxa7xZPVJmphXX/22nySLtP1+7f
         WZ28LVfgDeRAgardKIUWunMoMHHYkr9/SEjz+9OC8RjRl9TcAWFsW3+gNSf0PrKQYDWj
         I7o+RIon4WnsnMwQgcp9lhB5oy1EUyCWqqOteyUJOzK1FSLNrXj9oj+ru9Tvo0LXDPPx
         5uknn9KWyhQcr7JTB1Jr7BHAxsbi/Ud1YzD3B7eyeF0BcOZK2j487yl9ERlRn85LpyAR
         c3YX6ZpH/JEOE6WSO900Pch5TIy/2igOM5lTXUS2PQgTftjPzANd9RYDYSFmP3sAhZMn
         4LhQ==
X-Gm-Message-State: AOJu0YxawKebhctvo702AlRnN+iGnv9EdEqKOqZN8qjlw2l/WxtTltWw
	CLm6faZrKozZQQ14gq0ki8PQ656/nZNB022A8DE=
X-Google-Smtp-Source: AGHT+IGI4sjkvPq5FlJLChKC03G3IDBfL8r9LDQBa14X9x6e46zkyN+2uB0RKQUmhONKDEg0sakldw==
X-Received: by 2002:adf:ce09:0:b0:317:5caa:c3a3 with SMTP id p9-20020adfce09000000b003175caac3a3mr7489337wrn.40.1691499757343;
        Tue, 08 Aug 2023 06:02:37 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/4] mm: Factor out the pdx compression logic in ma/va converters
Date: Tue,  8 Aug 2023 14:02:17 +0100
Message-Id: <20230808130220.27891-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch factors out the pdx compression logic hardcoded in both ports
for the maddr<->vaddr conversion functions.

Touches both x86 and arm ports.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
  * size_t -> unsigned long (Jan)
  * uint64_t -> paddr_t (Jan)
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
index 53faa7875b..e40b451221 100644
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
+    unsigned long va_offset = maddr_to_directmapoff(ma);
+    ASSERT(va_offset < DIRECTMAP_SIZE);
+    return (void *)(DIRECTMAP_VIRT_START + va_offset);
 }
 
 /* read access (should only be used for debug printk's) */
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index de5439a5e5..8f29598230 100644
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
+static inline unsigned long maddr_to_directmapoff(paddr_t ma)
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
+static inline paddr_t directmapoff_to_maddr(unsigned long offset)
+{
+    return (((paddr_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
+           (offset & ma_va_bottom_mask);
+}
+
 /**
  * Initializes global variables with information about the compressible
  * range of the current memory regions.
-- 
2.34.1



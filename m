Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D18DAE19B0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020844.1396969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZel-0005a7-UB; Fri, 20 Jun 2025 11:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020844.1396969; Fri, 20 Jun 2025 11:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZel-0005Xh-Pu; Fri, 20 Jun 2025 11:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1020844;
 Fri, 20 Jun 2025 11:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZek-0005XV-AG
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 548d64f5-4dc7-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 13:11:36 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so19883375e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d0f18215sm1745673f8f.29.2025.06.20.04.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:34 -0700 (PDT)
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
X-Inumbo-ID: 548d64f5-4dc7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417895; x=1751022695; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxbjBN87wnj0AUXMvgpO31kjAgExGSkQK2SRaU2awvM=;
        b=F4WW8zMa2sNxMiNbWZ93+M+ZG2Q2ni2wuLtPOYkBsi5M/JkSjwn0/H8GnZvg8zfksx
         b+qrpXKuWXSrcJvGoI5pxRyeuwOXU95374bFdVYNJ5n+kLy+ycL2wCbLSZUXEI6npurh
         Fz11vSE0adPSVTB4fnGCd0Me+CX0kiyPwHx/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417895; x=1751022695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxbjBN87wnj0AUXMvgpO31kjAgExGSkQK2SRaU2awvM=;
        b=nWbpLs84TDQOpiMlzKhijNqv+2k8CjzntPRiCylTo19Vpm0krgEEH53RNyPYbUl2/C
         bohxwvvTuVRgPk01/k6VL8ul4Aci4cDShZxBnZqvfg62qlflZtstfA6Mug0czahZrWRH
         dtuxAsh7pE7RXS+57GsX7Ffcm8L/e+OfFCvt//B4i5sMIEZIjIwOqX40eThEtKAdJnJH
         PsYJjDFWkEhm4dSVBTfxGL80BSW9TXiTpy4uULSCSd/JwOnv01m0H2gEEOP6562TKoFV
         GsJJ5FH7GaKzDitWtea3Rivi50tKPpklF/CWo5k8B/00AOcsXqukjkuZYBEXYd0tCdql
         Wofw==
X-Gm-Message-State: AOJu0YzZtLIEMO39yafehOtGB8XvzxVHpXm4h3eP85I1NE8WgAe07Ge6
	gDzNnpq9j/s92VhRuU2Z64zb3JgpiLzDtxRKWLkUhlBhfsV5u1V0C0tGc+PABnl8gyiyJ2oaC1r
	9pZLB
X-Gm-Gg: ASbGnctU0P3Nf1hqSlORuUH+sr8kH6CiXtlzcjWP2UYj1852Luu/IrQ3LCiJiK+W0El
	C5pLVJvomx2KS5IwUuXsQiH2StblmVOF3Tjjl+beE1lvPe4IGsSRcN8ay0R9L+/NZs6mUZZuygM
	18/YRGFJvbGejpckXrw10rp9g5kK7FX+xeHW86zXkgbSwE44jybBSTrqhpPf86IDOHtNRK61S0z
	z1OWr0oYqMdohOhhZmsvcaFXKJC96qdpYoDS0vZ+NRKBr9L7ENTn821m56mNKcTDkCNqRbzbyke
	iPSQUU1TV2dJlxr5bvNL56T6uYIxC/b7G516eYqiy34/2rOj3uwNZ7Z+/Zyydm5b2GUPP4DRTZC
	qWMVEiil4I+SmJcneRo4wHo9hbphHHg==
X-Google-Smtp-Source: AGHT+IHIHPRlAOwa/O+aSU6bCJZbLczlcEvaLpUOCx3IIEZT5rimkIyoz4ISU2abc5Fd+dvjKFczNg==
X-Received: by 2002:a05:600c:4747:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-453659c0c2fmr24473355e9.31.1750417895165;
        Fri, 20 Jun 2025 04:11:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/8] x86/pdx: simplify calculation of domain struct allocation boundary
Date: Fri, 20 Jun 2025 13:11:23 +0200
Message-ID: <20250620111130.29057-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When not using CONFIG_BIGMEM there are some restrictions in the address
width for allocations of the domain structure, as it's PDX truncated to 32
bits it's stashed into page_info structure for domain allocated pages.

The current logic to calculate this limit is based on the internals of the
PDX compression used, which is not strictly required.  Instead simplify the
logic to rely on the existing PDX to PFN conversion helpers used elsewhere.

This has the added benefit of allowing alternative PDX compression
algorithms to be implemented without requiring to change the calculation of
the domain structure allocation boundary.

As a side effect introduce pdx_to_paddr() conversion macro and use it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use sizeof_field().
 - Introduce and use pdx_to_paddr().
 - Add comment.
---
 xen/arch/x86/domain.c | 40 +++++++++++-----------------------------
 xen/include/xen/pdx.h |  1 +
 2 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d025befe3d8e..14a0f6dda791 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -461,30 +461,6 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
-/*
- * The hole may be at or above the 44-bit boundary, so we need to determine
- * the total bit count until reaching 32 significant (not squashed out) bits
- * in PFN representations.
- * Note that the way "bits" gets initialized/updated/bounds-checked guarantees
- * that the function will never return zero, and hence will never be called
- * more than once (which is important due to it being deliberately placed in
- * .init.text).
- */
-static unsigned int __init noinline _domain_struct_bits(void)
-{
-    unsigned int bits = 32 + PAGE_SHIFT;
-    unsigned int sig = hweight32(~pfn_hole_mask);
-    unsigned int mask = pfn_hole_mask >> 32;
-
-    for ( ; bits < BITS_PER_LONG && sig < 32; ++bits, mask >>= 1 )
-        if ( !(mask & 1) )
-            ++sig;
-
-    return bits;
-}
-#endif
-
 struct domain *alloc_domain_struct(void)
 {
     struct domain *d;
@@ -498,14 +474,20 @@ struct domain *alloc_domain_struct(void)
      * On systems with CONFIG_BIGMEM there's no packing, and so there's no
      * such restriction.
      */
-#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
-    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
-                                                          32 + PAGE_SHIFT;
+#if defined(CONFIG_BIGMEM)
+    const unsigned int bits = 0;
 #else
-    static unsigned int __read_mostly bits;
+    static unsigned int __ro_after_init bits;
 
     if ( unlikely(!bits) )
-         bits = _domain_struct_bits();
+         /*
+          * Get the width for the next pfn, and unconditionally subtract one
+          * from it to ensure the used width will not allocate past the PDX
+          * field limit.
+          */
+         bits = flsl(pdx_to_paddr(1UL << (sizeof_field(struct page_info,
+                                                       v.inuse._domain) * 8)))
+                - 1;
 #endif
 
     BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 9faeea3ac9f2..c1423d64a95b 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -99,6 +99,7 @@ bool __mfn_valid(unsigned long mfn);
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
 #define paddr_to_pdx(pa) pfn_to_pdx(paddr_to_pfn(pa))
+#define pdx_to_paddr(px) pfn_to_paddr(pdx_to_pfn(px))
 
 #ifdef CONFIG_PDX_COMPRESSION
 
-- 
2.49.0



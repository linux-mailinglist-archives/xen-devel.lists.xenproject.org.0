Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8EAE19B5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020850.1397024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZer-0006nc-Ls; Fri, 20 Jun 2025 11:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020850.1397024; Fri, 20 Jun 2025 11:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZer-0006kj-HW; Fri, 20 Jun 2025 11:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1020850;
 Fri, 20 Jun 2025 11:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZep-0005XW-V1
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f86d06-4dc7-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 13:11:43 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so13059695e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453646cb57fsm22346425e9.1.2025.06.20.04.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:42 -0700 (PDT)
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
X-Inumbo-ID: 58f86d06-4dc7-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417903; x=1751022703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wldT8/hJRoQr9+P0tngsgZ2ttRe5059NLBS5IaMdmu4=;
        b=UlQkcyCgzs/MRDx+r6F69Aq3z1GbQzWX6PrJsRxbcwEYYpx1hKaA/UCYfPEMkiEto0
         z8Ud59mpKsxH3DsJ6VXaAyA6AadPehNelyapm7Z1VXRySGOXiwc8onkLOGM0814xUCLX
         G3LTlbdEPvyTL6SwELlQGsc58RalCCjGOgaro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417903; x=1751022703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wldT8/hJRoQr9+P0tngsgZ2ttRe5059NLBS5IaMdmu4=;
        b=aXQKJ3Ap7H/Uj19d4A/BN2diOUsozVa64gGC2jy3uSyQHSif1Fk5kVh0NIpQZcQPMZ
         BcsbbmvqKABGx7zR7CphkrKfc/bxxv4PzeULgC8lbKRSSx052pJt9hQscvQEZl3IBAbe
         z/eq9UiLVAQZ8ikIlpEq0NidICrQJ1u83/r3yBsea+oHUGa51LldZ9uMJZdFDfWG44Dg
         4SBGgfJRXtwDyr9r1wUNGtsBPfnMINOT1hSBPOtHadQ9wEAqSYgPcZipodJMZUP8+jF3
         bNG0it0cQaKDR068S4Jpw13azSxayMhpZFBPXH/39hczuUk7iEDSfmqODqebNaetYYIH
         Dwhg==
X-Gm-Message-State: AOJu0YwD/0OL/+vsMz+agfKT6n8HSh65yucakFTHsk7nKS3+DDEyEed4
	U7pybLqWq3Ge4Kt7aaJsGN7bYaQoPDSeymr8lwn1wztv7w0W92dUmxkEHsdDCh7+KJKPcqA/jRb
	b/CmK
X-Gm-Gg: ASbGncu+SPmmhj3bnbE4Wvb5y0YGgFkwla1XpX+SdLWh5fBXi9lWby0hp9YHb9Zipib
	i0suybdH4k4TfPm1mTtSPW6l0nM2GFW9WZAiwi0sSjzyDi5zEK2bIMEXJg4EJWtirWy+KvE9A9W
	E5zmpjvXEJHHskx/+HWX+nQuUjFMpuLU0iTrwH8Yy/MZ2CzUbOQ9PN50tIq81Yr1pyRrbNaJDXy
	b7j3mauad+HURx0oM67/7rO3p5j5eLk+eBhgBE6i+qNSsD+ci90igSPrBGLiDJ6wQMSR3wZehfs
	1sZ6r/doHPN/96hWLMgvcnOTX/1h9rHDY9Oy/F/GwASsCraaXiYniwMGvey/RVCiZTBUJKP2qHj
	k2+1DPeXrOOyx9qMrRZ+84jH+9ke8JA==
X-Google-Smtp-Source: AGHT+IHJiQ62hFFpGk1dacP+iqYl/Dmt8h7STK8m9XWPRJGoeBlj0alEIF5MZ6oahkw+8FizzIXZgA==
X-Received: by 2002:a05:6000:2807:b0:3a5:232c:6976 with SMTP id ffacd0b85a97d-3a6d12e3a8fmr1412325f8f.44.1750417902622;
        Fri, 20 Jun 2025 04:11:42 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 7/8] pdx: move some helpers in preparation for new compression
Date: Fri, 20 Jun 2025 13:11:29 +0200
Message-ID: <20250620111130.29057-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move fill_mask(), pdx_region_mask() and pdx_init_mask() to the
!CONFIG_PDX_NONE section in preparation of them also being used by a newly
added PDX compression.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
git is not very helpful when generating the diff here, and it ends up
moving everything around the functions instead of the functions themselves.
---
 xen/common/pdx.c | 118 +++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 5cfec591f993..d5e469baffe2 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -101,59 +101,6 @@ void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
     ranges[nr_ranges++].size = PFN_UP(base + size) - PFN_DOWN(base);
 }
 
-#endif /* !CONFIG_PDX_NONE */
-
-#ifdef CONFIG_PDX_MASK_COMPRESSION
-
-/*
- * Diagram to make sense of the following variables. The masks and shifts
- * are done on mfn values in order to convert to/from pdx:
- *
- *                      pfn_hole_mask
- *                      pfn_pdx_hole_shift (mask bitsize)
- *                      |
- *                 |---------|
- *                 |         |
- *                 V         V
- *         --------------------------
- *         |HHHHHHH|000000000|LLLLLL| <--- mfn
- *         --------------------------
- *         ^       ^         ^      ^
- *         |       |         |------|
- *         |       |             |
- *         |       |             pfn_pdx_bottom_mask
- *         |       |
- *         |-------|
- *             |
- *             pfn_top_mask
- *
- * ma_{top,va_bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask,
- * where ma_top_mask has zeroes shifted in while ma_va_bottom_mask has
- * ones.
- */
-
-/** Mask for the lower non-compressible bits of an mfn */
-unsigned long __ro_after_init pfn_pdx_bottom_mask = ~0UL;
-
-/** Mask for the lower non-compressible bits of an maddr or vaddr */
-unsigned long __ro_after_init ma_va_bottom_mask = ~0UL;
-
-/** Mask for the higher non-compressible bits of an mfn */
-unsigned long __ro_after_init pfn_top_mask = 0;
-
-/** Mask for the higher non-compressible bits of an maddr or vaddr */
-unsigned long __ro_after_init ma_top_mask = 0;
-
-/**
- * Mask for a pdx compression bit slice.
- *
- *  Invariant: valid(mfn) implies (mfn & pfn_hole_mask) == 0
- */
-unsigned long __ro_after_init pfn_hole_mask = 0;
-
-/** Number of bits of the "compressible" bit slice of an mfn */
-unsigned int __ro_after_init pfn_pdx_hole_shift = 0;
-
 /* Sets all bits from the most-significant 1-bit down to the LSB */
 static uint64_t fill_mask(uint64_t mask)
 {
@@ -196,12 +143,6 @@ static uint64_t pdx_region_mask(uint64_t base, uint64_t len)
     return fill_mask(base ^ (base + len - 1));
 }
 
-bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
-{
-    return !(paddr_to_pfn(base) & pfn_hole_mask) &&
-           !(pdx_region_mask(base, npages * PAGE_SIZE) & ~ma_va_bottom_mask);
-}
-
 /**
  * Creates the mask to start from when calculating non-compressible bits
  *
@@ -219,6 +160,65 @@ static uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
+#endif /* !CONFIG_PDX_NONE */
+
+#ifdef CONFIG_PDX_MASK_COMPRESSION
+
+/*
+ * Diagram to make sense of the following variables. The masks and shifts
+ * are done on mfn values in order to convert to/from pdx:
+ *
+ *                      pfn_hole_mask
+ *                      pfn_pdx_hole_shift (mask bitsize)
+ *                      |
+ *                 |---------|
+ *                 |         |
+ *                 V         V
+ *         --------------------------
+ *         |HHHHHHH|000000000|LLLLLL| <--- mfn
+ *         --------------------------
+ *         ^       ^         ^      ^
+ *         |       |         |------|
+ *         |       |             |
+ *         |       |             pfn_pdx_bottom_mask
+ *         |       |
+ *         |-------|
+ *             |
+ *             pfn_top_mask
+ *
+ * ma_{top,va_bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask,
+ * where ma_top_mask has zeroes shifted in while ma_va_bottom_mask has
+ * ones.
+ */
+
+/** Mask for the lower non-compressible bits of an mfn */
+unsigned long __ro_after_init pfn_pdx_bottom_mask = ~0UL;
+
+/** Mask for the lower non-compressible bits of an maddr or vaddr */
+unsigned long __ro_after_init ma_va_bottom_mask = ~0UL;
+
+/** Mask for the higher non-compressible bits of an mfn */
+unsigned long __ro_after_init pfn_top_mask = 0;
+
+/** Mask for the higher non-compressible bits of an maddr or vaddr */
+unsigned long __ro_after_init ma_top_mask = 0;
+
+/**
+ * Mask for a pdx compression bit slice.
+ *
+ *  Invariant: valid(mfn) implies (mfn & pfn_hole_mask) == 0
+ */
+unsigned long __ro_after_init pfn_hole_mask = 0;
+
+/** Number of bits of the "compressible" bit slice of an mfn */
+unsigned int __ro_after_init pfn_pdx_hole_shift = 0;
+
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    return !(paddr_to_pfn(base) & pfn_hole_mask) &&
+           !(pdx_region_mask(base, npages * PAGE_SIZE) & ~ma_va_bottom_mask);
+}
+
 bool __init pfn_pdx_compression_setup(paddr_t base)
 {
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
-- 
2.49.0



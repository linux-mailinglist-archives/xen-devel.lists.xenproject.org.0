Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15674B10880
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055725.1424085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl8-0002Aw-7s; Thu, 24 Jul 2025 11:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055725.1424085; Thu, 24 Jul 2025 11:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl8-00025R-2K; Thu, 24 Jul 2025 11:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1055725;
 Thu, 24 Jul 2025 11:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl6-0000v1-Qd
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f7c65b6-687e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:05:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so9678065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4587054c819sm15659425e9.13.2025.07.24.04.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:06 -0700 (PDT)
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
X-Inumbo-ID: 0f7c65b6-687e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355107; x=1753959907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHCexFksmnu7nsjmzWKTR3uqAjvVWoxlILSljO2WnJo=;
        b=dUGlkar0VpRKyBBAL60LKy9YWEhA/hss0hc9mZrFOc8KeB4GeH5OXJBG/67xb26dev
         x2/lsrfek4UtgQ6YOTDmK0ZF/DtSuYhhksyPtkLg9k92lFo+862r2ZNob8ryl/e40bX6
         MdpxY/LF6gCVgdvggY91eJ4vJPdPcKkxGVGbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355107; x=1753959907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHCexFksmnu7nsjmzWKTR3uqAjvVWoxlILSljO2WnJo=;
        b=M58rTpNKS+K7dq8rbK/ZHpjDibR1BZ7pGmtY6r4pluZEMx5JoGBqH8cLm1XQl/WsTh
         ttANZgthlbYW4WsTmSvchXb6KhJKz/R/HVZOMYJAEE0rpwnVLlT1AU9B/CwBmAoS7kBO
         YL1KGr1JY2KFHcRyIDdEJdTqULAuHLNlvlb2/ka46TBqaznwM6xZs41+ej4rZoQcCdYq
         f0CbXEH/p66J/VaTm7FqXXFEUGuM5uID6VqYI/8E4CZLPtqmKk+YQ+xA08C1wcI8bNXw
         +Vu82AlLZf/OwzDJDWskIFkdhKlMfpSsHe6ftjlHCXQOY+0YBCg8uXkdUd5HqDW5bfLg
         PmuQ==
X-Gm-Message-State: AOJu0YxhecWJz1gEasrwB38QYf+KRXG3kj9g1HZ6N7snaXqjDIBFz4XO
	3efdgtzyxLEkn3IX7YmOeK4sqekDi7yhx5XJTgs/ebcrZcZwNKWK8L1/hwO3oIVDNxu8J08jS6H
	b3V4O
X-Gm-Gg: ASbGncsow446amIZ/qGojT1ZfYpn3lqS9mDxnbxI2bz4OjvukltMaBX5CecA/iuz5vl
	WDYJQExyC8AYsdbuDK/fuZNZd+cElfbKD5d06C6GTg5nwqLFjZzUPTRio5HYL2XDbvIaAoF20jJ
	UTq8tmL7YiBnWBxsEzWcxr/EFvnDt0TD1QGfGsuz/+++qFt3T2rTZ6IgYTLmxoJGJux/xEqUFLg
	msiA11Qq0Ys/J2AoGcqVHBgJmK+IfqQIi7He4luuEE5J7ZvJF4AzoBJ4zpS16hUiTCDr//6deL8
	Im6w8XrfJeVXWm4728/f/lR2ZQsc6cJyMyUU7uF9W/G4XSDyi6LcydRtN7gA5WKBHRFSbctUHqC
	1TjhS64k3HC2UyJzbshWVvD+7TIj5SBTC5MNDcEf6Wb8sQfmOMhwUSn0TXrD069Uekg==
X-Google-Smtp-Source: AGHT+IFRqr8aHXYtijrzcFdXt2309MvJS+TCPZs8pXmRDNTbwDiyzjNc9u8PtEWJ+IfBR3sqef+xaA==
X-Received: by 2002:a05:600c:198d:b0:453:483b:626c with SMTP id 5b1f17b1804b1-45868d256a7mr47028655e9.23.1753355107485;
        Thu, 24 Jul 2025 04:05:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/8] pdx: move some helpers in preparation for new compression
Date: Thu, 24 Jul 2025 13:04:14 +0200
Message-ID: <20250724110416.2081-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move fill_mask(), pdx_region_mask() and pdx_init_mask() to the
!CONFIG_PDX_NONE section in preparation of them also being used by a newly
added PDX compression.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
git is not very helpful when generating the diff here, and it ends up
moving everything around the functions instead of the functions themselves.
---
 xen/common/pdx.c | 118 +++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index e58002e59db4..cfe2a3fd344b 100644
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



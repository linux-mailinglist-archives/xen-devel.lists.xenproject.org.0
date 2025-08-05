Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D7B1B17E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070229.1433928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMD-0003Y3-Fg; Tue, 05 Aug 2025 09:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070229.1433928; Tue, 05 Aug 2025 09:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMD-0003Ui-CA; Tue, 05 Aug 2025 09:53:21 +0000
Received: by outflank-mailman (input) for mailman id 1070229;
 Tue, 05 Aug 2025 09:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEMB-00026G-PR
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:19 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035cd8f9-71e2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:53:18 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so22109505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:18 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458953cfd10sm255425705e9.21.2025.08.05.02.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:16 -0700 (PDT)
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
X-Inumbo-ID: 035cd8f9-71e2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387597; x=1754992397; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIUHqA/h/ktsRl4yIry3KtJQ7f0Vu1M/mNLqlvipLX4=;
        b=YgQDBAuKlAE1S16nQXiUdFHQOZyCw4qhwW0CvaDy1vrADiULBoUWFNsRmxJbvNTd2V
         AP3VvswndmKS9NyOFNnJ56h0XB6MFRIDZSXzo/0PkoRdbRaSl2XaDX4M/j1xsPx8LuD5
         LDFBV+TVbxK7Ff2jGtwnvdcPYRkvDVZR/LSDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387597; x=1754992397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIUHqA/h/ktsRl4yIry3KtJQ7f0Vu1M/mNLqlvipLX4=;
        b=Ba7wEKT3nhP9LoxtPwlWvu4qZdVxeoSkPfCJY+smCo4Dp77FpODcYs5vVE42+/WAnU
         As5k+I8gWx9rZTdTJAeCbCy/Qm+/hPL3ribpMSIEYjuV5nHySvFTzAuItQIUYa+Wao7S
         uo9boSM+OLr6VSEQfig4MATY/yZBmiqrkhXTOY0Rp0rRsHWNtO6MvtCZhYizlJ6OGgM3
         hL6FzVXh/3MamLcq7zD1kgHGwP5c5WEcCauF0H/+hcmRJNEPOe/l/hxKc1LMzGUv+l3X
         aFT1uTO+RUL6d3hLJyI0w1rjVK0NmLnyEPaPpkr+KI7cIquLlITjOjhN2Rd/5Y71W3ox
         dLhQ==
X-Gm-Message-State: AOJu0YzFAu4s8GtqOlfbvus7zFlPyalYzVzVklHBxN/zVZBH+Wh9R8vf
	1cos8UjuLwRtx9D40uLBSpe/VqrPmV8u971SPgf4Yb84ZUhMuztBsPpejid6cQOYkvXwB6y2w29
	YiJ53
X-Gm-Gg: ASbGnctHkQeVV1kV/3ZmRCh7bNKqhBw0FNG7Z6uucxnFRAeGmjI4FbaddREQqv3/F2L
	yOJR6Y/LfvJTEMs3rZ9KI+xn8vtZXqHWG1h9W/VHo8AhH2ZPG43wa/4jQ81cgrXvFENKhM2qAFq
	ckxqSk+d4S3OB2F9YCpXLitIov6kB9t9VeY0CvPf01fAvgfcA8NclpThdLvyorIODb+Hjk5tV2k
	sMToyOpxEp3gcy5Mkw4XTY1iysGd8YT+rXeVg9qsmkRkaIZ0s8W+naZ6XCPlO/9uV2tRIXrinSD
	hYzLnjDvsUstN8mnAOUVfdlwyHEXoVJYnODwNXPiDnGNeipwflpTGLf0442GvxwexaoQ5JIrmBa
	gRNBW9cINKIwX2GvpiKz5UJhvXkSKiDrsO2P2jcxcMt6CDWjQrH6GQrEk8lq/KW938Q==
X-Google-Smtp-Source: AGHT+IE2J0BDPufSmO58HpIuQ3aPUlb0K+Jt1ytMIamwsoqTSYW+X3Pl5Ll9HKwfzZwopPVwdfj53w==
X-Received: by 2002:a05:600c:1f13:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-459e4387c2fmr5121505e9.11.1754387597275;
        Tue, 05 Aug 2025 02:53:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 6/8] pdx: move some helpers in preparation for new compression
Date: Tue,  5 Aug 2025 11:52:55 +0200
Message-ID: <20250805095257.74975-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
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
index cd8a9e75a836..9e6b36086fbd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -101,59 +101,6 @@ void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
     ranges[nr_ranges++].pages = PFN_UP(base + size) - PFN_DOWN(base);
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



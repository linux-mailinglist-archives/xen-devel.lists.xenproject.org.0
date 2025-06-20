Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C755BAE19B8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020845.1396978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZen-0005mo-3O; Fri, 20 Jun 2025 11:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020845.1396978; Fri, 20 Jun 2025 11:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZem-0005lK-Vy; Fri, 20 Jun 2025 11:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1020845;
 Fri, 20 Jun 2025 11:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZek-0005XW-Ow
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:38 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 553e7198-4dc7-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 13:11:37 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso1460179f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:37 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d0f1d1bbsm1771319f8f.41.2025.06.20.04.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:35 -0700 (PDT)
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
X-Inumbo-ID: 553e7198-4dc7-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417896; x=1751022696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXLi+ILPXh/BGa4CWHzGZodhu1oUday7zbZjpBMD9ug=;
        b=OV+N26tRC/hfZpn8XC708vr2ZDbYzVmnDz7jty9MlDnHbq5K+3PaG4bxUjM0wQbfLe
         8MlXX5YcmFOOwJdWQLPYqmVuNgw2JMWbhL+7qoOe9HLhzkBsp8yKeMVsOIooheeIfCef
         JPk5mhE0Ru6dYwHSLLLrYSdwto3d68I9UCUK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417896; x=1751022696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXLi+ILPXh/BGa4CWHzGZodhu1oUday7zbZjpBMD9ug=;
        b=i0PIdlSmoybvRb6jpjTJFUvJ26UcIpdO4NmY0UnmNiGyrg3jM80/XZ3CirjHiUd5z0
         ffWP/Kq4Q2aRIWQt3/8WVqQ2tPR5XElM8VXu10UWfc7N+1cYWt0Fdw1OVnO/ovVfADed
         0g8Cy69P+/EyV4dnuaYcfJ8lYyo6uKPzvtB4LWG/mFERPIsBI8uAVwQ1QuOSobrnHYm1
         gasEZJyY2oD4x3XgtAifRp7ZfYCapA+yWILfPO2Di8wNU+YYMMT3NoAvSm/erKmEMPNM
         cmvA9mo+c7ObpP/QftDrZasiXJxSJn+lxNm2vm3sl4NlCGIgv/MA9y3kvkjpl6eiIx77
         oczA==
X-Gm-Message-State: AOJu0Yyg5mK5T2veEiF8f1y6zrvAjFpV3PajorivqnF2kQL084ApMBcR
	iWrYbOibWQKAgaJGgRqE3oH752Q/RFFrawG7pWJC3YnpNpFFH+LRQ1lIsSADKjXSocwL2Sp+nBd
	IMmJZ
X-Gm-Gg: ASbGncsCGJJQxtEObOsQKzVTKMW7FmCd802qrQt/y4V8NFO8QRlrH27qRNlmu7UY5Lg
	XA5BDwOC+VYntSNC8AmQSgwR+yLz+/h/O02N+J766c0FBQXAUbbR3D6ex0d9iEwEqINvMhk7rZH
	XiXtr9AOi/yQz06cG2X96w4psgJSyAWlgnz81UX6j7OQMMkbLtmgDNGLYUFudCV10XdwbKRY08W
	Dfq8JJ0ga8DzqrB8mmoKSaAeJyd40aC+7NrFEEqW6caKQFf8s+/zkFBAYWhv/Sxze0hhzsweDpq
	ee+YY75+tOdgrMeMfWBLG39IJNGKS5ELj33Rp5M7bHyf+g2IctnmTEd5HxteWxaw4tsUZnONzp6
	baHi5VSMsD78O99lY6Z/hSDWkIf849L4ehjCGxMJh
X-Google-Smtp-Source: AGHT+IG/dnMiX0uON1aC6uVJjxGOv669cfHteECQ1MNzB7CXV9EWo1d+70NpW6ec5RvrconHLky93g==
X-Received: by 2002:a05:6000:2308:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a6d1325a45mr2054719f8f.52.1750417896284;
        Fri, 20 Jun 2025 04:11:36 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/8] kconfig: turn PDX compression into a choice
Date: Fri, 20 Jun 2025 13:11:24 +0200
Message-ID: <20250620111130.29057-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
and make it part of the PDX compression choice block, in preparation for
adding further PDX compression algorithms.

No functional change intended as the PDX compression defaults should still
be the same for all architectures, however the choice block cannot be
protected under EXPERT and still have a default choice being
unconditionally selected.  As a result, the new "PDX (Page inDeX)
compression" item will be unconditionally visible in Kconfig.

As part of this preparation work to introduce new PDX compressions, adjust
some of the comments on pdx.h to note they apply to a specific PDX
compression.  Also shuffle function prototypes and dummy implementations
around to make it easier to introduce a new PDX compression.  Note all
PDX compression implementations are expected to provide a
pdx_is_region_compressible() that takes the same set of arguments.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Kconfig    | 18 +++++++++++++++---
 xen/common/pdx.c      |  4 ++--
 xen/include/xen/pdx.h | 32 +++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 867710134ae5..de3e01d6320e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -52,9 +52,10 @@ config EVTCHN_FIFO
 
 	  If unsure, say Y.
 
-config PDX_COMPRESSION
-	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
-	default ARM || PPC
+choice
+	prompt "PDX (Page inDeX) compression"
+	default PDX_MASK_COMPRESSION if !X86 && !RISCV
+	default PDX_NONE
 	help
 	  PDX compression is a technique designed to reduce the memory
 	  overhead of physical memory management on platforms with sparse RAM
@@ -67,6 +68,17 @@ config PDX_COMPRESSION
 	  If your platform does not have sparse RAM banks, do not enable PDX
 	  compression.
 
+config PDX_MASK_COMPRESSION
+	bool "Mask compression"
+	help
+	  Compression relying on all RAM addresses sharing a zeroed bit region.
+
+config PDX_NONE
+	bool "None"
+	help
+	  No compression
+endchoice
+
 config ALTERNATIVE_CALL
 	bool
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index b8384e6189df..00aa7e43006d 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -34,7 +34,7 @@ bool __mfn_valid(unsigned long mfn)
 {
     bool invalid = mfn >= max_page;
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifdef CONFIG_PDX_MASK_COMPRESSION
     invalid |= mfn & pfn_hole_mask;
 #endif
 
@@ -55,7 +55,7 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifdef CONFIG_PDX_MASK_COMPRESSION
 
 /*
  * Diagram to make sense of the following variables. The masks and shifts
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index c1423d64a95b..8e373cac8b87 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -25,7 +25,7 @@
  * this by keeping a bitmap of the ranges in the frame table containing
  * invalid entries and not allocating backing memory for them.
  *
- * ## PDX compression
+ * ## PDX mask compression
  *
  * This is a technique to avoid wasting memory on machines known to have
  * split their machine address space in several big discontinuous and highly
@@ -101,22 +101,13 @@ bool __mfn_valid(unsigned long mfn);
 #define paddr_to_pdx(pa) pfn_to_pdx(paddr_to_pfn(pa))
 #define pdx_to_paddr(px) pfn_to_paddr(pdx_to_pfn(px))
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifdef CONFIG_PDX_MASK_COMPRESSION
 
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
 extern unsigned int pfn_pdx_hole_shift;
 extern unsigned long pfn_hole_mask;
 extern unsigned long pfn_top_mask, ma_top_mask;
 
-/**
- * Validate a region's compatibility with the current compression runtime
- *
- * @param base Base address of the region
- * @param npages Number of PAGE_SIZE-sized pages in the region
- * @return True iff the region can be used with the current compression
- */
-bool pdx_is_region_compressible(paddr_t base, unsigned long npages);
-
 /**
  * Calculates a mask covering "moving" bits of all addresses of a region
  *
@@ -209,7 +200,9 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
  */
 void pfn_pdx_hole_setup(unsigned long mask);
 
-#else /* !CONFIG_PDX_COMPRESSION */
+#endif /* CONFIG_PDX_MASK_COMPRESSION */
+
+#ifdef CONFIG_PDX_NONE
 
 /* Without PDX compression we can skip some computations */
 
@@ -241,7 +234,20 @@ static inline void pfn_pdx_hole_setup(unsigned long mask)
 {
 }
 
-#endif /* CONFIG_PDX_COMPRESSION */
+#else /* !CONFIG_PDX_NONE */
+
+/* Shared functions implemented by all PDX compressions. */
+
+/**
+ * Validate a region's compatibility with the current compression runtime
+ *
+ * @param base Base address of the region
+ * @param npages Number of PAGE_SIZE-sized pages in the region
+ * @return True iff the region can be used with the current compression
+ */
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages);
+
+#endif /* !CONFIG_PDX_NONE */
 #endif /* __XEN_PDX_H__ */
 
 /*
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1BB10881
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055720.1424041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl2-0001CI-Ak; Thu, 24 Jul 2025 11:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055720.1424041; Thu, 24 Jul 2025 11:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl2-00019C-84; Thu, 24 Jul 2025 11:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1055720;
 Thu, 24 Jul 2025 11:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl0-00011w-FF
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0abc0def-687e-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:05:00 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so430641f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45870564ddbsm16044165e9.22.2025.07.24.04.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:04:59 -0700 (PDT)
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
X-Inumbo-ID: 0abc0def-687e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355099; x=1753959899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/EBMqhJY7veNR7PVvbDHJJ7joaIXfPChdq3V8Id6DY=;
        b=Iox8qVnKFDA0qKJmibt0bagWYXkQRADLTbAKducYOfVl2vwMwGp69q3qXVlM8Pltez
         YuYwB11pHWpEjuQ+4FdjUGoVdGczjZb6zngh4IzkajcklA6jxzELvOq2luLeYed4/B6I
         SYpF30nJyOCCQ0rYfvFvmCVo1ZWnl/NYbeu+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355099; x=1753959899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/EBMqhJY7veNR7PVvbDHJJ7joaIXfPChdq3V8Id6DY=;
        b=RXkbANuJ37wa54WjaZ1vxbN6KQVQRh9NRytFhxWUtp0MIgAsN2nSMmBGWTRF6KWyhG
         BzkEj4Lr/gYhvIa1h97RK0yoqwePNtoU9tg7WpWJrnBCWazibEYzNPlGfveu5z4akx7a
         CGTk2RRUuVee6BvRgIR93yEI0ulaiC1vDTllvZdGyGrZzmBrGclfvdhj9naH8OCDp8Nt
         QzjIEj4R19bzxHIZUiz5m5hOoh5itoI6aDGKL1Kj0KICw1Gjy8ZYI9a+opHYie8cZ2cX
         YzITqZd1v3PhWbuJ7Udz1h/3086P4UOviTwmghLO7HPLQ7W8YofFI3qv7pFOeWNkwzsL
         3kEA==
X-Gm-Message-State: AOJu0YxkCiccTBnPB999CxdaC2nC9tkTtu6ZPou4ZtOfJaVkJnCbXmM6
	wKPNxW9MFin+YBU11oeDcAsLcMhx8D1cAdEkXJRpdVUh0FjmPZBLeM+t5fiLk475YGgi8Lzg/Ru
	L51Kg
X-Gm-Gg: ASbGnct6xA9GPX5eF/vGxEggwpVRMtyIAsZkTYDT0fQ5UMK2WA/+DGfeVQKVPuAVeEa
	6H+N2mzBCPkG+kzHFk88GXKr5McNB5rgwNKDKQ5uFVCm1sD0R/3qrHul/i7+xVKLO0iPP5JcDxu
	xmru5UmFPxp6zYtqiK/bx4BN8TuCYVTbWIiBNnCX/znMBSpci1YKT4VLMi94MrteFL6VEdqk5xx
	g0ARPzhnhcJZfDY5iYyGuFHCHVc0bAHv53S5Wr81x8sY9EjktOJSgR9Z2KOz9UHXIeCtjSh7o0w
	QDtl9CuXzLUiOCQ5y9rXlKmBF+fAVf0ROS/jxgvppWTVUF95siI9qGMvAMLIfSFzCFR9h4bQdI6
	Ha3RCdgvb9FNv2Fc+pH62C88ChsAzsBMXaffgA/ogAlo/aA/JH6U17R6MFtSlThKEUA==
X-Google-Smtp-Source: AGHT+IF3TwN8DTRJPEGrs04ybn7wBmslHBOne2TFC+XJ9jP2vO62pfR/1U4oROPXkA/boeQwWuI6Rw==
X-Received: by 2002:a05:6000:2c03:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3b768f12e09mr5423663f8f.56.1753355099371;
        Thu, 24 Jul 2025 04:04:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/8] kconfig: turn PDX compression into a choice
Date: Thu, 24 Jul 2025 13:04:09 +0200
Message-ID: <20250724110416.2081-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
and make it part of the PDX compression choice block, in preparation for
adding further PDX compression algorithms.

The PDX compression defaults should still be the same for all
architectures, however the choice block cannot be protected under EXPERT
and still have a default choice being unconditionally selected.  As a
result, the new "PDX (Page inDeX) compression" item will be unconditionally
visible in Kconfig, even on architectures like x86 that previously had no
way to enable PDX compression.

As part of this preparation work to introduce new PDX compressions, adjust
some of the comments on pdx.h to note they apply to a specific PDX
compression.  Also shuffle function prototypes and dummy implementations
around to make it easier to introduce a new PDX compression.  Note all
PDX compression implementations are expected to provide a
pdx_is_region_compressible() that takes the same set of arguments.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/setup.c  |  2 +-
 xen/common/Kconfig    | 18 +++++++++++++++---
 xen/common/pdx.c      |  4 ++--
 xen/include/xen/pdx.h | 32 +++++++++++++++++++-------------
 4 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 27bd3f5a6ea3..ab30250bbf25 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -258,7 +258,7 @@ void __init init_pdx(void)
     paddr_t bank_start, bank_size, bank_end, ram_end = 0;
     int bank;
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifndef CONFIG_PDX_NONE
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
      * let the common code further restrict the mask.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2539a635f111..0014f9b3d6d7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -57,9 +57,10 @@ config EVTCHN_FIFO
 
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
@@ -72,6 +73,17 @@ config PDX_COMPRESSION
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



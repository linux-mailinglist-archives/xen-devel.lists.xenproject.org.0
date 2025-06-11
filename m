Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FCAD5D1E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011968.1390499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA8-00038U-EI; Wed, 11 Jun 2025 17:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011968.1390499; Wed, 11 Jun 2025 17:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA8-00035e-BN; Wed, 11 Jun 2025 17:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1011968;
 Wed, 11 Jun 2025 17:22:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPA6-0002dK-BI
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b563be29-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so93305e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45325217c0bsm27303695e9.33.2025.06.11.10.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:52 -0700 (PDT)
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
X-Inumbo-ID: b563be29-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662573; x=1750267373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJdgiHOwfWzJfwlUoTb0DBDPl6XGoOntK+kYSINp4iw=;
        b=AgHhl7dYaSD2ntPPLdXWB6Ok/fNJSc72mjLNoSXXZlIDHCCZ5IKtnO1Mor+2dInnZF
         zWJaaRqVD/xqReIkKLFxAfIYnGswz52P9TZ6dt/5KwlpLsShkfJcg+EhulAh6JoB7EH5
         wXTQA5U/huNUjlAICQBL75ql0lsZUdYCrr/pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662573; x=1750267373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJdgiHOwfWzJfwlUoTb0DBDPl6XGoOntK+kYSINp4iw=;
        b=DaYrfu0SllpF3qeJIC+78Wiz2UeUodU7Jdqa1M0tT6MlKLZGS6Sn3ZTcUSS4HI3qLb
         6GfdRD+nUwjl7+7ReHZ9gNN/VyKem+u+CAoO0YmQmwEGoZfv9tompZfOftN3p9Td7rMi
         kdbmyfNF3QEbYIK6Ag9Sajwco1G/aex32ETuRjx/FWHCjFIVHajQ9QA+sisYmRqNlTeD
         2UgHu0dbweFSzrJwJC4TYa9r8+LNGKaGKV0lCk+LCVGBTdacQL/yyaGDrU27u6iUQgR4
         ANJR7nf/HXILr1hOrpqRi+J63bMso4ebz7UZRGhzhGh5wrfjxPbwd0fTKGbfZ3ucHI1V
         CKqw==
X-Gm-Message-State: AOJu0YzHD5zSTroLHL6t9OmczOIaUeBglqfQ+Nm+3NO1SgLN6AlftD2o
	LpBTLiMmeFtY12HosnJesv/erJ5/KpG1azcAp8j/XEbfzwIpyyK0r7Y/befcg6pdVF8zb7NfpCe
	VaPsL
X-Gm-Gg: ASbGncsTwVFnAiZc+727wQIffPi6J+i2YO0F7vktWb2YFtthrBkalBlSlfJceyGzbMK
	Q6Ab64kVfXuN1ijY60PlmKkUF5MZCMgyR0zOVb/CMN5mp6Un514QMw3Vc0yJ7Y2UQZabSZHssPf
	/MAoGpZfQ328nRW3al+0Q8CHzEEXeepekyhZhmlNeWWQdnRSmB8hr31pEAdCazxTKEiDLYiyOvt
	sypHI7YTd6Yj1wQWPRXi0IURn4XPKfx2s/lbd7kWTNhctdpgD/J2bg0qwISKAsmipBbM3vlRZ8c
	LsENO+C8vpq3v0ZXJnXJUcUvGc74rQ7AZxK8fXfxMLQ3yjuSxvI2N4E6s8t+Q4i2Z1CgKqFB4GV
	uuxHcRKTkQcr2wSb/rznYwVrq7SqHsEjy8ps=
X-Google-Smtp-Source: AGHT+IEUIPDE6+hbVBrOpvdAglF9TBj3iPOuBLOi+lUVI2lkYz3YeRmcVwLvDsIpM7oCwbJvfIznJQ==
X-Received: by 2002:a05:600c:4ecb:b0:453:9b3:5b67 with SMTP id 5b1f17b1804b1-4532b966b65mr5884535e9.24.1749662572848;
        Wed, 11 Jun 2025 10:22:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/8] kconfig: turn PDX compression into a choice
Date: Wed, 11 Jun 2025 19:16:31 +0200
Message-ID: <20250611171636.5674-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
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
---
 xen/common/Kconfig    | 18 +++++++++++++++---
 xen/common/pdx.c      |  4 ++--
 xen/include/xen/pdx.h | 32 +++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eece1370a3cc..7ffd9d7d9003 100644
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
index 3004c5f28bdd..4843630bee7f 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -34,7 +34,7 @@ bool __mfn_valid(unsigned long mfn)
 {
     bool invalid = mfn >= max_page;
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifdef CONFIG_PDX_MASK_COMPRESSION
     invalid |= mfn & pfn_hole_mask;
 #endif
 
@@ -80,7 +80,7 @@ unsigned long get_max_pfn(unsigned long top_pfn)
     return pdx_to_pfn(pdx - 1) + 1;
 }
 
-#ifdef CONFIG_PDX_COMPRESSION
+#ifdef CONFIG_PDX_MASK_COMPRESSION
 
 /*
  * Diagram to make sense of the following variables. The masks and shifts
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 0f580853cb2e..ec0827936c2f 100644
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
@@ -108,22 +108,13 @@ unsigned long get_max_pfn(unsigned long top_pfn);
 
 #define paddr_to_pdx(pa) pfn_to_pdx(paddr_to_pfn(pa))
 
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
@@ -216,7 +207,9 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
  */
 void pfn_pdx_hole_setup(unsigned long mask);
 
-#else /* !CONFIG_PDX_COMPRESSION */
+#endif /* CONFIG_PDX_MASK_COMPRESSION */
+
+#ifdef CONFIG_PDX_NONE
 
 /* Without PDX compression we can skip some computations */
 
@@ -248,7 +241,20 @@ static inline void pfn_pdx_hole_setup(unsigned long mask)
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



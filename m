Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B10B1B179
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070224.1433878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM7-0002FS-He; Tue, 05 Aug 2025 09:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070224.1433878; Tue, 05 Aug 2025 09:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM7-0002Dj-Eb; Tue, 05 Aug 2025 09:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1070224;
 Tue, 05 Aug 2025 09:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM5-00026G-NW
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:13 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff884533-71e1-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:53:11 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so3680053f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4a2848sm18386766f8f.71.2025.08.05.02.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:10 -0700 (PDT)
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
X-Inumbo-ID: ff884533-71e1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387591; x=1754992391; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlJ4EVtQhQPCSTEsURZWjPcV24GHkW+OWqt8tBVq6Ws=;
        b=Bqb0zdIl5Ehg6S4t4fbcZePweha19gznJngnQBceOvschwUHsqRaHKur5R+hsJYkFc
         SVfUK/NILHjcZfDbGu/mS35UforuNBcGGiphku7UZPdA0vNxx+vyDfALeqwdyFkcuzOP
         WX5YONmJuPBuA4K7ZKJpSt7XM5D0UJDfcNWB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387591; x=1754992391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlJ4EVtQhQPCSTEsURZWjPcV24GHkW+OWqt8tBVq6Ws=;
        b=MjDfJ0Mnykz83zQhrrob+juCkCf07zEf4sJibNtEHco41uMLvePFvo2boQ9jBiTk43
         cTOt96d40Eca0sNXawul4Op6yUgGorOgA2fEl2gX1pBtSVK2gW/7jDY6s3EQpxcZCbcA
         r6tvnj9s01ywkftVFgmOJNY5ngWzqw/MqCgMQDSqfSVm1P6FPnWDKFq1aGqIDuzRCqDO
         dfRq+jDVtOGM0S9/mL9vyOhR2tTpMzxaLXeLO3o1N0uiK74lUpCWQpKbOMGWOe52BMug
         20MTPQeHBK1Xa/rTHZdVF5wXgeByhd89LsdgHuvyMIYbc1Ql19NkkCZgSEkMElmVXu17
         IKng==
X-Gm-Message-State: AOJu0Yzo+mxDvc1YaFbXwPKSgjz/nbtG6Zc5YqNqr5DZKJ9zE/mM3QKP
	pvQhXs7B13Rq35dp4MmDWj4iuIoDOQIQFrKBi3NomokOatZjxLrOm+4/2RjoI5p7ia5bXESYBuc
	vYBkj
X-Gm-Gg: ASbGnct+uaUa2jTRRQLmco4RKtM1sX80+ZUlfKjv5g53Ob3zKOkDbeHHSpSOvYSFchY
	Wwyrj5dEaFqfra0ArO8+vrtfmoRalBP72pmGTcEc77Yt+mjpYTGG/ZHdqBjibjNkF+vkBOha8GP
	2j8G0Ic+zaoTkQzkHsux5dptJq1aXQmNBYBQwVn1KlLUwmkXSm+DBeZhONu1iaKUlniAocaepol
	tsQWiTdoP4JHnjqXfpC2+w5K4CHn3k3zn3RhYHkGlv+pM0GQAcYUAIlpZX3ZpWU0+YuHq/gOR1F
	Q5M3wwGvsG6nAkKE8rjzKNCL7n2JUwFC+jVijDkW/LgzVlQaDsaD62naunooALvGlxneudOvkgs
	eV6VxjpWhZL8HKtp6PK2b/EplT2Q2riJd3DK1Wn8f0p6/HAqPyEn4aK68wZjt1NtfrLwXyBcJcM
	/E
X-Google-Smtp-Source: AGHT+IFwRXAghNgrt0pR2SwJ3D/h7HW/dZTVNoThRWg/S/KXqaZhSjs7CWT+IBx1cibnmwzVpiCsHg==
X-Received: by 2002:a05:6000:220b:b0:3b7:792c:e8be with SMTP id ffacd0b85a97d-3b8d946c468mr8387219f8f.8.1754387590874;
        Tue, 05 Aug 2025 02:53:10 -0700 (PDT)
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
Subject: [PATCH v4 1/8] kconfig: turn PDX compression into a choice
Date: Tue,  5 Aug 2025 11:52:50 +0200
Message-ID: <20250805095257.74975-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
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
index bb35afe56cec..a77b31071ed8 100644
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
index 16936418a6e6..8dad0c923a9d 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3F7568A6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564734.882435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh8-0003TO-Q8; Mon, 17 Jul 2023 16:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564734.882435; Mon, 17 Jul 2023 16:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh8-0003Lw-8n; Mon, 17 Jul 2023 16:03:30 +0000
Received: by outflank-mailman (input) for mailman id 564734;
 Mon, 17 Jul 2023 16:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh6-00027B-4o
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 773057de-24bb-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:03:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so6903860e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:27 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:26 -0700 (PDT)
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
X-Inumbo-ID: 773057de-24bb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609806; x=1692201806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QGfkDVjG71aom9bAterc/1wKh4jZEIowYjFqXVaWh0=;
        b=J9UFqD4U6/+xFXgvL/eHS1K3ZsRFfObmThVd0Sx3haPrf1u/4zdURKFRc5ZJ9k+yI3
         YbgVQ52ZFPB0UzsfMDnMrO+RojCfSZFbkTfIoBA6QTHyKQ/aSMngs1hVScSzvRMxXnub
         bDv923akwd+wLhxzq2A0UDY7tLIKqbIPS/vwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609806; x=1692201806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QGfkDVjG71aom9bAterc/1wKh4jZEIowYjFqXVaWh0=;
        b=W/FJiTum4ljF8alLQao5viIJ3dKu/DiVSdbzT4MxVsd1aJU3yBrM0ZRdBhiWlnci+1
         sTs8f+qa5HqbHXqdfKyyK+y5qHOSVhSNFq3S6GwhXjojSczi8hEkoSrD5hyRGn+SjGRr
         cBeH/X97cKiwPcLEhJ+6H7NE29WCQPPIq3Rsi4nWVjB2nUmc7krF4C/4mob4mGE0FKSu
         yRf9eIbrWzb4tSJhMGoNbPCel4UcYJd0FaKvOm9TlJNlKVaDKG3yvjQYWSiqokr8cTxP
         oKaZ2BmaxB9lfxEYOjm2QxzkUCsqRPS5hmKZ46zhf6IPsd7L0sKDNkvE3mgu/LdQIpGV
         Fi4g==
X-Gm-Message-State: ABy/qLa/BcmUYZ79Jc37Pq8Y+Grj3lLs7uvaX8rAzV+u0VLXsGvPD3HU
	wEvaNJJY4tZOWNlFi0aBapl3agKj29xUcZPKypw=
X-Google-Smtp-Source: APBJJlF5hBqYxBEdbU/CdUkMNf+ZWkqlphrHQ0PjL8lO0H04R4PCEvyaCbBP88krTvazp26SQzFivA==
X-Received: by 2002:a05:6512:2822:b0:4fc:dcff:773b with SMTP id cf34-20020a056512282200b004fcdcff773bmr12474057lfb.3.1689609806597;
        Mon, 17 Jul 2023 09:03:26 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 8/8] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a Kconfig option
Date: Mon, 17 Jul 2023 17:03:18 +0100
Message-Id: <20230717160318.2113-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new compile-time flag to allow disabling pdx compression and
compiles out compression-related code/data. It also shorts the pdx<->pfn
conversion macros and creates stubs for masking fucntions.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/domain.c | 19 +++++++++++++------
 xen/common/Kconfig    | 10 ++++++++++
 xen/common/pdx.c      | 15 +++++++++++----
 xen/include/xen/pdx.h | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 39c2153165..c818ccc4d5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -458,7 +458,7 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-#ifndef CONFIG_BIGMEM
+#if !defined(CONFIG_BIGMEM) && defined(CONFIG_HAS_PDX_COMPRESSION)
 /*
  * The hole may be at or above the 44-bit boundary, so we need to determine
  * the total bit count until reaching 32 significant (not squashed out) bits
@@ -485,13 +485,20 @@ static unsigned int __init noinline _domain_struct_bits(void)
 struct domain *alloc_domain_struct(void)
 {
     struct domain *d;
-#ifdef CONFIG_BIGMEM
-    const unsigned int bits = 0;
-#else
+
     /*
-     * We pack the PDX of the domain structure into a 32-bit field within
-     * the page_info structure. Hence the MEMF_bits() restriction.
+     * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
+     * a 32-bit field within the page_info structure. Hence the MEMF_bits()
+     * restriction. With PDX compression in place the number of bits must
+     * be calculated at runtime, but it's fixed otherwise.
+     *
+     * On systems with CONFIG_BIGMEM there's no packing, and so there's no
+     * such restriction.
      */
+#if defined(CONFIG_BIGMEM) || !defined(CONFIG_HAS_PDX_COMPRESSION)
+    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
+                                                          32 + PAGE_SHIFT;
+#else
     static unsigned int __read_mostly bits;
 
     if ( unlikely(!bits) )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 40ec63c4b2..6605a60ff7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,16 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config HAS_PDX_COMPRESSION
+	bool "PDX (Page inDeX) compression support"
+	default ARM
+	help
+	  PDX compression is a technique that allows the hypervisor to
+	  represent physical addresses in a very space-efficient manner.
+	  This is very helpful reducing memory wastage in systems with
+	  memory banks with base addresses far from each other, but carrier
+	  a performance cost.
+
 config ALTERNATIVE_CALL
 	bool
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index cc963a3cb3..d0fac9d7c7 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -31,11 +31,15 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
 
 bool __mfn_valid(unsigned long mfn)
 {
-    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
+    bool invalid = mfn >= max_page;
+#ifdef CONFIG_HAS_PDX_COMPRESSION
+    invalid |= mfn & pfn_hole_mask;
+#endif
+
+    if ( unlikely(evaluate_nospec(invalid)) )
         return false;
-    return likely(!(mfn & pfn_hole_mask)) &&
-           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
-                           pdx_group_valid));
+
+    return test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
 }
 
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
@@ -49,6 +53,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#ifdef CONFIG_HAS_PDX_COMPRESSION
+
 /*
  * Diagram to make sense of the following variables. The masks and shifts
  * are done on mfn values in order to convert to/from pdx:
@@ -178,6 +184,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
 }
+#endif /* CONFIG_HAS_PDX_COMPRESSION */
 
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index ce27177b56..5531890d1c 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -98,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
+#ifdef CONFIG_HAS_PDX_COMPRESSION
+
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
 extern unsigned int pfn_pdx_hole_shift;
 extern unsigned long pfn_hole_mask;
@@ -225,7 +227,39 @@ static inline uint64_t directmapoff_to_maddr(unsigned long offset)
  *             position marks a potentially compressible bit.
  */
 void pfn_pdx_hole_setup(unsigned long mask);
+#else /* CONFIG_HAS_PDX_COMPRESSION */
+
+/* Without PDX compression we can skip some computations */
+
+/* pdx<->pfn == identity */
+#define pdx_to_pfn(x) (x)
+#define pfn_to_pdx(x) (x)
+
+/* directmap is indexed by by maddr */
+#define maddr_to_directmapoff(x) (x)
+#define directmapoff_to_maddr(x) (x)
+
+static inline bool pdx_is_region_compressible(unsigned long smfn,
+                                              unsigned long emfn)
+{
+    return true;
+}
+
+static inline uint64_t pdx_init_mask(uint64_t base_addr)
+{
+    return 0;
+}
+
+static inline uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+{
+    return 0;
+}
+
+static inline void pfn_pdx_hole_setup(unsigned long mask)
+{
+}
 
+#endif /* CONFIG_HAS_PDX_COMPRESSION */
 #endif /* __XEN_PDX_H__ */
 
 /*
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDACAD5D1F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011967.1390489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA7-0002sx-7p; Wed, 11 Jun 2025 17:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011967.1390489; Wed, 11 Jun 2025 17:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA7-0002rM-3e; Wed, 11 Jun 2025 17:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1011967;
 Wed, 11 Jun 2025 17:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPA5-0002dK-B6
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b492516c-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:52 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso133852f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:52 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5323ab207sm15780062f8f.29.2025.06.11.10.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:51 -0700 (PDT)
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
X-Inumbo-ID: b492516c-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662572; x=1750267372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKrBP871dG4zllrLFjmVYwBp6+ujdNqW4+VWtq3YZgI=;
        b=fMa6ppnhQyo4G8LOz+vHWa1GJ2uhGPXOJYXUr8QXzrPdnbDsIXn/bK30BA0a4B+UUx
         sV8cPKYlvGz8X8FtHXmoZV2qiL/6TP8QPIdIHBeGM37kuRec3/qX8wJ120RT8/3uWQQd
         pGFz8t/nJ33FptRb+aAoPxIcK2AvJX1oVka6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662572; x=1750267372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKrBP871dG4zllrLFjmVYwBp6+ujdNqW4+VWtq3YZgI=;
        b=oDOPzLVMeV0iKqqwtXTCcZM6dF1FSG3uCafPh157lWGQwbTwXZxf5jGEBuQSlDhLe2
         snVjxWVrurprPb3QGCtzKAjpbJdC5etqN0keJDnWG4LwFhIOag7H5NEIphSwCfejd79Y
         p3vCHyk47w+3GmQ8ZQwtQnTQykDjBzisXEZIle8yPkyn2HcbS1Bno3ySqpmYwOuhqQDR
         lwkEXwJnkwT8k66/OBak1DBhyXuFYOwQxip1Qwp+bWS1BwJHtP0UaaTfjCzF12Vm38Rc
         64pzsH3QZH20zr3U2brbh1vCwhLtuBfn/D771PjIHUQ+z4PWEj+p/cFZRyiA1rY8UVG6
         m3IQ==
X-Gm-Message-State: AOJu0YxNjHnd1UO+ugPJkLz0X788hX42bRrsns00CPepCE7LfCfUWP8u
	KaAAn3D9d8joFR4866QK1urzO3yESwFeVlb6oDmF63llmTqGxgbxtDlXtUwgccP+cie8ZaVSeCK
	dvaLf
X-Gm-Gg: ASbGncvUphL4Furxti2C91MqL5iXR7H5vEb0mZDPNIzFiUhsvLU2CHzMXs4YQxcCqFO
	4FCeXkToXFnoDOJg1JGJRbnRSuj6iRwpZNaUejULFYx+fc1QMJvBZ95uxeksc3O6VaIdYLIijhv
	xxmxD8bpvlr9RmADj8AIliKkkco21pZR9buDAqudpMZdtEzdLlmmE0hPvrMiqMggD/nnVZ9Tida
	tGsyqOEO2yczuskBghI6xjQbSeG45Na0CKTFU20ieSXt5fS9N9XeT0CtLhVQjXkKPeE1RBB2JPb
	N3E8i7HtvJacmc+dqk46UrAmXwSAsoJ5SXBWrxobB8fXisVuA1rEbS9phpszSh0EorLj7iAke+4
	qi5pg1VQgx8EM8or8l60I7hkPiDSUU20qwOw=
X-Google-Smtp-Source: AGHT+IGLtHZs7bMty9epxiuNgjn1rUQmc2r9GZEr5iiKTtkm11d+FqFZAUn80jbqllZXkua5g4YQlw==
X-Received: by 2002:a05:6000:310a:b0:3a4:d53d:be20 with SMTP id ffacd0b85a97d-3a558695d45mr3025445f8f.18.1749662571651;
        Wed, 11 Jun 2025 10:22:51 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/8] pdx: introduce function to calculate max PFN based on PDX compression
Date: Wed, 11 Jun 2025 19:16:30 +0200
Message-ID: <20250611171636.5674-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the code already present and used by x86 in setup_max_pdx(), which
takes into account the current PDX compression, plus the limitation of the
virtual memory layout to return the maximum usable PFN in the system,
possibly truncating the input PFN provided by the caller.

This helper will be used by upcoming PDX related changes that introduce a
new compression algorithm.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c  | 19 ++-----------------
 xen/common/pdx.c      | 25 +++++++++++++++++++++++++
 xen/include/xen/pdx.h |  8 ++++++++
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0ee..ea670567cbf7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -721,23 +721,8 @@ static uint64_t __init consider_modules(
 
 static void __init setup_max_pdx(unsigned long top_page)
 {
-    max_pdx = pfn_to_pdx(top_page - 1) + 1;
-
-    if ( max_pdx > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
-        max_pdx = DIRECTMAP_SIZE >> PAGE_SHIFT;
-
-    if ( max_pdx > FRAMETABLE_NR )
-        max_pdx = FRAMETABLE_NR;
-
-    if ( max_pdx > MPT_VIRT_SIZE / sizeof(unsigned long) )
-        max_pdx = MPT_VIRT_SIZE / sizeof(unsigned long);
-
-#ifdef PAGE_LIST_NULL
-    if ( max_pdx >= PAGE_LIST_NULL )
-        max_pdx = PAGE_LIST_NULL - 1;
-#endif
-
-    max_page = pdx_to_pfn(max_pdx - 1) + 1;
+    max_page = get_max_pfn(top_page);
+    max_pdx = pfn_to_pdx(max_page - 1) + 1;
 }
 
 /* A temporary copy of the e820 map that we can mess with during bootstrap. */
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index b8384e6189df..3004c5f28bdd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -55,6 +55,31 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+unsigned long get_max_pfn(unsigned long top_pfn)
+{
+    unsigned long pdx = pfn_to_pdx(top_pfn - 1) + 1;
+
+#ifdef DIRECTMAP_SIZE
+    if ( pdx > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
+        pdx = DIRECTMAP_SIZE >> PAGE_SHIFT;
+#endif
+
+    if ( pdx > FRAMETABLE_NR )
+        pdx = FRAMETABLE_NR;
+
+#ifdef MPT_VIRT_SIZE
+    if ( pdx > MPT_VIRT_SIZE / sizeof(unsigned long) )
+        pdx = MPT_VIRT_SIZE / sizeof(unsigned long);
+#endif
+
+#ifdef PAGE_LIST_NULL
+    if ( pdx >= PAGE_LIST_NULL )
+        pdx = PAGE_LIST_NULL - 1;
+#endif
+
+    return pdx_to_pfn(pdx - 1) + 1;
+}
+
 #ifdef CONFIG_PDX_COMPRESSION
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 9faeea3ac9f2..0f580853cb2e 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -92,6 +92,14 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
  */
 bool __mfn_valid(unsigned long mfn);
 
+/**
+ * Get maximum usable PFN given the virtual address space restrictions.
+ *
+ * @param pdx Maximum PFN
+ * @return Possibly truncated maximum PFN
+ */
+unsigned long get_max_pfn(unsigned long top_pfn);
+
 #define page_to_pdx(pg)  ((pg) - frame_table)
 #define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
 
-- 
2.49.0



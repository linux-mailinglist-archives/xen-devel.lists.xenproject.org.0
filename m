Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EAB82198
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125717.1467630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0IL-0008Fd-Fd; Wed, 17 Sep 2025 22:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125717.1467630; Wed, 17 Sep 2025 22:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0IL-0008DP-Aj; Wed, 17 Sep 2025 22:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1125717;
 Wed, 17 Sep 2025 22:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08O-0007Lt-3V
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:16 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f6bafdc-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:12 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-77459bc5d18so278201b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:12 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:09 -0700 (PDT)
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
X-Inumbo-ID: 1f6bafdc-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146170; x=1758750970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEFrn7bFgdED7Mm9Ht8bmIsh0tehbilcDJysf+G4Gcc=;
        b=acPjci2PtpUhZzp5TrdlUKLL/D4sdhh3cBhs51FLPu5HcXLNifcySKAoJxwShxXFEb
         atFKrkY7Y+5UMPq5BsCbZdR2L8L55cteKYHo/D7OCl6P+34qDJvXVmpf5L40KvNd83eC
         hnXp9NIdEg5KYy1lS7TfQbRTwD1Cae9HH35QwzZr6oZbGwCBQgw1a1rSSe2c1vTo8oM2
         yLKQ7JOmLgFBvFk0mnf0Hc9iZjF9JHou6zPoEiGxP2+9PqfJLcrJHpiu71jP3yl/It+M
         xlZPw45b1x0cRwFy1HB3qJwLF+fdrcoHvEC2AqHqN73ReiJjgQC66dnB+AE/T7DL9AyY
         ZRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146170; x=1758750970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEFrn7bFgdED7Mm9Ht8bmIsh0tehbilcDJysf+G4Gcc=;
        b=f+ZJFR062U+UnJWRK2kYYxorqQlzcVfgh9WeL7DIPOKVI748mqLDVrvouuy1OWfVeu
         rAvLPpGP2eYxP0xX6HnQ+6oFDyLCg/HFiHHqB9DqevsLL5vxx/eVuRRAPuRlUQ33WwoG
         iGFqgOL8q+5fzPTdeH4EOeDwWi2wepZovFZ+Rs9RhgARQWyL2ucCyTgGfIXGLJewqnIj
         pBsmrXVBw+KKWJknqLkyCOwD8+31mr65mzi65/SHSk5zAmkcFvyYvPX5hrJG3h35ywWN
         j+kNUh6kn+qZMOTvnxXDp1grQJDyTlApQT6Qq3H4XVYT1hHCCFQhrjlurHvJkQTqZQ7Q
         DrLA==
X-Gm-Message-State: AOJu0YxvggrBtvUy3jK34+fv3nAFL2Qr0R3UaHm/vgWz8bbwKfO58p/p
	3QiKEM3lG7mlQ1vGJy3oJNHdu8MRUXAQLV6OVhpYeR03D+ldv0hUTucmzRlY/lbdXEs=
X-Gm-Gg: ASbGncvHXl8WNuELNoh4hUndJOCLaOmDJFstCh+K6/Dv4zTg1U7hV0b2XS9kV+VDIN5
	R/0GCT8iwlWA77FC8XTpoCRJw6qZnVwp0ySmZbi2veEJbjXt0kyiMdxKh0Gdyr94ZaJDOztsONn
	S3pIwl1DOpxDfsvp09IjuJYer9x59aPh9aAgJQ3QQsGjqbHBaeo1VJ98A/L0YP5FaILlKe1cUOr
	csOaSp59xgpwvtb8gx6dc2YpGJ8VkhkF9m0MG65/OXySzL84zZly+hisnhSyv+TYUdJcoisHJeV
	Nrv6jChkyEMBEtk5YZPBZ7ZR8i1bvWgIkclfx8ugGobe4t++R2gNTYvHRzs1epXVvkJJn6ltGTN
	2rWMEHJW/Nh9/46D+7PAs/OLT82sdHVG4uyF/4+D6OkuC
X-Google-Smtp-Source: AGHT+IEbE3jPdU8aTaDpG86S16LJMiVg4P6HEEc/DtrtGKmCbgcGMHL+lTNATodfNGmthDA3n2gheg==
X-Received: by 2002:a17:902:d4d2:b0:261:e1c0:1c44 with SMTP id d9443c01a7336-26813bf5032mr46134825ad.40.1758146170137;
        Wed, 17 Sep 2025 14:56:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 15/18] xen/riscv: implement put_page()
Date: Wed, 17 Sep 2025 23:55:35 +0200
Message-ID: <269250b2b3c62f34446d9e7b9f72dbf2d4eca2e5.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement put_page(), as it will be used by  p2m_put_*-related code.

Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
a stub for PGC_static is added to avoid cluttering the code of
put_page() with #ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Update the comment message:
   s/p2m_put_code/p2m_put_*-related code.
   s/put_page_nr/put_page.
---
 xen/arch/riscv/include/asm/mm.h |  7 +++++++
 xen/arch/riscv/mm.c             | 25 ++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index dd8cdc9782..0503c92e6c 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -264,6 +264,13 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+#ifdef CONFIG_STATIC_MEMORY
+/* Page is static memory */
+#define _PGC_static       PG_shift(3)
+#define PGC_static        PG_mask(1, 3)
+#else
+#define PGC_static     0
+#endif
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
 #define PGC_broken        PG_mask(1, 7)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 1ef015f179..3cac16f1b7 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -362,11 +362,6 @@ unsigned long __init calc_phys_offset(void)
     return phys_offset;
 }
 
-void put_page(struct page_info *page)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_dump_shared_mem_info(void)
 {
     BUG_ON("unimplemented");
@@ -627,3 +622,23 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     if ( sync_icache )
         invalidate_icache();
 }
+
+void put_page(struct page_info *page)
+{
+    unsigned long nx, x, y = page->count_info;
+
+    do {
+        ASSERT((y & PGC_count_mask) >= 1);
+        x  = y;
+        nx = x - 1;
+    }
+    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
+
+    if ( unlikely((nx & PGC_count_mask) == 0) )
+    {
+        if ( unlikely(nx & PGC_static) )
+            free_domstatic_page(page);
+        else
+            free_domheap_page(page);
+    }
+}
-- 
2.51.0



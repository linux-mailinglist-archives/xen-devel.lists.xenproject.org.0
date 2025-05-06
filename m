Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F31AACB88
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977620.1364607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWV-0005uC-6p; Tue, 06 May 2025 16:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977620.1364607; Tue, 06 May 2025 16:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWU-0005rx-Vu; Tue, 06 May 2025 16:52:02 +0000
Received: by outflank-mailman (input) for mailman id 977620;
 Tue, 06 May 2025 16:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWT-00058E-CI
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dfe6228-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:00 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5fbe7a65609so301735a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:00 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:51:59 -0700 (PDT)
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
X-Inumbo-ID: 6dfe6228-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550320; x=1747155120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XrJBratYgoxj6lThS/fo/lEJSNWP1w2x9WPIUnkGfE=;
        b=JerN49cI3up5gd8Gs+smgug1o+TLdBXTv9Tu93hp+g3TZdtHJmS4o+gJZcWmbZA/M5
         WHy0maAv8kPJqWkJNzxbHndUnyK8xFwxdZrEOJAzFdAqkBnOodfPdmR7+ZGP+Nwal3RV
         CiOjjI7d8arjm6o2Nj21XjkMFZctdt0wz0HOZ0zIJB/jKPflzE9FkYYF7sr1Z1EdHToy
         P0R5GXofY4ZFqwY1jIUPF8w6QOFqVxwphsEYgnI4E9VN1KjWlFZKpHPnTwcOuY3onKuU
         NGTGbVSV+PkXH+MRgmOi08t6HIalJxG4wIZSKvX5iReeR+pASc6tNazmlexw6UiYvL8A
         VAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550320; x=1747155120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XrJBratYgoxj6lThS/fo/lEJSNWP1w2x9WPIUnkGfE=;
        b=jO+r/U0+Bzx0bauXDL38v+yo0DlR3XL3ElCQF3bAbEV2ZY9D7MmT1+P9LI3O7R6pmQ
         r3J6sDS/jkYjWKUTVv8kX1c6YwN/VibCBS4UAAqRux9v9/IzA1rPlEgnDG78uzVLbXmd
         tWY5zPxQNzuR+4HCHIbtlwacp/I+le6dupakwhpGHGwcBP+HZQbdmZp8duvR3AXW93pD
         XNpWqYa69qTprVY87fe+v8WZJK45pDlXWBV5qiW4xj7C6nIofECI3407vzcQTg+kZNca
         Liv9L3XGBiAesKucEoePqYfsVkrNXrGvzPRC9zCo9fL+b7TCSnRUDzyG4j/iooRkBkNE
         BacQ==
X-Gm-Message-State: AOJu0YzEQLJvypl4tPci9rjLCmJbDEH+lpZ2Ranlv4MKUzRBe8D7jyrA
	Mi5Eg9HAd3EdAYSRJpOXFkzSzLNUa6JetJ4CjRMGCNAKKJKTY19WjXYT4w==
X-Gm-Gg: ASbGncuvzm0TuYpUaSWqAk95UBOaqtVqwo0vRqmsWtTKnWIrOn4M7ThlqZk34LtKy7+
	SYGWOL1wlM5S6C1Iis5qpK2T4GtH0jpN2ZoyzBDQKCQiAL7LjbnJen6E5RBmoGWHvGLa0zTEJMq
	muq8t6ltgSDQVYEnaIS1iO0MdFGBTeij3a6U9lL41xnFoUTo2j16gV7247puQyCTZV5Mxfjt29n
	7CY0+5AlvBP0cA2od9f83Xr6Ilc35dXX8fQ641QsJNJpO7S1hsXGV8IgySYNKJbld8ivE8zjr0p
	iQbl1SehSP7QoagW9JZeLcog/PT8+gcE58otGx3AEcjrnnWy9MY66vgqjJldwauaIfGEciXWE8X
	Aem8jNpf/RCM8IcF7u0ZQ
X-Google-Smtp-Source: AGHT+IH4sO7YTzYDds+FCB6yWIy+bjWe6wiDQQtSWiaLC3WqXPJ/SXlBYJBWVO6nGknQ6pzedWcEWA==
X-Received: by 2002:a17:907:6b8e:b0:ac7:3323:cfd8 with SMTP id a640c23a62f3a-ad1e8bcf04dmr23506866b.16.1746550320008;
        Tue, 06 May 2025 09:52:00 -0700 (PDT)
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
Subject: [PATCH v2 04/16] xen/riscv: add ioremap_*() variants using ioremap_attr()
Date: Tue,  6 May 2025 18:51:34 +0200
Message-ID: <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce ioremap_attr() as a shared helper to implement architecture-specific
ioremap variants:
- ioremap_nocache()
- ioremap_cache()
- ioremap_wc()

These functions use __vmap() internally and apply appropriate memory attributes
for RISC-V.

These functions are implemned not as static inline function or macros as it will
require to include asm/page.h into asm/io.h what will lead to compilation
issue.

Also, remove the unused ioremap_wt() macro from asm/io.h, as write-through
mappings are not expected to be used on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the commit subject + message.  
 - move out Svpbmt changes to separate patch.
 - Drop #ifdef SVPBMT for ioremap().
 - Redefine ioremap_* in io.h.
 - Introduce ioremap_attr().
---
 xen/arch/riscv/include/asm/io.h | 11 +++--------
 xen/arch/riscv/mm.c             | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 8bab4ffa03..921e334ce1 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -41,14 +41,9 @@
 #include <xen/macros.h>
 #include <xen/types.h>
 
-/*
- * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
- * change the properties of memory regions.  This should be fixed by the
- * upcoming platform spec.
- */
-#define ioremap_nocache(addr, size) ioremap(addr, size)
-#define ioremap_wc(addr, size) ioremap(addr, size)
-#define ioremap_wt(addr, size) ioremap(addr, size)
+void __iomem *ioremap_nocache(paddr_t start, size_t len);
+void __iomem *ioremap_cache(paddr_t start, size_t len);
+void __iomem *ioremap_wc(paddr_t start, size_t len);
 
 /* Generic IO read/write.  These perform native-endian accesses. */
 static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index d3ece9f132..c8526dd2ef 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -11,6 +11,7 @@
 #include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
+#include <xen/vmap.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
@@ -583,3 +584,36 @@ void *__init arch_vmap_virt_end(void)
 {
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
+
+static void *ioremap_attr(paddr_t start, size_t len, pte_attr_t attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(start));
+    unsigned int offs = start & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+void __iomem *ioremap_nocache(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
+}
+
+void __iomem *ioremap_cache(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR);
+}
+
+void __iomem *ioremap_wc(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
+}
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
-- 
2.49.0



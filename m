Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43CABFA9F
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992140.1375949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvJ-0005Hg-QG; Wed, 21 May 2025 16:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992140.1375949; Wed, 21 May 2025 16:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvJ-0005D0-Lw; Wed, 21 May 2025 16:04:05 +0000
Received: by outflank-mailman (input) for mailman id 992140;
 Wed, 21 May 2025 16:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvH-0004XB-On
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:03 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e88ac4-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:03 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-601d66f8cafso5698071a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:03 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:01 -0700 (PDT)
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
X-Inumbo-ID: 36e88ac4-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843442; x=1748448242; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTDxJdlWqyBuUYAssfRiBPJ9qN2ELiVYcf2RQUhFW1U=;
        b=cjcrTPPoqTY+uKyaNYt9GvbRuj4cwz0GKWt0P9Fzdjgo2N5ZNbWF2mcdfCdq8WbxbP
         YxnfjKSdFS8HeW1PRX5gqGHNHGPgVfPcHGA2v7pU7tvF/3HQ2rQgLIGUdf0l2/ySUcy3
         kN43AkjuiwsNmPXMSzLnPGEitJIf1WED8k0oAdcwgiqX9RI5FJ7SvqZOf0ZaRzBFGipZ
         u2r3MSiZ+FGfoyHaG0FlXFyVUQyAN8mfl0D4f9EaOzcx10ko0NED3hgRbKYMWRWtMWMu
         JptW6lgXxD77khgnQ6jq/XjlPOHJj0Oq6rAFr34FfaYRl/qKB9+bSLSbOE8xUFLNv87Y
         Lx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843442; x=1748448242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTDxJdlWqyBuUYAssfRiBPJ9qN2ELiVYcf2RQUhFW1U=;
        b=MhVAktMsTYAWJD48VdCDuh7h6KnBkupMEWMl1OLUliq4R2hOJC2NajIbSxLuHG78yj
         5ZfZtv/c7WT8axmyhoPxZ3MaMBeQdZODphC1ydP+awtNg7GweDrFwfpKYSuhPuMBIWTF
         cIGpUVTitlmAv2+nqoqorVHqohdL97D9leOX+Re09j8VAS79TnwOEio1PpP7ioKuR+L8
         CzmDaxDHcplkNXCgsUZU1avW+RLqSW6Uf2thnfyhspFXr+cRVSPvjGWCD+2nRGVH3zAk
         rLlriJAO72ywOqyTyfUgOR4ep2CpvP8j260wKLb3HunZZsoMEgwLoi+tj3NeBZ4V2kJp
         QwVg==
X-Gm-Message-State: AOJu0YxSlZIAuBUALfi5kS+TWpSufOENR9+uFH+pyeMYhAAq+LVffBiz
	0WA7AURUrh01vlW+15Vv7NjiVDFciG/LCqKMI9gTVlwAAyRnja8BfMcNS/rIzA==
X-Gm-Gg: ASbGncvGKKXbq7SGWaWqzAC/zqGkgPGlPI+Ar4fjzdcw1FHlbp8fqHg9NCo3Pb2wCoX
	cTcNxPoZOmq+zrM5YflX8J7Ifr5sWhgGdw8DNXIzWT+pfN2qF1ECUppmNZKJUVV2CnXheouHZun
	5uLRvwP2n5uIYoF1an4HO5z/1uWXfc1d6ixKik+X7Au8v9jfexVyOTX3tlJUcLQK1f7DY1guMX0
	H1DRAjQiU42JiYAHnKH6900og6p4lQCb4Bpi5fT/vD0krpGhruLPauIFQ2GLz8rLUL6mNBqysyI
	Ln2o05QEM0FMjs5+ouiRIF5xpwai6N31Inha0KTcH0oXiwzK8JEAXy8EzfWvCX0lI76vCtdDfDn
	stiaW4njR0jrKFpGk9g==
X-Google-Smtp-Source: AGHT+IHvMVemtY/rVmjCbwswGEM7HqhP6r5qb6LnqJDAtjjjAajYDr3TUYO5Abv8PQ6/cuQUXCR7zg==
X-Received: by 2002:a05:6402:4304:b0:602:1d01:2869 with SMTP id 4fb4d7f45d1cf-6021d012c1cmr5908930a12.28.1747843441958;
        Wed, 21 May 2025 09:04:01 -0700 (PDT)
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
Subject: [PATCH v3 03/14] xen/riscv: add ioremap_*() variants using ioremap_attr()
Date: Wed, 21 May 2025 18:03:43 +0200
Message-ID: <2bdbb98adf5246cd1a10e1575b8bf0aa2bdb5f6d.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce ioremap_attr() as a shared helper to implement architecture-specific
ioremap variants:
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
Changes in v3:
 - Drop ioremap_nocache() as ioremap() duplicates functionality of
   ioremap_nocache().
 - Add __iomem to defintion of ioremap(), ioremap_attr().
 - Rename start to pa for all ioremap*() functions.
 - Update the commit message ioremap_nocache().
---
Changes in v2:
 - Update the commit subject + message.  
 - move out Svpbmt changes to separate patch.
 - Drop #ifdef SVPBMT for ioremap().
 - Redefine ioremap_* in io.h.
 - Introduce ioremap_attr().
---
 xen/arch/riscv/include/asm/io.h | 10 ++--------
 xen/arch/riscv/mm.c             | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 8bab4ffa03..9aeafd6b3b 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -41,14 +41,8 @@
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
+void __iomem *ioremap_cache(paddr_t pa, size_t len);
+void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
 /* Generic IO read/write.  These perform native-endian accesses. */
 static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index d3ece9f132..4047d67c0e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -11,6 +11,7 @@
 #include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
+#include <xen/vmap.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
@@ -583,3 +584,32 @@ void *__init arch_vmap_virt_end(void)
 {
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
+
+static void __iomem *ioremap_attr(paddr_t pa, size_t len,
+                                  pte_attr_t attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+void __iomem *ioremap_cache(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR);
+}
+
+void __iomem *ioremap_wc(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_WC);
+}
+
+void __iomem *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
-- 
2.49.0



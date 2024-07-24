Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA193B3B4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764295.1174758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy7-0000Jf-IL; Wed, 24 Jul 2024 15:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764295.1174758; Wed, 24 Jul 2024 15:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy7-0000DS-8A; Wed, 24 Jul 2024 15:31:55 +0000
Received: by outflank-mailman (input) for mailman id 764295;
 Wed, 24 Jul 2024 15:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy4-0005Od-Kd
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:52 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9092283-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:51 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ef2ed59200so44649161fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:49 -0700 (PDT)
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
X-Inumbo-ID: d9092283-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835110; x=1722439910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6XL7EOUU66EeSUXZG2jsVtfUvFtJf8Harf/p3UUhw0=;
        b=cvQF3i/3PM9dsQDE5rDJVaDnQzLFpWK1gorApVKjVCHl8QI1h80sw8evsms0XM7ymz
         dnXA7vRdpCEKs53EbLEtl8nWgJzA/+4T2ScdNfG3Bm1t3GLlwtWnJ6p9co2/MaMXdRuK
         BzdQ6D5yTuTqwnxmTMdCgtL2RJN4Q59BEKewa0R/XDucFJgTVxFWF/XakeNRXinA0fwt
         NPfl1F9sayXzq1rTBJuD2Q4pd6B9tDOE5N7r+nH6wDmIHTd0v8QUaMtjTO71+VyTvH75
         KsBPHnMrJuLdqYvuMblf+6Mi4HwzjGevY5Zknwx5XfZQhVy3iIJ72ZDNQjPJG/U9/aib
         ZMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835110; x=1722439910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6XL7EOUU66EeSUXZG2jsVtfUvFtJf8Harf/p3UUhw0=;
        b=u2rLISDuIXyzdjDsR8pHhkD9KHpRPgEzM+cjcEHhkdnENklM8KENPoQUj/0p07q+uN
         5292/JsZGtyvIKWRcTZ7xOxt7xK3EWXMiGyDwYoS22gmLsWkNCvEcuA3M2XaZcg9kmPe
         17BL9f9K29zIEEvlP3EuxKK9WAXpC8KTKoD8uFsBLJphZLrQQ2RMtbOkqM16LVZ/ElRX
         G7bZzZgDGWbicGS5ZfE7QaKoQrDGQfbQGR5pizn/rmrcJX3i8nBj37YYpBbyUyBRgv7v
         w7MxhAiWl9bJn80XD1PuV/eT59K8JkjEd5exECHwnzZFbZk3Dubbtv4bDWsg5bz86uSk
         Ma2A==
X-Gm-Message-State: AOJu0YzFRkBxx0za/oVgfYpXl70spYuxUDA3Q/Ypz/r3ckbdy6CwyJ7I
	b/a+7ELDwcQhdDCruZSNQovuB97Tsn9RnyppkEL4JCs/at9tgzbrzDzXWVaI
X-Google-Smtp-Source: AGHT+IH8HTEyrNUZ4pjWIiLtjbSoRHXD+2hsZ8NBtqOV5432Io/rqG/Z2LvelVQf/3ru/RpQkdb7VQ==
X-Received: by 2002:a2e:b8ce:0:b0:2ef:21e5:1f01 with SMTP id 38308e7fff4ca-2f039cdff01mr1878401fa.20.1721835109259;
        Wed, 24 Jul 2024 08:31:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
Date: Wed, 24 Jul 2024 17:31:36 +0200
Message-ID: <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces arch_pmap_{un}map functions and select HAS_PMAP
for CONFIG_RISCV.

Additionaly it was necessary to introduce functions:
 - mfn_from_xen_entry
 - mfn_to_pte

Also flush_xen_tlb_range_va_local() and flush_xen_tlb_one_local()
are introduced and use in arch_pmap_unmap().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - rename argument of function mfn_to_xen_entry(..., attr -> flags ).
 - update the code of mfn_to_xen_entry() to use flags argument.
 - add blank in mfn_from_pte() in return line.
 - introduce flush_xen_tlb_range_va_local() and use it inside arch_pmap_{un}map().
 - s/__ASM_PMAP_H__/ASM_PMAP_H
 - add SPDX-License-Identifier: GPL-2.0 
---
 xen/arch/riscv/Kconfig                |  1 +
 xen/arch/riscv/include/asm/flushtlb.h | 22 ++++++++++++++++++
 xen/arch/riscv/include/asm/page.h     |  2 ++
 xen/arch/riscv/include/asm/pmap.h     | 33 +++++++++++++++++++++++++++
 xen/arch/riscv/mm.c                   | 15 ++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/pmap.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 259eea8d3b..0112aa8778 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,6 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
+	select HAS_PMAP
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 7ce32bea0b..cf66e90773 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,6 +5,28 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+/* Flush TLB of local processor for address va. */
+static inline void flush_xen_tlb_one_local(vaddr_t va)
+{
+    asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
+}
+
+/*
+ * Flush a range of VA's hypervisor mappings from the TLB of the local
+ * processor.
+ */
+static inline void flush_xen_tlb_range_va_local(vaddr_t va,
+                                                unsigned long size)
+{
+    vaddr_t end = va + size;
+
+    while ( va < end )
+    {
+        flush_xen_tlb_one_local(va);
+        va += PAGE_SIZE;
+    }
+}
+
 /*
  * Filter the given set of CPUs, removing those that definitely flushed their
  * TLB since @page_timestamp.
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 0cc2f37cf8..2308cefb0a 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -52,6 +52,8 @@ typedef struct {
 #endif
 } pte_t;
 
+pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int access_bits);
+
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
new file mode 100644
index 0000000000..068d0794b1
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pmap.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ASM_PMAP_H
+#define ASM_PMAP_H
+
+#include <xen/bug.h>
+#include <xen/mm.h>
+#include <xen/page-size.h>
+
+#include <asm/fixmap.h>
+#include <asm/flushtlb.h>
+#include <asm/system.h>
+
+static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    pte_t *entry = &xen_fixmap[slot];
+    pte_t pte;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
+    write_pte(entry, pte);
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    pte_t pte = {};
+
+    write_pte(&xen_fixmap[slot], pte);
+
+    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
+}
+
+#endif /* ASM_PMAP_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 35724505ec..959b6fc63e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -382,3 +382,18 @@ int map_pages_to_xen(unsigned long virt,
     BUG_ON("unimplemented");
     return -1;
 }
+
+static inline pte_t mfn_from_pte(mfn_t mfn)
+{
+    unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
+    return (pte_t){ .pte = pte };
+}
+
+inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int access_bits)
+{
+    pte_t pte = mfn_from_pte(mfn);
+
+    pte.pte |= access_bits;
+
+    return pte;
+}
-- 
2.45.2



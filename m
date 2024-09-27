Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FB988921
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806418.1217820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDuQ-0004my-5i; Fri, 27 Sep 2024 16:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806418.1217820; Fri, 27 Sep 2024 16:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDuQ-0004k7-25; Fri, 27 Sep 2024 16:33:34 +0000
Received: by outflank-mailman (input) for mailman id 806418;
 Fri, 27 Sep 2024 16:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuO-0001aD-7P
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a1fa2eb-7cee-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 18:33:29 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso27944195e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:27 -0700 (PDT)
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
X-Inumbo-ID: 3a1fa2eb-7cee-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454808; x=1728059608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A74SThhYGpNGHbuzB0A5PnKvSwX2Icc/uEq6ULocwYc=;
        b=cdE5UvzGChYE8qVGYWnfGjM6SllAXULZWeL+6x4DFRMoO4656qsLwR7wHvlc0Af/J4
         SpzfDR1k9QgGutqOmIgdahTYWbNxz6o/yQrxJ3/fOFUTzT5f3AmiEfeEHoCyc9G40ef3
         WAF2Wz6rYN7JKQS/RxwbBFD1g7eQzV3mk+cHAeovjBwhc/x1y5mt3ZIJ7jraJMCAwr8V
         Nr7QuSQM1u0Fuwk0P2tHEM77oPbSpXBz17WorFqqBwa4asUj8nf53A1jMA/Lo0ICUUa2
         1HFac829xkXKiv76dKR62EZQ2jh9upNJAvBzxIj5lpRbXYwMg9kHVSF5z8vuPhTvBQPT
         evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454808; x=1728059608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A74SThhYGpNGHbuzB0A5PnKvSwX2Icc/uEq6ULocwYc=;
        b=Ut5lENH2JUvHAfK5TXgSLYsfo/SwI3GFYY1miBugZ3F7L1Xrel5xb7+27l9ER9dwZ+
         P9VopHJqGYs7Oyx/Zi+EeN9KAFKodYE/2X+FKun+rcKeAyqJLLk89A9McIGJG627zNIt
         cikTm1gQPRbks0Gn2M6fXTTOjNKRCLXPkWJ6e5pd7OlkWqwg4Cd/6yS+tyrhLaBkYXUB
         KPIRI3oixmbSJhkrgELh2gBw+JgINKZb7IAhT00zqUOMRuyE/cihe6phC8sPzgenSuaU
         Y1gy+sRQ9AVy3gJ6pdhmUSXFNs6JeqCloY4qXjulKlFily9UMKGGPx/srbUTUzWT/NWo
         CjOw==
X-Gm-Message-State: AOJu0YwroomWKy4A/s30muaOJg4ZbrXEFR4IjYKKjTTpmm1ozo6O7mBp
	UhiCcUBsgaPNzpysnbnFnVl8NEDkYIehJcsEEFgXejMUS+XPDCedxmTL1w==
X-Google-Smtp-Source: AGHT+IF051dFpVO8XlpMXfYgtd4R1pf5U3XwDtozp0fFwnpFoF7v1vlaYdcetKSqUDFEJlyAz0s5jQ==
X-Received: by 2002:a5d:6310:0:b0:37c:cdbf:2cc0 with SMTP id ffacd0b85a97d-37cd5b15489mr3003878f8f.53.1727454807921;
        Fri, 27 Sep 2024 09:33:27 -0700 (PDT)
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
Subject: [PATCH v8 3/7] xen/riscv: introduce asm/pmap.h header
Date: Fri, 27 Sep 2024 18:33:15 +0200
Message-ID: <4bfd2bfdb276f982420bac85c4b6f2da8c5f5367.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.

Add pte_from_mfn() for use in arch_pmap_map().

Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/Kconfig                |  1 +
 xen/arch/riscv/include/asm/flushtlb.h |  6 +++++
 xen/arch/riscv/include/asm/page.h     |  6 +++++
 xen/arch/riscv/include/asm/pmap.h     | 36 +++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/pmap.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 7a113c7774..1858004676 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,6 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
+	select HAS_PMAP
 	select HAS_VMAP
 
 config RISCV_64
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 7ce32bea0b..f4a735fd6c 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,6 +5,12 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+/* Flush TLB of local processor for address va. */
+static inline void flush_tlb_one_local(vaddr_t va)
+{
+    asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
+}
+
 /*
  * Filter the given set of CPUs, removing those that definitely flushed their
  * TLB since @page_timestamp.
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index d4a5009823..eb79cb9409 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -94,6 +94,12 @@ static inline pte_t read_pte(const pte_t *p)
     return read_atomic(p);
 }
 
+static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
+{
+    unsigned long pte = (mfn_x(mfn) << PTE_PPN_SHIFT) | flags;
+    return (pte_t){ .pte = pte };
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
new file mode 100644
index 0000000000..60065c996f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pmap.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ASM_PMAP_H
+#define ASM_PMAP_H
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/page-size.h>
+
+#include <asm/fixmap.h>
+#include <asm/flushtlb.h>
+#include <asm/system.h>
+
+static inline void __init arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    pte_t *entry = &xen_fixmap[slot];
+    pte_t pte;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    pte = pte_from_mfn(mfn, PAGE_HYPERVISOR_RW);
+    write_pte(entry, pte);
+
+    flush_tlb_one_local(FIXMAP_ADDR(slot));
+}
+
+static inline void __init arch_pmap_unmap(unsigned int slot)
+{
+    pte_t pte = {};
+
+    write_pte(&xen_fixmap[slot], pte);
+
+    flush_tlb_one_local(FIXMAP_ADDR(slot));
+}
+
+#endif /* ASM_PMAP_H */
-- 
2.46.1



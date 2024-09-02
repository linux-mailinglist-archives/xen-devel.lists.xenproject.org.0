Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A49968C96
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788310.1197853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQo-0003vf-BF; Mon, 02 Sep 2024 17:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788310.1197853; Mon, 02 Sep 2024 17:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQo-0003sU-5O; Mon, 02 Sep 2024 17:01:34 +0000
Received: by outflank-mailman (input) for mailman id 788310;
 Mon, 02 Sep 2024 17:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQm-0002dz-C1
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:32 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b43dbc-694d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:31 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53343bf5eddso5880579e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:29 -0700 (PDT)
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
X-Inumbo-ID: 00b43dbc-694d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296491; x=1725901291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWYGoscry8ZAFDeszXGSeFFTzogVKWjHtiRKvfR4Z/s=;
        b=VeavuxKpEJgdFIc9yvLBu+t/rVJOEreGuAlg9eqCxsCa0E1uQDa7ggInz22iPwCtop
         Zkp9ELNdJUxioi93aN2jIZHLer3cVeNuUb0FKMvkwVnYMOq7257Jljdfbb5Uic/DgWbz
         k8tRGb3pAp0fWvKtZIsB4FK0/RootUVoq7I6OG5/pTG+SefuU0glSWB7zLnEwZvH2Z36
         6PJZa20bceL5V3jIt4dpVvWrr0AW4XE/5CRQ+McWTayK+vOdB6/rZ9JtCGghmcNWkDc4
         ABZwxYMCaHq5kd58uLqFhAFPFLMECYLShQmbuVjfkqSzVrZGrnrzvWtTBn7+hH9vqRAu
         IMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296491; x=1725901291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWYGoscry8ZAFDeszXGSeFFTzogVKWjHtiRKvfR4Z/s=;
        b=FrE6CN+dAgCOj49+g6TDQlUI/bwEbxWUhz6/7kSDpNcCw5kTEjZeV+eOQY/IKI44lt
         LC2HSoEfPudRb82B8V/N8v+n9czcBWaC/yB1MJx8atQ72uv1peLd7hLSC6LKJvjtpdCo
         /71dcCcJ5eNZSQbBRNHeAeuatkZsWURaQTeEC4Y6CcGTzDojbT15FnZSakkxft6jHqpn
         SZrn9qYpDxNDioHyopmXZUPsPhWAij8kIXjZ45IwgoVD1Xj2YhRZAS6fwPo+8rxO0JTD
         9F5LWTnqDsEqkwOIvD3I5jSoMnAr23aymXmIB6x/32/HKWG3ahyj/st1SkUDoHO8V64v
         7zLQ==
X-Gm-Message-State: AOJu0Yw4qrZjefzjFA48ELYJpLZoykpIbDWmhN7JpMWUpE6ux/aVWo28
	vD8nyhS3Th8NF1lU++CaF7YcOpSn1h2Hk3g/eKSXAmxPnNArN3oRuVlMBw==
X-Google-Smtp-Source: AGHT+IEWwp1tZSil7wRd0s1ELDfeFnFqQxUJGiObMdLDUbfZ13rj4Sab3oMeGouQjXKgwZnieglv1w==
X-Received: by 2002:a05:6512:b98:b0:52f:2adf:d445 with SMTP id 2adb3069b0e04-53546baacdbmr8089287e87.41.1725296490057;
        Mon, 02 Sep 2024 10:01:30 -0700 (PDT)
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
Subject: [PATCH v6 5/9] xen/riscv: introduce asm/pmap.h header
Date: Mon,  2 Sep 2024 19:01:18 +0200
Message-ID: <a949d5fab457b49ca837727c62857932b5caeea8.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.

Add pte_from_mfn() for use in arch_pmap_map().

Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - No changes ( only rebase )
---
Changes in V5:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
 - Fix a typo in "Changes in V4":
   - "drop flush_xen_tlb_range_va_local() as it isn't used in this patch" ->
     "drop flush_xen_tlb_range_va() as it isn't used in this patch"
   - "s/flush_xen_tlb_range_va_local/flush_tlb_range_va_local" ->
     "s/flush_xen_tlb_one_local/flush_tlb_one_local"
---
Changes in V4:
 - mark arch_pmap_{un}map() as __init: documentation purpose and
   a necessary (but not sufficient) condition here, to validly
   use local TLB flushes only.
 - add flush_xen_tlb_one_local() to arch_pmap_map() as absense of
   "negative" TLB entrues will be guaranted only in the case
   when Svvptc extension is present.
 - s/mfn_from_pte/pte_from_mfn
 - drop mfn_to_xen_entry() as pte_from_mfn() does the same thing
 - add flags argument to pte_from_mfn().
 - update the commit message.
 - drop flush_xen_tlb_range_va() as it isn't used in this patch
 - s/flush_xen_tlb_one_local/flush_tlb_one_local
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
 xen/arch/riscv/include/asm/flushtlb.h |  6 +++++
 xen/arch/riscv/include/asm/page.h     |  6 +++++
 xen/arch/riscv/include/asm/pmap.h     | 36 +++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
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
index a7419b93b2..55916eaa92 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -94,6 +94,12 @@ static inline pte_t read_pte(pte_t *p)
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
2.46.0



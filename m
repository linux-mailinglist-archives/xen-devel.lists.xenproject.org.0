Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DE94D47E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774849.1185273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLM-00028M-06; Fri, 09 Aug 2024 16:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774849.1185273; Fri, 09 Aug 2024 16:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLL-00022G-RS; Fri, 09 Aug 2024 16:19:55 +0000
Received: by outflank-mailman (input) for mailman id 774849;
 Fri, 09 Aug 2024 16:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLK-0001id-RW
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:54 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b0612c-566b-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 18:19:53 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so2582278e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:53 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:52 -0700 (PDT)
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
X-Inumbo-ID: 35b0612c-566b-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220393; x=1723825193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMQ/m8Em6+jACg1WgZvSQBZSi2KQCusY5mxmZJsitEA=;
        b=j3yqyxSeasiMaGZiZBIb7zFnQooYTxnwEgNHn/rgVmjncbZxNuVjUkxMEI05/50PMM
         Y8I0y07SzWILQOY4sWcFVsB9mIkEHbT0LfwtdyGGrgvwDmDrW+VK/DWI3YMJx9LbliDN
         kTaxmv82g9TDvNxPIRsJeTcLKidtxwwIN3hIVHadKmwqSN7M0OGlBvxQR0N/gcP2o1oN
         DrLTqj5bg+J5umKGX2jj0Nc39tv/N1br79XXsnup6XpKkUlpO3XtSyxZec1i/nCwITLm
         9XCUIOhbTqmE1kt864IP+rwJsNelxbP8FrqCcOGOYIDq0pIbgWhLshiJX09JkIW1c3yz
         AIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220393; x=1723825193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMQ/m8Em6+jACg1WgZvSQBZSi2KQCusY5mxmZJsitEA=;
        b=pGOtRqXinuh73Tk/9sE6Wom7koBFG+yYON1blaGCVvVLOnmsz/CMl0kJ3zy2cmyqLD
         TLDJEXtnVKhV06LJIITAoH7QG6ERZLp+OE9YyeF1x7+/hRfHrTP5zJRpiJjkY/aRlQGb
         KTpV/S/eXgiSuvza1WHHj/75i22betjD6Ot1X0R9EPKwOhZBWEX91U0yRzQbbb4RtZtf
         UhyZiu89JLqzfUFw8UnHD60KBNpFmQKzW03cvYONaTbFKVpgTonijZJaRSOb8ngCB20t
         RJyqvm+qVr2B7kE6SNGensIEsEslxQLZ2hd/ALU+srbB8tvbZ8OIkHDrM/vFOK1pcMIl
         6MnQ==
X-Gm-Message-State: AOJu0Yz+aH0wYSBw7J4VFL3GvyjbME9YOeyZwOGydBX7XkvhikZWDTlq
	K/75rrQrgX6mK0DpFFXlCkiBaoEhWAtrrQcKCilN0SF3Ij5VzemBjY97Ag==
X-Google-Smtp-Source: AGHT+IH/Smb9k1/wlShAlTUbaXoh3o1AyCoGOQC/Mh0Dtq3H6aLOHx83lNU3px92Zqf7da/veHvtIQ==
X-Received: by 2002:a05:6512:1383:b0:52f:d128:bd13 with SMTP id 2adb3069b0e04-530eea14528mr1260436e87.39.1723220392336;
        Fri, 09 Aug 2024 09:19:52 -0700 (PDT)
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
Subject: [PATCH v4 3/7] xen/riscv: introduce asm/pmap.h header
Date: Fri,  9 Aug 2024 18:19:41 +0200
Message-ID: <2b4481a52aa260a95df9eaef3cd249a274699809.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.

Add pte_from_mfn() for use in arch_pmap_map().

Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - mark arch_pmap_{un}map() as __init: documentation purpose and
   a necessary (but not sufficient) condition here, to validly
   use local TLB flushes only.
 - add flush_xen_tlb_one_local() to arch_pmap_map() as absense of
   "negative" TLB entrues will be guaranted only in the case
   when Svvptc extension is present.
 - s/mfn_from_pte/pte_from_mfn
 - drop flush_xen_tlb_range_va_local() as it isn't used in this patch
 - drop mfn_to_xen_entry() as pte_from_mfn() does the same thing
 - add flags argument to pte_from_mfn().
 - update the commit message.
 - s/flush_xen_tlb_range_va_local/flush_tlb_range_va_local
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
index 5db3edb100..d96db0e322 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -87,6 +87,12 @@ static inline void write_pte(pte_t *p, pte_t pte)
     *p = pte;
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
2.45.2



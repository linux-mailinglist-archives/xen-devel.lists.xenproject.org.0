Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6343978545
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798301.1208510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gb-00015g-LJ; Fri, 13 Sep 2024 15:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798301.1208510; Fri, 13 Sep 2024 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gb-0000zz-DD; Fri, 13 Sep 2024 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 798301;
 Fri, 13 Sep 2024 15:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gZ-0000AA-Bd
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:15 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb168103-71e8-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 17:58:13 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53660856a21so1102605e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:11 -0700 (PDT)
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
X-Inumbo-ID: fb168103-71e8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243092; x=1726847892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wLpSt/8koaeqq1K4FjJlAX3EhdAS4yEGyLGe6Cxffc=;
        b=H3MD+IWk45sh3Ilvj6SQpqSkcxleQBLOJK2IBZT0F5mxk0Z2tACsNg958OPv4xxBuK
         TfPoIzEwmrH8cCotQ8nkjBu2ISBC27WUEfnbLO+bgXx0oCUGbq44+jHNmyGWwmN7ZblX
         y7mr2rEYC/4kFWnjdwQg6ObkzcxiFErQNlE3xdOhyVRLJGvCdYN6RW2FGxy7w2eoX3uj
         DY34OTQ03cvZ+RKk+r5cQew/c/9bvdoHhdKNZEIqlrnXpYYTu4jnOdwnAD2la7Nzv5Y4
         52ltYFpQijZJvpsRBVypnAADfYIFoGwFfwqwGSMu3JYbRK1K4R4dh1abkYBbByWJN9Le
         QkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243092; x=1726847892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wLpSt/8koaeqq1K4FjJlAX3EhdAS4yEGyLGe6Cxffc=;
        b=HP1dBN7DHaw17aOsFdGiLNFK04F3u0N4am2sMCDjuLssGKZg8iZDOolDXON7Pmzazt
         A3x2FApISpPG4WEFLomdMJjOjzn+qwD5nwo4XWr6vxrGsqalhBJgQPd5jYA3l6T06X7M
         iEruVhAgsmo6T41Zq9xmw1tUyDxUEdUZ1jufY9l6u2xAf9G+UfdbG4OipXaJpv0Vw5aX
         uQyIbbNcX7Z64Hno2VNoVSp18laz3llI2kXaCSXB9xigwec3nSZmwRUKXDax5lw4WQwJ
         cqlKdvvvODwP63gm4WktiCGjBC7wX3CwoOos8vwO4R98OcHgjx+7URy+O9pYqpwx5+Ru
         evIA==
X-Gm-Message-State: AOJu0Yx0xFTmrucU9yduHAc1E7PTD+RxQugeEPAC0rj7ZnEIBisBWnXp
	x4MjQM5GZ6PUranYvLUfMyjsVWI+GidbyTun3AG1RAq3cHoXBTQlCBwsYA==
X-Google-Smtp-Source: AGHT+IECkC1kpArbtqWjZjtYRYmR9uQeuBXKAswFM1s/35hxWEXKFcXIzuhx3oTgNhgshdsl8I0kPg==
X-Received: by 2002:a05:6512:3b0b:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-5367ff24f98mr2157905e87.43.1726243092038;
        Fri, 13 Sep 2024 08:58:12 -0700 (PDT)
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
Subject: [PATCH v7 4/8] xen/riscv: introduce asm/pmap.h header
Date: Fri, 13 Sep 2024 17:57:42 +0200
Message-ID: <d11abde0a47a1f02172dd116f2c71a2a5f896e0a.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726242605.git.oleksii.kurochko@gmail.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.

Add pte_from_mfn() for use in arch_pmap_map().

Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6-V7:
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
2.46.0



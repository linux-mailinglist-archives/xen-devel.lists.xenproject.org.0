Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB3C95A268
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781294.1190855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqs-0004Ic-9L; Wed, 21 Aug 2024 16:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781294.1190855; Wed, 21 Aug 2024 16:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqs-0004CV-5G; Wed, 21 Aug 2024 16:06:26 +0000
Received: by outflank-mailman (input) for mailman id 781294;
 Wed, 21 Aug 2024 16:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqp-0003sE-Od
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:23 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4faece5b-5fd7-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:06:23 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f01613acbso1135482e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:21 -0700 (PDT)
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
X-Inumbo-ID: 4faece5b-5fd7-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256382; x=1724861182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUWnXdeASKM3s0vW7zMmdmova3lTcgmrVyUhj9D0sEQ=;
        b=m3j2xzRBYQz51sLqUih/NTDVf7/NSsJ4rTInJQ+Xarmkb191UgxucZ6zubyv98539m
         k3Ci529XmK335nFBOKLyXW71ZvUO+Y/PbnCyUnlZ5V28/dnnfWGHeotiiDFySHfmUxJ3
         ioon6H4CjXdmnA96y1veJzJkSj/rTqS/a1Tw0EjhnQqu6y6OMXoZ3tPk3ZxKws3zBEP7
         pg5rhlLuDuWxbiCK9//STWouHkc/+OtQM+1GTtddza0nGf99BoPKQJpdThXM6S2dGaS9
         UsEACwAeW+Vh9ND5A/kBf31WcY11ecezUdDFQtTQdd2CnG+bjAdGWv4hHG/ria1shKxX
         DMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256382; x=1724861182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUWnXdeASKM3s0vW7zMmdmova3lTcgmrVyUhj9D0sEQ=;
        b=lFDWd91FTkydXbgFtvEdgBjs/TsDUgoizTpJDqMr45HMK76vODA1tRuhC+j1WwyhAT
         XyFCyOmtWZhuy4+74LPtT8bEubyKvF18ClvL32CcCAZypQiE1cJNVKfbfPVu4ebrCk2M
         vc1VhGbw7JPYLjaSKVloZLAccUg3U6EDsNelJMj90M7FXg04lt3bg7IBYZAMTMPdCx6f
         +dLFMVF1sMDPniV4Dv5YkbfTgKP+zVa6ElBVh2C47rnkabojKYoEJV8zDf7P0wgyNKXF
         g1rvy0vOnH0neFpG+G4LXBlEIDEuQ2LaNZUNmJ2HrvbDbvdgtJ20EYIeWk/NU3358p6p
         Sk8g==
X-Gm-Message-State: AOJu0YxAWxEUpL1sHLG1iG/x/Rgu7NhuoCdz0ohTqArKH16EooM75O4V
	d9eV/iFK8tzf7v5Gj1cTawt11updnoyqZ5OFG57fzHeQhi/9juP5pIAzYQ==
X-Google-Smtp-Source: AGHT+IGly+3FqelWmnfZ4T6w26becCVTPBLUHuQXOh7Aci+pcMZxXbsLZRWwPuwV0jnSTRkjQ9mktg==
X-Received: by 2002:a05:6512:1115:b0:52b:aae0:2d41 with SMTP id 2adb3069b0e04-5334caa4b27mr41128e87.28.1724256381689;
        Wed, 21 Aug 2024 09:06:21 -0700 (PDT)
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
Subject: [PATCH v5 3/7] xen/riscv: introduce asm/pmap.h header
Date: Wed, 21 Aug 2024 18:06:12 +0200
Message-ID: <f9cc8dd9179c6510583b85b2d00cf9600e098e10.1724256027.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.

Add pte_from_mfn() for use in arch_pmap_map().

Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC4481CC26
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659539.1029242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhO8-0006CW-EI; Fri, 22 Dec 2023 15:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659539.1029242; Fri, 22 Dec 2023 15:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhO8-0006Ah-BP; Fri, 22 Dec 2023 15:24:36 +0000
Received: by outflank-mailman (input) for mailman id 659539;
 Fri, 22 Dec 2023 15:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDh-0007Ie-HZ
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:49 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b477d9f3-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:47 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e4a637958so2426131e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:45 -0800 (PST)
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
X-Inumbo-ID: b477d9f3-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258026; x=1703862826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2XgyDBcB0wcGp/eGfwcZrl9kaDJvnjyiwZy9l3W62o=;
        b=Fg1lQOU9rBjX8r+NJIeKiH7DSkZrrf8YZJshrxyjoRGXkqZ05HblmECNlCCUm5+1Zs
         oPJMT+dHfwtpZd7xlGFrcvVTYJ9BxXtCKsz7/u6485MQOstOS5V7bVk0DVj0yRflioDU
         FxrElPfGN4KOsUiCt5KLJ0L2G/O5r5UbAmnQgnoBtZHtuFS20WiKUGvypQbaVtxT3/iL
         4HyQLiulEjQ9SvYWwHUfmRUwxa0HzkSH3JpAgTI+rbVH++4F3v2IytA9rk49Eeu9wZfP
         nSR+tP+5yiM/52Q5zDgM/DOEm7/Wl974JvyU2ABv9s9z8A3RwhyC0z6Un8qz3m7yqeGg
         /HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258026; x=1703862826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2XgyDBcB0wcGp/eGfwcZrl9kaDJvnjyiwZy9l3W62o=;
        b=Y/+U26X/1s0MRdsNDerK3KvaVEY5eI7Fbc2RUg2ytkW1KC9N/ALhoOZ2+6NQEvAtI2
         /ad/R14Ct7MGNIZ6+dYr4MT2L+Ru3krecvsfLCOX2fuldmeMTZaelXEX2D3H+lJnZ1gL
         L1hud6EvDwYziBugDUd3Ko4yQfjiqOR52db+b01B5z0VNWCOCBwevzlY3236NcywI+rh
         mc313LUyEkVZKZgiVEw7sZnYTak1XdGd7QiEpbezMDQIKU8JU2ICg7Y/VM8BRYb87I4V
         c3cVjWcCFFVNAE5v4j9p1e1sN/ta3gt9wdBQCeJJ0sieFOhTby42VhY3L6FKFOWPtLaX
         Nz+A==
X-Gm-Message-State: AOJu0Yy9yer93aI3C4qbXvpcePh7Qz/CApG7jFtSZmn/pLor6H+ywcST
	bYxz8aylVdBLvFMvQXpZbroQo7WY3K4=
X-Google-Smtp-Source: AGHT+IFXlcx/J+Wls40o8XEL6UZ9HqMfyy2MVVMj21ySD20VMnVDQq8+43xyNlSyIR/iyL3GdDY2FQ==
X-Received: by 2002:a05:6512:2185:b0:50e:3082:1afe with SMTP id b5-20020a056512218500b0050e30821afemr340432lft.22.1703258026484;
        Fri, 22 Dec 2023 07:13:46 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Date: Fri, 22 Dec 2023 17:13:05 +0200
Message-ID: <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - add SPDX
 - drop unneeded for now p2m types.
 - return false in all functions implemented with BUG() inside.
 - update the commit message
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/ppc/include/asm/p2m.h   |   3 +-
 xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/p2m.h

diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
index 25ba054668..3bc05b7c05 100644
--- a/xen/arch/ppc/include/asm/p2m.h
+++ b/xen/arch/ppc/include/asm/p2m.h
@@ -50,8 +50,7 @@ static inline void memory_type_changed(struct domain *d)
 static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
                                                         unsigned int order)
 {
-    BUG_ON("unimplemented");
-    return 1;
+    return -EOPNOTSUPP;
 }
 
 static inline int guest_physmap_add_entry(struct domain *d,
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
new file mode 100644
index 0000000000..d270ef6635
--- /dev/null
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_P2M_H__
+#define __ASM_RISCV_P2M_H__
+
+#include <asm/page-bits.h>
+
+#define paddr_bits PADDR_BITS
+
+/*
+ * List of possible type for each page in the p2m entry.
+ * The number of available bit per page in the pte for this purpose is 4 bits.
+ * So it's possible to only have 16 fields. If we run out of value in the
+ * future, it's possible to use higher value for pseudo-type and don't store
+ * them in the p2m entry.
+ */
+typedef enum {
+    p2m_invalid = 0,    /* Nothing mapped here */
+    p2m_ram_rw,         /* Normal read/write guest RAM */
+} p2m_type_t;
+
+#include <xen/p2m-common.h>
+
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    BUG();
+    return -EINVAL;
+}
+
+/* Look up a GFN and take a reference count on the backing page. */
+typedef unsigned int p2m_query_t;
+#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
+#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
+
+static inline struct page_info *get_page_from_gfn(
+    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
+{
+    BUG();
+    return NULL;
+}
+
+static inline void memory_type_changed(struct domain *d)
+{
+    BUG();
+}
+
+
+static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
+                                                        unsigned int order)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    BUG();
+    return -EINVAL;
+}
+
+/* Untyped version for RAM only, for compatibility */
+static inline int __must_check
+guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int page_order)
+{
+    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+}
+
+static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
+{
+    BUG();
+    return _mfn(0);
+}
+
+static inline bool arch_acquire_resource_check(struct domain *d)
+{
+    /*
+     * The reference counting of foreign entries in set_foreign_p2m_entry()
+     * is supported on RISCV.
+     */
+    return true;
+}
+
+static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not supported on RISCV. */
+}
+
+#endif /* __ASM_RISCV_P2M_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0



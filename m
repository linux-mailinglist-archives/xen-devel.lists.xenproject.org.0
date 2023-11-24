Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAB7F71FA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640505.998835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TjT-0003l8-VF; Fri, 24 Nov 2023 10:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640505.998835; Fri, 24 Nov 2023 10:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TjT-0003iX-Ra; Fri, 24 Nov 2023 10:48:23 +0000
Received: by outflank-mailman (input) for mailman id 640505;
 Fri, 24 Nov 2023 10:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTN-0006hx-BU
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a55788b0-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:36 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a00a9d677fcso236752066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:36 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:35 -0800 (PST)
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
X-Inumbo-ID: a55788b0-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821896; x=1701426696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJRjUvdwuuad2efuExKOiQ+ed+OjR0ZfoiyU0hrJwyQ=;
        b=BLCH2jOgcpPZz0xTBNyf6oSdRS/LJqn5Irh0ACRl0XaANNUcxPeMtwv8IUar9ygayC
         rgMB4/XB21A2Z0dkMgbppZQ1CieVFEwEZ8crr+TPzpobdVwHIV8dyeCwDsyCIVCJ4vPP
         daG+Xyghv4PXJT4Vni1BwD4bW7JmI0JARcvCOyu+2Adqr9G6bCvgAInCv8u070EkDukx
         YsSjldkM8R5aSKMBz32lA4q+lg4ZFNjh7TSqqICNOaJYDQfF0YSFJAvpyR1mfNxjqb6P
         /1rSI6XnQbpiNTgmiz9eRE/oZQOmmXxn6GXViljLvBqHA5iyhJDYQanez9EZ+/bNcM+i
         CAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821896; x=1701426696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJRjUvdwuuad2efuExKOiQ+ed+OjR0ZfoiyU0hrJwyQ=;
        b=mmTxNBFfvxaqyuAKKoATd3vTNfS2zESXVQddM/ittAMG3sBSoG1BRSPj0wBfJBjOhb
         r/n0LaQzjUwhEdjpLClFMKrsNTQ21tj4HCk0eeQ04FYKj16NriGV41n0IDQEP5Af68Ns
         CR25bofY/xv0G1YJLqSBwc1fi+tccqINgu34woR2NFimCsBy7AACLTjGb4ZcTcnY/vIE
         zd4opRnd27ez0eljfKkm4d0SQEvMSuXwHEGtZ7U4iAHcvONItAVwvAv5Tf0kd+iX3PZK
         yeoempW38VMNKdILPJku7lNQWWt2QMkoh1EE6BG3qr5dpjSIl2Cq92RSLIVMSWjOyl0n
         iztA==
X-Gm-Message-State: AOJu0Yy7eVCu4dWdIdsUZ+6UooTKgoNHc/ePH1j0w7pdnXvsqOcUFdmp
	pDZD0ll3WnTX933I+VAehipXX8Mj9d8B0g==
X-Google-Smtp-Source: AGHT+IGpih3co3kvDZv/3jxn98aNZyNxgpf5T1LzAvpcmJAKB7f7T7q7e77bVQTfk3l7qT4x1EBIYg==
X-Received: by 2002:a17:906:b6d3:b0:a03:a3c4:ed99 with SMTP id ec19-20020a170906b6d300b00a03a3c4ed99mr1807229ejb.41.1700821895729;
        Fri, 24 Nov 2023 02:31:35 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 25/39] xen/riscv: introduce asm/p2m.h
Date: Fri, 24 Nov 2023 12:30:45 +0200
Message-ID: <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/p2m.h | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/p2m.h

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
new file mode 100644
index 0000000000..993aec6d2c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -0,0 +1,105 @@
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
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
+    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
+    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
+    /* The types below are only used to decide the page attribute in the P2M */
+    p2m_iommu_map_rw,   /* Read/write iommu mapping */
+    p2m_iommu_map_ro,   /* Read-only iommu mapping */
+    p2m_max_real_type,  /* Types after this won't be store in the p2m */
+} p2m_type_t;
+
+#include <xen/p2m-common.h>
+
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    BUG();
+    return 1;
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
+    BUG();
+    return 1;
+}
+
+static inline int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    BUG();
+    return 1;
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
\ No newline at end of file
-- 
2.42.0



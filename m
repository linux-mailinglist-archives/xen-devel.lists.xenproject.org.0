Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C577DEAF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584417.915146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnf-0001zR-8E; Wed, 16 Aug 2023 10:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584417.915146; Wed, 16 Aug 2023 10:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnf-0001wI-3o; Wed, 16 Aug 2023 10:30:51 +0000
Received: by outflank-mailman (input) for mailman id 584417;
 Wed, 16 Aug 2023 10:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe5-0003RA-20
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 915067c9-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:48 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso5587482f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:48 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:47 -0700 (PDT)
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
X-Inumbo-ID: 915067c9-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181247; x=1692786047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4ptIkdY77K81tEHPihXAWsNfWZZEHDjxbo0FTlxYlU=;
        b=XtyAC0+03O+lcAoJTH90d0Xw/+/Y4m9yfG8qf0MAAKksaJFO9D3fm//nZ6W+92DN2R
         FoKsOpma8nphGPA8CnZB66JX4nutbQrxDIpWMIj1HiUA+hSOBiNS0ewblDtQh1hSJLhQ
         6XcxHm/umSMjlQ1OjIZQnKfgnS4eWhEfLo+L8v0goKkqvVyCnVpV0h7gjiqTxdXExD/h
         obliHHmmuPKzeA+fYQ6tEgEX9bQQQFAlTSUgb/oHX14u+fzOZIPSxO2nC86S/Iq1Zanu
         KWuxBCKs9KDiKUvyZetcR3INqaf6++6/gKASfSUNOR0yNKyMYWBY8xUVMD0lmiRA1tTV
         tsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181247; x=1692786047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4ptIkdY77K81tEHPihXAWsNfWZZEHDjxbo0FTlxYlU=;
        b=HEI80zcxcrLhxXfyAyHkTv2zbHU3pqFuegvoCbkjGg8f5o0nfCa+rKZguzHL0jamR/
         Kv/sz57Y2gVq3pkSR6uywRoGYrsviMzUA5nsYmLCgXgF0HKVrV4+JkHpYTCNIPo3Aj3T
         C52YQJa9Ba6t/+zFhM+FkhqyOQIWvhwhlIwFQPqvoLikHs3BsE0pBh90+FFrBErkbnfu
         PGG5nAIUxe1XmSX6n+fvFAH/MMARWZCSteHbX3CGckdCjIgy8cOr92Gf8cVkl7Ka1aOE
         fmVe8A5105WC7+vV7bfkPHrPl4j811vHUziLhBoM5I1QUV5LatPBQwSaBtCdPhVcgc0M
         WeDQ==
X-Gm-Message-State: AOJu0YxZ5zl166iOP1UsmTW32OGU8h7EPLhncs2iFVzFvk1mFzHVCZoz
	FgJmJQrraHjYqSrRNJe5eI8m8kNTbuc+TEre
X-Google-Smtp-Source: AGHT+IGCl+DIeeg07CmJpFpxf0G2RfI19ePdYZMhf/aVNXmeprpsvU6nEMrj8W/oR/+jOE+i6iGGZA==
X-Received: by 2002:a5d:5192:0:b0:319:8bb3:ab8a with SMTP id k18-20020a5d5192000000b003198bb3ab8amr948431wrv.52.1692181247379;
        Wed, 16 Aug 2023 03:20:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 40/57] xen/riscv: introduce asm/p2m.h
Date: Wed, 16 Aug 2023 13:19:52 +0300
Message-ID: <7c1a1083ac3577c26071de14459f7a3ba7316a27.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.41.0



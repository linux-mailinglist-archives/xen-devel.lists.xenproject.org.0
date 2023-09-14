Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA77A08CE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602464.939135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo5S-0004mQ-5x; Thu, 14 Sep 2023 15:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602464.939135; Thu, 14 Sep 2023 15:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo5S-0004ji-3B; Thu, 14 Sep 2023 15:16:58 +0000
Received: by outflank-mailman (input) for mailman id 602464;
 Thu, 14 Sep 2023 15:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmi-0002WX-6y
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:36 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e06a6f-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:31 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bfc5218dd8so16475161fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:30 -0700 (PDT)
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
X-Inumbo-ID: 07e06a6f-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703451; x=1695308251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuqIAdHXsDV1gv+OkVBVoXy1cs3PJPdYw0WDDR79HMM=;
        b=GOXmlu/ik9fYJHZrAbV7RryN/CiVdykY+Pob0MBpTg1sJMRD3lFwq9N1Oidq6P2MNk
         G4XhA+X+pY0M4PAsb4lJAF3Y2yoBKkb+Goe012NG9OE1XugaAmrqKAAicpM3yRPINtDQ
         4fQVQtO8/qKWY1XoLUqGCsiCgpa2OGtIYlcPMzHB675t2/gEk5BQYEu++BW5w8zqu3SX
         GKOYKgwvTz2UdUzWeCOpQVRxyWmbQ2lI2MFL9qcW9SQS/pnvlpTB40BASVyJpEafnjbY
         rztDQUv/9FBeuRqkGLLvkbDglNhbnZuquFxgnmCVYoqcjzyXbPCiXJA+u9fINsMo/Xjz
         bjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703451; x=1695308251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuqIAdHXsDV1gv+OkVBVoXy1cs3PJPdYw0WDDR79HMM=;
        b=X3DqIYS3HFwZyvrAzomQlsJTGXOjULHTEDI0QxsKJc6FXvYfZLvl3NYs9Bc/VdPczO
         TxagfosyNkDeKeeyUsJ29h971sjL10D5tkz6eEEWt/3/dF7QSGQKOiEu3Qod1ct81eIy
         N6ESHFZ4DsCJScbxG4vyRDLMULLbtkHMOSJC5J33FvAHCanFCBh531Z0ZEkYzg82Sn38
         FIwlgCRNSOdt/iRmCfcJH0plxgWu8/LSqQ6yuyB924HYyjT2uZXvXSnPPlKymFINuq9P
         hCx4+1FAqmQPHhpDnZjlbFLqDewDqpHTzq4x7ogl8mWvZTrzLeBWRheZqJkKI5QPT/Xj
         kURg==
X-Gm-Message-State: AOJu0YyCWggvMwNYrsEbB4ASAeRZ1Gk7/5/evi9Y7TtMksgaaCO5/4Cx
	gIOiDdLzPZHDdUikJgZmFB8lqT7RjqM=
X-Google-Smtp-Source: AGHT+IE63MvqY04Bfh3l9boON9/lvcHwlW19O2BdKdsC8dDQCa0ilk469q04ilR7cR4p8M5UL2Q/ag==
X-Received: by 2002:a2e:8092:0:b0:2bc:f5a0:cc25 with SMTP id i18-20020a2e8092000000b002bcf5a0cc25mr5204702ljg.2.1694703451058;
        Thu, 14 Sep 2023 07:57:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 28/29] xen/asm-generic: introduce stub header p2m.h
Date: Thu, 14 Sep 2023 17:56:49 +0300
Message-ID: <161b123e70e1bad65c3c64c2ffab09a3669f9e42.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/p2m.h | 115 ++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 xen/include/asm-generic/p2m.h

diff --git a/xen/include/asm-generic/p2m.h b/xen/include/asm-generic/p2m.h
new file mode 100644
index 0000000000..554fd46608
--- /dev/null
+++ b/xen/include/asm-generic/p2m.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_P2M_H__
+#define __ASM_GENERIC_P2M_H__
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
+     * is supported on GENERIC.
+     */
+    return true;
+}
+
+static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not supported on GENERIC. */
+}
+
+#endif /* __ASM_GENERIC_P2M_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22BF849E48
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676210.1052301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y0-00037v-NI; Mon, 05 Feb 2024 15:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676210.1052301; Mon, 05 Feb 2024 15:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y0-0002y0-4y; Mon, 05 Feb 2024 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 676210;
 Mon, 05 Feb 2024 15:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xw-0007I6-GY
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:00 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d729c54d-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:58 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5111e5e4e2bso7067735e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:57 -0800 (PST)
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
X-Inumbo-ID: d729c54d-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147178; x=1707751978; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxDcUc6rWW4h3ga9tFvFXTGNQ6qcEb8Oz/2ADhIp7pw=;
        b=Pm7M3/YEuwEjbXhiGhmvB56UpTQ6qE3iZd4QHrfkUVXeEXZhnczjO439G5pDN4Huki
         gnm5HxjCIVNrJXUHg2GBMiaX3qWPO3zHj+RrzU3aAhjmhpF0OC3Gov5Qi4M4OtELJrud
         AVtIPIRBAEZTQ+NSuQGCXZDgxEXGumQrNnTQs7pldDFBnC364J+HUxGEbDl2OJsJjIpv
         nh79e+U9q6zthO8KuJqSqmYc7wMPX+9rS2Vsq58PkhOiwmrAxRRUroV/o9OS0ozckecC
         Y7updL9f/clFzdDnojqwi3fQ/DW8jf+AlLLvgdY8YQLHqpEy+OGCAD0bkC+vfERrwXQC
         rvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147178; x=1707751978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxDcUc6rWW4h3ga9tFvFXTGNQ6qcEb8Oz/2ADhIp7pw=;
        b=fTF+Ob825z1RmxmpDcJklvuKeQ81zSRtzFuJ690mCHRlv3fGoZJ2hiG4jpzzIjo3Jb
         /tdE49v9O/JILFe61hQHzKjJEfPfRDop0QluIrfu7SdyItOnGYTHKDDL93JG+cTeqDSB
         1eUR5xCbIHlHo7jCgGnjJ8rfvjWPj2ysU8EoVqQFs5ot9Idz9guwkgPA7vqEiRO/nWEM
         G/gxB3vg3J5p7nOvlH4wg61KsURqzqPfhNlIql1uSokFJZRw78Xs/BmGL9l+lQJrxwsb
         RCOFX7wV8j+MRFwYj1ufOgPlEN22HydI6iiicCHF6XetdFq9fQmOOn6l8YkjOB/rtdrn
         FtSw==
X-Gm-Message-State: AOJu0Yzfj0r/B/byngtBsjTtmGpIR6WatGUkAZ0idg50fhwOiz+VYnZc
	7xOEet5tLhnMGp5/vxFXS7CpNuUD/pp1Rj1ocJd8R9MIQnGSLMDK86AM9QJx
X-Google-Smtp-Source: AGHT+IE94854AnAZmL/mD77mY6EfUqRNri0QqHNQ8nF3T+G1eJJ13BWu6j9fVDPkW8li9ZiPEU1QiQ==
X-Received: by 2002:a05:6512:480b:b0:511:479c:1d8e with SMTP id eo11-20020a056512480b00b00511479c1d8emr4082037lfb.29.1707147178118;
        Mon, 05 Feb 2024 07:32:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXAsRSSR4SGgCBMKW0WY8FQ8mSKDehSpoPXPn5SivkPmY7UrlC9cbswWo95Oe1OXbiqdVmK6OaPRREyFfWUrM3a7VxNma5svTNZ/6izY+mETrWNvdLyYWSzcwY984T+8RUdJuqCuExxqDBK7wh4cbG5T/6AIoHi57ZGfU/anHI44KChIgHYE5SJkZyd7nrry/XAeTaMcSkSotiTphN020BJpMGGAI1T/Tdc88O8JoO9TQfNa9kefCZ+5GdxDcNWfE5d3Wf3ZYUQa51TeCeiNq7mOQ6/xX+1GGkxCvWTfmFOWcErNDJkqguijjfmAZG3y+M4y+kF
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
Subject: [PATCH v4 16/30] xen/riscv: introduce p2m.h
Date: Mon,  5 Feb 2024 16:32:23 +0100
Message-ID: <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - update the comment above p2m_type_t. RISC-V has only 2 free for use bits in PTE, not 4 as Arm.
 - update the comment after p2m_ram_rw: s/guest/domain/ as this also applies for dom0.
 - return INVALID_MFN in gfn_to_mfn() instead of mfn(0).
 - drop PPC changes.
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
 xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/p2m.h

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
new file mode 100644
index 0000000000..8ad020974f
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
+ * The number of available bit per page in the pte for this purpose is 2 bits.
+ * So it's possible to only have 4 fields. If we run out of value in the
+ * future, it's possible to use higher value for pseudo-type and don't store
+ * them in the p2m entry.
+ */
+typedef enum {
+    p2m_invalid = 0,    /* Nothing mapped here */
+    p2m_ram_rw,         /* Normal read/write domain RAM */
+} p2m_type_t;
+
+#include <xen/p2m-common.h>
+
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    BUG_ON("unimplemented");
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
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+static inline void memory_type_changed(struct domain *d)
+{
+    BUG_ON("unimplemented");
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
+    BUG_ON("unimplemented");
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
+    BUG_ON("unimplemented");
+    return INVALID_MFN;
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



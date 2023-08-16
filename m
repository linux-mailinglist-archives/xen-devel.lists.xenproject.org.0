Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D9377DECD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584506.915400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpC-0006mK-KI; Wed, 16 Aug 2023 10:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584506.915400; Wed, 16 Aug 2023 10:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpC-0006be-04; Wed, 16 Aug 2023 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 584506;
 Wed, 16 Aug 2023 10:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeT-0003RA-4m
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a360429-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:21:03 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso5529430f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:21:03 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:21:02 -0700 (PDT)
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
X-Inumbo-ID: 9a360429-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181262; x=1692786062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lqPlDblQ/O51aEcFCRW710vDhqN4bxQXWxYRZVca48=;
        b=eqOA4tSzVLGL7Xy3rgRmvw2p4xGPa2ER6fszWDDiQzjRU+AL30qc3YVqfPdmVTIiQa
         AnThyZ3u806GyR7BJdjERAKzJrjmdEl1tWMAIoGy9t5gUCEsncBsPwinHdcVbzvp0Osu
         6+mIf1R7+DegM+6z+0dAna5JNrzzybBhN/ZW/tR48dRxl1KR8MSDtjoPu8vxXcpNHkg4
         rfBYCItoUvH2fSy2l3I0sFWlbnoUJupKvGhOK3LXvMzJe8G4NWsSEVLpGhqnI95er4oW
         X4OiB3fETtyTY+5kmZxRdYZCK/ByXz4654EH8IU9yH8kmemWWroeTTMSZaCh1oRJxFJa
         aYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181262; x=1692786062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lqPlDblQ/O51aEcFCRW710vDhqN4bxQXWxYRZVca48=;
        b=XnxFcgwwLVdtRAYo4+l6VfcBTP1nckeRU5AHgELOMtewEbKqrbjYeFadvycrG8JVuX
         78wjy9juzylZsat+eX593ZTLdl6Ny7nR/pryXIBQiIM+Z0sS5mBlZ4ireI7m/KZMVwW1
         FA+v4hxTUsclJayUMPX3LAJZh7Ht21myM+IavfwMlkOfX8GdMO1E+6ebp7UXEKp4xlLU
         TI76s7ljPEPiED45SYrNPgnJAfrES5SeCNXW0wJ4vxdlYDRcKKQGM8Oad2AEIKZwrqzx
         ET5dyLMZtmCmRZi57awUsmphXZN5vyZyZJ6pSeFefLMuJSrw1UJOJDOTdjAMnDDa5QZl
         Ex3g==
X-Gm-Message-State: AOJu0YywLyNf3t8JsB9xrpKAp6uvXpcdmMXxWxSqqQEynX/aLRkfCKZg
	k4aZwRm7VbgF1U2L6Y+D1IQDNBRcaOZQw/zu
X-Google-Smtp-Source: AGHT+IFv80IhB77QwBcZmes1wyIxBmKA83ob/m0QE3A8ZmoBIZ0/vfcR7cJhPnQkWse8y+yRjtNQyA==
X-Received: by 2002:a5d:4dd1:0:b0:313:e735:6d23 with SMTP id f17-20020a5d4dd1000000b00313e7356d23mr1142481wru.22.1692181262260;
        Wed, 16 Aug 2023 03:21:02 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 57/57] xxxen/riscv: WIP ( need advise )
Date: Wed, 16 Aug 2023 13:20:10 +0300
Message-ID: <85c3008696e5f9568f6a6504c915a319ca326537.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes are needed only to make GitLab CI happy is it doesn't
take into account tiny64_defconfig where unnecessary configs are disabled.

I tried different approaches to deal with it:
1. Override EXTRA_XEN_CONFIG and EXTRA_FIXED_RANDCONFIG in the following way:
   EXTRA_XEN_CONFIG:
     CONFIG_1=n
     CONFIG_2=n
     ...
2. Override in arch-specific KConfig:
     CONFIG_1:
        default n

Each option doesn't work for me fully.

Could you please suggest other options or more correct way?

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/asm_defns.h     | 44 +++++++++++++++++
 xen/arch/riscv/include/asm/grant_table.h   | 57 ++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_atomics.h | 16 +++++-
 xen/arch/riscv/include/asm/livepatch.h     |  0
 xen/arch/riscv/include/asm/mm.h            |  5 ++
 xen/arch/riscv/include/asm/p2m.h           | 24 +++++++++
 xen/arch/riscv/include/asm/page.h          | 16 ++++++
 xen/arch/riscv/include/asm/perfc_defn.h    |  0
 xen/arch/riscv/mm.c                        | 33 +++++++++++++
 9 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/asm_defns.h
 create mode 100644 xen/arch/riscv/include/asm/livepatch.h
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h

diff --git a/xen/arch/riscv/include/asm/asm_defns.h b/xen/arch/riscv/include/asm/asm_defns.h
new file mode 100644
index 0000000000..dd0511a9c6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/asm_defns.h
@@ -0,0 +1,44 @@
+#ifndef __ARM_ASM_DEFNS_H__
+#define __ARM_ASM_DEFNS_H__
+
+#ifndef COMPILE_OFFSETS
+/* NB. Auto-generated from arch/.../asm-offsets.c */
+#include <asm/asm-offsets.h>
+#endif
+#include <asm/processor.h>
+
+/* Macros for generic assembly code */
+#if defined(CONFIG_RISCV_32)
+# define __OP32
+# define ASM_REG(index) asm("r" # index)
+#elif defined(CONFIG_RISCV_64)
+# define __OP32 "w"
+/*
+ * Clang < 8.0 doesn't support register alllocation using the syntax rN.
+ * See https://reviews.llvm.org/rL328829.
+ */
+# define ASM_REG(index) asm("x" # index)
+#else
+# error "unknown ARM variant"
+#endif
+
+#define RODATA_STR(label, msg)                  \
+.pushsection .rodata.str, "aMS", %progbits, 1 ; \
+label:  .asciz msg;                             \
+.popsection
+
+#define ASM_INT(label, val)                 \
+    .p2align 2;                             \
+label: .long (val);                         \
+    .size label, . - label;                 \
+    .type label, %object
+
+#endif /* __ARM_ASM_DEFNS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/grant_table.h b/xen/arch/riscv/include/asm/grant_table.h
index 600fb10669..8b7880d3ed 100644
--- a/xen/arch/riscv/include/asm/grant_table.h
+++ b/xen/arch/riscv/include/asm/grant_table.h
@@ -1,4 +1,61 @@
 #ifndef __ASM_RISCV_GRANTTABLE_H__
 #define __ASM_RISCV_GRANTTABLE_H__
 
+#define INITIAL_NR_GRANT_FRAMES 1U
+
+#define gnttab_shared_page(t, i)   virt_to_page((t)->shared_raw[i])
+
+#define gnttab_status_page(t, i)   virt_to_page((t)->status[i])
+
+#define gnttab_shared_gfn(d, t, i)                                       \
+    page_get_xenheap_gfn(gnttab_shared_page(t, i))
+
+#define gnttab_status_gfn(d, t, i)                                       \
+    page_get_xenheap_gfn(gnttab_status_page(t, i))
+
+#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
+    (gfn_eq(gfn, INVALID_GFN)                                            \
+     ? guest_physmap_remove_page((gt)->domain,                           \
+                                 gnttab_get_frame_gfn(gt, st, idx),      \
+                                 mfn, 0)                                 \
+     : 0)
+
+#define gnttab_get_frame_gfn(gt, st, idx) ({                             \
+   (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
+        : gnttab_shared_gfn(NULL, gt, idx);                              \
+})
+
+#define gnttab_need_iommu_mapping(d)                    \
+    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
+
+static inline bool gnttab_release_host_mappings(const struct domain *d)
+{
+    BUG();
+}
+
+static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
+{
+#ifndef NDEBUG
+    printk_once(XENLOG_G_WARNING "gnttab_mark_dirty not implemented yet\n");
+#endif
+}
+
+static inline void gnttab_clear_flags(struct domain *d,
+                                      unsigned int mask, uint16_t *addr)
+{
+    BUG();
+}
+
+static inline bool gnttab_host_mapping_get_page_type(bool ro,
+                                                     const struct domain *ld,
+                                                     const struct domain *rd)
+{
+    return false;
+}
+
+int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
+                              unsigned int flags, unsigned int cache_flags);
+int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
+                               uint64_t new_gpaddr, unsigned int flags);
+
 #endif /* __ASM_RISCV_GRANTTABLE_H__ */
\ No newline at end of file
diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
index 71b0b11a25..8c8fd647d6 100644
--- a/xen/arch/riscv/include/asm/guest_atomics.h
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -35,9 +35,23 @@ guest_testop(test_and_change_bit)
 
 #undef guest_testop
 
-
 #define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
 
+#define guest_cmpxchg(d, ptr, o, n)                         \
+    ((__typeof__(*(ptr)))__guest_cmpxchg(d, ptr,            \
+                                         (unsigned long)(o),\
+                                         (unsigned long)(n),\
+                                         sizeof (*(ptr))))
+
+static always_inline unsigned long __guest_cmpxchg(struct domain *d,
+                                                   volatile void *ptr,
+                                                   unsigned long old,
+                                                   unsigned long new,
+                                                   unsigned int size)
+{
+    BUG();
+}
+
 #endif /* __ASM_RISCV_GUEST_ATOMICS_H */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/livepatch.h b/xen/arch/riscv/include/asm/livepatch.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 1d464afec9..37916f9be7 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -276,4 +276,9 @@ void setup_initial_pagetables(void);
 void enable_mmu(void);
 void cont_after_mmu_is_enabled(void);
 
+static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+{
+    BUG();
+}
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 993aec6d2c..8537ce12fd 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -29,6 +29,28 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(_t) (1UL << (_t))
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw) |        \
+                       p2m_to_mask(p2m_ram_ro))
+
+/* Grant mapping types, which map to a real frame in another VM */
+#define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) |  \
+                         p2m_to_mask(p2m_grant_map_ro))
+
+/* Foreign mappings types */
+#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
+                           p2m_to_mask(p2m_map_foreign_ro))
+
+/* Useful predicates */
+#define p2m_is_ram(_t) (p2m_to_mask(_t) & P2M_RAM_TYPES)
+#define p2m_is_foreign(_t) (p2m_to_mask(_t) & P2M_FOREIGN_TYPES)
+#define p2m_is_any_ram(_t) (p2m_to_mask(_t) &                   \
+                            (P2M_RAM_TYPES | P2M_GRANT_TYPES |  \
+                             P2M_FOREIGN_TYPES))
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
@@ -102,4 +124,6 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
+bool is_iomem_page(mfn_t mfn);
+
 #endif /* __ASM_RISCV_P2M_H__ */
\ No newline at end of file
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index abbae75aaf..52eb517669 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -83,6 +83,22 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG();
 }
 
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+    BUG();
+}
+
+static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+    BUG();
+}
+
+static inline int clean_and_invalidate_dcache_va_range
+    (const void *p, unsigned long size)
+{
+    BUG();
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 0f40641db7..696a1e8448 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -323,3 +323,36 @@ int map_pages_to_xen(unsigned long virt,
     assert_failed(__func__);
     return -1;
 }
+
+bool is_iomem_page(mfn_t mfn)
+{
+    BUG();
+}
+
+int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
+                               uint64_t new_gpaddr, unsigned int flags)
+{
+    BUG();
+}
+
+int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
+                              unsigned int flags, unsigned int cache_flags)
+{
+    BUG();
+}
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    BUG();
+}
+
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG();
+}
+
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    BUG();
+}
\ No newline at end of file
-- 
2.41.0



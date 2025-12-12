Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7CCB9EAA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185897.1507841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVA-0004X4-Bl; Fri, 12 Dec 2025 22:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185897.1507841; Fri, 12 Dec 2025 22:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVA-0004Qr-84; Fri, 12 Dec 2025 22:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1185897;
 Fri, 12 Dec 2025 22:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBV9-0004Ar-3i
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97c5cb0-d7a8-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 23:20:38 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so13644855e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:38 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:36 -0800 (PST)
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
X-Inumbo-ID: c97c5cb0-d7a8-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578038; x=1766182838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtChIVPu0BlsEPgndceh88YwfrCdmpi/AIn67jRojGc=;
        b=ZeLVW29nqfNc0g+8SmI+MvE2OTKMfYqyEm2ijOS3d70zG0A8a6etKYlqWLIOoE/2ur
         ZoC/AaTf0+lk4B4CxT5jghPil8U1k+NrlnyNSJTVEa5rHJnZdIJqTTTfIZtKDPpOtmob
         y7VJxOCg7kMCsO5lUbO7tyB5AtntewqGu6EuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578038; x=1766182838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UtChIVPu0BlsEPgndceh88YwfrCdmpi/AIn67jRojGc=;
        b=MhyJoMQZIai/i3U+gRu576cx9nqGjY3pJTcVaFqV+MXcVPHPt3ogrcirnEPHFFxQKq
         GtP4CFpcRRtnt446nuFnfolfPtxjB/YVElXDZrBj/Qk3rZebZTBCbxa9n0xXs5FXgmrP
         4LRFU+IbYtZ/ZJ/4NoUaTgQKVHBKFyOV7oHXgNutD96BXyKAEw7Raw1djKjGvaSrh0il
         O801uQK7KawvGa1I8+6W+xpexWfh5o+oGDFXBluCfpiSh8zQAOhx5ZkEe2Em2MSacbIS
         4QCdu7yWe/ham2nqQ81nZy06mZ7q6tuWRf8q/vJh8FdJLDhXC/gBz5YkIqsjLv9ERBDU
         xaQw==
X-Gm-Message-State: AOJu0YxTxoJtwlurUOjsCoMWKf8h8le+Gq7CVN3ppAq3CsgsX668FTNZ
	pad/vtRYC7j0GaQL86v+E5g98ABEuTSdp0rPnOMndAuKnhnT5MDGVX0V8yAJjF930bihOHI4V20
	bpHFs
X-Gm-Gg: AY/fxX7omZbKMwTj56+mQ8kD4VtZQAL6wL7a7ytnNLP4SF4BRppN4VPk96vN3u2z5b3
	ekuIpgI4wxwNp5INjoh4XV3kal0LBKKIevv9UtEIVkik0/Jo55VzD+5g3JaE/2Af1XIYZ0YlbAT
	GdUIjLoJJ7iZqDxyTMkE1cquIN77dKVzOAis5AcEwcU1aKhECMGxXTnThGD7WLGquReWiI/v5DL
	BcGSTqqPukZ9Abczk2i4NgDD/+XJsU5Cd49IE09/mOHCBXl9eELC7ONghIdLZuHdVv7kgPO0lSQ
	ygL10g1DdabrKgvjU+ns5Y+R11o/0jeROp3RQtps8CV/s6Bmu7wj/kzO4XLcwZClUCO+AryDqhu
	EjEFZNfsEzfnAUKW51TkwmLs3wTlKRcRdT28dZKb0/QYqvFxnxonyXpoRRGLQronXDOI+P2C3Mj
	hAGm5MPkXJYMzB47eCXRp1EyoecUqFJB7rSbkWd1gLOPUflZlcyKxSX4UPg2JPmw==
X-Google-Smtp-Source: AGHT+IEEhwGOvC1NWFj0FHtn2MKgrphtOCvdtqOghBBeK7Hvaw39jEigq6qqiNLqGTLTDh/euTzATA==
X-Received: by 2002:a05:600c:8115:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-47a8f8a9c1bmr38046705e9.3.1765578037115;
        Fri, 12 Dec 2025 14:20:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 3/5] x86: Address MIRSA R8.3 (declaration/definition mismatch) issues
Date: Fri, 12 Dec 2025 22:20:30 +0000
Message-Id: <20251212222032.2640580-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are mostly name mismatches, but a couple have type alias mismatches too.

For shadow_put_top_level() and is_patch(), the declaration name is the better
choice so change the name in the function.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/hypercall.h |  4 ++--
 xen/arch/x86/include/asm/pv/mm.h     |  4 ++--
 xen/arch/x86/include/asm/shadow.h    |  2 +-
 xen/arch/x86/mm.c                    |  4 ++--
 xen/arch/x86/mm/shadow/common.c      |  8 ++++----
 xen/arch/x86/mm/shadow/multi.h       |  4 ++--
 xen/arch/x86/mm/shadow/private.h     | 10 +++++-----
 xen/common/kimage.c                  |  2 +-
 xen/common/livepatch.c               | 14 +++++++-------
 xen/include/xen/livepatch.h          |  2 +-
 10 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index f6e9e2313b3c..bf2f0e169aef 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -22,8 +22,8 @@
 void pv_hypercall(struct cpu_user_regs *regs);
 #endif
 
-void pv_ring1_init_hypercall_page(void *ptr);
-void pv_ring3_init_hypercall_page(void *ptr);
+void pv_ring1_init_hypercall_page(void *p);
+void pv_ring3_init_hypercall_page(void *p);
 
 /*
  * Both do_mmuext_op() and do_mmu_update():
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 182764542c1f..a5745908206a 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -18,7 +18,7 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
                unsigned int entries);
 void pv_destroy_gdt(struct vcpu *v);
 
-bool pv_map_ldt_shadow_page(unsigned int off);
+bool pv_map_ldt_shadow_page(unsigned int offset);
 bool pv_destroy_ldt(struct vcpu *v);
 
 int validate_segdesc_page(struct page_info *page);
@@ -40,7 +40,7 @@ static inline int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
 { ASSERT_UNREACHABLE(); return -EINVAL; }
 static inline void pv_destroy_gdt(struct vcpu *v) { ASSERT_UNREACHABLE(); }
 
-static inline bool pv_map_ldt_shadow_page(unsigned int off) { return false; }
+static inline bool pv_map_ldt_shadow_page(unsigned int offset) { return false; }
 static inline bool pv_destroy_ldt(struct vcpu *v)
 { ASSERT_UNREACHABLE(); return false; }
 
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index 9a8d1b8353cd..60589c3cacee 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -63,7 +63,7 @@ int shadow_enable(struct domain *d, u32 mode);
 
 /* Enable VRAM dirty bit tracking. */
 int shadow_track_dirty_vram(struct domain *d,
-                            unsigned long first_pfn,
+                            unsigned long begin_pfn,
                             unsigned int nr_frames,
                             XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b929d15d0050..0d0d5292953b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4566,7 +4566,7 @@ static int __do_update_va_mapping(
 }
 
 long do_update_va_mapping(
-    unsigned long va, u64 val64, unsigned long flags)
+    unsigned long va, uint64_t val64, unsigned long flags)
 {
     int rc = __do_update_va_mapping(va, val64, flags, current->domain);
 
@@ -4578,7 +4578,7 @@ long do_update_va_mapping(
 }
 
 long do_update_va_mapping_otherdomain(
-    unsigned long va, u64 val64, unsigned long flags, domid_t domid)
+    unsigned long va, uint64_t val64, unsigned long flags, domid_t domid)
 {
     struct domain *pg_owner;
     int rc;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index f2aee5be46a7..f9310d008de6 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -751,7 +751,7 @@ void shadow_promote(struct domain *d, mfn_t gmfn, unsigned int type)
     TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_PROMOTE);
 }
 
-void shadow_demote(struct domain *d, mfn_t gmfn, u32 type)
+void shadow_demote(struct domain *d, mfn_t gmfn, unsigned int type)
 {
     struct page_info *page = mfn_to_page(gmfn);
 
@@ -2615,11 +2615,11 @@ pagetable_t sh_set_toplevel_shadow(struct vcpu *v,
  * Helper invoked when releasing of a top-level shadow's reference was
  * deferred in sh_set_toplevel_shadow() above.
  */
-void shadow_put_top_level(struct domain *d, pagetable_t old_entry)
+void shadow_put_top_level(struct domain *d, pagetable_t old)
 {
-    ASSERT(!pagetable_is_null(old_entry));
+    ASSERT(!pagetable_is_null(old));
     paging_lock(d);
-    sh_put_ref(d, pagetable_get_mfn(old_entry), 0);
+    sh_put_ref(d, pagetable_get_mfn(old), 0);
     paging_unlock(d);
 }
 
diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index 0e938594345a..fc86d7a8d9cd 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -89,11 +89,11 @@ SHADOW_INTERNAL_NAME(sh_paging_mode, GUEST_LEVELS);
 #if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
 extern void
 SHADOW_INTERNAL_NAME(sh_resync_l1, GUEST_LEVELS)
-     (struct vcpu *v, mfn_t gmfn, mfn_t snpmfn);
+     (struct vcpu *v, mfn_t gl1mfn, mfn_t snpmfn);
 
 extern int
 SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, GUEST_LEVELS)
-     (struct vcpu*v, mfn_t gmfn);
+     (struct vcpu*v, mfn_t gl1mfn);
 
 extern int
 SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, GUEST_LEVELS)
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index bc99e00100f7..12cfb52f095b 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -364,11 +364,11 @@ bool  shadow_hash_delete(struct domain *d,
                          unsigned long n, unsigned int t, mfn_t smfn);
 
 /* shadow promotion */
-void shadow_promote(struct domain *d, mfn_t gmfn, u32 type);
-void shadow_demote(struct domain *d, mfn_t gmfn, u32 type);
+void shadow_promote(struct domain *d, mfn_t gmfn, unsigned int type);
+void shadow_demote(struct domain *d, mfn_t gmfn, unsigned int type);
 
 /* Shadow page allocation functions */
-bool __must_check shadow_prealloc(struct domain *d, unsigned int shadow_type,
+bool __must_check shadow_prealloc(struct domain *d, unsigned int type,
                                   unsigned int count);
 mfn_t shadow_alloc(struct domain *d,
                     u32 shadow_type,
@@ -392,11 +392,11 @@ int sh_validate_guest_entry(struct vcpu *v, mfn_t gmfn, void *entry, u32 size);
  * Returns non-zero if we need to flush TLBs.
  * level and fault_addr desribe how we found this to be a pagetable;
  * level==0 means we have some other reason for revoking write access. */
-extern int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
+extern int sh_remove_write_access(struct domain *d, mfn_t gmfn,
                                   unsigned int level,
                                   unsigned long fault_addr);
 #else
-static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
+static inline int sh_remove_write_access(struct domain *d, mfn_t gmfn,
                                          unsigned int level,
                                          unsigned long fault_addr)
 {
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 9961eac187e9..e1aec5a18a54 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -66,7 +66,7 @@
 static int kimage_is_destination_range(struct kexec_image *image,
                                        paddr_t start, paddr_t end);
 static struct page_info *kimage_alloc_page(struct kexec_image *image,
-                                           paddr_t dest);
+                                           paddr_t destination);
 
 static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 {
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d0da2aa28132..7446533c8cfb 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -107,7 +107,7 @@ static int verify_payload(const struct xen_sysctl_livepatch_upload *upload, char
     return 0;
 }
 
-bool is_patch(const void *ptr)
+bool is_patch(const void *addr)
 {
     const struct payload *data;
     bool r = false;
@@ -115,12 +115,12 @@ bool is_patch(const void *ptr)
     rcu_read_lock(&rcu_payload_lock);
     list_for_each_entry_rcu ( data, &payload_list, list )
     {
-        if ( (ptr >= data->rw_addr &&
-              ptr < (data->rw_addr + data->rw_size)) ||
-             (ptr >= data->ro_addr &&
-              ptr < (data->ro_addr + data->ro_size)) ||
-             (ptr >= data->text_addr &&
-              ptr < (data->text_addr + data->text_size)) )
+        if ( (addr >= data->rw_addr &&
+              addr < (data->rw_addr + data->rw_size)) ||
+             (addr >= data->ro_addr &&
+              addr < (data->ro_addr + data->ro_size)) ||
+             (addr >= data->text_addr &&
+              addr < (data->text_addr + data->text_size)) )
         {
             r = 1;
             break;
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 3f5ad01f1bdd..45c8924f3412 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -89,7 +89,7 @@ enum va_type {
  * Function to secure the allocate pages (from arch_livepatch_alloc_payload)
  * with the right page permissions.
  */
-int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type types);
+int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type);
 
 void arch_livepatch_init(void);
 
-- 
2.39.5



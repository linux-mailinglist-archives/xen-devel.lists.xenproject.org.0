Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40EECDA059
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192707.1511859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m4-0001Zo-8M; Tue, 23 Dec 2025 17:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192707.1511859; Tue, 23 Dec 2025 17:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m4-0001Xd-5H; Tue, 23 Dec 2025 17:02:16 +0000
Received: by outflank-mailman (input) for mailman id 1192707;
 Tue, 23 Dec 2025 17:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vY5m2-0000rH-90
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:02:14 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fa0b5d7-e021-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 18:02:11 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so749271366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:02:11 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1306260566b.42.2025.12.23.09.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:10 -0800 (PST)
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
X-Inumbo-ID: 1fa0b5d7-e021-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766509331; x=1767114131; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haLvGCsDO/JizmjiuTr97WlOBT3BtJPjB3KsDGCVV4s=;
        b=FO2NBsjeNihT1dhu26TDuagTEpIziN+/4OC1dZkaZCzwHnFZ4M1cFDrJAsVVn5y7IE
         mHCaYSJ+XaCrIMkjAom+ex5uzkNc+iQXzRf8I/1z2S34b0UxUaHzIwzwSUtIJPHsTpcP
         NmgyK3fdzhD784aUcMEHdJrOGNsVsAVGQXYvh/zPgEfCFGt7SvpM9vkiAI3vxNriGXhA
         NlosxsDzaJjGH1ZnvNzQ+pizp6awkx3vGQjru0hyhCyYCfoRQ+S/jUrTfNdAaIYCWkyc
         G7uyC9Q2rwOCZZP63e+Ve3s2Qd7BVLl4h6b/U75bEiXohXLKEgrKjWF518WF5d9OR52I
         vymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509331; x=1767114131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haLvGCsDO/JizmjiuTr97WlOBT3BtJPjB3KsDGCVV4s=;
        b=cj4Mz+joOLN07r8bRlBGGfdOxdgTHdca7YwqvpHmqFnviYozbv0YoZqyxXNXFez6Sb
         +2sdUVEaDrR88FqFHl80x65tHxg06ocez4PSuavg36/x6HeKACfxzguF8nduObZL9e4G
         KtGCLcBuYrOGzdjfrPyZ5e5EJvN+5/7ziJp+UDMNBAdzJqBSQqB75mYUJTLuAxkZEMDB
         Lvpv9/xDseSSSqsIXiliKBwRIDRERiFcnGmN2TPxVcRg9F93X1Y/4iX+d0VPccXgiPOR
         0FZ/yYJoYujGISo06DTH/x99k795f+9GQ6R6/+WXW+UEITxfAto97x6iRUTPdoPmIkSP
         t8ZA==
X-Gm-Message-State: AOJu0Yyb4cPqqioo0pAXsJjOmC0gpNDJ/+Du4O+CukdSRCq6PfURNMs8
	RdIf3y4yKhE2OqJlPmXnAdkEKjXuruBAUCXtc46czYKUZna9o2vE76MIheqHXA==
X-Gm-Gg: AY/fxX6WVzD+U2uCoIR3Ps9GPHTAlI0A/UeFCOrgSHu4dyyaTSlTnp4/Px5xS0uIVbh
	gWO199ZkRrZTrSn4G7XueXAC6hAe7AjhKAjPZCNUOfc4hVFXSXsR+3YOKC1rFjt04C6G+eRko57
	weWuLIh6Sa1P/baHdsb1uyX1yIQSTPzhxTVcEpBxBcOScJ8WiPZQO5EAbdKp8itL0Z9+OKrbzXf
	iyPMIX+0eDPjGiiTqe4ApFGxDLPYqw+LzFWA7sy0hDZrG5CAME//V6c6lZ/zkBKSjKzJ7ZNbXjL
	fOvFKz2FBlEOQ2R3w402CGnGLMH432UB5awpisihtM9IdKwzwbkxD6iKsQMaKTsYIZqh7JcgMHL
	vO2P+Cv0ba81lo7ZxmHmo1U8NwnBlzU3VWeTQwzx4L8ASLN7HgCkhFjz1fPB2Fmm+rhz3PkDrNp
	DUp7WQrT756QDzjev3orAmxQwvHZL8faM84GRTNoXNuau3qJNZx5z9GtiZX4AOuKtDyg==
X-Google-Smtp-Source: AGHT+IHL7MJPWU9DeYNFy7laCsarytKMy+DXZKU8ixnYu6eCQsucB2E5Eov/WdAD7DcVr/WjYTdlKw==
X-Received: by 2002:a17:907:948d:b0:b7a:1bde:1224 with SMTP id a640c23a62f3a-b80371e921fmr1543243666b.65.1766509330514;
        Tue, 23 Dec 2025 09:02:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 3/4] xen: move alloc/free_vcpu_struct() to common code
Date: Tue, 23 Dec 2025 18:01:57 +0100
Message-ID: <6041657e2309fbc8466050860bcf60d3c3c4d4bc.1766504313.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766504313.git.oleksii.kurochko@gmail.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_vcpu_struct() and free_vcpu_struct() contain little
architecture-specific logic and are suitable for sharing across
architectures. Move both helpers to common code.

To support the remaining architectural differences, introduce
arch_vcpu_struct_memflags(), allowing architectures to override the
memory flags passed to alloc_xenheap_pages(). This is currently needed
by x86, which may require MEMF_bits(32) for HVM guests using shadow
paging.

The ARM implementation of alloc/free_vcpu_struct() is removed and
replaced by the common version. Stub implementations are also dropped
from PPC and RISC-V.

Now that the size of struct vcpu for Arm64 is smaller than PAGE_SIZE,
MAX_PAGES_PER_VCPU is no longer needed and is removed.

Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
common/domain.c, as they are no longer used outside common code.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v4:
 - Move implementation of alloc_vcpu_struct() and free_vcpu_struct() ahead
   of vmtrace_free_buffer().
 - Add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Make from function arch_vcpu_struct_memflags() a macros in asm/domain.h.
 - Drop forward declaration of arch_vcpu_struct_memflags() in asm/domain.h.
 - Update defintion of arch_vcpu_stuct_memflags() in alloc_vcpu_struct().
---
Changes in v2:
 - Rework alloc/free_vcpu_struct() to work with only one page.
 - Return back the comment about the restriction inside x86's
   arch_vcpu_struct_memflags().
 - Drop MAX_PAGES_PER_VCPU.
---
 xen/arch/arm/domain.c             | 32 -------------------------------
 xen/arch/ppc/stubs.c              | 10 ----------
 xen/arch/riscv/stubs.c            | 10 ----------
 xen/arch/x86/domain.c             | 24 -----------------------
 xen/arch/x86/include/asm/domain.h | 12 ++++++++++++
 xen/common/domain.c               | 20 +++++++++++++++++++
 xen/include/xen/domain.h          |  4 ----
 7 files changed, 32 insertions(+), 80 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d935..507df807edb8 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -473,38 +473,6 @@ void dump_pageframe_info(struct domain *d)
 
 }
 
-/*
- * The new VGIC has a bigger per-IRQ structure, so we need more than one
- * page on ARM64. Cowardly increase the limit in this case.
- */
-#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
-#define MAX_PAGES_PER_VCPU  2
-#else
-#define MAX_PAGES_PER_VCPU  1
-#endif
-
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    struct vcpu *v;
-
-    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
-    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
-    if ( v != NULL )
-    {
-        unsigned int i;
-
-        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
-            clear_page((void *)v + i * PAGE_SIZE);
-    }
-
-    return v;
-}
-
-void free_vcpu_struct(struct vcpu *v)
-{
-    free_xenheap_pages(v, get_order_from_bytes(sizeof(*v)));
-}
-
 int arch_vcpu_create(struct vcpu *v)
 {
     int rc = 0;
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 9953ea1c6c08..f7f6e7ed97af 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -152,11 +152,6 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-void free_vcpu_struct(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_vcpu_create(struct vcpu *v)
 {
     BUG_ON("unimplemented");
@@ -264,11 +259,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 unsigned long
 hypercall_create_continuation(unsigned int op, const char *format, ...)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 164fc091b28a..29bdb65afbdf 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -121,11 +121,6 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-void free_vcpu_struct(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_vcpu_create(struct vcpu *v)
 {
     BUG_ON("unimplemented");
@@ -233,11 +228,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 unsigned long
 hypercall_create_continuation(unsigned int op, const char *format, ...)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7632d5e2d62d..c29a6b0decee 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -493,30 +493,6 @@ unsigned int arch_domain_struct_memflags(void)
     return MEMF_bits(bits);
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    struct vcpu *v;
-    /*
-     * This structure contains embedded PAE PDPTEs, used when an HVM guest
-     * runs on shadow pagetables outside of 64-bit mode. In this case the CPU
-     * may require that the shadow CR3 points below 4GB, and hence the whole
-     * structure must satisfy this restriction. Thus we specify MEMF_bits(32).
-     */
-    unsigned int memflags =
-        (is_hvm_domain(d) && paging_mode_shadow(d)) ? MEMF_bits(32) : 0;
-
-    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
-    v = alloc_xenheap_pages(0, memflags);
-    if ( v != NULL )
-        clear_page(v);
-    return v;
-}
-
-void free_vcpu_struct(struct vcpu *v)
-{
-    free_xenheap_page(v);
-}
-
 /* Initialise various registers to their architectural INIT/RESET state. */
 void arch_vcpu_regs_init(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 16cd45cc32c0..effb23a23416 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -15,6 +15,18 @@
 unsigned int arch_domain_struct_memflags(void);
 #define arch_domain_struct_memflags arch_domain_struct_memflags
 
+/*
+ * This structure contains embedded PAE PDPTEs, used when an HVM guest
+ * runs on shadow pagetables outside of 64-bit mode. In this case the CPU
+ * may require that the shadow CR3 points below 4GB, and hence the whole
+ * structure must satisfy this restriction. Thus we specify MEMF_bits(32).
+ */
+#define arch_vcpu_struct_memflags(d) ({                                 \
+    const struct domain *d_ = (d);                                      \
+                                                                        \
+    (is_hvm_domain(d_) && paging_mode_shadow(d_) ? MEMF_bits(32) : 0);  \
+})
+
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
 /*
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 93c71bc766b0..655d9590f846 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -316,6 +316,26 @@ static void vcpu_info_reset(struct vcpu *v)
          : &dummy_vcpu_info);
 }
 
+static struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+#ifndef arch_vcpu_struct_memflags
+# define arch_vcpu_struct_memflags(d) ((void)(d), 0)
+#endif
+    struct vcpu *v;
+
+    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
+    v = alloc_xenheap_pages(0, arch_vcpu_struct_memflags(d));
+    if ( v )
+        clear_page(v);
+
+    return v;
+}
+
+static void free_vcpu_struct(struct vcpu *v)
+{
+    free_xenheap_page(v);
+}
+
 static void vmtrace_free_buffer(struct vcpu *v)
 {
     const struct domain *d = v->domain;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93c8..644f5ac3f293 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -70,10 +70,6 @@ void domid_free(domid_t domid);
 struct domain *alloc_domain_struct(void);
 void free_domain_struct(struct domain *d);
 
-/* Allocate/free a VCPU structure. */
-struct vcpu *alloc_vcpu_struct(const struct domain *d);
-void free_vcpu_struct(struct vcpu *v);
-
 /* Allocate/free a PIRQ structure. */
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *d);
-- 
2.52.0



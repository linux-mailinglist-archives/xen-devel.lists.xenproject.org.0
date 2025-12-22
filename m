Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15830CD6B12
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192199.1511562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixU-0005E5-7t; Mon, 22 Dec 2025 16:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192199.1511562; Mon, 22 Dec 2025 16:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixU-0005CJ-4O; Mon, 22 Dec 2025 16:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1192199;
 Mon, 22 Dec 2025 16:40:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXixS-0004ka-BI
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:40:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece3a45d-df54-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 17:40:29 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b728a43e410so757206666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:40:29 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm1137038366b.60.2025.12.22.08.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:40:28 -0800 (PST)
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
X-Inumbo-ID: ece3a45d-df54-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421629; x=1767026429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiuT8oSvj+MLPsSg+EzFKiW/rD8qP9UmSvVnyWvKe2s=;
        b=WMKtMquiehDvuDQzGKDhqMiqm8Ryy6tTJR4A3C4R4Syn2cq6DRg9O2YazmIYdQtAQn
         Kdi1fekK3zN+ZY9eoFxRmGYkZGIbQR6vwzobloqGun50TxMCDiC/ayov3t+eUMGrsHIL
         ugkvuM9JW/LUDGCUnuyHO2vVkIw4w78USsT+SFNOhiM9h+IoV85L6GyUCd4pJVXaN1G9
         tOg4rZau+3RYL5PoXnM390dnFMRHKle6zgzqFTD7j3YhXnTbRY0zHzvGMJgof057I9wY
         aB0NDjZxJnDLTPgJ2SnqRHGU9xDSB9cLfmnXDMaKsx2X3CTnaTeinxWwF+mmwcvV46m8
         FDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421629; x=1767026429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MiuT8oSvj+MLPsSg+EzFKiW/rD8qP9UmSvVnyWvKe2s=;
        b=g7BfraWBcpeG3QsDKSTwETezZpwi7xk7okNIhjEC0341ptQwzNFNT+hpeHOwPNc2Px
         YnA+Ctz7IDPEJhqnr5FMaco6D1dxNns3u9GS4hXE4Q6z7J3qRDioiJ/6aSoWurrAvEWJ
         u8j/eq98fDggC4sdidkXZ4nKc0fK+RitwEWirqAc65wnc5c7MtHwK7fo9bcOzq5MC1G1
         rUm7k8Q9V4ZEkFWsJyK8hJutxJSmmWZ5XWP/FEfaZnyFoDYEN5xP3y9mpvjkWGzRniXy
         5wU+6e8sDYJUvJz5tJo65ej40/tVJPHkiyFCchIpk3af0o3vsMYmoYe/sb7fFo0BYoOs
         pPew==
X-Gm-Message-State: AOJu0Yyx1dolLSQSo2sNYtht008lzMtpEj+Fp6eD+RSp4AP1PVnLy9hF
	OiXsqxoUh6BJ7KMJ50Ro3ljbsdVlvwQJkSbl1Rjn32I1Ed5zA2mlhVkNhCkiEQ==
X-Gm-Gg: AY/fxX5/bPPFVV4THEZWbI3C8dsxmQtmA6GqizKR9Rz8RTriM1sBvpLc9gr4j6hbzEt
	AevS5vgDNi5wf76fFMkKZLZZ22fksAWJpp89Zk1bk/O6AXFJRHEQIQEeDEr1wPMizvmxnj1/WqH
	f54Vywv76K02LiGPt7xLoo8KhsbZbBls3QN5X7gv+MCga/WYeiCtlXPdFeYQSUFGrxYHdRI0BFU
	Efs96NMkDRUsBVu40AoQFlOfgjo8tFtGiX43Vfi//gmnTU9aae+jl9glULdY0YAe7YCYaRGZah8
	Yxywhtdwq4T3vOR7O1hju0dpn7kbWos4MejZQmmSC26lXGGPNY4sPdAAQmBzPjie5TxcRGV3KFL
	excxJxp0L+g8kH9VULHXBIVPW36IvpGcgiCE7hEswI3wuOy+z5XS9Mdc9q0gYQymLOtrL1c/dOu
	YLOmNLhGrhYzhe4Y5I4ltg0mhO4ZOqWfD/YJJWM4kz/2PSMoHt2FYTuZBpjfOWdQpVwg==
X-Google-Smtp-Source: AGHT+IEW+mCBAx+0gzYpyaeUbRqBMcJTDfKmg9Trf84GxY3NBWOhFrcLZM1qo+piUXdJh3lrvdzIUQ==
X-Received: by 2002:a17:906:2081:b0:b80:411f:aa50 with SMTP id a640c23a62f3a-b80411faa6emr825114466b.48.1766421628360;
        Mon, 22 Dec 2025 08:40:28 -0800 (PST)
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
Subject: [PATCH v3 3/4] xen: move alloc/free_vcpu_struct() to common code
Date: Mon, 22 Dec 2025 17:40:13 +0100
Message-ID: <31208135cc61a8c8e593a286d450c2ec7757d118.1766404618.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766404618.git.oleksii.kurochko@gmail.com>
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
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
index 93c71bc766b0..568a63b7c6a2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -392,6 +392,26 @@ static int vcpu_teardown(struct vcpu *v)
     return 0;
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
 /*
  * Destoy a vcpu once all references to it have been dropped.  Used either
  * from domain_destroy()'s RCU path, or from the vcpu_create() error path
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



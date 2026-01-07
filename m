Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E027ECFEDE3
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196896.1514624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPL-0000Tu-Lr; Wed, 07 Jan 2026 16:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196896.1514624; Wed, 07 Jan 2026 16:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPL-0000Pi-Gk; Wed, 07 Jan 2026 16:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1196896;
 Wed, 07 Jan 2026 16:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWPK-0007tp-KX
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:29:14 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3c6942-ebe5-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:29:11 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so431026466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:29:11 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bcd30sm564782166b.28.2026.01.07.08.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:29:09 -0800 (PST)
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
X-Inumbo-ID: ff3c6942-ebe5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803350; x=1768408150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8UvVrNZgvcTWva9s04sFmSLBrN7YdaYJUEfiGdAX7Q=;
        b=Fiq9mrR/lgPz98g/TOzqFOcc4lh94/nmHbVTSA534A6ZCebDpXD2qEsuoWW2Me7sl6
         1CQBa/8Lg7vrZJoH+LUUqtJ5zV/UTdCPqAVCjZ1VJIbrV8B0ICC12xZgAn50rX497PxP
         LvFHl8SxPGU33I8yuT/SEogmuy0iH+gSABrGFgMkDpB23fFFesSh1VSo8HIY8Kkdlise
         Cn0INJvq4p8FCMXIGtaJuBtKIfKDGh6LeGYt4rXLSWbdxNGi2bj56sbhPCS2DwCV9rox
         2QVUcCCzgVX37y2NywAp8nb+Uy8+yOtf/g+K+9AW1L0wgwQyBwIzb8lKM5ZGRfZiY+5s
         NeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803350; x=1768408150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8UvVrNZgvcTWva9s04sFmSLBrN7YdaYJUEfiGdAX7Q=;
        b=k3dboSc+ah2gydUjNBDMXqiXdndkNMZCvI3Jm97IqkCkpndQHRN2pOiZ8NTVCPsImh
         pCpQYFHZLtoyndQ6thevVXNLMzTpKwHcKsJuEMv8j2BqA3SQg1xVYLBiiRlzJ5NMEa7x
         XCR2U3Ta7b2YjKdANRZnw7gPPIbEH0nNB/mI9vHXobsJ+tTwuvIQTNT/MM3heRSdB8M0
         /MzcdhRyStRNKGCt4udtqywDoqMmrIwvQUNbDyElKeCBTJHlER+6lAOh/Ivueigh5atp
         rvU1e/wgPcAfNFgg9LDQypWxV3z8Ucm5kssC93N4fCauBnjWD0Y+e6x+h9cLHn93Ppyk
         2whw==
X-Gm-Message-State: AOJu0Yy2RC7PpyKaahIlL9DA4EGbCSd2kgLuNS2z3XX8XyeB86q7o+4/
	uXwOX7RpKuukeGjLBPp9KQdsDrE+vfngwM6BJJW7stC6e2P7+kyww5v+apq+sw==
X-Gm-Gg: AY/fxX76T0+J30IGTy/Qt7pDpTzR6VG0usk025yACnHq41PUXOb0QaG8UsVqFzfiAi5
	CVCv5+lR618nMEGu07uBoBEuv8RV8boKT09EE+QdUK6leoS6YEPrb22Q39rcsAA7x4jzuhI4G6e
	yVHnsVTi0+BC+w2/lC/QAM9h9h3ku10fethA8S1ox3Jagm0iHygLSx4DmI7epw3DS7SUKQNIDrJ
	iBr3jEVDuV02BXdhaBHoVxPTA1OGFK4fZlkHBj3o2JGtAm1c/GN9nxHkJEiE+AkjajHo1AKMYLM
	/85Ftt5chz1dTl7diWV3IhtMoyDV/0uQEG9UeMfQI4AY9RGokXDpX4mdo6NErsCjSDn1SgiFE07
	iOPdRriQ/b62FB7HllT9QojWiledQItVQAr100bl8mTMS3xo6zk1m0zrpwTYF9NkVFukjtcDRKC
	XQJVXOWYoOv7R/YjK0BsjQ4KOpQjimXbzpzOUrzpkudV/MOnbcTtQtW2fEhpdgpgH4
X-Google-Smtp-Source: AGHT+IEunqBkiM2UScVpXxO5HUMP2KvMWNBBtele6FJhyy5isAQRlkEX7CZN5hhcYeTwHW/KAZ+nUw==
X-Received: by 2002:a17:907:7b8e:b0:b70:b93c:26cf with SMTP id a640c23a62f3a-b84451edb62mr260971566b.6.1767803350258;
        Wed, 07 Jan 2026 08:29:10 -0800 (PST)
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
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 2/3] xen: move alloc/free_vcpu_struct() to common code
Date: Wed,  7 Jan 2026 17:28:59 +0100
Message-ID: <fa8d4daa1ebb1b27dd9dd56f671bde2aa7beb58a.1767803084.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767803084.git.oleksii.kurochko@gmail.com>
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
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
Changes in v5:
 - Nothing changed. Only rebase.
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
 xen/arch/arm/domain.c             | 17 -----------------
 xen/arch/ppc/stubs.c              | 10 ----------
 xen/arch/riscv/stubs.c            | 10 ----------
 xen/arch/x86/domain.c             | 24 ------------------------
 xen/arch/x86/include/asm/domain.h | 12 ++++++++++++
 xen/common/domain.c               | 20 ++++++++++++++++++++
 xen/include/xen/domain.h          |  4 ----
 7 files changed, 32 insertions(+), 65 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 64b935b68000..507df807edb8 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -473,23 +473,6 @@ void dump_pageframe_info(struct domain *d)
 
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    struct vcpu *v;
-
-    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
-    v = alloc_xenheap_page();
-    if ( v != NULL )
-        clear_page(v);
-
-    return v;
-}
-
-void free_vcpu_struct(struct vcpu *v)
-{
-    free_xenheap_page(v);
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



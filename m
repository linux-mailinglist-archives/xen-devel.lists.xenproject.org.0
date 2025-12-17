Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E77CC72C6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 11:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188714.1509806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVpA0-0004Dq-6u; Wed, 17 Dec 2025 10:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188714.1509806; Wed, 17 Dec 2025 10:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVpA0-0004C8-4E; Wed, 17 Dec 2025 10:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1188714;
 Wed, 17 Dec 2025 10:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVp9y-0004Bj-II
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 10:53:34 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15335c4-db36-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 11:53:33 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b728a43e410so875994866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 02:53:33 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa56be0bsm1865068966b.52.2025.12.17.02.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 02:53:31 -0800 (PST)
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
X-Inumbo-ID: a15335c4-db36-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765968812; x=1766573612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EH5z86K6Jbil6t7qVR+X+tGRnibq25kfK5cXjf9+bN4=;
        b=AYL+Pbozir2GmIxBOEd7tRdQOmtFGjqX+Wlbt1UEpuCBQGla+EhNdY3SF8Zx/VSBcP
         hu/5UH9nl+pGn470GFS/FCEcxenHIYGIc+fTI6ogCdhGpDChwsRWL2Hj/1HuGAePZi6g
         mPjVxBIQ1tOMvXCHqCFAtl9dtnytrEIeSGOutQNwOgcWVts+M8ryypGkDBZTaSQ3k5Wf
         BCNmc1Ld0qIBKQ16M/Bx82kWPMCIMgh/bn134J5yA+Q4Cg3L0qnp1v2e7DnbvIGsJVoK
         YG4uCQ2lCuH/vfJZqevdcJU3HQZrVKAt7ERMGOZcucLY7i75dWf2AiA0yTkROhnEIgVs
         GHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765968812; x=1766573612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH5z86K6Jbil6t7qVR+X+tGRnibq25kfK5cXjf9+bN4=;
        b=sqmDH3RPZc7xwuNXCSAOOemPCpuxh6dekk7aGb1+G3EhQfd9Zw4M3eFnt0e5omvVqc
         u1LYCTvnYXc28J6l5TEBU4TtrYNcTQclxu8vR3wlJAsQpgESQwdcWphSASjksaTV/5vD
         me8SmkSJ+tQH5ShRVFmZv7BQJpRBkzaQj0EMyUWYM+4CSN5lQPd+HegvEDaOA5OfCq+E
         MhAGNLBwI1t7BKw8XDr2nHZ8oqYRGCX32augqt+WdNR74BYl5nsSGjxXUg4+7Ut03WbN
         cba0xw6UY7ysRw8F+EQemyd/yD0H4qwgSQeuHvvsyJalrFgH5mu42br60fNL8z1JGqkw
         ZM0g==
X-Gm-Message-State: AOJu0YwioPI3kkH//A46nUqSt8xjiJ4eBVZsybnUfZmiScRMiq6hkpX3
	5Gyos5z0YWYqxI0L3V1fSUhCJ5ta82xZi73tpwaLNDGyr2OuBl7pPOxiTcQLkg==
X-Gm-Gg: AY/fxX5/1mIMC4mF6W/tiw6Ju2J1L5kZgpO0e9TlB03P5niMfPYU7ycRMNtWr1+S5RF
	2WFyAEDpz3RBIJaFqozMeuLvE0h6FvdPEKTsQlvyhhDdd3JxvMAp7mb8aQapWvMe20vyW+B149U
	mr0NwQjF9VFXOjlVX1dmaDX5Ftr/i1xykNBMVYrs8G+5lwgm39HgAbyXIMTixcm/MkF+MOCmhig
	qSjxv8jmwHOJ50gl1rR7mgo0JFm+ecVcPpMl5Dp3rB2J9QBW2pus00aOwt4SOy3JF7nKGBqrHEc
	kTmFN+4Q5Xtg/BxojD2dsNK2eWqbZH1G+eEuy4YwePATpKzmlQoPl54UWFWU9vm2TpssRqGsHAz
	1MEejl7TWt0dtWigQIWdQykQtkDEP7C4BOrfKP+ngXt2ASFzab5RmVVtk+3Q4S/iIt5kqJ6theO
	Gj8Mr3QktCHduxnGC4HzlG9iaGIxgXHFeyaMKZ35eb9oFtqWenrRqGtT0=
X-Google-Smtp-Source: AGHT+IHCrtPPBwSA2vkPuORfr0s9In4r9oOZVZGSzXi8SQqkCSEwZdJKw0uWcGa9q9pHrbYbX6hwsw==
X-Received: by 2002:a17:907:7f27:b0:b79:c879:fe71 with SMTP id a640c23a62f3a-b7d23a47753mr1776449466b.19.1765968811986;
        Wed, 17 Dec 2025 02:53:31 -0800 (PST)
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
Subject: [PATCH v1] xen: move alloc/free_vcpu_struct() to common code
Date: Wed, 17 Dec 2025 11:53:23 +0100
Message-ID: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Move the definition of MAX_PAGES_PER_VCPU to xen/domain.h and default
it to 1. Retain the ARM64 exception (with CONFIG_NEW_VGIC) where two
pages are required due to larger per-IRQ structures.

The ARM implementation of alloc/free_vcpu_struct() is removed and
replaced by the common version. Stub implementations are also dropped
from PPC and RISC-V.

Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
common/domain.c, as they are no longer used outside common code.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2219693055

Shouldn't we make alloc_domain_struct() and free_domain_struct() static and
drop their declarations from xen/domain.h, since these functions are only
used in common/domain.c?
---
 xen/arch/arm/domain.c             | 32 -------------------------------
 xen/arch/arm/include/asm/domain.h |  8 ++++++++
 xen/arch/ppc/stubs.c              | 10 ----------
 xen/arch/riscv/stubs.c            | 10 ----------
 xen/arch/x86/domain.c             | 23 ++--------------------
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/common/domain.c               | 27 ++++++++++++++++++++++++++
 xen/include/xen/domain.h          |  8 ++++----
 8 files changed, 44 insertions(+), 77 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d9..507df807ed 100644
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
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..f33d886bb8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -12,6 +12,14 @@
 #include <asm/vpl011.h>
 #include <public/hvm/params.h>
 
+/*
+ * The new VGIC has a bigger per-IRQ structure, so we need more than one
+ * page on ARM64. Cowardly increase the limit in this case.
+ */
+#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
+#define MAX_PAGES_PER_VCPU  2
+#endif
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 9953ea1c6c..f7f6e7ed97 100644
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
index fe7d85ee1d..579c4215c8 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -126,11 +126,6 @@ void dump_pageframe_info(struct domain *d)
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
@@ -238,11 +233,6 @@ void vcpu_kick(struct vcpu *v)
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
index 7632d5e2d6..0e3f7de524 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -493,28 +493,9 @@ unsigned int arch_domain_struct_memflags(void)
     return MEMF_bits(bits);
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
+unsigned int arch_vcpu_struct_memflags(const struct domain *d)
 {
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
+    return (is_hvm_domain(d) && paging_mode_shadow(d)) ? MEMF_bits(32) : 0;
 }
 
 /* Initialise various registers to their architectural INIT/RESET state. */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 7e5cbd11a4..576f9202b4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -15,6 +15,9 @@
 unsigned int arch_domain_struct_memflags(void);
 #define arch_domain_struct_memflags arch_domain_struct_memflags
 
+unsigned int arch_vcpu_struct_memflags(const struct domain *d);
+#define arch_vcpu_struct_memflags arch_vcpu_struct_memflags
+
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
 /*
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 93c71bc766..3982d9e466 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -13,6 +13,7 @@
 #include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/domain.h>
+#include <xen/macros.h>
 #include <xen/mm.h>
 #include <xen/event.h>
 #include <xen/vm_event.h>
@@ -392,6 +393,32 @@ static int vcpu_teardown(struct vcpu *v)
     return 0;
 }
 
+static struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+#ifndef arch_vcpu_struct_memflags
+# define arch_vcpu_struct_memflags(d) 0
+#endif
+    struct vcpu *v;
+    unsigned int order = get_order_from_bytes(sizeof(*v));
+
+    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
+    v = alloc_xenheap_pages(order, arch_vcpu_struct_memflags(d));
+    if ( v )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
+            clear_page((void *)v + i * PAGE_SIZE);
+    }
+
+    return v;
+}
+
+static void free_vcpu_struct(struct vcpu *v)
+{
+    free_xenheap_pages(v, get_order_from_bytes(sizeof(*v)));
+}
+
 /*
  * Destoy a vcpu once all references to it have been dropped.  Used either
  * from domain_destroy()'s RCU path, or from the vcpu_create() error path
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93..3946ec9dad 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -15,6 +15,10 @@ struct guest_area {
 
 #include <asm/domain.h>
 
+#ifndef MAX_PAGES_PER_VCPU
+#define MAX_PAGES_PER_VCPU 1
+#endif
+
 typedef union {
     struct vcpu_guest_context *nat;
     struct compat_vcpu_guest_context *cmp;
@@ -70,10 +74,6 @@ void domid_free(domid_t domid);
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



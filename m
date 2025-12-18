Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00043CCCF78
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190023.1510698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHne-0002ld-71; Thu, 18 Dec 2025 17:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190023.1510698; Thu, 18 Dec 2025 17:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHne-0002jE-1m; Thu, 18 Dec 2025 17:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1190023;
 Thu, 18 Dec 2025 17:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHnc-0002UZ-N3
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:28:24 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f48b0c0a-dc36-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 18:28:23 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so1351388a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:28:23 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b53c1sm3209423a12.5.2025.12.18.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 09:28:22 -0800 (PST)
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
X-Inumbo-ID: f48b0c0a-dc36-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078903; x=1766683703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgML6elZQJ93D5kRikMc+0qH5Xjev/s0exSbE8XMmAU=;
        b=CAi+D753uVSo8vlvO9fHbwwQn2qKpoF4SIx6p/MZnZU23JhaE4Cv2ry97xWZgNswN9
         UxG+Cs3Zz4Q4ST6Q8+oaqeYYjWFH0sbSOoTc4cfz4OxeyJxTpH3OYom8Hhn/dExC7SmI
         USwEwN2XIg3qKVbxImSM6IbYY0YVZl2oyipAs24Mv8nKP0U8zwvujtaDcflDaE9mmsxE
         xGIVAmQi+KfgYKDpA7vODouH4aQGMrdHXwfUit1oEaPsfv1O90sn/vMmBMSmLvGnnZGh
         ivuhOQXaaHJ+ftU/iMFsL6jQoaZ6DLdwlof3wBpI3q/YcgByWFjAUhxXkwuXMbZ4yOd1
         xIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078903; x=1766683703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgML6elZQJ93D5kRikMc+0qH5Xjev/s0exSbE8XMmAU=;
        b=i2lqhAvRnI43gt1uAMJN0lxLE9doVaEEh0knBPzeU0A0fz6Az8UtQMPz59n/LlhlIf
         /fW2wryrYkD75MaDjlMs1XkAamX90mQC3xYgsF92UX8VrOcVwbdZCKMM2kfQPh891+h5
         jeGZKdzVE/8fNVhqNEWRFCt0YV0EeiAUDyME5pXyjDjjkPiJ8soTxOHCO34d0Py7roIS
         PVAXdIz8VYgFfs/xqNpRD1oJGg772fq0jCymQOikEKoP5xDdmQLOBlzMCcAlDMNEAbA/
         JLIdaChuwhW8WhoA59HvgPlTaK9g+2kyjBh03dPsDXNsxvqxbP6nTmA7rkqwOZh0/IOD
         gelQ==
X-Gm-Message-State: AOJu0YwKgbj5Dw33KQaBvIq7Ye70la8xWKTVWI8suLbONTLmThf76m7Q
	Xy3B6q/OoFnuWGzR3XGUbA8JGzcweejP1gZNwgPsKN48z0azSgCA+FJXTpYSag==
X-Gm-Gg: AY/fxX7LR6QQXTy/KWDRjCjcEXrgwaaUTGecjbI0UjqOB2Ye6fB5EDCjNPeI8YpffOO
	7XYOSwViMnLSyjVH2cmR66+9FpMTGijNhRFzrfTncI3PHtgWnlS4APl+6AbF6g5VHODiyu5au4V
	hjRjPC+Hf9vHbQb8jBZhtJ5i/qSWNj1m12LwHILSjAtrG01+eJIGyUZkHqkO0NwC6rH6ie1FAOU
	NEMoY5WqcAPW4plbpsFI1o3zvRF85esWvK6b4CyK/E7ihiXyUnU+llAMJ3ru8G/PJ9aIM3r91dD
	JankQlux01MwOQTDgyNnD/fHd6bK+gbP7lV9YmHnlSg/beDyQpzF3gRBUxSSPAicQKT5XASdSkW
	h0SPRTjwzjKH9hjtJfU5K5nrWKcEslkTcZMWWP3T/DSFTa4imd7j1DP322jmvi72PiGnU9XJXlR
	moY+2riUekoyf7eArmYD430TEZ6J1cS7py7OU86IdvMCmD9FOQn15SbjI=
X-Google-Smtp-Source: AGHT+IHUFzaTlWeEsfxKKTDyxE1ri/OL1XU+Ws6Fg1It0P9MKq6FAG4PnEL9q9QmSW8Ji9jWyBNx9g==
X-Received: by 2002:a05:6402:2553:b0:649:9f05:68ce with SMTP id 4fb4d7f45d1cf-64b8ea4b9a4mr178499a12.14.1766078902938;
        Thu, 18 Dec 2025 09:28:22 -0800 (PST)
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
Subject: [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code
Date: Thu, 18 Dec 2025 18:28:08 +0100
Message-ID: <099753603c18bbba0db702746d394c2e77e15a4d.1766053253.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766053253.git.oleksii.kurochko@gmail.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
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

Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
common/domain.c, as they are no longer used outside common code.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/x86/domain.c             | 17 ++---------------
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/common/domain.c               | 20 ++++++++++++++++++++
 xen/include/xen/domain.h          |  4 ----
 7 files changed, 25 insertions(+), 56 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index e566023340..507df807ed 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -473,23 +473,6 @@ void dump_pageframe_info(struct domain *d)
 
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
-{
-    struct vcpu *v;
-
-    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
-    v = alloc_xenheap_pages(0, 0);
-    if ( v )
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
index 7632d5e2d6..68c7503eda 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -493,28 +493,15 @@ unsigned int arch_domain_struct_memflags(void)
     return MEMF_bits(bits);
 }
 
-struct vcpu *alloc_vcpu_struct(const struct domain *d)
+unsigned int arch_vcpu_struct_memflags(const struct domain *d)
 {
-    struct vcpu *v;
     /*
      * This structure contains embedded PAE PDPTEs, used when an HVM guest
      * runs on shadow pagetables outside of 64-bit mode. In this case the CPU
      * may require that the shadow CR3 points below 4GB, and hence the whole
      * structure must satisfy this restriction. Thus we specify MEMF_bits(32).
      */
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
index 93c71bc766..92fc0684fc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -392,6 +392,26 @@ static int vcpu_teardown(struct vcpu *v)
     return 0;
 }
 
+static struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+#ifndef arch_vcpu_struct_memflags
+# define arch_vcpu_struct_memflags(d) 0
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
index 8aab05ae93..644f5ac3f2 100644
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



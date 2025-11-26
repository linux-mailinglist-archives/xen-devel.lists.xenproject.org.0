Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63356C8A59E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172971.1498071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGZU-0000oI-Ht; Wed, 26 Nov 2025 14:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172971.1498071; Wed, 26 Nov 2025 14:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGZU-0000mE-FL; Wed, 26 Nov 2025 14:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1172971;
 Wed, 26 Nov 2025 14:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOGZT-0000m8-SG
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:32:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f581bd-cad4-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:32:38 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b73875aa527so1093860966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:32:38 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4e51sm1910917566b.42.2025.11.26.06.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 06:32:37 -0800 (PST)
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
X-Inumbo-ID: c1f581bd-cad4-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764167558; x=1764772358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih8Jw4ZF1lvkp7QX6BxfjUp1hNpvldIwPDXhORNP4nU=;
        b=aY/+VnCDhGMpig00rXqNoNVCX26PjUobSY2NT8kZmbYc0XSfuhoowW9r4GRWpJD7Dn
         XssVEGlqgw7G4VTmhmG5bqvojFuymvKsqOQwfEH3fv7uX1xMtyoCAQ1CBgtuTrvKRPYF
         dZMVWMq4bLr+kcxrrAFLqx+UrP1PLZO09PzZe5ZQ6ABCHrY5u64BT+16ci9/FGIywG/h
         /QBsjl5m28AlmOoOmU8gBzxif6K4Td8Az/6Us6ZAu/YvBqlzsmmixt+mTbYXOzlZAQfU
         EjgE31nWzvDLbCoDay/JCvw4XiyQ4BjZAlaWPXOBYut0Dz94xUd7GqCMAwhM5NdnsOyZ
         6u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167558; x=1764772358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih8Jw4ZF1lvkp7QX6BxfjUp1hNpvldIwPDXhORNP4nU=;
        b=pT3dqDPSuPLWaPFkNI645sWaSsVqPiwiYEIBWhVAWSMH/QxX3lV9FyveITNlUeNE36
         UlTFaeteeQJ3iJbsu+MNhvgTjN0rmv79r/S9X14KsxS/7C3JPsJJCmxyGurazU/k169C
         yajF4tjdq6O8ALgGTIUknOVjP2EcQS0L68ghFYpAqBLzvhFB7KH8ieVusfRStrgpj6L6
         Jpmnph9jA7+BdVyXUsJSYj+otmG6AYcirmmyuyYbH38fMafPnEljDeNOWB9vJFBXwS0j
         WQW/wSdEIb8OtmTI1mFkx58u1RFtf4tQ4b9Q/fnzYHKSV+g4chnIhZidkmhVBGscUTWY
         pGLQ==
X-Gm-Message-State: AOJu0Yz1ggrhpq78gFYrejcXMIKa/ulTbId85KM6Fcbu2ZcUKKfXFnRA
	8S00pOg3lV3Ybzt+tMTa2VlcFJ2X8sIbKuiN0OYcDCrQdccG0IzlE60OMwQ4Q0pd
X-Gm-Gg: ASbGncuQNi9fnVf/hrGtR+xd2TpITdUjqlKRXSbpsyz/zFnsLFFsxN5hY7jGDxera7H
	X/Mi0pp7EEsk37prEfUgAuqO+6Jr5pPrsWQ+NEqeS2g1x/e5cKH7kT+h3uhwbTSZWxliR1HCYHo
	yGoICo64RqWyu455XcH3+Z96zum4/AKhlFA8kLkMiLYMlUG3JFhTTgHkflyFUyJG2+1KbHDl1PK
	p7Eo/n4EXBJjrcNsCgo6gVlVeBBBfVxba0nkwKjCxUljgdn/dqC7VyDzmxktip1qui23xOaZR+W
	dfgZQWAA5NlCE64QWEFScs54NubUkBzi+D+8OYHVjfu0l0fyqfOTvl/kOEHSbi27ZTkgzPYR5V9
	2yd/1o9noEh6XREKsTOhOk+lm1m/juN4kVdrtFoqNiFMqW9u2d898O3Z07gKhqdhrxZGZ8+uEMj
	aahtoxjOUDdTTfU64PGpbl4TqMAtWICTtssGfjYyUK++t1tC9QQLY=
X-Google-Smtp-Source: AGHT+IFFr1XFNAdmJqexDmyUubFO7nIEbaRx2nmHkzxBsJ0W8r8WsBix/CeEMPT7XTFN7uOSgBVbaQ==
X-Received: by 2002:a17:907:3f1f:b0:b76:36ee:376 with SMTP id a640c23a62f3a-b76718c2fecmr2250735766b.54.1764167557616;
        Wed, 26 Nov 2025 06:32:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2] xen/domain: introduce generic functions for domain struct allocation and freeing
Date: Wed, 26 Nov 2025 15:32:29 +0100
Message-ID: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

Move x86's free_domain_struct() to common code since it is shared between
architectures.

Move the x86 version of alloc_domain_struct() to common code as most of the
logic is architecture-independent. To handle the remaining architectural
differences, introduce arch_alloc_domain_struct_bits() for x86-specific
allocation requirements.

No functional change.

Suggested-By: Jan Beulich <jbeulich@suse.com>
[Introduce an arch-specific function instead of using a weak function]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
- CI test results: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2180836457
- Introduce an arch-specific function to handle differences between arch-es
  in domain structure allocation requirements, instead of relying on a weak
  function.
- Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
- Move free_domain_struct() to common code.
- Update the commit message.
---
 xen/arch/arm/domain.c                | 17 -----------------
 xen/arch/ppc/stubs.c                 | 10 ----------
 xen/arch/riscv/stubs.c               | 10 ----------
 xen/arch/x86/domain.c                | 15 ++-------------
 xen/arch/x86/include/asm/pv/domain.h |  3 +++
 xen/common/domain.c                  | 23 +++++++++++++++++++++++
 6 files changed, 28 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index ab78444335..3e3a1fb9f5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -480,23 +480,6 @@ void startup_cpu_idle_loop(void)
     reset_stack_and_jump(idle_loop);
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    struct domain *d;
-    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
-    d = alloc_xenheap_pages(0, 0);
-    if ( d == NULL )
-        return NULL;
-
-    clear_page(d);
-    return d;
-}
-
-void free_domain_struct(struct domain *d)
-{
-    free_xenheap_page(d);
-}
-
 void dump_pageframe_info(struct domain *d)
 {
 
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 75ebcae5e2..9953ea1c6c 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -147,11 +147,6 @@ void startup_cpu_idle_loop(void)
     BUG_ON("unimplemented");
 }
 
-void free_domain_struct(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void dump_pageframe_info(struct domain *d)
 {
     BUG_ON("unimplemented");
@@ -269,11 +264,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    BUG_ON("unimplemented");
-}
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 340ed3cd6c..fe7d85ee1d 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -121,11 +121,6 @@ void startup_cpu_idle_loop(void)
     BUG_ON("unimplemented");
 }
 
-void free_domain_struct(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void dump_pageframe_info(struct domain *d)
 {
     BUG_ON("unimplemented");
@@ -243,11 +238,6 @@ void vcpu_kick(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-struct domain *alloc_domain_struct(void)
-{
-    BUG_ON("unimplemented");
-}
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3a21e035f4..34a02f089e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -463,10 +463,8 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-struct domain *alloc_domain_struct(void)
+unsigned int arch_alloc_domain_struct_bits(void)
 {
-    struct domain *d;
-
     /*
      * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
      * a 32-bit field within the page_info structure. Hence the MEMF_bits()
@@ -492,16 +490,7 @@ struct domain *alloc_domain_struct(void)
                 - 1;
 #endif
 
-    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
-    d = alloc_xenheap_pages(0, MEMF_bits(bits));
-    if ( d != NULL )
-        clear_page(d);
-    return d;
-}
-
-void free_domain_struct(struct domain *d)
-{
-    free_xenheap_page(d);
+    return bits;
 }
 
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 582d004051..6e65bc22fc 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -18,6 +18,9 @@ extern int8_t opt_pv32;
 # define opt_pv32 false
 #endif
 
+unsigned int arch_alloc_domain_struct_bits(void);
+#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits
+
 /*
  * PCID values for the address spaces of 64-bit pv domains:
  *
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3b6e9471c4..b51ce375df 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -799,6 +799,29 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
+struct domain *alloc_domain_struct(void)
+{
+    struct domain *d;
+    unsigned int bits = 0;
+
+#ifdef arch_alloc_domin_struct_bits
+    bits = arch_alloc_domin_struct_bits();
+#endif
+
+    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
+
+    d = alloc_xenheap_pages(0, MEMF_bits(bits));
+    if ( d != NULL )
+        clear_page(d);
+
+    return d;
+}
+
+void free_domain_struct(struct domain *d)
+{
+    free_xenheap_page(d);
+}
+
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              unsigned int flags)
-- 
2.52.0



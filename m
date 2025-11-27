Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A3EC8F810
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174221.1499185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeoy-0007bq-Rp; Thu, 27 Nov 2025 16:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174221.1499185; Thu, 27 Nov 2025 16:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeoy-0007ZB-P1; Thu, 27 Nov 2025 16:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1174221;
 Thu, 27 Nov 2025 16:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOeox-0007Yx-O0
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:26:15 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caf355f5-cbad-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 17:26:14 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso1935826a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 08:26:14 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59aed2esm200287966b.42.2025.11.27.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:26:13 -0800 (PST)
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
X-Inumbo-ID: caf355f5-cbad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260774; x=1764865574; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UIbt55aKHwY/AfOsK7AJoYny1T+sEH4KAoXf2wbYSo=;
        b=IsuVgxoBoBQrPSzx7yblE/TCTexw3yhFORvpZZ0axXPgI4S6b86whV+/0+5KFuY8Xc
         iAbjwagKlqdSon/zy2AWgnlDFqZWQjq6EbBSYNN4Flcdk3eesSnq+XAFwKn4WxxqHiXB
         g+Uw9aHBY0I27KqudhEl7MsEqDUWOAqUiSNe3B/lQMHp0Aa/62tJJZqhgLzGlkH8f8OX
         Mv26V02xt4PHddsgQiO8sWRs3I0EkycwtNZ5y5qr03/ii2jJdvIXoShQhvpxA2EGaRep
         h+XzCljj3rIlac1TRMcWJNams29Ia9hZrWef0EnhBejIn5dgX3wusA9QUWDMlxHsl6U5
         Bf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260774; x=1764865574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UIbt55aKHwY/AfOsK7AJoYny1T+sEH4KAoXf2wbYSo=;
        b=COjqA+HTPCEc10RaD9iMEKI4uz7mjEXocj4UdNp5mtC1GQhW1DOCXZh59WAiJ8PFp/
         9Jeh5E/rQ0nXZarRIp3sBmWLfrmAf9iCT2aehpnacvpDCunX4yPXeI5szl++Lbd7bhFr
         ZShkg8VeoN8Wjsy3Mhy8i5DS+cbCApBejI46Agv+7Zy9mQ0PMZtbx/nhDUZeed4xMDhn
         SDJJ76M7PtZPHqKOK47Y2UeWnfyeHvX5Bn9XZfhJj2buYX69/RZMyi4fRWxsS751NAYz
         2+J7nNylQw8D11ADVWR9rasccHvmDqg0i+ywOmIXmL2+wEw9Fl4PT9+ai84P5krU0ynl
         hjlg==
X-Gm-Message-State: AOJu0YxssqKMgIWy8dHiWC1TdAxSMvJNVn36Bk7guZ9VAthiC8dSJYVO
	/B7bDyBbDN3jyDZWDHY/SEckR9LQXTqYDIle+DX0ZkxvLrHEIRkT5J4TJSrhfJkD
X-Gm-Gg: ASbGncs5rPwxHIx58df1Z1GrJ8sCuyFDLOcSVs63YQvfka3qYzPoFy6eSm7zsVYWQHn
	sQa8IoZzYMebktSe67xmtIway1pVxhv9glrGkHzPetWbpi3emOC+jNg48TRp8m2GryAMg91W0DG
	C7b+zuG1Fxxxl2Q1RPK3gwngmi604G4SXWrQ1UuZPSV0vDpLNGuDlCpeGcdQVhebxSjrzh93Yz7
	W0jIuJbpNXgRA2X00pxN0LCQVQWwJBWKW1SUabf8rK7aX+6kfEOOGoPvqQpt7eQ3EVD7w3+vOMh
	loFIZShSzWDB18O19bZaGuorrzq015YUzO72CEGJEdCHd+81BdZVcpWvcVVI0PlMmV6dyvjkyC1
	G2DPdoTR1mNZKA+DfHBatM3Ne/Ir/w/JLjxU09t0YHn1dOP3V2URWyKqfDpg2iala15cMvAQaWr
	39WD2wy7vgzN2ajJfmAU+KlI58YGHPJK8ZZ+2rj5cHX98AQ6/UwLbLFMdm3Kw2SKM6OA==
X-Google-Smtp-Source: AGHT+IHc/ChIK1CfPvdw6qr+IGe1QslpiwcagJaMPHmv3ukTJvGZ2AhSKSLqMSY80jUi5wktrPJIGA==
X-Received: by 2002:a17:907:7212:b0:b73:8bd4:8fa with SMTP id a640c23a62f3a-b7671688896mr2470673066b.3.1764260773341;
        Thu, 27 Nov 2025 08:26:13 -0800 (PST)
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
Subject: [PATCH v3] xen/domain: introduce generic functions for domain struct allocation and freeing
Date: Thu, 27 Nov 2025 17:26:05 +0100
Message-ID: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

Move x86's free_domain_struct() to common code since it is shared between
architectures.

Move the x86 version of alloc_domain_struct() to common code as most of the
logic is architecture-independent. To handle the remaining architectural
differences, introduce arch_domain_struct_memflags() for x86-specific
allocation requirements.

No functional change.

Suggested-by: Jan Beulich <jbeulich@suse.com>
[Introduce an arch-specific function instead of using a weak function]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/arch_alloc_domain_struct_bits/arch_domain_struct_memflags.
 - Make x86's arch_domain_struct_memflags() to return MEMF_bits(bits) instead
   of bits.
 - Move "#define arch_domain_struct_memflags arch_domain_struct_memflags"
   and declaration of arch_domain_struct_memflags() from x86/asm/pv/domain.h
   to x86/domain.h.
 - Update alloc_domain_struct() to work with arch_domain_struct_memflags().
 - s/Suggested-By/Suggested-by.
 - CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2182821111
---
Changes in v2:
- Introduce an arch-specific function to handle differences between arch-es
  in domain structure allocation requirements, instead of relying on a weak
  function.
- Move free_domain_struct() to common code.
- Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
- Update the commit message.
- Link to original patch:
  https://lore.kernel.org/xen-devel/c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com/
---
 xen/arch/arm/domain.c             | 17 -----------------
 xen/arch/ppc/stubs.c              | 10 ----------
 xen/arch/riscv/stubs.c            | 10 ----------
 xen/arch/x86/domain.c             | 15 ++-------------
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/common/domain.c               | 22 ++++++++++++++++++++++
 6 files changed, 27 insertions(+), 50 deletions(-)

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
index 3a21e035f4..42643c8813 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -463,10 +463,8 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-struct domain *alloc_domain_struct(void)
+unsigned int arch_domain_struct_memflags(void)
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
+    return MEMF_bits(bits);
 }
 
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5df8c78253..386ec61745 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -12,6 +12,9 @@
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
 
+unsigned int arch_domain_struct_memflags(void);
+#define arch_domain_struct_memflags arch_domain_struct_memflags
+
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
 /*
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3b6e9471c4..2e8d74cbd9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -799,6 +799,28 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
+struct domain *alloc_domain_struct(void)
+{
+#ifndef arch_domain_struct_memflags
+# define arch_domain_struct_memflags() 0
+#endif
+
+    struct domain *d;
+
+    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
+
+    d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
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



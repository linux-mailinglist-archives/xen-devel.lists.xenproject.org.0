Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0369C9AD9A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 10:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176029.1500589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQMfX-0003MW-Fs; Tue, 02 Dec 2025 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176029.1500589; Tue, 02 Dec 2025 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQMfX-0003L5-D2; Tue, 02 Dec 2025 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1176029;
 Tue, 02 Dec 2025 09:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nxws=6I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQMfV-0003Kz-Ks
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 09:27:33 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2058afee-cf61-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 10:27:31 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42e2e628f8aso981462f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 01:27:31 -0800 (PST)
Received: from fedora (cust-east-par-46-193-78-210.cust.wifirst.net.
 [46.193.78.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca78f77sm31629696f8f.32.2025.12.02.01.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 01:27:29 -0800 (PST)
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
X-Inumbo-ID: 2058afee-cf61-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764667650; x=1765272450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjHH7CcLaXAazXvtIJiaWKciM+74jmvT7IKSepF/+zY=;
        b=VTztwFpL06yK21l/J1fxFkuqL/iLqtGbxgS03d51dXZzkQsc8ASpRMVS5q+vAQOPLd
         kZZ+WFzaiPgu4k0SiGxhW2KdNPzZCAfI4A3/6tGyWjyJMuVqWPLG54woRmh0AwqO6PAu
         me289ZY4QkdOJShNC1bCsd1Pz6Wd2RQA8WiiAECzAk0NpXIlbWB1uKkdSbcZwqA5XIoi
         URh6l7CI6KLRF+cQz5btXNqeCgmgdAgIlLDqGMIwmUBCamsMwXDGYRd5qHUK0qRJPBjS
         rLtiva+Lyqv0NMEqakvJ8w5d+mZR4wuDURQAd/dwZ+GuOUgxJ3LJqrEwRilBFkdeuFyo
         yowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667650; x=1765272450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjHH7CcLaXAazXvtIJiaWKciM+74jmvT7IKSepF/+zY=;
        b=WWO/MLH3u+8jOd5BzkhYlSd4ICmwni11C7QUFY0UFCkhHTNT9sOte9ERDeD0dMXRJ4
         FeWdavUXXtnhY5jlu9VJ+YdD0qry8GTyIhsGk5locUxx9HW+GZPXCPnSzarH2qqDARpJ
         eTD2FkPovl0MiYx+cGBD2tcjxISpky27Hcop5zEi/C5bNIaKiH9FU2ajqprVQB0fzBlM
         9AmdzO1LnDNPke63MYEfjCldz+Ud5+nsB+K1ffIYocAU5e/j+xBq45wbwF7bfRiB7Ufl
         wvO3PZ6znp6chlRXr4r4ZyO/ny7IHa9Zlg9zGK9PuyCo4by/klbtfDQLbulqgN8CWhRC
         13CQ==
X-Gm-Message-State: AOJu0YzTT2jUetmSDky2cuH6mClnCaiSITfn9Xw60YKCmW1Y715vHeDZ
	6XW4j+DQLb1AAVhnw40BDUA5+6UcHBsiatMrujsYIrWM3aMGqThvVegsUxVs4x8WPFU=
X-Gm-Gg: ASbGncvn4Z1XSEHw2fzmOOcJteg32d5lxNvCGvYAZaOcGW1ewo8jkIF2xnp45jAFWC/
	W1xXIqjLZyTBVDbUlmmMMbSa72Yo2Iz76DTERcs2X5KGvO4Iucom/uhDxoAqJsLpzfk2/HEPKSk
	PsRuuL+vukE6clAumZcBF6ZiYJk/dtP06tIkAobsKjwe8H52sZ/E64LO4iOD4wDt7Dsh/Sw6UbP
	t2KqBYaQcfAlCCGPWQtrSOv4VG6HISDwCkNrPzms5Aj8BYZundCDYJCNveqDWC5xtu9MFhMByor
	gUjilcgHqtV707fqrbPYp6p04VqjFLBoYoCqXQIIETD0tdTqAcw0jyOXOLZVPvn+soKoKTK0NYd
	AROZxBebHMrlEIi7+o9MbJMfN6oZ4HGisTnkkyv658OMv/HjGAwfgFbCZLHIHNQh+EAZdtvmlQ4
	TOwLon0wFaNi3smWSx5pND/ZDclBhQcuvHlwiU6LE3LH7SaKLWoqBF3wzdDQrKr+KeP9o=
X-Google-Smtp-Source: AGHT+IF4G1iy1x5X4O2ZLkn5e4L7S3otJ7JdiPBy3sK7vFHS3GEYNfya5/8l11UnHHnwESs7jBwCaA==
X-Received: by 2002:a05:6000:381:b0:429:bca4:6b3c with SMTP id ffacd0b85a97d-42e0f1e3555mr33705139f8f.9.1764667650169;
        Tue, 02 Dec 2025 01:27:30 -0800 (PST)
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
Subject: [PATCH v4] xen/domain: introduce generic functions for domain struct allocation and freeing
Date: Tue,  2 Dec 2025 10:27:18 +0100
Message-ID: <be5ac1646fca57c2cc5838d367955bf849c4858c.1764584967.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CI tests:
 https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2188761305
---
Changes in v4:
 - Use alloc_xenheap_pages() as variable initializer of 'd' variable.
 - Drop "!= NULL" from if condtition inside alloc_domain_struct().
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/arch_alloc_domain_struct_bits/arch_domain_struct_memflags.
 - Make arch_domain_struct_memflags() to return MEMF_bits(bits) instead of
   bits.
 - Move "#define arch_domain_struct_memflags arch_domain_struct_memflags"
   and declaration of arch_domain_struct_memflags() from x86/asm/pv/domain.h
   to x86/domain.h.
 - Update alloc_domain_struct() to work with arch_domain_struct_memflags().
 - s/Suggested-By/Suggested-by.
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
 xen/common/domain.c               | 21 +++++++++++++++++++++
 6 files changed, 26 insertions(+), 50 deletions(-)

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
index 3b6e9471c4..b9128a2883 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -799,6 +799,27 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
+struct domain *alloc_domain_struct(void)
+{
+#ifndef arch_domain_struct_memflags
+# define arch_domain_struct_memflags() 0
+#endif
+
+    struct domain *d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
+
+    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
+
+    if ( d )
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



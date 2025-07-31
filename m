Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFFBB16E9D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065153.1430528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaC-00015u-AQ; Thu, 31 Jul 2025 09:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065153.1430528; Thu, 31 Jul 2025 09:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaC-00011X-2E; Thu, 31 Jul 2025 09:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1065153;
 Thu, 31 Jul 2025 09:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPaA-0000Xx-5u
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:14 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad5793be-6df0-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:28:11 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4589c1f55aeso1083915e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:12 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:10 -0700 (PDT)
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
X-Inumbo-ID: ad5793be-6df0-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954091; x=1754558891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjoD2P+3wNjCYfSx0cXvlWq3oxFY+cd+qHnmaUvvT5M=;
        b=kchWp1GWHjPAZgzHduU3Ymk1kCM8ZUmTw6ZLjorbkcQjHCBHJHypJTMlPBSchAPPX2
         cZay+jwk+D7zIIvYlpRdpu7wOUZr0A9LN1dES++lw0FCv7WSvof0pqahd9OHF317g73b
         SYOfAkXqPlSbqggKM+K9QPZnzWQrR5qfBj05VBwcvwOjNKHhPNVw+2WQP9PnOei+Fwor
         4tn0tmDCovX6lCz8+g+TISOlX0PFvIAbHaAPy7nkbuexMvjzg29b7euTWH5nf/kdRJWU
         uXjv/1eczofQf3j9rw04Vdfwdnl5/Px7pTXXlTs7wRlQHQak9VY5E3+zHazpzJYOFSJY
         Rnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954091; x=1754558891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjoD2P+3wNjCYfSx0cXvlWq3oxFY+cd+qHnmaUvvT5M=;
        b=ATMyoesSBYgsbsaS7wJfovAQybjahr86lB/Gv9M7ZXDoEUaWpwbj2uiCxn+vfDhTYt
         yjd2Kb7P1o2mXnEeHqSQtiYLRon/XQtlNh3sDMz89hGjmpeAlFgOtGEbLATnbfZ37RWR
         as7ouuh0R1TPmjWCXaIEpz9I9YzBSMp7v0eNeN6JYiFoOc4agoSJhoeK19avsWHUGpaf
         jFZR5pY8DVK0aeentbASSFZJQXMxGbImgkSwdLcZwoy6sD2MURW7tnS2sskVwNeehvgE
         dd1/tTPGYp1LKSUBfDMOfOiJIvvOhMLGom/toxExNKLYFknyC9dlpZJH06sHTxjaIBBh
         SVCg==
X-Gm-Message-State: AOJu0YyieM2STN0CaIAjvS07XGDRsScjTwBkkI52+p5DE0FEKzqm6zJe
	RKNr4lkvUAkMle//v4uS/+G5pb+hOngFw1qZd07g9YmLRsB2+Bp2eUDBTQ8dKisK
X-Gm-Gg: ASbGncs9up2ktAbD9iGnEARw0xyLub2UWnFxVq7CvdZkidN2yDammLomuiPfXo2odLV
	Xc6k6RgMfgcYefCJzUdGFFuPnSxdEmaeXnUcOLFQxc3L/3Ry7oSJ9OqkNQD6rB9UfTIHmuzxk/o
	g8qXmSzbgGWuP1RfW22wGVKBzXxgD0VcSMQzSURUHX0cRW+7P3eeOh9Y9yd0CaEkw4mc3eZpEx4
	SaCtwyDiEdkj+/K35GJc78XZXYmpsYsHBsJEh3Mw+tZOfo8cJmhe5xoEoDpVDdwJ+DexJOgKXXD
	m+zxRi37eRMenISmKtG5HybO+PPZbskEldy7BaWjRJq6ps2LWAkf6UVi1fYBUvyAgWvwaY1Qv3X
	JQrpwDrjE9t5NohK8lnlImUBiBk/c/89rwmj0Enfxjf7wtgXc6AdABRF6F5ohZ9wO/rFATOZ3Iy
	ITQaO286QOp3hRniRVnjvX+A==
X-Google-Smtp-Source: AGHT+IFE42O0Q2I03F/zd8FXLOCSlUrOZY1rpSlgzu/DxYc+QgmyPZQVl69FqqkRkmgOE80eDCXgcg==
X-Received: by 2002:a05:600c:348c:b0:456:4bb5:c956 with SMTP id 5b1f17b1804b1-4589df74a34mr11657105e9.7.1753954090909;
        Thu, 31 Jul 2025 02:28:10 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v12 3/6] xen: Make the maximum number of altp2m views configurable for x86
Date: Thu, 31 Jul 2025 09:27:58 +0000
Message-Id: <d8ce4bd614e240aebc2dd09930af0c2c474acf50.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit introduces the ability to configure the maximum number of altp2m
views for the domain during its creation. Previously, the limits were hardcoded
to a maximum of 10. This change allows for greater flexibility in environments
that require more or fewer altp2m views.

The maximum configurable limit for nr_altp2m on x86 is now set to
MAX_NR_ALTP2M (which currently holds the MAX_EPTP value - 512). This cap is
linked to the architectural limit of the EPTP-switching VMFUNC, which supports
up to 512 entries. Despite there being no inherent need for limiting nr_altp2m
in scenarios not utilizing VMFUNC, decoupling these components would necessitate
substantial code changes.

xen_domctl_createdomain::altp2m is extended for a new field `nr`, that will
configure this limit for a domain. Additionally, previous altp2m.opts value
has been reduced from uint32_t to uint16_t so that both of these fields occupy
as little space as possible.

Accesses to the altp2m_p2m array are modified to respect the new nr_altp2m
value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
these arrays always have fixed size of MAX_EPTP.

Additional sanitization is introduced in the x86/arch_sanitise_domain_config
to fix the altp2m.nr value to 10 if it is previously set to 0. This behavior
is only temporary and immediately removed in the upcoming commit (which will
disallow creating a domain with enabled altp2m with zero nr_altp2m).

The reason for this temporary workaround is to retain the legacy behavior
until the feature is fully activated in libxl.

Also, arm/arch_sanitise_domain_config is extended to not allow requesting
non-zero altp2ms.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/domain.c             |  2 +-
 xen/arch/x86/domain.c             | 40 ++++++++++++++---
 xen/arch/x86/hvm/hvm.c            |  8 +++-
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/include/asm/altp2m.h | 28 ++++++++++--
 xen/arch/x86/include/asm/domain.h |  9 ++--
 xen/arch/x86/include/asm/p2m.h    |  4 +-
 xen/arch/x86/mm/altp2m.c          | 72 ++++++++++++++++---------------
 xen/arch/x86/mm/hap/hap.c         |  6 +--
 xen/arch/x86/mm/mem_access.c      | 20 +++------
 xen/arch/x86/mm/mem_sharing.c     |  4 +-
 xen/arch/x86/mm/p2m-ept.c         |  7 +--
 xen/arch/x86/mm/p2m-pt.c          |  2 +
 xen/arch/x86/mm/p2m.c             |  8 ++--
 xen/common/domain.c               |  6 +++
 xen/include/public/domctl.h       |  5 ++-
 xen/include/xen/sched.h           |  4 ++
 17 files changed, 149 insertions(+), 78 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..863ae18157 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -693,7 +693,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m.opts )
+    if ( config->altp2m.opts || config->altp2m.nr )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..155ea1f79f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -716,16 +716,42 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( altp2m_mode && nested_virt )
+    if ( altp2m_mode )
     {
-        dprintk(XENLOG_INFO,
-                "Nested virt and altp2m are not supported together\n");
-        return -EINVAL;
-    }
+        if ( !hvm_altp2m_supported() )
+        {
+            dprintk(XENLOG_INFO, "altp2m is not supported\n");
+            return -EINVAL;
+        }
+
+        if ( !hap )
+        {
+            dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
+            return -EINVAL;
+        }
+
+        if ( nested_virt )
+        {
+            dprintk(XENLOG_INFO,
+                    "Nested virt and altp2m are not supported together\n");
+            return -EINVAL;
+        }
+
+        if ( !config->altp2m.nr )
+        {
+            /* Fix the value to the legacy default */
+            config->altp2m.nr = 10;
+        }
 
-    if ( altp2m_mode && !hap )
+        if ( config->altp2m.nr > MAX_NR_ALTP2M )
+        {
+            dprintk(XENLOG_INFO, "altp2m.nr must be <= %lu\n", MAX_NR_ALTP2M);
+            return -EINVAL;
+        }
+    }
+    else if ( config->altp2m.nr )
     {
-        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
+        dprintk(XENLOG_INFO, "altp2m.nr must be zero when altp2m is off\n");
         return -EINVAL;
     }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 1881c8ac52..b4ccb7e7fb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4675,6 +4675,12 @@ static int do_altp2m_op(
         goto out;
     }
 
+    if ( d->nr_altp2m == 0 )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
     if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
         goto out;
 
@@ -5275,7 +5281,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     if ( !hvm_is_singlestep_supported() )
         return;
 
-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= v->domain->nr_altp2m )
         return;
 
     v->arch.hvm.single_step = true;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 64f0dbbd4a..f7a2eecca4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4974,7 +4974,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;
 
-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->nr_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index c57a8c5588..8ecd74f363 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -13,12 +13,32 @@
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
 #include <asm/hvm/vcpu.h>      /* for vcpu_altp2m */
 
+static inline bool altp2m_is_eptp_valid(const struct domain *d,
+                                        unsigned int idx)
+{
+    /* There must be enough EPTP entries to cover all altp2m indices */
+    BUILD_BUG_ON(MAX_EPTP < MAX_NR_ALTP2M);
+
+    /* Domain should not have more altp2m entries than MAX_NR_ALTP2M */
+    ASSERT(d->nr_altp2m <= MAX_NR_ALTP2M);
+
+    /* EPTP index is used as altp2m index */
+    return idx < d->nr_altp2m &&
+        d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
+        mfn_x(INVALID_MFN);
+}
+
 /* Alternate p2m HVM on/off per domain */
 static inline bool altp2m_active(const struct domain *d)
 {
     return d->arch.altp2m_active;
 }
 
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return vcpu_altp2m(v).p2midx;
+}
+
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
@@ -26,11 +46,13 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+#else
+
+static inline bool altp2m_is_eptp_valid(const struct domain *d,
+                                        unsigned int idx)
 {
-    return vcpu_altp2m(v).p2midx;
+    return false;
 }
-#else
 
 static inline bool altp2m_active(const struct domain *d)
 {
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8749c5eba0..02a00e1c07 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -258,11 +258,12 @@ struct paging_vcpu {
     struct shadow_vcpu shadow;
 };
 
-#define MAX_NESTEDP2M 10
+#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
+#define MAX_NR_ALTP2M   MAX_EPTP
+#define MAX_NESTEDP2M   10
 
-#define MAX_ALTP2M      10 /* arbitrary */
 #define INVALID_ALTP2M  0xffff
-#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
+
 struct p2m_domain;
 struct time_scale {
     int shift;
@@ -354,7 +355,7 @@ struct arch_domain
 #ifdef CONFIG_ALTP2M
     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
-    struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
+    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 5ce0dc936f..3b860e30c3 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -903,7 +903,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;
 
-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->nr_altp2m);
 
     return v->domain->arch.altp2m_p2m[index];
 }
@@ -913,7 +913,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;
 
-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->nr_altp2m);
 
     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 6fe1e9ed6b..0261360aae 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -9,12 +9,16 @@
 #include <asm/altp2m.h>
 #include <public/hvm/hvm_op.h>
 #include <xen/event.h>
+#include <xen/xvmalloc.h>
 #include "mm-locks.h"
 #include "p2m.h"
 
 void
 altp2m_vcpu_initialise(struct vcpu *v)
 {
+    if ( !v->domain->nr_altp2m )
+        return;
+
     if ( v != current )
         vcpu_pause(v);
 
@@ -32,6 +36,9 @@ altp2m_vcpu_destroy(struct vcpu *v)
 {
     struct p2m_domain *p2m;
 
+    if ( !v->domain->nr_altp2m )
+        return;
+
     if ( v != current )
         vcpu_pause(v);
 
@@ -122,7 +129,12 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
     mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    d->arch.altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->arch.altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -143,7 +155,7 @@ void p2m_teardown_altp2m(struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m;
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( !d->arch.altp2m_p2m[i] )
             continue;
@@ -151,6 +163,8 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    XVFREE(d->arch.altp2m_p2m);
 }
 
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
@@ -200,7 +214,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     altp2m_list_lock(d);
@@ -306,8 +320,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;
 
-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < d->nr_altp2m);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(p2m);
 
@@ -332,7 +346,7 @@ void p2m_flush_altp2m(struct domain *d)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -348,9 +362,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;
 
-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);
 
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
     hostp2m = p2m_get_hostp2m(d);
 
     p2m_lock(p2m);
@@ -388,7 +402,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     altp2m_list_lock(d);
@@ -415,7 +429,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -437,7 +451,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;
 
-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= d->nr_altp2m )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -450,7 +464,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -475,7 +489,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -510,13 +524,11 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;
 
-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( !altp2m_is_eptp_valid(d, idx) )
         return rc;
 
     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -572,7 +584,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -595,7 +607,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->nr_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -659,12 +671,11 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 
     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, sve->view) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
     }
 
     p2m_lock(host_p2m);
@@ -727,12 +738,11 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 
     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
     else
         p2m = host_p2m;
@@ -761,13 +771,7 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
 
     altp2m_list_lock(d);
 
-    /*
-     * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
-     */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc = -EINVAL;
     else if ( visible )
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 384c24028f..4aec98109d 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -516,7 +516,7 @@ int hap_enable(struct domain *d, u32 mode)
             d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
         }
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
             if ( rv != 0 )
@@ -541,7 +541,7 @@ void hap_final_teardown(struct domain *d)
 
 #ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
 #endif
 
@@ -595,7 +595,7 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 0779c41161..e6b609064c 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -351,12 +351,10 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -409,12 +407,10 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -474,12 +470,10 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
 #endif
 
@@ -496,7 +490,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..4787b27964 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -901,6 +901,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
     if ( !page || is_special_page(page) )
         goto out;
 
+#ifdef CONFIG_ALTP2M
     /* Check if there are mem_access/remapped altp2m entries for this page */
     if ( altp2m_active(d) )
     {
@@ -912,7 +913,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         altp2m_list_lock(d);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             ap2m = d->arch.altp2m_p2m[i];
             if ( !ap2m )
@@ -929,6 +930,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         altp2m_list_unlock(d);
     }
+#endif /* CONFIG_ALTP2M */
 
     /* Try to convert the mfn to the sharable type */
     ret = page_make_sharable(d, page, expected_refcnt, validate_only);
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ae262bfcc2..b854a08b4c 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1302,7 +1302,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m;
 
@@ -1576,7 +1576,8 @@ void __init setup_ept_dump(void)
 #ifdef CONFIG_ALTP2M
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m =
+        d->arch.altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
@@ -1595,7 +1596,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 666abd46be..5a6ce2f8bc 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -519,12 +519,14 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
     struct p2m_domain *p2m = p2m_get_hostp2m(current->domain);
     int rc;
 
+#ifdef CONFIG_ALTP2M
     /*
      * Should altp2m ever be enabled for NPT / shadow use, this code
      * should be updated to make use of the active altp2m, like
      * ept_handle_misconfig().
      */
     ASSERT(!altp2m_active(current->domain));
+#endif
 
     p2m_lock(p2m);
     rc = do_recalc(p2m, PFN_DOWN(gpa));
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 5a3fda903e..e802f2e4e6 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -106,7 +106,7 @@ void p2m_change_entry_type_global(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -152,7 +152,7 @@ bool p2m_memory_type_changed(struct domain *d)
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -939,7 +939,7 @@ void p2m_change_type_range(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -1015,7 +1015,7 @@ int p2m_finish_type_change(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629e..104e917f07 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -822,6 +822,12 @@ struct domain *domain_create(domid_t domid,
     if ( config )
     {
         d->options = config->flags;
+#ifdef CONFIG_ALTP2M
+        d->nr_altp2m = config->altp2m.nr;
+#else
+        ASSERT(!config->altp2m.nr);
+#endif
+
         d->vmtrace_size = config->vmtrace_size;
     }
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 0c75d9d27f..8f6708c0a7 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -116,7 +116,10 @@ struct xen_domctl_createdomain {
 /* Altp2m mode signaling uses bits [0, 1]. */
 #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
 #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-        uint32_t opts;
+        uint16_t opts;
+
+        /* Number of altp2ms to permit. */
+        uint16_t nr;
     } altp2m;
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index df23411869..a59965b606 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -619,6 +619,10 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;
 
+#ifdef CONFIG_ALTP2M
+    unsigned int nr_altp2m;    /* Number of altp2m tables. */
+#endif
+
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */
 
 #ifdef CONFIG_ARGO
-- 
2.34.1



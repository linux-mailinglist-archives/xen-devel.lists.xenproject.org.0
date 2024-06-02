Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993C8D77B3
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734560.1140707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRY-0000zH-Vj; Sun, 02 Jun 2024 20:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734560.1140707; Sun, 02 Jun 2024 20:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRY-0000wE-Q2; Sun, 02 Jun 2024 20:04:40 +0000
Received: by outflank-mailman (input) for mailman id 734560;
 Sun, 02 Jun 2024 20:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRX-0007mz-Ue
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5727d16e-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:38 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35dcd34a69bso2430744f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:38 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:36 -0700 (PDT)
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
X-Inumbo-ID: 5727d16e-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358677; x=1717963477; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVTFox30KwHLP/OtWq0mLQ/t5mCblNfzOg7TaHqw2bw=;
        b=emz1xUD/5PnrdKZBt+GsbD23012FWwlFwlUFBfTsYIT0m43F5+s4yTGhjKLZLr9psC
         UyzN8JZyciT/rEX0EOgxLABrSXQgliPtIWe4sV/nRPOdIbn93dUAsmHZ6X0e//ugUa31
         fZRs/4X2rJxUOY6M6sl93LaLgKS5W0fD5bxDBsHDyaVbuwGq41NK128wcL4jmYbFoDsC
         UeYdKss8zASwmSsxEcK8OPKq9ePUApe8ed7pjixoaPiwpuAZoigEJ1wxEULkFlQlkqHQ
         e2a+J75Y7zw83rmqSVZGx88fsdVC5jj1lvgk3Zcs4MflOVbl9+pTozIouIwvvdQ69oda
         e2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358677; x=1717963477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVTFox30KwHLP/OtWq0mLQ/t5mCblNfzOg7TaHqw2bw=;
        b=KFO6R2wQuBtCvveC9mwgOOWaaFkZqh8+PIRbgivi09686ZWgEhVafWKmb9HheoWtOi
         qMLb5R18K0eJ+xwGZNdNMbbn5e20mChz1kQb8lc4oR4rHmLdnMRw6F5iEtrog2XZ8jF6
         ar9T/iFDSMrRw2wsfXKENEIhAupF7gyHGdwU7CX+znCjm9G/yn2wt5PHjlZFSJ9qO1no
         FxPCNUQm2uGE12JCHr2bBFyk8qMlQ2jsAJOBm1MwS+qD1Hj3iCd6uJeMtZW7EfvU9bSl
         x84HEuTHxDCQn5s44bc0kDD6Qh/1SCEpHRQ5gtaLh+vg8qqQ4DdOsPKFi9YsU3nHxp6Q
         VXAA==
X-Gm-Message-State: AOJu0Yz3qFx2vch5aRno918jLH8Z6T6KBz9nsPjEwmlqyIUdty+s6W/S
	QMSIvGMDvW1RDNDZ0GK9pwURXDWQMnudOy/cLMlQYvyHSn3agwY9Cp75DXTr
X-Google-Smtp-Source: AGHT+IFfWW1mzFYkEfS5aJQ0OAMKzDVsGxqM2GlbwhRTwd4ipwqab+yoixf+R+8smKTOTCLHm5k4JA==
X-Received: by 2002:a5d:6e5e:0:b0:354:faf4:fa87 with SMTP id ffacd0b85a97d-35e0f2590e5mr4052405f8f.3.1717358677173;
        Sun, 02 Jun 2024 13:04:37 -0700 (PDT)
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
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m views configurable for x86
Date: Sun,  2 Jun 2024 20:04:20 +0000
Message-Id: <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

x86: Make the maximum number of altp2m views configurable

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

altp2m_get_p2m() function is modified to respect the new nr_altp2m value.
Accessor functions that operate on EPT arrays are unmodified, since these
arrays always have fixed size of MAX_EPTP.

A dummy hvm_altp2m_supported() function is introduced for non-HVM builds, so
that the compilation won't fail for them.

Additional sanitization is introduced in the x86/arch_sanitise_domain_config
to fix the altp2m.nr value to 10 if it is previously set to 0. This behavior
is only temporary and immediately removed in the upcoming commit (which will
disallow creating a domain with enabled altp2m with zero nr_altp2m).

The reason for this temporary workaround is to retain the legacy behavior
until the feature is fully activated in libxl.

Also, arm/arch_sanitise_domain_config is extended to not allow requesting
non-zero altp2ms.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/arm/domain.c              |  2 +-
 xen/arch/x86/domain.c              | 40 ++++++++++++++++++----
 xen/arch/x86/hvm/hvm.c             |  8 ++++-
 xen/arch/x86/hvm/vmx/vmx.c         |  2 +-
 xen/arch/x86/include/asm/altp2m.h  |  2 +-
 xen/arch/x86/include/asm/domain.h  |  9 ++---
 xen/arch/x86/include/asm/hvm/hvm.h |  5 +++
 xen/arch/x86/include/asm/p2m.h     |  4 +--
 xen/arch/x86/mm/altp2m.c           | 54 ++++++++++++++++++++----------
 xen/arch/x86/mm/hap/hap.c          |  8 ++---
 xen/arch/x86/mm/mem_access.c       |  8 ++---
 xen/arch/x86/mm/mem_sharing.c      |  2 +-
 xen/arch/x86/mm/p2m-ept.c          |  4 +--
 xen/arch/x86/mm/p2m.c              |  8 ++---
 xen/common/domain.c                |  1 +
 xen/include/public/domctl.h        |  5 ++-
 xen/include/xen/sched.h            |  2 ++
 17 files changed, 113 insertions(+), 51 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 5234b627d0..e5785d2d96 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -688,7 +688,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

-    if ( config->altp2m.opts )
+    if ( config->altp2m.opts || config->altp2m.nr )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bb5ba8fc1e..011cffb07e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -724,16 +724,42 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

-    if ( altp2m_mode && nested_virt )
+    if ( altp2m_mode )
     {
-        dprintk(XENLOG_INFO,
-                "Nested virt and altp2m are not supported together\n");
-        return -EINVAL;
-    }
+        if ( nested_virt )
+        {
+            dprintk(XENLOG_INFO,
+                    "Nested virt and altp2m are not supported together\n");
+            return -EINVAL;
+        }
+
+        if ( !hap )
+        {
+            dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
+            return -EINVAL;
+        }
+
+        if ( !hvm_altp2m_supported() )
+        {
+            dprintk(XENLOG_INFO, "altp2m is not supported\n");
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
index a66ebaaceb..3d0357a0f8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4657,6 +4657,12 @@ static int do_altp2m_op(
         goto out;
     }

+    if ( d->nr_altp2m == 0 )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
     if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
         goto out;

@@ -5245,7 +5251,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     if ( !hvm_is_singlestep_supported() )
         return;

-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= v->domain->nr_altp2m )
         return;

     v->arch.hvm.single_step = true;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a420d452b3..9292a2c8d8 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4885,7 +4885,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;

-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->nr_altp2m; ++i )
             {
                 if ( altp2m_get_eptp(currd, i) == mfn_x(INVALID_MFN) )
                     continue;
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 2f064c61a2..a4cc3d3ffc 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -22,7 +22,7 @@ static inline bool altp2m_active(const struct domain *d)
 static inline struct p2m_domain *altp2m_get_p2m(const struct domain* d,
                                                 unsigned int idx)
 {
-    return d->arch.altp2m_p2m[array_index_nospec(idx, MAX_ALTP2M)];
+    return d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 }

 static inline uint64_t altp2m_get_eptp(const struct domain* d,
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182b..855e844bed 100644
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
@@ -353,7 +354,7 @@ struct arch_domain

     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
-    struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
+    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 1c01e22c8e..277648dd18 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -828,6 +828,11 @@ static inline bool hvm_hap_supported(void)
     return false;
 }

+static inline bool hvm_altp2m_supported(void)
+{
+    return false;
+}
+
 static inline bool hvm_nested_virt_supported(void)
 {
     return false;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index e6f7764f9f..a1094fc7b3 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -887,7 +887,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;

-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->nr_altp2m);

     return altp2m_get_p2m(v->domain, index);
 }
@@ -898,7 +898,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
     struct p2m_domain *orig;
     struct p2m_domain *ap2m;

-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->nr_altp2m);

     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 7fb1738376..d47277e5e5 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -15,6 +15,11 @@
 void
 altp2m_vcpu_initialise(struct vcpu *v)
 {
+    struct domain *d = v->domain;
+
+    if ( d->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -30,8 +35,12 @@ altp2m_vcpu_initialise(struct vcpu *v)
 void
 altp2m_vcpu_destroy(struct vcpu *v)
 {
+    struct domain *d = v->domain;
     struct p2m_domain *p2m;

+    if ( d->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

     mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->arch.altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m;

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    if ( !d->arch.altp2m_p2m )
+        return;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( !d->arch.altp2m_p2m[i] )
             continue;
@@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    XFREE(d->arch.altp2m_p2m);
 }

 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
@@ -200,7 +219,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -306,7 +325,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;

-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);
     p2m = altp2m_get_p2m(d, idx);

     p2m_lock(p2m);
@@ -332,7 +351,7 @@ void p2m_flush_altp2m(struct domain *d)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         altp2m_set_eptp(d, i, mfn_x(INVALID_MFN));
@@ -348,7 +367,7 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;

-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);

     p2m = altp2m_get_p2m(d, idx);
     hostp2m = p2m_get_hostp2m(d);
@@ -388,7 +407,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -414,7 +433,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             continue;
@@ -436,7 +455,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;

-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -471,7 +490,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -506,8 +525,7 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;

-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         altp2m_get_eptp(d, idx) == mfn_x(INVALID_MFN) )
+    if ( idx >= d->nr_altp2m || altp2m_get_eptp(d, idx) == mfn_x(INVALID_MFN) )
         return rc;

     hp2m = p2m_get_hostp2m(d);
@@ -567,7 +585,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -590,7 +608,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->nr_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
@@ -654,7 +672,7 @@ int p2m_set_suppress_ve_multi(struct domain *d,

     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( sve->view >= d->nr_altp2m ||
              altp2m_get_eptp(d, sve->view) == mfn_x(INVALID_MFN) )
             return -EINVAL;

@@ -721,7 +739,7 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,

     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

@@ -756,9 +774,9 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,

     /*
      * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
+     * d->nr_altp2m.
      */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( altp2m_idx >= d->nr_altp2m ||
          altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
         rc = -EINVAL;
     else if ( visible )
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 8fc8348152..8b23792a0d 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -515,7 +515,7 @@ int hap_enable(struct domain *d, u32 mode)
             altp2m_set_visible_eptp(d, i, mfn_x(INVALID_MFN));
         }

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             rv = p2m_alloc_table(altp2m_get_p2m(d, i));
             if ( rv != 0 )
@@ -538,8 +538,8 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;

     if ( hvm_altp2m_supported() )
-        for ( i = 0; i < MAX_ALTP2M; i++ )
-            p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
+        for ( i = 0; i < d->nr_altp2m; i++ )
+            p2m_teardown(altp2m_get_p2m(d, i), true, NULL);

     /* Destroy nestedp2m's first */
     for (i = 0; i < MAX_NESTEDP2M; i++) {
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             p2m_teardown(altp2m_get_p2m(d, i), false, preempted);
             if ( preempted && *preempted )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 43f3a8c2aa..669a0d0a54 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,7 +347,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

@@ -402,7 +402,7 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

@@ -464,7 +464,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

@@ -483,7 +483,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m = altp2m_get_p2m(d, i);

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 21ac361111..2139d13009 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -912,7 +912,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,

         altp2m_list_lock(d);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             ap2m = altp2m_get_p2m(d, i);
             if ( !ap2m )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ed4252822e..f90c82f89b 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1293,7 +1293,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m;

@@ -1519,7 +1519,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 30a44441ba..380b7ece9c 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -105,7 +105,7 @@ void p2m_change_entry_type_global(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
@@ -140,7 +140,7 @@ void p2m_memory_type_changed(struct domain *d)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
@@ -913,7 +913,7 @@ void p2m_change_type_range(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
@@ -986,7 +986,7 @@ int p2m_finish_type_change(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 67cadb7c3f..776442cec0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -610,6 +610,7 @@ struct domain *domain_create(domid_t domid,
     if ( config )
     {
         d->options = config->flags;
+        d->nr_altp2m = config->altp2m.nr;
         d->vmtrace_size = config->vmtrace_size;
     }

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index dea399aa8e..056bbc82a2 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -103,7 +103,10 @@ struct xen_domctl_createdomain {
 /* Altp2m mode signaling uses bits [0, 1]. */
 #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
 #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-        uint32_t opts;
+        uint16_t opts;
+
+        /* Number of altp2ms to allocate. */
+        uint16_t nr;
     } altp2m;

     /* Per-vCPU buffer size in bytes.  0 to disable. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 2dcd1d1a4f..7119f3c44f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -610,6 +610,8 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;

+    unsigned int nr_altp2m;    /* Number of altp2m tables */
+
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */

 #ifdef CONFIG_ARGO
--
2.34.1



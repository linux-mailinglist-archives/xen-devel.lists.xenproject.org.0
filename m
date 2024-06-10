Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C55C902781
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737473.1143851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXt-00027i-Kc; Mon, 10 Jun 2024 17:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737473.1143851; Mon, 10 Jun 2024 17:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXt-000216-DR; Mon, 10 Jun 2024 17:11:01 +0000
Received: by outflank-mailman (input) for mailman id 737473;
 Mon, 10 Jun 2024 17:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXr-0000kp-JU
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67c7a0ed-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:58 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so90853a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:58 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:57 -0700 (PDT)
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
X-Inumbo-ID: 67c7a0ed-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039458; x=1718644258; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ow/yFJlrc5q1U2MI32twYDrNyr1fDFVzZ03MnavAp8U=;
        b=A04P+wT/NXVQza/VIdGz5R9yNUg1fs+ffz4AsUdpJSx+3EFS23Rk9zD+OUWkbc4wa3
         zEdb7nVXDrUGOlmkOesEYZzH1FeXZqaiqazzWbrPWngyFL5cZyJIoNhkNer6D1hCS10+
         H2LVmKvC/BcMXRAX559aF5b5gfT4KHntbW5IGIpMji0AtNQHWG+YfRP379emIRfZz868
         uEtR/oeWU8vFoGJxpHVCZ03sgWcym88dJx/O0/gJjtATOU2s5Y86LYVJxkzDHTwlsi1T
         jchoOFbQKQQLUGyUft8PMFNiwywx5agMXsH52z/FCB5eTw4IWuMmCZ8b5lmHmRQJBxdQ
         MWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039458; x=1718644258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow/yFJlrc5q1U2MI32twYDrNyr1fDFVzZ03MnavAp8U=;
        b=iMz0TlIj17/Nv8CNSREplq5B84+79SY1rbXRpK2raYNT2O9x9YbAQoPzjqyEVh7Mku
         FaMaLKbjny1UuEsqCcpumJ5Ryib2CLzIriq1sizvBNuOj/vwIBHuhPZBH6SvaRWkjMrF
         D237JECkbU0912MohPMdhIB/oAMid/aO7PDUWJ7C2sYYD8CnT/ZRrp+jvVopUfBz4Oi3
         yhXVC0lgTOeI+prWNbyMMvNsfWaigs1xJnQBs5Bi7FLa4sZOSCm7U6tVDNH/KsOOM2OT
         LdkeDfvhIDLDg/BiJkZ+mIdGgIVjZl82jxQ6zKHnF0HSsy+a4u1/7pzcZulyrFynZKk2
         zXEA==
X-Gm-Message-State: AOJu0YwUUv9Z/9XDEa3EuzQZhcmI4Wq03yHYJwvbv+yZ9Efyy9jy98OZ
	ha07n6gbiUMsSdHaINK5T3bBT9lV998rgG91ZdeECXbv0VQ83BP5BJcVXUcQ
X-Google-Smtp-Source: AGHT+IE7RG/p/Fg6RKtMzYJqkZN7lo2Zux5OHR0D2sOPf1CEXxSjuKlH/wc2Kky/Jqp+Rh9x/vh2aw==
X-Received: by 2002:a50:9e06:0:b0:57a:2a46:701 with SMTP id 4fb4d7f45d1cf-57c50902d83mr5874821a12.19.1718039457578;
        Mon, 10 Jun 2024 10:10:57 -0700 (PDT)
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
Subject: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m views configurable for x86
Date: Mon, 10 Jun 2024 17:10:44 +0000
Message-Id: <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
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
 xen/arch/x86/domain.c              | 40 +++++++++++++++----
 xen/arch/x86/hvm/hvm.c             |  8 +++-
 xen/arch/x86/hvm/vmx/vmx.c         |  2 +-
 xen/arch/x86/include/asm/domain.h  |  9 +++--
 xen/arch/x86/include/asm/hvm/hvm.h |  5 +++
 xen/arch/x86/include/asm/p2m.h     |  4 +-
 xen/arch/x86/mm/altp2m.c           | 64 +++++++++++++++++++-----------
 xen/arch/x86/mm/hap/hap.c          |  6 +--
 xen/arch/x86/mm/mem_access.c       | 14 +++----
 xen/arch/x86/mm/mem_sharing.c      |  2 +-
 xen/arch/x86/mm/p2m-ept.c          |  7 ++--
 xen/arch/x86/mm/p2m.c              |  8 ++--
 xen/common/domain.c                |  1 +
 xen/include/public/domctl.h        |  5 ++-
 xen/include/xen/sched.h            |  2 +
 16 files changed, 121 insertions(+), 58 deletions(-)

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
index a4f2e7bad1..faec09e15e 100644
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
index f16faa6a61..8548044278 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4885,7 +4885,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;

-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->nr_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
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
index c1478ffc36..3bf4ce0782 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -886,7 +886,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;

-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->nr_altp2m);

     return v->domain->arch.altp2m_p2m[index];
 }
@@ -896,7 +896,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;

-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->nr_altp2m);

     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 6fe1e9ed6b..4ad24de714 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -15,6 +15,9 @@
 void
 altp2m_vcpu_initialise(struct vcpu *v)
 {
+    if ( v->domain->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -32,6 +35,9 @@ altp2m_vcpu_destroy(struct vcpu *v)
 {
     struct p2m_domain *p2m;

+    if ( v->domain->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -122,7 +128,12 @@ int p2m_init_altp2m(struct domain *d)
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
@@ -143,7 +154,10 @@ void p2m_teardown_altp2m(struct domain *d)
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
@@ -151,6 +165,8 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    XFREE(d->arch.altp2m_p2m);
 }

 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
@@ -200,7 +216,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -306,8 +322,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;

-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < d->nr_altp2m);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];

     p2m_lock(p2m);

@@ -332,7 +348,7 @@ void p2m_flush_altp2m(struct domain *d)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -348,9 +364,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;

-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);

-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
     hostp2m = p2m_get_hostp2m(d);

     p2m_lock(p2m);
@@ -388,7 +404,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -415,7 +431,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -437,7 +453,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;

-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -450,7 +466,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];

         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -475,7 +491,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -510,13 +526,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;

-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( idx >= d->nr_altp2m ||
          d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         return rc;

     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];

     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -572,7 +588,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -595,7 +611,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->nr_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -659,12 +675,13 @@ int p2m_set_suppress_ve_multi(struct domain *d,

     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( sve->view >= d->nr_altp2m ||
              d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
     }

     p2m_lock(host_p2m);
@@ -727,12 +744,13 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,

     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
     else
         p2m = host_p2m;
@@ -763,9 +781,9 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,

     /*
      * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
+     * d->nr_altp2m.
      */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( altp2m_idx >= d->nr_altp2m ||
          d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         rc = -EINVAL;
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde24..501fd9848b 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -515,7 +515,7 @@ int hap_enable(struct domain *d, u32 mode)
             d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
         }

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
             if ( rv != 0 )
@@ -538,7 +538,7 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;

     if ( hvm_altp2m_supported() )
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);

     /* Destroy nestedp2m's first */
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 60a0cce68a..f98408d187 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,12 +347,12 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }

     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
@@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }

     p2m_lock(p2m);
@@ -466,12 +466,12 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= d->nr_altp2m ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }

     return _p2m_get_mem_access(p2m, gfn, access);
@@ -486,7 +486,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m = d->arch.altp2m_p2m[i];

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..83bb9dd5df 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -912,7 +912,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,

         altp2m_list_lock(d);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             ap2m = d->arch.altp2m_p2m[i];
             if ( !ap2m )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index f83610cb8c..69fce28d73 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1293,7 +1293,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m;

@@ -1500,7 +1500,8 @@ void setup_ept_dump(void)

 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m =
+        d->arch.altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;

@@ -1519,7 +1520,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e7e327d6a6..ac1d3685f0 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -105,7 +105,7 @@ void p2m_change_entry_type_global(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -140,7 +140,7 @@ void p2m_memory_type_changed(struct domain *d)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -913,7 +913,7 @@ void p2m_change_type_range(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -986,7 +986,7 @@ int p2m_finish_type_change(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
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



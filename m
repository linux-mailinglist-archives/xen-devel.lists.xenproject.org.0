Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995D68C7538
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723179.1127819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHg-0007c3-D4; Thu, 16 May 2024 11:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723179.1127819; Thu, 16 May 2024 11:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHg-0007Wf-8g; Thu, 16 May 2024 11:28:28 +0000
Received: by outflank-mailman (input) for mailman id 723179;
 Thu, 16 May 2024 11:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHf-0006b6-65
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:27 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69306036-1377-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:28:26 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5a0013d551so163905766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:25 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:24 -0700 (PDT)
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
X-Inumbo-ID: 69306036-1377-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858905; x=1716463705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwSyWpfwO+8Pp/PIuWiuZytsATZP0WHIz6nOkOvuXw0=;
        b=SuKNqkuXZTyq0Ytp4vwfYKZtYacJ4esIyj7DcJT06Dc1qJvAHl8cnJ3CGJV2tlt2Mi
         o6hQox7g8TdrDvvhO29fKKiEvO8sMGGsVhyvLmnezXQoXO+Eahze2CSGuoO7PwSNvNzt
         huoti5yjdKaVWjdS+9PK/7HZPOZzBSg5RKNlPd+utsSsuSBZ2vMbbKPcq1AL1GRBwPBW
         NRi/phnkCG36oV+uvLfsM9z+5UudkkXR5pQjTEz56OySuZOQENYga8c3IbqsCHOwz47g
         PQvQApPUz2RnSh6f1oZYLTmYubKbD3Up5Zk4I3hlox4Pn4z2S48vXuESMzIG8Re3IWCQ
         HqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858905; x=1716463705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwSyWpfwO+8Pp/PIuWiuZytsATZP0WHIz6nOkOvuXw0=;
        b=xGzsTEUShujKnNwi685L6tKgg3xOIiDH3OJpxzDqzxvWmrJd7ViVKaKLFT+Dj7Ad7x
         3vx42g0vViICYUDZQrzCcZROjosMaT5dkG8Re9pFtmIpxYm5NmdGNsngs41VN9SZZndG
         93Z+7P/UrlrPXWaxhhEBv+ZtGoa4fkIcgiTbxKcGAPe/vra3Ry3N9mcupo1LTrDo6rt6
         rkPGMCG5FHtKsH1UFMAbeQHM5OVt/PE7u2kT3BWZhcHiuIfiQxAZFAJCdYIyeIM+/jJN
         kIRbA2fRCZdsy7KJNPn3C1G0OzL2aJ2WeDxK8QpHofk/6jiYTSj5n4QqTaIWDG+lyJYt
         a2iQ==
X-Gm-Message-State: AOJu0YyHjimPGP7eT6xYNaWmvSeipCXj1mBYq3MJIL/nwbkds0nUBt8m
	7fSeKFc+UxKvFe8LzmJjxbA3J5BtHnQVkhjnC3sLD95z5hVsaHq3OYoNnSqH
X-Google-Smtp-Source: AGHT+IFeOFO64ZLbiZ4i/uTkzx634CIh9FArxl5qsmEwaJ0WEcvuPBin44FpZpdKvWhzkF38fATy5Q==
X-Received: by 2002:aa7:c35a:0:b0:574:b106:57db with SMTP id 4fb4d7f45d1cf-574b1065a14mr13248546a12.21.1715858904921;
        Thu, 16 May 2024 04:28:24 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH for-4.19? v3 4/6] x86: Make the maximum number of altp2m views configurable
Date: Thu, 16 May 2024 11:28:11 +0000
Message-Id: <b6bf7e5ba0deab4550b9d15c327015fe7d94d463.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit introduces the ability to configure the maximum number of altp2m
views for the domain during its creation. Previously, the limits were hardcoded
to a maximum of 10. This change allows for greater flexibility in environments
that require more or fewer altp2m views.

The maximum configurable limit for max_altp2m on x86 is now set to MAX_EPTP
(512). This cap is linked to the architectural limit of the EPTP-switching
VMFUNC, which supports up to 512 entries. Despite there being no inherent need
for limiting max_altp2m in scenarios not utilizing VMFUNC, decoupling these
components would necessitate substantial code changes.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/domain.c             | 12 +++++
 xen/arch/x86/hvm/hvm.c            |  8 +++-
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/include/asm/domain.h |  7 ++-
 xen/arch/x86/include/asm/p2m.h    |  4 +-
 xen/arch/x86/mm/altp2m.c          | 23 +++++++++-
 xen/arch/x86/mm/hap/hap.c         |  6 +--
 xen/arch/x86/mm/mem_access.c      | 23 ++++------
 xen/arch/x86/mm/mem_sharing.c     |  2 +-
 xen/arch/x86/mm/p2m-ept.c         | 10 ++--
 xen/arch/x86/mm/p2m.c             | 76 +++++++++++++++----------------
 xen/common/domain.c               |  1 +
 xen/include/public/domctl.h       |  5 +-
 xen/include/xen/sched.h           |  2 +
 14 files changed, 108 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 00a3aaa576..3bd18cb2d0 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -685,6 +685,18 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

+    if ( config->nr_altp2m && !hvm_altp2m_supported() )
+    {
+        dprintk(XENLOG_INFO, "altp2m requested but not available\n");
+        return -EINVAL;
+    }
+
+    if ( config->nr_altp2m > MAX_EPTP )
+    {
+        dprintk(XENLOG_INFO, "nr_altp2m must be <= %lu\n", MAX_EPTP);
+        return -EINVAL;
+    }
+
     if ( config->vmtrace_size )
     {
         unsigned int size = config->vmtrace_size;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9594e0a5c5..77e4016bdb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4639,6 +4639,12 @@ static int do_altp2m_op(
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

@@ -5228,7 +5234,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     if ( !hvm_is_singlestep_supported() )
         return;

-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= v->domain->nr_altp2m )
         return;

     v->arch.hvm.single_step = true;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 5f67a48592..76ee09b701 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4888,7 +4888,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;

-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->nr_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182b..3935328781 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -258,11 +258,10 @@ struct paging_vcpu {
     struct shadow_vcpu shadow;
 };

-#define MAX_NESTEDP2M 10
-
-#define MAX_ALTP2M      10 /* arbitrary */
 #define INVALID_ALTP2M  0xffff
 #define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
+#define MAX_NESTEDP2M   10
+
 struct p2m_domain;
 struct time_scale {
     int shift;
@@ -353,7 +352,7 @@ struct arch_domain

     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
-    struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
+    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 111badf89a..6faa105baf 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -881,7 +881,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;

-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->nr_altp2m);

     return v->domain->arch.altp2m_p2m[index];
 }
@@ -891,7 +891,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;

-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->nr_altp2m);

     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index a04297b646..98dbb50d47 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -13,6 +13,11 @@
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

@@ -28,8 +33,12 @@ altp2m_vcpu_initialise(struct vcpu *v)
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

@@ -120,7 +129,12 @@ int p2m_init_altp2m(struct domain *d)
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
@@ -141,7 +155,10 @@ void p2m_teardown_altp2m(struct domain *d)
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
@@ -149,6 +166,8 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    XFREE(d->arch.altp2m_p2m);
 }

 /*
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
index 60a0cce68a..015b93447a 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,12 +347,11 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( altp2m_idx >= d->nr_altp2m ||
+             d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[altp2m_idx];
     }

     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
@@ -403,12 +402,11 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( altp2m_idx >= d->nr_altp2m ||
+             d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[altp2m_idx];
     }

     p2m_lock(p2m);
@@ -466,12 +464,11 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( altp2m_idx >= d->nr_altp2m ||
+             d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[altp2m_idx];
     }

     return _p2m_get_mem_access(p2m, gfn, access);
@@ -486,7 +483,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
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
index f83610cb8c..90b50a0fcf 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1293,7 +1293,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m;

@@ -1500,15 +1500,15 @@ void setup_ept_dump(void)

 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;

     p2m->ept.ad = hostp2m->ept.ad;
     ept = &p2m->ept;
     ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
-    d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
-    d->arch.altp2m_visible_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
+    d->arch.altp2m_eptp[i] = ept->eptp;
+    d->arch.altp2m_visible_eptp[i] = ept->eptp;
 }

 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
@@ -1519,7 +1519,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index eb7996170d..a178645c69 100644
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
@@ -1780,7 +1780,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -1886,8 +1886,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;

-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < d->nr_altp2m);
+    p2m = d->arch.altp2m_p2m[idx];

     p2m_lock(p2m);

@@ -1912,7 +1912,7 @@ void p2m_flush_altp2m(struct domain *d)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -1928,9 +1928,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;

-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);

-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[idx];
     hostp2m = p2m_get_hostp2m(d);

     p2m_lock(p2m);
@@ -1968,12 +1968,12 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= d->nr_altp2m )
         return rc;

     altp2m_list_lock(d);

-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
+    if ( d->arch.altp2m_eptp[idx] ==
          mfn_x(INVALID_MFN) )
         rc = p2m_activate_altp2m(d, idx, hostp2m->default_access);

@@ -1995,7 +1995,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -2017,7 +2017,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;

-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -2027,17 +2027,17 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     rc = -EBUSY;
     altp2m_list_lock(d);

-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
+    if ( d->arch.altp2m_eptp[idx] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[idx];

         if ( !_atomic_read(p2m->active_vcpus) )
         {
             p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
-            d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
+            d->arch.altp2m_eptp[idx] =
                 mfn_x(INVALID_MFN);
-            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
+            d->arch.altp2m_visible_eptp[idx] =
                 mfn_x(INVALID_MFN);
             rc = 0;
         }
@@ -2055,7 +2055,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -2090,13 +2090,12 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;

-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( idx >= d->nr_altp2m ||
+         d->arch.altp2m_eptp[idx] == mfn_x(INVALID_MFN) )
         return rc;

     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[idx];

     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -2152,7 +2151,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -2175,7 +2174,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->nr_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -2575,12 +2574,11 @@ int p2m_set_suppress_ve_multi(struct domain *d,

     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( sve->view >= d->nr_altp2m ||
+             d->arch.altp2m_eptp[sve->view] == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m = d->arch.altp2m_p2m[sve->view];
     }

     p2m_lock(host_p2m);
@@ -2643,12 +2641,11 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,

     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( altp2m_idx >= d->nr_altp2m ||
+             d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m = d->arch.altp2m_p2m[altp2m_idx];
     }
     else
         p2m = host_p2m;
@@ -2679,17 +2676,16 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,

     /*
      * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
+     * d->nr_altp2m.
      */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( altp2m_idx >= d->nr_altp2m ||
+         d->arch.altp2m_eptp[altp2m_idx] == mfn_x(INVALID_MFN) )
         rc = -EINVAL;
     else if ( visible )
-        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
-            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
+        d->arch.altp2m_visible_eptp[altp2m_idx] =
+            d->arch.altp2m_eptp[altp2m_idx];
     else
-        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
+        d->arch.altp2m_visible_eptp[altp2m_idx] =
             mfn_x(INVALID_MFN);

     altp2m_list_unlock(d);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6773f7fb90..a10a70e9d4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -610,6 +610,7 @@ struct domain *domain_create(domid_t domid,
     if ( config )
     {
         d->options = config->flags;
+        d->nr_altp2m = config->nr_altp2m;
         d->vmtrace_size = config->vmtrace_size;
     }

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..60a871f123 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"

-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017

 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -86,6 +86,9 @@ struct xen_domctl_createdomain {

     uint32_t grant_opts;

+    /* Number of altp2ms to allocate. */
+    uint32_t nr_altp2m;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 132b841995..18cc0748a1 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -602,6 +602,8 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;

+    unsigned int nr_altp2m;    /* Number of altp2m tables */
+
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */

 #ifdef CONFIG_ARGO
--
2.34.1



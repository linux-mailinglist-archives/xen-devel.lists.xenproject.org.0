Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C118B4CE6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713707.1114627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lq-00073d-9h; Sun, 28 Apr 2024 16:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713707.1114627; Sun, 28 Apr 2024 16:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006oc-Ve; Sun, 28 Apr 2024 16:52:57 +0000
Received: by outflank-mailman (input) for mailman id 713707;
 Sun, 28 Apr 2024 16:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17lm-0006DB-NU
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:54 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c13de9c7-057f-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 18:52:53 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34d1ede7e51so41002f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:53 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:52 -0700 (PDT)
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
X-Inumbo-ID: c13de9c7-057f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323173; x=1714927973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG2qDlDs6FcET6IkvKvIzyxAbXvB4EM9puOXHyIK3Fk=;
        b=UmY+zt5YEBNxr9fPYl0V7QfbvbQkcDtIqTTYyun3jEKj+00IS8PvmnmKAC1QB029yS
         /Nct6p+KlJyZZ1mefYBCuCudCq694hfZrNO507P77T753frESbEpE4Ee4rAPIfnf1hOO
         hzlyP6U9R63+In9oR4aKf9gF8+FLRsJefF5vwEzUhBXg8jQPCvbLlvi+EWtUZXZD9ZsQ
         JehppXyxi1RSjpglI2f28YAr0tGvQalWb2PRYOgjsCjx4f++IoVhuaNBqCm4yTKbx2Fg
         RYKPOIihEJyC/5lJa7URuAF/GMld6wdPNRg0RHU9UFYgRo9xywC0ojokReAATegONgFb
         1s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323173; x=1714927973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG2qDlDs6FcET6IkvKvIzyxAbXvB4EM9puOXHyIK3Fk=;
        b=Jg3YolJGuS71DdxinVyFX4hH0zUnzLJOmxmjwcqgyuPdJrlWQPFmn6PviQa6ClK1L8
         c7qVCU7E8X0fHJloU6lNHv18oyr8uO3I8ItqGJOqUIrla721Ffe4PC9nQs8sjjp0Ak9k
         XSEipsr3R8is6qQMM+Q0lHtRCGStMNghYUt1E+g8wGOoBOZ0cBcLH1cBF0q9OY3SJ02j
         CyL2a9pjB33pd9gWCp26gtRSqxbuMtLMQ6UdZ1G2OqxmYydSV6MbapUpJ1E9Q8GGyVp9
         6OmQnUY27a4s9KmKr21ry3SIeED9lOYFEpRwvnkkZY/37mEC7lk97Wbqd8yOuFOB4aYK
         kTtw==
X-Gm-Message-State: AOJu0Yz737sZ5gmkFD41SDHNv3ZSzAEz/yCkbnPaoRQnGkqbD0e7y0CI
	4j4oOSJOu0WC2oznLdkBhSl80Nf0JVq/ew5dD+6UpAgiph34qmWw8NX+7ONC
X-Google-Smtp-Source: AGHT+IEhJydV42L0RIL9pZt43uuLj0a7WV9IeE9FHT7aWIZRSYeNhGEb8EQ7KZFPcknKKOmd6VLt8g==
X-Received: by 2002:a5d:4901:0:b0:34c:246c:1ee9 with SMTP id x1-20020a5d4901000000b0034c246c1ee9mr4952634wrq.59.1714323172466;
        Sun, 28 Apr 2024 09:52:52 -0700 (PDT)
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
Subject: [PATCH v2 4/7] x86: Make the maximum number of altp2m views configurable
Date: Sun, 28 Apr 2024 16:52:39 +0000
Message-Id: <0041438ff7a5d5b2fad59b676f4ece80470bf3b3.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit introduces the ability to configure the maximum number of altp2m
tables during domain creation. Previously, the limits were hardcoded to a
maximum of 10. This change allows for greater flexibility in environments that
require more or fewer altp2m views.

The maximum configurable limit for max_altp2m on x86 is now set to MAX_EPTP
(512). This cap is linked to the architectural limit of the EPTP-switching
VMFUNC, which supports up to 512 entries. Despite there being no inherent need
for limiting max_altp2m in scenarios not utilizing VMFUNC, decoupling these
components would necessitate substantial code changes.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
Changed since v1:
  * Added xen_domctl_createdomain::max_altp2m field to xen/include/public/domctl.h
  * Bumped the XEN_DOMCTL_INTERFACE_VERSION
  * More elaborate commit message

 xen/arch/x86/domain.c             |  6 ++++
 xen/arch/x86/hvm/hvm.c            |  8 ++++-
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/include/asm/domain.h |  7 ++---
 xen/arch/x86/include/asm/p2m.h    |  4 +--
 xen/arch/x86/mm/altp2m.c          | 27 +++++++++++++++--
 xen/arch/x86/mm/hap/hap.c         |  6 ++--
 xen/arch/x86/mm/mem_access.c      | 14 ++++-----
 xen/arch/x86/mm/mem_sharing.c     |  2 +-
 xen/arch/x86/mm/p2m-ept.c         |  6 ++--
 xen/arch/x86/mm/p2m.c             | 50 +++++++++++++++----------------
 xen/common/domain.c               |  7 +++++
 xen/include/public/domctl.h       |  3 +-
 xen/include/xen/sched.h           |  2 ++
 14 files changed, 94 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38b..6b458f330c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -685,6 +685,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

+    if ( config->max_altp2m > MAX_EPTP )
+    {
+        dprintk(XENLOG_INFO, "max_altp2m must be <= %u\n", MAX_EPTP);
+        return -EINVAL;
+    }
+
     if ( config->vmtrace_size )
     {
         unsigned int size = config->vmtrace_size;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ce45b177c..9b70fe7cfc 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4633,6 +4633,12 @@ static int do_altp2m_op(
         goto out;
     }

+    if ( d->max_altp2m == 0 )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
     if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
         goto out;

@@ -5222,7 +5228,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     if ( !hvm_is_singlestep_supported() )
         return;

-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= v->domain->max_altp2m )
         return;

     v->arch.hvm.single_step = true;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 5f67a48592..8f57f3a7f5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4888,7 +4888,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;

-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->max_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182b..5bb0bcae81 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -258,11 +258,10 @@ struct paging_vcpu {
     struct shadow_vcpu shadow;
 };

+#define INVALID_ALTP2M  0xffff
+#define MAX_EPTP        ((unsigned int)(PAGE_SIZE / sizeof(uint64_t)))
 #define MAX_NESTEDP2M 10

-#define MAX_ALTP2M      10 /* arbitrary */
-#define INVALID_ALTP2M  0xffff
-#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
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
index 111badf89a..2086bcb633 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -881,7 +881,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;

-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->max_altp2m);

     return v->domain->arch.altp2m_p2m[index];
 }
@@ -891,7 +891,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;

-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->max_altp2m);

     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index a04297b646..c91e0fbfd1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -13,6 +13,12 @@
 void
 altp2m_vcpu_initialise(struct vcpu *v)
 {
+    struct domain *d = v->domain;
+
+    /* Skip initialisation if no altp2m will be used. */
+    if ( d->max_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -28,8 +34,13 @@ altp2m_vcpu_initialise(struct vcpu *v)
 void
 altp2m_vcpu_destroy(struct vcpu *v)
 {
+    struct domain *d = v->domain;
     struct p2m_domain *p2m;

+    /* Skip destruction if no altp2m was used. */
+    if ( d->max_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);

@@ -120,7 +131,13 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

     mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+
+    if ( (d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->max_altp2m)) == NULL )
+    {
+        return -ENOMEM;
+    }
+
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -141,7 +158,10 @@ void p2m_teardown_altp2m(struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m;

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    if ( !d->arch.altp2m_p2m )
+        return;
+
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         if ( !d->arch.altp2m_p2m[i] )
             continue;
@@ -149,6 +169,9 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    xfree(d->arch.altp2m_p2m);
+    d->arch.altp2m_p2m = NULL;
 }

 /*
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde24..7aff5fa664 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -515,7 +515,7 @@ int hap_enable(struct domain *d, u32 mode)
             d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
         }

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
             if ( rv != 0 )
@@ -538,7 +538,7 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;

     if ( hvm_altp2m_supported() )
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);

     /* Destroy nestedp2m's first */
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 60a0cce68a..1bf40cb746 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,12 +347,12 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(d->max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->max_altp2m)];
     }

     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
@@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(d->max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->max_altp2m)];
     }

     p2m_lock(p2m);
@@ -466,12 +466,12 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(d->max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->max_altp2m)];
     }

     return _p2m_get_mem_access(p2m, gfn, access);
@@ -486,7 +486,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             struct p2m_domain *p2m = d->arch.altp2m_p2m[i];

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..3aaf1a3b8d 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -912,7 +912,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,

         altp2m_list_lock(d);

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             ap2m = d->arch.altp2m_p2m[i];
             if ( !ap2m )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index f83610cb8c..6b75fafd49 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1293,7 +1293,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             struct p2m_domain *p2m;

@@ -1500,7 +1500,7 @@ void setup_ept_dump(void)

 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m = d->arch.altp2m_p2m[array_index_nospec(i, d->max_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;

@@ -1519,7 +1519,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index eb7996170d..a7144fc8e1 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -105,7 +105,7 @@ void p2m_change_entry_type_global(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -140,7 +140,7 @@ void p2m_memory_type_changed(struct domain *d)
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -913,7 +913,7 @@ void p2m_change_type_range(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -986,7 +986,7 @@ int p2m_finish_type_change(struct domain *d,
     {
         unsigned int i;

-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->max_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -1780,7 +1780,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->max_altp2m )
         return rc;

     altp2m_list_lock(d);
@@ -1886,8 +1886,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;

-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < d->max_altp2m);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->max_altp2m)];

     p2m_lock(p2m);

@@ -1912,7 +1912,7 @@ void p2m_flush_altp2m(struct domain *d)

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -1928,9 +1928,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;

-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->max_altp2m);

-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->max_altp2m)];
     hostp2m = p2m_get_hostp2m(d);

     p2m_lock(p2m);
@@ -1968,7 +1968,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);

-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= min(d->max_altp2m, MAX_EPTP) )
         return rc;

     altp2m_list_lock(d);
@@ -1995,7 +1995,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -2017,7 +2017,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;

-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= min(d->max_altp2m, MAX_EPTP) )
         return rc;

     rc = domain_pause_except_self(d);
@@ -2030,7 +2030,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->max_altp2m)];

         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -2055,7 +2055,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;

-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->max_altp2m )
         return rc;

     rc = domain_pause_except_self(d);
@@ -2090,13 +2090,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;

-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( idx >=  min(d->max_altp2m, MAX_EPTP) ||
          d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         return rc;

     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->max_altp2m)];

     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -2152,7 +2152,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,

     altp2m_list_lock(d);

-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->max_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -2175,7 +2175,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->max_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -2575,12 +2575,12 @@ int p2m_set_suppress_ve_multi(struct domain *d,

     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( sve->view >= min(d->max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m = d->arch.altp2m_p2m[array_index_nospec(sve->view, d->max_altp2m)];
     }

     p2m_lock(host_p2m);
@@ -2643,12 +2643,12 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,

     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(d->max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->max_altp2m)];
     }
     else
         p2m = host_p2m;
@@ -2679,9 +2679,9 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,

     /*
      * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
+     * min(d->max_altp2m, MAX_EPTP).
      */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( altp2m_idx >= min(d->max_altp2m, MAX_EPTP) ||
          d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         rc = -EINVAL;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6773f7fb90..18785cc22a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -568,6 +568,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }

+    if ( config->max_altp2m && !hvm_altp2m_supported() )
+    {
+        dprintk(XENLOG_INFO, "altp2m requested but not available\n");
+        return -EINVAL;
+    }
+
     if ( config->vmtrace_size && !vmtrace_available )
     {
         dprintk(XENLOG_INFO, "vmtrace requested but not available\n");
@@ -610,6 +616,7 @@ struct domain *domain_create(domid_t domid,
     if ( config )
     {
         d->options = config->flags;
+        d->max_altp2m = config->max_altp2m;
         d->vmtrace_size = config->vmtrace_size;
     }

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..f9bd0ffe1a 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"

-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017

 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
+    uint32_t max_altp2m;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 132b841995..46436fcb0b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -602,6 +602,8 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;

+    unsigned int max_altp2m; /* Maximum number of altp2m tables */
+
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */

 #ifdef CONFIG_ARGO
--
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F684B26D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676752.1053049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIbD-0000gX-Sb; Tue, 06 Feb 2024 10:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676752.1053049; Tue, 06 Feb 2024 10:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIbD-0000bv-N2; Tue, 06 Feb 2024 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 676752;
 Tue, 06 Feb 2024 10:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HdcV=JP=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rXIO6-0004eO-L4
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:09:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ae577f-c4d7-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:09:07 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5101cd91017so7129273e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:09:08 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c3b9d00b0040ef2e7041esm1512947wms.6.2024.02.06.02.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 02:09:06 -0800 (PST)
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
X-Inumbo-ID: c3ae577f-c4d7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707214147; x=1707818947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPnnm05qAiSkgDvvHl4Q0+hRe1/bOWUsax4BKvjLB0s=;
        b=BxMO9jVrq315VdEvQ/tKd+ZWeI88EY5F/vegssX+sjUFi8uv9wbb9mZN70NHnLnidz
         eRItLHRo1NSVR4/XNxm4J+6R7WJsx77KA576p1dPqYnmfI+6nBrvzeF50hGvE7exWIcA
         pyj9SL2K4OsEf9qj/Qx07ZWmytPGiItmoduMN83sUKI3Bn7LhrphFC0vPAnXakJDYiq1
         MhLq8qoaVYa9hBE4O1tjsW7kPvnwO8V3/dHVp0dHv4HY33yA2VBSMINxo+iMdZbNJCuR
         dTsBu6BhKoBgsqguUWQuFmRxtJbDuzFKwC/jJrLJr0BT6VvZPrYuSfUNU0FQcEcYb29m
         JSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214147; x=1707818947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPnnm05qAiSkgDvvHl4Q0+hRe1/bOWUsax4BKvjLB0s=;
        b=SIoavMjYGCNs+mTCa/aYuNwqZgI+qmSETlz7QlEAWJLuw+nQ78u3Cr3R3FF6eg+ds8
         mT7yYcV3HUx8+bJskZ4HAYBgrBkruWwy0clsZEVf/6o3ldnNmJTC9wIaxY4lB6OKOZol
         S7VEiHkS+5vAe3GNYR0UDxaajY48tF4SddrcUsHcQOzN3JF8LU4uJDTJgJpHCmJa78O6
         yTjbeCWw6QhqkBj8WN9shEsPcGGN1J/ZOr10Tn12dawqncsqExnPcqkn4blHBOjQjfEn
         ySn4NV+nkpxOLdi3ioOrZOCSeu2rDgATppaP5pE5Z90HTJBYiNQvjnkPQSzGVqBpr/LV
         Ryog==
X-Gm-Message-State: AOJu0Yxgqkf7VpSL7RlNFTqjQr83lRou5BcJVpj8rif8lH0ZhYx2XTCn
	yDz3fsNeOaE0WdRN9iLdGrSBJafHvZsyf/MI0LtemFOj9YmcbnnDsGZ6d56s0xY=
X-Google-Smtp-Source: AGHT+IE2sPU/iuvgTVBZei/G/7BCTdd+ElefS5WgRHtbX/6p8Qcv0r9DPbfZZQFRwbiKXcSNkmSw6A==
X-Received: by 2002:ac2:5208:0:b0:511:4f67:7d47 with SMTP id a8-20020ac25208000000b005114f677d47mr1263615lfl.59.1707214146915;
        Tue, 06 Feb 2024 02:09:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVn8uwEicXsvw5E6fCK400wiDcCTVuwu6qFZsR7d2YlAyspCZB9sLFLhPt9cyE9WjMQnuj4Cvwk0MDNjOC0iqhsgUv2zKUx/9V1EShBTYLyZ25lnqnDGAPEibOnlPujFWCgos+LeIslSEVG/U582wXee2ESHgUL9BfWPYZBKTCnDjlLnlHDVuwVexHJw9kjYEvd3G9/D2JnuTxZHpdylx3jyfwv2PA4s0EPp8NNmcKa8Wl5CvjqVTqGrQsqU71ax9taXoBrKrXDVg2+MsJnbJpdT5AxGMa8J0uhaeXAO5RZU/Rf0eAj0BIe3Oxklq2rL29y3HVV31b7p46+I0sOTk2efFPFn62ipyJfqzKmBW7wjijQ7slaW4hilP2xXS3O/IWsOuH8I2X0C1RM3Q==
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH] x86: Add configuration options for max_altp2m and max_nestedp2m limits
Date: Tue,  6 Feb 2024 10:08:59 +0000
Message-Id: <9143475dddf8d0141fb3864ed90153591554a425.1707213019.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit introduces the ability to configure the maximum number of altp2m
and nestedp2m tables through boot-time parameters.  Previously, the limits were
hardcoded to a maximum of 10 for both.  This change allows for greater
flexibility in environments that require more or fewer tables, enhancing Xen's
adaptability to different workloads and scenarios.

Adjustments include:
- Adding boot parameters `max_altp2m` and `max_nestedp2m` to allow setting
  these limits at boot time.
- Modifying various parts of the code to use these configurable limits instead
  of the previous hardcoded values.
- Ensuring that if the configured values exceed the maximum supported EPTP
  entries, they are adjusted down with a warning logged.
- Adjusting the initial allocation of pages in `hap_enable` from 256 to 2048
  pages when `old_pages == 0`.

  This change anticipates scenarios where `max_altp2m` and `max_nestedp2m`
  are set to their maximum supported values (i.e., 512), ensuring sufficient
  memory is allocated upfront to accommodate all altp2m and nestedp2m tables
  without initialization failure.

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection or nested virtualization support.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 .../paging-mempool/test-paging-mempool.c      |  2 +-
 xen/arch/x86/hvm/hvm.c                        | 22 +++++++-
 xen/arch/x86/hvm/vmx/vmx.c                    |  2 +-
 xen/arch/x86/include/asm/domain.h             |  8 +--
 xen/arch/x86/include/asm/p2m.h                |  4 +-
 xen/arch/x86/mm/altp2m.c                      | 16 +++++-
 xen/arch/x86/mm/hap/hap.c                     | 14 ++---
 xen/arch/x86/mm/mem_access.c                  | 14 ++---
 xen/arch/x86/mm/mem_sharing.c                 |  6 +-
 xen/arch/x86/mm/nested.c                      | 16 +++++-
 xen/arch/x86/mm/p2m-ept.c                     |  6 +-
 xen/arch/x86/mm/p2m.c                         | 56 +++++++++----------
 12 files changed, 105 insertions(+), 61 deletions(-)

diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455a..b94d4a4fe1 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -35,7 +35,7 @@ static struct xen_domctl_createdomain create = {
 
 static uint64_t default_mempool_size_bytes =
 #if defined(__x86_64__) || defined(__i386__)
-    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
+    2048 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
 #elif defined (__arm__) || defined(__aarch64__)
     16 << 12;
 #endif
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 482eebbabf..cb5e190083 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -105,6 +105,12 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
+unsigned long __read_mostly max_altp2m = 10;
+integer_param("max_altp2m", max_altp2m);
+
+unsigned long __read_mostly max_nestedp2m = 10;
+integer_param("max_nestedp2m", max_nestedp2m);
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -191,6 +197,20 @@ static int __init cf_check hvm_enable(void)
 
     if ( !opt_altp2m_enabled )
         hvm_funcs.altp2m_supported = 0;
+    else
+    {
+        if ( max_altp2m > MAX_EPTP )
+        {
+            printk(XENLOG_WARNING "HVM: max_altp2m must be <= %lu, adjusting\n", MAX_EPTP);
+            max_altp2m = MAX_EPTP;
+        }
+
+        if ( max_nestedp2m > MAX_EPTP )
+        {
+            printk(XENLOG_WARNING "HVM: max_nestedp2m must be <= %lu, adjusting\n", MAX_EPTP);
+            max_nestedp2m = MAX_EPTP;
+        }
+    }
 
     if ( opt_hvm_fep )
         warning_add(warning_hvm_fep);
@@ -5207,7 +5227,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     if ( !hvm_is_singlestep_supported() )
         return;
 
-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= max_altp2m )
         return;
 
     v->arch.hvm.single_step = true;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e91..71a9269f1d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4857,7 +4857,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
         {
             unsigned int i;
 
-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < max_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 619e667938..429f0d6668 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -259,9 +259,9 @@ struct paging_vcpu {
     struct shadow_vcpu shadow;
 };
 
-#define MAX_NESTEDP2M 10
+extern unsigned long max_altp2m;
+extern unsigned long max_nestedp2m;
 
-#define MAX_ALTP2M      10 /* arbitrary */
 #define INVALID_ALTP2M  0xffff
 #define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
 struct p2m_domain;
@@ -349,12 +349,12 @@ struct arch_domain
 
 #ifdef CONFIG_HVM
     /* nestedhvm: translate l2 guest physical to host physical */
-    struct p2m_domain *nested_p2m[MAX_NESTEDP2M];
+    struct p2m_domain **nested_p2m;
     mm_lock_t nested_p2m_lock;
 
     /* altp2m: allow multiple copies of host p2m */
     bool_t altp2m_active;
-    struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
+    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 40545f5fa8..0810293f7f 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -862,7 +862,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;
 
-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= max_altp2m);
 
     return v->domain->arch.altp2m_p2m[index];
 }
@@ -872,7 +872,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;
 
-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= max_altp2m);
 
     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index a04297b646..468ccb0b58 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -120,7 +120,13 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
     mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+
+    if ( (d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, max_altp2m)) == NULL )
+    {
+        return -ENOMEM;
+    }
+
+    for ( i = 0; i < max_altp2m; i++ )
     {
         d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -141,7 +147,10 @@ void p2m_teardown_altp2m(struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m;
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    if ( !d->arch.altp2m_p2m )
+        return;
+
+    for ( i = 0; i < max_altp2m; i++ )
     {
         if ( !d->arch.altp2m_p2m[i] )
             continue;
@@ -149,6 +158,9 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    xfree(d->arch.altp2m_p2m);
+    d->arch.altp2m_p2m = NULL;
 }
 
 /*
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 9f964c1d87..812a0f37d8 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
     if ( old_pages == 0 )
     {
         paging_lock(d);
-        rv = hap_set_allocation(d, 256, NULL);
+        rv = hap_set_allocation(d, 2048, NULL);
         if ( rv != 0 )
         {
             hap_set_allocation(d, 0, NULL);
@@ -487,7 +487,7 @@ int hap_enable(struct domain *d, u32 mode)
     if ( rv != 0 )
         goto out;
 
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         rv = p2m_alloc_table(d->arch.nested_p2m[i]);
         if ( rv != 0 )
@@ -515,7 +515,7 @@ int hap_enable(struct domain *d, u32 mode)
             d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
         }
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
         {
             rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
             if ( rv != 0 )
@@ -538,11 +538,11 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;
 
     if ( hvm_altp2m_supported() )
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
 
     /* Destroy nestedp2m's first */
-    for (i = 0; i < MAX_NESTEDP2M; i++) {
+    for (i = 0; i < max_nestedp2m; i++) {
         p2m_teardown(d->arch.nested_p2m[i], true, NULL);
     }
 }
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
         {
             p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
@@ -599,7 +599,7 @@ void hap_teardown(struct domain *d, bool *preempted)
     }
 
     /* Destroy nestedp2m's after altp2m. */
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         p2m_teardown(d->arch.nested_p2m[i], false, preempted);
         if ( preempted && *preempted )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 3449e0ee85..85f38e0ad4 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,12 +347,12 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, max_altp2m)];
     }
 
     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
@@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, max_altp2m)];
     }
 
     p2m_lock(p2m);
@@ -466,12 +466,12 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;
 
-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, max_altp2m)];
     }
 
     return _p2m_get_mem_access(p2m, gfn, access);
@@ -486,7 +486,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
         {
             struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 94b6b782ef..bb4ce3c8cc 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -918,7 +918,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         altp2m_list_lock(d);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
         {
             ap2m = d->arch.altp2m_p2m[i];
             if ( !ap2m )
@@ -1280,7 +1280,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_NESTEDP2M; i++ )
+        for ( i = 0; i < max_nestedp2m; i++ )
             p2m_lock(d->arch.nested_p2m[i]);
     }
 
@@ -1389,7 +1389,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_NESTEDP2M; i++ )
+        for ( i = 0; i < max_nestedp2m; i++ )
             p2m_unlock(d->arch.nested_p2m[i]);
     }
 
diff --git a/xen/arch/x86/mm/nested.c b/xen/arch/x86/mm/nested.c
index 03741ffae4..a765bb27d4 100644
--- a/xen/arch/x86/mm/nested.c
+++ b/xen/arch/x86/mm/nested.c
@@ -28,7 +28,13 @@ int p2m_init_nestedp2m(struct domain *d)
     struct p2m_domain *p2m;
 
     mm_lock_init(&d->arch.nested_p2m_lock);
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+
+    if ( (d->arch.nested_p2m = xzalloc_array(struct p2m_domain *, max_nestedp2m)) == NULL )
+    {
+        return -ENOMEM;
+    }
+
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         d->arch.nested_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -50,7 +56,10 @@ void p2m_teardown_nestedp2m(struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m;
 
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    if ( !d->arch.nested_p2m )
+        return;
+
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         if ( !d->arch.nested_p2m[i] )
             continue;
@@ -59,4 +68,7 @@ void p2m_teardown_nestedp2m(struct domain *d)
         p2m_free_one(p2m);
         d->arch.nested_p2m[i] = NULL;
     }
+
+    xfree(d->arch.nested_p2m);
+    d->arch.nested_p2m = NULL;
 }
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 85c4e8e54f..6d9267552e 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1292,7 +1292,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
         {
             struct p2m_domain *p2m;
 
@@ -1499,7 +1499,7 @@ void setup_ept_dump(void)
 
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m = d->arch.altp2m_p2m[array_index_nospec(i, max_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
@@ -1518,7 +1518,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < max_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 4251144704..265584d243 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -104,7 +104,7 @@ void p2m_change_entry_type_global(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -137,7 +137,7 @@ void p2m_memory_type_changed(struct domain *d)
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -906,7 +906,7 @@ void p2m_change_type_range(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -977,7 +977,7 @@ int p2m_finish_type_change(struct domain *d,
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < max_altp2m; i++ )
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -1390,7 +1390,7 @@ p2m_flush_nestedp2m(struct domain *d)
 {
     unsigned int i;
 
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         struct p2m_domain *p2m = d->arch.nested_p2m[i];
 
@@ -1410,7 +1410,7 @@ void np2m_flush_base(struct vcpu *v, unsigned long np2m_base)
     np2m_base &= ~(0xfffULL);
 
     nestedp2m_lock(d);
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         p2m = d->arch.nested_p2m[i];
         p2m_lock(p2m);
@@ -1484,7 +1484,7 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
     }
 
     /* Share a np2m if possible */
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    for ( i = 0; i < max_nestedp2m; i++ )
     {
         p2m = d->arch.nested_p2m[i];
         p2m_lock(p2m);
@@ -1770,7 +1770,7 @@ bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool_t rc = 0;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= max_altp2m )
         return rc;
 
     altp2m_list_lock(d);
@@ -1876,8 +1876,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;
 
-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < max_altp2m);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, max_altp2m)];
 
     p2m_lock(p2m);
 
@@ -1902,7 +1902,7 @@ void p2m_flush_altp2m(struct domain *d)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < max_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -1918,9 +1918,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;
 
-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < max_altp2m);
 
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, max_altp2m)];
     hostp2m = p2m_get_hostp2m(d);
 
     p2m_lock(p2m);
@@ -1958,7 +1958,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= min(max_altp2m, MAX_EPTP) )
         return rc;
 
     altp2m_list_lock(d);
@@ -1985,7 +1985,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < max_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -2007,7 +2007,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;
 
-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= min(max_altp2m, MAX_EPTP) )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -2020,7 +2020,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, max_altp2m)];
 
         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -2045,7 +2045,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= max_altp2m )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -2080,13 +2080,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;
 
-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( idx >=  min(max_altp2m, MAX_EPTP) ||
          d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         return rc;
 
     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, max_altp2m)];
 
     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -2142,7 +2142,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < max_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -2165,7 +2165,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < max_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -2565,12 +2565,12 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 
     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( sve->view >= min(max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m = d->arch.altp2m_p2m[array_index_nospec(sve->view, max_altp2m)];
     }
 
     p2m_lock(host_p2m);
@@ -2633,12 +2633,12 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 
     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+        if ( altp2m_idx >= min(max_altp2m, MAX_EPTP) ||
              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
              mfn_x(INVALID_MFN) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, max_altp2m)];
     }
     else
         p2m = host_p2m;
@@ -2669,9 +2669,9 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
 
     /*
      * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
+     * min(max_altp2m, MAX_EPTP).
      */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+    if ( altp2m_idx >= min(max_altp2m, MAX_EPTP) ||
          d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         rc = -EINVAL;
-- 
2.34.1



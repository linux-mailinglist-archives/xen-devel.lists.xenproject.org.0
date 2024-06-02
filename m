Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC38D77B8
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734559.1140700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRY-0000rh-Fx; Sun, 02 Jun 2024 20:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734559.1140700; Sun, 02 Jun 2024 20:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRY-0000l3-Ah; Sun, 02 Jun 2024 20:04:40 +0000
Received: by outflank-mailman (input) for mailman id 734559;
 Sun, 02 Jun 2024 20:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRW-0007mz-F1
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 567688e2-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:37 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-354cd8da8b9so3476656f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:37 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:35 -0700 (PDT)
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
X-Inumbo-ID: 567688e2-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358676; x=1717963476; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGLeqc9nd3kadS5/DKrJoeONfRKHhkFkkBxhvVJOirc=;
        b=GhgmK7CuZN2hw4/lDt7H0jQ6aoSKY0BpaAMv4FRuNgRGe2ttx246ENfqe9ZGj5xNB0
         SDZUwlzrczAmaJFMKDvy3jQz0Yln4CorK7E931bIxdmNXTkN2cRW2tnX0Ty6Y9KSyrXJ
         XEeNaB9eDTUVuwNRd7pTG3UjcT5987KimH+Hv02IRK79qYJBqEA/1U/lXDhzrwoyTMHB
         R8npw6eflvzSQKjdhF/x1nYnNGopNN4wIZUzjf4k/Kt4j7gvupvhMwszOtMubSDjdjW+
         EtFW9QuIxmTOTFKWXy5dSGDCl+vI94s8EOUGtafdCfi97Xch780LydQz46xouIDu7YP2
         y9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358676; x=1717963476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGLeqc9nd3kadS5/DKrJoeONfRKHhkFkkBxhvVJOirc=;
        b=XHx0cz9t4ueZXR7TOEoXbW4IAaFjBnw0DhlAbZKdrapucJeS3bjbEsqX0wNKfBwnxp
         8YsS7QnLSWceLu6Jh71kf/8mTGzydbFZxBwPvyiFY4trNZb9s0Z0H7EKqLKJj26I5FWc
         JykLR79751OGJa88xbOUnucM6+7DvdB+5DQjHaex1Z4lmmeehkCUdBTscNVAFymbEygE
         kV4nsdE/tr2i6E5JsPNWeIC6Kt6yGtA53Byv4d7ZTuuVN6AMkY6p426pj5BCznErZWEB
         Jq11r5Bz7/soEpdxDzXHKcKFAImyK2nscLGQ63zAfFsdyQUCVdbQ1ujrJOsC3KlWYvDq
         X+jA==
X-Gm-Message-State: AOJu0YwPLmZl1CpPq0H5Oz/L9kMp3agn/kR+pxOMkO56g7Ko3/7GIEur
	vsHDVLm/z5i5RujvR/o8mRID6KOwlMmJjcRKoZJBdEu5xSjv/SyyTcu/RQf8
X-Google-Smtp-Source: AGHT+IEORE2b4SaQdkTR0pXCC6XV8zO8DY7VkZoXdbf4u7ErtCbWMsWhiSLCOTi1fq/GRpWayS+IXQ==
X-Received: by 2002:a5d:4f8f:0:b0:356:50e7:e948 with SMTP id ffacd0b85a97d-35e0f32e295mr5789389f8f.67.1717358675755;
        Sun, 02 Jun 2024 13:04:35 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH for-4.19? v5 06/10] x86/altp2m: Introduce accessor functions for safer array indexing
Date: Sun,  2 Jun 2024 20:04:19 +0000
Message-Id: <e2e5f7a3c9a0ac6d65a6f942b0ea54f0f0b104f3.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This patch introduces a set of accessor functions for altp2m array operations,
and refactoring direct array accesses with them.

This approach aims on improving the code clarity and also future-proofing the
codebase against potential speculative execution attacks.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/hvm/vmx/vmx.c        |  4 +--
 xen/arch/x86/include/asm/altp2m.h | 32 +++++++++++++++++
 xen/arch/x86/include/asm/p2m.h    |  7 ++--
 xen/arch/x86/mm/altp2m.c          | 60 +++++++++++++------------------
 xen/arch/x86/mm/hap/hap.c         |  8 ++---
 xen/arch/x86/mm/mem_access.c      | 17 ++++-----
 xen/arch/x86/mm/mem_sharing.c     |  2 +-
 xen/arch/x86/mm/p2m-ept.c         | 14 ++++----
 xen/arch/x86/mm/p2m.c             | 16 ++++-----
 9 files changed, 91 insertions(+), 69 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f16faa6a61..a420d452b3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4887,10 +4887,10 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)

             for ( i = 0; i < MAX_ALTP2M; ++i )
             {
-                if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+                if ( altp2m_get_eptp(currd, i) == mfn_x(INVALID_MFN) )
                     continue;

-                ept = &currd->arch.altp2m_p2m[i]->ept;
+                ept = &altp2m_get_p2m(currd, i)->ept;
                 if ( cpumask_test_cpu(cpu, ept->invalidate) )
                 {
                     cpumask_clear_cpu(cpu, ept->invalidate);
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index e5e59cbd68..2f064c61a2 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -19,6 +19,38 @@ static inline bool altp2m_active(const struct domain *d)
     return d->arch.altp2m_active;
 }

+static inline struct p2m_domain *altp2m_get_p2m(const struct domain* d,
+                                                unsigned int idx)
+{
+    return d->arch.altp2m_p2m[array_index_nospec(idx, MAX_ALTP2M)];
+}
+
+static inline uint64_t altp2m_get_eptp(const struct domain* d,
+                                       unsigned int idx)
+{
+    return d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)];
+}
+
+static inline void altp2m_set_eptp(const struct domain* d,
+                                   unsigned int idx,
+                                   uint64_t eptp)
+{
+    d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] = eptp;
+}
+
+static inline uint64_t altp2m_get_visible_eptp(const struct domain* d,
+                                               unsigned int idx)
+{
+    return d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)];
+}
+
+static inline void altp2m_set_visible_eptp(const struct domain* d,
+                                           unsigned int idx,
+                                           uint64_t eptp)
+{
+    d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] = eptp;
+}
+
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index c1478ffc36..e6f7764f9f 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -18,6 +18,7 @@
 #include <xen/mem_access.h>
 #include <asm/mem_sharing.h>
 #include <asm/page.h>    /* for pagetable_t */
+#include <asm/altp2m.h>

 /* Debugging and auditing of the P2M code? */
 #if !defined(NDEBUG) && defined(CONFIG_HVM)
@@ -888,13 +889,14 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)

     BUG_ON(index >= MAX_ALTP2M);

-    return v->domain->arch.altp2m_p2m[index];
+    return altp2m_get_p2m(v->domain, index);
 }

 /* set current alternate p2m table */
 static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;
+    struct p2m_domain *ap2m;

     BUG_ON(idx >= MAX_ALTP2M);

@@ -906,7 +908,8 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
     atomic_dec(&orig->active_vcpus);

     vcpu_altp2m(v).p2midx = idx;
-    atomic_inc(&v->domain->arch.altp2m_p2m[idx]->active_vcpus);
+    ap2m = altp2m_get_p2m(v->domain, idx);
+    atomic_inc(&ap2m->active_vcpus);

     return true;
 }
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 6fe1e9ed6b..7fb1738376 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -205,7 +205,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)

     altp2m_list_lock(d);

-    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
+    if ( altp2m_get_eptp(d, idx) != mfn_x(INVALID_MFN) )
     {
         if ( p2m_set_altp2m(v, idx) )
             altp2m_vcpu_update_p2m(v);
@@ -307,7 +307,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *p2m;

     ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = altp2m_get_p2m(d, idx);

     p2m_lock(p2m);

@@ -335,8 +335,8 @@ void p2m_flush_altp2m(struct domain *d)
     for ( i = 0; i < MAX_ALTP2M; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
-        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
-        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
+        altp2m_set_eptp(d, i, mfn_x(INVALID_MFN));
+        altp2m_set_visible_eptp(d, i, mfn_x(INVALID_MFN));
     }

     altp2m_list_unlock(d);
@@ -350,7 +350,7 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,

     ASSERT(idx < MAX_ALTP2M);

-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = altp2m_get_p2m(d, idx);
     hostp2m = p2m_get_hostp2m(d);

     p2m_lock(p2m);
@@ -393,8 +393,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)

     altp2m_list_lock(d);

-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( altp2m_get_eptp(d, idx) == mfn_x(INVALID_MFN) )
         rc = p2m_activate_altp2m(d, idx, hostp2m->default_access);

     altp2m_list_unlock(d);
@@ -417,7 +416,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,

     for ( i = 0; i < MAX_ALTP2M; i++ )
     {
-        if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+        if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             continue;

         rc = p2m_activate_altp2m(d, i, a);
@@ -447,18 +446,15 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     rc = -EBUSY;
     altp2m_list_lock(d);

-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
-         mfn_x(INVALID_MFN) )
+    if ( altp2m_get_eptp(d, idx) != mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = altp2m_get_p2m(d, idx);

         if ( !_atomic_read(p2m->active_vcpus) )
         {
             p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
-            d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
-                mfn_x(INVALID_MFN);
-            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
-                mfn_x(INVALID_MFN);
+            altp2m_set_eptp(d, idx, mfn_x(INVALID_MFN));
+            altp2m_set_visible_eptp(d, idx, mfn_x(INVALID_MFN));
             rc = 0;
         }
     }
@@ -485,7 +481,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     rc = -EINVAL;
     altp2m_list_lock(d);

-    if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
+    if ( altp2m_get_visible_eptp(d, idx) != mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
             if ( p2m_set_altp2m(v, idx) )
@@ -510,13 +506,12 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;

-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+         altp2m_get_eptp(d, idx) == mfn_x(INVALID_MFN) )
         return rc;

     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = altp2m_get_p2m(d, idx);

     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -577,10 +572,10 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
         p2m_type_t t;
         p2m_access_t a;

-        if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+        if ( altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
             continue;

-        p2m = d->arch.altp2m_p2m[i];
+        p2m = altp2m_get_p2m(d, i);

         /* Check for a dropped page that may impact this altp2m */
         if ( mfn_eq(mfn, INVALID_MFN) &&
@@ -598,7 +593,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
                     if ( i == last_reset_idx ||
-                         d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+                         altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
                         continue;

                     p2m_reset_altp2m(d, i, ALTP2M_RESET);
@@ -660,11 +655,10 @@ int p2m_set_suppress_ve_multi(struct domain *d,
     if ( sve->view > 0 )
     {
         if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+             altp2m_get_eptp(d, sve->view) == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m = altp2m_get_p2m(d, sve->view);
     }

     p2m_lock(host_p2m);
@@ -728,11 +722,10 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
     if ( altp2m_idx > 0 )
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+             altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m = altp2m_get_p2m(d, altp2m_idx);
     }
     else
         p2m = host_p2m;
@@ -766,15 +759,12 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
      * min(MAX_ALTP2M, MAX_EPTP).
      */
     if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+         altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
         rc = -EINVAL;
     else if ( visible )
-        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
-            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
+        altp2m_set_visible_eptp(d, altp2m_idx, altp2m_get_eptp(d, altp2m_idx));
     else
-        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
-            mfn_x(INVALID_MFN);
+        altp2m_set_visible_eptp(d, altp2m_idx, mfn_x(INVALID_MFN));

     altp2m_list_unlock(d);

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde24..8fc8348152 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -511,13 +511,13 @@ int hap_enable(struct domain *d, u32 mode)

         for ( i = 0; i < MAX_EPTP; i++ )
         {
-            d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
-            d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
+            altp2m_set_eptp(d, i, mfn_x(INVALID_MFN));
+            altp2m_set_visible_eptp(d, i, mfn_x(INVALID_MFN));
         }

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
+            rv = p2m_alloc_table(altp2m_get_p2m(d, i));
             if ( rv != 0 )
                goto out;
         }
@@ -592,7 +592,7 @@ void hap_teardown(struct domain *d, bool *preempted)

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
+            p2m_teardown(altp2m_get_p2m(d, i), false, preempted);
             if ( preempted && *preempted )
                 return;
         }
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 60a0cce68a..43f3a8c2aa 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -348,11 +348,10 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     if ( altp2m_idx )
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+             altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = altp2m_get_p2m(d, altp2m_idx);
     }

     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
@@ -404,11 +403,10 @@ long p2m_set_mem_access_multi(struct domain *d,
     if ( altp2m_idx )
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+             altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = altp2m_get_p2m(d, altp2m_idx);
     }

     p2m_lock(p2m);
@@ -467,11 +465,10 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+             altp2m_get_eptp(d, altp2m_idx) == mfn_x(INVALID_MFN) )
             return -EINVAL;

-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = altp2m_get_p2m(d, altp2m_idx);
     }

     return _p2m_get_mem_access(p2m, gfn, access);
@@ -488,7 +485,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
         unsigned int i;
         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
+            struct p2m_domain *p2m = altp2m_get_p2m(d, i);

             if ( p2m )
                 p2m->access_required = access_required;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..21ac361111 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -914,7 +914,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            ap2m = d->arch.altp2m_p2m[i];
+            ap2m = altp2m_get_p2m(d, i);
             if ( !ap2m )
                 continue;

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index f83610cb8c..ed4252822e 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1297,10 +1297,10 @@ static void ept_set_ad_sync(struct domain *d, bool value)
         {
             struct p2m_domain *p2m;

-            if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+            if ( altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
                 continue;

-            p2m = d->arch.altp2m_p2m[i];
+            p2m = altp2m_get_p2m(d, i);

             p2m_lock(p2m);
             p2m->ept.ad = value;
@@ -1500,15 +1500,15 @@ void setup_ept_dump(void)

 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m = altp2m_get_p2m(d, i);
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;

     p2m->ept.ad = hostp2m->ept.ad;
     ept = &p2m->ept;
     ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
-    d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
-    d->arch.altp2m_visible_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
+    altp2m_set_eptp(d, i, ept->eptp);
+    altp2m_set_visible_eptp(d, i, ept->eptp);
 }

 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
@@ -1521,10 +1521,10 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)

     for ( i = 0; i < MAX_ALTP2M; i++ )
     {
-        if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+        if ( altp2m_get_eptp(d, i) == mfn_x(INVALID_MFN) )
             continue;

-        p2m = d->arch.altp2m_p2m[i];
+        p2m = altp2m_get_p2m(d, i);
         ept = &p2m->ept;

         if ( eptp == ept->eptp )
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e7e327d6a6..30a44441ba 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -107,9 +107,9 @@ void p2m_change_entry_type_global(struct domain *d,

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = altp2m_get_p2m(d, i);

                 p2m_lock(altp2m);
                 change_entry_type_global(altp2m, ot, nt);
@@ -142,9 +142,9 @@ void p2m_memory_type_changed(struct domain *d)

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = altp2m_get_p2m(d, i);

                 p2m_lock(altp2m);
                 _memory_type_changed(altp2m);
@@ -915,9 +915,9 @@ void p2m_change_type_range(struct domain *d,

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = altp2m_get_p2m(d, i);

                 p2m_lock(altp2m);
                 change_type_range(altp2m, start, end, ot, nt);
@@ -988,9 +988,9 @@ int p2m_finish_type_change(struct domain *d,

         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
-            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            if ( altp2m_get_eptp(d, i) != mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m = altp2m_get_p2m(d, i);

                 p2m_lock(altp2m);
                 rc = finish_type_change(altp2m, first_gfn, max_nr);
--
2.34.1



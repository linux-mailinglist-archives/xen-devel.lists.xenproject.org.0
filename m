Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E316B1209B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058062.1425784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK13-0003u4-8t; Fri, 25 Jul 2025 15:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058062.1425784; Fri, 25 Jul 2025 15:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK12-0003p8-W5; Fri, 25 Jul 2025 15:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1058062;
 Fri, 25 Jul 2025 15:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK10-0002MW-4q
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:18 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e025fd7-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:17 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso3705046a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:17 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:16 -0700 (PDT)
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
X-Inumbo-ID: 0e025fd7-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456037; x=1754060837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCFciTsMth7BhTHNua6fPncP83jM+wUQoTTdBleaR9Q=;
        b=h56eLmGHVShfsrvvhHe1HTZ4tdhF95kbMdyYB3djpI3STd7jsw/Bwp2muq2rlU2Q3O
         50/H0Wppn+sZR/JpZ5n040ayQcGJE4WLmRUh3hupRU6cKxm4yP80mS3kzfj7n/NUK1Ff
         fReOWJEHB/Z5tHT8E+N425cdIjuFY4fEvd/D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456037; x=1754060837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCFciTsMth7BhTHNua6fPncP83jM+wUQoTTdBleaR9Q=;
        b=r3SUi9RRTcZKKAlQcfjWb8ckEYCJKjYzeLobavHbCWnrp/n/Ek3AntrMluhtpxkUOy
         kHzFy9Ryy68N2d+wqAYFv4zj2SU7lPhVQnGubrgs1TC+EAXn9h9sc2B3w/0FMxgVP1QU
         Kh+Zlw5nxQdBS/20pM0qGDrfWvznAuqdGZgvqva6M1PSUJhJoGqXwGVBdj0FIE37qSke
         4i7fNsLUMNnkU2loj4N0kC5nxC++pPs/FtKYNZIrI1rKztDqXSSSH87Kwd+Oh+aLxbDm
         fgsDY7UuoV5OVBVJSIzXzLg87mkIk0TaxBWim0+1Xk3PJxiZpMi2QXcJKyEVKiEXOsd8
         5hbQ==
X-Gm-Message-State: AOJu0YyKbs0uyfIG6zZ9fFdoWykyt3H+ii6zYwC2zozf8Fhn/Wgc7mkw
	0Who61kxRV9tAM0Qfl60OjvFoNSkJ/0Cpfe4SxzOZQxhTpE9IWKY9mHKIEChdOv3qDX1v2SrPZw
	mei9/LI0=
X-Gm-Gg: ASbGnctlFvMriIfXZzV5a/QRS9ILS6elIN1Pfd4kECfwVh3jXucdEyW1X9fVN0D3VGB
	pm3vF57zARHcavMUJrKqLPQsiYZl9YearYIeGowmNF1oV9dwGPnDMmL8GVoT2qahctrjGdBkp0N
	FqczwfLrIYLVWMkBoMoQ+KZh1QkSYu6ACXTKoyHE/tUoJFotbdCQY6v1vH7Bba3Ii/GIUbFb3FQ
	iK7EPkMmumE+qGin1KurxQTAT5V+YIzCQbk2Jd+6Q6BgmyVEJJzLvSksLwkugfyWmgidqCXUT4U
	TiR7uMf6/Taov6a/3eIr79mwJ5CgMDeTbvdAKTd52SRyKQPJpX4TSIzwDu/suQhX5M0Bl1S+0tP
	Gw8BJI/3eD2TR1OLU3WJVgOF7pHgqR7eaF5+v
X-Google-Smtp-Source: AGHT+IFfATSAiprGPxJLV6Aw5jVT7uW2HsF0Ca3Wr1ARDQsUeqtiope6oGWN1oyYHE+OynZp5Gdpyg==
X-Received: by 2002:a05:6402:1e96:b0:607:e3ec:f8ea with SMTP id 4fb4d7f45d1cf-614f1bbc9demr2173711a12.6.1753456036974;
        Fri, 25 Jul 2025 08:07:16 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 07/10] arch-x86/vpmu.c: store guest registers when domain_id == DOMID_XEN
Date: Fri, 25 Jul 2025 16:06:43 +0100
Message-ID: <4c2c02ae7de1c218b8f51a3c6a78f01bc81e79bd.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Xen profiling is enabled (for HW domain only), then domain_id is
set to DOMID_XEN, and Xen's IP is reported as the sample location.

With VPMU >= 0.2 we can now report more information to help a guest
construct a stacktrace, and store the guest's registers and domain_id
into the new 'struct xen_pmu_hv_stracktrace'.

Privileged (HW domain) guests can then trace themselves, even if the
sample interrupt triggered inside Xen. This is useful if kernel or
userspace stacktrace gather is enabled.

For this to be effective a kernel change is required too, but it is
backwards compatible with old kernels, that:
* would ignore the newly stored data (it is towards the end of the page,
in a previously unused area)
* would report VPMU 0.1, and thus Xen would have xen_pmu_hv_stacktrace ==
  NULL, and not report this information

To avoid stale values the guest_domain_id is always initialized to the
correct value, and ip is set to 0.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/arch/x86/cpu/vpmu.c         | 33 ++++++++++++++++++++++++++++-----
 xen/arch/x86/include/asm/vpmu.h |  1 +
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 286dc2af5f..770f63f95a 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -170,7 +170,7 @@ static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t *flags,
   if (!is_hvm_vcpu(sampled)) {
     r->ss = cur_regs->ss;
     r->cs = cur_regs->cs;
-    if (!(sampled->arch.flags & TF_kernel_mode))
+    if (flags && !(sampled->arch.flags & TF_kernel_mode))
       *flags |= PMU_SAMPLE_USER;
   } else {
     struct segment_register seg;
@@ -180,7 +180,7 @@ static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t *flags,
     hvm_get_segment_register(sampled, x86_seg_ss, &seg);
     r->ss = seg.sel;
     r->cpl = seg.dpl;
-    if (!(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE))
+    if (flags && !(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE))
       *flags |= PMU_SAMPLE_REAL;
   }
 }
@@ -240,6 +240,14 @@ void vpmu_do_interrupt(void)
         else
             domid = sampled->domain->domain_id;
 
+        if (vpmu->xenpmu_hv_stacktrace)
+        {
+            vpmu->xenpmu_hv_stacktrace->guest_domain_id = domid;
+
+            /* avoid stale values when domid != DOMID_XEN */
+            vpmu->xenpmu_hv_stacktrace->guest.r.regs.ip = 0;
+        }
+
         /* Store appropriate registers in xenpmu_data */
 #ifdef CONFIG_COMPAT
         /* FIXME: 32-bit PVH should go here as well */
@@ -275,6 +283,11 @@ void vpmu_do_interrupt(void)
                       is_hardware_domain(sampling->domain) )
             {
                 cur_regs = regs;
+                if (vpmu->xenpmu_hv_stacktrace)
+                {
+                    vpmu_convert_regs(&vpmu->xenpmu_hv_stacktrace->guest.r.regs,
+                                      NULL, sampled, guest_cpu_user_regs());
+                }
                 domid = DOMID_XEN;
             }
             else
@@ -546,6 +559,7 @@ static void vpmu_cleanup(struct vcpu *v)
     vpmu_arch_destroy(v);
     xenpmu_data = vpmu->xenpmu_data;
     vpmu->xenpmu_data = NULL;
+    vpmu->xenpmu_hv_stacktrace = NULL;
 
     spin_unlock(&vpmu->vpmu_lock);
 
@@ -572,6 +586,7 @@ static int pvpmu_init(struct domain *d, xen_pmu_params_t *params)
     struct vpmu_struct *vpmu;
     struct page_info *page;
     uint64_t gfn = params->val;
+    void *vpmu_page;
 
     if ( (params->vcpu >= d->max_vcpus) || (d->vcpu[params->vcpu] == NULL) )
         return -EINVAL;
@@ -601,7 +616,8 @@ static int pvpmu_init(struct domain *d, xen_pmu_params_t *params)
         return -EEXIST;
     }
 
-    v->arch.vpmu.xenpmu_data = __map_domain_page_global(page);
+    vpmu_page = __map_domain_page_global(page);
+    v->arch.vpmu.xenpmu_data = vpmu_page;
     if ( !v->arch.vpmu.xenpmu_data )
     {
         spin_unlock(&vpmu->vpmu_lock);
@@ -609,8 +625,15 @@ static int pvpmu_init(struct domain *d, xen_pmu_params_t *params)
         return -ENOMEM;
     }
 
-    if ( vpmu_arch_initialise(v) )
-        put_vpmu(v);
+    if (params->version.maj > 0 || params->version.min >= 2)
+      v->arch.vpmu.xenpmu_hv_stacktrace =
+          (void *)((uint8_t *)vpmu_page + PAGE_SIZE -
+                   sizeof(struct xen_pmu_hv_stacktrace));
+    else
+     v->arch.vpmu.xenpmu_hv_stacktrace = NULL;
+
+    if (vpmu_arch_initialise(v))
+      put_vpmu(v);
 
     spin_unlock(&vpmu->vpmu_lock);
 
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index dae9b43dac..df28f80f0f 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -55,6 +55,7 @@ struct vpmu_struct {
     size_t context_size;
     size_t priv_context_size;
     struct xen_pmu_data *xenpmu_data;
+    struct xen_pmu_hv_stacktrace *xenpmu_hv_stacktrace; /* only set if client vpmu >= 0.2 */
     spinlock_t vpmu_lock;
 };
 
-- 
2.47.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FF6A3BE1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502221.773951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNi-00027f-N3; Mon, 27 Feb 2023 07:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502221.773951; Mon, 27 Feb 2023 07:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNi-000256-JI; Mon, 27 Feb 2023 07:57:10 +0000
Received: by outflank-mailman (input) for mailman id 502221;
 Mon, 27 Feb 2023 07:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWYNh-0000zt-RF
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:57:10 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55088ff7-b674-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 08:57:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id o15so19516482edr.13
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 23:57:07 -0800 (PST)
Received: from uni.router.wind (adsl-209.109.242.226.tellas.gr.
 [109.242.226.209]) by smtp.googlemail.com with ESMTPSA id
 b23-20020a50ccd7000000b0049ef70a2894sm2788272edj.38.2023.02.26.23.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 23:57:07 -0800 (PST)
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
X-Inumbo-ID: 55088ff7-b674-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfd+upXaSlLKmbg4zugpjT75X2tZR4wPNkKQmCXr5iI=;
        b=lYjSUSdLDHn6VAmtg9ODvuSTjLpwHlp0BYYmCBAS6F56mkwSGEvJ+ZOIB3DXdcvjRt
         LaqJZAmXmCqTg0FI/6+3sZ0uM7PWyd7cynyehETs9yQyBIM9lS/PfGM56/i3QIcHBAH6
         so0ufqMnkXIr7VQU96WM7ZA2oBr/qmeE6LjZNT3+HxNESd1sOUB4qB+JTUwVdJhfzUMn
         BBP8eATGk4hk29ZVfGu8aP7wVWWjnqxQcEfclWqZgxTKFuDoXfQ6QhPCKQIJQVuFq142
         UyIBFyIKRF4lAi+mpEZfuQZvmwMLigTairKZnaCy6VtgvrQcXBWvC2XflZ0FQMAhUzhP
         PK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfd+upXaSlLKmbg4zugpjT75X2tZR4wPNkKQmCXr5iI=;
        b=wTB3cpNguhxXwXEUJ9fWZFB1ViC+uORJ7K6GHlSzf352cioAGv1STyVVGXPspYIbvf
         Rs9jRIqIlGcrU9cXNbKzlSXl0QMwgPC6wkrFieBxckX3QXIdsr0wIUBmO0mfbLVZha8d
         MpnWLX3xCkjlxkubR0J60XcY+HAmw8dhbTVVwMp7wYPbFQYtwn34AOtWU3Apq9qmxY1M
         QYf31PDk1JdqMgxsL1PTlx0uBqnEF0Yz+Yr2bMACzKIpaQhMHJFP7bs4ZUDKyB2BcZk/
         S2OZq8Yx8srtpJgnJycIZmjZasmzRr7YWWbggo5z57i8dS0yPU4NxJW/Tj1HFQIHEH4U
         wcmA==
X-Gm-Message-State: AO0yUKUJx1igYSycycl/PwMW4txvZlGyKWL9i9gai6UkLU8WebBIrTH6
	n6i14ErGBzOLalKau0zzpkCZzDU74X1vWg==
X-Google-Smtp-Source: AK7set+XRzjKrDAJ1gyPWG0oFLRCggpXfNaFq0J9FhzdyGfvANCaUg7NBW/IBn9IwWPWIzT07gnO+A==
X-Received: by 2002:aa7:d705:0:b0:4ac:89b:b605 with SMTP id t5-20020aa7d705000000b004ac089bb605mr25859620edq.22.1677484627312;
        Sun, 26 Feb 2023 23:57:07 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 4/4] x86/hvm: create hvm_funcs for {svm,vmx}_{set,clear}_msr_intercept()
Date: Mon, 27 Feb 2023 09:56:52 +0200
Message-Id: <20230227075652.3782973-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230227075652.3782973-1-burzalodowa@gmail.com>
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hvm_funcs hooks for {set,clear}_msr_intercept() for controlling the msr
intercept in common vpmu code.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/vpmu_amd.c             | 10 ++++-----
 xen/arch/x86/cpu/vpmu_intel.c           | 24 ++++++++++-----------
 xen/arch/x86/hvm/svm/svm.c              |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c              |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      | 28 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h |  4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++--
 8 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index ed6706959e..a306297a69 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -165,9 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_clear_msr_intercept(v, counters[i], MSR_RW);
-        svm_set_msr_intercept(v, ctrls[i], MSR_W);
-        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
+        hvm_clear_msr_intercept(v, counters[i], MSR_RW);
+        hvm_set_msr_intercept(v, ctrls[i], MSR_W);
+        hvm_clear_msr_intercept(v, ctrls[i], MSR_R);
     }
 
     msr_bitmap_on(vpmu);
@@ -180,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_set_msr_intercept(v, counters[i], MSR_RW);
-        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
+        hvm_set_msr_intercept(v, counters[i], MSR_RW);
+        hvm_set_msr_intercept(v, ctrls[i], MSR_RW);
     }
 
     msr_bitmap_off(vpmu);
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index bd91c79a36..46ae38a326 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -230,22 +230,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
 
     /* Allow Read/Write PMU Counters MSR Directly. */
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
+        hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
+        hvm_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
+            hvm_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     /* Allow Read PMU Non-global Controls Directly. */
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
+        hvm_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
-    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
+    hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    hvm_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
@@ -253,21 +253,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
+        hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
+        hvm_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
+            hvm_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
+        hvm_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
-    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
+    hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    hvm_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static inline void __core2_vpmu_save(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index eb144272f4..e54dc08e8a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -288,7 +288,7 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
     return msr_bit;
 }
 
-void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
+void cf_check svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
 {
     unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
 
@@ -303,7 +303,7 @@ void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
         __set_bit(msr * 2 + 1, msr_bit);
 }
 
-void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
+void cf_check svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
 {
     unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 22c12509d5..3d0022f392 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -902,7 +902,7 @@ static void vmx_set_host_env(struct vcpu *v)
               (unsigned long)&get_cpu_info()->guest_cpu_user_regs.error_code);
 }
 
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type)
+void cf_check vmx_clear_msr_intercept(struct vcpu *v, uint32_t msr, int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
     struct domain *d = v->domain;
@@ -933,7 +933,7 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type)
         ASSERT(!"MSR out of range for interception\n");
 }
 
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type)
+void cf_check vmx_set_msr_intercept(struct vcpu *v, uint32_t msr, int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 87c47c002c..d3f2b3add4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2765,6 +2765,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+    .set_msr_intercept    = vmx_set_msr_intercept,
+    .clear_msr_intercept  = vmx_clear_msr_intercept,
     .enable_msr_interception = vmx_enable_msr_interception,
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f853e2f3e8..dd9aa42d0a 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -224,6 +224,8 @@ struct hvm_function_table {
                                 paddr_t *L1_gpa, unsigned int *page_order,
                                 uint8_t *p2m_acc, struct npfec npfec);
 
+    void (*set_msr_intercept)(struct vcpu *v, uint32_t msr, int flags);
+    void (*clear_msr_intercept)(struct vcpu *v, uint32_t msr, int flags);
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
 
     /* Alternate p2m */
@@ -658,6 +660,20 @@ static inline int nhvm_hap_walk_L1_p2m(
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
+static inline void hvm_set_msr_intercept(struct vcpu *v, uint32_t msr,
+                                         int flags)
+{
+    if ( hvm_funcs.set_msr_intercept )
+        alternative_vcall(hvm_funcs.set_msr_intercept, v, msr, flags);
+}
+
+static inline void hvm_clear_msr_intercept(struct vcpu *v, uint32_t msr,
+                                           int flags)
+{
+    if ( hvm_funcs.clear_msr_intercept )
+        alternative_vcall(hvm_funcs.clear_msr_intercept, v, msr, flags);
+}
+
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
@@ -916,6 +932,18 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline void hvm_set_msr_intercept(struct vcpu *v, uint32_t msr,
+                                         int flags)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void hvm_clear_msr_intercept(struct vcpu *v, uint32_t msr,
+                                           int flags)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index ed2e55e5cf..dbe8ba89cc 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -585,8 +585,8 @@ void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
 
-void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
-void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
+void cf_check svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
+void cf_check svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
 #define svm_disable_intercept_for_msr(v, msr) \
     svm_clear_msr_intercept((v), (msr), MSR_RW)
 #define svm_enable_intercept_for_msr(v, msr) \
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index e08c506be5..f2880c8122 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -644,8 +644,8 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type);
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type);
+void cf_check vmx_clear_msr_intercept(struct vcpu *v, uint32_t msr, int type);
+void cf_check vmx_set_msr_intercept(struct vcpu *v, uint32_t msr, int type);
 void vmx_vmcs_switch(paddr_t from, paddr_t to);
 void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector);
 void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-- 
2.37.2



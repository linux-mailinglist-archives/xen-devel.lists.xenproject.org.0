Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9479B16E9B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065151.1430513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaB-0000nv-5Y; Thu, 31 Jul 2025 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065151.1430513; Thu, 31 Jul 2025 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaB-0000mF-1m; Thu, 31 Jul 2025 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1065151;
 Thu, 31 Jul 2025 09:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPa8-0000Jb-Hz
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc1625c-6df0-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:28:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-455f7cc9362so894745e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:10 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:09 -0700 (PDT)
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
X-Inumbo-ID: acc1625c-6df0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954090; x=1754558890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSeD66VYY/7lq9b03uVb3nrDcwpq4lY3KXbmJLU83qc=;
        b=a+G1jc9GkMa6bLFx2hkQQMLHck0kTKTFj5+TN2kX4hPxdGj+uJ7SjSy5Gsp7tojQpx
         QwU8dtl3za/GnBUTwuSVxSAV6Y7S5pRMZ7RbeVfXsWbvkoZ9roU0jrxQsIy7IS0HlhyS
         fHoDc21iNChzU/6L+Tl/bz7m7aXKQduHM3C5YcmNKScUPT0RDMvsPGV7+gXTIsVghwIL
         tXCAzSQrq/XIYiJ1YTTQ2qdoo/8UdJzSgV8a6hg3aYw/v+jFgtxhj5ipKPCRCm+/AMuo
         1L5zbWUfSHTMkPnbBOANVSydpJX6Fh+SQMhupWpqKl56ytgzuOI0FJVIYEPOPAspLXNp
         v1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954090; x=1754558890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSeD66VYY/7lq9b03uVb3nrDcwpq4lY3KXbmJLU83qc=;
        b=O9m8B1g1b3I37meALw0YOQTv6HwGU29g6dE3OwmPs2jzY+TlmU4azyrMcFfe0kwP6h
         HVzq2fGucWLwPc9AAiUG/FVYe7+Rtr5VDORAJiXZqLLyX5hszdLBJ5Z628Omke7Vqv+V
         1THVPbZaYCHWDlaNkwMeURKIf8gPBDBBTCQgUCHM0gHavFOqTnR7eq91799zzftoh278
         1y9394vDVMCEQi0JBBhO9sDrKuBq6LzcZWzsTcwNg71nQt+k3T5bVo+GsSq9OmMfMA1J
         HXtUONyDEIG4gB+MVFHKfGwkSgXlQUuDrl/G4MJ+s1nd3v0SucaxJ6cfwZ53zyhTUOpZ
         6tUQ==
X-Gm-Message-State: AOJu0YwbE2uvxE+rfc9pd7htETEz0f84h/jYP83shDEU+qsjNj93W6Ro
	tQh1nOUKTxcZ96BkOn9NFHMKIXw4i0BYq66YEk5VVdptTBDeMnhSMymUDQm54EWb
X-Gm-Gg: ASbGncs2gMRciNRlNIE6Gk9iiSsFfjWPAkfOifY/6StJr6yTncqC6CCYSryHZU7e06+
	wYDoSHmsS44Ef4ixyGAb0fU0JF6EtJXrQT/qXnjKxH0feXo4Z8Ooz2HiQnNQRoYzy6U0nd4C57I
	4UiDVQnMVjE/HAFokWhwRR9xtlyxuqQPkzNxAJik26IbE0gJ3Z3ugd9jUzwiGj6f+RVRleMgvTj
	GWnEd3V/embyS6Vy2OoHMFF77QSae83EE4IVgfDxx1o46x7YB7XwBGW/Ty9wV/tdAoGnMCdKKSi
	D4ovr5mIPyFOnr/dp9CoEt0fHyZDDQNnYQZ6b7MAQYb18nwKx3Yhv2iKc18DkcIQ76g4hsjja1o
	I5jt8+nsKIjMDT8fup/P7UKzobhszkY2mQHicFfBSc9k1klWuguKRJscaMmre418mt2J9SNGoZ6
	uduO7xoi1g+GpYS0AO+yN4GQ==
X-Google-Smtp-Source: AGHT+IHEDAoM9LSTKD8g+d923r70X+1obien4WkirgBSal8//wNez3rXpRXzPMAk+Zm8LQ/gKmkWVA==
X-Received: by 2002:a05:600c:3e15:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4589e8745e9mr8944495e9.6.1753954089628;
        Thu, 31 Jul 2025 02:28:09 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v12 2/6] x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
Date: Thu, 31 Jul 2025 09:27:57 +0000
Message-Id: <2fc138bf8f1100b6347b965e16691b9d6e3272fe.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This change consistently guards all altp2m-related functionality
behind #ifdef CONFIG_ALTP2M, so that code and data structures related
to alternate p2m views are only included when the feature is enabled.

Apart from that:
- hvmemul_vmfunc() returns X86EMUL_UNHANDLEABLE when altp2m is disabled.
- do_altp2m_op() returns EOPNOTSUPP when altp2m is disabled.
- struct hvm_vcpu, arch_domain, and hvm_function_table only define altp2m
  fields when the feature is enabled.
- Moved several declarations under #ifdef CONFIG_ALTP2M in p2m.h to avoid
  polluting builds that don't require the feature.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/hvm/emulate.c          |  4 ++++
 xen/arch/x86/hvm/hvm.c              | 10 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c          |  8 ++++++++
 xen/arch/x86/include/asm/domain.h   |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h  |  6 ++++++
 xen/arch/x86/include/asm/hvm/vcpu.h |  4 ++++
 xen/arch/x86/include/asm/p2m.h      | 31 +++++++++++++++++++----------
 xen/arch/x86/mm/hap/hap.c           |  6 ++++++
 xen/arch/x86/mm/mem_access.c        |  8 ++++++++
 xen/arch/x86/mm/p2m-ept.c           |  4 ++++
 xen/arch/x86/mm/p2m.c               |  9 +++++++++
 xen/arch/x86/vm_event.c             |  2 +-
 12 files changed, 82 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f1412d8c49..2af4f30359 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2704,6 +2704,7 @@ static int cf_check hvmemul_tlb_op(
 static int cf_check hvmemul_vmfunc(
     struct x86_emulate_ctxt *ctxt)
 {
+#ifdef CONFIG_ALTP2M
     int rc;
 
     if ( !hvm_funcs.altp2m_vcpu_emulate_vmfunc )
@@ -2713,6 +2714,9 @@ static int cf_check hvmemul_vmfunc(
         x86_emul_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC, ctxt);
 
     return rc;
+#else
+    return X86EMUL_UNHANDLEABLE;
+#endif
 }
 
 static const struct x86_emulate_ops hvm_emulate_ops = {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 56c7de3977..1881c8ac52 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4608,6 +4608,7 @@ static int hvmop_get_param(
 static int do_altp2m_op(
     XEN_GUEST_HANDLE_PARAM(void) arg)
 {
+#ifdef CONFIG_ALTP2M
     struct xen_hvm_altp2m_op a;
     struct domain *d = NULL;
     int rc = 0;
@@ -4944,6 +4945,9 @@ static int do_altp2m_op(
     rcu_unlock_domain(d);
 
     return rc;
+#else /* !CONFIG_ALTP2M */
+    return -EOPNOTSUPP;
+#endif /* CONFIG_ALTP2M */
 }
 
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
@@ -5235,8 +5239,12 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
     case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
         v->arch.hvm.single_step = false;
+
+#ifdef CONFIG_ALTP2M
         v->arch.hvm.fast_single_step.enabled = false;
         v->arch.hvm.fast_single_step.p2midx = 0;
+#endif
+
         break;
 
     default: /* Excluded above */
@@ -5259,6 +5267,7 @@ void hvm_toggle_singlestep(struct vcpu *v)
     v->arch.hvm.single_step = !v->arch.hvm.single_step;
 }
 
+#ifdef CONFIG_ALTP2M
 void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
 {
     ASSERT(atomic_read(&v->pause_count));
@@ -5273,6 +5282,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
     v->arch.hvm.fast_single_step.enabled = true;
     v->arch.hvm.fast_single_step.p2midx = p2midx;
 }
+#endif
 
 /*
  * Segment caches in VMCB/VMCS are inconsistent about which bits are checked,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ce538668c7..64f0dbbd4a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2416,6 +2416,8 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
 
+#ifdef CONFIG_ALTP2M
+
 static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
 {
     struct domain *d = v->domain;
@@ -2535,6 +2537,8 @@ static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
     return rc;
 }
 
+#endif /* CONFIG_ALTP2M */
+
 static bool cf_check vmx_get_pending_event(
     struct vcpu *v, struct x86_event *info)
 {
@@ -2863,10 +2867,12 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
     .enable_msr_interception = vmx_enable_msr_interception,
+#ifdef CONFIG_ALTP2M
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+#endif
     .vmtrace_control = vmtrace_control,
     .vmtrace_output_position = vmtrace_output_position,
     .vmtrace_set_option = vmtrace_set_option,
@@ -4963,6 +4969,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
             single = ept;
         }
 
+#ifdef CONFIG_ALTP2M
         if ( altp2m_active(currd) )
         {
             unsigned int i;
@@ -4981,6 +4988,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
                 }
             }
         }
+#endif
 
         if ( inv )
             __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8c0dea12a5..8749c5eba0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -351,12 +351,14 @@ struct arch_domain
     struct p2m_domain *nested_p2m[MAX_NESTEDP2M];
     mm_lock_t nested_p2m_lock;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
     struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
+#endif
 #endif
 
     /* NB. protected by d->event_lock and by irq_desc[irq].lock */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index bf8bc2e100..e94cfbfb58 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -225,11 +225,13 @@ struct hvm_function_table {
 
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
 
+#ifdef CONFIG_ALTP2M
     /* Alternate p2m */
     void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
     void (*altp2m_vcpu_update_vmfunc_ve)(struct vcpu *v);
     bool (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
+#endif
 
     /* vmtrace */
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
@@ -707,6 +709,7 @@ static inline bool hvm_nested_virt_supported(void)
     return hvm_funcs.caps.nested_virt;
 }
 
+#ifdef CONFIG_ALTP2M
 /* updates the current hardware p2m */
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
 {
@@ -731,6 +734,9 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
     }
     return false;
 }
+#else /* !CONFIG_ALTP2M */
+bool altp2m_vcpu_emulate_ve(struct vcpu *v);
+#endif /* CONFIG_ALTP2M */
 
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 196fed6d5d..924af890c5 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -133,10 +133,12 @@ struct hvm_vcpu {
     bool                flag_dr_dirty;
     bool                debug_state_latch;
     bool                single_step;
+#ifdef CONFIG_ALTP2M
     struct {
         bool     enabled;
         uint16_t p2midx;
     } fast_single_step;
+#endif
 
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
@@ -154,7 +156,9 @@ struct hvm_vcpu {
 
     struct nestedvcpu   nvcpu;
 
+#ifdef CONFIG_ALTP2M
     struct altp2mvcpu   avcpu;
+#endif
 
     struct mtrr_state   mtrr;
     u64                 pat_cr;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index c53f4e487d..5ce0dc936f 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -889,6 +889,8 @@ void shadow_p2m_init(struct p2m_domain *p2m);
 void cf_check nestedp2m_write_p2m_entry_post(
     struct p2m_domain *p2m, unsigned int oflags);
 
+#ifdef CONFIG_ALTP2M
+
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
@@ -932,11 +934,6 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
 /* Flush all the alternate p2m's for a domain */
 void p2m_flush_altp2m(struct domain *d);
 
-/* Alternate p2m paging */
-bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
-                                 mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int *page_order);
-
 /* Make a specific alternate p2m valid */
 int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);
 
@@ -954,17 +951,29 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
 int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
                           gfn_t old_gfn, gfn_t new_gfn);
 
-/* Propagate a host p2m change to all alternate p2m's */
-int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
-                                mfn_t mfn, unsigned int page_order,
-                                p2m_type_t p2mt, p2m_access_t p2ma);
-
 /* Set a specific p2m view visibility */
 int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
 
-#else /* !CONFIG_HVM */
+#else /* !CONFIG_ALTP2M */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
+bool p2m_set_altp2m(struct vcpu *v, unsigned int idx);
+#endif /* CONFIG_ALTP2M */
+
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+/* Alternate p2m paging */
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int *page_order);
+                                 
+/* Propagate a host p2m change to all alternate p2m's */
+int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
+                                mfn_t mfn, unsigned int page_order,
+                                p2m_type_t p2mt, p2m_access_t p2ma);
 #endif /* CONFIG_HVM */
 
 /* p2m access to IOMMU flags */
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ec5043a8aa..384c24028f 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -494,6 +494,7 @@ int hap_enable(struct domain *d, u32 mode)
            goto out;
     }
 
+#ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
     {
         /* Init alternate p2m data */
@@ -524,6 +525,7 @@ int hap_enable(struct domain *d, u32 mode)
 
         d->arch.altp2m_active = false;
     }
+#endif /* CONFIG_ALTP2M */
 
     /* Now let other users see the new mode */
     d->arch.paging.mode = mode | PG_HAP_enable;
@@ -537,9 +539,11 @@ void hap_final_teardown(struct domain *d)
 {
     unsigned int i;
 
+#ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
         for ( i = 0; i < MAX_ALTP2M; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
+#endif
 
     /* Destroy nestedp2m's first */
     for (i = 0; i < MAX_NESTEDP2M; i++) {
@@ -578,6 +582,7 @@ void hap_teardown(struct domain *d, bool *preempted)
     for_each_vcpu ( d, v )
         hap_vcpu_teardown(v);
 
+#ifdef CONFIG_ALTP2M
     /* Leave the root pt in case we get further attempts to modify the p2m. */
     if ( hvm_altp2m_supported() )
     {
@@ -597,6 +602,7 @@ void hap_teardown(struct domain *d, bool *preempted)
                 return;
         }
     }
+#endif
 
     /* Destroy nestedp2m's after altp2m. */
     for ( i = 0; i < MAX_NESTEDP2M; i++ )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 21b5b7ecda..0779c41161 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -347,6 +347,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     unsigned long gfn_l;
     long rc = 0;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
@@ -357,6 +358,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
 
         ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
+#endif
 
     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
         return -EINVAL;
@@ -403,6 +405,7 @@ long p2m_set_mem_access_multi(struct domain *d,
     struct p2m_domain *p2m = p2m_get_hostp2m(d), *ap2m = NULL;
     long rc = 0;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
@@ -413,6 +416,7 @@ long p2m_set_mem_access_multi(struct domain *d,
 
         ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
+#endif
 
     p2m_lock(p2m);
     if ( ap2m )
@@ -462,6 +466,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
+#ifdef CONFIG_ALTP2M
     if ( !altp2m_active(d) )
     {
         if ( altp2m_idx )
@@ -476,6 +481,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
 
         p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
+#endif
 
     return _p2m_get_mem_access(p2m, gfn, access);
 }
@@ -486,6 +492,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
 
     p2m_get_hostp2m(d)->access_required = access_required;
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(d) )
     {
         unsigned int i;
@@ -497,6 +504,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
                 p2m->access_required = access_required;
         }
     }
+#endif
 }
 
 bool p2m_mem_access_sanity_check(const struct domain *d)
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 62fc8e5068..ae262bfcc2 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1297,6 +1297,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
 
     hostp2m->ept.ad = value;
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -1315,6 +1316,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
             p2m_unlock(p2m);
         }
     }
+#endif
 }
 
 static void ept_enable_pml(struct p2m_domain *p2m)
@@ -1571,6 +1573,7 @@ void __init setup_ept_dump(void)
     register_keyhandler('D', ept_dump_p2m_table, "dump VT-x EPT tables", 0);
 }
 
+#ifdef CONFIG_ALTP2M
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
     struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
@@ -1610,6 +1613,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
     altp2m_list_unlock(d);
     return i;
 }
+#endif /* CONFIG_ALTP2M */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b9a7c2dc53..5a3fda903e 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -101,6 +101,7 @@ void p2m_change_entry_type_global(struct domain *d,
 
     change_entry_type_global(hostp2m, ot, nt);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -117,6 +118,7 @@ void p2m_change_entry_type_global(struct domain *d,
             }
         }
     }
+#endif
 
     p2m_unlock(hostp2m);
 }
@@ -145,6 +147,7 @@ bool p2m_memory_type_changed(struct domain *d)
 
     _memory_type_changed(hostp2m);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -161,6 +164,7 @@ bool p2m_memory_type_changed(struct domain *d)
             }
         }
     }
+#endif
 
     p2m_unlock(hostp2m);
 
@@ -930,6 +934,7 @@ void p2m_change_type_range(struct domain *d,
 
     change_type_range(hostp2m, start, end, ot, nt);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -946,6 +951,8 @@ void p2m_change_type_range(struct domain *d,
             }
         }
     }
+#endif
+
     hostp2m->defer_nested_flush = false;
     if ( nestedhvm_enabled(d) )
         p2m_flush_nestedp2m(d);
@@ -1003,6 +1010,7 @@ int p2m_finish_type_change(struct domain *d,
     if ( rc < 0 )
         goto out;
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -1022,6 +1030,7 @@ int p2m_finish_type_change(struct domain *d,
             }
         }
     }
+#endif
 
  out:
     p2m_unlock(hostp2m);
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 0d15d363c3..fc349270b9 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -72,7 +72,7 @@ void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
 
     if ( rsp->flags & VM_EVENT_FLAG_TOGGLE_SINGLESTEP )
         hvm_toggle_singlestep(v);
-    else
+    else if ( IS_ENABLED(CONFIG_ALTP2M) )
         hvm_fast_singlestep(v, rsp->u.fast_singlestep.p2midx);
 }
 
-- 
2.34.1



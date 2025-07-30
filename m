Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9263B15E5D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063728.1429466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DA-0008OK-JF; Wed, 30 Jul 2025 10:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063728.1429466; Wed, 30 Jul 2025 10:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DA-0008Me-EJ; Wed, 30 Jul 2025 10:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1063728;
 Wed, 30 Jul 2025 10:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4D9-0007vS-6U
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ea21d0-6d31-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:39:01 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af240271376so73440766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:39:01 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:38:59 -0700 (PDT)
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
X-Inumbo-ID: 67ea21d0-6d31-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871940; x=1754476740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioDaCChKtLWr9K4px+ID0VBnInJgvmwLcCt2K4+hRi0=;
        b=elRYXYLU88/YJgZdoRtStbTVjB56EnYrAPdkCf5hlDlYCIP5H9aVwssDC9GKBDZ8aV
         MuWOgWVSdVlcCL8P21Cs9H+0FFQV74TfiDcTkKaM4f3W7JpkErCN238eM1+ytPXaGI8n
         ZCWk8Zunau7UlvMp2aW1S78EC0iICdS9zWZcM4nSx6oexLWoiu9cMIFTcKL2v+NGHx6I
         YMOfcLyQHHdFNDsYkzNWk9D/5c4D4Rivy9wXTFWo60RRt/1sR2qvG56EAxqNxuefJx2g
         rHJlV2CwhLGwFoDKVv+y51pi5MRL2ncK9gzOZSrk5pYw622ZVNQuw3QMxtFDWUMqnXs2
         xE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871940; x=1754476740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioDaCChKtLWr9K4px+ID0VBnInJgvmwLcCt2K4+hRi0=;
        b=BlIxALSPM9eyyRayjCLHGY+0uh42/eDGaRHG4aukQxGD5MC4Kn/05SQlZIj+W/IKZ+
         EIeY+Inafyx0sjzEnFR+ivwsUwakcFwGXQdI+LdAtTSlkzRVllxoDrp1Mqd6hU4EwKFE
         0fpaecOxS9x9FAkqvT5Ajdr5VWIT5eMaH7EnqdKYzY2YFqBy2jOwArNCaYpG3wJSxnwB
         xgWKJHKel92v1yOdfdeYSIDo0mDFDakKXdhKBq1zbB09v1kE4dK7mHeZJ+Kz+bqLyEla
         462/UCVz8b6ahj/Be8oInIs4WRtCokKm2SX7jUtLCtpeo9r78uHQUXl9PNvbpAHYs04h
         FFVQ==
X-Gm-Message-State: AOJu0YwbRwBEHMXKOido5Zc04ghXUziVx+iU/1yzBdioPcjzvZRDP15k
	glKGMSmkoiUkUv4kiPXdih/sdcDlzE7wFT87yDfdvZszjwmhmrigZPmEclnunyzYdrE=
X-Gm-Gg: ASbGncsU3+4D0aaARNqpLx3mqhmC89mj6gHhg16y4exhEzM8BNvCpXX58Geq/ti0j9E
	4xzH508U1uwGQ1TAttzjVVTFOPanPc3Dt3GdBMnbGcaVnR3xbFccfuXokNpMGvneV6DOK2phjHx
	7EEA6BHx6fw/O28TbyXvshkUOk9xb8JPdHctcCgsz8iFgCNjAua/U1p2BO7e2MQXGgIsSV7mrSG
	/wA9zPsN0MhupQMoWp0865ohBNluGWduCO5FpYuIPt0InL8XR6XhLg9d06PLI//JY2wPQoDcZEz
	4oWOtb2QFNS/QEgYts7Kqnc8ljDJnIqZQkM+cNbjGFq1htOBd/qzSD4HmVrVg16gHuOPQ7i4oQE
	04WRJrDEzVKALV+x3GkKG+SWnySAaYdcNGU69cwKgJBf3nO4R57ZHHJqjZlV9HB4YEyHyixS1hw
	YU4JARWJbtLeRlPa1VRtSs8g==
X-Google-Smtp-Source: AGHT+IEGDIV/rkWTD8Zow9nCzJ3dWaUDUWUqe8p6oEND37DTWRVBBE5t3LHKQDaD05w8ueXvC6VJ/A==
X-Received: by 2002:a17:907:9691:b0:af6:32b3:2674 with SMTP id a640c23a62f3a-af8fd2f97aamr140400966b.0.1753871940140;
        Wed, 30 Jul 2025 03:39:00 -0700 (PDT)
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
Subject: [PATCH v11 2/6] x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
Date: Wed, 30 Jul 2025 10:38:46 +0000
Message-Id: <c1a105db2bd22d89443e9b16cccb086b4b8674ef.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753871755.git.w1benny@gmail.com>
References: <cover.1753871755.git.w1benny@gmail.com>
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
 xen/arch/x86/include/asm/p2m.h      | 12 ++++++++++++
 xen/arch/x86/mm/hap/hap.c           |  6 ++++++
 xen/arch/x86/mm/mem_access.c        |  8 ++++++++
 xen/arch/x86/mm/p2m-ept.c           |  4 ++++
 xen/arch/x86/mm/p2m.c               |  9 +++++++++
 xen/arch/x86/vm_event.c             |  2 +-
 12 files changed, 74 insertions(+), 1 deletion(-)

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
index c53f4e487d..6ead4891a4 100644
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
@@ -965,6 +967,16 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
 
 #else /* !CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
+bool p2m_set_altp2m(struct vcpu *v, unsigned int idx);
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int *page_order);
+int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
+                                mfn_t mfn, unsigned int page_order,
+                                p2m_type_t p2mt, p2m_access_t p2ma);
+
+#endif /* CONFIG_ALTP2M */
+
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



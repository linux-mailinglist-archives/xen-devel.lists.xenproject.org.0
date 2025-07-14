Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC19B04B02
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043179.1413326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyu-000583-7v; Mon, 14 Jul 2025 22:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043179.1413326; Mon, 14 Jul 2025 22:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyu-00055b-46; Mon, 14 Jul 2025 22:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1043179;
 Mon, 14 Jul 2025 22:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRys-00047A-No
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:06 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beaff253-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:05 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4eb4dfd8eso721779f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:05 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:03 -0700 (PDT)
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
X-Inumbo-ID: beaff253-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533345; x=1753138145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGMPeQfE6BdXdbIBfumLa4Wdomd7Xq00xQ0dyh4Tdlg=;
        b=HF8CIoAlMiUn188KHVBbY437GXOL3ch+3GHmXqZvsYy36gHm7QcfHIxS8QITcNvRPG
         gePU1MRoQwuVvbtLfS9+HGTicI/O5tgrj4a5ezunNlVr0qvUDx69jzMx5OIRiz5b3XGN
         6XU337Pnisxhp1vNmVW5uRxXNyAHEei9Yy6hSNY1aOYTDMXnfsO7UYwIUGPemFBZYhdJ
         HTlW55vkdQxRVFiOtfYmQRJf6CfSlRa/DLFNu0vUQS1hqirLgR30YZK3fDAFc3Cs09uI
         7oCRHiMPcdKjMoW1uEjVQO+C9nUNeTVG16o2id0azDX17F2mGuLfh5yEeLh46LSwuTxk
         WpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533345; x=1753138145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGMPeQfE6BdXdbIBfumLa4Wdomd7Xq00xQ0dyh4Tdlg=;
        b=gpA7fJY3XH56Lx9itKDIeABeC/KX/GrQYepOZSDUIqM4FmuO2Abc1TOop7QE1CdT45
         XfqVRE2i2WwC9xQZS3es2cJkNjfcfzggovh3/pUBJr0d1NZk+2A8xjkRlLKKw6B5Ugne
         ti/+y1M2+LhyYwK3rpm/95F1N7bzsbTPTe89BOH9/mI23n8goS4HmFC0qCD+W1eYefsl
         eukJ9JImygc5/E8eC3vzIoZudZ/Uz36FoWA6JrLpQfVd9nBhPKC9VNtL7zoB1ebMzv6v
         umlzGdboDjTDiWMRpRv0kkkSGGJwZeLv3q0BryXgpTw7T+PLRhjSGb+Kul0PqgqBPVgK
         xeEQ==
X-Gm-Message-State: AOJu0YwydZHAc6pM2l6qDSwq74KtQrEYLX1ZO6wwTSSWMx29L8g3VD6r
	xeTfOgbr8GgF1+XLQOkNrEjpry181QYDgWckx4CvvDy5Ky515yck23QA4HVK8w==
X-Gm-Gg: ASbGncuJDwtEgLq77y5tyGBzADk3O83InDRisYMcQICDtuyZtY2+hwkiVuLRS23XI2H
	xNz808hXtAsLXJbo+dGia179s8Ctrw+VqXpEiLKYvUMVGxMux3HarhqKaGgCyAJQlnuH6b0SN5H
	6ZOvDYui/hXWRKKXVT2DlF1sJA6OgRBJ0VQHVo6pkNC5lc5m1z8icUM70ROXm9u4EDgycAahLqT
	LnoAwcCf+lunQWBM9vwHfeYYApqCcQ5w5AAx66/koN9DDutYdRAugT+SIYi2jsCKHsTQ3PJjjT1
	U0otjqD5FE/2tnLcXs1yjVetgiiKAAzKi2RnH7VIcNPvSR9W7UY+16xMGOLkfXc6c7YoAZX1KaV
	nzkIlbshXxxcGmqj6lGgUCsMU+YnOX//CYdGkhIvUO19nZSk2CDjgUxrk3MjlVuOsFUDHDxZssX
	JSNnz+GCaQSW2TBAer5eFA4g==
X-Google-Smtp-Source: AGHT+IGhiaTjzKMRquDY+aHyzaSdmZF8dAn8rEcenDHke9C/yx8SXl1hx3qrt10uPl8fN97EtVCsOA==
X-Received: by 2002:a05:6000:24c7:b0:3a3:63d3:368e with SMTP id ffacd0b85a97d-3b5f17f2fdcmr4614550f8f.0.1752533344383;
        Mon, 14 Jul 2025 15:49:04 -0700 (PDT)
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v8 4/7] xen: Make the maximum number of altp2m views configurable for x86
Date: Mon, 14 Jul 2025 22:48:51 +0000
Message-Id: <6f6b6017ea1db89b8e07aaeb66550f3d117ef44c.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
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

Altp2m features are now guarded by #ifdef CONFIG_ALTP2M.

Accesses to the altp2m_p2m array are modified to respect the new nr_altp2m
value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
these arrays always have fixed size of MAX_EPTP.

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
 xen/arch/arm/domain.c               |  2 +-
 xen/arch/x86/domain.c               | 40 ++++++++++++---
 xen/arch/x86/hvm/hvm.c              | 20 +++++++-
 xen/arch/x86/hvm/monitor.c          |  2 +
 xen/arch/x86/hvm/vmx/vmx.c          | 12 ++++-
 xen/arch/x86/include/asm/altp2m.h   | 28 +++++++++--
 xen/arch/x86/include/asm/domain.h   | 11 +++--
 xen/arch/x86/include/asm/hvm/vcpu.h |  4 ++
 xen/arch/x86/include/asm/p2m.h      | 26 +++++++---
 xen/arch/x86/mm/altp2m.c            | 75 ++++++++++++++++-------------
 xen/arch/x86/mm/hap/hap.c           | 12 +++--
 xen/arch/x86/mm/mem_access.c        | 34 ++++++++-----
 xen/arch/x86/mm/mem_sharing.c       |  4 +-
 xen/arch/x86/mm/p2m-ept.c           | 15 ++++--
 xen/arch/x86/mm/p2m-pt.c            |  2 +
 xen/arch/x86/mm/p2m.c               | 17 +++++--
 xen/common/domain.c                 |  3 ++
 xen/include/public/domctl.h         |  5 +-
 xen/include/xen/sched.h             |  4 ++
 19 files changed, 232 insertions(+), 84 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..9a4f72c62b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -693,7 +693,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m.opts )
+    if ( config->altp2m.opts || config->altp2m.nr )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..155ea1f79f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -716,16 +716,42 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( altp2m_mode && nested_virt )
+    if ( altp2m_mode )
     {
-        dprintk(XENLOG_INFO,
-                "Nested virt and altp2m are not supported together\n");
-        return -EINVAL;
-    }
+        if ( !hvm_altp2m_supported() )
+        {
+            dprintk(XENLOG_INFO, "altp2m is not supported\n");
+            return -EINVAL;
+        }
+
+        if ( !hap )
+        {
+            dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
+            return -EINVAL;
+        }
+
+        if ( nested_virt )
+        {
+            dprintk(XENLOG_INFO,
+                    "Nested virt and altp2m are not supported together\n");
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
index 56c7de3977..78d65abe1f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1873,6 +1873,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
                               P2M_ALLOC | (npfec.write_access ? P2M_UNSHARE : 0),
                               &page_order);
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(currd) )
     {
         p2m = p2m_get_altp2m(curr);
@@ -1891,6 +1892,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
         }
     }
     else
+#endif
         p2m = hostp2m;
 
     /* Check access permissions first, then handle faults */
@@ -4608,6 +4610,7 @@ static int hvmop_get_param(
 static int do_altp2m_op(
     XEN_GUEST_HANDLE_PARAM(void) arg)
 {
+#ifdef CONFIG_ALTP2M
     struct xen_hvm_altp2m_op a;
     struct domain *d = NULL;
     int rc = 0;
@@ -4674,6 +4677,12 @@ static int do_altp2m_op(
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
 
@@ -4944,6 +4953,9 @@ static int do_altp2m_op(
     rcu_unlock_domain(d);
 
     return rc;
+#else /* !CONFIG_ALTP2M */
+    return -EOPNOTSUPP;
+#endif /* CONFIG_ALTP2M */
 }
 
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
@@ -5235,8 +5247,12 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
 
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
@@ -5261,17 +5277,19 @@ void hvm_toggle_singlestep(struct vcpu *v)
 
 void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
 {
+#ifdef CONFIG_ALTP2M
     ASSERT(atomic_read(&v->pause_count));
 
     if ( !hvm_is_singlestep_supported() )
         return;
 
-    if ( p2midx >= MAX_ALTP2M )
+    if ( p2midx >= v->domain->nr_altp2m )
         return;
 
     v->arch.hvm.single_step = true;
     v->arch.hvm.fast_single_step.enabled = true;
     v->arch.hvm.fast_single_step.p2midx = p2midx;
+#endif
 }
 
 /*
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 523586ca98..d22a2e4644 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -178,6 +178,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
         break;
 
     case HVM_MONITOR_SINGLESTEP_BREAKPOINT:
+#ifdef CONFIG_ALTP2M
         if ( curr->arch.hvm.fast_single_step.enabled )
         {
             p2m_altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
@@ -186,6 +187,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
             curr->arch.hvm.fast_single_step.p2midx = 0;
             return 0;
         }
+#endif
         if ( !ad->monitor.singlestep_enabled )
             return 0;
         req.reason = VM_EVENT_REASON_SINGLESTEP;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 218cb2c1af..4b8f0acbc1 100644
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
@@ -4225,6 +4231,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
     /* Now enable interrupts so it's safe to take locks. */
     local_irq_enable();
 
+#ifdef CONFIG_ALTP2M
     /*
      * If the guest has the ability to switch EPTP without an exit,
      * figure out whether it has done so and update the altp2m data.
@@ -4256,6 +4263,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         p2m_set_altp2m(v, idx);
     }
+#endif /* CONFIG_ALTP2M */
 
     if ( unlikely(currd->arch.monitor.vmexit_enabled) )
     {
@@ -4963,11 +4971,12 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
             single = ept;
         }
 
+#ifdef CONFIG_ALTP2M
         if ( altp2m_active(currd) )
         {
             unsigned int i;
 
-            for ( i = 0; i < MAX_ALTP2M; ++i )
+            for ( i = 0; i < currd->nr_altp2m; ++i )
             {
                 if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                     continue;
@@ -4981,6 +4990,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
                 }
             }
         }
+#endif
 
         if ( inv )
             __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index c57a8c5588..8ecd74f363 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -13,12 +13,32 @@
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
 #include <asm/hvm/vcpu.h>      /* for vcpu_altp2m */
 
+static inline bool altp2m_is_eptp_valid(const struct domain *d,
+                                        unsigned int idx)
+{
+    /* There must be enough EPTP entries to cover all altp2m indices */
+    BUILD_BUG_ON(MAX_EPTP < MAX_NR_ALTP2M);
+
+    /* Domain should not have more altp2m entries than MAX_NR_ALTP2M */
+    ASSERT(d->nr_altp2m <= MAX_NR_ALTP2M);
+
+    /* EPTP index is used as altp2m index */
+    return idx < d->nr_altp2m &&
+        d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
+        mfn_x(INVALID_MFN);
+}
+
 /* Alternate p2m HVM on/off per domain */
 static inline bool altp2m_active(const struct domain *d)
 {
     return d->arch.altp2m_active;
 }
 
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return vcpu_altp2m(v).p2midx;
+}
+
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
@@ -26,11 +46,13 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+#else
+
+static inline bool altp2m_is_eptp_valid(const struct domain *d,
+                                        unsigned int idx)
 {
-    return vcpu_altp2m(v).p2midx;
+    return false;
 }
-#else
 
 static inline bool altp2m_active(const struct domain *d)
 {
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8c0dea12a5..02a00e1c07 100644
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
@@ -351,12 +352,14 @@ struct arch_domain
     struct p2m_domain *nested_p2m[MAX_NESTEDP2M];
     mm_lock_t nested_p2m_lock;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
-    struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
+    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
+#endif
 #endif
 
     /* NB. protected by d->event_lock and by irq_desc[irq].lock */
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
index 4358cc15a2..262ddf8819 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -893,6 +893,8 @@ void cf_check nestedp2m_write_p2m_entry_post(
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
 
+#ifdef CONFIG_ALTP2M
+
 /* get current alternate p2m table */
 static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
 {
@@ -901,7 +903,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
     if ( index == INVALID_ALTP2M )
         return NULL;
 
-    BUG_ON(index >= MAX_ALTP2M);
+    BUG_ON(index >= v->domain->nr_altp2m);
 
     return v->domain->arch.altp2m_p2m[index];
 }
@@ -911,7 +913,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
 {
     struct p2m_domain *orig;
 
-    BUG_ON(idx >= MAX_ALTP2M);
+    BUG_ON(idx >= v->domain->nr_altp2m);
 
     if ( idx == vcpu_altp2m(v).p2midx )
         return false;
@@ -962,16 +964,24 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 /* Set a specific p2m view visibility */
 int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
-#else /* !CONFIG_HVM */
-struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
-#endif /* CONFIG_HVM */
 
-#ifdef CONFIG_ALTP2M
 /* Check to see if vcpu should be switched to a different p2m. */
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
-#else
+#else /* !CONFIG_ALTP2M */
+static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
+{
+    return NULL;
+}
+
+static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    return false;
+}
+
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
-#endif
+#endif /* CONFIG_ALTP2M */
+
+#endif /* CONFIG_HVM */
 
 /* p2m access to IOMMU flags */
 static inline unsigned int p2m_access_to_iommu_flags(p2m_access_t p2ma)
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 6fe1e9ed6b..dc6f310379 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -9,12 +9,16 @@
 #include <asm/altp2m.h>
 #include <public/hvm/hvm_op.h>
 #include <xen/event.h>
+#include <xen/xvmalloc.h>
 #include "mm-locks.h"
 #include "p2m.h"
 
 void
 altp2m_vcpu_initialise(struct vcpu *v)
 {
+    if ( v->domain->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);
 
@@ -32,6 +36,9 @@ altp2m_vcpu_destroy(struct vcpu *v)
 {
     struct p2m_domain *p2m;
 
+    if ( v->domain->nr_altp2m == 0 )
+        return;
+
     if ( v != current )
         vcpu_pause(v);
 
@@ -122,7 +129,12 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
     mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    d->arch.altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->arch.altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
@@ -143,7 +155,10 @@ void p2m_teardown_altp2m(struct domain *d)
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
@@ -151,6 +166,8 @@ void p2m_teardown_altp2m(struct domain *d)
         d->arch.altp2m_p2m[i] = NULL;
         p2m_free_one(p2m);
     }
+
+    XVFREE(d->arch.altp2m_p2m);
 }
 
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
@@ -200,7 +217,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
     struct domain *d = v->domain;
     bool rc = false;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     altp2m_list_lock(d);
@@ -306,8 +323,8 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
 {
     struct p2m_domain *p2m;
 
-    ASSERT(idx < MAX_ALTP2M);
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ASSERT(idx < d->nr_altp2m);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(p2m);
 
@@ -332,7 +349,7 @@ void p2m_flush_altp2m(struct domain *d)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
@@ -348,9 +365,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     struct p2m_domain *hostp2m, *p2m;
     int rc;
 
-    ASSERT(idx < MAX_ALTP2M);
+    ASSERT(idx < d->nr_altp2m);
 
-    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
     hostp2m = p2m_get_hostp2m(d);
 
     p2m_lock(p2m);
@@ -388,7 +405,7 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     altp2m_list_lock(d);
@@ -415,7 +432,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
@@ -437,7 +454,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     struct p2m_domain *p2m;
     int rc = -EBUSY;
 
-    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
+    if ( !idx || idx >= d->nr_altp2m )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -450,7 +467,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
     {
-        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -475,7 +492,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     struct vcpu *v;
     int rc = -EINVAL;
 
-    if ( idx >= MAX_ALTP2M )
+    if ( idx >= d->nr_altp2m )
         return rc;
 
     rc = domain_pause_except_self(d);
@@ -510,13 +527,11 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     mfn_t mfn;
     int rc = -EINVAL;
 
-    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( !altp2m_is_eptp_valid(d, idx) )
         return rc;
 
     hp2m = p2m_get_hostp2m(d);
-    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
+    ap2m = d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
 
     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -572,7 +587,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         p2m_type_t t;
         p2m_access_t a;
@@ -595,7 +610,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                for ( i = 0; i < MAX_ALTP2M; i++ )
+                for ( i = 0; i < d->nr_altp2m; i++ )
                 {
                     if ( i == last_reset_idx ||
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
@@ -659,12 +674,11 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 
     if ( sve->view > 0 )
     {
-        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, sve->view) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
     }
 
     p2m_lock(host_p2m);
@@ -727,12 +741,11 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 
     if ( altp2m_idx > 0 )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = ap2m =
+            d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
     else
         p2m = host_p2m;
@@ -761,13 +774,7 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
 
     altp2m_list_lock(d);
 
-    /*
-     * Eptp index is correlated with altp2m index and should not exceed
-     * min(MAX_ALTP2M, MAX_EPTP).
-     */
-    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc = -EINVAL;
     else if ( visible )
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ec5043a8aa..4aec98109d 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -494,6 +494,7 @@ int hap_enable(struct domain *d, u32 mode)
            goto out;
     }
 
+#ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
     {
         /* Init alternate p2m data */
@@ -515,7 +516,7 @@ int hap_enable(struct domain *d, u32 mode)
             d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
         }
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             rv = p2m_alloc_table(d->arch.altp2m_p2m[i]);
             if ( rv != 0 )
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
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
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
@@ -590,13 +595,14 @@ void hap_teardown(struct domain *d, bool *preempted)
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
                 return;
         }
     }
+#endif
 
     /* Destroy nestedp2m's after altp2m. */
     for ( i = 0; i < MAX_NESTEDP2M; i++ )
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 21b5b7ecda..079c63cbf9 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -79,8 +79,11 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
     struct domain *d = v->domain;
     struct p2m_domain *p2m = NULL;
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(d) )
         p2m = p2m_get_altp2m(v);
+#endif
+
     if ( !p2m )
         p2m = p2m_get_hostp2m(d);
 
@@ -143,8 +146,11 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
     vm_event_request_t *req;
     int rc;
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(d) )
         p2m = p2m_get_altp2m(v);
+#endif
+
     if ( !p2m )
         p2m = p2m_get_hostp2m(d);
 
@@ -347,16 +353,16 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
     unsigned long gfn_l;
     long rc = 0;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
+#endif
 
     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
         return -EINVAL;
@@ -403,16 +409,16 @@ long p2m_set_mem_access_multi(struct domain *d,
     struct p2m_domain *p2m = p2m_get_hostp2m(d), *ap2m = NULL;
     long rc = 0;
 
+#ifdef CONFIG_ALTP2M
     /* altp2m view 0 is treated as the hostp2m */
     if ( altp2m_idx )
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        ap2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
+#endif
 
     p2m_lock(p2m);
     if ( ap2m )
@@ -462,6 +468,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
+#ifdef CONFIG_ALTP2M
     if ( !altp2m_active(d) )
     {
         if ( altp2m_idx )
@@ -469,13 +476,12 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     }
     else if ( altp2m_idx ) /* altp2m view 0 is treated as the hostp2m */
     {
-        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
-             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
-             mfn_x(INVALID_MFN) )
+        if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
 
-        p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
+        p2m = d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
+#endif
 
     return _p2m_get_mem_access(p2m, gfn, access);
 }
@@ -486,10 +492,11 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
 
     p2m_get_hostp2m(d)->access_required = access_required;
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(d) )
     {
         unsigned int i;
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
 
@@ -497,6 +504,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
                 p2m->access_required = access_required;
         }
     }
+#endif
 }
 
 bool p2m_mem_access_sanity_check(const struct domain *d)
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..4787b27964 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -901,6 +901,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
     if ( !page || is_special_page(page) )
         goto out;
 
+#ifdef CONFIG_ALTP2M
     /* Check if there are mem_access/remapped altp2m entries for this page */
     if ( altp2m_active(d) )
     {
@@ -912,7 +913,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         altp2m_list_lock(d);
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             ap2m = d->arch.altp2m_p2m[i];
             if ( !ap2m )
@@ -929,6 +930,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
         altp2m_list_unlock(d);
     }
+#endif /* CONFIG_ALTP2M */
 
     /* Try to convert the mfn to the sharable type */
     ret = page_make_sharable(d, page, expected_refcnt, validate_only);
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 0cf6818c13..06d46731a1 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -771,8 +771,10 @@ bool ept_handle_misconfig(uint64_t gpa)
     bool spurious;
     int rc;
 
+#ifdef CONFIG_ALTP2M
     if ( altp2m_active(curr->domain) )
         p2m = p2m_get_altp2m(curr);
+#endif
 
     p2m_lock(p2m);
 
@@ -994,12 +996,14 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
 
+#ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
         ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
         if ( !rc )
             rc = ret;
     }
+#endif
 
     return rc;
 }
@@ -1297,11 +1301,12 @@ static void ept_set_ad_sync(struct domain *d, bool value)
 
     hostp2m->ept.ad = value;
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             struct p2m_domain *p2m;
 
@@ -1315,6 +1320,7 @@ static void ept_set_ad_sync(struct domain *d, bool value)
             p2m_unlock(p2m);
         }
     }
+#endif
 }
 
 static void ept_enable_pml(struct p2m_domain *p2m)
@@ -1506,9 +1512,11 @@ void __init setup_ept_dump(void)
     register_keyhandler('D', ept_dump_p2m_table, "dump VT-x EPT tables", 0);
 }
 
+#ifdef CONFIG_ALTP2M
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
-    struct p2m_domain *p2m = array_access_nospec(d->arch.altp2m_p2m, i);
+    struct p2m_domain *p2m =
+        d->arch.altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
@@ -1527,7 +1535,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
 
     altp2m_list_lock(d);
 
-    for ( i = 0; i < MAX_ALTP2M; i++ )
+    for ( i = 0; i < d->nr_altp2m; i++ )
     {
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
@@ -1545,6 +1553,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
     altp2m_list_unlock(d);
     return i;
 }
+#endif /* CONFIG_ALTP2M */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 666abd46be..5a6ce2f8bc 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -519,12 +519,14 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
     struct p2m_domain *p2m = p2m_get_hostp2m(current->domain);
     int rc;
 
+#ifdef CONFIG_ALTP2M
     /*
      * Should altp2m ever be enabled for NPT / shadow use, this code
      * should be updated to make use of the active altp2m, like
      * ept_handle_misconfig().
      */
     ASSERT(!altp2m_active(current->domain));
+#endif
 
     p2m_lock(p2m);
     rc = do_recalc(p2m, PFN_DOWN(gpa));
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b9a7c2dc53..e802f2e4e6 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -101,11 +101,12 @@ void p2m_change_entry_type_global(struct domain *d,
 
     change_entry_type_global(hostp2m, ot, nt);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -117,6 +118,7 @@ void p2m_change_entry_type_global(struct domain *d,
             }
         }
     }
+#endif
 
     p2m_unlock(hostp2m);
 }
@@ -145,11 +147,12 @@ bool p2m_memory_type_changed(struct domain *d)
 
     _memory_type_changed(hostp2m);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -161,6 +164,7 @@ bool p2m_memory_type_changed(struct domain *d)
             }
         }
     }
+#endif
 
     p2m_unlock(hostp2m);
 
@@ -930,11 +934,12 @@ void p2m_change_type_range(struct domain *d,
 
     change_type_range(hostp2m, start, end, ot, nt);
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -946,6 +951,8 @@ void p2m_change_type_range(struct domain *d,
             }
         }
     }
+#endif
+
     hostp2m->defer_nested_flush = false;
     if ( nestedhvm_enabled(d) )
         p2m_flush_nestedp2m(d);
@@ -1003,11 +1010,12 @@ int p2m_finish_type_change(struct domain *d,
     if ( rc < 0 )
         goto out;
 
+#ifdef CONFIG_ALTP2M
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
 
-        for ( i = 0; i < MAX_ALTP2M; i++ )
+        for ( i = 0; i < d->nr_altp2m; i++ )
         {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
@@ -1022,6 +1030,7 @@ int p2m_finish_type_change(struct domain *d,
             }
         }
     }
+#endif
 
  out:
     p2m_unlock(hostp2m);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..9baa7dd0de 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -811,6 +811,9 @@ struct domain *domain_create(domid_t domid,
     if ( config )
     {
         d->options = config->flags;
+#ifdef CONFIG_ALTP2M
+        d->nr_altp2m = config->altp2m.nr;
+#endif
         d->vmtrace_size = config->vmtrace_size;
     }
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a69dd96084..573d34f239 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -116,7 +116,10 @@ struct xen_domctl_createdomain {
 /* Altp2m mode signaling uses bits [0, 1]. */
 #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
 #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-        uint32_t opts;
+        uint16_t opts;
+
+        /* Number of altp2ms to permit. */
+        uint16_t nr;
     } altp2m;
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..e46d10c0c3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -619,6 +619,10 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;
 
+#ifdef CONFIG_ALTP2M
+    unsigned int nr_altp2m;    /* Number of altp2m tables. */
+#endif
+
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */
 
 #ifdef CONFIG_ARGO
-- 
2.34.1



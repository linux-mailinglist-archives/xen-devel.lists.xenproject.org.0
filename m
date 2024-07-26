Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0693D62E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765538.1176241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvK-0004aF-5w; Fri, 26 Jul 2024 15:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765538.1176241; Fri, 26 Jul 2024 15:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvK-0004Va-1A; Fri, 26 Jul 2024 15:32:02 +0000
Received: by outflank-mailman (input) for mailman id 765538;
 Fri, 26 Jul 2024 15:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvH-00084T-Tp
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:00 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3110a368-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:57 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7035b2947a4so632328a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa94e7csm17499786d6.91.2024.07.26.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:54 -0700 (PDT)
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
X-Inumbo-ID: 3110a368-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007915; x=1722612715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm6SwbrLrL2F0whPBohLSi3P90SQDvaLyu2bafK8Eyw=;
        b=BxdtNThbjEeZ+BYrnpa+C4wJ45o2O88QfK5jzQS8jusOtrdih2MXa7o8v20rUeBDvp
         v0DPIVXY511ZBBu3VwVkJTQJZQSUWGOU7seNodwjREMvKVx8d9qQk1Sc4g4ZsFWxYKme
         f8lde/VZ+/KV9MM0Eii73ol92SfYg0Obx8QIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007915; x=1722612715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm6SwbrLrL2F0whPBohLSi3P90SQDvaLyu2bafK8Eyw=;
        b=AXq1+7KJHZ0MUyf9xctBNg7BHrmgjAz/CA0e447ccDLvPzOiaZkkCt30OyMn+EWrZc
         mOoEZVkTEU3ipGFtUVb99DaGKxHkyd4QlI41TzgTADb76ZrONV2K92dwH6ags39p9uM3
         LxaCf1zW0/Pu7B3+qwWYDpTDMNVvSao2fe5Ajrz9F5HVF4TmjiVnAsp0C6HQR0psiOJ6
         7+UMlcl9jZtT7563Xk+s94i/ZBIssRYTXnyx6Vge6bmxyD5iDtu0f9IYN/zmkvo2RdkN
         bUwUB0VH3YEkp9VFXQ3HK0qoT7q7xaEoHuwmOtSaHtihcjdjztdIEsZVK8zWEgSztNtF
         PRbw==
X-Gm-Message-State: AOJu0Yyt9Lu2HScz2OitSeZExlS0CSe6CA4tm+tiZ/3bhwgpFQBSL9sX
	vr1wGEYQ7QlIGvVjpnfB5taDIx/7oy67KZihdZS7xouDmU9DtMzIakX4PrUOdXUSJ3zmftzPrrG
	i
X-Google-Smtp-Source: AGHT+IHEhPUjKUQ4d5eJhvKBEzz6/++MROSwxGNSkIyqscU6O9baUOB7YZ72GYyoimg6xQnrkpiKKA==
X-Received: by 2002:a05:6830:61c6:b0:703:79c6:a9ba with SMTP id 46e09a7af769-7092e695159mr8230070a34.7.1722007914842;
        Fri, 26 Jul 2024 08:31:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 13/22] x86/hvm: use a per-pCPU monitor table in HAP mode
Date: Fri, 26 Jul 2024 17:21:57 +0200
Message-ID: <20240726152206.28411-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of allocating a monitor table for each vCPU when running in HVM HAP
mode, use a per-pCPU monitor table, which gets the per-domain slot updated on
guest context switch.

This limits the amount of memory used for HVM HAP monitor tables to the amount
of active pCPUs, rather than to the number of vCPUs.  It also simplifies vCPU
allocation and teardown, since the monitor table handling is removed from
there.

Note the switch to using a per-CPU monitor table is done regardless of whether
Address Space Isolation is enabled or not.  Partly for the memory usage
reduction, and also because it allows to simplify the VM tear down path by not
having to cleanup the per-vCPU monitor tables.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note the monitor table is not made static because uses outside of the file
where it's defined will be added by further patches.
---
 xen/arch/x86/hvm/hvm.c             | 60 ++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c         |  5 ++
 xen/arch/x86/hvm/vmx/vmcs.c        |  1 +
 xen/arch/x86/hvm/vmx/vmx.c         |  4 ++
 xen/arch/x86/include/asm/hap.h     |  1 -
 xen/arch/x86/include/asm/hvm/hvm.h |  8 ++++
 xen/arch/x86/mm.c                  |  8 ++++
 xen/arch/x86/mm/hap/hap.c          | 75 ------------------------------
 xen/arch/x86/mm/paging.c           |  4 +-
 9 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f5f..3f771bc65677 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -104,6 +104,54 @@ static const char __initconst warning_hvm_fep[] =
 static bool __initdata opt_altp2m_enabled;
 boolean_param("altp2m", opt_altp2m_enabled);
 
+DEFINE_PER_CPU(root_pgentry_t *, monitor_pgt);
+
+static int allocate_cpu_monitor_table(unsigned int cpu)
+{
+    root_pgentry_t *pgt = alloc_xenheap_page();
+
+    if ( !pgt )
+        return -ENOMEM;
+
+    clear_page(pgt);
+
+    init_xen_l4_slots(pgt, _mfn(virt_to_mfn(pgt)), INVALID_MFN, NULL,
+                      false, true, false);
+
+    ASSERT(!per_cpu(monitor_pgt, cpu));
+    per_cpu(monitor_pgt, cpu) = pgt;
+
+    return 0;
+}
+
+static void free_cpu_monitor_table(unsigned int cpu)
+{
+    root_pgentry_t *pgt = per_cpu(monitor_pgt, cpu);
+
+    if ( !pgt )
+        return;
+
+    per_cpu(monitor_pgt, cpu) = NULL;
+    free_xenheap_page(pgt);
+}
+
+void hvm_set_cpu_monitor_table(struct vcpu *v)
+{
+    root_pgentry_t *pgt = this_cpu(monitor_pgt);
+
+    ASSERT(pgt);
+
+    setup_perdomain_slot(v, pgt);
+
+    make_cr3(v, _mfn(virt_to_mfn(pgt)));
+}
+
+void hvm_clear_cpu_monitor_table(struct vcpu *v)
+{
+    /* Poison %cr3, it will be updated when the vCPU is scheduled. */
+    make_cr3(v, INVALID_MFN);
+}
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -113,6 +161,9 @@ static int cf_check cpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        rc = allocate_cpu_monitor_table(cpu);
+        if ( rc )
+            break;
         rc = alternative_call(hvm_funcs.cpu_up_prepare, cpu);
         break;
     case CPU_DYING:
@@ -121,6 +172,7 @@ static int cf_check cpu_callback(
     case CPU_UP_CANCELED:
     case CPU_DEAD:
         alternative_vcall(hvm_funcs.cpu_dead, cpu);
+        free_cpu_monitor_table(cpu);
         break;
     default:
         break;
@@ -154,6 +206,7 @@ static bool __init hap_supported(struct hvm_function_table *fns)
 static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns = NULL;
+    int rc;
 
     if ( cpu_has_vmx )
         fns = start_vmx();
@@ -205,6 +258,13 @@ static int __init cf_check hvm_enable(void)
 
     register_cpu_notifier(&cpu_nfb);
 
+    rc = allocate_cpu_monitor_table(0);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Error %d setting up HVM monitor page tables\n", rc);
+        return rc;
+    }
+
     return 0;
 }
 presmp_initcall(hvm_enable);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 988250dbc154..a3fc033c0100 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -902,6 +902,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     if ( unlikely((read_efer() & EFER_SVME) == 0) )
         return;
 
+    hvm_clear_cpu_monitor_table(v);
+
     if ( !v->arch.fully_eager_fpu )
         svm_fpu_leave(v);
 
@@ -957,6 +959,8 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
         ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
         amd_set_legacy_ssbd(true);
     }
+
+    hvm_set_cpu_monitor_table(v);
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -990,6 +994,7 @@ static void noreturn cf_check svm_do_resume(void)
         hvm_migrate_pirqs(v);
         /* Migrating to another ASID domain.  Request a new ASID. */
         hvm_asid_flush_vcpu(v);
+        hvm_update_host_cr3(v);
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 9b6dc51f36ab..5d67c8157825 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1957,6 +1957,7 @@ void cf_check vmx_do_resume(void)
         v->arch.hvm.vmx.hostenv_migrated = 1;
 
         hvm_asid_flush_vcpu(v);
+        hvm_update_host_cr3(v);
     }
 
     debug_state = v->domain->debugger_attached
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cbe91c679807..5863c57b2d4a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1153,6 +1153,8 @@ static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
     if ( unlikely(!this_cpu(vmxon)) )
         return;
 
+    hvm_clear_cpu_monitor_table(v);
+
     if ( !v->is_running )
     {
         /*
@@ -1182,6 +1184,8 @@ static void cf_check vmx_ctxt_switch_to(struct vcpu *v)
 
     if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_TO )
         vmx_pi_switch_to(v);
+
+    hvm_set_cpu_monitor_table(v);
 }
 
 
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index f01ce73fb4f3..ae6760bc2bf5 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -24,7 +24,6 @@ int   hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 int   hap_enable(struct domain *d, u32 mode);
 void  hap_final_teardown(struct domain *d);
-void  hap_vcpu_teardown(struct vcpu *v);
 void  hap_teardown(struct domain *d, bool *preempted);
 void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 1c01e22c8e62..6d9a1ae04feb 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -550,6 +550,14 @@ static inline void hvm_invlpg(struct vcpu *v, unsigned long linear)
                        (1U << X86_EXC_AC) | \
                        (1U << X86_EXC_MC))
 
+/*
+ * Setup the per-domain slots of the per-cpu monitor table and update the vCPU
+ * cr3 to use it.
+ */
+DECLARE_PER_CPU(root_pgentry_t *, monitor_pgt);
+void hvm_set_cpu_monitor_table(struct vcpu *v);
+void hvm_clear_cpu_monitor_table(struct vcpu *v);
+
 /* Called in boot/resume paths.  Must cope with no HVM support. */
 static inline int hvm_cpu_up(void)
 {
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 35e929057d21..7f2666adaef4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6367,6 +6367,14 @@ void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt)
     l4e_write(&root_pgt[root_table_offset(PERDOMAIN_VIRT_START)],
               l4e_from_page(v->domain->arch.perdomain_l3_pg,
                             __PAGE_HYPERVISOR_RW));
+
+    if ( !is_pv_64bit_vcpu(v) )
+        /*
+         * HVM guests always have the compatibility L4 per-domain area because
+         * bitness is not know, and can change at runtime.
+         */
+        l4e_write(&root_pgt[root_table_offset(PERDOMAIN_ALT_VIRT_START)],
+                  root_pgt[root_table_offset(PERDOMAIN_VIRT_START)]);
 }
 
 static void __init __maybe_unused build_assertions(void)
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index c8514ca0e917..3279aafcd7d8 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -387,46 +387,6 @@ int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
     return 0;
 }
 
-static mfn_t hap_make_monitor_table(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-    struct page_info *pg;
-    l4_pgentry_t *l4e;
-    mfn_t m4mfn;
-
-    ASSERT(pagetable_get_pfn(v->arch.hvm.monitor_table) == 0);
-
-    if ( (pg = hap_alloc(d)) == NULL )
-        goto oom;
-
-    m4mfn = page_to_mfn(pg);
-    l4e = map_domain_page(m4mfn);
-
-    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
-                      false, true, false);
-    unmap_domain_page(l4e);
-
-    return m4mfn;
-
- oom:
-    if ( !d->is_dying &&
-         (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
-    {
-        printk(XENLOG_G_ERR "%pd: out of memory building monitor pagetable\n",
-               d);
-        domain_crash(d);
-    }
-    return INVALID_MFN;
-}
-
-static void hap_destroy_monitor_table(struct vcpu* v, mfn_t mmfn)
-{
-    struct domain *d = v->domain;
-
-    /* Put the memory back in the pool */
-    hap_free(d, mmfn);
-}
-
 /************************************************/
 /*          HAP DOMAIN LEVEL FUNCTIONS          */
 /************************************************/
@@ -548,25 +508,6 @@ void hap_final_teardown(struct domain *d)
     }
 }
 
-void hap_vcpu_teardown(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-    mfn_t mfn;
-
-    paging_lock(d);
-
-    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
-        goto out;
-
-    mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
-    if ( mfn_x(mfn) )
-        hap_destroy_monitor_table(v, mfn);
-    v->arch.hvm.monitor_table = pagetable_null();
-
- out:
-    paging_unlock(d);
-}
-
 void hap_teardown(struct domain *d, bool *preempted)
 {
     struct vcpu *v;
@@ -575,10 +516,6 @@ void hap_teardown(struct domain *d, bool *preempted)
     ASSERT(d->is_dying);
     ASSERT(d != current->domain);
 
-    /* TODO - Remove when the teardown path is better structured. */
-    for_each_vcpu ( d, v )
-        hap_vcpu_teardown(v);
-
     /* Leave the root pt in case we get further attempts to modify the p2m. */
     if ( hvm_altp2m_supported() )
     {
@@ -782,21 +719,9 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
 
     v->arch.paging.mode = hap_paging_get_mode(v);
 
-    if ( pagetable_is_null(v->arch.hvm.monitor_table) )
-    {
-        mfn_t mmfn = hap_make_monitor_table(v);
-
-        if ( mfn_eq(mmfn, INVALID_MFN) )
-            goto unlock;
-        v->arch.hvm.monitor_table = pagetable_from_mfn(mmfn);
-        make_cr3(v, mmfn);
-        hvm_update_host_cr3(v);
-    }
-
     /* CR3 is effectively updated by a mode change. Flush ASIDs, etc. */
     hap_update_cr3(v, false);
 
- unlock:
     paging_unlock(d);
     put_gfn(d, cr3_gfn);
 }
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index bca320fffabf..8ba105b5cb0c 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -794,9 +794,7 @@ long do_paging_domctl_cont(
 
 void paging_vcpu_teardown(struct vcpu *v)
 {
-    if ( hap_enabled(v->domain) )
-        hap_vcpu_teardown(v);
-    else
+    if ( !hap_enabled(v->domain) )
         shadow_vcpu_teardown(v);
 }
 
-- 
2.45.2



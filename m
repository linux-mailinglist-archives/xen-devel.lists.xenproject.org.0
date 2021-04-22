Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D703682A5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115464.220312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaZi-0003Hs-Hp; Thu, 22 Apr 2021 14:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115464.220312; Thu, 22 Apr 2021 14:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaZi-0003HQ-C4; Thu, 22 Apr 2021 14:45:02 +0000
Received: by outflank-mailman (input) for mailman id 115464;
 Thu, 22 Apr 2021 14:45:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaZh-0003Gy-1Q
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:45:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e593b11-5b2c-4bc5-a34e-d21a9a229790;
 Thu, 22 Apr 2021 14:44:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C482AEC6;
 Thu, 22 Apr 2021 14:44:59 +0000 (UTC)
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
X-Inumbo-ID: 0e593b11-5b2c-4bc5-a34e-d21a9a229790
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ruxsuA3j7K0oTuxQf62nTzbV9rQVNflxNyw+J58l9k=;
	b=De0JFItAh1GKFcSs4EuD/iOOaLQqmaMnkfKA8T5SWN2R6wQ3MVIvrN+puw6y8zCOtUTKBv
	IOA+5veSaZokCXXxQBsBARtXm/Rsb29+LvDSSrXDRK8d3MJ/ysCS+ZAWcg/rMG85n8Oehs
	VO8g9qH5HgopHADpdSHSBVX3I4pHCpc=
Subject: [PATCH v3 03/22] x86/xstate: re-size save area when CPUID policy
 changes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
Date: Thu, 22 Apr 2021 16:44:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

vCPU-s get maximum size areas allocated initially. Hidden (and in
particular default-off) features may allow for a smaller size area to
suffice.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use 1ul instead of 1ull. Re-base.
---
This could be further shrunk if we used XSAVEC / if we really used
XSAVES, as then we don't need to also cover the holes. But since we
currently use neither of the two in reality, this would require more
work than just adding the alternative size calculation here.

Seeing that both vcpu_init_fpu() and cpuid_policy_updated() get called
from arch_vcpu_create(), I'm not sure we really need this two-stage
approach - the slightly longer period of time during which
v->arch.xsave_area would remain NULL doesn't look all that problematic.
But since xstate_alloc_save_area() gets called for idle vCPU-s, it has
to stay anyway in some form, so the extra code churn may not be worth
it.

Instead of cpuid_policy_xcr0_max(), cpuid_policy_xstates() may be the
interface to use here. But it remains to be determined whether the
xcr0_accum field is meant to be inclusive of XSS (in which case it would
better be renamed) or exclusive. Right now there's no difference as we
don't support any XSS-controlled features.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -281,7 +281,21 @@ void update_guest_memory_policy(struct v
     }
 }
 
-void domain_cpu_policy_changed(struct domain *d)
+/*
+ * Called during vcpu construction, and each time the toolstack changes the
+ * CPUID configuration for the domain.
+ */
+static int __must_check cpuid_policy_updated(struct vcpu *v)
+{
+    int rc = xstate_update_save_area(v);
+
+    if ( !rc && is_hvm_vcpu(v) )
+        hvm_cpuid_policy_changed(v);
+
+    return rc;
+}
+
+int domain_cpu_policy_changed(struct domain *d)
 {
     const struct cpuid_policy *p = d->arch.cpuid;
     struct vcpu *v;
@@ -439,13 +453,18 @@ void domain_cpu_policy_changed(struct do
 
     for_each_vcpu ( d, v )
     {
-        cpuid_policy_updated(v);
+        int rc = cpuid_policy_updated(v);
+
+        if ( rc )
+            return rc;
 
         /* If PMU version is zero then the guest doesn't have VPMU */
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
              p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
+
+    return 0;
 }
 
 #ifndef CONFIG_BIGMEM
@@ -584,7 +603,7 @@ int arch_vcpu_create(struct vcpu *v)
     {
         vpmu_initialise(v);
 
-        cpuid_policy_updated(v);
+        rc = cpuid_policy_updated(v);
     }
 
     return rc;
@@ -859,11 +878,11 @@ int arch_domain_create(struct domain *d,
      */
     d->arch.x87_fip_width = cpu_has_fpu_sel ? 0 : 8;
 
-    domain_cpu_policy_changed(d);
-
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
-    return 0;
+    rc = domain_cpu_policy_changed(d);
+    if ( !rc )
+        return 0;
 
  fail:
     d->is_dying = DOMDYING_dead;
@@ -2471,16 +2490,6 @@ int domain_relinquish_resources(struct d
     return 0;
 }
 
-/*
- * Called during vcpu construction, and each time the toolstack changes the
- * CPUID configuration for the domain.
- */
-void cpuid_policy_updated(struct vcpu *v)
-{
-    if ( is_hvm_vcpu(v) )
-        hvm_cpuid_policy_changed(v);
-}
-
 void arch_dump_domain_info(struct domain *d)
 {
     paging_dump_domain_info(d);
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -89,7 +89,7 @@ static int update_domain_cpu_policy(stru
     recalculate_cpuid_policy(d);
 
     /* Recalculate relevant dom/vcpu state now the policy has changed. */
-    domain_cpu_policy_changed(d);
+    ret = domain_cpu_policy_changed(d);
 
  out:
     /* Free whichever cpuid/msr structs are not installed in struct domain. */
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -542,6 +542,41 @@ int xstate_alloc_save_area(struct vcpu *
     return 0;
 }
 
+int xstate_update_save_area(struct vcpu *v)
+{
+    unsigned int i, size, old;
+    struct xsave_struct *save_area;
+    uint64_t xcr0_max = cpuid_policy_xcr0_max(v->domain->arch.cpuid);
+
+    ASSERT(!is_idle_vcpu(v));
+
+    if ( !cpu_has_xsave )
+        return 0;
+
+    if ( v->arch.xcr0_accum & ~xcr0_max )
+        return -EBUSY;
+
+    for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
+    {
+        if ( xcr0_max & (1ul << i) )
+            size = max(size, xstate_offsets[i] + xstate_sizes[i]);
+        if ( v->arch.xcr0_accum & (1ul << i) )
+            old = max(old, xstate_offsets[i] + xstate_sizes[i]);
+    }
+
+    save_area = _xvrealloc(v->arch.xsave_area, size, __alignof(*save_area));
+    if ( !save_area )
+        return -ENOMEM;
+
+    ASSERT(old <= size);
+    memset((void *)save_area + old, 0, size - old);
+
+    v->arch.xsave_area = save_area;
+    v->arch.fpu_ctxt = &v->arch.xsave_area->fpu_sse;
+
+    return 0;
+}
+
 void xstate_free_save_area(struct vcpu *v)
 {
     XVFREE(v->arch.xsave_area);
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -78,8 +78,6 @@ void toggle_guest_mode(struct vcpu *);
 /* x86/64: toggle guest page tables between kernel and user modes. */
 void toggle_guest_pt(struct vcpu *);
 
-void cpuid_policy_updated(struct vcpu *v);
-
 /*
  * Initialise a hypercall-transfer page. The given pointer must be mapped
  * in Xen virtual address space (accesses are not validated or checked).
@@ -670,7 +668,7 @@ struct guest_memory_policy
 void update_guest_memory_policy(struct vcpu *v,
                                 struct guest_memory_policy *policy);
 
-void domain_cpu_policy_changed(struct domain *d);
+int __must_check domain_cpu_policy_changed(struct domain *d);
 
 bool update_runstate_area(struct vcpu *);
 bool update_secondary_system_time(struct vcpu *,
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -106,6 +106,7 @@ void compress_xsave_states(struct vcpu *
 /* extended state init and cleanup functions */
 void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
+int xstate_update_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
 unsigned int xstate_ctxt_size(u64 xcr0);
 


